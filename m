Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A7581F;
	Thu,  7 Mar 2024 05:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709790713; cv=none; b=mwdFdWQnAVDrB1985PHV0BOC97frU3hVivsSU6oh4LrigU8SLAQvUFxooHsNl6YFmDcUNSmmWzKFsRqDxRHPB/e5+X3PXcrN1OhUwD7ELr043E/0OXQqqTMHHNQqyzuNWQGDEraFKcR7ItDZm7vakRsTw4E/adQx9BLsPWAWnXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709790713; c=relaxed/simple;
	bh=57wyAyBTIxx3u3+Z6JSiGGZ/XbP3hpi9urC67BF9fK4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gz/ken3Q4sfc9q8kJshfxFeIdNLJfjNyyBsa/LIWUG1AOWS4viBchH7E0yAmt+UImnDxS5t85VbfgcY5YUnJwFT13Q52CHM5R6rByIYplS4ZfPle9hETc0s0yci4JyxlkPtjqfi1H9RimGuxTMpvuKE12y/Bk+iVGsiLJFs9lsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GtlCbPJm; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GtlCbPJm"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a3122b70439so63662266b.3;
        Wed, 06 Mar 2024 21:51:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709790710; x=1710395510; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fU6uKF3H3RHO6Gd+vmJ/Bm8U0HebGZ0MDGJnyH/Tbx0=;
        b=GtlCbPJmw63mfeg7+UZXZeHaYS0/s1gzisaRfwzVYJIXes4nvBrKZihYVHDrCMHp+A
         WZYSeZQQHjIgNrjcKAJ7471TdWN6SjJ8Ark50EnuxbAJtQ8mOAAKaq4cWQveyMBuNQgQ
         G0VtxVuOiUkCGMK4hd/hy44i5Qt+T4uuDtUaHpgn05pm4/OI2pp6FhtiKXJPfiPBcv4w
         Lntv3pHEfk9baVR4T8FqJ6FHuNgnfPTFIOoSWBw8NiFUvU2s4qrgYGm5TiZhe1Z5kX0c
         OV3tfcoyAwvMDPwZWdFVYraNGybrFffF1HvG36+59/DHi7+AiP6qFYclWuWFg4AjYNAe
         FoNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709790710; x=1710395510;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fU6uKF3H3RHO6Gd+vmJ/Bm8U0HebGZ0MDGJnyH/Tbx0=;
        b=hdoN47hXHC7hdheZ7PCid6so9cQ6TkxhHhI2v5FvTKau3Z7zwh28pcwWpHKygConzV
         kjvAejfVeulKjz28cV1sfMQ6dTCOtT24duI1SvVQSuL+Xb0I86iBtsBfhuKkTwW7aRfj
         a62GRk27F1UXSyPBO6IxjKHSFDA+A/4U1x0JZtWZW9Pt6MOAOu5NkuJD1rQ4hASyEWq+
         +93Q/5ZwUUxSoGYBuxxCfWOC1LleWJFepygr6XK89fPk7rJGZrTcMvMlep8yHFkflaxl
         F0LlkRWwlv+l19wziF+I7v25J0XubYPBAZh1DAlrfSYIHPqIloOKZiMvMuMlQYjvXutY
         9Hxg==
X-Forwarded-Encrypted: i=1; AJvYcCXPKwOaHnk6+ZsmflW8i+NyvBZFCketCxR7TPjKLp/TDQHx80DuGWb/AI+EIVvtnqeNwUmE7FZkbQnvjonII9Mtl7EKVsMLdQh/BVlYYT+2+EdST4JZuBsT524Da9MRbtcPG8FfyXh+Og==
X-Gm-Message-State: AOJu0Ywe+TBR0qNaoIrP8WI3EbP6wXJQWUuEApVbhE4CDetEvf03AJLY
	gMdblvcZaUWU4KI95dM7QtOGJIEfd8ZXOLthtCp5G2wjh+De82JO
X-Google-Smtp-Source: AGHT+IGpxN2jqRQn3iY/J3rD1QxeteFI1VKo6NKVK9LFEfbTCYVvqRLmS0UEEzlJjs4mcZtlgtOCOg==
X-Received: by 2002:a17:906:3c13:b0:a44:2563:c5dd with SMTP id h19-20020a1709063c1300b00a442563c5ddmr11114515ejg.45.1709790709839;
        Wed, 06 Mar 2024 21:51:49 -0800 (PST)
Received: from ubuntu-focal.zuku.co.ke ([197.237.50.252])
        by smtp.gmail.com with ESMTPSA id sa24-20020a1709076d1800b00a440019ac45sm7829583ejc.69.2024.03.06.21.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 21:51:49 -0800 (PST)
From: Dorine Tipo <dorine.a.tipo@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	outreachy@lists.linux.dev
Cc: Dorine Tipo <dorine.a.tipo@gmail.com>
Subject: [PATCH] Staging: sm750fb: Rename variable sii164GetDeviceID
Date: Tue,  5 Mar 2024 22:07:33 +0000
Message-Id: <20240305220733.36597-1-dorine.a.tipo@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable sii164GetDeviceID to sii164_get_device_id to silence
checkpatch warning Avoid CamelCase

Signed-off-by: Dorine Tipo <dorine.a.tipo@gmail.com>
---
 drivers/staging/sm750fb/ddk750_dvi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/ddk750_dvi.c b/drivers/staging/sm750fb/ddk750_dvi.c
index 8b81e8642f9e..3fb14eff2de1 100644
--- a/drivers/staging/sm750fb/ddk750_dvi.c
+++ b/drivers/staging/sm750fb/ddk750_dvi.c
@@ -16,7 +16,7 @@ static struct dvi_ctrl_device dcft_supported_dvi_controller[] = {
 	{
 		.init = sii164_init_chip,
 		.get_vendor_id = sii164_get_vendor_id,
-		.get_device_id = sii164GetDeviceID,
+		.get_device_id = sii164_get_device_id,
 #ifdef SII164_FULL_FUNCTIONS
 		.reset_chip = sii164ResetChip,
 		.get_chip_string = sii164GetChipString,
-- 
2.25.1

