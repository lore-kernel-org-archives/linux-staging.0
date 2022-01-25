Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2432CAB
	for <linux-staging@lists.linux.dev>; Tue, 25 Jan 2022 17:12:43 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id c188so2284144iof.6
        for <linux-staging@lists.linux.dev>; Tue, 25 Jan 2022 09:12:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mMhTEWTe94/lxvR3iguUuMULiaaMgsYkOT2qY7s3xZk=;
        b=qB2b/OBznQg3vk7eTmRQbFKLqe2+4F4LAv/FT+/VISI9E/t+vC7+NkOzq4wv+6QySV
         +744jOtOv+sGHlR0nyyGUM0vxeC0TxpFCud4vSJkeK5RakqjjuqgLuv3H/5RqiWEnQ9n
         wYYm2OY31foCQJse4oYNYs8J2ESDsDSEFBQHUzB3uf4bWrHji3edtox6F5a4svB4Wjq8
         JLEBOG/bZOtR9A7GcF4dYJ1oig7VxKh2r/jo1dRLXKKWInGd7g80fCgs30ktZC9yU4Rm
         J8sv2RMlprVUsLHlCHYOyDvTfFnHpFNcwHRT693mwN5qw77AoZfNk1EtdYbG1vh42FZQ
         c2nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mMhTEWTe94/lxvR3iguUuMULiaaMgsYkOT2qY7s3xZk=;
        b=K7GjXWzQOCTjfDdEyh745LE24sQ/7bLgGm4ca441uXf2PdBpp8RH3ai5HTKJ1C2/jB
         ReUTsu+BsppEUCHuK6wdegsLjrBpVpYwJfNsHe37ceyCpMATSJudNVNNAozPfTmMnJNb
         VP+6uI70TxJ6zJU0y8+C9LOGhH7ROT2L2fFQ2DPE7PZqRRhpXSQWfl00JCSD0BQUs0E8
         XovRzbVb0QmTqzfnaXgPkkTVKoCQAWjLm/rY3dtXKRjSnx4nxNmG38PHp04bVrtKtR1C
         6oA2un/YyjQPhRbZ+ZFQLjAA/hCyDqBmpDnZcu5pQHHgA9YPjk+ltryE5HA7tQf/fXmx
         H3sg==
X-Gm-Message-State: AOAM530mm2jgLd6HKblTlGPXxo8Bx2I+eDQR6Km/o5fs1sVK5OH0Ar6y
	M2zgpVx+LNmYLh5aUZJcvhI=
X-Google-Smtp-Source: ABdhPJy1nwamHHzfnVEdxv0YvhkimiB59p6R05mZq7ZjaEJgqSMeDW2gAxduxonHAE26uHuWpAonqQ==
X-Received: by 2002:a02:5b0a:: with SMTP id g10mr9341784jab.169.1643130762991;
        Tue, 25 Jan 2022 09:12:42 -0800 (PST)
Received: from aford-IdeaCentre-A730.lan ([2601:448:8400:9e8:6592:b6fe:71b1:9f4c])
        by smtp.gmail.com with ESMTPSA id m14sm8090291iov.0.2022.01.25.09.12.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jan 2022 09:12:42 -0800 (PST)
From: Adam Ford <aford173@gmail.com>
To: linux-media@vger.kernel.org
Cc: aford@beaconembedded.com,
	cphealy@gmail.com,
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
Subject: [PATCH V4 08/11] arm64: dts: imx8mm: Fix VPU Hanging
Date: Tue, 25 Jan 2022 11:11:25 -0600
Message-Id: <20220125171129.472775-9-aford173@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220125171129.472775-1-aford173@gmail.com>
References: <20220125171129.472775-1-aford173@gmail.com>
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
index f77f90ed416f..0c7a72c51a31 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
@@ -707,7 +707,6 @@ pgc_vpumix: power-domain@6 {
 						clocks = <&clk IMX8MM_CLK_VPU_DEC_ROOT>;
 						assigned-clocks = <&clk IMX8MM_CLK_VPU_BUS>;
 						assigned-clock-parents = <&clk IMX8MM_SYS_PLL1_800M>;
-						resets = <&src IMX8MQ_RESET_VPU_RESET>;
 					};
 
 					pgc_vpu_g1: power-domain@7 {
-- 
2.32.0

