Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 037AF10E0
	for <linux-staging@lists.linux.dev>; Sun, 12 Jun 2022 15:54:30 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id gl15so6780844ejb.4
        for <linux-staging@lists.linux.dev>; Sun, 12 Jun 2022 08:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fgRDXCG0152Z3tFDn2gSPrHtara3Cv/otakf5tLuBg8=;
        b=bKKJa3yTkzViWR9SYaKXSbaSBhzt4NWlst6pZhou6xHjuwAuCAVDMPsgZorewuVY/A
         LBP+qx0Y3f8GjqZ63quFAqx84tof3XZB0cChOUbRJvtDgHofl0AWieEBXGSUlT6wGwID
         TuhUSYAufWyRrwU3Q0F/E5uMr8hL9QhxCJqM6g4UxsbQIx6pnAQzea2emEGvnKUGUqzw
         8H0u+ZjuDI7qeK1IwkRwE295OYNuKHfaIKWUOQDtgTzzJWFbDq7OaFy4H6MHeTFhN35j
         S8bX+mlaAf1tNkdBJ0Mf4EFricO0bEe6KBfc1+W1dxj1nCekiBT2k8muiUNYaPOhdP6U
         J6hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fgRDXCG0152Z3tFDn2gSPrHtara3Cv/otakf5tLuBg8=;
        b=wyy9IA7z1v0x/ljENKiXbcwrdZ2Z3gfn2u0KIkMqwmMrMnu7XpVI9GTOF8GU5pboL4
         JR6G2E9uuK7CtsfYMnVJIyVh5D5KJCW1ZZ44NHpGJCC0pz0NYXF7Z+TgMgWavfQf8ugL
         15fN+irW73U3CO2DnompIfhCjQOAjL3tiDUOu5pTpcwV1A3sa5tw3QWzy37X50flQecg
         3KEhME9igoQngP5e2CjDm2gBFCmTDxiZOkYcf1itwvt+dyZH6qwhEjiLkIZfy47icbnn
         n0BKM7DT4yN5k91nmrNjZ09BCyr4rw7+VAEHFBxBisrE4jVYTQOJ5eun5LgzUVDpESvP
         82fw==
X-Gm-Message-State: AOAM531LAT2OfHdj/FoyKBLqz26ysGoNPwIjSFtOkfstYYu+fNGXzsdV
	rnf3tfouf2WS0e72SqRzvQc=
X-Google-Smtp-Source: ABdhPJwxbSdECkbBuOQJjUIZERJaR0TEJtWoXqbo0LfKbmT+uXP9XNPSyMZm98oHFA6EIt/82xSd+A==
X-Received: by 2002:a17:906:1f09:b0:70d:b470:1aaa with SMTP id w9-20020a1709061f0900b0070db4701aaamr45775524ejj.758.1655049269268;
        Sun, 12 Jun 2022 08:54:29 -0700 (PDT)
Received: from localhost.localdomain (84-72-105-84.dclient.hispeed.ch. [84.72.105.84])
        by smtp.gmail.com with ESMTPSA id o1-20020a1709064f8100b006f3ef214de7sm2609459eju.77.2022.06.12.08.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jun 2022 08:54:28 -0700 (PDT)
From: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Peter Geis <pgwipeout@gmail.com>,
	Michael Riesch <michael.riesch@wolfvision.net>,
	Liang Chen <cl@rock-chips.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v5 0/3] Enable JPEG Encoder on RK3566/RK3568
Date: Sun, 12 Jun 2022 17:53:43 +0200
Message-Id: <20220612155346.16288-1-frattaroli.nicolas@gmail.com>
X-Mailer: git-send-email 2.36.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

this is v5 of my RK356x JPEG encoder patch set. It enables the Hantro
hardware encoder of the RK3566 and RK3568 line of SoCs, with JPEG being
the only format the driver currently supports encoding for.

The first patch adds a new binding, the rockchip,rk3568-vepu binding, to
describe this kind of hardware. The reason for going with a new binding
instead of modifying the vpu binding as the previous versions did is
that the vpu binding is getting quite long, and Ezequiel Garcia suggested
(on IRC) that we could document encoder only instances in their own
binding. This makes sense to me, especially considering that RK3588 will
have more Hantro instances like this to document.

The second patch makes the actual driver changes to support this variant.

The third and final patch makes the necessary device tree changes for
the rk356x device tree file to add both the node for the encoder and
its MMU.

The series has been tested on a PINE64 Quartz64 Model A with an RK3566
SoC using GStreamer.

Regards,
Nicolas Frattaroli

Changes in v5:
 - rename rockchip-vepu.yaml to rockchip,rk3568-vepu.yaml
 - fix #address-cells/#size-cells in bindings example
 - fix indentation in bindings example

Changes in v4:
 - bindings: move vepu to its own binding, also add it to MAINTAINERS
 - driver: rename a stray rk3568_jpeg_enc_codec_ops to
   rk3568_vepu_codec_ops
 - devicetree: remove interrupt-names property
 - rebase onto linux-next

Changes in v3:
 - bindings: change consts to an enum
 - bindings: add check to make sure devices with a -vepu compatible only
   have the vepu interrupt

Changes in v2:
 - rename compatible as it's not JPEG only
 - rename device tree nodes as it's not JPEG only
 - reword commits as it's not JPEG only
 - get rid of a whole bunch of redundant struct definitions, as, you
   guessed it, it's not JPEG only


Nicolas Frattaroli (3):
  media: dt-binding: media: Add rk3568-vepu binding
  media: hantro: Add support for RK356x encoder
  arm64: dts: rockchip: Add Hantro encoder node to rk356x

 .../bindings/media/rockchip,rk3568-vepu.yaml  | 69 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 arch/arm64/boot/dts/rockchip/rk356x.dtsi      | 20 ++++++
 drivers/staging/media/hantro/hantro_drv.c     |  1 +
 drivers/staging/media/hantro/hantro_hw.h      |  1 +
 .../staging/media/hantro/rockchip_vpu_hw.c    | 25 +++++++
 6 files changed, 117 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/rockchip,rk3568-vepu.yaml

-- 
2.36.1

