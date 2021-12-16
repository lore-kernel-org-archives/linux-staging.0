Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7581C2CA2
	for <linux-staging@lists.linux.dev>; Thu, 16 Dec 2021 11:13:16 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id p23so34670255iod.7
        for <linux-staging@lists.linux.dev>; Thu, 16 Dec 2021 03:13:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ci/iieSAzRzH/2rNrz9vVPVHZbfFcrg+DugyyrDVWRg=;
        b=avulS/IasZOsM1IErPUXlsBP9HRJ/FmY0hN2g7eFCyffTaOijll3DLWB3r0MBj73lh
         N+OA0lK4XQH5RLgynwNhZm7QUUtsJHKeOxvHflyujgtADBKCSoj3rx1aWsIDjpSzUXSo
         EUeYFs/pSRMK9oY19clTmBz1yxbm1y8P2TzGXAkeDXNAx60qcga3j1uU/K3iJQj1tG2k
         jKeygqbKwxMviXQ9XBfFaFxHz+9zz8GEgnVAd6giqbthw3VJiOGWuoO0JNN8IMjGEhHh
         n+0oEmuJqnqNqhXKAjCTIpTM5v7Nxq+5xd0OYNUNchTm8Vm1tZFkvpqDa/dqKeN9/asr
         7eUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ci/iieSAzRzH/2rNrz9vVPVHZbfFcrg+DugyyrDVWRg=;
        b=aMFct/9obBYK/RJIbPgpTrqymdYoAPWlvQoKMqTqHU+h6aZiZqGQTKcN7odUt44zxg
         T8rIxJz9bfDssLpih0TaS5EC3C2gK5nHPUnGQIDdr//RTdC2NfrveUkPoGTOnKiKiQEI
         RRL1VppHkSlrbntxa+dwHbNYbDuisTtDOKhXVKPLgQFVSikvQFD0ggvaM85lFoLXqbX8
         bkmiBiBYpkdEXyljHyc3nkSdKRi/nf9meTqITWVJV4bPuwSFA3WoLwbYlfq0QuCBrjh9
         9Q0zSa7ntqE1uuAHEdgHpWlEW8KxRPAuhnphggQjsYDoobBz9dw8b7TW9WN2PTCC8ndA
         sUOQ==
X-Gm-Message-State: AOAM532HmXO2oB6+WtAKqlBJ+FtUpUdbLUXBntKD28oG+uPR20LEvYH3
	1ALspTsl4d9EVqg5jwFHRzA=
X-Google-Smtp-Source: ABdhPJx1Pz6IYHOEHrltpVoTw61dTFcY60VVPwhS85F3uFkPQ68JSVa9jDbF1/4mjZxQuXQKK69RlQ==
X-Received: by 2002:a02:ceb9:: with SMTP id z25mr8847344jaq.121.1639653195540;
        Thu, 16 Dec 2021 03:13:15 -0800 (PST)
Received: from aford-IdeaCentre-A730.lan ([2601:448:8400:9e8:fe22:1652:55f7:5197])
        by smtp.gmail.com with ESMTPSA id h1sm3090946iow.31.2021.12.16.03.13.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 03:13:15 -0800 (PST)
From: Adam Ford <aford173@gmail.com>
To: linux-media@vger.kernel.org
Cc: abel.vesa@nxp.com,
	aford@beaconembedded.com,
	benjamin.gaignard@collabora.com,
	hverkuil-cisco@xs4all.nl,
	Lucas Stach <l.stach@pengutronix.de>,
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
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH V2 01/10] dt-bindings: power: imx8mq: add defines for VPU blk-ctrl domains
Date: Thu, 16 Dec 2021 05:12:46 -0600
Message-Id: <20211216111256.2362683-2-aford173@gmail.com>
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

From: Lucas Stach <l.stach@pengutronix.de>

This adds the defines for the power domains provided by the VPU
blk-ctrl on the i.MX8MQ.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>

diff --git a/include/dt-bindings/power/imx8mq-power.h b/include/dt-bindings/power/imx8mq-power.h
index 8a513bd9166e..9f7d0f1e7c32 100644
--- a/include/dt-bindings/power/imx8mq-power.h
+++ b/include/dt-bindings/power/imx8mq-power.h
@@ -18,4 +18,7 @@
 #define IMX8M_POWER_DOMAIN_MIPI_CSI2	9
 #define IMX8M_POWER_DOMAIN_PCIE2	10
 
+#define IMX8MQ_VPUBLK_PD_G1		0
+#define IMX8MQ_VPUBLK_PD_G2		1
+
 #endif
-- 
2.32.0

