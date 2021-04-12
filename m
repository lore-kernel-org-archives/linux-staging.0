Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF36D71
	for <linux-staging@lists.linux.dev>; Mon, 12 Apr 2021 03:42:47 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id t22so5309346ply.1
        for <linux-staging@lists.linux.dev>; Sun, 11 Apr 2021 20:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TbV7aHs7TaIhyV0H0KiEJQJbVjhXqA5DKHSoe6+ECPw=;
        b=P49so0HJzAqTv6dJXeU7iuIOm7fDFNyyZSoqpw0IGgN2WT+OcbM9TVUJvnSps2D6FV
         ocO0sEZhJJMEU8qIE/a51GoTocEhwzbbkMoH0Cbmf+i9p+bbVlTM5qiDzKSJ37wOZC3+
         2pUZyv/F3wPJPIoqSvt0bd2RN12rfYLYmzhOb5YGyAoZm8uFGpsriEsX+57HU1yUB7Iy
         mI8w5yu0620bLR90MrBddwfrU7ye/05QYa9LKIlsWV9iWDE99DJJVsYSU6B4PcYuMQgd
         59B/WiVnFR7obFfZ8ZEmiSr7tMKT1M3t95asjWXeRUB4DUBYPIf4toqvDlwXT924+iyM
         MxrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TbV7aHs7TaIhyV0H0KiEJQJbVjhXqA5DKHSoe6+ECPw=;
        b=D9d8onULTpLqeVsTQDtqmXmWYZiCpzC8l9y3vu5S1HcdsFtAZTNWkw13TrCtjukeRK
         hHQ9CBWbEUC62pMrhMp2F+7im7swB7O5DSFaU9r9D2hylutzwn2/cN9kVizKRuJ3R+t5
         5nx2u+fM72VpP0L9t50P4zmyfqa/BhbLfqBm+TVJr0JmDpgEEWqJpaSho3G4KOSE/T5S
         Vtgc5z1w9OqZKUhcOfRKrgLv26iwUvE5Ghl2vE8VHEFnU0RdTAYWvprWHEj0VBPLszcB
         tLlf7Ew/blBoFIGjARnWNVYLpNAHZZslWl7CIKiqpUUYal4+4B0IaZiuhUBTPsMawPS1
         lRYw==
X-Gm-Message-State: AOAM532TvzRSGnjx3tfSV55trP133Xv2nVfkiJpfYbyYmn+vtDKkk+Dz
	a0ppyN9MnEciSdpQWUcE/Ag=
X-Google-Smtp-Source: ABdhPJwdVRYU3h0l1OFzieG7ZRMhsfTOWmdz910QyVB1NKZu1Di8amy5CJ8Q0tY3NgFMgooSH6PiMQ==
X-Received: by 2002:a17:90b:390f:: with SMTP id ob15mr1860487pjb.100.1618198967574;
        Sun, 11 Apr 2021 20:42:47 -0700 (PDT)
Received: from localhost.localdomain ([138.197.212.246])
        by smtp.gmail.com with ESMTPSA id v22sm5387185pff.105.2021.04.11.20.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Apr 2021 20:42:46 -0700 (PDT)
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
	=?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>,
	Frank Wunderlich <frank-w@public-files.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>
Subject: [RFC v4 net-next 0/4] MT7530 interrupt support
Date: Mon, 12 Apr 2021 11:42:33 +0800
Message-Id: <20210412034237.2473017-1-dqfext@gmail.com>
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

 .../devicetree/bindings/net/dsa/mt7530.txt    |   6 +
 drivers/net/dsa/Kconfig                       |   1 +
 drivers/net/dsa/mt7530.c                      | 266 ++++++++++++++++--
 drivers/net/dsa/mt7530.h                      |  20 +-
 drivers/net/phy/Kconfig                       |   5 +
 drivers/net/phy/Makefile                      |   1 +
 drivers/net/phy/mediatek.c                    | 111 ++++++++
 drivers/staging/mt7621-dts/mt7621.dtsi        |   4 +
 8 files changed, 385 insertions(+), 29 deletions(-)
 create mode 100644 drivers/net/phy/mediatek.c

-- 
2.25.1

