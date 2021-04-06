Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79ED70
	for <linux-staging@lists.linux.dev>; Tue,  6 Apr 2021 14:18:57 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id mj7-20020a17090b3687b029014d162a65b6so3834883pjb.2
        for <linux-staging@lists.linux.dev>; Tue, 06 Apr 2021 07:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7DjmGF6FnRAdOMOxx79iiAfLHcA67arTjIOWyK4tFvc=;
        b=tuFpQyem7+MyofHl1KDCGxnIE9BsTsqrcTnmIFRasapf56OIPO5TFcMvR4t2HLcAWp
         90Mv+yNotGjgJpalZ5jOv/CMz0jwjXmk/aREctLFBtXDsiQFAMidyoFqZkm1e3O71FiB
         PyLTZtBn5+kjv4sG9tSau9F4RUuYcFvM38IQ5Hv6oD6oUUhTFk2sQdp1ik0ulyw9bZly
         FyAKL2w92xiT7L3FQgCQJCJ1DW/1sOuq8wRnpqEtGAzTFDgX0VKmD52L8N5ljh004vBf
         iaVQlizsUAhnF6ksf38ZqqZog3InF4u6fOflhNW8wskTyPj0T8ZJA52ydK2wAl2OAvTK
         DqiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7DjmGF6FnRAdOMOxx79iiAfLHcA67arTjIOWyK4tFvc=;
        b=iPpazmJQyS6gKaE4T6ocLfeNpYzVTZgAHSelfLrlfvhvJp0515Kq7KAjivefavvQnz
         E5Mhu+6L5RiDlM95a3q4JRZGweBw0H/9b8udObzyhSDNlCemklIayor6sGNZWPoJeKf3
         6HUBjxWTRAQjFXdqwi5yi0j+UbmOH1yEM+Ry4FtxXsmOR5xWvF6ruDEm0+YHMkxEIdf3
         3jK3L8pqjjn328g93peGw3ewyz2aJCnO32+g+9+rqIAk4EoBV44VEwnygOQs8aoI4dcL
         LWrUfP6H+GDuqgeQMRQ9nJDx/zDaayNJM2XBDsjTASMW8jBazSEX79M67PPu9mqpDhAv
         tV/Q==
X-Gm-Message-State: AOAM531rUzRNjAz78CJKp7ri5VJ1TP8YxdZfFiurPp0VMGaQbvUCDg93
	yQ7Sm36Rj6zygWUrrpI2jM4=
X-Google-Smtp-Source: ABdhPJxsINrnkef2tA65NnbGwjhL+miREBITUbGbg8CoFi/8e+9oSsiWo5WIJE7CIo/QexG5M3g2Jw==
X-Received: by 2002:a17:90a:7064:: with SMTP id f91mr4768709pjk.89.1617718737378;
        Tue, 06 Apr 2021 07:18:57 -0700 (PDT)
Received: from localhost.localdomain ([138.197.212.246])
        by smtp.gmail.com with ESMTPSA id u1sm18337581pgg.11.2021.04.06.07.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 07:18:56 -0700 (PDT)
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
Subject: [RFC net-next 4/4] staging: mt7621-dts: enable MT7530 interrupt controller
Date: Tue,  6 Apr 2021 22:18:19 +0800
Message-Id: <20210406141819.1025864-5-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210406141819.1025864-1-dqfext@gmail.com>
References: <20210406141819.1025864-1-dqfext@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable MT7530 interrupt controller in the MT7621 SoC.

Signed-off-by: DENG Qingfang <dqfext@gmail.com>
---
 drivers/staging/mt7621-dts/mt7621.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/staging/mt7621-dts/mt7621.dtsi b/drivers/staging/mt7621-dts/mt7621.dtsi
index 16fc94f65486..ebf8b0633e88 100644
--- a/drivers/staging/mt7621-dts/mt7621.dtsi
+++ b/drivers/staging/mt7621-dts/mt7621.dtsi
@@ -447,6 +447,9 @@ switch0: switch0@0 {
 				mediatek,mcm;
 				resets = <&rstctrl 2>;
 				reset-names = "mcm";
+				interrupt-controller;
+				interrupt-parent = <&gic>;
+				interrupts = <GIC_SHARED 23 IRQ_TYPE_LEVEL_HIGH>;
 
 				ports {
 					#address-cells = <1>;
-- 
2.25.1

