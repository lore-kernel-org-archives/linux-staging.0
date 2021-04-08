Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7F36D0E
	for <linux-staging@lists.linux.dev>; Thu,  8 Apr 2021 12:39:30 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id i190so1696316pfc.12
        for <linux-staging@lists.linux.dev>; Thu, 08 Apr 2021 05:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+QmHxLtSKiy/M0k5RFjpXgoAxgaENLbGHZnwkZzXYD4=;
        b=eVFhWLUE7G9oQNgyvcq6kKZy8Vl0StafOcaJBTHm6NaU/B30SGmjqkSHvRpMnEu3yZ
         UFHsRB3n8VQGSK/aa3BhgFfHtwF7f6hP26FYUMstC5KPoD2P+kCxmkJTcKo7WGmNl6Zt
         j/X9WOK1TqTiiBXkcw77pZy1OmzhtK63xj06TQt5iG8jfk3cTiyy0ZCDWVkoFdSSdXDG
         uUJLVtsVKwiG9vZMhh0TNL3VmyamyrNivv/crV/eLcNX4zVeIBulNP9q5N4aBCzTGH9z
         OhCLm4GCv9pNLqNkLY9CjiyiYioQdOEoT7pIJM/iUCWYqagTEUnNE+KQ5ByHdWP9BLaU
         EhCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+QmHxLtSKiy/M0k5RFjpXgoAxgaENLbGHZnwkZzXYD4=;
        b=SNXKfbnTgd9FbqYIKD8DCMxkw//LMZwgB+9yMh4BfmRSz7pWGPyb/cItInRLs6tDsh
         n0VXA1YKbsb8224vjshVFj3jH9p557owRnB2rvUbsH+KPxklM/PdL0PyytBwMiaCeJPQ
         57MaarkXq817kK8NFrBH4xi4PyFVWksfADbAaFwblx5FlVo1gzr5hpayRPsz/Wh90yDr
         H/CsWEEmIQBj0V+xm5n5mmT1b532iTdkoYifXb6c9e32c7jHq9ucS/6dXrzBq2OyjnEA
         yH9aEMXb4Ki7Gouf92PMeFNmm//76T+5sPYEBjLlihhoNrw7jVOCkSb/i6acMMc3Ktcb
         A7SA==
X-Gm-Message-State: AOAM532p9tEK2BglaTgl+hSt/jz2/vfO/0A6+nIuUU5OwwcVOHiynZJ5
	qd3BDpjotqkiKNq1jJGhx5Y=
X-Google-Smtp-Source: ABdhPJw7NzYVa2g9FhYvGUl4llk+/2n6jSAK9mJ0yj0DoybhePdFaNz3OQqsQtplw3NZrugrjc2Azw==
X-Received: by 2002:a63:d945:: with SMTP id e5mr7632086pgj.449.1617885570300;
        Thu, 08 Apr 2021 05:39:30 -0700 (PDT)
Received: from localhost.localdomain ([138.197.212.246])
        by smtp.gmail.com with ESMTPSA id e65sm25831311pfe.9.2021.04.08.05.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 05:39:29 -0700 (PDT)
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
Subject: [RFC v3 net-next 0/4] MT7530 interrupt support
Date: Thu,  8 Apr 2021 20:39:15 +0800
Message-Id: <20210408123919.2528516-1-dqfext@gmail.com>
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
 drivers/net/dsa/Kconfig                       |   1 +
 drivers/net/dsa/mt7530.c                      | 266 ++++++++++++++++--
 drivers/net/dsa/mt7530.h                      |  20 +-
 drivers/net/phy/Kconfig                       |   5 +
 drivers/net/phy/Makefile                      |   1 +
 drivers/net/phy/mediatek.c                    | 112 ++++++++
 drivers/staging/mt7621-dts/mt7621.dtsi        |   3 +
 8 files changed, 384 insertions(+), 29 deletions(-)
 create mode 100644 drivers/net/phy/mediatek.c

-- 
2.25.1

