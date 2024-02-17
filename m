Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6EEC7F490
	for <linux-staging@lists.linux.dev>; Sat, 17 Feb 2024 21:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708204421; cv=none; b=aK2i2EFPoqFFqor9gs7svvqGcb+LQBNhDnBkyEe5jJJnan53GudSRVE9TJc5bK76FOQSEC8zyX5xE9j/WZP1bRuUgh6+6uoav0HJS5CVxXOc7vohdUW17iGPM5/nRSAocpqaq1DlB/9+sZ1mAfLn46AaSsJLnr+RYzbe06h79h4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708204421; c=relaxed/simple;
	bh=nx+tftz1nBVA1JDthW839KRrG90SMOUclvTtsVrk+RY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KeWMI6udAUip6/dXKArVLSBI68fvOs0NaYV/QZA2hZ3+GW5QBOMECUF79o76dmKjHkC9GfMi9IJiZzUN0HmAOc7+U0FGIZQyoEXbXap7VH2oWuwOo0o3wzcxVYwKZxySQtlHyUcxIrR+SLWI7XS9zLWBgAPEcRGv+cyfZL0i2M0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GPTUdPX2; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GPTUdPX2"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2d204e102a9so39848011fa.0
        for <linux-staging@lists.linux.dev>; Sat, 17 Feb 2024 13:13:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708204418; x=1708809218; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=80aNxi3/T+LbaRRg/6R2N0khZ/zy5It3WYtSjVAdo14=;
        b=GPTUdPX2jn6z8MqRZOxPsuKDQrE+6JqVusbRsg4ar00bEoVYPEfLus8ex2dPmRDvVJ
         w33CD+3e+qayIIGf6rtR+s1XfbWSdysNy8sJEkcps2rW0weEGjrXlkboXNvcYRyq5sBT
         WWyq3BRnP2zquYrGbhg7SLliM/kfiPZjRWsM85kjQ9APrx4ybh43vjCiO5lXWxEWdUTL
         geiu2fg4jYH4ybAlMtIzArfUS0UsQ2fPhj42oC4iIGTSbEiTivPmgCbSC6N9OU0JzuQ5
         WiXpuWYnKVfhufzmNNXHzy2YnifVEFqrsyeyls7ZERaL0s0z3C9Scg/0ki0gIpkyS1Q5
         xr8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708204418; x=1708809218;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=80aNxi3/T+LbaRRg/6R2N0khZ/zy5It3WYtSjVAdo14=;
        b=oPVdrUeR3mBd2jSCPewNxItLT4imu6fIWHBwTWjY3TDz60PoK+sViZijVFwGpF5jTa
         dyQDs5PdfdoyA03E2PDcDUXVbLMv4rk+UYaMxjyW+BL+SJpH0/vFOEsVt4kSMjyh7vQs
         2SgZD7PE+P8TIOrx36LpFaC7GChO9FtHWvaG4e/kKjtq3GlUFLs0uu4TsZFjbhfj3org
         Zb5EQBp+uY1z+0Pw1eNG9fcaNawxPWbH6USYOX13ic4W8DEri4ZiKn1o5haZIy5vih/m
         LRG7ruZPMZ3uUa8miUV2ygUASHjMN/bvb65ILon72kocZQsjCT3SK/TwOKgVxcbyK4Ec
         FqVw==
X-Gm-Message-State: AOJu0Yy5zzXc2EjbeIhOpI72NuUwmG1OggYbB/QzKM924jancianlJpL
	wcK/1PKbBwmFQYKguXfMDLUpXSVAuS0dmfGIuoiT5B1ZsGvq6y76
X-Google-Smtp-Source: AGHT+IHMnVyJmhAK4CsTjqVXERP3BRF1TlMELlJXzXhuJXBLjenNCJb4Q6haf5FOo9elDWVjDhXl0A==
X-Received: by 2002:a2e:a543:0:b0:2d2:ccc:ac2c with SMTP id e3-20020a2ea543000000b002d20cccac2cmr6041608ljn.4.1708204417902;
        Sat, 17 Feb 2024 13:13:37 -0800 (PST)
Received: from pinguine.lan (ip-176-198-146-182.um43.pools.vodafone-ip.de. [176.198.146.182])
        by smtp.gmail.com with ESMTPSA id n3-20020a05640206c300b005644eca3befsm132087edy.85.2024.02.17.13.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Feb 2024 13:13:37 -0800 (PST)
From: "Moritz C. Weber" <mo.c.weber@gmail.com>
To: florian.fainelli@broadcom.com
Cc: linux-staging@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	"Moritz C. Weber" <mo.c.weber@gmail.com>
Subject: [PATCH v2 3/8] Staging: vc04_services: bcm2835-camera: fix brace code style check
Date: Sat, 17 Feb 2024 22:12:41 +0100
Message-Id: <20240217211246.28882-4-mo.c.weber@gmail.com>
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
 .../vc04_services/bcm2835-camera/bcm2835-camera.c        | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
index 1fa868163..dfa9e7670 100644
--- a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
+++ b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
@@ -418,11 +418,10 @@ static int enable_camera(struct bcm2835_mmal_dev *dev)
 	int ret;
 
 	if (!dev->camera_use_count) {
-		ret = vchiq_mmal_port_parameter_set(
-			dev->instance,
-			&dev->component[COMP_CAMERA]->control,
-			MMAL_PARAMETER_CAMERA_NUM, &dev->camera_num,
-			sizeof(dev->camera_num));
+		ret = vchiq_mmal_port_parameter_set(dev->instance,
+						    &dev->component[COMP_CAMERA]->control,
+						    MMAL_PARAMETER_CAMERA_NUM, &dev->camera_num,
+						    sizeof(dev->camera_num));
 		if (ret < 0) {
 			v4l2_err(&dev->v4l2_dev,
 				 "Failed setting camera num, ret %d\n", ret);
-- 
2.30.2

