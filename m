Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B577018027;
	Sat,  5 Apr 2025 11:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743852862; cv=none; b=gcw8GhFwRS9waVRLlLfKIqJKFRfLAg8MzcQNPLp8WK1DlDsDTHUbya1QlthYagvMTM/6/hguwWi0iZ3YoTH4NpZtQzIAsJg7T5qY+l0amHMsG3wsaO4QmFydm9WssYQ3YBHNi1yZm6XndS0cfNzBYjTeap+fM3bQ+n5LijS0Nto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743852862; c=relaxed/simple;
	bh=JHgSmpHywThLvhaNGwqkN6rlBmIZHywWloaU6MKIwBE=;
	h=Message-ID:Date:From:To:Cc:Subject:MIME-Version:Content-Type:
	 Content-Disposition; b=QSuBjA5oLzVm1lztxwH87JxmXOxarUVhsQVbvZFCBllVoBwzMnniFrZCSWhkjUfDZ7OVL8iaR9LQhUEJehlD0C+zHJ/S03eEeQtNvG7hzTDE9B1ld8CvSbxH96en+9B9iyf+kVDokznSx0mlwviSPANBBnc50v/TlH2kjgvhRf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XeneBFrj; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XeneBFrj"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cfdc2c8c9so16667695e9.2;
        Sat, 05 Apr 2025 04:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743852859; x=1744457659; darn=lists.linux.dev;
        h=content-disposition:mime-version:subject:cc:to:from:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qAIrh/4WE88oUvyzDDtUAXVVh7UEV5wee/SgtjWD0Rc=;
        b=XeneBFrj6UZPOvBYfluEH8luFmn2L1QRv6Tzn8GbWkKm2oU9aNv0bxDAzPtvbePdXW
         LCs/3VoOxA+5rr1kiXcjvIIgHVxMjLe5160EM2I87cO6LWETsugC5Mvuj1C+LoEDm1vL
         PQFGCB2Bdth4JZeNiwvf8Os1gXPcEkZ69nW6mvNVRqhyJ7jEnA2LoXGPd5ajnD+CyRHS
         arP5LnylYpVyqnd63Ev4S6hVTNn6zpwWVtNHnmzypBpEXBGnPAoG5uxTkJPLHO8htC5l
         hGDGwC3B0YnN9gIMVcc+vWmcAfd4DhNrntahC29uBZZm+FK3QeIf5voOBGJl/t4bYza9
         pBZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743852859; x=1744457659;
        h=content-disposition:mime-version:subject:cc:to:from:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qAIrh/4WE88oUvyzDDtUAXVVh7UEV5wee/SgtjWD0Rc=;
        b=MS2HF12Y+cRTCP1X6g/DG4yLm9RPvv6zbZAAGjCA9rmQM5qQ5UyZeJ39UHkK8BmS+a
         m2PReq00rfg2t3+sGZZk98oudH0adfhQW2aFYWQRTJh7zgK251qeuaIhFlcZmPOcrjeM
         FLmCmTLP2w7mRYxEJAE0Ulk06wuTs+uDHQWiGBzZ0uH7MrfZ6xOTNfwbidHysBphioVX
         u7vn9sI7x9ZL6WXdRFSJ5D18dQqJtgOKFswhjMR/5T01MLvRUZfmZrY1IZv8tGpnpeHI
         HTDSpFURG/sbC44Jhah0Jhdidl6vL4I1VIIaeBRRkXx+nyOYwi282NQb2nGZq4qM8wG4
         6rvw==
X-Forwarded-Encrypted: i=1; AJvYcCV8YXKw2E/GFNTSpRSt2XGUyiBNvww5PttOD88NgHCF0CTpdfL1yjCAUSzmYLxf7XRy9WVzMKfHepyL@lists.linux.dev, AJvYcCVfgAWx+c2tL0IAcnQB5OxGbdELDQ7FH4cSTNUI6bB0LTwc9vSzAQOu/T4qIUAebuvEkNPXwfE1lravCMS5@lists.linux.dev
X-Gm-Message-State: AOJu0YzKjwMbSR0CFfYStdKrAT9YyuWG6gI9WlGjCExEy8FwZCN8069b
	6CK1UHIHqt5IAY4X98yy7ehz5CtZ3Iv4xHfaEfv9EGmmNL6dw4YF
X-Gm-Gg: ASbGncvCpwM2w+4aDaQoJHtwfPKVV+Qr9zoYVF0BmaEzjma237sBhMOHHYhc/BNufED
	SYrGyPV7LXOSv8c/owNQzzFWDhLhZQOe3i/joei6GgoB3+/4+0KfeZQDW6JGabGcdeCP3JYFnCu
	NXSL6jxpAsC8wcD2ZDfgO2vzzjYZ3VYkpi3vu2wXWa+QHBWJa2YiFgwYeHxP6XbMq3YsmVUkhDO
	Z6ziRDBblLo73HfRGdH0WrJMwZrcUkefWnTV4olfc7exAYnENyU5BZy+jegSDk3bhSIvw29enss
	833w4F1MKaGRt+Sh5oeD19EZVQ==
X-Google-Smtp-Source: AGHT+IFemI35QNKyVOaqohFG+CqnKVeTP+GFL3QtSqb2csXBz3rnonb0On1EkabRo5049E0IfrLQDQ==
X-Received: by 2002:a05:600c:a4c:b0:43d:1840:a13f with SMTP id 5b1f17b1804b1-43ee076ca6bmr13194675e9.25.1743852858882;
        Sat, 05 Apr 2025 04:34:18 -0700 (PDT)
Received: from parrot ([105.112.71.96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30096923sm6749640f8f.17.2025.04.05.04.34.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 04:34:18 -0700 (PDT)
Message-ID: <67f1153a.5d0a0220.4e813.17ad@mx.google.com>
X-Google-Original-Message-ID: <Z_EVOA9BY2i9bZiY@princerichard17a@gmail.com>
Date: Sat, 5 Apr 2025 12:34:16 +0100
From: Richard Akintola <princerichard17a@gmail.com>
To: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Cc: julia.lawall@inria.fr, princerichard17a@gmail.com
Subject: [PATCH 7/8] staging: sm750fb: change sii164CheckInterrupt to
 snake_case
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Change camelCase function name sii164CheckInterrupt to
sii164_check_interrupt in order to conform to kernel code styles
as reported by checkpatch.pl

CHECK: Avoid camelCase: <sii164CheckInterrupt>

Signed-off-by: Richard Akintola <princerichard17a@gmail.com>
---
 drivers/staging/sm750fb/ddk750_dvi.c    | 2 +-
 drivers/staging/sm750fb/ddk750_sii164.c | 4 ++--
 drivers/staging/sm750fb/ddk750_sii164.h | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/sm750fb/ddk750_dvi.c b/drivers/staging/sm750fb/ddk750_dvi.c
index ac1aab77da28..1def02be4cce 100644
--- a/drivers/staging/sm750fb/ddk750_dvi.c
+++ b/drivers/staging/sm750fb/ddk750_dvi.c
@@ -23,7 +23,7 @@ static struct dvi_ctrl_device dcft_supported_dvi_controller[] = {
 		.set_power = sii164_set_power,
 		.enable_hot_plug_detection = sii164_enable_hot_plug_detection,
 		.is_connected = sii164_is_connected,
-		.check_interrupt = sii164CheckInterrupt,
+		.check_interrupt = sii164_check_interrupt,
 		.clear_interrupt = sii164ClearInterrupt,
 #endif
 	},
diff --git a/drivers/staging/sm750fb/ddk750_sii164.c b/drivers/staging/sm750fb/ddk750_sii164.c
index 6ce15b7816d9..aebde3d8b903 100644
--- a/drivers/staging/sm750fb/ddk750_sii164.c
+++ b/drivers/staging/sm750fb/ddk750_sii164.c
@@ -370,14 +370,14 @@ unsigned char sii164_is_connected(void)
 }
 
 /*
- *  sii164CheckInterrupt
+ *  sii164_check_interrupt
  *      Checks if interrupt has occurred.
  *
  *  Output:
  *      0   - No interrupt
  *      1   - Interrupt occurs
  */
-unsigned char sii164CheckInterrupt(void)
+unsigned char sii164_check_interrupt(void)
 {
 	unsigned char detectReg;
 
diff --git a/drivers/staging/sm750fb/ddk750_sii164.h b/drivers/staging/sm750fb/ddk750_sii164.h
index 90b7ae823a10..aa3f34c13979 100644
--- a/drivers/staging/sm750fb/ddk750_sii164.h
+++ b/drivers/staging/sm750fb/ddk750_sii164.h
@@ -36,7 +36,7 @@ char *sii164_get_chip_string(void);
 void sii164_set_power(unsigned char powerUp);
 void sii164_enable_hot_plug_detection(unsigned char enable_hot_plug);
 unsigned char sii164_is_connected(void);
-unsigned char sii164CheckInterrupt(void);
+unsigned char sii164_check_interrupt(void);
 void sii164ClearInterrupt(void);
 #endif
 /*
-- 
2.39.5

