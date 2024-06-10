Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0445F47A40
	for <linux-staging@lists.linux.dev>; Mon, 10 Jun 2024 21:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718053380; cv=none; b=bxRpEcFLnfhebB9cTrB6PzbaXCG1tPBoYL5a7H1xfAA8taPt+kqd9xKZydWcdtX1oGk15rSsG1KMmJgBBKtRwUttlBK25OnVgbVlET/UERVHkM9LYMNlXaHPWrQpr3YpybV+frxthLSjnkPVFDYqsB08ap1aUhdQtYd+GTAeDn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718053380; c=relaxed/simple;
	bh=D9g0q75kaxED9MCxCd8C8I5WJb+3gMLX8jtCG0z438I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=G/wepQB9LtKhf2Z/nQp5l0caHZ7AYnU0eGUqRa0v44Ej2d2aUDv1kxZat1dIQ9ygsIRm6aSi66dmMdj64Wlt6Q03QnQN4VSnZWr34ZjL3raRUSWMfThyzW4vvt9EW5jWTXApthK3zou6QkJ1yXgkTp0RZkgB1u0A+OPHHvUpkLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=CaVxv85f; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="CaVxv85f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1718053363; x=1718658163; i=wahrenst@gmx.net;
	bh=T7//eBxmN7USTV8D4FLEnPWuKhDOM+u9egkPUDbGcOw=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=CaVxv85ftsGkhRCF9k/mcpI9dmaRAgZscydX3iu8UtRLBvRFCDxhPO9ez6P+QGZ9
	 VbaQewLMMl7dICrCl1qoMrwb+scxN0q35NT5Mtv7AhFEQMVQfXdjSPkO+oIqbY64S
	 c08KymBvVseOKCdFeYOjOtPcrDBmms7whal7mEuDTqia+Uou8/MBY+sGXoWFf672J
	 Nxu3rf4YMDQCynpuIAB6gXRN0UXegrmUzXN15wwxzLJaAB7/7U9RAcQSfmPF9iOSH
	 L8LRkcsw1GjNKWGccrtDBXeP30AwYDXu2Z6h77NyZ4LE93OTWADOl9MCmd3xSD5KT
	 zpnrP2C6S23RNROBqQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MowKi-1smF1J2xvK-00aSmu; Mon, 10
 Jun 2024 23:02:43 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Umang Jain <umang.jain@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH V2 07/10] staging: vchiq_arm: Reduce indentation of service_callback
Date: Mon, 10 Jun 2024 23:02:17 +0200
Message-Id: <20240610210220.95524-8-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240610210220.95524-1-wahrenst@gmx.net>
References: <20240610210220.95524-1-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:5IELyVZF69ncOBP23krFvMXQiE6plIS7FcZFkRWgKh+4YeTdtL3
 iRo1vSZ7eGsZtA+KmQbp3jJae4vm343cBSlFSEmH8kSpJ6jGHtW5y3Q/K8ID/chM5TCVt09
 6zEy9JvAbvw9xaaV3fh2mOfYdQCX5GyFLmq2Dw9dWXTlrFQvTGG+V+DOqQpzv0SpNhsL+GN
 XzKKNPfqDAxC2ci5TBqEA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:A0GmSEpGVqU=;axIg5ICDU53Oo3upXbI80fksFjy
 gz073sDaPETkIgGdd/1fQ550HtqDUXNpJJOddrxdMoHT9NhL2SaPolQBC5zI0vCFlz6WzDMoE
 7f33Z3uma6lXdLvz1TShblLRn4AByoDpFdk1hZTHPPMuT7Mxp+M4npLExHZ4CJYXojLYmflsP
 zEw78x+hEgNPc2p2gWx9Otid/WonX1Oxyeg3yFlxyoTMULJVk3QvI+0PyvNCrIU1/I5Y2fuot
 XoR8WWsuuCGzmNP8Fpdri7YokO+uQUpMye/zVb95vMzgMiPxvBZ7KvEspaSI99H20RIxBhTS3
 8qBmSC67kkwYa8EeuvUCHJ/+vTGXyB+Dvw0Q28Nx3oJmf/UamEKsE7KxTlUfuCowkI4XQT9gy
 H3xmvLj7rAZMDw/51JVpFv48k49R0HTN8/qwxbtA9epEfs/v9WwfhExKvbeDPokIPe/jkQiqb
 TDezeWqGtOJ86PjyXGEihSfe6ZrJeagHFv648W+jEMnOZun+WRrh8bPCfIFIxWcIunDL8ZgnN
 9ebDYZnsWIPidRoBCkD8/Z1kK85raZZekt0Njm7/9lTI/o7MdNKtucmf+Owri7Juzi1LZo2Ev
 oOOWZd2jUSlhWJ7ZgpfBGE6izUfooNmjN9/+nGbB2i9jkKTxEC+UIXo5zmxYkVMPBtq5C3sdC
 Xumyzg13ejQsayaHslcohgz6nem9hrX1z4ywxxXtlPssYqeHkCXFSPkrL6XqgdasR1ry7F71o
 ZwtE1w4/3gvHQkVu/nrJiQWrBEtDni6SDShDYELBiVC4N1m1InK4v18Fdb2zI4OPLZRff1aVE
 Gz+INu+dbU9qvv56kzCZ/WjAlhsa0F2s7i9tNJByW9a4Q=

The service_callback has 5 levels of indentation, which makes it
hard to read. Reduce this by splitting the code in a new function
service_single_message() as suggested by Laurent Pinchart.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 .../interface/vchiq_arm/vchiq_arm.c           | 68 +++++++++++--------
 1 file changed, 39 insertions(+), 29 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c=
 b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 0ba52c9d8bc3..706bfc7a0b90 100644
=2D-- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -1055,6 +1055,39 @@ add_completion(struct vchiq_instance *instance, enu=
m vchiq_reason reason,
 	return 0;
 }

+static int
+service_single_message(struct vchiq_instance *instance,
+		       enum vchiq_reason reason,
+		       struct vchiq_service *service, void *bulk_userdata)
+{
+	struct user_service *user_service;
+
+	user_service =3D (struct user_service *)service->base.userdata;
+
+	dev_dbg(service->state->dev, "arm: msg queue full\n");
+	/*
+	 * If there is no MESSAGE_AVAILABLE in the completion
+	 * queue, add one
+	 */
+	if ((user_service->message_available_pos -
+	     instance->completion_remove) < 0) {
+		dev_dbg(instance->state->dev,
+			"arm: Inserting extra MESSAGE_AVAILABLE\n");
+		return add_completion(instance, reason, NULL, user_service,
+				      bulk_userdata);
+	}
+
+	if (wait_for_completion_interruptible(&user_service->remove_event)) {
+		dev_dbg(instance->state->dev, "arm: interrupted\n");
+		return -EAGAIN;
+	} else if (instance->closing) {
+		dev_dbg(instance->state->dev, "arm: closing\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 int
 service_callback(struct vchiq_instance *instance, enum vchiq_reason reaso=
n,
 		 struct vchiq_header *header, unsigned int handle, void *bulk_userdata)
@@ -1104,41 +1137,18 @@ service_callback(struct vchiq_instance *instance, =
enum vchiq_reason reason,
 		spin_lock(&service->state->msg_queue_spinlock);
 		while (user_service->msg_insert =3D=3D
 			(user_service->msg_remove + MSG_QUEUE_SIZE)) {
+			int ret;
+
 			spin_unlock(&service->state->msg_queue_spinlock);
 			DEBUG_TRACE(SERVICE_CALLBACK_LINE);
 			DEBUG_COUNT(MSG_QUEUE_FULL_COUNT);
-			dev_dbg(service->state->dev, "arm: msg queue full\n");
-			/*
-			 * If there is no MESSAGE_AVAILABLE in the completion
-			 * queue, add one
-			 */
-			if ((user_service->message_available_pos -
-				instance->completion_remove) < 0) {
-				int ret;
-
-				dev_dbg(instance->state->dev,
-					"arm: Inserting extra MESSAGE_AVAILABLE\n");
-				DEBUG_TRACE(SERVICE_CALLBACK_LINE);
-				ret =3D add_completion(instance, reason, NULL, user_service,
-						     bulk_userdata);
-				if (ret) {
-					DEBUG_TRACE(SERVICE_CALLBACK_LINE);
-					vchiq_service_put(service);
-					return ret;
-				}
-			}

-			DEBUG_TRACE(SERVICE_CALLBACK_LINE);
-			if (wait_for_completion_interruptible(&user_service->remove_event)) {
-				dev_dbg(instance->state->dev, "arm: interrupted\n");
-				DEBUG_TRACE(SERVICE_CALLBACK_LINE);
-				vchiq_service_put(service);
-				return -EAGAIN;
-			} else if (instance->closing) {
-				dev_dbg(instance->state->dev, "arm: closing\n");
+			ret =3D service_single_message(instance, reason,
+						     service, bulk_userdata);
+			if (ret) {
 				DEBUG_TRACE(SERVICE_CALLBACK_LINE);
 				vchiq_service_put(service);
-				return -EINVAL;
+				return ret;
 			}
 			DEBUG_TRACE(SERVICE_CALLBACK_LINE);
 			spin_lock(&service->state->msg_queue_spinlock);
=2D-
2.34.1

