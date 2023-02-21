Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E196EC7
	for <linux-staging@lists.linux.dev>; Tue, 21 Feb 2023 18:32:24 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id eg37so17183211edb.12
        for <linux-staging@lists.linux.dev>; Tue, 21 Feb 2023 10:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0EeJlO8QUl1DZMAlcd+EODPEJDc+DBbZZnZ+JDzoEdg=;
        b=kWq4ecHFuWXMSQZOzGBaSB3TZctWJCNGUWIu8P3VK24KihWheD/Hkgnz3BhcjBm+Ov
         z8eahBqmrp2SwL0wBFOCTd+8Knk4Nx90ZwYEY03DeTfn6M/VqR6QPOqhy5+242r9yDzt
         Ebj1teN7A4oA8YgIQe8byK5O6YanmP4Rk4ZeqmJR7xKaFSbu8E7tfn3utJjUFoZ988os
         QEbB2xHc3wW1X2WPp4qC8P+OOaY4c9nDtBXBo3LdSxRv8OmHfXrfBf1SVw9icnA4wePn
         SA8PnAH5xFwF8CR18LYgwYpvbCp28OMh9f4PgaM5DxNZ/D9Fk68DmsvDr2FtOiXzVAsJ
         Jbqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0EeJlO8QUl1DZMAlcd+EODPEJDc+DBbZZnZ+JDzoEdg=;
        b=olif533kH9p5x7H2EfIRJ9A9M0CH5mYqhDj7UP454zadZGLwYeFKg8+87tYBxsbQ7z
         SMvSRocQWXjZV1Oiw9KLygpt1nBUBUTpxDnB/8oGzca7uc+UDgq4Iqw4xJgJ16GlflU4
         /k/7nBdkqDVgFFWVbIz64kpQE07S85FYVF3BuIbsRJy7Vut9on4bu4VyxH7HoG+B+XbQ
         pabtyP0tU1p21B5FENjyGk8dsjxUdV89iMOIwmemG4ykmEx3QnMvXNrEiy+iwoDWbG+j
         nLWHVpOB+Du5IdmJadeSceHXXLd006IvQ5S6MlFN9hcBdTRxrWTN8U+Cd2vBF/Gk24qO
         2/pg==
X-Gm-Message-State: AO0yUKVuZvA7cBkIPIfJwsS6ERFzyJn0qeb2VlXfUfVLjX+417hO77nk
	3PGtDUZkLW0xMNjGj7yLzkI=
X-Google-Smtp-Source: AK7set86GBsI14U6VEaKmjm3BNimI8/ZzoK6Ek4xMuPyAJKltWK2m8xRKjLbpVGkaLUsc2k/7+79Yw==
X-Received: by 2002:a05:6402:215:b0:4af:515d:5658 with SMTP id t21-20020a056402021500b004af515d5658mr2968051edv.35.1677004342754;
        Tue, 21 Feb 2023 10:32:22 -0800 (PST)
Received: from xeon.. ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id i3-20020a50c3c3000000b004af5aa16fcasm169102edf.66.2023.02.21.10.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 10:32:22 -0800 (PST)
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
Subject: [PATCH v1 00/10] Fix sound on ASUS Transformers
Date: Tue, 21 Feb 2023 20:32:01 +0200
Message-Id: <20230221183211.21964-1-clamor95@gmail.com>
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
- add Fortemedia FM34NE DSP driver used by ASUS Transformers
  and mandatory for correct sound work
- bind everything into working configuration

David Heidelberg (1):
  dt-bindings: sound: nvidia,tegra-audio: add RT5631 CODEC

Svyatoslav Ryhel (9):
  dt-bindings: sound: nvidia,tegra-audio-common: add new property
  sound: soc: jack: allow multiple interrupt per gpio
  ASoC: tegra: Support RT5631 by machine driver
  dt-bindings: sound: nvidia,tegra-audio: add MAX9808x CODEC
  ASoC: tegra: Support MAX9808x by machine driver
  ARM: tegra: transformers: update bindings of sound graph
  dt-bindings: dsp: add Fortemedia FM34 DSP
  staging: dsp: add support for Fortemedia FM34NE DSP
  ARM: tegra: transformers: bind FM34NE DSP on supported devices

 .../bindings/dsp/fortemedia,dsp.yaml          |  95 ++
 .../sound/nvidia,tegra-audio-common.yaml      |   4 +
 .../sound/nvidia,tegra-audio-max9808x.yaml    |  93 ++
 .../sound/nvidia,tegra-audio-rt5631.yaml      |  88 ++
 arch/arm/boot/dts/tegra20-asus-tf101.dts      |  22 +-
 arch/arm/boot/dts/tegra30-asus-tf201.dts      |  46 +
 arch/arm/boot/dts/tegra30-asus-tf300t.dts     |  34 +-
 arch/arm/boot/dts/tegra30-asus-tf300tg.dts    |  36 +
 arch/arm/boot/dts/tegra30-asus-tf700t.dts     |  36 +
 .../dts/tegra30-asus-transformer-common.dtsi  |   9 +-
 .../arm/boot/dts/tegra30-pegatron-chagall.dts |  29 +-
 drivers/staging/Kconfig                       |   2 +
 drivers/staging/Makefile                      |   1 +
 drivers/staging/dsp/Kconfig                   |   7 +
 drivers/staging/dsp/Makefile                  |   2 +
 drivers/staging/dsp/dsp-fm34ne.c              | 364 ++++++++
 drivers/staging/dsp/dsp-fm34ne.h              | 845 ++++++++++++++++++
 sound/soc/soc-jack.c                          |   1 +
 sound/soc/tegra/Kconfig                       |  18 +
 sound/soc/tegra/tegra_asoc_machine.c          | 120 ++-
 20 files changed, 1837 insertions(+), 15 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/dsp/fortemedia,dsp.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-max9808x.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5631.yaml
 create mode 100644 drivers/staging/dsp/Kconfig
 create mode 100644 drivers/staging/dsp/Makefile
 create mode 100644 drivers/staging/dsp/dsp-fm34ne.c
 create mode 100644 drivers/staging/dsp/dsp-fm34ne.h

-- 
2.37.2

