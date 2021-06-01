Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F21442FBF
	for <linux-staging@lists.linux.dev>; Tue,  1 Jun 2021 09:11:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 740A461396;
	Tue,  1 Jun 2021 09:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1622538668;
	bh=KHbaP0oThoyIuyvZgIxcywmbQIVlr7bH6FIPBbBUg+E=;
	h=From:To:Cc:Subject:Date:From;
	b=LjJW+CAVSRZP4LpPQE/e/LMhLd3PoiCpDmPP6z+EL0Q/08vk8zugVMOgRoEdXpFos
	 2ahO0FaJ81HmgsS0JW1BVTA/UcS9/3/Um0ovXkULEz4PsazRjfK2YwhAjUTp+zAR/+
	 tmg5tg4Oo/ejmdM2iryYkyKMAFotTShs0HICSGBQPz/fLfYB11g2eY7iRLNbZldweQ
	 uNtukRZdBHPckCUyB14lNRPP1uVlSMmseLdCNgtnB7yQ2N98BRz1yDqgT8lrzt05Ey
	 e71YXBnuCNuCzOrqHM7kLcTqb6dnR93xBtkUql5O2xbli9Cf1+RfI8nFs4cSripfrj
	 H6faVBc57iJug==
Received: by mail.kernel.org with local (Exim 4.94.2)
	(envelope-from <mchehab@kernel.org>)
	id 1lo0QT-000vRf-Uy; Tue, 01 Jun 2021 11:11:05 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Cc: linuxarm@huawei.com,
	mauro.chehab@huawei.com,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v2 0/3] Move av7110 driver to staging
Date: Tue,  1 Jun 2021 11:11:01 +0200
Message-Id: <cover.1622537534.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>

This driver was written for a hardware manufactured by TI from
a design made by Convergence. Such hardware supports only
MPEG2, which doesn't fit most of the current DVB transmissions.

It stopped being manufactured more than a decade ago.

Also, recent checks identified that a frontend used by such driver
was broken for sometime without nobody noticing it.

It means that it is time to retire it for good.

This series move both av7110 and sp8870 frontend drivers (which
is used only by av7110) to staging, while keeping the remaining
ttpci support upstream.

It also moves ttpci-eeprom to a common place, as it is used by
both a PCI and an USB driver.

---

v2:
  - Fix a typo at the TODO file;
  - Add a note at TODO that cleanup patches won't be accepted;
  - Changed the description of the second patch.

Mauro Carvalho Chehab (3):
  media: move ttpci-eeprom to common
  media: av7110: move driver to staging
  media: sp8870: move it to staging

 drivers/media/common/Kconfig                  |  4 +
 drivers/media/common/Makefile                 |  1 +
 .../{pci/ttpci => common}/ttpci-eeprom.c      |  0
 .../{pci/ttpci => common}/ttpci-eeprom.h      |  0
 drivers/media/dvb-frontends/Kconfig           | 12 ---
 drivers/media/dvb-frontends/Makefile          |  1 -
 drivers/media/pci/ttpci/Kconfig               | 74 ---------------
 drivers/media/pci/ttpci/Makefile              | 11 +--
 drivers/media/pci/ttpci/budget.h              |  2 +-
 drivers/media/usb/Kconfig                     |  5 -
 drivers/media/usb/dvb-usb/Makefile            |  2 +-
 drivers/staging/media/Kconfig                 |  2 +
 drivers/staging/media/Makefile                |  1 +
 drivers/staging/media/av7110/Kconfig          | 94 +++++++++++++++++++
 drivers/staging/media/av7110/Makefile         | 22 +++++
 drivers/staging/media/av7110/TODO             |  3 +
 .../ttpci => staging/media/av7110}/av7110.c   |  0
 .../ttpci => staging/media/av7110}/av7110.h   |  0
 .../media/av7110}/av7110_av.c                 |  0
 .../media/av7110}/av7110_av.h                 |  0
 .../media/av7110}/av7110_ca.c                 |  0
 .../media/av7110}/av7110_ca.h                 |  0
 .../media/av7110}/av7110_hw.c                 |  0
 .../media/av7110}/av7110_hw.h                 |  0
 .../media/av7110}/av7110_ipack.c              |  0
 .../media/av7110}/av7110_ipack.h              |  0
 .../media/av7110}/av7110_ir.c                 |  0
 .../media/av7110}/av7110_v4l.c                |  0
 .../media/av7110}/budget-patch.c              |  0
 .../media/av7110}/dvb_filter.c                |  0
 .../media/av7110}/dvb_filter.h                |  0
 .../media/av7110}/sp8870.c                    |  0
 .../media/av7110}/sp8870.h                    |  0
 33 files changed, 130 insertions(+), 104 deletions(-)
 rename drivers/media/{pci/ttpci => common}/ttpci-eeprom.c (100%)
 rename drivers/media/{pci/ttpci => common}/ttpci-eeprom.h (100%)
 create mode 100644 drivers/staging/media/av7110/Kconfig
 create mode 100644 drivers/staging/media/av7110/Makefile
 create mode 100644 drivers/staging/media/av7110/TODO
 rename drivers/{media/pci/ttpci => staging/media/av7110}/av7110.c (100%)
 rename drivers/{media/pci/ttpci => staging/media/av7110}/av7110.h (100%)
 rename drivers/{media/pci/ttpci => staging/media/av7110}/av7110_av.c (100%)
 rename drivers/{media/pci/ttpci => staging/media/av7110}/av7110_av.h (100%)
 rename drivers/{media/pci/ttpci => staging/media/av7110}/av7110_ca.c (100%)
 rename drivers/{media/pci/ttpci => staging/media/av7110}/av7110_ca.h (100%)
 rename drivers/{media/pci/ttpci => staging/media/av7110}/av7110_hw.c (100%)
 rename drivers/{media/pci/ttpci => staging/media/av7110}/av7110_hw.h (100%)
 rename drivers/{media/pci/ttpci => staging/media/av7110}/av7110_ipack.c (100%)
 rename drivers/{media/pci/ttpci => staging/media/av7110}/av7110_ipack.h (100%)
 rename drivers/{media/pci/ttpci => staging/media/av7110}/av7110_ir.c (100%)
 rename drivers/{media/pci/ttpci => staging/media/av7110}/av7110_v4l.c (100%)
 rename drivers/{media/pci/ttpci => staging/media/av7110}/budget-patch.c (100%)
 rename drivers/{media/pci/ttpci => staging/media/av7110}/dvb_filter.c (100%)
 rename drivers/{media/pci/ttpci => staging/media/av7110}/dvb_filter.h (100%)
 rename drivers/{media/dvb-frontends => staging/media/av7110}/sp8870.c (100%)
 rename drivers/{media/dvb-frontends => staging/media/av7110}/sp8870.h (100%)

-- 
2.31.1


