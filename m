Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1382620FC
	for <linux-staging@lists.linux.dev>; Fri,  9 May 2025 22:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746828731; cv=none; b=ABrDJ+f5sztiLlgxmyRDuwGanhYjntMtLO3PCjH16sjmxErJWw0FufhIGFgaEG0udplc3U24ueL/67kEPKAxMoyGsX2OsK1J074g+TaBqyTw69GyopKNOjUYyDgx8UqamLrtZVcQf8REc5dTzddWrQa2SQk3r2xDO7qmSihQxcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746828731; c=relaxed/simple;
	bh=s3f/oPp6bTVPFcAHILxdTzz3+pGSJ8y93zZrUmyZvJ8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TDQc/IfvafT4RbcIZXINex6liEnN7bhXVXYZ3+WbJ1WnIv+GKNEuK7dMPW6iXszDshCn4BLrO49kAeRa5dLA2l0qENjWzG3xccEV4T97Jv3Ns3/OMtFzkFA1L+J5DQ6YSlgQofmue5jer3MqYh/TwWbKeGll85pLxi3Kfz6DkAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=bCXiWujK; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="bCXiWujK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1746828724; x=1747433524; i=wahrenst@gmx.net;
	bh=XmlVNcXegoCyFJPDK9bW+2Ad15Eh11zqjCkYaIEBhD4=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=bCXiWujKmhabhytbqFbITloCHFLI2GupO7JP6odMLcNVWNC5anXNUKvhVFDGbqNN
	 jgLxEH0GJaVL5QNUN0+iHgZQpus7hhj6lPPhK8JF+e/rYT5Bf0IabfS75grMq/l5e
	 bCmL4XGpzuu9ZrykKjQaJheZSRuW73HWLAJcOZpJBimu5W5M/S5yW7UhqLTobY+Bo
	 OsZ+A0TS87O+bXK1hwW3zPnJlvvS6jf2qZjbPyNthBnTOEd0kYZQ5AC1l4Ox7Bzx9
	 LldD+Un8s/8G/T3SpPUvZnCc0BZq66PHzHaG0VayFUjc5qQ1x55+F4NyTRSIrvzxf
	 c9sXWKa+wRvM28SAOg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([91.41.216.208]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MlNp7-1usZiw37i1-00ae9m; Sat, 10
 May 2025 00:12:03 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Phil Elwell <phil@raspberrypi.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com,
	kernel-list@raspberrypi.com,
	linux-staging@lists.linux.dev,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH RFC 1/2] staging: vchiq_arm: Improve inline documentation
Date: Sat, 10 May 2025 00:11:51 +0200
Message-Id: <20250509221152.13564-2-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250509221152.13564-1-wahrenst@gmx.net>
References: <20250509221152.13564-1-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:3xU0XTzTbxRJxZX7Nd931H5AvwgGk/EYUh0iZFx0SVAsx9spKNp
 bZDrPuWgzYT9TjlRn7BJoZxDsezuAvZZBSwBpqFyJXxu+KV6skXHR2fqihioPBg3CJ1/rMd
 e4PDaWdlb29GvT8cRF8wPFobXbOE9ZQCR3Rrhmnr8YylzoYqrB+sxeaE2T2jDBjJWUbf3vE
 oCPnwD3608UVWZIdVFZ4g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:VHQlkeJPC/4=;C0f78i6huBjJ8S/FlUuTffFyqzT
 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

From: Phil Elwell <phil@raspberrypi.com>

Add more comments to the VCHIQ driver, which provides some
high-level descriptions how things work.

Link: https://github.com/raspberrypi/linux/pull/6801
Signed-off-by: Phil Elwell <phil@raspberrypi.com>
[wahrenst@gmx.net: Rewrite commit log]
Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 .../interface/vchiq_arm/vchiq_arm.c           |  8 ++-
 .../interface/vchiq_arm/vchiq_core.h          | 56 ++++++++++++++++++-
 2 files changed, 60 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c=
 b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 5dbf8d53db09..40c540ead66b 100644
=2D-- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -73,7 +73,13 @@ static const struct vchiq_platform_info bcm2836_info =
=3D {
 };
=20
 struct vchiq_arm_state {
-	/* Keepalive-related data */
+	/*
+	 * Keepalive-related data
+	 *
+	 * The keepalive mechanism was retro-fitted to VCHIQ to allow active
+	 * services to prevent the system from suspending.
+	 * This feature is not used on Raspberry Pi devices.
+	 */
 	struct task_struct *ka_thread;
 	struct completion ka_evt;
 	atomic_t ka_use_count;
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.=
h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
index 3b5c0618e567..3dd95e5e6557 100644
=2D-- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
@@ -171,6 +171,21 @@ struct vchiq_slot_info {
 	short release_count;
 };
=20
+/*
+ * VCHIQ is a reliable connection-oriented datagram protocol.
+ *
+ * A VCHIQ service is equivalent to a TCP connection, except:
+ * + FOURCCs are used for the rendezvous, and port numbers are assigned a=
t the
+ *   time the connection is established.
+ * + There is less of a distinction between server and client sockets, th=
e only
+ *   difference being which end makes the first move.
+ * + For a multi-client server, the server creates new "listening" servic=
es as
+ *   the existing one becomes connected - there is no need to specify the
+ *   maximum number of clients up front.
+ * + Data transfer is reliable but packetized (messages have defined ends=
).
+ * + Messages can be either short (capable of fitting in a slot) and in-b=
and,
+ *   or copied between external buffers (bulk transfers).
+ */
 struct vchiq_service {
 	struct vchiq_service_base base;
 	unsigned int handle;
@@ -286,6 +301,23 @@ struct vchiq_shared_state {
 	int debug[DEBUG_MAX];
 };
=20
+/*
+ * vchiq_slot_zero describes the memory shared between the ARM host and t=
he
+ * VideoCore VPU. The "master" and "slave" states are owned by the respec=
tive
+ * sides but visible to the other; the slots are shared, and the remainin=
g
+ * fields are read-only.
+ *
+ * In the configuration used by this implementation, the memory is alloca=
ted
+ * by the host, the VPU is the master (the side which controls the DMA fo=
r bulk
+ * transfers), and the host is the slave.
+ *
+ * The ownership of slots changes with use:
+ * + When empty they are owned by the sender.
+ * + When partially filled they are shared with the receiver.
+ * + When completely full they are owned by the receiver.
+ * + When the receiver has finished processing the contents, they are rec=
ycled
+ *   back to the sender.
+ */
 struct vchiq_slot_zero {
 	int magic;
 	short version;
@@ -300,6 +332,10 @@ struct vchiq_slot_zero {
 	struct vchiq_slot_info slots[VCHIQ_MAX_SLOTS];
 };
=20
+/*
+ * This is the private runtime state used by each side. The same structur=
e was
+ * originally used by both sides, but implementations have since diverged=
.
+ */
 struct vchiq_state {
 	struct device *dev;
 	int id;
@@ -321,13 +357,27 @@ struct vchiq_state {
 	struct mutex mutex;
 	struct vchiq_instance **instance;
=20
-	/* Processes incoming messages */
+	/* Processes all incoming messages which aren't synchronous */
 	struct task_struct *slot_handler_thread;
=20
-	/* Processes recycled slots */
+	/*
+	 * Slots which have been fully processed and released by the (peer)
+	 * receiver are added to the receiver queue, which is asynchronously
+	 * processed by the recycle thread.
+	 */
 	struct task_struct *recycle_thread;
=20
-	/* Processes synchronous messages */
+	/*
+	 * Processes incoming synchronous messages
+	 *
+	 * The synchronous message channel is shared between all synchronous
+	 * services, and provides a way for urgent messages to bypass
+	 * potentially long queues of asynchronous messages in the normal slots.
+	 *
+	 * There can be only one outstanding synchronous message in
+	 * each direction, and as a precious shared resource synchronous
+	 * services should be used sparingly.
+	 */
 	struct task_struct *sync_thread;
=20
 	/* Local implementation of the trigger remote event */
=2D-=20
2.34.1

