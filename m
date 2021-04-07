Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BEA070
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 04:50:49 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id il9-20020a17090b1649b0290114bcb0d6c2so627228pjb.0
        for <linux-staging@lists.linux.dev>; Tue, 06 Apr 2021 21:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oHeyYOhTyr/Pj14dswoKpegMv2vJUh025+BN2sVtXu8=;
        b=roY/yLJtJzRhg3AFY5kSDhSdJzO7TXsC74zJKVKeUspDEKjofDINCo3OIsNJ8aAIhy
         ZqlAc69WUGI4DTk2wDz61IpEh/q8U+hB1v37/3I+9CeVRXzgQz/7liKOINnPfwD/iadg
         ZoU6lGUBUkI3lTT2pqoD7bTUL487cp5i7vzh0WvtoFZtzOMMQgubNQF9T+ot35w6SQmf
         CfS3Jo6JPrSprlsL6QkVpJ51y4oZDLoRcjSnSG+XUa9Etafe645llvI9mbDvAQcB0mRb
         EF5NVOr2vF50EhBbR0AcriXLgHvMXYxgvGz7qs58yWr5HHzhtCgH+PNEjzanK223MHpt
         0qdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oHeyYOhTyr/Pj14dswoKpegMv2vJUh025+BN2sVtXu8=;
        b=YnY9e6eexeU8NG78MS9i5AzST0+jCIfe19p6nUnWc5RJMKlUp4lGU97RVDym5rKjzx
         QeLIXL/RAH2uu87UPPr4TPoJ2dx8psAaMt+dB2AeOTcv2ZaLaSHIoEUapG57/9kv9W4w
         47DhckVRDNAGM3cEGiAXW5cA1Dsw53DPmAjUzXSVBk/MATnxwjQCz1L3/oDob0Yb7llr
         fp2OsgSCTAp36OYlLGqvUqR8sfZDQzqCPr02gLbrweoidgPNYUupFGdcBVKPkwYIIaWi
         UkSUsSKOSIhyeQ46sEr3tvfLED3ILe6xBJLfFkQ19X0jWsKt46IO27Mq47tiliic97me
         7suA==
X-Gm-Message-State: AOAM532s8TbIGDSvQslsXhBSX5g6nnwnPjYe0fDmW5iTi9LqHhyZZ7Xk
	BQGZm1raC7JDZWgposYxUmo=
X-Google-Smtp-Source: ABdhPJypi5n57JibwUe2l03PZQJOpv/eeU/jgVCqqreTiZ/weG7cr23O4MMOTkU2gI8gQYx8/djOSw==
X-Received: by 2002:a17:902:bd8f:b029:e6:ec5a:3a6 with SMTP id q15-20020a170902bd8fb02900e6ec5a03a6mr1526114pls.31.1617771049034;
        Tue, 06 Apr 2021 21:50:49 -0700 (PDT)
Received: from localhost.localdomain ([138.197.212.246])
        by smtp.gmail.com with ESMTPSA id n52sm882679pfv.13.2021.04.06.21.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 21:50:47 -0700 (PDT)
From: DENG Qingfang <dqfext@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
	Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Landen Chao <Landen.Chao@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Sean Wang <sean.wang@mediatek.com>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-staging@lists.linux.dev,
	devicetree@vger.kernel.org,
	netdev@vger.kernel.org
Cc: Weijie Gao <weijie.gao@mediatek.com>,
	Chuanhong Guo <gch981213@gmail.com>,
	=?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>
Subject: [RFC v2 net-next 0/4] MT7530 interrupt support
Date: Wed,  7 Apr 2021 12:50:34 +0800
Message-Id: <20210407045038.1436843-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for MT7530 interrupt controller.

DENG Qingfang (4):
  net: phy: add MediaTek PHY driver
  net: dsa: mt7530: add interrupt support
  dt-bindings: net: dsa: add MT7530 interrupt controller binding
  staging: mt7621-dts: enable MT7530 interrupt controller

 .../devicetree/bindings/net/dsa/mt7530.txt    |   5 +
 drivers/net/dsa/mt7530.c                      | 203 ++++++++++++++++--
 drivers/net/dsa/mt7530.h                      |  18 +-
 drivers/net/phy/Kconfig                       |   5 +
 drivers/net/phy/Makefile                      |   1 +
 drivers/net/phy/mediatek.c                    | 109 ++++++++++
 drivers/staging/mt7621-dts/mt7621.dtsi        |   3 +
 7 files changed, 323 insertions(+), 21 deletions(-)
 create mode 100644 drivers/net/phy/mediatek.c

-- 
2.25.1

