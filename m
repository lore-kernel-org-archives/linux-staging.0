Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4E82C87
	for <linux-staging@lists.linux.dev>; Sat, 30 Oct 2021 14:20:13 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id a20-20020a1c7f14000000b003231d13ee3cso13909056wmd.3
        for <linux-staging@lists.linux.dev>; Sat, 30 Oct 2021 07:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DToYAQHxf/EmU+9Qq/Jcp+BO8Gdd2Z8qCSR2az0OK88=;
        b=lch/4hovwMuDOBS9A1cTb7nQndbyEguJ3+9lcAlXv1X9QT8JN53xNT2HkYxZVFRjmp
         xywnmlU6TprkgBN1WEvKLxrGp2uRJiKaJpTNcMHVcz+7utONDz5PC4Oyxe1j5MbNl7wY
         tjKVEXE35n75hm14SdqYhAkeDILX4WV0gtE0FEOnNzFXr/9eWGmO+4R2qZ6sdVzx4xdm
         k0bq7Hc0iK42ulFXN2Kr6CULXefS8bwDUQhHNWxEV036BY4270T5PZU8hFdZwYj4gvH1
         U/FR9IRiw8+J8WdPfaApjR/tWz2y+OeyTJnx/m2cLamYYsnCMs9DZUWeCKac6F+N43Ey
         rDBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DToYAQHxf/EmU+9Qq/Jcp+BO8Gdd2Z8qCSR2az0OK88=;
        b=KW74T9sr9xRvmkNVUXVgkhaGFibM0b6ne1x/ZRSOj5Da4pQfrcIP/q4OCZ+lPmb2Xk
         9Uug2NOElRSQ/xiyet6HhD3AoBInJY0uoXaodnKb2pa5HsEK48tde6+REL9WazM/8P9n
         XSBPrRzhnte/q3CMDnx560RJTd+BtKTlE9HWxuPUppTo5vyGSTQcsmGNnO2izW8TAoZ5
         p/Mqv19w/HgV7fB01a4mck+H6kPfzvn8Xwmoc6kGhuQxE9aiA4kKMcp+riM3R9I5kIXF
         AUQUZSnkfSsTTEAYzc7GnTKFKwp03z5jdb7e7TFemjySmtPxKHKEgwnLN42VgpNQonTc
         64TQ==
X-Gm-Message-State: AOAM530n4r2zfX6TUTkqv51HPks7clxVdNiHm81nxBKZFyBp610YOcUm
	BKAG350K3DpPFvMY6Mo1fVM=
X-Google-Smtp-Source: ABdhPJxYdplZsYeZu0kDBxVD5SD/C4Oi+ARiKw4LEdiCrHM5gXLecnRUd0iKipp6Y8Vu6fdKX+DQhA==
X-Received: by 2002:a7b:cbc2:: with SMTP id n2mr21756186wmi.123.1635603611767;
        Sat, 30 Oct 2021 07:20:11 -0700 (PDT)
Received: from localhost.localdomain (252.red-83-54-181.dynamicip.rima-tde.net. [83.54.181.252])
        by smtp.gmail.com with ESMTPSA id m12sm8208521wrq.69.2021.10.30.07.20.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 30 Oct 2021 07:20:11 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	sboyd@kernel.org,
	john@phrozen.org,
	linux-staging@lists.linux.dev,
	gregkh@linuxfoundation.org,
	neil@brown.name,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v3 1/4] dt-bindings: reset: add dt binding header for Mediatek MT7621 resets
Date: Sat, 30 Oct 2021 16:20:04 +0200
Message-Id: <20211030142007.27085-2-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211030142007.27085-1-sergio.paracuellos@gmail.com>
References: <20211030142007.27085-1-sergio.paracuellos@gmail.com>
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

