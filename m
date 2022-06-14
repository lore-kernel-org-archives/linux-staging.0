Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 116EC1FB0
	for <linux-staging@lists.linux.dev>; Tue, 14 Jun 2022 18:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655231184;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+2ghUAqq8tV/t933HP/EAr/vq6kVXtlGVMho/GYXXI4=;
	b=SGxFNxSVhpk8ToY2dSoTMFN1wuUCA9fCdP5RYN7Nzrn54fc6RmHfnlOSXCMVqgXhqjrPyz
	N9vo7ejG7j5rDcvTAPTOq2CVNzl0rgcNQfgGqcITeV4Q2xbwAs1pQLacLCqOyOb+AXtR06
	tTv7ad2OYUwNqQP/+L3irvYh7Jd3qdg=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-13-FnIT8_3MMEyVdpP7AtFPqQ-1; Tue, 14 Jun 2022 14:26:23 -0400
X-MC-Unique: FnIT8_3MMEyVdpP7AtFPqQ-1
Received: by mail-qk1-f197.google.com with SMTP id o10-20020a05620a2a0a00b006a77a64cd23so6962320qkp.21
        for <linux-staging@lists.linux.dev>; Tue, 14 Jun 2022 11:26:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+2ghUAqq8tV/t933HP/EAr/vq6kVXtlGVMho/GYXXI4=;
        b=j+bhKf37K4PQ4Mei6hd+ySyCz2xqRa5W0WYKqU3MUYG37/ANoVYszR2j1PwDqCzdpI
         1I4SYSziqdJSrJmgvJx/nC1fu/zVrJ+agsB2kqE7f7NebEysNSMCwNIgb4gLcbvVdzG3
         IqPOj+m6bEeVQaj0dM1Mp11FAUSQseRLoxp4U3mVSQmYaSLhe19H6zeiefwB0eqVAwBq
         1vLwn7k6nu3DZzIJAnX0mgtIs3bV5Fo6Xlxdv5jGEq2fzbYU5eu7Q99aFWPZpXqZ0G0B
         k+qXBtVRmMVWUwKK7OC4o+wndtOVvvtljRN1VrTGhjYFQTY/LqKSusQit7NE40PenYvP
         I+BQ==
X-Gm-Message-State: AJIora+YhVL2KuW+jzNElw6++Dyi1T4at1HqoogVY3A7+DYzlyI7o9x8
	Uav6yxYtc5XYEiRuAC72MvVr76W4VChLrwWThGXcbCkJ2YrV0BucS+RtMRk0FwG2o9f8s47Cghn
	2nCd5ziRCmDXdf0ykbrfgukJFhQ==
X-Received: by 2002:ad4:5c66:0:b0:464:67f7:7fa6 with SMTP id i6-20020ad45c66000000b0046467f77fa6mr4765302qvh.39.1655231182686;
        Tue, 14 Jun 2022 11:26:22 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uzQsD1blOZeQyV34RqpAWS2lJj/DpXWIAfN92HwdNW4hTCj3v7/yXuU/npHeWWIfzrRCm8lw==
X-Received: by 2002:ad4:5c66:0:b0:464:67f7:7fa6 with SMTP id i6-20020ad45c66000000b0046467f77fa6mr4765288qvh.39.1655231182449;
        Tue, 14 Jun 2022 11:26:22 -0700 (PDT)
Received: from fedora.hitronhub.home (modemcable200.11-22-96.mc.videotron.ca. [96.22.11.200])
        by smtp.gmail.com with ESMTPSA id c20-20020ac853d4000000b00304e38fb3dasm7590260qtq.35.2022.06.14.11.26.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jun 2022 11:26:22 -0700 (PDT)
From: Adrien Thierry <athierry@redhat.com>
To: Florian Fainelli <f.fainelli@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@oracle.com>,
	Adrien Thierry <athierry@redhat.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev
Subject: [PATCH] staging: vchiq_arm: check vchiq_instance for NULL before dereferencing
Date: Tue, 14 Jun 2022 14:25:44 -0400
Message-Id: <20220614182544.690630-1-athierry@redhat.com>
X-Mailer: git-send-email 2.35.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=athierry@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

In service_callback(), the vchiq_instance is checked for NULL after
dereferencing it. Switch the order of those operations.

This was reported by https://lore.kernel.org/all/Yqc+Oavmh0zMRVPQ@kili/

I moved the NULL check before the call to rcu_read_lock() since access
to the vchiq_instance is not RCU-protected (the RCU is only used to
access the vchiq_service).

Signed-off-by: Adrien Thierry <athierry@redhat.com>
---
 .../staging/vc04_services/interface/vchiq_arm/vchiq_arm.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 3bcb893d14a1..ba1f86799b7f 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -1058,6 +1058,9 @@ service_callback(struct vchiq_instance *instance, enum vchiq_reason reason,
 
 	DEBUG_TRACE(SERVICE_CALLBACK_LINE);
 
+	if (!instance || instance->closing)
+		return VCHIQ_SUCCESS;
+
 	rcu_read_lock();
 	service = handle_to_service(instance, handle);
 	if (WARN_ON(!service)) {
@@ -1067,11 +1070,6 @@ service_callback(struct vchiq_instance *instance, enum vchiq_reason reason,
 
 	user_service = (struct user_service *)service->base.userdata;
 
-	if (!instance || instance->closing) {
-		rcu_read_unlock();
-		return VCHIQ_SUCCESS;
-	}
-
 	/*
 	 * As hopping around different synchronization mechanism,
 	 * taking an extra reference results in simpler implementation.

base-commit: de9257ae1d3b0d8856955045d194e3ff4f278394
-- 
2.35.3

