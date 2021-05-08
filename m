Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA1671
	for <linux-staging@lists.linux.dev>; Sat,  8 May 2021 06:52:36 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id z6so11352145wrm.4
        for <linux-staging@lists.linux.dev>; Fri, 07 May 2021 23:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2LupYRWEl/I5L4jCGYXhMRPLKYBweMWILx6M6mqnnOM=;
        b=YS8shiQvxxRlSpDauPw3BTqmg05vubHcz/1mmsUBs/sfBl5aqNWQzolz1PCwSEPaS1
         wajYBSbukBntHfl0+5fYO8F8MdzSNUTsSn23Vqmz03lNJJ16LldlXLWIUAbMxHvCylQi
         kTwCl4An0G9mkbHMYkTlTYNdYJUKMgv8tgAcjfXUQbyTM6hTPbwa+gj6/oBrW2kGktLk
         E4Q2MwCK7PReJzGEVNF7HXswub/C29sGocZJITnAbYAy8bc4R4lFt2qP0anqgpEwLXE0
         bhv+wGQxrqPJCGkng8gmPeljZqHvfq9GPHvUO8Ermxp1B/1S6p86ML3BeyD9N5N1McJK
         vBTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2LupYRWEl/I5L4jCGYXhMRPLKYBweMWILx6M6mqnnOM=;
        b=ewxIUg65bjIvcLWYKj4ExNbhYkpb6qsIFDV469HnkubSR2/gH7kzSM/y01EaUOsE92
         SbkgT3Usiqdi3VDzya/yZuaFhPbSJ/Zza1Ei7SZ4Jg5HgNUgAb+NXrZXEjzU489qeXjR
         PpeqQlWD5BG0Mnl8tXcRRu1l8c5yIFRwqkla7LtdX8QH1Y4lyWPXo3o4If48eRhxx23F
         7dwhnpv6HicxlE5R0tPVZm2DzSTO8TdeiuN0OphIg3eaHQnLDOmM6qrQfvMnFJ3ARPDV
         OKxSTHjd5MR2ASrhCqJquljQuIPL7SzFSF1c+anQlpZpaJiOABzMu8VWxpGvHbRTf9eT
         7WlA==
X-Gm-Message-State: AOAM531anKF4vd+dC6/AnZQhlOhBvjcAggOSHrbLwqwrDPK+ROySd0G3
	1HQEvl+7oEIE/4ueY/6FV+c=
X-Google-Smtp-Source: ABdhPJythu6Kp8Dz41LTXrPCxI4LAb/pj1QOD4MQAkOisM1HRDXaqD/FC+f1fVqK9IzqPAdwMS3nxw==
X-Received: by 2002:a5d:660c:: with SMTP id n12mr17415299wru.87.1620456755274;
        Fri, 07 May 2021 23:52:35 -0700 (PDT)
Received: from localhost.localdomain (231.red-83-51-243.dynamicip.rima-tde.net. [83.51.243.231])
        by smtp.gmail.com with ESMTPSA id b12sm11638010wro.28.2021.05.07.23.52.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 May 2021 23:52:34 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: vkoul@kernel.org
Cc: linux-phy@lists.infradead.org,
	kishon@ti.com,
	linux-staging@lists.linux.dev,
	gregkh@linuxfoundation.org,
	neil@brown.name,
	ilya.lipnitskiy@gmail.com
Subject: [PATCH v2 0/6] phy: ralink: mt7621-pci-phy: some improvements
Date: Sat,  8 May 2021 08:52:26 +0200
Message-Id: <20210508065232.4882-1-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This series contains some improvements in the pci phy driver
for MT7621 SoCs.

MT7621 SoC clock driver has already mainlined in
'commit 48df7a26f470 ("clk: ralink: add clock driver for mt7621 SoC")'

Because of this we can update schema documentation and device tree
to add related clock entries and avoid custom architecture code
in favour of using the clock kernel framework to retrieve clock
frequency needed to properly configure the PCIe related Phys.

After this changes there is no problem to properly enable this
driver for COMPILE_TEST.

Configuration has also modified from 'tristate' to 'bool' depending
on PCI_MT7621 which seems to have more sense.

Thanks in advance for your time.

Changes in v2:
    - Drop 'clock-names' property from device tree and binding
      doc sice only one clock is needed.
    - Update driver code to don't get clock name as identifier 
      for the clock but just use NULL.
    - Add patch to fix a COMPILE_TEST reported issue because
      of the way printing of a pointer was being done. This
      patch was already send by its own[0] but to have all of this
      applied together I prefer to include it here.

Best regards,
    Sergio Paracuellos

[0]: http://lists.infradead.org/pipermail/linux-phy/2021-May/000395.html

Sergio Paracuellos (6):
  staging: mt7621-dts: use clock in pci phy nodes
  dt-bindings: phy: mediatek,mt7621-pci-phy: add clock entries
  phy: ralink: phy-mt7621-pci: use kernel clock APIS
  phy: ralink: Kconfig: enable COMPILE_TEST on mt7621-pci-phy driver
  phy: ralink: Kconfig: convert mt7621-pci-phy into 'bool'
  phy: ralink: phy-mt7621-pci: properly print pointer address

 .../bindings/phy/mediatek,mt7621-pci-phy.yaml |  5 +++
 drivers/phy/ralink/Kconfig                    |  4 +-
 drivers/phy/ralink/phy-mt7621-pci.c           | 37 +++++++++++--------
 drivers/staging/mt7621-dts/mt7621.dtsi        |  2 +
 4 files changed, 31 insertions(+), 17 deletions(-)

-- 
2.25.1

