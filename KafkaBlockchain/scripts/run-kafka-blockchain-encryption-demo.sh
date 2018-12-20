#!/bin/sh
# ****************************************************************************
# * runs the KafkaBlockchainEncryptionDemo program.
# ****************************************************************************

echo demonstrate putting encrypted messages into a Kafka blockchain named kafka-demo-blockchain
mvn "-Dexec.args=-classpath %classpath com.ai_blockchain.samples.KafkaBlockchainEncryptionDemo" -Dexec.executable=java -Dexec.classpathScope=runtime org.codehaus.mojo:exec-maven-plugin:1.5.0:exec

echo describing blockchain partitions for the Kafka group demo-encryption-blockchain-consumers
${HOME}/kafka_2.11-2.1.0/bin/kafka-consumer-groups.sh --bootstrap-server localhost:9092 --group demo-encryption-blockchain-consumers --describe

echo demonstrate verifying messages from the Kafka blockchain named kafka-demo-encryption-blockchain
mvn "-Dexec.args=-classpath %classpath com.ai_blockchain.samples.KafkaBlockchainDemoVerification kafka-demo-encryption-blockchain" -Dexec.executable=java -Dexec.classpathScope=runtime org.codehaus.mojo:exec-maven-plugin:1.5.0:exec

