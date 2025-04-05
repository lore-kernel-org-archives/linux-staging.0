Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491F71F462D;
	Sat,  5 Apr 2025 13:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743858247; cv=none; b=gYDtuXPcOxsckB4mV35RlnV0gZlXwsqR9LNNtAujFmSWGejByECUdKeuSE6gbUJOUhiTfglQ+vDre+jBbudBteNc0jSQ1IeipVGdBiFS5NhhXbH7/yJBo5DVbZzXd0g8yx0sQTI4/1P/lqSK4Dur4uIfBN3gyJ9JJ0Sj4R37DTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743858247; c=relaxed/simple;
	bh=z46nsSq1v/0fvClzA4Zas3TDcqFixPfx6NddUMaqlWc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aY+QOKI4jsfOvAmXFkOytislXjqb07gl1fgMnLwF2PBlhxo6hCvDe8wHnrYklIoWq3oMl7+VCSfkccSIabL0zqGacS2U0WV122typuqMr+eC+v/IN7xgWbtJIgISLOGi5tz9RLqTZlv25F/BWKSstJV+nxwUSQJTEuEopYwlGAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kzNY9/aX; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kzNY9/aX"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-399737f4fa4so1690116f8f.0;
        Sat, 05 Apr 2025 06:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743858244; x=1744463044; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pxfh28JgrgsZ43718+Rog7hGuSrWMc3dc3Cy5VLEAE8=;
        b=kzNY9/aXBbSo9JGi0UyoR72F4e3mFwrkEvwrF6v8D74RJmjS5M/cKhCcpZ61nYaQEx
         b683hP/a4xTDa8avWItps2sAvAyaz5kJRjaDxJZhJJhnFyoCSrGDONVUaLlL5uEr6ous
         U0LpDgAgHrFdxJygHj0SEQmYie3mnaZ0lcTFx9+XfuHGqEE3Fkm6xGxOVhlawdA8YNLv
         sYhWwHlBtC1qr/3QzWdz9udYIjLkoPms/EI2pvbqZ1o6wJ8REywC4BopKIDWmfXbhlI5
         Cpqz2SCQ922B1SZyrRLJkQ+8JO8YaFWkagtR0FrNEuL6kwQD1afD3XCPjuc04tCA0lLz
         2jEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743858244; x=1744463044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pxfh28JgrgsZ43718+Rog7hGuSrWMc3dc3Cy5VLEAE8=;
        b=JulXI3OYUoXX3jv+PCTn+fotqboXGH+IzNNCR7g5ZTJHNCvSZBw9LgZfW3EMTD5Err
         vAEnfXRoGAN4AvP3CSFfwE7H942QfZercj9uRKYOlc7tUkFg4YMEarQwZdN+4tQBRdha
         aofAAFzfwcQv93w+RvIUvAqIfamUWCjPYa0rAW4YjsJVycn/lcUVqllB0C8eBMRTHOB6
         e8RzVNTxKNbQPZ12uFsTtsOohY45X+WLOw+XMTXbJMBDBHGpppqJBFRXLQYBR4PVw1Lr
         w9OwsK3vAcYVnXl0u6pP2WHqqL8PjI5tMANbVUAW0HnLIi2DHwCm1Zw+HmjrBzNXGQiM
         fjiw==
X-Forwarded-Encrypted: i=1; AJvYcCWbfCDRKC5/JHcAwKpyYorkXUFo9IGCzVauArtPd/uosFZ41LJ17yj9og0bSEoBPPAu8Z5N4kFgVDLXSJ0L@lists.linux.dev
X-Gm-Message-State: AOJu0YwkMcQvzcdeMtPITsBM26CV3CULDCggM1+LtK1LlyKy+TRo5hcY
	HqRpxBR9qnZdoDDpriRCdD6GSXxC6IYYXy9kQ2JTkL2l/vGISdhJ
X-Gm-Gg: ASbGnctGt6fxEXgIC1ndkvsQxdDKblMVADG0EhjA/5Q4XZwgvg1KFRxzium8bbM0N8W
	yQQxn8GXm5SsALetoL3FG3cn5Jg+WiWClfcLQrRdfKkewpDAV3cit1DrZIAPLXARDtHZV26lvxh
	0uEVhywcwAA7WNUgfh2xG+MDs2zaN1voLb3UU89SFvDiuTNez1w/aRu44vtMGiLt4NScMX1OEHZ
	qOaO+Rlq+UljM7SfRrsV6HT4rba6oDpJJudR2TP4JJ7U8yb7yK3lKjNNLQkb27AZ0YzK18YFKOa
	BYCtWog0RoCKhlgzjT/NKILmmg==
X-Google-Smtp-Source: AGHT+IHp2ifiZ/9ShiKCeTO0TCWC4tiuyrTuNMDGeDxptSNFiNVkqkoRgcTZPKMSoLltQhDn++s3vQ==
X-Received: by 2002:a05:6000:2486:b0:390:f699:8c27 with SMTP id ffacd0b85a97d-39d07ad5183mr4714928f8f.12.1743858244452;
        Sat, 05 Apr 2025 06:04:04 -0700 (PDT)
Received: from parrot ([105.112.71.96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301b8ae1sm6972141f8f.51.2025.04.05.06.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 06:04:04 -0700 (PDT)
From: Richard Akintola <princerichard17a@gmail.com>
To: outreachy@lists.linux.dev
Cc: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Richard Akintola <princerichard17a@gmail.com>
Subject: [PATCH 6/8] staging: sm750fb: change sii164IsConnected to snake_case
Date: Sat,  5 Apr 2025 14:00:57 +0100
Message-Id: <05de0fb87ed53015cd01ef9460996597ef1e09c8.1743857160.git.princerichard17a@gmail.com>
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

