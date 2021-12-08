Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E81E2CB3
	for <linux-staging@lists.linux.dev>; Wed,  8 Dec 2021 22:50:55 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id p65so4610173iof.3
        for <linux-staging@lists.linux.dev>; Wed, 08 Dec 2021 14:50:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CrNumwISLUpkzDEc0TVgaptJcWoPniM3pmiYzi2RbfE=;
        b=Fj6VpvXikYeBpUY3sac3yJ39RVxk5IUonJwvZgE62hZzJh1g8rF1GAOIhXAWaSkfiE
         XmJlE0U6MQJ1fG17Nfa8iqI+RmfFhq7IzckfnyQJJVvGJRhFtobH7ZnL9N8cN5/51k1g
         Xt4QA95/53ihaR8NBmcrYngNnoKhVZsxJJHCO6uFsCr+5WkxjgHDOQxW56G9K0FRn5Xx
         8UH/gsESc/zJi+ObAZ1Bd9ujFD0uTC4gyI7jw72C/b47isugWCc3OsWbK+PAUqD6DZiI
         ZvXHF+1hkgxNORUBJTNz1eb4Nma4dfz6C8dS5yssc0IQco2UE+8dyUUGlEj92s+hmD5h
         4BEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CrNumwISLUpkzDEc0TVgaptJcWoPniM3pmiYzi2RbfE=;
        b=eXDCtuP1wQvJu7sqQNB5iExrorPSTlEUSpJ//ZAvk3H0I8MG62TmYoqv19XNRl1+Rw
         A7d14T602zSrxRrDziSWJYJwPg3dDwCptiocImH3LvqJA/1I7OlNMPzvOavCBeaBfm6B
         ass3ToBIjwQqiuzCVm8kxMqG0sOrScGy1K8+71/ZQhk0uTUxGg+BWt0VNFsBA54yEWzR
         CDHNHqGAVTbxrXouLr6meHWNl3xyb38WxTYZvZqRfkHeEtgoj0baTbK8/XbiT4u7YxIZ
         wUFKoi5WW4XYbP+QCFENi4dBURVoo4Sj11AjQHtABlZCxnETAZ0CpT+wEKH3DEDAkDOp
         i0rA==
X-Gm-Message-State: AOAM531B9/Ok7t6SokABBD6byU+/6igW/4800HXJd/tJVSgGauIJUFmZ
	FZ/LbqtKia2ole3DLcOwe9o=
X-Google-Smtp-Source: ABdhPJy3Fw9s3P+tqSX21rd0Q8PHUJ8JDm/ujxjgd6QaaXBU9HU3PzKf3iIs1q8oTPSXKUJpcKLmdQ==
X-Received: by 2002:a05:6638:d46:: with SMTP id d6mr3444633jak.129.1639003854249;
        Wed, 08 Dec 2021 14:50:54 -0800 (PST)
Received: from aford-IdeaCentre-A730.lan ([2601:448:8400:9e8:269a:1aa2:f1d9:8dbb])
        by smtp.gmail.com with ESMTPSA id t6sm2378751ioi.51.2021.12.08.14.50.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 14:50:53 -0800 (PST)
From: Adam Ford <aford173@gmail.com>
To: linux-media@vger.kernel.org
Cc: benjamin.gaignard@collabora.com,
	cphealy@gmail.com,
	aford@beaconembedded.com,
	nicolas@ndufresne.ca,
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
Subject: [PATCH 07/10] arm64: dts: imx8mm: Fix VPU Hanging
Date: Wed,  8 Dec 2021 16:50:26 -0600
Message-Id: <20211208225030.2018923-8-aford173@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211208225030.2018923-1-aford173@gmail.com>
References: <20211208225030.2018923-1-aford173@gmail.com>
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
---
 arch/arm64/boot/dts/freescale/imx8mm.dtsi | 1 -
 1 file changed, 1 deletion(-)

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

