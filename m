Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C92E26A1C4;
	Tue,  8 Apr 2025 10:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744107663; cv=none; b=E72d7LpdCyCskdVC7pd6+UvwVzV3jNZLYVy4h1Jphw6Vj6dB7xcLYqiYTEbel8vEkAgHMGPB7MdOl6exyz0JWP0MVS5CdpJ+12kgSYTN2KomFdY3XP7kV+tfP7Byvapi7cVVhx9VbRYne4QOQZ8XhKrj09O+o56VrI76HYjGZMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744107663; c=relaxed/simple;
	bh=vQj84IzAyMbsqXmdqTC73l509pCAn1/REbFySFYyqoE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IljFcnul1PZxgf1ic8Apzt6Iz7xZrV8INodtHiZ1iBVjX0cHXXlu5urBa19bHUz2vk+2vlBtEYVtrVZTpz4yF+SJiGlS7rnM0bpnXoV+9JDuevn7h99HOwQOuHc/ZImosnSc6fakeMMgRwJb0Cq1a/WBqA7Lnq1QCPOcRGeq5yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kWO8vSd6; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kWO8vSd6"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-391342fc1f6so4725113f8f.1;
        Tue, 08 Apr 2025 03:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744107660; x=1744712460; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zir1NDA8An9XMiM9quRa114yNTaeYbAjAw+vpjLNbb0=;
        b=kWO8vSd60clInOG+X7tyW3YQrp2Ouyy+l81Zd8jIIwDFY0dPUWWyWxAmI0N1MHvsEL
         Nkt18SXhSSlfJtv/gF7M5RaV8hMaf48D1N6P/u8cKKS9LiHcNOylhtKdWJyzZSndgeFE
         fcZRiiRB6WQ3JjvoQYGOfd4QLcar6nyHllkQDzJO2Mdlkd+fnigsrwgk8g5rQvS07UNS
         vpwk26EwhnFJP2CbD9oFXdmZeqyNQbLWn5sMsXiDMw9a2acStIwGB30gSdyU92YnWDWu
         HGm4nZTi23dogWUB4zXn1tQ00/bDA0PlzLEsXvmM/H3xpZ+z2hPd18u7byIV8iAJNopk
         r8Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744107660; x=1744712460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zir1NDA8An9XMiM9quRa114yNTaeYbAjAw+vpjLNbb0=;
        b=WKcFz9x812FWQT5xqFycB568yvPaMRFZpLbD3dkjoHv/lOdlEJXs4ommMpXG90LAA7
         /6TF5Axdk2apmkscA3P+rY1iObfwwNM4mG2vgCOIHYRVYQfuf2v6I5ef/4t0tz0/ZxZs
         Yu0sSAZcIYafV1AcRYuqVoI/ckFbZqdzP4tj4m5aL2r+f9DM9LPXTIqlExYf0S1X5R1m
         Rd7Jt186Kh/lkNl5I6rkaJGDlHUi7dUt+qJNGmPgcShiBucZuhlDR9lptZO49gcHYUIV
         rADFdFjIHVLxy+6ClRR8l2+DRfRFwKBIfcfCET0CUV/bCaBqsM5ehu+Ou4qF3aMX97tB
         Ma8w==
X-Forwarded-Encrypted: i=1; AJvYcCW8I6Mzid89vHnmiBjq9stMyeOSm1lQLQOcs7nDrWU+Pqtgm6bFlwPIgcnWjmjKMz2xkfo7A0ZZCg+YfbZ1@lists.linux.dev
X-Gm-Message-State: AOJu0Yxi2zwQaL7GAbTN4TrRc8u9z++VIZ9+F1HLDF98pZsDrg3DL349
	uzR9b0uS8dldL+PQUwyvZ6nlGFYjbZNl7Z7JMkdvKycTmV70qOrv
X-Gm-Gg: ASbGncsjWAjuRY+FzGHe7XzX5PpCELekcLuwJzZgYhU/F/e5ApAZ2V7FQAWZW9fFRbL
	ZMCxi/mg/FFkT+YGfGKaxmPlF8QMlzno7hHuf54Nz3Wv9/JGVIVMJYl5M+HMY5wVkFGrFYw6Epe
	n777RfttW9RlzlUSgNjbZZ6bcly5zhnrj0wXSLt0bOeH68wiBBEY6S9bfieS3GsyUhwTvWnQaVJ
	okY0dMnujDC3ynFqepr8ZFHCO+eAs0dzgD8QRH+vbHID2gQ1UE8ICzcEZGUtMWn+w2rrUIPg4i3
	+clJo0z64R2MksDbMl0CELBmy4g=
X-Google-Smtp-Source: AGHT+IEu2euszzA8Yiv9jnmNk/SqKLPj/4vJpLQXYyX1OdPyxjTTbritL26fMZaSdOJzhMqOhM8lCg==
X-Received: by 2002:a05:6000:430b:b0:39c:13f5:dba0 with SMTP id ffacd0b85a97d-39d0de16c5amr13236038f8f.13.1744107659699;
        Tue, 08 Apr 2025 03:20:59 -0700 (PDT)
Received: from parrot ([105.113.112.27])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020da17sm14592160f8f.64.2025.04.08.03.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 03:20:59 -0700 (PDT)
From: Richard Akintola <princerichard17a@gmail.com>
To: outreachy@lists.linux.dev
Cc: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Richard Akintola <princerichard17a@gmail.com>
Subject: [PATCH v2 3/8] staging: sm750fb: change sii164SetPower to snake_case
Date: Tue,  8 Apr 2025 11:20:35 +0100
Message-Id: <90f9842254eb83c2dc19abcf5072aab9549026a9.1744105389.git.princerichard17a@gmail.com>
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

