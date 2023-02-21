Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1573DEC7
	for <linux-staging@lists.linux.dev>; Tue, 21 Feb 2023 18:32:26 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id cq23so20729496edb.1
        for <linux-staging@lists.linux.dev>; Tue, 21 Feb 2023 10:32:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IAXecBgeRkHu8ZmrGSEh+xC8pZ8csJk/gLQuqMv+ZEI=;
        b=n5P5sUEHLppfy1KRySapcmLr3VmalIXip2527iBV1pCY+xwS8ywbsnb6vBwPteurfH
         Ou9heSahzhfGJVOnzPjla6C+JQo2VGd0yOCOpw4k/pjtCPDEpRrjpZLdpNF66Pi1DKH9
         WLP3xJQVbHYcEVJ7Wy9+73EuPBfWRbCokMg00ejhFAjQXjTyfePQrZKDmFkJzrRKuLnx
         e3M1VTGBwW93NFqHDNrX3XzJJqgBFJMitGzKukSDLzjuw8aKsmEHHiVsL6l5ARdcTx7Z
         NB5lKQ8K6GmD8sZRwzyMJ4RNTwnljCCDwYAzGsGxScbfzvJvZWnorpAYlZQpX1l6rhMw
         Ad/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IAXecBgeRkHu8ZmrGSEh+xC8pZ8csJk/gLQuqMv+ZEI=;
        b=1UGeEq487RuvooyjYAm6pQNNK4Buvvv/gmU6nRJy2SOKkkKLfgSgM2Siv7hpn7T5Hk
         BrqQVs+j4gi9J6/iVW/4LxFzNtDBhILLWoOJrIwLTgoIA0LUJw60LTPV40C3l5b5Wu+o
         QE6yX4eonSn26NbnG7KHtCXvEGeCV2GJS16Cge8/gDJFSRcoxtP+9E6YN7K56iloYrOM
         9cODNomtgesX9XqPCqmb/hwsxd54HpTvP3rh8W5J0TWO8+jvJxxL2DjCR6YhIvgqwsrO
         idZA+GqJci8hU5UUx9PTgqGaVBKE/FRmNOd2R5h4Ndzd6kkCtxO+MWazuAxXTMiPp8sc
         zt9Q==
X-Gm-Message-State: AO0yUKWtOEcTmxDZ8+0Q6zhyQ16tRhSuT+H586qmrXm2zjhF34d7Iy60
	0OrtzNE/GNHNabyann3E0wc=
X-Google-Smtp-Source: AK7set9zWlurnl/3CRZ7DTez58dz2jKnck1MAztIosG4p1jWNb1dZJz3bfbLFRpOyeGB3qiJQ4VlZQ==
X-Received: by 2002:aa7:ca56:0:b0:4ae:e5ab:46d7 with SMTP id j22-20020aa7ca56000000b004aee5ab46d7mr3752692edt.8.1677004345190;
        Tue, 21 Feb 2023 10:32:25 -0800 (PST)
Received: from xeon.. ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id i3-20020a50c3c3000000b004af5aa16fcasm169102edf.66.2023.02.21.10.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 10:32:24 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Maxim Schwalm <maxim.schwalm@gmail.com>,
	Dmitry Osipenko <digetx@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v1 02/10] sound: soc: jack: allow multiple interrupt per gpio
Date: Tue, 21 Feb 2023 20:32:03 +0200
Message-Id: <20230221183211.21964-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230221183211.21964-1-clamor95@gmail.com>
References: <20230221183211.21964-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This feature is required for coupled hp-mic quirk used
by some Nvidia Tegra 3 based devices work properly.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 sound/soc/soc-jack.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/soc-jack.c b/sound/soc/soc-jack.c
index fcece5ca38c6..f951acb2ce36 100644
--- a/sound/soc/soc-jack.c
+++ b/sound/soc/soc-jack.c
@@ -367,6 +367,7 @@ int snd_soc_jack_add_gpios(struct snd_soc_jack *jack, int count,
 
 		ret = request_any_context_irq(gpiod_to_irq(gpios[i].desc),
 					      gpio_handler,
+					      IRQF_SHARED |
 					      IRQF_TRIGGER_RISING |
 					      IRQF_TRIGGER_FALLING,
 					      gpios[i].name,
-- 
2.37.2

