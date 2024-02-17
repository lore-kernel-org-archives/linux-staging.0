Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B477E0F1
	for <linux-staging@lists.linux.dev>; Sat, 17 Feb 2024 21:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708204420; cv=none; b=rDLReYX6KejAsJ8dNToQXJVIuU8CX9bPa3FHotrtgdt9qHCkno4ozm2fgGjYp7DC2+a/X72gczwaaZK2b0VzPVN+uVTGDJ4JWMqhcENVRSlwJfV/fSC+DeZTCIuCs+3o3ENhIMU6yxTaaadlYwx5mcEg/8/L3X/KVLY/1MQNxH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708204420; c=relaxed/simple;
	bh=7hspqxJMlbWp9r8wbinNZ4JYMSL1OjbYJQMw3kfsFf8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CPfRQ6zP0RN6MuX6X7wKkLbJhikwlwYOing/npQKZeMw3thmfBbMQdHVXx+Wck30IizXN2Jh4X25/3O07HmyvHMRjXLx4SOn5TGjSAfQFwEnb2uTbpIdTRKDeOCRE0oCzXsHZd1t4Z1vdOqglfGQLyaLvHTg/t+SWMqZnIBt73Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZNAB4tZG; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZNAB4tZG"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5640fef9fa6so1577161a12.0
        for <linux-staging@lists.linux.dev>; Sat, 17 Feb 2024 13:13:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708204417; x=1708809217; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+GS741zrKEdJkYZt2tXkhtOseE/gYHcmQu8uV5DPSIc=;
        b=ZNAB4tZGF6CjMeZc3JIApgxTrKoUIpFZ+nKB0HJedIxmWBVqAjwU8+10oUjEttXmxn
         SkrkgjJXZ+qcN2Mwpk9N41stLzSFXm+8Uwr3AKZENwEKuCCEKP/pPzEW+SWUC6aYucpw
         UJFQ/uWPZ/fXNEkWeY1EFX03g4bwg2YmSQC8NJQqd7y6wxPtKDKyCUg60pbLkpjlGIjK
         ZhlJBQK5GTSUOrHC8yPOfjRWUFCLb9OpWJmSIe3HBzHPkm8C4I8JJhZGt6N1QoDVC59o
         kFbJ7QWGv1d71lb/CsNhl8n5RftWbJZzH+d0JiOamThxXtlMVK6F6pzX4IbRhAUTIYlC
         iCBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708204417; x=1708809217;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+GS741zrKEdJkYZt2tXkhtOseE/gYHcmQu8uV5DPSIc=;
        b=eIaWH70NPPMMdGv+MR/ysSp940TwVsSZxcaj9e942WdOQbv2mDd+jmIliQYQtuosGm
         5whc2G9vfmULenLsaZfaNNUu6KRzUwYP5A1hqtdsEh9xne3ve8lA1n4zY5jCROvM1DJB
         DbIXWQN1L4ogO3rz+EAfdhhZANW5E9d4DfS9CR4Htn8mdhN3CUy35wt9OfGeHtzHkRsx
         h+NRnWGPG2QHiCEDFAGO4K3DAAlaOnh9Oy+dhQOClDsRyrM5bfANWFPTMM/wn0UQkyGJ
         AuyQVhAZCCaoTdME0GLOmYiBK9lP9POhmaQiUhr+EdK8ulCLT4NJixFABdydZjz/AlwA
         EqkA==
X-Gm-Message-State: AOJu0YyfNfbhwD1G38UE+hDeZaAOXMjAeU4pBFWIta/Bx+wNy61XIRok
	3QS9I+Y7r+kAwCX6Tc/48ErfjXYJYHz5vkZQxgLaPgPGMZYLg4vY
X-Google-Smtp-Source: AGHT+IF28IvsfS79LfXSjGJV6c1pr4ruIKI0l2p/J0WvtTC16QExdfTP4rC0adrGEBCQ31HuOq3j4A==
X-Received: by 2002:aa7:cfcd:0:b0:564:41c9:517f with SMTP id r13-20020aa7cfcd000000b0056441c9517fmr695490edy.26.1708204416624;
        Sat, 17 Feb 2024 13:13:36 -0800 (PST)
Received: from pinguine.lan (ip-176-198-146-182.um43.pools.vodafone-ip.de. [176.198.146.182])
        by smtp.gmail.com with ESMTPSA id n3-20020a05640206c300b005644eca3befsm132087edy.85.2024.02.17.13.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Feb 2024 13:13:36 -0800 (PST)
From: "Moritz C. Weber" <mo.c.weber@gmail.com>
To: florian.fainelli@broadcom.com
Cc: linux-staging@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	"Moritz C. Weber" <mo.c.weber@gmail.com>
Subject: [PATCH v2 1/8] Staging: vc04_services: bcm2835-camera: fix brace code style check
Date: Sat, 17 Feb 2024 22:12:39 +0100
Message-Id: <20240217211246.28882-2-mo.c.weber@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240217211246.28882-1-mo.c.weber@gmail.com>
References: <20240217211246.28882-1-mo.c.weber@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reformat function parameters to fix checkpatch check:
Increase readability and consistency

Signed-off-by: Moritz C. Weber <mo.c.weber@gmail.com>
---
 .../vc04_services/bcm2835-camera/bcm2835-camera.c     | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
index e6e89784d..05e5e4ab1 100644
--- a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
+++ b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
@@ -350,12 +350,11 @@ static void buffer_cb(struct vchiq_mmal_instance *instance,
 			if (is_capturing(dev)) {
 				v4l2_dbg(1, bcm2835_v4l2_debug, &dev->v4l2_dev,
 					 "Grab another frame");
-				vchiq_mmal_port_parameter_set(
-					instance,
-					dev->capture.camera_port,
-					MMAL_PARAMETER_CAPTURE,
-					&dev->capture.frame_count,
-					sizeof(dev->capture.frame_count));
+				vchiq_mmal_port_parameter_set(instance,
+							      dev->capture.camera_port,
+							      MMAL_PARAMETER_CAPTURE,
+							      &dev->capture.frame_count,
+							      sizeof(dev->capture.frame_count));
 			}
 			if (vchiq_mmal_submit_buffer(instance, port,
 						     &buf->mmal))
-- 
2.30.2

