Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37AE771
	for <linux-staging@lists.linux.dev>; Sat,  8 May 2021 07:09:34 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id u5-20020a7bc0450000b02901480e40338bso7448314wmc.1
        for <linux-staging@lists.linux.dev>; Sat, 08 May 2021 00:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rwlueIf+IiWxCtwv+6qLaPVr/+smx6r8bhHJRc9exnY=;
        b=ENb6xEsPmyfZduBiQewKtFgHGyP5rtaZO2Gygmi6Kj4oyNT6gS8j3zr72KsBZlD2DS
         6Wj/0VfJkPD+drLf0f6myXgv8qK0lHTavPgubMjbhnt40cu/9FMQXW8cQTYYxZjYqzbK
         PU/4/E6x1FSFZQYrlQt43sOWy3KLDYzE+4J3EGbzXDClbvA7bue/0cFfjuZGFD4dh3uO
         pob56iQDVCtKuydCjYKNvUCOk0pCZ1hBjH/+vElaZARB6oD8kK55pezL9MpdUdHyiqjh
         6D1lunXzAGEdawIsY/cVNc6dPSSLrn+NFqVj3fliTGDatQr3NWNVanXSoNLkddnYFyJd
         xOzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rwlueIf+IiWxCtwv+6qLaPVr/+smx6r8bhHJRc9exnY=;
        b=Yy9qFAYjGPJMYapj5mzRnn06XVF0NC5C1aivTxPHhhgha4/dRyUg1Uni4IK1/1Nw9T
         5zm+Omu+0JPZSbI1n86fBnIY9pdbetuRmZ7K8JD8CHE6+0kAD+uHXX3RvhDo5xFLwHXH
         6M0A0zMAZAHUl4zS6piZE1yVI/xwN4G0mSqxawU+WylGrIDLO0LDoAZa55y7xsMaVu4i
         rwRpzIDk/7iaRcgcowc02SGiUqxM1NDlxgLn0yZNy/B0mGOdDibQ9Uj+Tn2CQIhNs8Ea
         V7CenWmGKcQ1kqvo7znZVFdy4lIZk4Q5FdrkzWBYmgPB4XTRsuwtp6am7YMIHnB2FlTw
         WZww==
X-Gm-Message-State: AOAM532dGbk4lEypxQ+4iiDxyuJ1Ir8pKcL4F6N6lIWfQfoeU1LRJUqp
	1PLnZmsJriEMd83qeWe8MKc=
X-Google-Smtp-Source: ABdhPJw3+CpKub1oGw45gE5B6si8v9+9YFBdVKGtSfiv17DJ3EObZYQDlQHyt8/XZRyMa0OF98DjVg==
X-Received: by 2002:a1c:9d43:: with SMTP id g64mr14242588wme.140.1620457772842;
        Sat, 08 May 2021 00:09:32 -0700 (PDT)
Received: from localhost.localdomain (231.red-83-51-243.dynamicip.rima-tde.net. [83.51.243.231])
        by smtp.gmail.com with ESMTPSA id s18sm11740345wro.95.2021.05.08.00.09.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 08 May 2021 00:09:32 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: vkoul@kernel.org
Cc: kishon@ti.com,
	devicetree@vger.kernel.org,
	linux-phy@lists.infradead.org,
	robh+dt@kernel.org,
	linux-staging@lists.linux.dev,
	gregkh@linuxfoundation.org,
	neil@brown.name,
	ilya.lipnitskiy@gmail.com
Subject: [PATCH RESEND v2 0/6] phy: ralink: mt7621-pci-phy: some improvements
Date: Sat,  8 May 2021 09:09:24 +0200
Message-Id: <20210508070930.5290-1-sergio.paracuellos@gmail.com>
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

Changes in v2 resed:
    - Forgot to send the series to devicetree list. Sorry for inconvenience.

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

