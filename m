Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40B62CA2
	for <linux-staging@lists.linux.dev>; Thu, 16 Dec 2021 11:13:32 +0000 (UTC)
Received: by mail-io1-f47.google.com with SMTP id b187so34623598iof.11
        for <linux-staging@lists.linux.dev>; Thu, 16 Dec 2021 03:13:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3TbuArxHhnw2NqzqpC678dLXDest9qrzIVawU/F9j8Q=;
        b=c7c5AUqscKuwonxjAAu6GNkrIrX/IF7LrlWWVMPz5UemowmrXucK7FkuhZIGIRGzt1
         GQJPYBo5Qt6nhgS6gT6fBSiQtets2bXuqlFAnLAFN70TZNC+gG+EAHejVr5ce+i8ovXG
         Os6j1vre3Rl+jpAFdoVx3iUab3zIjVJtqnvU1iZ//JYFc3AMDyS+pfXirWE1ZY2SlUa6
         8x0Ba2EUvmM0M8ErtWryT8gSJYvP1Jk//AxnTONrq5haRQXGXy67tGDP2VWNfd1G3j7Y
         fp09JwuwLqYZ70VePxar96Mw6w66JsT6MdUkerjlUtdwfaxuWlR/qip4LRzHcjOpd7uK
         NwqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3TbuArxHhnw2NqzqpC678dLXDest9qrzIVawU/F9j8Q=;
        b=q1HIbxG8h/Vrm1aeJ6c0tYmAyI4NkMqMV97MyKYpg9P394RrzOgTy/Vls6Jz24DLB1
         X4a+wGciYzMuIIoeDfQ62fQOv4UQkw6oqYQ6OrRrrOLr8UkoD3rUB3YkLfy2EbBfAQxW
         pSpkpfGhh5LLmwma8EBlxTnqZHkjx361eZS4z5zih2TNnrhqZ2lJvdbS1Pg86stow2WA
         K7qwQl8sdPkMbyibmoE2R00EB3gIwH4kgukbbd5LYh9ocez+2l9CwwM/s/VyOPrJTDEO
         No4gwqg6oaFpjRP24xkLcot8OjdSNyB7o5tuTv4UnaVkB1rLMdezRcYzUafRmr6yNntq
         irXw==
X-Gm-Message-State: AOAM5328ZOaN3sY5khTsSZxIoP+131FEiYeV0K80p7krmfsxEnpzrR5b
	d2KM24t1FA2JNm3JTiIxBkw=
X-Google-Smtp-Source: ABdhPJxedNBamHheqxed8H6owY3Y6xwLktxG1rqCkzncbtyaENC9+7PwVJWipBKw16ZRt4uLl+pOZA==
X-Received: by 2002:a6b:740b:: with SMTP id s11mr9121160iog.120.1639653211807;
        Thu, 16 Dec 2021 03:13:31 -0800 (PST)
Received: from aford-IdeaCentre-A730.lan ([2601:448:8400:9e8:fe22:1652:55f7:5197])
        by smtp.gmail.com with ESMTPSA id h1sm3090946iow.31.2021.12.16.03.13.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 03:13:31 -0800 (PST)
From: Adam Ford <aford173@gmail.com>
To: linux-media@vger.kernel.org
Cc: abel.vesa@nxp.com,
	aford@beaconembedded.com,
	benjamin.gaignard@collabora.com,
	hverkuil-cisco@xs4all.nl,
	Adam Ford <aford173@gmail.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lucas Stach <l.stach@pengutronix.de>,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH V2 07/10] arm64: dts: imx8mm: Fix VPU Hanging
Date: Thu, 16 Dec 2021 05:12:52 -0600
Message-Id: <20211216111256.2362683-8-aford173@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211216111256.2362683-1-aford173@gmail.com>
References: <20211216111256.2362683-1-aford173@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The vpumix power domain has a reset assigned to it, however
when used, it causes a system hang.  Testing has shown that
it does not appear to be needed anywhere.

Fixes: d39d4bb15310 ("arm64: dts: imx8mm: add GPC node")
Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
index c2f3f118f82e..f13d31ebfcbd 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
@@ -681,7 +681,6 @@ pgc_vpumix: power-domain@6 {
 						clocks = <&clk IMX8MM_CLK_VPU_DEC_ROOT>;
 						assigned-clocks = <&clk IMX8MM_CLK_VPU_BUS>;
 						assigned-clock-parents = <&clk IMX8MM_SYS_PLL1_800M>;
-						resets = <&src IMX8MQ_RESET_VPU_RESET>;
 					};
 
 					pgc_vpu_g1: power-domain@7 {
-- 
2.32.0

