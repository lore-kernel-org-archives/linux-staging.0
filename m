Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D994A3D90
	for <linux-staging@lists.linux.dev>; Sat, 30 Jul 2022 19:20:22 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id fy29so13693567ejc.12
        for <linux-staging@lists.linux.dev>; Sat, 30 Jul 2022 12:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc;
        bh=WLvWy4K8HcW3LAslZh7Wr86ITXJRS+ffnYQWYzLiedQ=;
        b=B5XKMTbs4j/0CtJ6lJcJQSrjp/VFFmFEiwFaK9Eox4+BF/aN0I3zWl0LV0lxiMLB7Y
         c6cR2WpfgnR+NjfxBIzFKaDwAu+PoOTS3+pGs4Mz2bxtiMgQca7hbEHYuqpvfI3VPcsq
         7W9yzuY1oOw+yKdnYfHkhClYfGrvpT6Z4DHxi2ywdq9OsjDN5mnTwYNoufdCShJ5dkpL
         bU+bpH4Uik4SqMrwFlaCc2WXIG/qRDDrN9CYiHyo/gi8IzzsU9ZFsUzy1xbMRkN6SzM/
         rdDhlBaN8gkvSeyTHuzt5cnsWuyHhEzj+Bs9Wwpa9TW24z0lD5I1t9sxPUjIN3IsjKB8
         3lTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc;
        bh=WLvWy4K8HcW3LAslZh7Wr86ITXJRS+ffnYQWYzLiedQ=;
        b=ORn+59w45fWqAiIYKkodwPZKMT01cgHXGZ5X/DVKvrxwUoDoiusUrPND7VTnYutHMj
         HkhEspLdDhfGjAyt+uokAKtfU8qW+jUZrLXIOdMqMHu379OMevD9JoKoealbvABCgmhp
         nR6itS1sDys0mmGwpEGXmJAdbwMox9jdYWytSZXQxe9PSGDPHZ9JtRXtgk4+wHqINmjF
         QQYtTBvbLLEwx+djforSIYv+z6EEfQ8yXjAi4iswVslaHmvxES4qtQQNOpwSvkuRjYj6
         jkPjhE5Y5aAXT2TWZUO52LnzGA+eH7mqJ1m6oDFgwWyRC6RH8Wng6kXNll7PwNUFrtDe
         G5Zg==
X-Gm-Message-State: AJIora865wbpsZaOuopuBQ/6/5vEBQeGA9/XZEdbWOYfJrkP+oTYZKzd
	6Bm0tBKZtUoWmEGdlb9Ztug=
X-Google-Smtp-Source: AGRyM1sUvBVN9C33ftS/bi6aY2bbpN7dTz1bbU3T/IvMGkYU4Qqki8+lDRrjCraw0MglcO9B8hRFhA==
X-Received: by 2002:a17:906:730c:b0:72b:4f83:51c1 with SMTP id di12-20020a170906730c00b0072b4f8351c1mr7115513ejc.515.1659208820999;
        Sat, 30 Jul 2022 12:20:20 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p54a07b82.dip0.t-ipconnect.de. [84.160.123.130])
        by smtp.gmail.com with ESMTPSA id yw17-20020a170907245100b00722fadc4279sm3218418ejb.124.2022.07.30.12.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Jul 2022 12:20:20 -0700 (PDT)
Date: Sat, 30 Jul 2022 21:20:19 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 1/6] staging: vt6655: Convert macro MACvEnableProtectMD to
 function
Message-ID: <ff985a2e3513f277011badb0103b443efedc8a4d.1659192760.git.philipp.g.hortmann@gmail.com>
References: <cover.1659192760.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1659192760.git.philipp.g.hortmann@gmail.com>

Convert macro to static function. Multiline macros are not liked by
kernel community. Rename variable dwOrgValue to reg_value to avoid
CamelCase which is not accepted by checkpatch.pl. Change variable
declaration to u32 as this improves readability.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/vt6655/device_main.c | 9 +++++++++
 drivers/staging/vt6655/mac.h         | 8 --------
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
index 1fc8bdf8a311..3565aa53f007 100644
--- a/drivers/staging/vt6655/device_main.c
+++ b/drivers/staging/vt6655/device_main.c
@@ -216,6 +216,15 @@ static void vt6655_mac_dma_ctl(void __iomem *iobase, u8 reg_index)
 		iowrite32(DMACTL_RUN, iobase + reg_index);
 }
 
+static void MACvEnableProtectMD(void __iomem *iobase)
+{
+	u32 reg_value;
+
+	reg_value = ioread32(iobase + MAC_REG_ENCFG);
+	reg_value = reg_value | ENCFG_PROTECTMD;
+	iowrite32(reg_value, iobase + MAC_REG_ENCFG);
+}
+
 /*
  * Initialisation of MAC & BBP registers
  */
diff --git a/drivers/staging/vt6655/mac.h b/drivers/staging/vt6655/mac.h
index 467c599a3289..84d203c56b1f 100644
--- a/drivers/staging/vt6655/mac.h
+++ b/drivers/staging/vt6655/mac.h
@@ -543,14 +543,6 @@
 #define MACvSelectPage1(iobase)				\
 	iowrite8(1, iobase + MAC_REG_PAGE1SEL)
 
-#define MACvEnableProtectMD(iobase)					\
-do {									\
-	unsigned long dwOrgValue;					\
-	dwOrgValue = ioread32(iobase + MAC_REG_ENCFG);			\
-	dwOrgValue = dwOrgValue | ENCFG_PROTECTMD;			\
-	iowrite32((u32)dwOrgValue, iobase + MAC_REG_ENCFG);		\
-} while (0)
-
 #define MACvDisableProtectMD(iobase)					\
 do {									\
 	unsigned long dwOrgValue;					\
-- 
2.37.1

