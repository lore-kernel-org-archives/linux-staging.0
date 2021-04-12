Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A54DE71
	for <linux-staging@lists.linux.dev>; Mon, 12 Apr 2021 03:43:18 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id q10so8331937pgj.2
        for <linux-staging@lists.linux.dev>; Sun, 11 Apr 2021 20:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=B7rQ+eZyVc+UGwnL8MpFME+8yUWCYk1WtHWcRPLJGoU=;
        b=SX9V77mQzekQf74AmDKyq12CC70YI2JSMomXypPWg9EHeJO19nYLvD9v1RV/OQhqZ2
         bnJ5kqRCF0sI51ZclyYfkhiK9LsuieMFVM5BMyGSBtOSFI3OnQmY73FUusH6Tq7gNyW2
         osgLXz40/Q0FOx3/MmRNi33vLAK8MLpJUCpJ1aSJSc4Rfl/ljkQoYNCAfyc1Aj/nLRel
         mWEh8nXmAf9GZPeHwdRvCxRvs8ryBxXafF5k8lQFak74lGtR9/mvfyb0hCDlputgEcIh
         PQvVZPo35rol+nKCC9hUzYYCm7LFmGgBN03lYQlYMjwaE1P8oTR+LBzBAMFJU+ehziGn
         guBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=B7rQ+eZyVc+UGwnL8MpFME+8yUWCYk1WtHWcRPLJGoU=;
        b=AjKK4SqBuMt74yvR+Ha62k3u+SH64kxOut4xMqngZ48GoSoUymqELTX/Pg1Dg8HsEV
         bM9OOnG6LS9qHuK0uJm+hKiw1/brYMGjy0YfSbu/mSq8YJq66EHFJ378aQbA06X9/VzE
         pbKA6yTZjXtWVAZuXuUMCPN/93Ksc/mXFLJyM7LFRIyzo7dVMndDdKcpNxsJnb8FIXEX
         cnTj3HyPjNETUNjSz3Z6wef78HO5otmL8khtINwxpUfygUewO+FeHSFUW/uE+6uQ/NTU
         JUokqiGNQCMaq/o3spzlfW7nIN6WrqkH6WngTlhTW/+Q7Me91UFKhC9Q4+DquZLRrbeW
         l3kg==
X-Gm-Message-State: AOAM5304AEDrecbH8+SzPGvfkHjmUcLK/E7xyxgjcERFnQjVaEfa5ETf
	4QotWHnWeymS4wNVXhILgOE=
X-Google-Smtp-Source: ABdhPJydgOU/45ri7toqVvb8GVdWpTxBGy/14uX4uwb3MKKywYOtmAFOl76qvuEMw6EYJbxuNTiK6w==
X-Received: by 2002:a63:1c22:: with SMTP id c34mr18489418pgc.408.1618198998301;
        Sun, 11 Apr 2021 20:43:18 -0700 (PDT)
Received: from localhost.localdomain ([138.197.212.246])
        by smtp.gmail.com with ESMTPSA id v22sm5387185pff.105.2021.04.11.20.43.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Apr 2021 20:43:17 -0700 (PDT)
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
Subject: [RFC v4 net-next 4/4] staging: mt7621-dts: enable MT7530 interrupt controller
Date: Mon, 12 Apr 2021 11:42:37 +0800
Message-Id: <20210412034237.2473017-5-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210412034237.2473017-1-dqfext@gmail.com>
References: <20210412034237.2473017-1-dqfext@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable MT7530 interrupt controller in the MT7621 SoC.

Signed-off-by: DENG Qingfang <dqfext@gmail.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
RFC v3 -> RFC v4:
- Add #interrupt-cells property.

 drivers/staging/mt7621-dts/mt7621.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/staging/mt7621-dts/mt7621.dtsi b/drivers/staging/mt7621-dts/mt7621.dtsi
index 16fc94f65486..0f7e487883a5 100644
--- a/drivers/staging/mt7621-dts/mt7621.dtsi
+++ b/drivers/staging/mt7621-dts/mt7621.dtsi
@@ -447,6 +447,10 @@ switch0: switch0@0 {
 				mediatek,mcm;
 				resets = <&rstctrl 2>;
 				reset-names = "mcm";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+				interrupt-parent = <&gic>;
+				interrupts = <GIC_SHARED 23 IRQ_TYPE_LEVEL_HIGH>;
 
 				ports {
 					#address-cells = <1>;
-- 
2.25.1

