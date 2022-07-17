Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 272DF2906
	for <linux-staging@lists.linux.dev>; Sun, 17 Jul 2022 22:20:12 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id ez10so18255405ejc.13
        for <linux-staging@lists.linux.dev>; Sun, 17 Jul 2022 15:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ER+wlmwgWW3cJhjmYLRX0mj3AW4fGnQUl6MKua+ERA0=;
        b=egnh8gJ6gvdtwfYwLGH1oxRefUzeuZsf7BuZk3+wRnNACbIgkzrFq71omHmwltzKMM
         9bzHf6J1HCms1r04n6s6K4M3WpzWCkIF+H/eASzYyDLrT685Ugpsx5Jwcqvur/ZtbrGe
         c5P8FX6nVMIzVLKGazf97Je09F20bAmkxzT9Ak+kIDwS2SASqDNrm8Xjza8ENxKaqwvw
         yAnhHBgQBuHw35P6eY5BpMMhkUFuvGXAi2vnRDFdK70fPcy7y4IbWzEsBqjX7zpHKh8n
         K7wqtXcInI3Z4KTU54FkNsTbrmnHdJcgaIicYRtV0SwbszeC3ZVo8dAUE+tsJ1AssxCG
         EmuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ER+wlmwgWW3cJhjmYLRX0mj3AW4fGnQUl6MKua+ERA0=;
        b=5NY9SqABXKgp18pTj1oKlFfhJM0ss7ZwLKQD5QpaZHvZEMvBmJc3rr93F57l7uJfFg
         HAUI8/r4TR5efSalU+GXmmvDh4/i/c/HisUROwFsmyFxHQo7ocTtRCGyjntKYMcZ4Bi8
         JUiuGsG83E1xDi/a9QrB0DSx5vlVi4OKeoJDKGrES0Kw+Nd/HXjmm3hLMTOtZgaABrAn
         4qAKFpgFTMd7orQqaW2YlQzj0lZPyqCbLuotMqxfitQDn8tWB2TKcECbGx03d1akT08X
         fwMd3J5JlzE2p7wihcbT9MDJv2oWv73/CRrpeKAuWxniF+HcWF0gXImKMQdfLtiVC+OG
         xoRw==
X-Gm-Message-State: AJIora/+eMY+Ac0gTsOs8UrE8LnIeQIGLjpMIR04jW1/P+m09zgf07zl
	eCUQn7KtRBLM/Ard4XKSUS5k1Hvzsqs=
X-Google-Smtp-Source: AGRyM1uDFea9JW//11M9yCM7Lw/U2tgXSLxucFib47swRpXoGt0xgvh4znDtoHqMnYd/dQ/d3ds14A==
X-Received: by 2002:a17:906:216:b0:711:f623:8bb0 with SMTP id 22-20020a170906021600b00711f6238bb0mr24012671ejd.174.1658096410414;
        Sun, 17 Jul 2022 15:20:10 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p54a07b82.dip0.t-ipconnect.de. [84.160.123.130])
        by smtp.gmail.com with ESMTPSA id f8-20020a056402160800b0043b0cd89d99sm7427924edv.32.2022.07.17.15.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jul 2022 15:20:09 -0700 (PDT)
Date: Mon, 18 Jul 2022 00:20:08 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 1/7] staging: vt6655: Rename dwData to reg_value in four
 macros
Message-ID: <b54577316eebdbb54e478fc51473eeba9d7eacae.1658094708.git.philipp.g.hortmann@gmail.com>
References: <cover.1658094708.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1658094708.git.philipp.g.hortmann@gmail.com>

Fix name of a variable in four macros that use CamelCase which is not
accepted by checkpatch.pl

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/vt6655/mac.h | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/vt6655/mac.h b/drivers/staging/vt6655/mac.h
index b307161818a0..bfcbeb96f839 100644
--- a/drivers/staging/vt6655/mac.h
+++ b/drivers/staging/vt6655/mac.h
@@ -539,9 +539,9 @@
 
 #define MACvReceive0(iobase)						\
 do {									\
-	unsigned long dwData;						\
-	dwData = ioread32(iobase + MAC_REG_RXDMACTL0);			\
-	if (dwData & DMACTL_RUN)					\
+	unsigned long reg_value;					\
+	reg_value = ioread32(iobase + MAC_REG_RXDMACTL0);		\
+	if (reg_value & DMACTL_RUN)					\
 		iowrite32(DMACTL_WAKE, iobase + MAC_REG_RXDMACTL0);	\
 	else								\
 		iowrite32(DMACTL_RUN, iobase + MAC_REG_RXDMACTL0);	\
@@ -549,9 +549,9 @@ do {									\
 
 #define MACvReceive1(iobase)						\
 do {									\
-	unsigned long dwData;						\
-	dwData = ioread32(iobase + MAC_REG_RXDMACTL1);			\
-	if (dwData & DMACTL_RUN)					\
+	unsigned long reg_value;					\
+	reg_value = ioread32(iobase + MAC_REG_RXDMACTL1);		\
+	if (reg_value & DMACTL_RUN)					\
 		iowrite32(DMACTL_WAKE, iobase + MAC_REG_RXDMACTL1);	\
 	else								\
 		iowrite32(DMACTL_RUN, iobase + MAC_REG_RXDMACTL1);	\
@@ -559,9 +559,9 @@ do {									\
 
 #define MACvTransmit0(iobase)						\
 do {									\
-	unsigned long dwData;						\
-	dwData = ioread32(iobase + MAC_REG_TXDMACTL0);			\
-	if (dwData & DMACTL_RUN)					\
+	unsigned long reg_value;					\
+	reg_value = ioread32(iobase + MAC_REG_TXDMACTL0);		\
+	if (reg_value & DMACTL_RUN)					\
 		iowrite32(DMACTL_WAKE, iobase + MAC_REG_TXDMACTL0);	\
 	else								\
 		iowrite32(DMACTL_RUN, iobase + MAC_REG_TXDMACTL0);	\
@@ -569,9 +569,9 @@ do {									\
 
 #define MACvTransmitAC0(iobase)					\
 do {									\
-	unsigned long dwData;						\
-	dwData = ioread32(iobase + MAC_REG_AC0DMACTL);			\
-	if (dwData & DMACTL_RUN)					\
+	unsigned long reg_value;					\
+	reg_value = ioread32(iobase + MAC_REG_AC0DMACTL);		\
+	if (reg_value & DMACTL_RUN)					\
 		iowrite32(DMACTL_WAKE, iobase + MAC_REG_AC0DMACTL);	\
 	else								\
 		iowrite32(DMACTL_RUN, iobase + MAC_REG_AC0DMACTL);	\
-- 
2.37.1

