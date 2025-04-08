Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8DF26B0B2;
	Tue,  8 Apr 2025 10:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744107673; cv=none; b=GQD1zM2+WYc1fU6Z7yeXTnVG+PzULDYgfzlv2t8eN/MSsAFWWWvjDzU22gwjLHfCZvWP1J8p8V/5ppjmcdif1vu/LyYqZeFg4A6uvgvLWTKLsERCOYb9fTEUiuQmKUBEvQ3oXbnobYOXmEGs0EDcxTatYvfhIioh/L54XCB9xUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744107673; c=relaxed/simple;
	bh=z46nsSq1v/0fvClzA4Zas3TDcqFixPfx6NddUMaqlWc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Py8nE1rzpLzra7U0AbAVgT83TAaRWWrh6o0zZmqDlAh2HKsGjkv9F3RJL8ulQZCd+JfYnN2j2c3/0aw1TINGbtRBk8yU8D6dGz0osaUYn9gBVSi5bMSkhiVBcGbh0i5uUw2oDZmbzDHUJMZGRyFazcZgPm/5w1LlG50u7mbGs/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bhwewRXG; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bhwewRXG"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-39c31e4c3e5so3297524f8f.0;
        Tue, 08 Apr 2025 03:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744107669; x=1744712469; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pxfh28JgrgsZ43718+Rog7hGuSrWMc3dc3Cy5VLEAE8=;
        b=bhwewRXGDb9D2IY+nyDrX1Tn2WOM9FhK49thJOU13SWu4/IK1m1d7f37Sdbv7uYK5S
         p30o3u2SbRHXvBsDAob5h9Y+ASZHfcsueWymlnG3hKRTPtvp8nbqMzNiuuwKrAT7C4Np
         a/u7AGHNEcXUcxiYayOQSNScCVD5YcXvx3X/ZpjbBs+EfCQAoFBXvR/z/BMGdYi55jSc
         UeS6TgglsO24lKiw4tIJqKgKc0LpL/Abzd5cvDEgfhFNk1zpJemvlL5V2D1cZmmxDcFs
         KZU9ZLkSZVYgeund0TH1Lm3bFTnOJMUiRGNnEmY4s2D+Eh/C3hP7ugO+LctDSpnaEXbt
         YCgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744107669; x=1744712469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pxfh28JgrgsZ43718+Rog7hGuSrWMc3dc3Cy5VLEAE8=;
        b=qTbOPIdvnzP33YwmyHx6H0dqYmFEcMGmI8TKcAsuxzlYTEWEAEYkqgHLcglaamPLV7
         rkFiFhwXZ/G6Pgk4T+m5JrwlUVz6JGJ4vyFnglQDoznG63VLAEMqzBgJPBS3DySXQOU/
         XxGBgomhjYgpYCS0dc3HdJsCPnK50etN/d6Kw6GzldibW5ZjEtzjnGcsNbjxxs/HlwVs
         qA67xnUkbUnlUmAsw9zNBDGiykdlrSdvbHczZx16mUhqy5VMlynaujhji6VDQ5fE/fLK
         IDLXNsxtya6D22cfkt6LzDRffD0S0vteTc6Vw1juLHxyuIM7kNY/QgB/wrTFjOaCt/h/
         yrwA==
X-Forwarded-Encrypted: i=1; AJvYcCU5FAWCT+JMLHDzXfLJxkiw1zKHgfrqC/leWruzUMcz3ThrkaUMjhkciIFUIfc6b1wyyWbXeZDNVvo98UFZ@lists.linux.dev
X-Gm-Message-State: AOJu0YxglffpKWOoGDM5YG+K5olBL3xJ3TlzcGNoBLqABPVS/8dGwovS
	JQJfv91r2/5uKraqJJb8aAz/ZKlHtyb4FLegTfukvXm/kgrY5yYG
X-Gm-Gg: ASbGncsNWp37/4dr/LxH6ps7OSPfMV8dYj11ELAWTAs/N1RirMCEt8Ro+seipLBBJYn
	wVqaweAQSwhOkbC62e7EuKUdqhvs9x+dmYAYD7gGmkiXPtKyX16aKxVNZSENc9xKXNBGuYFuADb
	CLWbsApa8kqxn++TTte2VqZP9mfV3hF2lzlftc26s/eZEFahFvLZoGf/WUsjaR/J/L43M39E6CR
	Y3+I9WgAjQJlye2zASXrhsRPmV7Yrv93hpZBEHJ5FWEMjrVU4koE1b81lGU9U5t0gGEDE/vdMWF
	I1FfukoehrmsBNl/6AUnunxmxowSGxKHZCyPOg==
X-Google-Smtp-Source: AGHT+IFf6CCKvSyFrEYGPGQBPp88hffbcUboIMSgf4Sk5w8+BNkWkOTjOCzvdY6zQ2+FNkJ2K5ILeg==
X-Received: by 2002:a05:6000:1867:b0:39c:2688:6edd with SMTP id ffacd0b85a97d-39cb3595c48mr13429981f8f.15.1744107669289;
        Tue, 08 Apr 2025 03:21:09 -0700 (PDT)
Received: from parrot ([105.113.112.27])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30096889sm14331737f8f.2.2025.04.08.03.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 03:21:09 -0700 (PDT)
From: Richard Akintola <princerichard17a@gmail.com>
To: outreachy@lists.linux.dev
Cc: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Richard Akintola <princerichard17a@gmail.com>
Subject: [PATCH v2 6/8] staging: sm750fb: change sii164IsConnected to snake_case
Date: Tue,  8 Apr 2025 11:20:38 +0100
Message-Id: <05de0fb87ed53015cd01ef9460996597ef1e09c8.1744105389.git.princerichard17a@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1744105388.git.princerichard17a@gmail.com>
References: <cover.1744105388.git.princerichard17a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change camelCase function name sii164IsConnected to sii164_is_connected
to conform to kernel code styles as reported by checkpatch.pl

CHECK: Avoid camelCase: <sii164IsConnected>

Signed-off-by: Richard Akintola <princerichard17a@gmail.com>
---
 drivers/staging/sm750fb/ddk750_dvi.c    | 2 +-
 drivers/staging/sm750fb/ddk750_sii164.c | 4 ++--
 drivers/staging/sm750fb/ddk750_sii164.h | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/sm750fb/ddk750_dvi.c b/drivers/staging/sm750fb/ddk750_dvi.c
index 1ce44c50617a..ac1aab77da28 100644
--- a/drivers/staging/sm750fb/ddk750_dvi.c
+++ b/drivers/staging/sm750fb/ddk750_dvi.c
@@ -22,7 +22,7 @@ static struct dvi_ctrl_device dcft_supported_dvi_controller[] = {
 		.get_chip_string = sii164_get_chip_string,
 		.set_power = sii164_set_power,
 		.enable_hot_plug_detection = sii164_enable_hot_plug_detection,
-		.is_connected = sii164IsConnected,
+		.is_connected = sii164_is_connected,
 		.check_interrupt = sii164CheckInterrupt,
 		.clear_interrupt = sii164ClearInterrupt,
 #endif
diff --git a/drivers/staging/sm750fb/ddk750_sii164.c b/drivers/staging/sm750fb/ddk750_sii164.c
index c8db6ceee9af..6ce15b7816d9 100644
--- a/drivers/staging/sm750fb/ddk750_sii164.c
+++ b/drivers/staging/sm750fb/ddk750_sii164.c
@@ -350,14 +350,14 @@ void sii164_enable_hot_plug_detection(unsigned char enable_hot_plug)
 }
 
 /*
- *  sii164IsConnected
+ *  sii164_is_connected
  *      Check if the DVI Monitor is connected.
  *
  *  Output:
  *      0   - Not Connected
  *      1   - Connected
  */
-unsigned char sii164IsConnected(void)
+unsigned char sii164_is_connected(void)
 {
 	unsigned char hotPlugValue;
 
diff --git a/drivers/staging/sm750fb/ddk750_sii164.h b/drivers/staging/sm750fb/ddk750_sii164.h
index 9e289bf4a78e..90b7ae823a10 100644
--- a/drivers/staging/sm750fb/ddk750_sii164.h
+++ b/drivers/staging/sm750fb/ddk750_sii164.h
@@ -35,7 +35,7 @@ void sii164_reset_chip(void);
 char *sii164_get_chip_string(void);
 void sii164_set_power(unsigned char powerUp);
 void sii164_enable_hot_plug_detection(unsigned char enable_hot_plug);
-unsigned char sii164IsConnected(void);
+unsigned char sii164_is_connected(void);
 unsigned char sii164CheckInterrupt(void);
 void sii164ClearInterrupt(void);
 #endif
-- 
2.39.5

