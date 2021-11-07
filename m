Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254F129CA
	for <linux-staging@lists.linux.dev>; Sun,  7 Nov 2021 07:42:05 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id r9-20020a7bc089000000b00332f4abf43fso8828197wmh.0
        for <linux-staging@lists.linux.dev>; Sun, 07 Nov 2021 00:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DToYAQHxf/EmU+9Qq/Jcp+BO8Gdd2Z8qCSR2az0OK88=;
        b=BjfScZc2zd9quVMZa3wEMSuXvKSHCRVVK90d9WoR/lxdnL61F2JY8RUh3j+indP+Sm
         jabTf1Ko+plMv+i+XSVBRkZ/fxXC4sKcSk8gInzMywSoCwOHtjO7vl0U8vNfLckn8qqZ
         r6MWdhnokaBciA8/99w/05kaKi9qPJwKvHj8qn6CBIx2FJQv6c665DKAJB6Y3Ng9BrMJ
         V1MSjpHTBCcg4ZXD3NyJF37aFJsyuYwQo1Ys+PKgYbQKNcEisP19NTofNVUV3Nxmj2+q
         SzrfTw0/LfAZuLhBvcnsBr1EMFDeyD7QKZ8akSQZyD0mGV61SM84pgobsqMsme3kPwiR
         BgrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DToYAQHxf/EmU+9Qq/Jcp+BO8Gdd2Z8qCSR2az0OK88=;
        b=R3IyAktY6oGq7+ue5N2FpsY5oivLZSNbRmnNTw/eIAG7FefpBtrQ4if/ZkdW/n7K2J
         mJEfem0iEvT0GKWwtxnJ5Qta0sgWTIPxVw7kSrVjqQ1AbiMqshv2hva8r7ZPYF34RFgu
         R2Na0q6XME2dPF5yUZ9Bufn3BG2FX/VloY5qVLjWxKc4hnEEnsTwMXXRws/S+SswhcEZ
         ijpRohGsm62k26F3v93slOoBekOEX1CzeiWb9SpUYXcjTXFVjE3UKxv9A4cgs4pquH8F
         1OlUgHno67IqK+VJspqy/8XH/6B+Ek8XJS17hPC2EmdZjnWA8bmmwr2YQrdJzhV4L30T
         kDKQ==
X-Gm-Message-State: AOAM530o2TctBbGtn3bYuAoR+OLyEo1YU/oliu2QXbvtIDg3RN5rsHQD
	TT5uSTAJYEQbRCiKR9/K5JQ=
X-Google-Smtp-Source: ABdhPJyvO3YtYJdhN5L0k0z4aFFIWsLR3XjcqqsSZ3lDac28EUXR5wX8KDVxFh2AUl/Ki9KDV2UexQ==
X-Received: by 2002:a05:600c:a55:: with SMTP id c21mr43630210wmq.191.1636270923574;
        Sun, 07 Nov 2021 00:42:03 -0700 (PDT)
Received: from localhost.localdomain (252.red-83-54-181.dynamicip.rima-tde.net. [83.54.181.252])
        by smtp.gmail.com with ESMTPSA id e12sm15353352wrq.20.2021.11.07.00.42.02
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 07 Nov 2021 00:42:03 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	sboyd@kernel.org,
	john@phrozen.org,
	linux-staging@lists.linux.dev,
	gregkh@linuxfoundation.org,
	neil@brown.name,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v5 1/4] dt-bindings: reset: add dt binding header for Mediatek MT7621 resets
Date: Sun,  7 Nov 2021 08:41:57 +0100
Message-Id: <20211107074200.18911-2-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211107074200.18911-1-sergio.paracuellos@gmail.com>
References: <20211107074200.18911-1-sergio.paracuellos@gmail.com>
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

