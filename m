Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0188F6D10
	for <linux-staging@lists.linux.dev>; Fri, 25 Jun 2021 17:06:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2F9026195B;
	Fri, 25 Jun 2021 17:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1624640778;
	bh=VOIJg20YfyJrwH1NaBZ9G0S4KoAb/iCmzLmbIn7S9pA=;
	h=From:To:Cc:Subject:Date:From;
	b=QPQFXXMf1PpPku4yj2b4j/twY1B3bXTPkinRKVqaGN3suQyWIpSbNQdMLCyIEitoo
	 noUgPCboAKk4yejoWJUtmSUMg2LR5/iBEHKrsuxu2MvlJB6Kk9ZltjOjQpcGc8bEPK
	 c7B6YEKAsnCnVRoIDLNCWO5VADAa84vB38oGRI7VmBuESX+scMcnW1LxrR4IGkATwz
	 ACo4atEMA8y86H2cpv0cPdWKc+rPGhLiboMpBrYCfJUWKSJLa/Q1qqmhRad8k9tgcF
	 cRyZ42EJ8poVBbQCfI6WlcGRa1RlJ5jf3nXNtYmRksCm4y7Hlm3NhK4ntc1WNX9lH4
	 sRHXYZpUOtfIA==
Received: by mail.kernel.org with local (Exim 4.94.2)
	(envelope-from <mchehab@kernel.org>)
	id 1lwpHU-004mvf-1L; Fri, 25 Jun 2021 19:06:16 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linuxarm@huawei.com,
	mauro.chehab@huawei.com,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Lee Jones <lee.jones@linaro.org>,
	Derek Kiernan <derek.kiernan@xilinx.com>,
	Dragan Cvetic <dragan.cvetic@xilinx.com>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Axel Lin <axel.lin@ingics.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v9 0/5] Move Hisilicon 6421v600 SPMI and USB drivers  out of staging
Date: Fri, 25 Jun 2021 19:06:09 +0200
Message-Id: <cover.1624640087.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>

Hi Greg,

This series contain the final bits needed for the USB3 bus to work
without staging drivers on Hikey 970.

It takes a different approach from the past series: basically,
it moves all IRQ related stuff into a new driver ( hi6421v600-irq),
and the MFD driver (hi6421-spmi-pmic) is now quit simple:
it contains just probe and regmap, which attaches into
two MFD "child" drivers (a regulator driver and an IRQ one).

This series also fixes a sutile bug recently introduced via the
regulator tree (patch 2).

Basically, the SPMI/MFD driver combination already uses the
platform data, but the new patch re-uses it to store a mutex
instead, overlapping the previous usage.

This was unoticed on my past tests, as there were some
unused data at the platform struct, that were big enough
to store a mutex, but when I tried to remove it, it caused
crashes and instability at the board.

Regards,
Mauro

Mauro Carvalho Chehab (5):
  staging: hikey9xx: split hi6421v600 irq into a separate driver
  regulator: hi6421v600-regulator: fix platform drvdata
  mfd: hi6421-spmi-pmic: move driver from staging
  dts: hisilicon: add support for the PMIC found on Hikey 970
  dts: hisilicon: add support for USB3 on Hikey 970

 .../mfd/hisilicon,hi6421-spmi-pmic.yaml       | 134 ++++++++
 MAINTAINERS                                   |   7 +
 .../boot/dts/hisilicon/hi3670-hikey970.dts    | 129 ++++++--
 arch/arm64/boot/dts/hisilicon/hi3670.dtsi     |  56 ++++
 .../boot/dts/hisilicon/hikey970-pmic.dtsi     |  87 +++++
 drivers/mfd/Kconfig                           |  16 +
 drivers/mfd/Makefile                          |   1 +
 drivers/mfd/hi6421-spmi-pmic.c                |  72 ++++
 drivers/misc/Kconfig                          |  10 +
 drivers/misc/Makefile                         |   1 +
 drivers/misc/hi6421v600-irq.c                 | 312 ++++++++++++++++++
 drivers/regulator/hi6421v600-regulator.c      |  26 +-
 drivers/staging/Kconfig                       |   2 -
 drivers/staging/Makefile                      |   1 -
 drivers/staging/hikey9xx/Kconfig              |  19 --
 drivers/staging/hikey9xx/Makefile             |   3 -
 drivers/staging/hikey9xx/TODO                 |   5 -
 drivers/staging/hikey9xx/hi6421-spmi-pmic.c   | 311 -----------------
 .../hikey9xx/hisilicon,hi6421-spmi-pmic.yaml  | 134 --------
 include/linux/mfd/hi6421-spmi-pmic.h          |  14 +-
 20 files changed, 822 insertions(+), 518 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml
 create mode 100644 arch/arm64/boot/dts/hisilicon/hikey970-pmic.dtsi
 create mode 100644 drivers/mfd/hi6421-spmi-pmic.c
 create mode 100644 drivers/misc/hi6421v600-irq.c
 delete mode 100644 drivers/staging/hikey9xx/Kconfig
 delete mode 100644 drivers/staging/hikey9xx/Makefile
 delete mode 100644 drivers/staging/hikey9xx/TODO
 delete mode 100644 drivers/staging/hikey9xx/hi6421-spmi-pmic.c
 delete mode 100644 drivers/staging/hikey9xx/hisilicon,hi6421-spmi-pmic.yaml

-- 
2.31.1


