Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7415F7E0F1
	for <linux-staging@lists.linux.dev>; Sat, 17 Feb 2024 21:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708204422; cv=none; b=foVf2i62A4rHx5Ugw9YvlzmL7j7rUUKUf3Tcem5DX0g7kzzCISlnHE2ORxxlemPgN05jOytKb2ecd0bp7jY/HXvnJbuElAhXJSqBO7REE28ZrVunMD3rBVbVLCygJGcA3DxtoTJQsrywAMmNVcroTI8CtB6mpABA0jXT4KUoKDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708204422; c=relaxed/simple;
	bh=wVBHlEG71HiYpg+k8NXj4fmiRiTFWEkDOl1Zvw4CSdQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=npe+wgwVjLYsF7doc41mXoyErwufSH+ANbPXwWIeJszcvm1layAMp2OEwdFcRF2+Bz6TnqIEehDKjWwazP3D+G9ptffUwMhhyB3OOdg6Zd2sjIDZ74gt5MZAgY5Vn6eeIG1BOuU5oSN8F/ouno79aLX/03J2gRb5rBWsEbkjp1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R9upwl66; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R9upwl66"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-563bb51c36eso3091493a12.2
        for <linux-staging@lists.linux.dev>; Sat, 17 Feb 2024 13:13:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708204419; x=1708809219; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FoV+G7y2w1NQPRt2wlW97bAxMHa5rqpMfVRm3MsQC8k=;
        b=R9upwl66hreuHX9uqduGeRGEI45X+EFdUjhkSiVHeVWdmK15RI6QqPidqAq5UdhbFo
         StsMmNgH4SZbHvoGLnrtq5O8MBVtuTvnkCxgPeCLmWuGd9eGGXmsezMJWI4mtQPCxEc8
         JI0kfc4bbyCL/EGwUcU2ZTIhxaJ5EyoRG5Pf4krJAikYyd8oYjehWUxuLd1jKL2/3nOh
         umj+7B9qI5b/DRdqTVSAUfp8payix3wh9lXJHPLmkxmzzCzEX4iRMuDH8hFaS3aOY/dG
         IEheugNHWs+F1k9mrNgaPWAoGjCICBv5x2M2KWxLpljBUI2azSDMHuwLXzlMGlOwoXg2
         +sWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708204419; x=1708809219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FoV+G7y2w1NQPRt2wlW97bAxMHa5rqpMfVRm3MsQC8k=;
        b=F0wWysIJkfoUCftoV8lxZt3fCIIm3UKLXoQ1OOlj99MvxJxPJsH4C0fBu7aTj5uK4E
         LI5m5rylHu7v3DxYPw11/Qgmnygi4/0n0SiWTbIpBZUDw3jLzZaXSTQ9nDeQko441Bb3
         IqQQ5MmroUnxn4JZqbdRFApiB3/koqSWZTBNTk4FYPo0S7U//5bSWfeDzcKRxDycq4Jm
         3bunV0PoXH8cc7E0QecHfOWtV0bC+bnO8BkeAHL2E7lmdNRBUz6qkzEMIDND68EQHQwt
         ULT+qx8oJeDOw8S56OVWjRwLZit8XcB1ZdsrP79LtoHg/HSrcJyqjO8i9PE6OYvXYkP4
         2OOg==
X-Gm-Message-State: AOJu0YzjViMrr4fedyrbMp12+Hhe/oFgTGNFoC4Q94VsprYnlCgErxwr
	gNF6lamoH1aVKPTZ2O0AuPSjP237eHze5hH6WGjrA2jLCV0cPxTs
X-Google-Smtp-Source: AGHT+IH7PRjYOR9LxKzjIyfdSfGIuorzjh1VRhzRUWCXVCXGr5YgFETi939+BUYpFnfReT0NTmAMOQ==
X-Received: by 2002:a05:6402:2d2:b0:564:3854:f466 with SMTP id b18-20020a05640202d200b005643854f466mr816727edx.34.1708204418543;
        Sat, 17 Feb 2024 13:13:38 -0800 (PST)
Received: from pinguine.lan (ip-176-198-146-182.um43.pools.vodafone-ip.de. [176.198.146.182])
        by smtp.gmail.com with ESMTPSA id n3-20020a05640206c300b005644eca3befsm132087edy.85.2024.02.17.13.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Feb 2024 13:13:38 -0800 (PST)
From: "Moritz C. Weber" <mo.c.weber@gmail.com>
To: florian.fainelli@broadcom.com
Cc: linux-staging@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	"Moritz C. Weber" <mo.c.weber@gmail.com>
Subject: [PATCH v2 4/8] Staging: vc04_services: bcm2835-camera: fix brace code style check
Date: Sat, 17 Feb 2024 22:12:42 +0100
Message-Id: <20240217211246.28882-5-mo.c.weber@gmail.com>
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
 .../vc04_services/bcm2835-camera/bcm2835-camera.c      | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
index dfa9e7670..e2d058732 100644
--- a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
+++ b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
@@ -465,11 +465,11 @@ static int disable_camera(struct bcm2835_mmal_dev *dev)
 				 "Failed disabling camera, ret %d\n", ret);
 			return -EINVAL;
 		}
-		vchiq_mmal_port_parameter_set(
-			dev->instance,
-			&dev->component[COMP_CAMERA]->control,
-			MMAL_PARAMETER_CAMERA_NUM, &i,
-			sizeof(i));
+		vchiq_mmal_port_parameter_set(dev->instance,
+					      &dev->component[COMP_CAMERA]->control,
+					      MMAL_PARAMETER_CAMERA_NUM,
+					      &i,
+					      sizeof(i));
 	}
 	v4l2_dbg(1, bcm2835_v4l2_debug, &dev->v4l2_dev,
 		 "Camera refcount now %d\n", dev->camera_use_count);
-- 
2.30.2

