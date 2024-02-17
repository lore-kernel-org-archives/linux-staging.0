Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4311C7F464
	for <linux-staging@lists.linux.dev>; Sat, 17 Feb 2024 21:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708204421; cv=none; b=MwVB2HbiQO6yqb/qdaXaxBFEq4fboGLQQKfnvWYfW8eO1gyzO9Du9UM8brGK5V40XJi1ghmejZi1zwY4r0xkNfGFhE7PJPiXK3EOcceYnpsiHexKq1T+ygh+TFLRKTPR+7tvgBQfidD8WyaSA4xkMCObIe4GI2AEW0C/SoyxfGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708204421; c=relaxed/simple;
	bh=AfmadviaZrb80S8i4Kp9Csah0gTIVUeuICCrJzeMHAQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oo2QwJ9JfNqXWykQC6yn0p9wXmN1P1TlIsOTZqMazaSrdCeyixxM+3aHm0s81SPBySoc/rLFhJWHv8ay51g3UrZ2ewoFZL0Qprs+uv5VhEWNBBKYZisTSJgXr5CRx9SL1bLgAg65xBYWZNRI4cVb2tKrGpsrVBRQs7pSpHndgfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=am9hTwDJ; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="am9hTwDJ"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2d1094b549cso44675211fa.3
        for <linux-staging@lists.linux.dev>; Sat, 17 Feb 2024 13:13:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708204417; x=1708809217; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8CRq8R2Pi0gMvJE/RQYPcDF05WRnk+6fZqPWux/HjP0=;
        b=am9hTwDJXgpNfyUBytR/5YX5RDA5gcZrItUQmRF6/Y9pzyzpe+aPnRKJgepBj0rQi7
         nQLMIpHo3ZFZwmu+Eo5RkjE6aSCh9xFSmz+V8pRs2OvnG6XOdLPcNGstsX3IvS3Au0jJ
         aQUuP4EpIAitgvNKpUxT3UOgjolSLry16jdEdCEGTbFkhXcveSWpfcYnl+a9qaaRTASs
         R20SFeNn1c/klyjy3RnT14lPpvjNAmdFwXaiN8ok9G1NbdWg1CAA3N3/V7amYUXqk6y4
         mr96+dFw5jGoE4q7b6+Dvo1cvhX7TsY+sqH0vgm+y8Qrx4r0wOY8Hk0ggmKqvr5z4ghh
         9yxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708204417; x=1708809217;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8CRq8R2Pi0gMvJE/RQYPcDF05WRnk+6fZqPWux/HjP0=;
        b=mbKFYbokfG/oOx6rr/U225I7Fg2DyR7Ao/0C3MQls/FaiVa2ztT5sfOMiEBVOslR92
         zZC8x1q/WJFTFvHH3UfrGmmCZSNVSFevUzVqavi43jj9IlkrvVFMc6biGPksO0ptC9eV
         DRpiid4d+XZhXYsiPwTpzy7HL0tKa/NGNxQvqgS+0C6yDx9Yus8RCAus/3nv7pB5jvEv
         dy6GXWiMxonYSKZOfC+8XXK+PbvP3PGl+EwQaDb/jg5ZpXNWscfvsIFDXBsX5HF1tVeG
         grROQnZ3ly3ICpCzQFryu9bUtbxdesRXONl7rsHs6Mu2tUAeF3V5Q4xfBoDHatUgOZuh
         S8VA==
X-Gm-Message-State: AOJu0YzNmxJwzh4kWs7bgXRmwBhb2eqYihbbLwN2sI6RDXbr9i7V+cGT
	Pxm2NdxWOUr+5EVCVZzFm//aH/SDyNFDdDadA+7OMY62bWBSiKEo
X-Google-Smtp-Source: AGHT+IHBIpJly84pRoYl5qk8+XBduxwSsgGqNE2taaG3NpJKHeObZGBiwLsUq0GomCR1dIpbfBgxYA==
X-Received: by 2002:a05:651c:1a29:b0:2d2:912:916b with SMTP id by41-20020a05651c1a2900b002d20912916bmr6743449ljb.24.1708204417266;
        Sat, 17 Feb 2024 13:13:37 -0800 (PST)
Received: from pinguine.lan (ip-176-198-146-182.um43.pools.vodafone-ip.de. [176.198.146.182])
        by smtp.gmail.com with ESMTPSA id n3-20020a05640206c300b005644eca3befsm132087edy.85.2024.02.17.13.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Feb 2024 13:13:37 -0800 (PST)
From: "Moritz C. Weber" <mo.c.weber@gmail.com>
To: florian.fainelli@broadcom.com
Cc: linux-staging@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	"Moritz C. Weber" <mo.c.weber@gmail.com>
Subject: [PATCH v2 2/8] Staging: vc04_services: bcm2835-camera: fix brace code style check
Date: Sat, 17 Feb 2024 22:12:40 +0100
Message-Id: <20240217211246.28882-3-mo.c.weber@gmail.com>
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
index 05e5e4ab1..1fa868163 100644
--- a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
+++ b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
@@ -405,12 +405,11 @@ static void buffer_cb(struct vchiq_mmal_instance *instance,
 	    is_capturing(dev)) {
 		v4l2_dbg(1, bcm2835_v4l2_debug, &dev->v4l2_dev,
 			 "Grab another frame as buffer has EOS");
-		vchiq_mmal_port_parameter_set(
-			instance,
-			dev->capture.camera_port,
-			MMAL_PARAMETER_CAPTURE,
-			&dev->capture.frame_count,
-			sizeof(dev->capture.frame_count));
+		vchiq_mmal_port_parameter_set(instance,
+					      dev->capture.camera_port,
+					      MMAL_PARAMETER_CAPTURE,
+					      &dev->capture.frame_count,
+					      sizeof(dev->capture.frame_count));
 	}
 }
 
-- 
2.30.2

