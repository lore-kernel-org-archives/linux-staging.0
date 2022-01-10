Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0639A2CA2
	for <linux-staging@lists.linux.dev>; Mon, 10 Jan 2022 11:10:41 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id e9so24537631wra.2
        for <linux-staging@lists.linux.dev>; Mon, 10 Jan 2022 03:10:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9BZOz3rBRK9T1NJYwX4wR3Rx8LIgVrV05ZwydszvJ/w=;
        b=IZoGetFevexdCPMr9wmIWzK3kSyE3XlPYLgqnt2+w7Vk6nP/d+SxzqhD5+Gj3WUGSi
         R6HS5Mc5HUbM5sh5+HLXuZo+Wqcg8C1EdMprgIaChKXWZ2RAiLJsY9u92AKzoO+QW7hL
         H+aN89QiLW3sjzx5v9KtkvjVK2bk3Seqgys+fXl94DcbPW5qOa38MzA8jRfy7NyzrbJc
         WAWmOLerHwVzkeU6sZeVN4WiJXoXljGpab0Dgt3WQy8Vci46lFGhC4bxGn49jFgH7Kwy
         YcMv1MQ8wEFNxPR/zq1+KJowE2ChhBAgnOGgdq3DT72LrH8xON7y0F/8Vvvns6FoWsAG
         ipbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9BZOz3rBRK9T1NJYwX4wR3Rx8LIgVrV05ZwydszvJ/w=;
        b=xmjC1NvWVtHbIEeFeHSNRrJDsjUzOVOR5K9NUdQIkI4anUIPKnmkqnbLNaYrotYTb8
         74AwnHMa9wepdKvFrLRuHBtVDDGMCbOQzrRJjZ/sr7rbig/hmof6x3PnRiDH54lxuQNc
         iUz34PStAuLM7jkgXAz1oRzlbq3f/LNDfCcd1o5HuTf4pIQbHdYW3GZ0a3JlPetXxflb
         9WemMcxD4QOLMYHi36f3yXpd1y2TVkSHind3GiEWf2kllXYSIU6tt1n9bo9hDg6r0nAs
         V5S672ez68yT/Ivp3rZ81Kd7py1nti0AWGTgsCnzLOzjTdrnbe/9mGApmxtUXcP19uJ2
         Pz8A==
X-Gm-Message-State: AOAM530NWoEYbcEzR1nvkA1/RauQCTYunEw4R19HaZ+wPT3SckmghOxQ
	zLKI9QJCeqV0ludtCVCC9x0=
X-Google-Smtp-Source: ABdhPJzYiVaMPTldnZT9Y7Zg8N5WZr4CYFjcg8SxU5eVhiv8fK8T2FTxBAoQbwBjE0Qt1IBbgo8fFA==
X-Received: by 2002:a5d:494f:: with SMTP id r15mr3060751wrs.388.1641813040424;
        Mon, 10 Jan 2022 03:10:40 -0800 (PST)
Received: from localhost.localdomain (198.red-81-44-130.dynamicip.rima-tde.net. [81.44.130.198])
        by smtp.gmail.com with ESMTPSA id x8sm6256733wmj.44.2022.01.10.03.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jan 2022 03:10:39 -0800 (PST)
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
Subject: [PATCH v7 1/4] dt-bindings: reset: add dt binding header for Mediatek MT7621 resets
Date: Mon, 10 Jan 2022 12:10:33 +0100
Message-Id: <20220110111036.1380288-2-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220110111036.1380288-1-sergio.paracuellos@gmail.com>
References: <20220110111036.1380288-1-sergio.paracuellos@gmail.com>
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

