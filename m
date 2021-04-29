Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576BF2F82
	for <linux-staging@lists.linux.dev>; Thu, 29 Apr 2021 06:21:42 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id c19so749756pfv.2
        for <linux-staging@lists.linux.dev>; Wed, 28 Apr 2021 23:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cSEiNE02KkOTwO/RKhNbgZVSZuIXExN7hZU+pPtcLaA=;
        b=nbSHE1l3NP5OwYE5EpCU3ThMiKP9NsP7Bywu8FPOZy/Vzh1szBvBOiCkGq0abTdHRm
         OMQYBr1XHVHRpEcHVV9RTUkXRFru5qiZCDHr7hsFf/8U2mSbpbA33gCWUGiQHv4L7Zor
         3D1oINl27NIFDJc4gBBz6XuyFym0FTIgM0fSC+r6dpw/CN+ZGnojk2ObkUjzqKDJJQC4
         ieNpsLMxVPLIjFGSg6XXMSol+kM4D9RdkZS85jszhApH4uPJMF3xe/2+nRuN8y/QdLB/
         Ba8aAkqt5AatUncj+gqkcn6S3l6uyWPaIlkUKYDscyQZjfbsBBsDr4pv4hQ6BLZy7Q4B
         /V2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cSEiNE02KkOTwO/RKhNbgZVSZuIXExN7hZU+pPtcLaA=;
        b=VPJvrsGDJtk9o0s6Ij0RP4+OcEKdFJqKfw4EwQ4rz17dEOJ05Czxwa00nzIhHrrI6q
         vj7KU2FhooojkoHp0O3i+4m3u1DOYyt0yrdZywMq4SUcdPoE24SQq8vkUAVrMRMDPDme
         EJgfOanV5d7b5G00rggFthF+ljqhRdTRveKJHKt2k7Yocryb8QE84P61pUEeTvJyTwVw
         /iAyJAMnYaOOC/aBpOTI1+iTxvQkVDyPrRYxwvlPrcPiX/F/YEyR20dS51lcGSTcfs9B
         dvlHql5/lBHQ0vLhkqBA6Pf/t54ACb4XPkC17qsz6eD9Sk/agd3F1wseQQ/xNh35xs/t
         2+Vw==
X-Gm-Message-State: AOAM5313PaAvmDDFxego2xSmhv6MXD1qnO1jFdLLwt4zgStSPPnSbX7q
	98MTp+gJshdODAT2aINWipQ=
X-Google-Smtp-Source: ABdhPJxCISaXTPCHZ6fvrC28Ztfs6TYBjxQ36OVnc7nf0Q2Y0g2Un2fmRrsDf5JqqBpiA+kSQoYlHQ==
X-Received: by 2002:a05:6a00:1494:b029:278:a4bc:957f with SMTP id v20-20020a056a001494b0290278a4bc957fmr15386193pfu.55.1619677301870;
        Wed, 28 Apr 2021 23:21:41 -0700 (PDT)
Received: from localhost.localdomain ([138.197.212.246])
        by smtp.gmail.com with ESMTPSA id b7sm1431008pfi.42.2021.04.28.23.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Apr 2021 23:21:41 -0700 (PDT)
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
Subject: [PATCH net-next 0/4] MT7530 interrupt support
Date: Thu, 29 Apr 2021 14:21:26 +0800
Message-Id: <20210429062130.29403-1-dqfext@gmail.com>
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
 drivers/net/dsa/mt7530.c                      | 264 ++++++++++++++++--
 drivers/net/dsa/mt7530.h                      |  20 +-
 drivers/net/phy/Kconfig                       |   5 +
 drivers/net/phy/Makefile                      |   1 +
 drivers/net/phy/mediatek.c                    | 112 ++++++++
 drivers/staging/mt7621-dts/mt7621.dtsi        |   4 +
 8 files changed, 385 insertions(+), 28 deletions(-)
 create mode 100644 drivers/net/phy/mediatek.c

-- 
2.25.1

