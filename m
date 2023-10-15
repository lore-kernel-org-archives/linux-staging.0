Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F4FF9CD;
	Sun, 15 Oct 2023 20:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MF92gN89"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-9adb9fa7200so786647266b.0;
        Sun, 15 Oct 2023 13:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697400869; x=1698005669; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E01GM7WTt8O9z43gWlZ2wCLn5WJWwuOIiG1N7ZnbIAk=;
        b=MF92gN89ZoH2wwQzfEIiIvkxTBOrg/2/o6HHuZNkOPODI8zhGSyZimI13KvqC2S2zR
         /DGSffk2rC7B5AKb/F9PcLOk2He4QjyUK6tbSndIM+TBL6uLtUGoMFD0Mb8jOWCI2WaI
         g6MxOGlF3cyNw3YQSgxELSF57r/BUhCzw9u+XM2oFDIkABJwDXVXX/9gxIb0475WaHM2
         TFritc1eU7cmvWixyhx46jKY4kJklGO0+Ddvy7Dg0yCW/DpZUpz2fff8hVbxVr1k6yPa
         TfDYYhSMmf92tw80e73y3/OZG0IgLAzEwR+UwgRd8exBk4y6LYCi8gpnX8jTvT0JvJCy
         lZ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697400869; x=1698005669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E01GM7WTt8O9z43gWlZ2wCLn5WJWwuOIiG1N7ZnbIAk=;
        b=QJqJNmBPBeSZcz1xFO6xW3F+3JRb3cCHSLshkpMX6s6VQVCHPl4cm1CPY13r+gU5ZK
         HL7ke4OI8aOMjUf9NcKJ2gnjttu15AJRC8qtSk5xzcz/+Td5WccaYHCKaXVaEpmGbjFr
         560u09p1UV6S135Feh1aRf8WY9BG6exJfd9jGT/6XIobFjgHP+nMR5Fnwo9iTtGk3Xzc
         tivdvMTnn7cwiJzrGvjWPMf6M/FIrzK+WMWE3B7RElLVPybnM9nJ/eTy1TS4NfGexiSI
         5pPIYltyisjVLpLf/z9djIMi8faUXQqSQ4BC1UOaiKAd3ALAqnM9s+q5Coida665l6UQ
         er8w==
X-Gm-Message-State: AOJu0YwboUreCqXurBo1W/TG9kLgpIrjVSKNN0rXuw4fTZiBUtXiTeCy
	AqHu3Ud9BJvqZBWOEO1RZA==
X-Google-Smtp-Source: AGHT+IEzZG/3pGHapm1wmqB24H+D+DFxbgwenYhV7bi/4YFWFECn87yHreYV9h1q7mMoZz2ScF1V+w==
X-Received: by 2002:a17:907:1c10:b0:9a5:7dec:fab9 with SMTP id nc16-20020a1709071c1000b009a57decfab9mr5752145ejc.9.1697400869239;
        Sun, 15 Oct 2023 13:14:29 -0700 (PDT)
Received: from dorcaslitunya-virtual-machine.localdomain ([105.163.157.6])
        by smtp.gmail.com with ESMTPSA id m10-20020a170906234a00b009ae587ce133sm2721766eja.188.2023.10.15.13.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Oct 2023 13:14:28 -0700 (PDT)
From: Dorcas AnonoLitunya <anonolitunya@gmail.com>
To: 
Cc: anonolitunya@gmail.com,
	outreachy@lists.linux.dev,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] Staging: sm750fb: Rename displayControlAdjust_SM750E
Date: Sun, 15 Oct 2023 23:12:34 +0300
Message-ID: <16a9ad33ef67993482da0d350d7239aee3f0dd22.1697400022.git.anonolitunya@gmail.com>
X-Mailer: git-send-email 2.42.0.345.gaab89be2eb
In-Reply-To: <cover.1697400022.git.anonolitunya@gmail.com>
References: <cover.1697400022.git.anonolitunya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename function displayControlAdjust_SM750E to
display_control_adjust_SM750E.This follows snakecase naming convention
and ensures consistent naming style throughout the file.Issue by
checkpatch.

Mutes the following error:
CHECK:Avoid CamelCase: <displayControlAdjust_SM750E>

Signed-off-by: Dorcas AnonoLitunya <anonolitunya@gmail.com>
---
 drivers/staging/sm750fb/ddk750_mode.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/sm750fb/ddk750_mode.c b/drivers/staging/sm750fb/ddk750_mode.c
index e00a6cb31947..8708995f676c 100644
--- a/drivers/staging/sm750fb/ddk750_mode.c
+++ b/drivers/staging/sm750fb/ddk750_mode.c
@@ -14,8 +14,8 @@
  * in bit 29:27 of Display Control register.
  */
 static unsigned long
-displayControlAdjust_SM750LE(struct mode_parameter *pModeParam,
-			     unsigned long dispControl)
+display_control_adjust_SM750LE(struct mode_parameter *pModeParam,
+			       unsigned long dispControl)
 {
 	unsigned long x, y;
 
@@ -125,7 +125,7 @@ static int programModeRegisters(struct mode_parameter *pModeParam,
 			tmp |= DISPLAY_CTRL_HSYNC_PHASE;
 
 		if (sm750_get_chip_type() == SM750LE) {
-			displayControlAdjust_SM750LE(pModeParam, tmp);
+			display_control_adjust_SM750LE(pModeParam, tmp);
 		} else {
 			reg = peek32(CRT_DISPLAY_CTRL) &
 				~(DISPLAY_CTRL_VSYNC_PHASE |
-- 
2.42.0.345.gaab89be2eb

