Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74DE62C8E
	for <linux-staging@lists.linux.dev>; Wed,  6 Oct 2021 11:23:10 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id t8so7860142wri.1
        for <linux-staging@lists.linux.dev>; Wed, 06 Oct 2021 04:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lMW4foefc6bEFLqLQ2H0asFN0IF8jIbnNoNDfv9QTpo=;
        b=fqdoZhMJ2rxSvh2lAg5TQLQ6khL0EhpVeNi4HptuzUZ1DC3nJNGIPgvplHbMR76SeG
         tE+zzecpcLnJU5QQF05MnQrHtQbUemmbu1R6HLp8c9S47FR70J57K6ovtyOM65f8M6ih
         PFZUHsOON6/HLhhmHOHAr6wdjR+GkNljvpSXtIm1QpL5Gti0XljT56KRRtf/G6RsqTFB
         y6u3ydnPQpjnlIQA2q/9pnH5T2uqARPPc5mY7feGiQRBaP4xeVtbGGn6SjmKuoCTtx06
         HVk7gdoqFC7wgyRkwpLkqY46OkBcZh0OnWuNb1pJCr8W6FKR4/G3z7ty99I7PY2w1VYP
         KZfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lMW4foefc6bEFLqLQ2H0asFN0IF8jIbnNoNDfv9QTpo=;
        b=wsXtIqJ1+8FLxVbOk/YkPKFYX+IZD/hfEmCeXZdu7tGoIWsxUj0+NvGLQVAOv8/EJO
         qDAUuLXh3c0Q3OnZzX00cWICP7QQcd/KtJN2oXbIK5u9LZaaCyObP9GXgxG6kPVi14N9
         7N5NDpbbsZ2q6g2fgc4Lgcu+nOI4l6KAbeaVtIxHW0eXu7VolVCsm1xiOo9IrnLP/J3q
         kF8Hhymi/al7dKE3uYefo20wD9Tc2BKE4tpf2do5k70/ufryyfs8VRaF8TLw0CoAODqw
         xPZ4rABiexgTzUFWJ4zoCYqrhcMX3nhEgTf9eG6ixhSdK+N6vd2cK8zqRdAgPdYwlbw5
         Jrbw==
X-Gm-Message-State: AOAM530jOsczOfYhI2bafjj1pQPiUsTuf5TBITwo4aYv22k/ulP6K14T
	lwSV/u+UNfBKpkuTl4yeW0A=
X-Google-Smtp-Source: ABdhPJy9s/UAVv/L8Zfm9yvqWMej5Q+dXlji9BY4WfNy30A6S0GHmbTvPS+EYEKibZtyWtSJQgEwGg==
X-Received: by 2002:a7b:c954:: with SMTP id i20mr9314376wml.126.1633519388877;
        Wed, 06 Oct 2021 04:23:08 -0700 (PDT)
Received: from localhost.localdomain (252.red-83-54-181.dynamicip.rima-tde.net. [83.54.181.252])
        by smtp.gmail.com with ESMTPSA id e14sm10801985wrw.33.2021.10.06.04.23.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 06 Oct 2021 04:23:08 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: sboyd@kernel.org
Cc: linux-clk@vger.kernel.org,
	gregkh@linuxfoundation.org,
	devicetree@vger.kernel.org,
	robh+dt@kernel.org,
	linux-staging@lists.linux.dev,
	neil@brown.name,
	linux-kernel@vger.kernel.org,
	john@phrozen.org
Subject: [PATCH v2 1/4] dt-bindings: reset: add dt binding header for Mediatek MT7621 resets
Date: Wed,  6 Oct 2021 13:23:03 +0200
Message-Id: <20211006112306.4691-2-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211006112306.4691-1-sergio.paracuellos@gmail.com>
References: <20211006112306.4691-1-sergio.paracuellos@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add dt binding header for resets lines in Mediatek MT7621 SoCs.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 include/dt-bindings/reset/mt7621-reset.h | 37 ++++++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 include/dt-bindings/reset/mt7621-reset.h

diff --git a/include/dt-bindings/reset/mt7621-reset.h b/include/dt-bindings/reset/mt7621-reset.h
new file mode 100644
index 000000000000..7572c6b41453
--- /dev/null
+++ b/include/dt-bindings/reset/mt7621-reset.h
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2021 Sergio Paracuellos
+ * Author: Sergio Paracuellos <sergio.paracuellos@gmail.com>
+ */
+
+#ifndef DT_BINDING_MT7621_RESET_H
+#define DT_BINDING_MT7621_RESET_H
+
+#define MT7621_RST_SYS		0
+#define MT7621_RST_MCM		2
+#define MT7621_RST_HSDMA	5
+#define MT7621_RST_FE		6
+#define MT7621_RST_SPDIFTX	7
+#define MT7621_RST_TIMER	8
+#define MT7621_RST_INT		9
+#define MT7621_RST_MC		10
+#define MT7621_RST_PCM		11
+#define MT7621_RST_PIO		13
+#define MT7621_RST_GDMA		14
+#define MT7621_RST_NFI		15
+#define MT7621_RST_I2C		16
+#define MT7621_RST_I2S		17
+#define MT7621_RST_SPI		18
+#define MT7621_RST_UART1	19
+#define MT7621_RST_UART2	20
+#define MT7621_RST_UART3	21
+#define MT7621_RST_ETH		23
+#define MT7621_RST_PCIE0	24
+#define MT7621_RST_PCIE1	25
+#define MT7621_RST_PCIE2	26
+#define MT7621_RST_AUX_STCK	28
+#define MT7621_RST_CRYPTO	29
+#define MT7621_RST_SDXC		30
+#define MT7621_RST_PPE		31
+
+#endif /* DT_BINDING_MT7621_RESET_H */
-- 
2.33.0

