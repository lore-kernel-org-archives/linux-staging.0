Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9FF2CB6
	for <linux-staging@lists.linux.dev>; Wed,  8 Dec 2021 22:50:41 +0000 (UTC)
Received: by mail-il1-f171.google.com with SMTP id s11so3659413ilv.3
        for <linux-staging@lists.linux.dev>; Wed, 08 Dec 2021 14:50:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=25U6Yhax0BXTLLFHy75HSeiByRDthooJoTH4u1dV5LA=;
        b=IoYpEX/ULICdxAUXcRO4zYu+4e6lAYdr09BYwsVnPD4m2n62fAvPHlC4El3MNgAy+e
         nWfBtwYKW/o6D0eclIrJECJ1nRUmoPWCYs+eESR/s4gbZ29GlWbHuxnFKSQuE7+w0IAr
         R753ClJyqt9hIi214ogONAWVz/TinGE1Auusbyr5W95IVRH/H7TqcSWV93CRrTb2Z4gp
         C5xHNWuGFIn9bcOWnqI4EjqYNzoOa0SeLYkprDPT9h4E82qjdq5taOtVcc8VNw9F8BYE
         Pc0LJ8+UpagLLPFXr9G43kxBjwYPigf7va8nNaulIJz2UkcwdHSTUAlVxOE736k8qW3w
         FVKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=25U6Yhax0BXTLLFHy75HSeiByRDthooJoTH4u1dV5LA=;
        b=19QDJawMqu3mANT6GLDOXexYyw0lmo9+Pb6ohOahHrxa8USpWQVWQLPsQCDrF97TQY
         u7swOQ/um2THmUaAwYYyw+YYlp8dH8/mOhEmOE1Ap7lP8ywo8fGJmPy1wgL9KBBsqH3q
         zEoEKrjHtEJ2r1XXfQSsvRhaAB08h1vGoGrovtsaKmit4xqF6xxvtD4Cc3YDnij2ejVg
         1I+5znjd4BFCWM8TAvwiNi0JXLA5QndDDhljRnC9LWemmjhXqokLIFvqfW3QvETKZFSO
         9O15/umY76HuPHsrdW5hOLTMvyCaVzJe3m9yMOPckFffxKzOYOv57e+jfEjGjMTPM0qE
         QhxA==
X-Gm-Message-State: AOAM531bg2ZS23mwbx07ErwzR8Z+FATg5SguN5C8cD4KUZ3A/iMBuBvU
	2NssSpc1ykny8mxvPst9EKQ=
X-Google-Smtp-Source: ABdhPJzYh5UPP8BPYPny3NBqelVcmvIDzON4ttwf3iKAX0NCfy6JGIDBcalxJHp5I8V2AFvLNA8f/A==
X-Received: by 2002:a05:6e02:10ce:: with SMTP id s14mr9697999ilj.320.1639003840061;
        Wed, 08 Dec 2021 14:50:40 -0800 (PST)
Received: from aford-IdeaCentre-A730.lan ([2601:448:8400:9e8:269a:1aa2:f1d9:8dbb])
        by smtp.gmail.com with ESMTPSA id t6sm2378751ioi.51.2021.12.08.14.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 14:50:39 -0800 (PST)
From: Adam Ford <aford173@gmail.com>
To: linux-media@vger.kernel.org
Cc: benjamin.gaignard@collabora.com,
	cphealy@gmail.com,
	aford@beaconembedded.com,
	nicolas@ndufresne.ca,
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
Subject: [PATCH 01/10] dt-bindings: power: imx8mq: add defines for VPU blk-ctrl domains
Date: Wed,  8 Dec 2021 16:50:20 -0600
Message-Id: <20211208225030.2018923-2-aford173@gmail.com>
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

From: Lucas Stach <l.stach@pengutronix.de>

This adds the defines for the power domains provided by the VPU
blk-ctrl on the i.MX8MQ.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 include/dt-bindings/power/imx8mq-power.h | 3 +++
 1 file changed, 3 insertions(+)

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

