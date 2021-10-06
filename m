Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5652B2C86
	for <linux-staging@lists.linux.dev>; Wed,  6 Oct 2021 06:12:09 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id v17so5180782wrv.9
        for <linux-staging@lists.linux.dev>; Tue, 05 Oct 2021 23:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lMW4foefc6bEFLqLQ2H0asFN0IF8jIbnNoNDfv9QTpo=;
        b=e7WgKi5k+F0e4KVHalUl0lt6lYta3FL9Lkj0By+kc+nNmKihLUhm3SfM1xLx5Mu+1l
         pmpIU2EbRexP0Zqdig9TajTW6ADUosnNfNUn7jtko/sE0jSOW7CQAjioh62b953JLM3O
         RGxKtsSZzDp3ALgtv7+rUJICwcQ1Kw0khoWA6ggL6mdd6ONsbmq1hxh3+xUrQwqPNvhr
         GixcQLr9D3DxEhuTsUtzfl9Q/nSI9l2L0wj6A7F0ig2ZBaHJ9gnjIFt4fAGkIuWc4sKS
         pi1rg3Un8B5QyukJICIWtpFrYvP8i7WIjSpOwd6pkZQWV7F8/hDwDGen/znRoq/CvpLi
         Cyyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lMW4foefc6bEFLqLQ2H0asFN0IF8jIbnNoNDfv9QTpo=;
        b=LItJkUJlUcgFw51V2FTbYOvzzO43wlbgIq4AJlN1ukiqLj2GoYrMx5WoqGgkGJQP3H
         yrVvqpIX9x2N8uXybCI496nBAML5wgMCZWqmdoBPDbAmXtcZATX0ln2GjTn8eFZmRpmc
         7wq9QkkC4JjG/ettD8yYSzVzT/kVIJHko1KH39nek42EtLHE1+cXTdinL5gvRpzfFpmI
         gfML79zq19m7UQF+Wg//bBURCmChKPbTTRPeyCYc4L0N6A1iL0oF0sgxkFuIv5sdV7q+
         N7HTMrMdYF1uyn6OOaKrOwqsyRo5SAWp/mENjVNHfoPLEL21Lz5jZYWJK86hFDGAU1tn
         p61A==
X-Gm-Message-State: AOAM5336cSY7lhfNdLReAdB2X0iHrpjXRlHH+CWMu2gXdZyHqWnnPpwS
	QRuy9gWp/Gij3egIFaxZoKQ=
X-Google-Smtp-Source: ABdhPJzWFOAKHtnF6xn6CskP/tAMoCqT71fSDgdsfiv31c5iXRR6qJf29QeN5a8UFgqEsQWkRwWT0Q==
X-Received: by 2002:a05:600c:3b22:: with SMTP id m34mr7622500wms.130.1633500727710;
        Tue, 05 Oct 2021 23:12:07 -0700 (PDT)
Received: from localhost.localdomain (252.red-83-54-181.dynamicip.rima-tde.net. [83.54.181.252])
        by smtp.gmail.com with ESMTPSA id e8sm3893071wme.46.2021.10.05.23.12.06
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 05 Oct 2021 23:12:07 -0700 (PDT)
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
Subject: [PATCH 1/4] dt-bindings: reset: add dt binding header for Mediatek MT7621 resets
Date: Wed,  6 Oct 2021 08:12:01 +0200
Message-Id: <20211006061204.2854-2-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211006061204.2854-1-sergio.paracuellos@gmail.com>
References: <20211006061204.2854-1-sergio.paracuellos@gmail.com>
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

