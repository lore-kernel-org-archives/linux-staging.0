Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F376155732
	for <linux-staging@lists.linux.dev>; Fri, 21 Jun 2024 13:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718976030; cv=none; b=fzSJkml9eLGoIs9jTZK02aEcbrk5HkeKoX7FRWBBcfGJ19P/Vc+PZ+LERYD2xqtU+ljh7iKjIwCgwzdSmMSH1FjiWdZFgxszL7NJn/PsY/SpZY2dDqPASnHxgfzA/nhqlfeoLRG7pYCckeCI3E8o7s10JPBtwlqIpz2KgpLptVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718976030; c=relaxed/simple;
	bh=fjVpEH+vFlo56/LTEEU3owI5b8LL+86JiJeGb9FtJj0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WIZFzWH6uUAASxSruBWXZdAJrF4cKeZwO734i1pL2HrBRT2y3KvmElIYSNdSuyc/U4cTDeEYeSK7boVAwYqHsih8J5o1EXQjc5m90YmnzmqoCbv4ozGTgdwKoBKHxG5oIQZKY9onjNChj0a5UMjbbDMXEnQqCe4km1Ihk+0KPrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=eYzh8RAA; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="eYzh8RAA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1718976017; x=1719580817; i=wahrenst@gmx.net;
	bh=s6Qd0JBwNqeO6s8Qewv27s50XwpHo8PayS9pYHQ6hRI=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=eYzh8RAACH9tym3MALu+lGlrQ45ddpM5BGO3inXvM9Mf4p548q9A5dzG3/HP+Bkx
	 wkvthWp2Z1zjGPIcRNUh90yDJ9vZGBrfHmmwG6g8nL2RJlsBL3Se8e1eepJ9iB5mK
	 ybslRcHV2hsWzn+XmI7sPIbivT71ChQcET9Gnba4BRdQsAdpD4jVCsau6CvV4bjTU
	 cwF3HplrfdSQ3eLA/2udT36HBB38VYDuoNfG/LYP3830hoVJaoxn+R3/ewdNm8eGA
	 N01AkSJxFYo7gD9KZuzHb+qrqWJo24Ttw6QdKC0It3qEr2njT4j+/dpIFSp5v41kc
	 OJThj3mg5pn6qXiiQQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MJmKh-1s4tgm1v1l-00LtW9; Fri, 21
 Jun 2024 15:20:17 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Umang Jain <umang.jain@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH V3 07/10] staging: vchiq_arm: Reduce indentation of service_callback
Date: Fri, 21 Jun 2024 15:19:55 +0200
Message-Id: <20240621131958.98208-8-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240621131958.98208-1-wahrenst@gmx.net>
References: <20240621131958.98208-1-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:M70WieD8RdT4wTe5a8IcnsIHrr1N5koPOebEp7xzUC1xpgRKw/c
 ZwAJiOrFF3RMc3w/JZ9+ing9xHaeOki3s8g5KlgryQnr9g2tEyfW+cP6Fz4J83cHBAtnUDy
 iHt5rDkoqk8L4kQku8+QQ6aOioNAOX6KkY99FA5mqdCUSDqb7YVLxM/pTc2mj7YtVZXFlEC
 XqDty6PH8jL1areO4Yi9g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:IPCd3hcT67Q=;Dmjt61wtU7tXNO7GXMPHDSKHySo
 oMw48qoKSKg/2yMxDzhcPEhc+7OEyjpq6YFHgKP8dUYE/vpbHy3kJY069pWFIZQOmaFJB1DNV
 4UNQvVaJdJcR8aBJCpmR90SzPhSZzNIy2+TDAl6UuSq9TCipXtmXfFbYsvAtaisLwAtmIblD8
 f/ib7Q2WuTOvO8OXyT4xhHWvr2qY9Hb+0rbF4LJXL098yvK1tsCqEnD44GpVix4228GaEPrtC
 sMiPFHkzFNiE47DmSej+kgRT6fHh7hU0XVyxnfMV+tGYLSGGzmpi7ye9aChu40jGbKVp+dEZ8
 y1sVmjzngK86on5TOmnT9W5ZPms4OGKp8nwTCwLYJBTZ90BytVrQwJJHSerbO2jf3na7woeAk
 9G8iHy83vsczSezkMUDGQEqBngOYDcAY8VOh0+xwSxkICiDlFzkA81o5TfgJv/A0mwEgIYqIB
 Bvonc/TGOk6ClCg91PvBf11gSEKGSdhnTxoKuCVDdn9KE9WLxpvaZWYjc2P1vHtEGx7NrBYw2
 NOuowC1RbS9i8Xa+OquZVTght57A0fqz9dosJ8Om/eJG6IL4u5xlAwDQtzt0Po/JaemWAxTJP
 D7w9c/GDAr0Qq93TvJ2unP/LERqjp0OdQjlUAa7wKQtgsDhx6MuIec3RDopQ86uDjvrlEH80r
 uh0x8sbTc9MOhwJvRqUutbex/+d6OxPuyPSmL6yDJPTp4fc2CFSKfCkIc1j5Scv2F8dgq8BjZ
 +qhp0ZJrC1eYeux4U+8CpI6zCbbPr0rt9meZcfXjnWAQB89wfQp32TjI24xDLdiVaO4nBtW2d
 5rAGEJ3pDiaDNV6EDJs+U1C5Yt+cl4THEm3mgCtcwGJXg=

The service_callback has 5 levels of indentation, which makes it
hard to read. Reduce this by splitting the code in a new function
service_single_message() as suggested by Laurent Pinchart.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 .../interface/vchiq_arm/vchiq_arm.c           | 72 +++++++++++--------
 1 file changed, 43 insertions(+), 29 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c=
 b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index cb37da7d8085..e3d49d4bdb1d 100644
=2D-- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -1055,6 +1055,43 @@ add_completion(struct vchiq_instance *instance, enu=
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
+		int ret;
+
+		dev_dbg(instance->state->dev,
+			"arm: Inserting extra MESSAGE_AVAILABLE\n");
+		ret =3D add_completion(instance, reason, NULL, user_service,
+				     bulk_userdata);
+		if (ret)
+			return ret;
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
@@ -1104,41 +1141,18 @@ service_callback(struct vchiq_instance *instance, =
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

