Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33E770
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 04:51:08 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id p12so8083256pgj.10
        for <linux-staging@lists.linux.dev>; Tue, 06 Apr 2021 21:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kob9kM8qKEEzCOzsXAg0KIs7vHQIWVRh0w9PgAne0+0=;
        b=dXTMJsZg/GrMTU0c/AixIr4aU/BTqwR2QxgJV/NuQIgJcB0lxw9kDiw403clhmF4fO
         2aOvAhOEp4uPWww5BxjpbNMunetyw2lgnAHILhPrl1cWpjdFi3zjawLn8xbUGDymzaKF
         RwB+wxHe96459XPgigMcPLBBMNrn8cTytSM1Mcw0WSR1bDNzRzyusv/9PGniwBECy9DS
         VC2KlWjgDdQmS/3rkaTaqkX05KHlcFaJZSiq61cFfIiDE7lMCRkQUToTz5eKGkBxnylh
         Qbw1ARx7qE7XLqlE7ZVnWhRoD3o9wpyINNUIQQzzqpH60RFLWTE3iErbNcucGU8pgrya
         ttOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kob9kM8qKEEzCOzsXAg0KIs7vHQIWVRh0w9PgAne0+0=;
        b=udRnL9ZJ67ktGjusff+mBPnmet3ZGBrOmSIw+LU9r83/sBJHQqQUolzmPu877RqWSo
         vOEOk7+XWpeOz4XjRkISGf3Yp24m1jdeGCogMCiSiqbCkeRNlYENmIqOkBwcQM4mNw2j
         XdU6ytMevc8FyHJZNgnjvTLVRofthjNijGlmuoydIiidS/gMw2dZvIS8y8iGAorS0qYc
         03Ofhzq2ojsYAUnNqsdHeJwcW9tCH5a4J5vMN7PyDF7IRZX+zVkv+IRud+aG/utYLa2p
         524k4LFfdzKvKui0RIrFLPA1Gag9FTQ0A5qOd3yUnQMDBBOpLVuI9vvZ1qJxO3rGzGnH
         ERug==
X-Gm-Message-State: AOAM532GIEAY0XZ2NmTAXCDhIOuh5MhpoDAh79XyphZ47EW9nZrvoCz7
	ae8YI4PSkge7tuXLydnmOvQ=
X-Google-Smtp-Source: ABdhPJxHn4yrsH/2HhCjyRtJImSN9tdocViiuu22y/xFL0ocTxflw1/WU2qpIbwdS8dCJYJWpo/fmg==
X-Received: by 2002:a63:5458:: with SMTP id e24mr1566769pgm.170.1617771068271;
        Tue, 06 Apr 2021 21:51:08 -0700 (PDT)
Received: from localhost.localdomain ([138.197.212.246])
        by smtp.gmail.com with ESMTPSA id n52sm882679pfv.13.2021.04.06.21.51.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 21:51:08 -0700 (PDT)
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
Subject: [RFC v2 net-next 3/4] dt-bindings: net: dsa: add MT7530 interrupt controller binding
Date: Wed,  7 Apr 2021 12:50:37 +0800
Message-Id: <20210407045038.1436843-4-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210407045038.1436843-1-dqfext@gmail.com>
References: <20210407045038.1436843-1-dqfext@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree binding to support MT7530 interrupt controller.

Signed-off-by: DENG Qingfang <dqfext@gmail.com>
---
RFC v1 -> RFC v2:
- No changes.

 Documentation/devicetree/bindings/net/dsa/mt7530.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/dsa/mt7530.txt b/Documentation/devicetree/bindings/net/dsa/mt7530.txt
index de04626a8e9d..26b34888eb62 100644
--- a/Documentation/devicetree/bindings/net/dsa/mt7530.txt
+++ b/Documentation/devicetree/bindings/net/dsa/mt7530.txt
@@ -81,6 +81,11 @@ Optional properties:
 - gpio-controller: Boolean; if defined, MT7530's LED controller will run on
 	GPIO mode.
 - #gpio-cells: Must be 2 if gpio-controller is defined.
+- interrupt-controller: Boolean; Enables the internal interrupt controller.
+
+If interrupt-controller is defined, the following property is required.
+
+- interrupts: Parent interrupt for the interrupt controller.
 
 See Documentation/devicetree/bindings/net/dsa/dsa.txt for a list of additional
 required, optional properties and how the integrated switch subnodes must
-- 
2.25.1

