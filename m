Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5682C9E
	for <linux-staging@lists.linux.dev>; Sun,  5 Dec 2021 18:16:36 +0000 (UTC)
Received: by mail-il1-f176.google.com with SMTP id a11so8094273ilj.6
        for <linux-staging@lists.linux.dev>; Sun, 05 Dec 2021 10:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=b7hPh5mvYUUQHhkNNfoyCMD5i8ZznhnbU9nW0aRlESc=;
        b=cmpP6hAnfSA5CEdGDnS04nX/ONCTYoYT50LViDGS8fK2PSD/NeynRzFthz1B5u+skM
         QjWeeDp39fs2dDsVddhPiqzf0Ur3P+3mDHVo/sBOf+K6lPmwwTik7Y99N9AQeAeva9Vt
         1RY3TxyDPVOcIVmxDbjDROtrZPB3ejjY09s/hC7cK6QtZ54dXzohEcN7U9M5KcR+DTCX
         G1T8bmkQG+IoL+IiKoVbpe5XsnuzXFBcgrCakoO44sd1U6O9YSf/jHVLBe0P/C64BU0D
         ysxHUI+y5+mY7uoVfCrQIEukijEybRXcTo5NsE7ooj1maicuFdbGVmqkBm75/WLg4SD/
         Wvig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=b7hPh5mvYUUQHhkNNfoyCMD5i8ZznhnbU9nW0aRlESc=;
        b=NjtVms7Y11JWtRnXSUxqPGxiYoPR5KwbC08OBkCbxey/U+YdyPsgvCIEgqk7AGlHiZ
         kY5Zc0ufsadBZN5sOgTXd1VZnNi35aL0Z1fiKwDQsaWgwm8uzW3jqWbAOlQGtMLy3136
         2wu/5SIZ0jtuGKvLDcxHecuTPrdVw2dYBDIEYNL2JjIOKLM6N8dtrexxYl0AcS/6Lpq0
         6kE1W1ehlrlDfHI7nv4eQwlqqaK8RIPToU+iCsankjhkfedMY3Ll39VcinqEs6EG6oau
         /aAhRNex7QpTxGe97hnvZo8seLvicnIkBGnWT/Vcizlam5G1G5ERyGyxayFCh8LY3uiM
         KyqQ==
X-Gm-Message-State: AOAM530c85/jKPTJg91aDesLYfsdpEfLUIOq+HxUAImoWO+sQYoO5spD
	9/F40LpLDY2YAorXsYoMXn8=
X-Google-Smtp-Source: ABdhPJyHMiqyQNSp4p0YcCTauDSHb7YDwtcIhgnq+pwoSX0gBorVeEiMc6bRja2+eWJlJbWpI6vdiQ==
X-Received: by 2002:a05:6e02:1a08:: with SMTP id s8mr6025833ild.158.1638728195036;
        Sun, 05 Dec 2021 10:16:35 -0800 (PST)
Received: from aford-IdeaCentre-A730.lan ([2601:448:8400:9e8:9ea0:bb99:b16a:6159])
        by smtp.gmail.com with ESMTPSA id z12sm5808164ilu.27.2021.12.05.10.16.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Dec 2021 10:16:34 -0800 (PST)
From: Adam Ford <aford173@gmail.com>
To: linux-media@vger.kernel.org
Cc: benjamin.gaignard@collabora.com,
	cphealy@gmail.com,
	nicolas@ndufresne.ca,
	Adam Ford <aford173@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lucas Stach <l.stach@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev
Subject: [RFC 0/5] Split iMX8MQ Hantro VPU into G1 and G2 with blk-ctrl support
Date: Sun,  5 Dec 2021 12:16:13 -0600
Message-Id: <20211205181618.1041699-1-aford173@gmail.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, the VPU in the i.MQ8MQ is appearing as one codec, but in reality, it's
two IP blocks called G1 and G2.  There is initialization code in VPU code to
pull some clocks, resets and other features which has been integrated into
the vpu-blk-ctrl for the i.MX8M Mini and a similar method can be used to make
the VPU codec's operate as stand-alone cores without having to know the details
of each other or the quirks unique to the i.MX8MQ, so the remaining code can be
left more generic.

This series was started by Lucas Stach, and picked up by me so some patches have
his s-o-b and mine where I might have changed a few minor items.  It's in an RFC state
because the G2 VP9 operations appear to hang, but the parent code from which I started doesn't
appear to show VP9 support, and it looks like it should.

since the g-streamer and media trees are in a constant state of change, this series is based on
git://linuxtv.org/hverkuil/media_tree.git for-v5.17e

Adam Ford (2):
  media: hantro: split i.MX8MQ G1 and G2 code
  arm64: dts: imx8mq: Split i.MX8MQ G1 and G2 with vpu-blk-ctrl

Lucas Stach (3):
  dt-bindings: power: imx8mq: add defines for VPU blk-ctrl domains
  dt-bindings: soc: add binding for i.MX8MQ VPU blk-ctrl
  soc: imx: imx8m-blk-ctrl: add i.MX8MQ VPU blk-ctrl

 .../soc/imx/fsl,imx8mq-vpu-blk-ctrl.yaml      |  71 +++++++++++
 arch/arm64/boot/dts/freescale/imx8mq.dtsi     |  69 ++++++----
 drivers/soc/imx/imx8m-blk-ctrl.c              |  67 ++++++++++
 drivers/staging/media/hantro/hantro_drv.c     |   4 +-
 drivers/staging/media/hantro/hantro_hw.h      |   2 +-
 drivers/staging/media/hantro/imx8m_vpu_hw.c   | 119 +++---------------
 include/dt-bindings/power/imx8mq-power.h      |   3 +
 7 files changed, 205 insertions(+), 130 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/imx/fsl,imx8mq-vpu-blk-ctrl.yaml

-- 
2.32.0

