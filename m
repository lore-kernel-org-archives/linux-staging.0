Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7934C70
	for <linux-staging@lists.linux.dev>; Wed, 19 May 2021 03:32:39 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id 69so6242166plc.5
        for <linux-staging@lists.linux.dev>; Tue, 18 May 2021 20:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PDM0WuZX1yIfkmFl6be0esAhzpUXa3/Aurhrr7XvDPM=;
        b=oyAW7BlbmqjuHJBPJb1YBJ8fZJgNvvTlbqP2zwAUMP3CwKxp19dWpxoQIu/n+do6Yx
         tJKA28crQFPZqY/1sE16YEbcC3R3wmkUvSr4MJPiitnLsnKru+MW0WeklCO29wfxquyl
         Msdc10P866HoPbayGW8P5XmDQNMFFoNom1//VPwA0sESGw7vSHI+E8q3txA9et9g/bbS
         xnIRKNXjbJR/tBelY6c3CwEnEcp3tz0u5ZqkYWZNYMCitFdpRJ2gnl7gKiZSs6ZQOdo+
         9u9Old23sAkc3w6XraC/j8BekVH/bjS//B8yQVWJR2dlGJzwt1du2dB4y5XGF2X5Fy9o
         Gbpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PDM0WuZX1yIfkmFl6be0esAhzpUXa3/Aurhrr7XvDPM=;
        b=Fj7IhkXCADQhl8TEvFk/iyXhodPLHfayZUvzNJP13SFwoLDr/ERfkOe3QxSH/EH67I
         qbx+B6zRelgaIUHWVf7o/3S6oIOhE/jVZo7BVRyi6nMFJmkd6SSJfEss5V7g0q1UoX5h
         RvuNQMk0JHxEHnwaqXze/7j7R64AVT2jX/pxMhTLune08AfGC8pNtfSgW9ZpSeR+wqjG
         I8V5DTcmmCaGy+s99QV8ptXLfdBEKYoDM8SFhOy3/tW5kXTyJXrJqFPHds1+XCA4qUTD
         7V9kg5IG9CgXbeF/p6I1aqEwwfo8PjHlC7P1X4NpdynIqS1TDs3HdeX5AT7soyTuqO5h
         iWhA==
X-Gm-Message-State: AOAM530yCDL722osbdqKUATJXBbIhw998A1X483gMIEhrKWbCr7zSkSB
	Pv7yE5D3kss1qk+358FSuyU=
X-Google-Smtp-Source: ABdhPJwqtxge1uuHi1Aa0NPjjm29H2edDQ6TIs+ffsUAY3h0ZbqTsJsBWS/aurSb0mTdAXXo9PWpcg==
X-Received: by 2002:a17:902:bd09:b029:ec:7e58:a54a with SMTP id p9-20020a170902bd09b02900ec7e58a54amr8523868pls.62.1621395159142;
        Tue, 18 May 2021 20:32:39 -0700 (PDT)
Received: from localhost.localdomain ([138.197.212.246])
        by smtp.gmail.com with ESMTPSA id g13sm8244587pfr.75.2021.05.18.20.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 May 2021 20:32:38 -0700 (PDT)
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
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH net-next v2 3/4] dt-bindings: net: dsa: add MT7530 interrupt controller binding
Date: Wed, 19 May 2021 11:32:01 +0800
Message-Id: <20210519033202.3245667-4-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210519033202.3245667-1-dqfext@gmail.com>
References: <20210519033202.3245667-1-dqfext@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree binding to support MT7530 interrupt controller.

Signed-off-by: DENG Qingfang <dqfext@gmail.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
Acked-by: Rob Herring <robh@kernel.org>
---
v1 -> v2:
Fixed plural (property -> properties)

 Documentation/devicetree/bindings/net/dsa/mt7530.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/dsa/mt7530.txt b/Documentation/devicetree/bindings/net/dsa/mt7530.txt
index de04626a8e9d..18247ebfc487 100644
--- a/Documentation/devicetree/bindings/net/dsa/mt7530.txt
+++ b/Documentation/devicetree/bindings/net/dsa/mt7530.txt
@@ -81,6 +81,12 @@ Optional properties:
 - gpio-controller: Boolean; if defined, MT7530's LED controller will run on
 	GPIO mode.
 - #gpio-cells: Must be 2 if gpio-controller is defined.
+- interrupt-controller: Boolean; Enables the internal interrupt controller.
+
+If interrupt-controller is defined, the following properties are required.
+
+- #interrupt-cells: Must be 1.
+- interrupts: Parent interrupt for the interrupt controller.
 
 See Documentation/devicetree/bindings/net/dsa/dsa.txt for a list of additional
 required, optional properties and how the integrated switch subnodes must
-- 
2.25.1

