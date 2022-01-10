Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C912CA2
	for <linux-staging@lists.linux.dev>; Mon, 10 Jan 2022 11:49:34 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id o3so26216384wrh.10
        for <linux-staging@lists.linux.dev>; Mon, 10 Jan 2022 03:49:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9BZOz3rBRK9T1NJYwX4wR3Rx8LIgVrV05ZwydszvJ/w=;
        b=lr5Z+SCtLVTeLyQ0yAPGeriul3M/sb48r09iMN2fpfsN9I4KSJrxq8ZAVNGhny/guE
         NbGRpskBFwrAnY7k/Z6t+abNFO+UDUJls9DtSpJ+48fnAI/p8X4ZEZ+bD6i6ULFhFaH2
         z8SX21ZoICYKFa+nh8y3GmgnLh4DmnXUQjIBIh8rdRcO8DUGAU8rE/d8x1MWO9JQb0+9
         YsTgnVAH09ap7BgXNtGOSHPiBGvIUOH+UP0Ee8IjxJamjNFv3DnSf0+/bgyb1FsCwYDp
         gYCoPXqgORScffFlDqdTnyZuuDxebRagdAVBTxykxozU4sILYUOTcFV24IxC2OVHQISU
         iu8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9BZOz3rBRK9T1NJYwX4wR3Rx8LIgVrV05ZwydszvJ/w=;
        b=oAlyf50/8FHpOM0tbBs7SZoTi5xzBbnGYw3yFoD/FX4qCKnT6zBcsTHjM5dDsJBSOk
         KtEN4tvUp6k+VB1k7LLJa0pcnMc4MuWk+j7i/HNEjQOeG0XY4+5gc3ZOkZgLUITSIBvB
         RhzKKHjKsZsaAklH+dMxKKUvDUHejBzvvGmOAxiqxGK7Ntec9b+Ifhphe49LkziXgMhW
         aqsP/Or6X26nFCdCwMLugl300oVfH3ZbjtRHKkJlMMNAP0utttUVCNnUOs0Zhq2jcSis
         HVNE//XgyoGqneFomk2+i4zXi822Dv6aZ5ppJWs8XuKe8EV61/HTEsmh+fvqokWfYLlX
         v7pQ==
X-Gm-Message-State: AOAM532CJJVAj8KEtq8UrYj0Lec5bQ9Is6vjBVFSA03Ut1FRVlID/GXF
	eqj10WYqOovlwzpGu1Xvz6k=
X-Google-Smtp-Source: ABdhPJzYRkhfIUUAVvWoSVT58H+K9Hf2lyW+S7Dp7ffh/c+SDBL/4d6PNn9tY0/XBsBBAJnJJED7Vg==
X-Received: by 2002:adf:e8d2:: with SMTP id k18mr65592698wrn.187.1641815373164;
        Mon, 10 Jan 2022 03:49:33 -0800 (PST)
Received: from localhost.localdomain (198.red-81-44-130.dynamicip.rima-tde.net. [81.44.130.198])
        by smtp.gmail.com with ESMTPSA id 9sm8090252wrz.90.2022.01.10.03.49.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jan 2022 03:49:32 -0800 (PST)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: linux-clk@vger.kernel.org
Cc: john@phrozen.org,
	linux-staging@lists.linux.dev,
	gregkh@linuxfoundation.org,
	neil@brown.name,
	p.zabel@pengutronix.de,
	linux-kernel@vger.kernel.org,
	sboyd@kernel.org,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v8 1/4] dt-bindings: reset: add dt binding header for Mediatek MT7621 resets
Date: Mon, 10 Jan 2022 12:49:27 +0100
Message-Id: <20220110114930.1406665-2-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220110114930.1406665-1-sergio.paracuellos@gmail.com>
References: <20220110114930.1406665-1-sergio.paracuellos@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add dt binding header for resets lines in Mediatek MT7621 SoCs.

Acked-by: Rob Herring <robh@kernel.org>
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
2.25.1

