Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A02F29CA
	for <linux-staging@lists.linux.dev>; Sat, 30 Oct 2021 14:40:19 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id y196so1053358wmc.3
        for <linux-staging@lists.linux.dev>; Sat, 30 Oct 2021 07:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DToYAQHxf/EmU+9Qq/Jcp+BO8Gdd2Z8qCSR2az0OK88=;
        b=a53BaJ/pGJ3Hj01nFTpBqLr4jU05yNGuyqncmlBy+RmTLQrM8VbMFWJy+0rKgVVphe
         xfI0NfjE1wtNbyBsZgb4obty9Zk5A3uAB4n9NVtNVzn2vGK9y2+XSSQP74YhusdENAgY
         r19CnsOa7O/IechMMK3ivb/hI59eQc8XHWC4YdiqCDZDYhLV7V9V23eC60OklNAgL0Q5
         QkpPnxH3Bsib1MJxv+xlxlhgoKY/cHtcbiA+ZhV/irtQdglsV6foMdCwaK6btX0L9kSq
         ELsgXG0weVSyJUJj6jOY62MlzsqPCZqEVRMO3kE9K+AtbAkf2/XDgSdUn9N9i8YXXZuN
         xi9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DToYAQHxf/EmU+9Qq/Jcp+BO8Gdd2Z8qCSR2az0OK88=;
        b=cqGE0A/8BBIMeEzWGMyhZBmYc5Fw3uZmgD9ZAG3+y7wFMFVXi7vpeSWP0RN0+imEbH
         2xhS97YLJjJrmmBuJnxRMzVKQO3+mz5hJnTMbWGNzm01kz+kbfDOr1FpJu9TcWS1OoGL
         YXoq0f9LhTuPsXdHF8mZN4+bNqwBasMl+b26gWVRGL7uIlxGC/cSdl+f3oxuy1gy26SI
         R7t1IOYnote72f8hluS4uOCeV0XUt1IWAC4rkAiS8xVHUXW1xClpBNb2FAOP1gvbvIU3
         qv07DhXOQ/eNv76K/pEWXGJOLEZgerPTLY70zltGfDcDyUpuV5gl8n1SYctWq4eo0m8N
         EnWw==
X-Gm-Message-State: AOAM5312V6qGalbXKf6+NI1hye1jTvyZGXNaHOpDmXITdVlJZRKdr5oe
	0Y+F2zbJNS3OibwKleqppCE=
X-Google-Smtp-Source: ABdhPJzXEmb4NsKsRqQU3A4l8zsj0JrJBwWolog/9AGpwCkOKdzKsMv2kO2ecoDitQlKYo1XMHO3jw==
X-Received: by 2002:a05:600c:4f81:: with SMTP id n1mr26909887wmq.63.1635604817623;
        Sat, 30 Oct 2021 07:40:17 -0700 (PDT)
Received: from localhost.localdomain (252.red-83-54-181.dynamicip.rima-tde.net. [83.54.181.252])
        by smtp.gmail.com with ESMTPSA id u19sm483602wmm.5.2021.10.30.07.40.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 30 Oct 2021 07:40:17 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: sboyd@kernel.org
Cc: linux-clk@vger.kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	neil@brown.name,
	linux-kernel@vger.kernel.org,
	john@phrozen.org,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v4 1/4] dt-bindings: reset: add dt binding header for Mediatek MT7621 resets
Date: Sat, 30 Oct 2021 16:40:11 +0200
Message-Id: <20211030144014.26315-2-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211030144014.26315-1-sergio.paracuellos@gmail.com>
References: <20211030144014.26315-1-sergio.paracuellos@gmail.com>
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
2.33.0

