Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0E772
	for <linux-staging@lists.linux.dev>; Sat, 15 May 2021 12:40:59 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id s8so1740007wrw.10
        for <linux-staging@lists.linux.dev>; Sat, 15 May 2021 05:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YWAKRSKjuVwXHj547jD7swDaSS5/nkXNep5jUTBM2h8=;
        b=rmGbSlQtviY60sTtjMrRQOGtfSOh7vaReKMjtlVGS8LMRasQDY2hvNq50q67ibQ3yZ
         +cIWIDqV9mVpFb6wuu92gxzngGbCkJRetXvZwPsLjzyUuGI25OetjhprgI1moAJmceyS
         bDI3NbA7QvBH+pgXV0AOzV67k3zbP9a7Ah9Y3YG9a8Av7Me0U3Y1blSjNCjIqZjVsZ4/
         hZADEq7vtUFz8tntMbgtQ2glc3Zu/fXMPRP094sUyRU6csgrelVhDKQ+StyXdSa/VHa5
         COi/frdkEWRPMl5qvmnzg1XkDuHrqO4I5Yffx+QxV4TbE9yIGgOiSKfefqmv+YufblHe
         kVMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YWAKRSKjuVwXHj547jD7swDaSS5/nkXNep5jUTBM2h8=;
        b=R/l7UhH+RnkO92WfnGm5f+wILxWnu4Qdntpr4FIS7MT5sbaAr3rhdlnPihwlJY6XYy
         KXrf03+3bMk5oM0dVKKRrEJigL0cnUh4dKjb/N/a4c9+QXTTq8qhE+foGOM5oukx4lu5
         Z9/41/vq8Z1wq3W29ILYqa9CyDRT0QqBEmzR0l7Kr7Mc/JeroJvl/nDgyXuV/DJ5z4ja
         tuqaUQHU4vnm4iCpCSzmYvTZp7jkiE2Yz8KzTrJOHlfr+y/0BdQQnFJ88JtJ2bh7FUTd
         fLuEvXFLUdt2l0xSQNgBq0zDiBO6/MAcAxVnx0raab0D3aYlBGQ/5Gr4j+hD6weatXWA
         HXsw==
X-Gm-Message-State: AOAM531kgJvs4SqfbGLx9w4LOYjT3NHk6JG6tr8AkVWim/lEsvjQaPoV
	7g9yH1ts4zFePa6NpJwyNho=
X-Google-Smtp-Source: ABdhPJye3BL6Wtnn7eS7GpkzG94zZqlaXHdv49/2d9179RGlmN8Fcx+CPEw2MIp7hIbHcWI8vH22lQ==
X-Received: by 2002:adf:fc44:: with SMTP id e4mr784584wrs.23.1621082457854;
        Sat, 15 May 2021 05:40:57 -0700 (PDT)
Received: from localhost.localdomain (29.red-83-49-33.dynamicip.rima-tde.net. [83.49.33.29])
        by smtp.gmail.com with ESMTPSA id w7sm9472749wru.51.2021.05.15.05.40.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 15 May 2021 05:40:57 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: linux-mips@vger.kernel.org
Cc: tsbogend@alpha.franken.de,
	devicetree@vger.kernel.org,
	matthias.bgg@gmail.com,
	john@phrozen.org,
	bhelgaas@google.com,
	robh+dt@kernel.org,
	linux-staging@lists.linux.dev,
	gregkh@linuxfoundation.org,
	neil@brown.name,
	ilya.lipnitskiy@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org
Subject: [PATCH 0/4] MIPS: ralink: pci: driver for Pcie controller in MT7621 SoCs
Date: Sat, 15 May 2021 14:40:51 +0200
Message-Id: <20210515124055.22225-1-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MediaTek MT7621 PCIe subsys supports single Root complex (RC)
with 3 Root Ports. Each Root Ports supports a Gen1 1-lane Link.
Topology is as follows:

                          MT7621 PCIe HOST Topology

                                   .-------.
                                   |       |
                                   |  CPU  |
                                   |       |
                                   '-------'
                                       |
                                       |
                                       |
                                       v
                              .------------------.
                  .-----------|  HOST/PCI Bridge |------------.
                  |           '------------------'            |     Type1 
         BUS0     |                     |                     |    Access 
                  v                     v                     v    On Bus0
          .-------------.        .-------------.       .-------------.
          | VIRTUAL P2P |        | VIRTUAL P2P |       | VIRTUAL P2P |
          |    BUS0     |        |    BUS0     |       |    BUS0     |
          |    DEV0     |        |    DEV1     |       |    DEV2     |
          '-------------'        '-------------'       '-------------'
    Type0        |          Type0       |         Type0       |
   Access   BUS1 |         Access   BUS2|        Access   BUS3|
   On Bus1       v         On Bus2      v        On Bus3      v
           .----------.           .----------.          .----------.
           | Device 0 |           | Device 0 |          | Device 0 |
           |  Func 0  |           |  Func 0  |          |  Func 0  |
           '----------'           '----------'          '----------'

This driver has been very long time in staging and I have been cleaning
it from its first versions where there was code kaos and PCI_LEGACY support.
Original code came probably from openWRT based on mediatek's SDK code. There
is no documentation at all about the mt7621 PCI subsystem.
I have been cleaning it targeting mt7621 SoC which is the one I use in
my GNUBee PC1 board and HiLink HLK-MT7621A evaluation board.

Now I think is clean enough to be moved into 'arch/mips/pci'.

This driver also uses already mainlined pci phy driver located in
'drivers/phy/ralink/phy-mt7621-pci.c'. There are two instances of
the phy being the first one dual ported for pci0 and pci1, and the 
second one not dual ported dedicated to pci2. Because of writing twice 
some phy registers of the dual-ported one sometimes become in not
confident boot cycles we have to take care of this when device link
is checked here in controller driver. We power on the dual ported-phy
if there is something connected in pcie0 or pcie1. In the same manner
we have to properly disable it only if nothing is connected in of both
pcie0 and pci1 slots.

Another thing that must be mentioned is that this driver uses IO
in physical address 0x001e160000. IO_SPACE_LIMIT for MIPS is 0xffff
so some generic PCI functions (like of_pci_range_to_resource) won't
work and the resource ranges part for IO is set manually.

I had already sent binding documentation to be reviewed but I am
include also here with the driver itself and this cover letter
to make easy review process.

Best regards,
    Sergio Paracuellos

Sergio Paracuellos (4):
  dt-bindings: mt7621-pci: PCIe binding documentation for MT7621 SoCs
  MIPS: pci: Add driver for MT7621 PCIe controller
  staging: mt7621-pci: remove driver from staging
  MAINTAINERS: add myself as maintainer of the MT7621 PCI controller
    driver

 .../bindings/pci/mediatek,mt7621-pci.yaml     | 149 ++++++++++++++++++
 MAINTAINERS                                   |   6 +
 arch/mips/pci/Makefile                        |   1 +
 .../mt7621-pci => arch/mips/pci}/pci-mt7621.c |   0
 arch/mips/ralink/Kconfig                      |   9 +-
 drivers/staging/Kconfig                       |   2 -
 drivers/staging/Makefile                      |   1 -
 drivers/staging/mt7621-pci/Kconfig            |   8 -
 drivers/staging/mt7621-pci/Makefile           |   2 -
 drivers/staging/mt7621-pci/TODO               |   4 -
 .../mt7621-pci/mediatek,mt7621-pci.txt        | 104 ------------
 11 files changed, 164 insertions(+), 122 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pci/mediatek,mt7621-pci.yaml
 rename {drivers/staging/mt7621-pci => arch/mips/pci}/pci-mt7621.c (100%)
 delete mode 100644 drivers/staging/mt7621-pci/Kconfig
 delete mode 100644 drivers/staging/mt7621-pci/Makefile
 delete mode 100644 drivers/staging/mt7621-pci/TODO
 delete mode 100644 drivers/staging/mt7621-pci/mediatek,mt7621-pci.txt

-- 
2.25.1
