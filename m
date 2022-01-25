Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2582CAE
	for <linux-staging@lists.linux.dev>; Tue, 25 Jan 2022 17:12:24 +0000 (UTC)
Received: by mail-il1-f177.google.com with SMTP id i14so17388845ila.11
        for <linux-staging@lists.linux.dev>; Tue, 25 Jan 2022 09:12:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WrtH5ghaKPN4zPq0sPHDAur3BisSAdvDShbVq3dIejA=;
        b=qfiSSeIxefWvWW91HY1bM17R0N/s6o0+Yjh0p4BV/GcxYzIkNnorxVtPITTcwXvpI9
         TLcDMfDF+wuNR5qhQUpsq2OOvaJ3QX+ase3dO7BliS2YLsm//qPllzUxk1yGEbhooRhO
         i5U3KuLFBMsUzdAmQeMyD3aBKR/oaCtzEXjdcCwYf/zjkcyzDfZjLrnBnqtnlzwv0/Hy
         AF0d+nV/lEjuL2TtWvolLPHu/Kt70emVwZQ2nmvHSTrvlzbt62kqHevDG5RHvfXTG8F3
         Bp+FyZRL79jGpWuBhI6bp02kkU5zwaNlAA/fxQ/7+iw/TDCGgd5BIokiJwShQ1jDX1nB
         exbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WrtH5ghaKPN4zPq0sPHDAur3BisSAdvDShbVq3dIejA=;
        b=H9jq/9P5xhM+cb1QtS52xgLsxM5/HNtk7n9WLGcUcpP74lRswDmqZSYgdPJY72DAz4
         ZpPnbauAkHQ9NNSqIw9LHxhf4V+AGWnR8s35W/wtGQkw3OOr3cjvTZK5muBI2avBIPuu
         BCmIPAIKA2SFQnubTTI7tqYDzXwUBV20h9yCg9vcOe76tWlkFtccHiRkDBoXiVlqfsko
         yj1FqfiK5rtzUqiW6/9cn01SYqhQ4d/r3VLiPoACTYaDPyXTtnw+CDTEyIvBlSFoTVui
         gz408d4xrYtKoYGUYQ5DTaTaLpewcbaf6bJFLERTfC2wJ5tR9pYinvRsqdQ+WxlP298m
         CpZQ==
X-Gm-Message-State: AOAM531X8cPnEkCsD9NkA2xwYfuBMxRcQrwfQa9lslAVU7dEBXBsHGY7
	nyFzJBZSThyhc0+PAwYm5Wc=
X-Google-Smtp-Source: ABdhPJzkxyIibb1FGTbKN+rTHBAFQa3lU1Qx2tprXS7p7+K9mSBL7V22s7wjlfzr5Avd5Q1iORjH7A==
X-Received: by 2002:a05:6e02:12ca:: with SMTP id i10mr11495329ilm.284.1643130743930;
        Tue, 25 Jan 2022 09:12:23 -0800 (PST)
Received: from aford-IdeaCentre-A730.lan ([2601:448:8400:9e8:6592:b6fe:71b1:9f4c])
        by smtp.gmail.com with ESMTPSA id m14sm8090291iov.0.2022.01.25.09.12.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jan 2022 09:12:22 -0800 (PST)
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
Subject: [PATCH V4 01/11] arm64: dts: imx8mq-tqma8mq: Remove redundant vpu reference
Date: Tue, 25 Jan 2022 11:11:18 -0600
Message-Id: <20220125171129.472775-2-aford173@gmail.com>
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

The vpu is enabled by default, so there is no need to manually
enable it.

Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-tqma8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq-tqma8mq.dtsi
index 8aedcddfeab8..38ffcd145b33 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-tqma8mq.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq-tqma8mq.dtsi
@@ -272,10 +272,6 @@ &usdhc1 {
 	status = "okay";
 };
 
-&vpu {
-	status = "okay";
-};
-
 /* Attention: wdog reset forcing POR needs baseboard support */
 &wdog1 {
 	status = "okay";
-- 
2.32.0

