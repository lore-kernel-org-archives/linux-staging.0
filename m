Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B3E1F55EB;
	Sat,  5 Apr 2025 13:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743858257; cv=none; b=dlNMRMvghPkRFQLOu6Z25AePH8+6Ya+6NRwKGbZwJzaHb6Uhn2VD1gER9Xufrb6KSUeiy3ovc56QIMG5aS7+IOeHTVCRjXGdxwZWW/lF5Q4kQkimj7TCPefxaC/g6dNNInyTvvHiPE+eLK4QyYyv3YwR7YJm2bx+9l7S4Er5S2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743858257; c=relaxed/simple;
	bh=u6zEX+t1aVIDzy0JiAoJ7d4d/Fs9Xyppen8tPxxJuLg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TRhPPDit5CZQcDj/aZrAukPMka0w/jV2id12JRI3FlE8v9mMcOx9PRNq6EwcIE1abFz3RSozKr0ouRYxMajTl7bUg0N6NO4dd2EFObYTo9Ak1d7TH0iodMpl0/p1WuUAtgzPXzOw/beu0W0ko2ygWB+mj3JLmuWa9NfFNR/T+KM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OsL7y2el; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OsL7y2el"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43d0618746bso20252685e9.2;
        Sat, 05 Apr 2025 06:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743858254; x=1744463054; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nvS5tdlccUpYMdewqVDUL2P1AZVRPsP3RNJi07oU4SQ=;
        b=OsL7y2ellYlBZqjd3a6bq6VHAep2HjYEfLfIqPIFqjCh8Ui6Hjhz0tvpy16P6zoDz3
         +1yKgmr+zTtVffX1RceAB5y92tDLtbXGUOlnqNH00i+JOsUDpDdrT9I9tJTgBDKjuSIr
         iJYKAt6ToBYNj5qI9BpPGjdF7Mm/ip4Opbh5cM9xW4UpVZK8JVo9hVn0nD2z94gwhZs4
         2g+KngUPgPJip/byoySDW4VFYckPtK943wgPEhkGQ9VDhWdf2sFipJILIUshWptq5VVt
         4/JJ47Dv9NbAIsRfH2d0fa9L4mG+ZyzTPvQ4/EsxGdw4fYSKbEqbeNt0HZg30oMmv5R0
         z6CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743858254; x=1744463054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nvS5tdlccUpYMdewqVDUL2P1AZVRPsP3RNJi07oU4SQ=;
        b=Kan7EEKyn9Cw6XAEi1ROE+Tso2a6rjXxeVi5fKxDtzvgSr5iBSt2vccXlKpcZScYO9
         dgJk/5J8+GrmRrSO4eQFanHZ7u+dqgVkLqoDE+mIlxhlTEiGCTD2gHDepcRzPHo1yQgj
         FUFq/JIodppBHGDZQMA4WUaqG7+5sScZqcEsMJR5sF+BojkcmbWMz6BF7hBP0WS17K7X
         1eFtm7M9faFAUV3GOORbLa/rv9SppZSGopeRDH3ihf4BRI6wLhircV50yBo9WrmBJiA+
         NPqYCoOKD6mMALYsoAjkiXMuU9/88rJ9S+FWe9xPunTYVAJ9CNY96Fjg416VxebQRG5S
         KGig==
X-Forwarded-Encrypted: i=1; AJvYcCV359WyOpfXq5oWYNbYGB8xmsjoa3LGzTtEef5rkgKyoY1/gtgAox3KfMuvjAEyL+aTnVhgGbTBje2jkuUV@lists.linux.dev
X-Gm-Message-State: AOJu0Yz4DkvzsbdxBS+zMTZDw1YggYfQk6II8ggO6qsBRrWYhEFBBKpM
	NwnCapm+tQnE5RT7zufUWa5qp6gU9yfM+IoCX19DkH5r/uZOlaX5
X-Gm-Gg: ASbGncvTIq2yD+LGCWyr772XlWLHJLngXSV/HGe4cODH9c0YIML1brwDlK/s9V0cHQy
	TEDEur4VPJIcehi4lFnz/v19WqcGWLCLlDfFatqTAG+McdSnubG5vThH7US00sOhaxJeZO4wFG4
	8WWJwORw0fgfx3OPDPruo2df0CwnVq7rkd+J2dWqeyIrfmoRF907QnLKM2YUXtXWbYyhP7AkcuH
	rZO7R8j1n30+1YwL+xHOmeFIOKejEyKbi3aYWa9whe1EOieNVrj5FU2I/2H2y8Cxd8zPea8Ngxk
	crJJZ/ULzh9tA2E0qSlgrwKcvAtm/6EqnvpQ
X-Google-Smtp-Source: AGHT+IHOwYmH927340bzKQVz2LAlQfBxREpeEz9WgBTxIKQAqpKwCdhf1W12WOkzi9kwshim3Iz1ew==
X-Received: by 2002:a05:600c:a0a:b0:43c:f689:dd with SMTP id 5b1f17b1804b1-43ecf8d0a37mr51510425e9.19.1743858253423;
        Sat, 05 Apr 2025 06:04:13 -0700 (PDT)
Received: from parrot ([105.112.71.96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec366b571sm73287435e9.40.2025.04.05.06.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 06:04:13 -0700 (PDT)
From: Richard Akintola <princerichard17a@gmail.com>
To: outreachy@lists.linux.dev
Cc: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Richard Akintola <princerichard17a@gmail.com>
Subject: [PATCH 8/8] staging: sm750fb: change sii164ClearInterrupt to snake_case
Date: Sat,  5 Apr 2025 14:00:59 +0100
Message-Id: <549b645b265edcb793458a534427f75f0ea343c4.1743857160.git.princerichard17a@gmail.com>
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

Change camelCase function name sii164ClearInterrupt to
sii164_clear_interrupt in order to conform to kernel code styles
as reported by checkpatch.pl

CHECK: Avoid camelCase: <sii164ClearInterrupt>

Signed-off-by: Richard Akintola <princerichard17a@gmail.com>
---
 drivers/staging/sm750fb/ddk750_dvi.c    | 2 +-
 drivers/staging/sm750fb/ddk750_sii164.c | 4 ++--
 drivers/staging/sm750fb/ddk750_sii164.h | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/sm750fb/ddk750_dvi.c b/drivers/staging/sm750fb/ddk750_dvi.c
index 1def02be4cce..6fef1ab484c1 100644
--- a/drivers/staging/sm750fb/ddk750_dvi.c
+++ b/drivers/staging/sm750fb/ddk750_dvi.c
@@ -24,7 +24,7 @@ static struct dvi_ctrl_device dcft_supported_dvi_controller[] = {
 		.enable_hot_plug_detection = sii164_enable_hot_plug_detection,
 		.is_connected = sii164_is_connected,
 		.check_interrupt = sii164_check_interrupt,
-		.clear_interrupt = sii164ClearInterrupt,
+		.clear_interrupt = sii164_clear_interrupt,
 #endif
 	},
 #endif
diff --git a/drivers/staging/sm750fb/ddk750_sii164.c b/drivers/staging/sm750fb/ddk750_sii164.c
index aebde3d8b903..fc725a9952d4 100644
--- a/drivers/staging/sm750fb/ddk750_sii164.c
+++ b/drivers/staging/sm750fb/ddk750_sii164.c
@@ -390,10 +390,10 @@ unsigned char sii164_check_interrupt(void)
 }
 
 /*
- *  sii164ClearInterrupt
+ *  sii164_clear_interrupt
  *      Clear the hot plug interrupt.
  */
-void sii164ClearInterrupt(void)
+void sii164_clear_interrupt(void)
 {
 	unsigned char detectReg;
 
diff --git a/drivers/staging/sm750fb/ddk750_sii164.h b/drivers/staging/sm750fb/ddk750_sii164.h
index aa3f34c13979..ebc173658f0e 100644
--- a/drivers/staging/sm750fb/ddk750_sii164.h
+++ b/drivers/staging/sm750fb/ddk750_sii164.h
@@ -37,7 +37,7 @@ void sii164_set_power(unsigned char powerUp);
 void sii164_enable_hot_plug_detection(unsigned char enable_hot_plug);
 unsigned char sii164_is_connected(void);
 unsigned char sii164_check_interrupt(void);
-void sii164ClearInterrupt(void);
+void sii164_clear_interrupt(void);
 #endif
 /*
  * below register definition is used for
-- 
2.39.5

