Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0CBB71
	for <linux-staging@lists.linux.dev>; Thu,  6 May 2021 11:15:35 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id s8so5172027wrw.10
        for <linux-staging@lists.linux.dev>; Thu, 06 May 2021 04:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZKPKjC32Qn6kjND+LenXIZJVBF0PVCvDa6k0IxhTJHs=;
        b=KgMOyS4KfgGxmnqr/4bT0Qf2amG8M8M6esBofLumfkPmpZZ3Wxy8zgDGma+ML/YhvS
         h0+zDu6rX6/rbRMsiUMdbmFYDKT14FGHCcMuVfLXHZ+H1vPYvgLfb3KqsXoA2zgsnZ0K
         o8n+TDX9+4biv2xszruxtiz+T0QFCm6CaxehPfwkDG3KjIUldnHufQjMNxCaTvLkfnHp
         Y3NwTejxApoCelJylntzNERXtdtwm5LZ1xY4s54p9fIW1z0nh+UaJhbyF6SeG73wGX2s
         8EGaK9/nc9kexFqwGUyq6JASLSTnBnARcgw5rUmmI+5+GgGp20BRwyHMcC4tqpanMx/w
         gaVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZKPKjC32Qn6kjND+LenXIZJVBF0PVCvDa6k0IxhTJHs=;
        b=jES6f+ZEYmnLxmu1BtMNTJfMku71myezU+kRObAd0J+brRL6bzCz4g+kGPYp/3SOWp
         /5pMGDWRG6qQPd33qSLPpxpOmQLBgpKOCCBbfdNf1kx74uI5YepXd1+7Ap+X5rbg6uzl
         z8Ym2VIhlF88Z/hX81lQfiVyTYjsAzWIc60nQy3LcDNOm69Ey9QgfwrIVPpFpe/UqUEx
         H5+eEci8L3o2fjXdXUZ7e2CerItD37q/AQhgb/wrFAC4O57ZJVblJot5GKu6W03zgR56
         QLvZ8Ggh3+SDnCwPakm0pXOvbaNqjKaULFHWfh7LTTk6v1huaidhB/cBHqU8r4Q+BUoe
         oCrQ==
X-Gm-Message-State: AOAM530ArX6rEqpgD8Vv7f4OBWCQNdRfXmxjsfnXBN62DS89JdAiDyNt
	JWwH6S1HDOoLaY6z38e/ydY=
X-Google-Smtp-Source: ABdhPJyEP75X+AJ8yeboScGjjt1ct0gGgAHI0daEWAMuYw/MAXK8h11es+AAXrMrI+arA/e7CozvMw==
X-Received: by 2002:a05:6000:154e:: with SMTP id 14mr4473511wry.24.1620299734257;
        Thu, 06 May 2021 04:15:34 -0700 (PDT)
Received: from localhost.localdomain (231.red-83-51-243.dynamicip.rima-tde.net. [83.51.243.231])
        by smtp.gmail.com with ESMTPSA id u5sm3642433wrt.38.2021.05.06.04.15.33
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 May 2021 04:15:33 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: vkoul@kernel.org
Cc: linux-phy@lists.infradead.org,
	kishon@ti.com,
	robh+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	gregkh@linuxfoundation.org,
	neil@brown.name,
	ilya.lipnitskiy@gmail.com
Subject: [PATCH 0/5] phy: ralink: mt7621-pci-phy: some improvements
Date: Thu,  6 May 2021 13:15:26 +0200
Message-Id: <20210506111531.21978-1-sergio.paracuellos@gmail.com>
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

Best regards,
    Sergio Paracuellos


Sergio Paracuellos (5):
  staging: mt7621-dts: use clock in pci phy nodes
  dt-bindings: phy: mediatek,mt7621-pci-phy: add clock entries
  phy: ralink: phy-mt7621-pci: use kernel clock APIS
  phy: ralink: Kconfig: enable COMPILE_TEST on mt7621-pci-phy driver
  phy: ralink: Kconfig: convert mt7621-pci-phy into 'bool'

 .../bindings/phy/mediatek,mt7621-pci-phy.yaml | 12 +++++++
 drivers/phy/ralink/Kconfig                    |  4 +--
 drivers/phy/ralink/phy-mt7621-pci.c           | 33 +++++++++++--------
 drivers/staging/mt7621-dts/mt7621.dtsi        |  4 +++
 4 files changed, 38 insertions(+), 15 deletions(-)

-- 
2.25.1

