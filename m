Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD4070
	for <linux-staging@lists.linux.dev>; Wed, 19 May 2021 03:32:14 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id v14so5731790pgi.6
        for <linux-staging@lists.linux.dev>; Tue, 18 May 2021 20:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7wVF+iyY+kYlSNZc2QC2Z8VNfrjdof9DM0HbDZzRDL4=;
        b=aOyqJAKwmvsZyYiDlUgzeEe/3RU9eb2s4NxJULYlSTuRDmMUpja71h7HaBZCys3UiM
         CvuNuAGePQq3xt4HR/9abBde1nJuD7GVHZ0HsUIHFzUfsdVBypZd4eN9GUlbUBPK2eJK
         UxUw9pum7YIYqf3WsRXFz6NaOOhSEVU3+HDZvqBUtrK5DXb/ZQjuY89L1vy0EBFk/U4b
         aqwAzsRpM09sWwCVZneSlmxH3LJTbl9P261eXTjbD6YI23EMXIV87n7w1ocOywVo8nhU
         l2Va1mQuBjm5T4HlTs7PLEegs06/FyFPV3BfxpCdgZ+sOsVxstOMRHAmPxINpfe89zJk
         wDXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7wVF+iyY+kYlSNZc2QC2Z8VNfrjdof9DM0HbDZzRDL4=;
        b=dBVbWDE7n9YddSjk0xDXmF6NffMVCDjUpbYKtYfNnVFqGHYLxb1Q9RnHluGWx4PcSc
         eQpAPEA+nZelsUgx/1oQiu9RAs3IIXmw881oTHk6/vyUJpZxhazv5XmhQXRa6pPsPmdZ
         jYrdPPg2c8QMmo+UkrsFsbAQ/772A/9XGRCkR6rj50AU05CiznMFd9R9EjzBUZMxxhlS
         kSKEJ06L46ZtuKg5HAqtsY833ifScR3VFG8yVBTi+PC9ROjFl+UK/aXA5n5ETEJUT8Qx
         FvA3GUOgfhrZWAGlEaji04dMxku5imDu5tWSXX+q9DA11m2k2MHxFLo6zrG+W6/L0Mvy
         oHrA==
X-Gm-Message-State: AOAM533KmpJjrn7HkAUq5wxkxHklMa1q96RwqXDPMnihquZB/SIu6Vn4
	SCF0k3DNKcn6vZD//L7rdrs=
X-Google-Smtp-Source: ABdhPJzL5kZiNFGM+U3ygMPBbAYn/1cVFHYVTB5yxRM5MpHnBFLDvopgXYW7dJID7qZzvU4Ng4kDrQ==
X-Received: by 2002:aa7:8207:0:b029:251:20c1:1861 with SMTP id k7-20020aa782070000b029025120c11861mr8476632pfi.13.1621395134400;
        Tue, 18 May 2021 20:32:14 -0700 (PDT)
Received: from localhost.localdomain ([138.197.212.246])
        by smtp.gmail.com with ESMTPSA id g13sm8244587pfr.75.2021.05.18.20.32.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 May 2021 20:32:13 -0700 (PDT)
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
Subject: [PATCH net-next v2 0/4] MT7530 interrupt support
Date: Wed, 19 May 2021 11:31:58 +0800
Message-Id: <20210519033202.3245667-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for MT7530 interrupt controller.

DENG Qingfang (4):
  net: phy: add MediaTek Gigabit Ethernet PHY driver
  net: dsa: mt7530: add interrupt support
  dt-bindings: net: dsa: add MT7530 interrupt controller binding
  staging: mt7621-dts: enable MT7530 interrupt controller

 .../devicetree/bindings/net/dsa/mt7530.txt    |   6 +
 drivers/net/dsa/mt7530.c                      | 264 ++++++++++++++++--
 drivers/net/dsa/mt7530.h                      |  20 +-
 drivers/net/phy/Kconfig                       |   5 +
 drivers/net/phy/Makefile                      |   1 +
 drivers/net/phy/mediatek-ge.c                 | 112 ++++++++
 drivers/staging/mt7621-dts/mt7621.dtsi        |   4 +
 7 files changed, 384 insertions(+), 28 deletions(-)
 create mode 100644 drivers/net/phy/mediatek-ge.c

-- 
2.25.1

