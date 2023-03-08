Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB587B
	for <linux-staging@lists.linux.dev>; Wed,  8 Mar 2023 07:35:24 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id o12so61974211edb.9
        for <linux-staging@lists.linux.dev>; Tue, 07 Mar 2023 23:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678260923;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Gte2HFg34yVeA/U5OHeIizbsHhlUPWICXggwBKuVh2I=;
        b=Dt82pBO67slGMwDm1SS6/1HLw6ZpAzyD6srwgZVrAvXg86Ba82MtmdgLPLzCSDT3b9
         BN5+kNFV9aXgpZOPMK1GjuNptRtjo4oP3cbH5Ia65t+klmJvNMZKI4qxSlrYRmuOaNsk
         DsGdBVpK1l+E8cuMCRpVKGbJsuaIj6RzOhQBPzk4XXLXs+Lv9ZkGH0HFQTPswWh8RoSh
         1jvcdkiZw0oul9twRi176xsDc+cbt97a8HonmyAWHAS2Gfny3Wx7qppNirRF3FaCHOv/
         U1lUJB3hKqsYfm7LJBVMywfgJdsTyw/ddCn7P8TNNWEokX0dg5PC1Prp8+KRgSi+6XjV
         uvzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678260923;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gte2HFg34yVeA/U5OHeIizbsHhlUPWICXggwBKuVh2I=;
        b=etUQetTEFLNSMV9VE6Gkb3XEGmoXEvC5ezCjh2tbLCRZBECZu1iyJUbL00xNynQD7y
         PfG+I/+7BHOZIq0OdsYZ+y4qWpe8SxKlCd2OFPQKBhh6ezh9od9OfahkO3/s6zkEQIne
         lpw1V+/RiiUfFDLj7dfyuqocf6mm8QdraF98oGb2kdopO3x9tiB9YyqawcpVc1nq70nm
         mx2RsnT51heknFkA1M6zdwQekNMQwM6YZBa/W9sc73wanvo2rdPrJyTZEKLJVq2Qgl88
         08pZqTr6ZszM1686WGEWrxE2gVeEZV3OM7ideuBRI4rheketIbHh0+J1VFCI9+BCxwIz
         vSmQ==
X-Gm-Message-State: AO0yUKXbNzy8LMgYLoLdydhJ+PZT39hjMbENznJADc5jNAeKISnMklap
	stgDKc6+U6BBb7FxPlKIvQU=
X-Google-Smtp-Source: AK7set8BdlJlpmywABZUT++XuOH4ogUuKoQXSG95jB3Xk6sHLRzgk3JFLTIQsB8V/aB5j/dY/7XHjQ==
X-Received: by 2002:a17:906:ac3:b0:8f2:bcb5:bbf2 with SMTP id z3-20020a1709060ac300b008f2bcb5bbf2mr18581306ejf.44.1678260922879;
        Tue, 07 Mar 2023 23:35:22 -0800 (PST)
Received: from xeon.. ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id h15-20020a1709062dcf00b008dffda52d71sm7051880eji.124.2023.03.07.23.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 23:35:22 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
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
Subject: [PATCH v2 0/8] Fix sound on ASUS Transformers
Date: Wed,  8 Mar 2023 09:34:54 +0200
Message-Id: <20230308073502.5421-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.37.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

- add quirk for headset detection used by some T30 devices
  (ASUS Transformers, LG Optimus 4X HD and Vu);
- add RT5631 and MAX9808x machine drivers
- update bindings

---
Changes from v1
- fm34 dropped for re-work
- quirk for headset detection and rt5631 bringup splitted
- minor adjustments in binding updates
- improvement of rt5631 rate asignment
---

David Heidelberg (1):
  dt-bindings: sound: nvidia,tegra-audio: add RT5631 CODEC

Svyatoslav Ryhel (7):
  dt-bindings: sound: nvidia,tegra-audio-common: add
    coupled-mic-hp-detect property
  ASoC: tegra: Support coupled mic-hp detection
  ARM: tegra: transformers: update sound nodes
  ASoC: tegra: Support RT5631 by machine driver
  ARM: tegra: transformers: bind RT5631 sound nodes
  dt-bindings: sound: nvidia,tegra-audio: add MAX9808x CODEC
  ASoC: tegra: Support MAX9808x by machine driver

 .../sound/nvidia,tegra-audio-common.yaml      |   4 +
 .../sound/nvidia,tegra-audio-max9808x.yaml    |  90 +++++++++++++
 .../sound/nvidia,tegra-audio-rt5631.yaml      |  85 ++++++++++++
 arch/arm/boot/dts/tegra20-asus-tf101.dts      |   7 +-
 arch/arm/boot/dts/tegra30-asus-tf201.dts      |  17 +++
 arch/arm/boot/dts/tegra30-asus-tf300t.dts     |   5 +-
 arch/arm/boot/dts/tegra30-asus-tf300tg.dts    |  17 +++
 arch/arm/boot/dts/tegra30-asus-tf700t.dts     |  17 +++
 .../dts/tegra30-asus-transformer-common.dtsi  |   9 +-
 sound/soc/tegra/Kconfig                       |  18 +++
 sound/soc/tegra/tegra_asoc_machine.c          | 125 +++++++++++++++++-
 11 files changed, 380 insertions(+), 14 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-max9808x.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5631.yaml

-- 
2.37.2

