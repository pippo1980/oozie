<?xml version="1.0" encoding="UTF-8"?>
<!--
 Licensed to the Apache Software Foundation (ASF) under one
 or more contributor license agreements.  See the NOTICE file
 distributed with this work for additional information
 regarding copyright ownership.  The ASF licenses this file
 to you under the Apache License, Version 2.0 (the
 "License"); you may not use this file except in compliance
 with the License.  You may obtain a copy of the License at
 
 http://www.apache.org/licenses/LICENSE-2.0
 
 Unless required by applicable law or agreed to in writing,
 software distributed under the License is distributed on an
 "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 KIND, either express or implied.  See the License for the
 specific language governing permissions and limitations
 under the License.   
-->
<persistence xmlns="http://java.sun.com/xml/ns/persistence"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    version="1.0">

    <!--
        We need to enumerate each persistent class first in the persistence.xml
        See: http://issues.apache.org/jira/browse/OPENJPA-78
    -->
    <persistence-unit name="none" transaction-type="RESOURCE_LOCAL">
        <!--
          <mapping-file>oozie/schema.xml</mapping-file>
        -->
    </persistence-unit>

    <!--
        A persistence unit is a set of listed persistent entities as well
        the configuration of an EntityManagerFactory. We configure each
        example in a separate persistence-unit.
    -->
    <persistence-unit name="oozie" transaction-type="RESOURCE_LOCAL">
        <!--
            The default provider can be OpenJPA, or some other product.
            This element is optional if OpenJPA is the only JPA provider
            in the current classloading environment, but can be specified
            in cases where there are multiple JPA implementations available.
        -->
        <!--
        <provider>
            org.apache.openjpa.persistence.PersistenceProviderImpl
        </provider>
        -->

        <!-- We must enumerate each entity in the persistence unit -->
        <class>org.apache.oozie.WorkflowActionBean</class>
        <class>org.apache.oozie.WorkflowJobBean</class>
        <class>org.apache.oozie.CoordinatorJobBean</class>
        <class>org.apache.oozie.CoordinatorActionBean</class>
        <class>org.apache.oozie.client.rest.JsonWorkflowJob</class>
        <class>org.apache.oozie.client.rest.JsonWorkflowAction</class>
        <class>org.apache.oozie.client.rest.JsonCoordinatorJob</class>
        <class>org.apache.oozie.client.rest.JsonCoordinatorAction</class>

        <properties>
            <!--
                We can configure the default OpenJPA properties here. They
                happen to be commented out here since the provided examples
                all specify the values via System properties.
            -->

            <!--property name="openjpa.ConnectionURL" 
                value="jdbc:mysql://localhost:3306/oozie"/-->
            <!--property name="openjpa.ConnectionDriverName" 
                value="com.mysql.jdbc.Driver"/-->
            <!--property name="openjpa.ConnectionUserName" 
                value="root"/>
            <property name="openjpa.ConnectionPassword" 
                value=""/-->
	            <!--
            <property name="openjpa.ConnectionURL" 
                value="jdbc:derby:openjpa-database;create=true"/>
            <property name="openjpa.ConnectionDriverName" 
                value="org.apache.derby.jdbc.EmbeddedDriver"/>
            <property name="openjpa.ConnectionUserName" 
                value="user"/>
            <property name="openjpa.ConnectionPassword" 
                value="secret"/>
            -->
            <property name="openjpa.ConnectionDriverName" value="org.apache.commons.dbcp.BasicDataSource"/>
            <property name="openjpa.ConnectionProperties" value="DriverClassName=com.mysql.jdbc.Driver,Url=jdbc:mysql://localhost:3306/oozie,Username=root,Password="/>
            <property name="openjpa.MetaDataFactory" value="jpa(Types=org.apache.oozie.WorkflowActionBean;
                org.apache.oozie.WorkflowJobBean;
                org.apache.oozie.CoordinatorJobBean;
                org.apache.oozie.CoordinatorActionBean;
                org.apache.oozie.client.rest.JsonWorkflowJob;
                org.apache.oozie.client.rest.JsonWorkflowAction;
                org.apache.oozie.client.rest.JsonCoordinatorJob;
                org.apache.oozie.client.rest.JsonCoordinatorAction)"></property>
       
            <property name="openjpa.jdbc.SynchronizeMappings" value="buildSchema(ForeignKeys=true)"/>
            <property name="openjpa.DetachState" value="fetch-groups(DetachedStateField=false)"/>
            <property name="openjpa.Multithreaded" value="true"/>
            <property name="openjpa.jdbc.Multithreaded" value="true"/>
            <property name="openjpa.jdbc.LockManager" value="pessimistic"/>
            <property name="openjpa.jdbc.ReadLockLevel" value="read"/>
            <property name="openjpa.jdbc.WriteLockLevel" value="write"/>
            <property name="openjpa.jdbc.TransactionIsolation" value="repeatable-read"/>
            <property name="openjpa.jdbc.DBDictionary" value="UseGetBytesForBlobs=true"/>
            <property name="openjpa.jdbc.DBDictionary" value="UseSetBytesForBlobs=true"/>
            <property name="openjpa.jdbc.DBDictionary" value="BlobBufferSize=500000"/>
            <property name="openjpa.ConnectionRetainMode" value="transaction" />
            <property name="openjpa.FlushBeforeQueries" value="false" />
            <property name="openjpa.Log" value="File=/tmp/trace.log, DefaultLevel=TRACE" />
            <!--  property name="openjpa.RuntimeUnenhancedClasses" value="supported"/>-->
        </properties>
    </persistence-unit>

</persistence>
