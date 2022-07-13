Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B101B15A9
	for <linux-staging@lists.linux.dev>; Wed, 13 Jul 2022 04:59:23 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id b11so17806071eju.10
        for <linux-staging@lists.linux.dev>; Tue, 12 Jul 2022 21:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=7H0JOtMHighA4NUcVbg55FWnla2SH6bqiX/5b8b857o=;
        b=akdxdB5uNZw0lylqaVFOuTgTdgXfsnuYjjFJ5KnwqCN0lviQ6bdB4Zw6tnbG8BwLX8
         42Ngvnh48s5MVW/uHatI0fn/ufQUNtUUMz9vmImpbSCG63fGzytMU2vnBs9n6+GoggbO
         1o4t0wPX0PQCkHCjgPzltMDxOXVueT5YL/swWBtGTTI/XR2WGR4UJlVfZKc6sBgChGst
         e47vpGFDhI2Gq1hVvOzu7QKYlh1huL1wJ8h1iiuaGZOeOVEFWbkItONaKOTD7xfGM7q3
         kDpLXaCVEf3SSR46nMSezd5AIO2arMvhwg7TTOhf60d9aZ4c5WmwGoSVcwiZd1B2P90s
         3ztA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7H0JOtMHighA4NUcVbg55FWnla2SH6bqiX/5b8b857o=;
        b=gswNYi/Wf5kL7+a/8u5mThRy7digoVaK+ROOKqeinPlP8aNJjEnpSBGTCrCUkbOi1p
         /u5oHB+M9nx5iP5H5PId/FnlkDLmJmu6bsjdmljynpVTL2Qe3An0lNAHD3hdCIe07ZDK
         aLA14gVd9eoozZwddPnbIdg5xo3Rsfh1F7fNe0Dl/rZI6jqcMKzgb4IxUMCSbNRaGxlB
         jhJba/z5q09U/0RgLZLDbXxE6FqlSlQi7ZHEeXdEneWkD8eieJSPJ7LRPQODt3RYTcAV
         N5J3cm342J3SYfFP7ObCwyy9mND9/9XHbNxNhNcFAh6+ib++MU+8Szm3/4y6fCXVahXT
         6okQ==
X-Gm-Message-State: AJIora/ynhFaN/xz9O+Yh8k7g4AP8irQccSwYak4XLUhbHs+8WpMWmD8
	A77FIrYxAPVt7gX98I6W9nE=
X-Google-Smtp-Source: AGRyM1toMQafwzlwa483zjFA86aisXRzS8jnUVp3X+1tgX55MFVfh3N4EmqTzBEPf1Xl02aHgEy+TQ==
X-Received: by 2002:a17:907:75f5:b0:72b:40da:a7cd with SMTP id jz21-20020a17090775f500b0072b40daa7cdmr1561552ejc.662.1657688361962;
        Tue, 12 Jul 2022 21:59:21 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p54a07b82.dip0.t-ipconnect.de. [84.160.123.130])
        by smtp.gmail.com with ESMTPSA id j5-20020a056402238500b004358f6e0570sm7227027eda.17.2022.07.12.21.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jul 2022 21:59:21 -0700 (PDT)
Date: Wed, 13 Jul 2022 06:59:18 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 02/13] staging: vt6655: Rename byBits to bit_mask in two
 macros
Message-ID: <5ac7e8860ecb23232cf5befea024872e7db76d59.1657657918.git.philipp.g.hortmann@gmail.com>
References: <cover.1657657918.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1657657918.git.philipp.g.hortmann@gmail.com>

Fix name of a variable in two macros that use CamelCase which is not
accepted by checkpatch.pl

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/vt6655/mac.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/vt6655/mac.h b/drivers/staging/vt6655/mac.h
index b3803143673c..3037502c1883 100644
--- a/drivers/staging/vt6655/mac.h
+++ b/drivers/staging/vt6655/mac.h
@@ -537,11 +537,11 @@
 
 /*---------------------  Export Macros ------------------------------*/
 
-#define MACvRegBitsOn(iobase, reg_offset, byBits)			\
+#define MACvRegBitsOn(iobase, reg_offset, bit_mask)			\
 do {									\
 	unsigned char byData;						\
 	byData = ioread8(iobase + reg_offset);				\
-	iowrite8(byData | (byBits), iobase + reg_offset);		\
+	iowrite8(byData | (bit_mask), iobase + reg_offset);		\
 } while (0)
 
 #define MACvWordRegBitsOn(iobase, reg_offset, wBits)			\
@@ -551,11 +551,11 @@ do {									\
 	iowrite16(wData | (wBits), iobase + reg_offset);		\
 } while (0)
 
-#define MACvRegBitsOff(iobase, reg_offset, byBits)			\
+#define MACvRegBitsOff(iobase, reg_offset, bit_mask)			\
 do {									\
 	unsigned char byData;						\
 	byData = ioread8(iobase + reg_offset);				\
-	iowrite8(byData & ~(byBits), iobase + reg_offset);		\
+	iowrite8(byData & ~(bit_mask), iobase + reg_offset);		\
 } while (0)
 
 #define MACvWordRegBitsOff(iobase, reg_offset, wBits)			\
-- 
2.37.0

