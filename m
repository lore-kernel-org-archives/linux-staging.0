Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F762CAE
	for <linux-staging@lists.linux.dev>; Tue, 25 Jan 2022 17:12:27 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id h7so6546030iof.3
        for <linux-staging@lists.linux.dev>; Tue, 25 Jan 2022 09:12:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fa6XTevFEqtbC/DVeN/V/vlo7FN29Xl+JkqDuO3dnjc=;
        b=W9ap+qvkTCG8bjc0uQsVrBYvZj+B6Rvoq6pwWYTLVUoilzUICwT2AXwpniH10xZ1uq
         fUKZ9RiQFWI2INOumUpsFdJ92qRdGBLlMC4sgcC7hexgQX8yoIqWQmi2+sEuAUEOowIR
         DZOI45GDFr2y8nALDb+hk9VuaZy/4zTuvZpI6tDFuWiZincB1L8RfzNkOaLhFVTvyGct
         TUu8dM/96xsrK0KNQd5MSsZL6cWEQfq0p5q7/DQ9tISr37V9Dlt7RwoKaXJT/V17C8Wu
         sVcNjMdhPdt8gMTRuqr7NtOX6PwxTafeRjOWDmZVOzM0kr4LFQ29VVSmSED74t6HxJ9/
         G3jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fa6XTevFEqtbC/DVeN/V/vlo7FN29Xl+JkqDuO3dnjc=;
        b=4BYgbkrJU7LhXk8jtdlgaQfAIfMXikfb37gOKaLZUv3Pc0akNVpZchTrjlC8UO77xW
         TnFTXBLtZjk3J3bLSR3D8xTKSV/sOhE+XD47lDRg5JE+jFT9ra91KR3+GVaqgAqN23W/
         GfAvc5fhGCHfqL1NxyzDdRc6AZ1XU7tI7xJsUz0F5NAoRt4tMx2ImS9WN0XmBvHEbQBX
         YhKtcvuwHZLHsYtD51UEddtfKwi5aYQjhw6KOFKrdP3y3R+CIeoadf6hLtOm78l7VenB
         wLu2Fr7P9guP1d6p8RHMYqs6IprLvDyhbJEJ6mGpK85QnInRI3bMs62d2xFlSu6DjuGU
         AyeQ==
X-Gm-Message-State: AOAM531HwcS7152JtzpmvW5PYhYOKekl957qLWq17rkZT/5UNUHksXHI
	BvOriac8jEc31+Jdh1TZ58o=
X-Google-Smtp-Source: ABdhPJye5D11pR1pHEM0xttSm1nhgngvx9EPzIDrdcN8uSOlWKpqZa7TaFWo9wUdt1OTEK1fxYrw6Q==
X-Received: by 2002:a5e:de4a:: with SMTP id e10mr5353405ioq.51.1643130746425;
        Tue, 25 Jan 2022 09:12:26 -0800 (PST)
Received: from aford-IdeaCentre-A730.lan ([2601:448:8400:9e8:6592:b6fe:71b1:9f4c])
        by smtp.gmail.com with ESMTPSA id m14sm8090291iov.0.2022.01.25.09.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jan 2022 09:12:25 -0800 (PST)
From: Adam Ford <aford173@gmail.com>
To: linux-media@vger.kernel.org
Cc: aford@beaconembedded.com,
	cphealy@gmail.com,
	Lucas Stach <l.stach@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
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
Subject: [PATCH V4 02/11] dt-bindings: power: imx8mq: add defines for VPU blk-ctrl domains
Date: Tue, 25 Jan 2022 11:11:19 -0600
Message-Id: <20220125171129.472775-3-aford173@gmail.com>
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

From: Lucas Stach <l.stach@pengutronix.de>

This adds the defines for the power domains provided by the VPU
blk-ctrl on the i.MX8MQ.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
Acked-by: Rob Herring <robh@kernel.org>

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

