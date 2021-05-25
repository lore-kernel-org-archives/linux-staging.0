Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F003F17F
	for <linux-staging@lists.linux.dev>; Tue, 25 May 2021 15:22:50 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id z12so46506636ejw.0
        for <linux-staging@lists.linux.dev>; Tue, 25 May 2021 08:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rJhAY+6M6l3lkNZ5wHTPFgZbqVZ72qbN/7DTJLowWC4=;
        b=D/LO853/p6Nl37MX49Fv/VQHdZCSBjh0mK2hmYEGzTVGI7snRZimKGM834bmy4vYTj
         dZFlcoOPLWyfmzdu3Zqh6IaluSV7CBbOMicdhaqDmjd7J34UUpk2g+IjgpFokjxIDecH
         gF89kI6Q2YpxP7PjrAa81O9MnaZPR8QDCfYxngngpXVO2TjDLUjlDus4+/DcwHh4jO2w
         nV3lxcssUfiUCrYwhWoEPg77KPE/YU27CRg8DRNd2wiPzg2CwokxnwsMLqE4QaCjQ7at
         RFDWwKKhDEjXvladAm3hbPOZkZTZ57qJ8CY6Ck5kfDFel+YVdV/s+O6x9POV53uO2DQQ
         iZag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rJhAY+6M6l3lkNZ5wHTPFgZbqVZ72qbN/7DTJLowWC4=;
        b=eqHa0qcmfuEaS9NxX0WENGy2AB/1aOqtiJcDk8s3o/fybdvzyE2fNzLvBrOMlgFmpg
         6oNp81XVrlLDxqeUXuBKPTpgWmZBJJxBlW5tj/6nM201QJcJ4oBuEAl66KS2f32S2bqD
         x2YTm4xmoa+wsOT30/fcuN69ApkVWTDKIowuIvlML04bStwXNmkWyJJJBsi+S3KKnwnH
         Ul4A/TQlQpp7AgorQBUSh4+IQPsReZkGSOEi47ehDEKz4YnxbeRItQGXkri8HVV+ocCp
         dfg3C/sEkUPI23TM2dgAyxuRA1Mb8d+RozT1c5GzjwYsC4yg1bA5jeXwBUIOSFoYvC0U
         TDoA==
X-Gm-Message-State: AOAM531GnJPddKC4giyrZj34uFS6rU7OAuR5CpZ7cAfyBMxsKiVBSzzU
	cIhSwJ+SyT8oKuTWktWIDg==
X-Google-Smtp-Source: ABdhPJzn83Td5nrvizOLNmEZVYvMJ+nRANBC4XkmMo16bcPJDx0FE2Y1K6MCW69SZLYQ5kRroa8O8w==
X-Received: by 2002:a17:906:f20e:: with SMTP id gt14mr28847790ejb.368.1621956169435;
        Tue, 25 May 2021 08:22:49 -0700 (PDT)
Received: from localhost.localdomain ([2a02:810b:f40:e00:b55:da44:4fe2:2760])
        by smtp.googlemail.com with ESMTPSA id e23sm11212945eds.2.2021.05.25.08.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 May 2021 08:22:48 -0700 (PDT)
From: Alex Bee <knaerzche@gmail.com>
To: Ezequiel Garcia <ezequiel@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Lee Jones <lee.jones@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: Alex Bee <knaerzche@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 00/10] Add support for older Rockchip SoCs to V4L2 hantro and rkvdec drivers
Date: Tue, 25 May 2021 17:22:15 +0200
Message-Id: <20210525152225.154302-1-knaerzche@gmail.com>
X-Mailer: git-send-email 2.27.0
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi list,

this series adds support for older Rockchip SoCs (RK3036, RK3066, RK3188
and RK322x) to the existing V4L2 video decoder/-encoder drivers - namely
hantro and rkvdec.
They can be used as-is or with very little modifications.

In preparation to that patches 1-3 add power-controller support for RK3036
and RK322x, since both drivers rely on pm. The drivers for them exist
already in the common Rockchip pm driver, they just haven't be added to
the device trees yet.

Thanks for your feedback,
Alex.

Alex Bee (10):
  ARM: dts: rockchip: add power controller for RK322x
  ARM: dts: rockchip: add power controller for RK3036
  dt-bindings: mfd: syscon: add Rockchip RK3036/RK3228 qos compatibles
  media: hantro: add support for Rockchip RK3066
  media: hantro: add support for Rockchip RK3036
  ARM: dts: rockchip: add vpu nodes for RK3066 and RK3188
  ARM: dts: rockchip: add vpu node for RK322x
  media: dt-bindings: media: rockchip-vpu: add new compatibles
  ARM: dts: rockchip: add vdec node for RK322x
  media: dt-bindings: media: rockchip-vdec: add RK3228 compatible

 .../bindings/media/rockchip,vdec.yaml         |  10 +-
 .../bindings/media/rockchip-vpu.yaml          |  33 +++-
 .../devicetree/bindings/mfd/syscon.yaml       |   2 +
 arch/arm/boot/dts/rk3036.dtsi                 |  51 ++++++
 arch/arm/boot/dts/rk3066a.dtsi                |   4 +
 arch/arm/boot/dts/rk3188.dtsi                 |   5 +
 arch/arm/boot/dts/rk322x.dtsi                 | 139 ++++++++++++++-
 arch/arm/boot/dts/rk3xxx.dtsi                 |  12 ++
 drivers/staging/media/hantro/hantro_drv.c     |   2 +
 drivers/staging/media/hantro/hantro_hw.h      |   2 +
 drivers/staging/media/hantro/rk3288_vpu_hw.c  | 165 ++++++++++++++++++
 11 files changed, 414 insertions(+), 11 deletions(-)


base-commit: 5d765451c2409e63563fa6a3e8005bd03ab9e82f
-- 
2.27.0

