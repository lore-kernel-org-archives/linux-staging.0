Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2958B2F80
	for <linux-staging@lists.linux.dev>; Sat,  8 May 2021 07:09:35 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id g65so6375280wmg.2
        for <linux-staging@lists.linux.dev>; Sat, 08 May 2021 00:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FOVnFr/nj3QWdNJlIgekW/kswIF2a4pE9kCJghjF1wk=;
        b=KD6hEPXs3SiHAtFucQrMWstIwnPMlliFvZ+psgoH92t4UwNZk4SD3w2uW4x4mj9P+9
         Gfafckp4z/odwwCgWLWjerD3ZaLb3e20nbiln50ezdGz1ac3PCGkQflMCZuFCWUXkE9V
         vzVVUk1BTonqDveH8BnR9sUgXQx7HAuw+GGYfjTPwmcdQC7ynkbktpspFb6H8XK7GeXm
         jik+lpush9BCPw+AjWjVognoElO38vOB+H5yKXoIaPIU2RH+qD99GwXRb/utq8jrLWSK
         +XyPmZfF2SZyNNIt9he9JU3GzoHLI+XPTIlOiYxeRmfubX59hzRpxCZItWlbfxNcyEvF
         CXhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FOVnFr/nj3QWdNJlIgekW/kswIF2a4pE9kCJghjF1wk=;
        b=UzV0tkPtVCbob8Kv4vYzfIiFeT5n3QYNY1mVIT85dwNrOMdeL0qWtCiiF4IzgcC9Nq
         Cgd5/KCbEAayOfoc0headUeFbpeR6dvu06aJqc6yDNRZqQ9ZBg5s5Q0S7USjtXwjfAdE
         osRUYZyYkhsJgsY+57iwPl3H5GWumOsDJYTGXTgoW3DMzfzk5I1s3/7QHhjfXLZpuPAZ
         Xjui9PeKr88jk3cP1l/ah/ERGG+Zu6+uO7LVZVkbnZN+C2V3UqsSqboZ4c38PWerAC7j
         tuds4NHHgjq2DNrEcQfCwW7r6OsAR6pv9otIMYstdKzmibG4hnR4/WWXSGvyeBzhNrZq
         Ng3w==
X-Gm-Message-State: AOAM5309RrkVf1bjMJ9YCb2oef2dw08XaEYKnFu6oXiTSFnHPZC/PICf
	VblXtIl67LeY9/jpKpa1NLg=
X-Google-Smtp-Source: ABdhPJy/DIm2VbViVvEjtPiiZspbv60TIWMsgF6WkvgzjInz1GQL+I1YsOm/xug6DjWda8PWEVcYdQ==
X-Received: by 2002:a1c:6606:: with SMTP id a6mr24959455wmc.160.1620457773780;
        Sat, 08 May 2021 00:09:33 -0700 (PDT)
Received: from localhost.localdomain (231.red-83-51-243.dynamicip.rima-tde.net. [83.51.243.231])
        by smtp.gmail.com with ESMTPSA id s18sm11740345wro.95.2021.05.08.00.09.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 08 May 2021 00:09:33 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: vkoul@kernel.org
Cc: kishon@ti.com,
	devicetree@vger.kernel.org,
	linux-phy@lists.infradead.org,
	robh+dt@kernel.org,
	linux-staging@lists.linux.dev,
	gregkh@linuxfoundation.org,
	neil@brown.name,
	ilya.lipnitskiy@gmail.com
Subject: [PATCH RESEND v2 1/6] staging: mt7621-dts: use clock in pci phy nodes
Date: Sat,  8 May 2021 09:09:25 +0200
Message-Id: <20210508070930.5290-2-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210508070930.5290-1-sergio.paracuellos@gmail.com>
References: <20210508070930.5290-1-sergio.paracuellos@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MT7621 SoC clock driver has already mainlined in
'commit 48df7a26f470 ("clk: ralink: add clock driver for mt7621 SoC")'
Hence we can use the clock in pcie phy nodes to
be able to get it from there in driver code.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/staging/mt7621-dts/mt7621.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/mt7621-dts/mt7621.dtsi b/drivers/staging/mt7621-dts/mt7621.dtsi
index 9ee11adefa79..840ba0c3ffed 100644
--- a/drivers/staging/mt7621-dts/mt7621.dtsi
+++ b/drivers/staging/mt7621-dts/mt7621.dtsi
@@ -548,12 +548,14 @@ pcie@2,0 {
 	pcie0_phy: pcie-phy@1e149000 {
 		compatible = "mediatek,mt7621-pci-phy";
 		reg = <0x1e149000 0x0700>;
+		clocks = <&sysc MT7621_CLK_XTAL>;
 		#phy-cells = <1>;
 	};
 
 	pcie2_phy: pcie-phy@1e14a000 {
 		compatible = "mediatek,mt7621-pci-phy";
 		reg = <0x1e14a000 0x0700>;
+		clocks = <&sysc MT7621_CLK_XTAL>;
 		#phy-cells = <1>;
 	};
 };
-- 
2.25.1

