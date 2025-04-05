Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C751F150E;
	Sat,  5 Apr 2025 13:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743858234; cv=none; b=HWKsZ7gqG7YEOP1thWtzP8IefPIdM00HhMPiGrZXpETvwtbJLTICwhM7Ign8ywt1mbhn7+S3nNv/7hI+BHwZFPDx3RM+qoacpCsdZl3ke2aJw2DUtL7Jm1b0Nzc1ezIGZg/e22TUXX9Vks5qBBN05xl62BTp75YSbBPw5Ms5uKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743858234; c=relaxed/simple;
	bh=vQj84IzAyMbsqXmdqTC73l509pCAn1/REbFySFYyqoE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=S5LSK7aT6jSyZQmePcXo9cPJPHp2b7zoyFQOYBoxoMkDhD0Sx/LTPYrAJ4/fJIgwJKFF3qVpGvHT7z+C1f8p0Bl5ArOMP7qCu7Oz430XENSS+9nvxwGAioXlflXxNp36mGiNviNNRgMnkhWo8Wig1Q/JhCmR3EL8XBtb/pNxc9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gQhsR7Y3; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gQhsR7Y3"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-39c1ef4ae3aso1648765f8f.1;
        Sat, 05 Apr 2025 06:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743858231; x=1744463031; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zir1NDA8An9XMiM9quRa114yNTaeYbAjAw+vpjLNbb0=;
        b=gQhsR7Y3zpgeBBs6PVq8IXxAZHdqgz7t8K4wV12DQGj/QVC9aoVGVvRQzTL6RzAUez
         YHIOCujr7YA/o416A9cP52s7veSE5MZb5E4BiP0Gv3UHFKUDa7FG41dzKdT5Vd/GByZf
         vtp2vmAAwJ6RsSYc3wIlVHz/3brN+AMgpYmQfAIYPuZXIk5I5IAv+alOqSbjIzut4zj1
         0D0D7XSo9jenrdru55N/M0NoaX/X9VIDos0cyP9i/aIghnsU2DNhvvGP6/Rdpc4rUQu0
         F6nYIK7mU2Zu5SoqSHZcm58jAFWnS5yhcUpsQXkWPQF37a6O2CTsc/o8RBERWJfzdgxy
         +AFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743858231; x=1744463031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zir1NDA8An9XMiM9quRa114yNTaeYbAjAw+vpjLNbb0=;
        b=I9rUoguJIC0bQx/SPE/Z5FKkEslBPnYxOzP3IGFM/pHgSE7VlAsnsABqOSPJPea2oT
         EJR7yreVYhRxmT4IvZIbp1zHd6eIKoyjXnqzugxtkzKZrCfc5tdaW4hWlQlYSl7Ripkm
         NaopFwOIAQ1VVMxPA2Ajl2VnYuR/Lvk8MSADNr5itlBItPMZRyvZfYqJZYXvx5UKyxhs
         /lsjqxcw6frtDEiO+XB6COa+tUCubNJnQ/VPGuwcUCoTLepHh+XnoolxraVVxPWT2bqT
         YfARmns1UUVjJcJXePhiTCN5QHeQ5iM/pkHT3tPxMZ3+8ycWjyPjQ47BYKiJw9IU6yD5
         3/BQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0T7QC05kVTmDAX+UNVeVpPe+XVP3JreEUSn0rzWmQ3qg3Cye8X+mTvOXwHncNgkHneCH9x856LfKeu9cH@lists.linux.dev
X-Gm-Message-State: AOJu0YyTGtjvy/1YLWuFtiqsbyqtZLpz+aMp8GIQMIdV4ODi+ZAz/2Wp
	8GmOtFveVfCqXJc2D3HBWWUYKPKLsDuRDyoJfn+x2s718h5JHgtt
X-Gm-Gg: ASbGncs2ETcqCAi5Y8m4L9NBxs7I0amwgPuthK3tkjCsZVNNwBlQTLKOM4ITC2DgCZW
	bah5bRNXgiI53xe5L1Q9EvttGd1EZeMSzWV8k4M3XXypkXF9kikJ3E9oi1aVTVd5tiS6ETQdtfk
	beO2Hyz01MvEbD5dxwQUfrS3KMgguL1Ok/+wLWYAvXbbBoVx3pb6fxsjYKuEPtNkuGZ0JMzhbS9
	LZllqkwmb1t2nGrXVcTfKtD+N2Sdx4AnOeqhITEHXsAuSGehfL+1JBomo+AOmFZYhxen7A5t/U1
	0txh2m9KKNurlWdrsmhZJ3qV2Q==
X-Google-Smtp-Source: AGHT+IFM1faHsYRlRseTZrJNYEdeiohp0q3i/meYKhvosYgotdtEcCLj36yq4TgoJ/KS/8BgC8CL/Q==
X-Received: by 2002:a05:6000:2411:b0:390:e535:8750 with SMTP id ffacd0b85a97d-39cb35aec3dmr5109957f8f.9.1743858231312;
        Sat, 05 Apr 2025 06:03:51 -0700 (PDT)
Received: from parrot ([105.112.71.96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30096923sm6955182f8f.17.2025.04.05.06.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 06:03:51 -0700 (PDT)
From: Richard Akintola <princerichard17a@gmail.com>
To: outreachy@lists.linux.dev
Cc: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Richard Akintola <princerichard17a@gmail.com>
Subject: [PATCH 3/8] staging: sm750fb: change sii164SetPower to snake_case
Date: Sat,  5 Apr 2025 14:00:54 +0100
Message-Id: <90f9842254eb83c2dc19abcf5072aab9549026a9.1743857160.git.princerichard17a@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1743857160.git.princerichard17a@gmail.com>
References: <cover.1743857160.git.princerichard17a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change camelCase function name sii164SetPower to sii164_set_power
to conform to kernel code styles as reported by checkpatch.pl

CHECK: Avoid camelCase: <sii164SetPower>

Signed-off-by: Richard Akintola <princerichard17a@gmail.com>
---
 drivers/staging/sm750fb/ddk750_dvi.c    | 2 +-
 drivers/staging/sm750fb/ddk750_sii164.c | 8 ++++----
 drivers/staging/sm750fb/ddk750_sii164.h | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/sm750fb/ddk750_dvi.c b/drivers/staging/sm750fb/ddk750_dvi.c
index 6dee95e60a6e..bb7538682b7d 100644
--- a/drivers/staging/sm750fb/ddk750_dvi.c
+++ b/drivers/staging/sm750fb/ddk750_dvi.c
@@ -20,7 +20,7 @@ static struct dvi_ctrl_device dcft_supported_dvi_controller[] = {
 #ifdef SII164_FULL_FUNCTIONS
 		.reset_chip = sii164_reset_chip,
 		.get_chip_string = sii164GetChipString,
-		.set_power = sii164SetPower,
+		.set_power = sii164_set_power,
 		.enable_hot_plug_detection = sii164EnableHotPlugDetection,
 		.is_connected = sii164IsConnected,
 		.check_interrupt = sii164CheckInterrupt,
diff --git a/drivers/staging/sm750fb/ddk750_sii164.c b/drivers/staging/sm750fb/ddk750_sii164.c
index 284c32f7e9b4..b96f9369fab4 100644
--- a/drivers/staging/sm750fb/ddk750_sii164.c
+++ b/drivers/staging/sm750fb/ddk750_sii164.c
@@ -256,8 +256,8 @@ long sii164_init_chip(unsigned char edge_select,
 void sii164_reset_chip(void)
 {
 	/* Power down */
-	sii164SetPower(0);
-	sii164SetPower(1);
+	sii164_set_power(0);
+	sii164_set_power(1);
 }
 
 /*
@@ -273,13 +273,13 @@ char *sii164GetChipString(void)
 }
 
 /*
- *  sii164SetPower
+ *  sii164_set_power
  *      This function sets the power configuration of the DVI Controller Chip.
  *
  *  Input:
  *      powerUp - Flag to set the power down or up
  */
-void sii164SetPower(unsigned char powerUp)
+void sii164_set_power(unsigned char powerUp)
 {
 	unsigned char config;
 
diff --git a/drivers/staging/sm750fb/ddk750_sii164.h b/drivers/staging/sm750fb/ddk750_sii164.h
index 7a71f94a1e9b..45a90489c95c 100644
--- a/drivers/staging/sm750fb/ddk750_sii164.h
+++ b/drivers/staging/sm750fb/ddk750_sii164.h
@@ -33,7 +33,7 @@ unsigned short sii164_get_device_id(void);
 #ifdef SII164_FULL_FUNCTIONS
 void sii164_reset_chip(void);
 char *sii164GetChipString(void);
-void sii164SetPower(unsigned char powerUp);
+void sii164_set_power(unsigned char powerUp);
 void sii164EnableHotPlugDetection(unsigned char enableHotPlug);
 unsigned char sii164IsConnected(void);
 unsigned char sii164CheckInterrupt(void);
-- 
2.39.5

