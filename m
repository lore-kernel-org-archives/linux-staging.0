Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 376521F4E49;
	Sat,  5 Apr 2025 13:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743858252; cv=none; b=hU+2VRXbuz2t/B4/o/FTg30YwTJic13ME3HC6F1pG67LuyoUkcGRIe1k9fw/CX1t92VSkyfh+5dLomsKHzr2KIRdhCqONk33wWSOhvtkgVmNdLf4R7YEgwn4vq3a5CmaaxiEmARQM5JEvV6nge8bsWnrm67ZIb+41tYNOcAmDqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743858252; c=relaxed/simple;
	bh=JHgSmpHywThLvhaNGwqkN6rlBmIZHywWloaU6MKIwBE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jd8NpTy35eAICJANwa0TD0A2XinbxqVwqyuehUq9gnCyUddbNZlKeB26kw72DJdCzhuFM/nZQB882/yARv2SdykAV7SvchgZOjbeLvabcoet7B/hVd8OI+H0rR/tGdPVkoSPrBTwGz8SBNV9AEaPFuxc1b9u2X9aq04RtzuN1Uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QupnaVWg; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QupnaVWg"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-39c0dfba946so1827689f8f.3;
        Sat, 05 Apr 2025 06:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743858249; x=1744463049; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qAIrh/4WE88oUvyzDDtUAXVVh7UEV5wee/SgtjWD0Rc=;
        b=QupnaVWg1udqpWxYz/0rXb114oPzRnSvMFcpI05vHmiIE1iMYS5LVxyk6DkzK+bxlt
         Uf0rp/AAG2Km7ZnrGCo/TPILHkOEV9rMIi1jlnmfaPWDhtRigoXX3lpgaEWC2Q+LRyXg
         kqcNi+it5GEZkeiohEvzN5OtnIK+yvIvAy1fFHIfNRSMdtL8J4zSL9ojt/p1A8C2TeCA
         Cn53ENdfu1Nr9iF7qWLpaUpYDUiotvdfBZxZZfApY3pDuXZgSSyFYR3vo4fmYi7dRycI
         03yISwkQQhzYyXvqGcR5Pm7oWfmLQxRYHAaGNWqY4E0pkF1HV5UiMb5AUzS6rxn5W2yT
         Z6FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743858249; x=1744463049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qAIrh/4WE88oUvyzDDtUAXVVh7UEV5wee/SgtjWD0Rc=;
        b=beQ5HhbAd/exzOhQXjnxNmTfXM++HXWcXpPVIdFnDbnj3r7EGBm+inxHBix+CecSZW
         b/oUvxkEyKrBifOq89G8rEnO6lRL42TpN4iPj+IAHYZeWOU0KfKNNPJVUusK78WVkRkq
         bLaBVXlquGD4OKzJ8Dd9KoPrnp8KIWmrtg5sUHK5XrRL6rg1ZCfXOYPytLJf0GWezne7
         MeScBLxslzVpjnP7ZI0oxhT94Jc0rKoMagQBFiDtDa7eG0eU5DAmY69mQaeYG1cclXVx
         /PC2W3f6A6Enwxc7b3CvvACwfx6/rzY8TJwVs6HwrkPR4xrRjfWuCo7s6iB3TwTnhG1V
         HMZw==
X-Forwarded-Encrypted: i=1; AJvYcCUNWcqs7CggXGe9FFrLJAe+8ZjhCnP9krFWiqJbR2CkiS8VCPpPSs127XyMAwUPmKyC/rPO+tU/k55HnLc8@lists.linux.dev
X-Gm-Message-State: AOJu0YwRYvMFthALDFzSX9ZMrTJl6a9ocj9vCe1i3K1P3vnotKPtpL9r
	4xWlaR/TcxPVmYg33qIZZ2j8UBGdrKE1mcyzY7LArLBPzdVA3cfJ
X-Gm-Gg: ASbGncv+/vDMkNQ0XnOjimTL+2wkkQOeLae1WGOK8ZHVNfVHmxx9Zt4/GYOT2Psem3r
	N5caVYlhRKXbdTSiajCo1a1OVxPNjt1CGxvKNb3s1L//MPvjAB4Ye4szohr7Vt4EA8VHN8tuqpb
	svx0ywHzk/9PwQPGgFCvju4iNIsWfSxDZ61Fco462q+3PA2cAdsTW7Gx6xF3HIYHUBsBYJWOweJ
	imkWyFCICgP0ew45HxIakHgY1TkTbCjjsjFwkwttftqz1ZuY2Ofp0iI+mn69LnO1+Uysp5QUrbG
	FurAVwofh/DRGvsD5+MyGchlEQ==
X-Google-Smtp-Source: AGHT+IFy7/wUPqCvEakjCfStSAVFHHLZeyl0QNSgypg2iRDFE08Cl4cXLODnbt0O0X07/+O8L2IA3A==
X-Received: by 2002:a05:6000:4310:b0:39a:c9ac:cd3a with SMTP id ffacd0b85a97d-39cba93cf33mr5574261f8f.51.1743858249274;
        Sat, 05 Apr 2025 06:04:09 -0700 (PDT)
Received: from parrot ([105.112.71.96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec1795081sm77366675e9.27.2025.04.05.06.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 06:04:08 -0700 (PDT)
From: Richard Akintola <princerichard17a@gmail.com>
To: outreachy@lists.linux.dev
Cc: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Richard Akintola <princerichard17a@gmail.com>
Subject: [PATCH 7/8] staging: sm750fb: change sii164CheckInterrupt to snake_case
Date: Sat,  5 Apr 2025 14:00:58 +0100
Message-Id: <c5c01f1840ca37c24fcca7bff4b09adba37c3a7f.1743857160.git.princerichard17a@gmail.com>
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

