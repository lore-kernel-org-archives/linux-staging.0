Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD132CA6
	for <linux-staging@lists.linux.dev>; Tue,  7 Dec 2021 01:55:01 +0000 (UTC)
Received: by mail-io1-f50.google.com with SMTP id y16so15225773ioc.8
        for <linux-staging@lists.linux.dev>; Mon, 06 Dec 2021 17:55:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ci/iieSAzRzH/2rNrz9vVPVHZbfFcrg+DugyyrDVWRg=;
        b=LDfFHWx0sLwtOI4qmb+rJoZOe3pMc8wQmCBWVmAQyJe6fufpXB+EUy1UM2QqfrxD1S
         FXC9srcLOLwLdw2EH7fkdyPKJSNENNFpOo/oIt2DTrdW+0h7cfD2QfSoXLOOncr1Yc7J
         FrL938kbZFvzOSxGblv7OIzvTIRqVJeF6u6vk7EZ+cC6Xhh7SzGnf/KdSfu//7mv63Kl
         90qyoceR959mHeXesbrzKHbn5wiKggCNyUGuDZPrbGW40yqJBnGqqGVMcP5tpdRchk/Z
         agaLbMKO5DzlfSXJ1sh9VQ/i2y8EJEyn3PIFKr4kzGEYx7K9+WsuS5lfGfDo+/uWJWC6
         jidA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ci/iieSAzRzH/2rNrz9vVPVHZbfFcrg+DugyyrDVWRg=;
        b=DCktjI+uXbNsOwkGyWoeKNhCXwdAvAkNzgQDntWdrXAYKAobnV7n8j/DErKpWj8eqv
         HAl9IsFFkDNSwqqr4OlB8Nj3Hd5tjjdiELu82LUv1v712M3UGqJXVK1PdXTK19J/Abrq
         saqOH9Wx2bQo99SnJvWlZbZrq85LcLgLzBE8+lWpuVz05HGUVN2jQtnU+50m+eOSslzz
         kh7jLmHjI9qkkIKyEyX1cecdg/1bZiYr1jh/1QGN59arj0Q4X9g46dOs4nDgMpd7Aj9C
         R98wjpzI53X5YQD5bQNII/1BV9xFFnadp2Lfaw69QO6XNi1m0WHSVoAX7uxlk/6dp0Rq
         EAmA==
X-Gm-Message-State: AOAM530qL05/jOCr3OiVCYSmAUMRMyH8ASsFJhIpEH7/A0k3wgL8zpKl
	P76GSRnr1kzpxRTOD4rVnfs=
X-Google-Smtp-Source: ABdhPJxJu3EIBppxy4TsSMZ5q6LJjK9+uo/vPJKjyNFfJtmW/D5eNatcK4jPy9Z0hq8LzNIXiJgFkA==
X-Received: by 2002:a05:6602:24ce:: with SMTP id h14mr36594205ioe.87.1638842100890;
        Mon, 06 Dec 2021 17:55:00 -0800 (PST)
Received: from aford-IdeaCentre-A730.lan ([2601:448:8400:9e8:6db8:c9e4:6f6d:f38e])
        by smtp.gmail.com with ESMTPSA id j21sm8623639ila.6.2021.12.06.17.54.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Dec 2021 17:55:00 -0800 (PST)
From: Adam Ford <aford173@gmail.com>
To: linux-media@vger.kernel.org
Cc: cphealy@gmail.com,
	benjamin.gaignard@collabora.com,
	hverkuil@xs4all.nl,
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
Subject: [RFC V2 1/6] dt-bindings: power: imx8mq: add defines for VPU blk-ctrl domains
Date: Mon,  6 Dec 2021 19:54:40 -0600
Message-Id: <20211207015446.1250854-2-aford173@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211207015446.1250854-1-aford173@gmail.com>
References: <20211207015446.1250854-1-aford173@gmail.com>
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

