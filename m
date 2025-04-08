Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1709F26A1A4;
	Tue,  8 Apr 2025 10:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744107659; cv=none; b=AFYijgcqwUrRe96P0QgZc2aMUGV1KO0TF8CbXXuIbEZ5DnhGjXmzg5BdOBPcwsKS8H5RvtQLq0dOYaqx9GAtrud7COXEKmzNerHCAuHqusKYXhi1c0Pr4eW8XLQt3ogwaEJMpNsoSOScjVZ6b7cB4FeyeuAgOQzECaciRdHEVuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744107659; c=relaxed/simple;
	bh=gcvZnMhtR0XkyTMXHmFjgItkzTjcKo4d+SyWoFfroaA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iPuGfZc9ZkgtjPwHxyD6F+XyTe8SFoXH3NwMeubJ4qUJ4GJG3CfE1VSFpegZIQ9wQnibcWZU5iw1CparJcYgtIOVYes/gWCHtgNRdxgu8izTiT+SF7ygyH/p2LbCRqyDEK9zhl6LlEcKw3tPcjbNqkb9Bo+628QNyn2PKeYMQuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HMC/2SV1; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HMC/2SV1"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43ce70f9afbso58321605e9.0;
        Tue, 08 Apr 2025 03:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744107656; x=1744712456; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NZIIlDBSj3POSZxjDzaSA5f1J19DQOtsWmRISrShn7M=;
        b=HMC/2SV1GMnrD3fNjmZO4lVpt3HgMz73f8N5Zonlnm2gkMAriV0lvhiSydC4xDWLdo
         8ohKbNvU+anwaKlRG6o/X0RvsfNvE1cOt33Homsa0ZeloVLFS0s09WCVuTa4sWhAulCG
         ZxyuISiIX5P/imOatGNToP5aG0un8O7rbaATPWwCLgeQEt25mJf3J7ugniRqv27edsry
         rfGb0kr5j/lAGQ/3PWlB4wAIHTQ8unj/RBxhY+cgI5IS2slgcUqpsywskvNsYPuiLRwk
         275Nhf0C4LA7PuT/MPNpdnDPjepb3MPId2C6a6ZkHMyAQ15/+ZDmHgCeRjc1tEMj6/vx
         S3og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744107656; x=1744712456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NZIIlDBSj3POSZxjDzaSA5f1J19DQOtsWmRISrShn7M=;
        b=VyNmqO+796v7K7TNYzjPLFgc+GtWIj0L/Ghpi5NCFJMjU1vsyDYwbehxieUvK5x9UB
         xRzh9Ws/xvBL+D8cdunUj3IyrDm1z9swUG1zZZSsj8KH6Oxj3dQUEnRw1iqvZ3zKJPYQ
         lEj88/HozTw6ZjWtkNo70MxkbeVAGWByJpLFuZN3wLzUoUtKLeBx89RiJJzdLarLryuF
         /Ci29XV98Neft4U3NITkKZiS+nRYjmr2UJX4F76K6rFpRhsfvGKqTuXf8geoeNtw+MIB
         E7Xxpcwz38uIxdEcgHb0LZzmSWSJZd6Jm4RQrMRpKvpPjTtZC9FvC1VMuMKtc/oUNm58
         oJdA==
X-Forwarded-Encrypted: i=1; AJvYcCWwuYFRuguVK6Oxm/6xHRaaPRQccGQ47od7Gk9EWaZKDmioZWJlkGGkQi5KjTBVczst9xAJruyAGPbGuj+F@lists.linux.dev
X-Gm-Message-State: AOJu0YzI9lgREaT1QuUW3PpLuNIw4Dny/nLoM8M3aL/UTOccQlLTA94u
	zVOQlqr17tNVYCOygByztLEP1lXkzpej5ly749yr242gTWZQqf2i
X-Gm-Gg: ASbGnctkwIe5A0naBJIV1O9gcsbvdGqmcYKQj2ttQXqKFCEFy4ABI5uTkn5+npU+ylz
	tcYXCziV4+s6P3lKJSz5t7W4DQ0Ro1PmnrWeMHoLo7rpgyfJ/Y3uXwkBelxUhYa1UixrfQVg4Xu
	7W6gljpNNczawOFleMHROQ1r3FlJ9hruwYKcNC25DVGFslIy84oMJfbhBr9i87xum2Kee8CTHCv
	SWtY8wL4ZE6qEYUZz4GS67jLbgRcQYdzrq8aTH+VBIDJILJxau2XV+TrIxT8dKOUE7JZ/e7PbXq
	lZWdZxPk0Bm3zLCuczbHcFIy4M0=
X-Google-Smtp-Source: AGHT+IEsp9oOK66ROaMwepC3KzcapxT4l5rsKcKJpFOCzLDlNEmLKAbmgtEhBVuTg0sksgQ9nQYYCg==
X-Received: by 2002:a05:600c:500a:b0:43b:ce3c:19d0 with SMTP id 5b1f17b1804b1-43ed0da06f1mr140654805e9.29.1744107656181;
        Tue, 08 Apr 2025 03:20:56 -0700 (PDT)
Received: from parrot ([105.113.112.27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eda4662a0sm118419515e9.36.2025.04.08.03.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 03:20:55 -0700 (PDT)
From: Richard Akintola <princerichard17a@gmail.com>
To: outreachy@lists.linux.dev
Cc: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Richard Akintola <princerichard17a@gmail.com>
Subject: [PATCH v2 2/8] staging: sm750fb: change sii164ResetChip to snake_case
Date: Tue,  8 Apr 2025 11:20:34 +0100
Message-Id: <0974eb17fa67b707e8d2972668da4d8a692a9702.1744105388.git.princerichard17a@gmail.com>
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

Change camelCase function name sii164ResetChip to sii164_reset_chip
to conform to kernel code styles as reported by checkpatch.pl

CHECK: Avoid camelCase: <sii164ResetChip>

Signed-off-by: Richard Akintola <princerichard17a@gmail.com>
---
 drivers/staging/sm750fb/ddk750_dvi.c    | 2 +-
 drivers/staging/sm750fb/ddk750_sii164.c | 4 ++--
 drivers/staging/sm750fb/ddk750_sii164.h | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/sm750fb/ddk750_dvi.c b/drivers/staging/sm750fb/ddk750_dvi.c
index 3fb14eff2de1..6dee95e60a6e 100644
--- a/drivers/staging/sm750fb/ddk750_dvi.c
+++ b/drivers/staging/sm750fb/ddk750_dvi.c
@@ -18,7 +18,7 @@ static struct dvi_ctrl_device dcft_supported_dvi_controller[] = {
 		.get_vendor_id = sii164_get_vendor_id,
 		.get_device_id = sii164_get_device_id,
 #ifdef SII164_FULL_FUNCTIONS
-		.reset_chip = sii164ResetChip,
+		.reset_chip = sii164_reset_chip,
 		.get_chip_string = sii164GetChipString,
 		.set_power = sii164SetPower,
 		.enable_hot_plug_detection = sii164EnableHotPlugDetection,
diff --git a/drivers/staging/sm750fb/ddk750_sii164.c b/drivers/staging/sm750fb/ddk750_sii164.c
index 223c181dc649..284c32f7e9b4 100644
--- a/drivers/staging/sm750fb/ddk750_sii164.c
+++ b/drivers/staging/sm750fb/ddk750_sii164.c
@@ -250,10 +250,10 @@ long sii164_init_chip(unsigned char edge_select,
 #ifdef SII164_FULL_FUNCTIONS
 
 /*
- *  sii164ResetChip
+ *  sii164_reset_chip
  *      This function resets the DVI Controller Chip.
  */
-void sii164ResetChip(void)
+void sii164_reset_chip(void)
 {
 	/* Power down */
 	sii164SetPower(0);
diff --git a/drivers/staging/sm750fb/ddk750_sii164.h b/drivers/staging/sm750fb/ddk750_sii164.h
index a76091f6622b..7a71f94a1e9b 100644
--- a/drivers/staging/sm750fb/ddk750_sii164.h
+++ b/drivers/staging/sm750fb/ddk750_sii164.h
@@ -31,7 +31,7 @@ unsigned short sii164_get_vendor_id(void);
 unsigned short sii164_get_device_id(void);
 
 #ifdef SII164_FULL_FUNCTIONS
-void sii164ResetChip(void);
+void sii164_reset_chip(void);
 char *sii164GetChipString(void);
 void sii164SetPower(unsigned char powerUp);
 void sii164EnableHotPlugDetection(unsigned char enableHotPlug);
-- 
2.39.5

