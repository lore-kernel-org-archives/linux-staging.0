Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 417FC26F2BF
	for <linux-staging@lists.linux.dev>; Sun, 14 Jun 2026 15:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781451932; cv=none; b=oQldQqkT2Q8Je9ur7Tt+xfnVlVY5U7oXdqZsO0UalGkxN855maMeBmJwhC3bjBnzZzqmcQ/6jM4kITR4IiDmv11CF/6BcGU1yoYoZxmfolacwOOzZCgl2eb7XBrqf13j/mmH929b059rLOXlVPP9lLT9dyMstSlZ39d6zDuiQN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781451932; c=relaxed/simple;
	bh=lhQg0++53cN6YWLsvuYUtWRHnABUxZRuUet4RxtPuNY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gYqxaWveXmdtDp64xEIiuGVNhpWa0sWVyu5xWW/NkkZnNHdd+OTw7kioNxGFkLwMuKuNymkufhY97b+PiC170c23Cs6riAcVeDjVFnYvatI8CNErbkVdQoCZ+Z+8GSS/GUzyk6y5wQktKxzPEKLlpllMSHs9+POi17RK3umBO1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cPSdJ+QZ; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cPSdJ+QZ"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490b12270b3so15216955e9.1
        for <linux-staging@lists.linux.dev>; Sun, 14 Jun 2026 08:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781451930; x=1782056730; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=opTcDvpoHFRHn9n+WZGobddkXtZDg7nJ4XpbwWq3BKs=;
        b=cPSdJ+QZhD4Me/e/dHaA3CeDMLQj3E7uUcDt9ZfrPEyfDvE74wubwDGSFeh2Iyyxxi
         SDhjybcHFsWbDo6sBMMDh3tRM/CYkbyqN6cj8QH8Jc7LhbnQu+fcGT6d9qk8ySigMz0g
         0ZoI48xFCEsXdE2CcsikXrMm8syROr3FBfLi81dFb2oF1nBeZaGDClvKtj1TCj2jCAhu
         muaFCK7er0s0AktlUev22lQCM5g7lWltZu9mwZLueKUvSXFaUV2aYbDbUzApRMlvIzM+
         1vv8teIMuwV/9oELN+j7YKkC3unQFFaKdNjo+/Wa0wsZ7GG3aLUHhQkpd3DGvbdCyepU
         RTew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781451930; x=1782056730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=opTcDvpoHFRHn9n+WZGobddkXtZDg7nJ4XpbwWq3BKs=;
        b=su9eEIxwFCeIsPXqdhyl58lyFcFf98M9SB8e98EKhbI9M5eYFiXeTdQmx6TnhrPJOD
         4rvc4DjTPbWky5hKNvuKPkyJZlG2awXBkuno8aQP5RSOERa/cNGTBedqzSsm7kuAC1Pz
         b4mtjz9Y6mGMQr9YzuZusoZNdTtNQEvkwL/KlfFcPcR9LjAsqnXaVhhkVv1WRDqyXqVB
         VlIvTXxeDtdajFC3RBSvPedKunXEdb7Z/ygMt+vYkniKPSinnM8ifl+voAvyDtFBSmGi
         96j3LJxIwmhTmXPwi3uiENpDayULkI3HAShhjh3+Axal/DwgIkt4u08qvcoquLpgzzKW
         WLbw==
X-Forwarded-Encrypted: i=1; AFNElJ9LjZHgbFScgJyXMWfpvq/Bqre5G3YB3LkBYghcDq6uKnFY4Tkmf635CdhD3Q8+/vCo5I/pL0wFYOhEr3Po@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3ghjZ0LqyCifiBjskomXD59YnfPyyRvgAH5iKgVy30ZnYhbSt
	/ppnCqgVH3f/nRpyPriT+pBsbDK+o+Qs30oz+DQEFTw2IyWEWKrzFUcx
X-Gm-Gg: Acq92OEEK/7gObtbfJddi0LTSQlyhHNi9IW6ZFK3opZPSvFef0eEB5XDUh9XYg5Plqq
	VTMQdJzEHx6eory6Uj2t7dYkmW8VnxasngO++tj/QuPF3P4j5cRbwrJsy/rX4XBA5Ic1CXD8JsP
	S8jofVHZer7nCdrVsd1rbcSo/vyBCNRfLHo9DGeK/+kSJmdltRTluTSOgL78e5INI73Xa6AuhyF
	N72ocrZU4bFPzfUeIQCCsngTAxmdoBF4Ca75QzWI6GtFtEn86Wfn5OeUYECNc32sQYzEmOEmb0X
	463jI2pJ34Z3cnknI4NKLDN5PnfutB5Tp6wHnyI9cIr8YDcHZth3RmLExpJm9B6ueVmnKcdC7tE
	meWoWcDENoOUNWobcAnYixFls4rWjno/b0lFYmecfw6+LRSpr1emIx4j5T6nDS+pB/TkEfAXh7Z
	ofO39eitOyxSkAKYS1e0QXW/gnqMYPNplvSpGoiS3TsI4cQg==
X-Received: by 2002:a05:600c:4685:b0:490:e190:3b50 with SMTP id 5b1f17b1804b1-490ec4d4f7cmr162561785e9.9.1781451929565;
        Sun, 14 Jun 2026 08:45:29 -0700 (PDT)
Received: from fedora ([154.182.122.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922031b7d2sm184237135e9.5.2026.06.14.08.45.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 08:45:29 -0700 (PDT)
From: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
To: gregkh@linuxfoundation.org
Cc: vaibhav.sr@gmail.com,
	mgreer@animalcreek.com,
	johan@kernel.org,
	elder@kernel.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Abdelnasser Hussein <abdelnasserhussein11@gmail.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v3 2/2] staging: greybus: audio_codec: remove redundant else-if check
Date: Sun, 14 Jun 2026 18:43:29 +0300
Message-ID: <20260614154329.5176-3-abdelnasserhussein11@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260614154329.5176-1-abdelnasserhussein11@gmail.com>
References: <20260614154329.5176-1-abdelnasserhussein11@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In gbaudio_module_update(), the widget id is validated earlier in the
function to ensure it is either snd_soc_dapm_aif_in or
snd_soc_dapm_aif_out.

Remove the redundant else-if check for snd_soc_dapm_aif_out. The
remaining branch can only handle snd_soc_dapm_aif_out, which avoids
a compiler warning about a potentially uninitialized variable.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202606140347.gGVWDnbi-lkp@intel.com/

Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
---
Changes in v3:
- Split from the previous v2 patch to address the uninitialized variable
  warning separately.

 drivers/staging/greybus/audio_codec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/audio_codec.c b/drivers/staging/greybus/audio_codec.c
index 295222ec0f1a..6daa4e706792 100644
--- a/drivers/staging/greybus/audio_codec.c
+++ b/drivers/staging/greybus/audio_codec.c
@@ -322,7 +322,7 @@ int gbaudio_module_update(struct gbaudio_codec_info *codec,
 			ret = gbaudio_module_enable_tx(codec, module, dai_id);
 		else
 			ret = gbaudio_module_disable_tx(module, dai_id);
-	} else if (w->id == snd_soc_dapm_aif_out) {
+	} else {
 		if (enable)
 			ret = gbaudio_module_enable_rx(codec, module, dai_id);
 		else
-- 
2.54.0

