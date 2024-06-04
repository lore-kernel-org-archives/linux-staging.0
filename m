Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC10A149C4D
	for <linux-staging@lists.linux.dev>; Tue,  4 Jun 2024 17:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717522174; cv=none; b=H4WR7Cg/VpDbWcScGILTj53yEwY09EBWYPKBjqSojE6Hy6FVWfQd43VedLWnutqIfMSbC6Fv/OljeaD3FvlwhTdy8/otT4GFM9OhybRmpihG6tqZqqw1av6QkY/UlkyQ0CidQlu+8Jb1fJFQ0C2S4DCrGjBEARwDhIQcSI9PgLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717522174; c=relaxed/simple;
	bh=cdjk/XCudZhyV6eEW/Gr9bEO8PlVFF+61Ayc23UGf88=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VIqO4ISeW8gVEWv5Z6kfJIVtnorxom98yu7ZuPYPqNZOVpPiQl0N5rbmccyAL4w5oQcueen0drkhrRQv8MDjJDmvwoITwfn+SOko0s97u77vnloyu4PjNGXfgHKds6J0GizYuHwGfOUcPRU4FO+W9QaZyajMdM1I/fjRekVHzA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=ZnS87Cxv; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="ZnS87Cxv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1717522165; x=1718126965; i=wahrenst@gmx.net;
	bh=J8u0D/gqYRaWIAY1ZLOXtY9R4hmDlnmeyzUMbLiRoSg=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=ZnS87CxvJuTpD2oU8uudhKlVgfMl1DUEpWimVjpwkWbeq20JNdtkjQClBCKGQWhA
	 KL95hxQ4SH2N96H6exvZtDFkM4a4MGm+wyEnxs8WEIGvf6PqVh8hKIhb2oxQQwE+a
	 dgNIDHJ98mgNeSsOyx5IZ5cECeK1gux+3prlUEiO+Ymvt1ctsLBFCFiKWDD1Im92x
	 h9ce60x/lcJpPrUcXJRzwSmuTI2oeCZ2TdsKS7z+4gdSR3sDxeEMrre4KFPMWf3+p
	 2M59in3gfI7vT+uV6eS3lMfl+v4cVT3DUn4ORe3QlDWn86KjrxJbS/Lnjf7rogHPB
	 EhRE5nlPvn9OxfIGPQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N1fii-1scq563bA0-011BUz; Tue, 04
 Jun 2024 19:29:24 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Umang Jain <umang.jain@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH 07/11] staging: vchiq_arm: Reduce indentation of service_callback
Date: Tue,  4 Jun 2024 19:29:00 +0200
Message-Id: <20240604172904.61613-8-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240604172904.61613-1-wahrenst@gmx.net>
References: <20240604172904.61613-1-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:xh3wPN2mIO7wghK1lfDXv0h4oqXgfc66pt2IdguB11S/DgvPseL
 2eAJ8Zdefbow5cJ60vG/LeSMDAiI8JxytPcoTYgeZjwWHVMlm9lLWNp5+KCpvbhkCwvy7TZ
 q08B7nuF9ezypXro/yjIGsYXvU2jOqifBbadsQjVSskoUUmYt9Z6oKsYa39rmFlkMAz5fje
 GhDaUWfYeKsyAXCtqTaSQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:MfG+iriPnb0=;/GwZxITaXWjLak0kr22F4OTZdb+
 CJZL2zKwtv+qxR6CXEJ/XNveBOgWKz4zsctVLHRjml8QikVJDd+4Bw3QkI78u4zCu/Yljvw8s
 FOilxpBpoO2bcHtXziYaogSpibmBLY3+1Nek8OeGfjlL95u8mU3zH7aK/0cjxp039LSI+I946
 zLRuWg7jjjJM3qitGi5o2mWXfEIgTWj9DiUegdjRBs7fC+gDLYYCpfv+2KH/UuhacyMaixALA
 X7zmES3YuZ1Bv+Uka/fbNgN20ZwyhPJz49oOAuadeRzoapDwS1SXkiiSDwlqz4Ax3KaybbBm5
 fI3T7BUnjCTi2AY4s8z9w4tYydGNq8WBkSLKd4eIciR6pP6Qel19N2h9B8PbKfFwzQ5YzyKC7
 Zf6cIrQB8gen2iwEIBS3rouHj4fj7G9EVjnWP2QHs5BNHHZKmYtKBkZ0Th42RGPO2V3EhQYzK
 k3maSher2ix/IiE3336yLZtiZzXcjgj1obwkurkZ1/9FOnX/D41ACbyxTBRGnF0ocKJY0umz/
 Nzkjg1Ub+rETXpCZBvkozAPN+wEpwDiKqKpQMfpvfuAQ13p+MW0xHZAsuJOfeCjwXFd7DsRA8
 NRbiWkbGsiJs3r8yoSqTEYJmyJBTFar8XYmLeEyuTIv6Bq2WbIMzj8v9jDidqztgYpuAj4VOC
 iq7Y/VqhheA+ZSjC7Ds7pCd4q6jEEqF1E6yRe3oRaqPjlDWNhWfp3jpDNRKhG6+dMKdKH7qbW
 E0+zXVVscpLseacKZK2eKnsMr8yjX2hJXcenNqviTlevDo8Q/lod0nd6oQFrE6h6LaXmRVnf1
 yfd2bEKEopUM2ZYezvN6mKZP6V1sxDfOhNR82Q6vTYMPs=

The service_callback has 5 levels of indentation, which makes it
hard to read. Reduce this by using a goto for the corner cases
(no header or VCHI service).

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 .../interface/vchiq_arm/vchiq_arm.c           | 111 +++++++++---------
 1 file changed, 57 insertions(+), 54 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c=
 b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 45acca670bbd..0055c7d7e617 100644
=2D-- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -1101,71 +1101,74 @@ service_callback(struct vchiq_instance *instance, =
enum vchiq_reason reason,
 		user_service, service->localport, user_service->userdata,
 		reason, header, instance, bulk_userdata);

-	if (header && user_service->is_vchi) {
-		spin_lock(&service->state->msg_queue_spinlock);
-		while (user_service->msg_insert =3D=3D
-			(user_service->msg_remove + MSG_QUEUE_SIZE)) {
-			spin_unlock(&service->state->msg_queue_spinlock);
-			DEBUG_TRACE(SERVICE_CALLBACK_LINE);
-			DEBUG_COUNT(MSG_QUEUE_FULL_COUNT);
-			dev_dbg(service->state->dev, "arm: msg queue full\n");
-			/*
-			 * If there is no MESSAGE_AVAILABLE in the completion
-			 * queue, add one
-			 */
-			if ((user_service->message_available_pos -
-				instance->completion_remove) < 0) {
-				int status;
-
-				dev_dbg(instance->state->dev,
-					"arm: Inserting extra MESSAGE_AVAILABLE\n");
-				DEBUG_TRACE(SERVICE_CALLBACK_LINE);
-				status =3D add_completion(instance, reason, NULL, user_service,
-							bulk_userdata);
-				if (status) {
-					DEBUG_TRACE(SERVICE_CALLBACK_LINE);
-					vchiq_service_put(service);
-					return status;
-				}
-			}
+	if (!header || !user_service->is_vchi)
+		goto service_put;
+
+	spin_lock(&service->state->msg_queue_spinlock);
+	while (user_service->msg_insert =3D=3D
+		(user_service->msg_remove + MSG_QUEUE_SIZE)) {
+		spin_unlock(&service->state->msg_queue_spinlock);
+		DEBUG_TRACE(SERVICE_CALLBACK_LINE);
+		DEBUG_COUNT(MSG_QUEUE_FULL_COUNT);
+		dev_dbg(service->state->dev, "arm: msg queue full\n");
+		/*
+		 * If there is no MESSAGE_AVAILABLE in the completion
+		 * queue, add one
+		 */
+		if ((user_service->message_available_pos -
+			instance->completion_remove) < 0) {
+			int status;

+			dev_dbg(instance->state->dev,
+				"arm: Inserting extra MESSAGE_AVAILABLE\n");
 			DEBUG_TRACE(SERVICE_CALLBACK_LINE);
-			if (wait_for_completion_interruptible(&user_service->remove_event)) {
-				dev_dbg(instance->state->dev, "arm: interrupted\n");
-				DEBUG_TRACE(SERVICE_CALLBACK_LINE);
-				vchiq_service_put(service);
-				return -EAGAIN;
-			} else if (instance->closing) {
-				dev_dbg(instance->state->dev, "arm: closing\n");
+			status =3D add_completion(instance, reason, NULL, user_service,
+						bulk_userdata);
+			if (status) {
 				DEBUG_TRACE(SERVICE_CALLBACK_LINE);
 				vchiq_service_put(service);
-				return -EINVAL;
+				return status;
 			}
-			DEBUG_TRACE(SERVICE_CALLBACK_LINE);
-			spin_lock(&service->state->msg_queue_spinlock);
 		}

-		user_service->msg_queue[user_service->msg_insert &
-			(MSG_QUEUE_SIZE - 1)] =3D header;
-		user_service->msg_insert++;
-
-		/*
-		 * If there is a thread waiting in DEQUEUE_MESSAGE, or if
-		 * there is a MESSAGE_AVAILABLE in the completion queue then
-		 * bypass the completion queue.
-		 */
-		if (((user_service->message_available_pos -
-			instance->completion_remove) >=3D 0) ||
-			user_service->dequeue_pending) {
-			user_service->dequeue_pending =3D 0;
-			skip_completion =3D true;
+		DEBUG_TRACE(SERVICE_CALLBACK_LINE);
+		if (wait_for_completion_interruptible(&user_service->remove_event)) {
+			dev_dbg(instance->state->dev, "arm: interrupted\n");
+			DEBUG_TRACE(SERVICE_CALLBACK_LINE);
+			vchiq_service_put(service);
+			return -EAGAIN;
+		} else if (instance->closing) {
+			dev_dbg(instance->state->dev, "arm: closing\n");
+			DEBUG_TRACE(SERVICE_CALLBACK_LINE);
+			vchiq_service_put(service);
+			return -EINVAL;
 		}
+		DEBUG_TRACE(SERVICE_CALLBACK_LINE);
+		spin_lock(&service->state->msg_queue_spinlock);
+	}

-		spin_unlock(&service->state->msg_queue_spinlock);
-		complete(&user_service->insert_event);
+	user_service->msg_queue[user_service->msg_insert &
+		(MSG_QUEUE_SIZE - 1)] =3D header;
+	user_service->msg_insert++;

-		header =3D NULL;
+	/*
+	 * If there is a thread waiting in DEQUEUE_MESSAGE, or if
+	 * there is a MESSAGE_AVAILABLE in the completion queue then
+	 * bypass the completion queue.
+	 */
+	if (((user_service->message_available_pos -
+		instance->completion_remove) >=3D 0) ||
+		user_service->dequeue_pending) {
+		user_service->dequeue_pending =3D 0;
+		skip_completion =3D true;
 	}
+
+	spin_unlock(&service->state->msg_queue_spinlock);
+	complete(&user_service->insert_event);
+
+	header =3D NULL;
+
+service_put:
 	DEBUG_TRACE(SERVICE_CALLBACK_LINE);
 	vchiq_service_put(service);

=2D-
2.34.1

