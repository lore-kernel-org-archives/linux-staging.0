Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 959B7125D7
	for <linux-staging@lists.linux.dev>; Wed, 25 Oct 2023 12:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marliere.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=marliere.net header.i=@marliere.net header.b="inmdc+0K"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1c9e072472bso40535145ad.2
        for <linux-staging@lists.linux.dev>; Wed, 25 Oct 2023 05:27:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698236850; x=1698841650;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:dkim-signature:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wG0ZUl3gifsade13W7t1FoQuB4FnC3hvjN14YAls8W8=;
        b=ME4Y3O39/NuLCEyU1MSwzwPK2hm7SUcPLHZYORqIBlv7Nr+VvSKB81x+ci+QZzgks4
         klhXfhlDQ/5Iugx7svrIoMSGf0U1npmkSm7funnpuNJvzZ/wGsr6aY24abkp1/y2NxZJ
         l5i6fHDmZRxoil91ZwSWjFRLPOQwpYb1m2Kga05mQ6UfepVgejjAtEW0byDx62hzOis3
         4eV8as9XkmY+D7onEv6A0RhffosjG/xqN70j5UCdhNEV5qfLRgkZDZP/Ml3XpdKHizrp
         Tc6xDuS3Qqnf6ySWzYbhQTECY8Imds/bmBPt3K9yXYrnQhubmO/RKH7fUqBUPODTBzBH
         MaTQ==
X-Gm-Message-State: AOJu0YwC33CSnoRsGEk2s4IeDBmiYI60GgakqDS3yNdpnjWbaRNP1fVa
	JKkzZXJVyP4lFhnJj2GQ2Ls=
X-Google-Smtp-Source: AGHT+IE9tQK1viHVcwtIECPzpdaqlTjg12DIHJKqddhEn0ApTz8dcZuBMoyynsaPPV5aSo8wTScCuw==
X-Received: by 2002:a17:903:3093:b0:1c3:749f:6a5d with SMTP id u19-20020a170903309300b001c3749f6a5dmr9969948plc.4.1698236849721;
        Wed, 25 Oct 2023 05:27:29 -0700 (PDT)
Received: from mail.marliere.net ([24.199.118.162])
        by smtp.gmail.com with ESMTPSA id w17-20020a1709029a9100b001b89466a5f4sm9019669plp.105.2023.10.25.05.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 05:27:29 -0700 (PDT)
From: "Ricardo B. Marliere" <ricardo@marliere.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
	s=2023; t=1698236845;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wG0ZUl3gifsade13W7t1FoQuB4FnC3hvjN14YAls8W8=;
	b=inmdc+0K5wrUGW0jTTWmP30k8xL5pojISO2gfCEDgPacAcdySlLksFrrXJCPmcgd2OHuKQ
	IDnTVbt+oh9o88OMujxbSlHMtaYwrYB8hV12qV102WqDh+cbqWjGicpXFrm6jJQQBe4LKL
	izey6X3Msy+iTvA0tgfH8EcBPQmfMdTl8Jr2b29Ey5JmAB6CSYI+TTevDA7ZoUyWqw+TpQ
	FeSV9P8eCm/u8DPp00K+MxI2ePz42gJp+N2SPXjcDomRGPRfcgX0wIjpoAy/tnoCqH3YHC
	UGN1zxCfnPBpzItU1QLYfgz1E1feylSyorF6MnMQirNBStQct9NhRkmIHqwwuw==
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=ricardo@marliere.net smtp.mailfrom=ricardo@marliere.net
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Stefan Wahren <stefan.wahren@i2se.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Arnd Bergmann <arnd@arndb.de>
Cc: bcm-kernel-feedback-list@broadcom.com,
	linux-staging@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	"Ricardo B. Marliere" <ricardo@marliere.net>,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH] staging: vc04_services: use snprintf instead of sprintf
Date: Wed, 25 Oct 2023 09:26:34 -0300
Message-ID: <20231025122632.307385-4-ricardo@marliere.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All the occurrences of sprintf usage under vc04_services can be safely
replaced by snprintf, so as to avoid any possible overflow.

Suggested-by: Dan Carpenter <dan.carpenter@linaro.org>
Suggested-by: Umang Jain <umang.jain@ideasonboard.com>
Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>
---
 .../bcm2835-camera/bcm2835-camera.c              |  2 +-
 .../interface/vchiq_arm/vchiq_arm.c              | 16 ++++++++--------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
index e860fb89d42e..e6e89784d84b 100644
--- a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
+++ b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
@@ -855,7 +855,7 @@ static int vidioc_enum_input(struct file *file, void *priv,
 		return -EINVAL;
 
 	inp->type = V4L2_INPUT_TYPE_CAMERA;
-	sprintf((char *)inp->name, "Camera %u", inp->index);
+	snprintf((char *)inp->name, sizeof(inp->name), "Camera %u", inp->index);
 	return 0;
 }
 
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index de6a24304a4d..9fb8f657cc78 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -1451,12 +1451,12 @@ vchiq_use_internal(struct vchiq_state *state, struct vchiq_service *service,
 	}
 
 	if (use_type == USE_TYPE_VCHIQ) {
-		sprintf(entity, "VCHIQ:   ");
+		snprintf(entity, sizeof(entity), "VCHIQ:   ");
 		entity_uc = &arm_state->peer_use_count;
 	} else if (service) {
-		sprintf(entity, "%p4cc:%03d",
-			&service->base.fourcc,
-			service->client_id);
+		snprintf(entity, sizeof(entity), "%p4cc:%03d",
+			 &service->base.fourcc,
+			 service->client_id);
 		entity_uc = &service->service_use_count;
 	} else {
 		vchiq_log_error(state->dev, VCHIQ_SUSPEND, "%s null service ptr", __func__);
@@ -1506,12 +1506,12 @@ vchiq_release_internal(struct vchiq_state *state, struct vchiq_service *service)
 	}
 
 	if (service) {
-		sprintf(entity, "%p4cc:%03d",
-			&service->base.fourcc,
-			service->client_id);
+		snprintf(entity, sizeof(entity), "%p4cc:%03d",
+			 &service->base.fourcc,
+			 service->client_id);
 		entity_uc = &service->service_use_count;
 	} else {
-		sprintf(entity, "PEER:   ");
+		snprintf(entity, sizeof(entity), "PEER:   ");
 		entity_uc = &arm_state->peer_use_count;
 	}
 
-- 
2.42.0

