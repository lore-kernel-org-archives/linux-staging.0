Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BAA828F3
	for <linux-staging@lists.linux.dev>; Mon,  4 Apr 2022 20:48:51 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id ot30so12553273ejb.12
        for <linux-staging@lists.linux.dev>; Mon, 04 Apr 2022 13:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=J4LkMGmqh/IpZ1iCRfWTzUc90cCZBJCLLtl1EUpG/xY=;
        b=ZQN200a6cw/b5AfpR3Dx+RPgXMa7VenkpOgBGHkNCRIdT7BMrcE0L9W5n6V1sqV/GN
         VEjoVu8+TawE4B49MAioeNQyQLC/a897Fb1sB9R1KZuQUS3OlvyDSbc5eAKznWJj8PK7
         jSNFpYCDeMwCo9Qds7kiuAe30vY6FftnulC1FY/DcibM1/4NwlaCB99KMPb9vY3Uq9EY
         9sFAOKc5yrHx0I/XzPoj6ymiCprXHlzBc/gIgtxhURExOL4+jiBD8up6omNaJlQzZSJ9
         LFQH5DJZkK9mKsQlf094jh1SEs39EQjlHqoakvAbhg9dykYq9DUfruVI3jSlCGiezjIw
         qw7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=J4LkMGmqh/IpZ1iCRfWTzUc90cCZBJCLLtl1EUpG/xY=;
        b=HjO7Hwr6EC3aVTPrqJ9v8NnDsxH2I7ksaCaGcecHD2puDghLJUTvmw1YLp7/U9Hcba
         toxkNK346tn3AeIs+Qv5nMP/alboChG7oC/96PXMAZei5bta1kNbiVDQU/OxYZrTJc8i
         WGYMEe6ueWL5NUhFMYKpSErvbYpukCU+uJ6sguwYJeQyIw8BMpVZcG8zLTK3o9O8E5+s
         TTKJzO7LbXlahzLVkGbCVj5WfWvjiQyEjQQkoM4C244AhEMEhcMktaWMZOSzjdHJtrvN
         N17cJez/O8MxurEynW73SIxPE6WQlVeeew+8EhLyROERHhCabZYlYNQxl0WDyACs9UP4
         cIhA==
X-Gm-Message-State: AOAM533iHL3XP7Cv13dZrjjI4G5hcJPFXfEC0YESvjjCcn0HdDZFa5+k
	BTrm2bGVMHJ3Axt0QZs9hnE=
X-Google-Smtp-Source: ABdhPJyOceuk4zKyHG56ftwcYbV0B24dltyTGZZA6cCalDmcC0XzzoKQDp1oRM93oXIPqNXKlmUrlQ==
X-Received: by 2002:a17:907:7ea6:b0:6db:ca53:9b0a with SMTP id qb38-20020a1709077ea600b006dbca539b0amr1857492ejc.763.1649105329789;
        Mon, 04 Apr 2022 13:48:49 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p54a074e9.dip0.t-ipconnect.de. [84.160.116.233])
        by smtp.gmail.com with ESMTPSA id x3-20020a50d9c3000000b0041c8ce4bcd7sm4529339edj.63.2022.04.04.13.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Apr 2022 13:48:49 -0700 (PDT)
Date: Mon, 4 Apr 2022 22:48:47 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/6] staging: vt6655: Rename macro arguments with CamelCase
Message-ID: <70cce6671976e454830c12d6d7977a5fe816a287.1649103348.git.philipp.g.hortmann@gmail.com>
References: <cover.1649103348.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1649103348.git.philipp.g.hortmann@gmail.com>

Rename macro arguments with CamelCase in upc.h as
they are not accepted by checkpatch.pl
Removed datatype in macro arguments.

Since there are more than one checkpatch issue per line,
more steps are rquired to fix.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
V1 -> V2: This patch was 4/7 and is now 3/6
---
 drivers/staging/vt6655/upc.h | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/vt6655/upc.h b/drivers/staging/vt6655/upc.h
index b374db5fca81..f080a25e6cdf 100644
--- a/drivers/staging/vt6655/upc.h
+++ b/drivers/staging/vt6655/upc.h
@@ -20,34 +20,34 @@
 
 /* For memory mapped IO */
 
-#define VNSvInPortB(dwIOAddress, pbyData) \
-	(*(pbyData) = ioread8(dwIOAddress))
+#define VNSvInPortB(io_address, data) \
+	(*(data) = ioread8(io_address))
 
-#define VNSvInPortW(dwIOAddress, pwData) \
-	(*(pwData) = ioread16(dwIOAddress))
+#define VNSvInPortW(io_address, data) \
+	(*(data) = ioread16(io_address))
 
-#define VNSvInPortD(dwIOAddress, pdwData) \
-	(*(pdwData) = ioread32(dwIOAddress))
+#define VNSvInPortD(io_address, data) \
+	(*(data) = ioread32(io_address))
 
-#define VNSvOutPortB(dwIOAddress, byData) \
-	iowrite8((u8)(byData), dwIOAddress)
+#define VNSvOutPortB(io_address, data) \
+	iowrite8((u8)(data), io_address)
 
-#define VNSvOutPortW(dwIOAddress, wData) \
-	iowrite16((u16)(wData), dwIOAddress)
+#define VNSvOutPortW(io_address, data) \
+	iowrite16((u16)(data), io_address)
 
-#define VNSvOutPortD(dwIOAddress, dwData) \
-	iowrite32((u32)(dwData), dwIOAddress)
+#define VNSvOutPortD(io_address, data) \
+	iowrite32((u32)(data), io_address)
 
-#define PCAvDelayByIO(uDelayUnit)				\
+#define PCAvDelayByIO(u_delay_unit)				\
 do {								\
-	unsigned char __maybe_unused byData;			\
+	unsigned char __maybe_unused data;			\
 	unsigned long ii;					\
 								\
-	if (uDelayUnit <= 50) {					\
-		udelay(uDelayUnit);				\
+	if (u_delay_unit <= 50) {					\
+		udelay(u_delay_unit);				\
 	} else {						\
-		for (ii = 0; ii < (uDelayUnit); ii++)		\
-			byData = inb(0x61);			\
+		for (ii = 0; ii < (u_delay_unit); ii++)		\
+			data = inb(0x61);			\
 	}							\
 } while (0)
 
-- 
2.25.1

