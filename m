Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B9D115A9
	for <linux-staging@lists.linux.dev>; Wed, 13 Jul 2022 05:00:15 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id z23so1296354eju.8
        for <linux-staging@lists.linux.dev>; Tue, 12 Jul 2022 22:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=XK3eAznYnMqkqX/6bVlmokqUaWC4Z4VLgnMUjqyOqbY=;
        b=bnDnQdMDZOLk1M8qct8iD/0HC/IJw8m5L+UKGGR+jVys7wZxRZ6wlSxw5NAwHAByBv
         a4NQ5RjNMeFpeg+ddzGQNlZQPlLF8bB8k6Ut4w8CSUG5jwPMCCL1LMqIXSFQlUSTTKdW
         H2xJ4f2nGqgPMB340WmbH7GijolBIoU5oGxQ2JSiZN+6EbIglxL5CCyyPF/Sh/X+F8wh
         PztmArOWTNt1v2ho7e/t8CY9JEdua7JmOzD9NZLVP0+08yOllpWKbJlgYm+BENfoaBjI
         AcT5hXnDqLy+bmgYgmGfW6kTEUnKezSJ/9bEDUZZiGZ2CNKG351jEQ6rWozg7nkdd4bv
         jfZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XK3eAznYnMqkqX/6bVlmokqUaWC4Z4VLgnMUjqyOqbY=;
        b=aDosHPoMqM+g7LfjBT/I+B6xK3CJf+MwzECoccwRzy6ynfcXtSG3qDf7SlrYXSdA3G
         sDeBsPnpT26K6IHWwHIaAqMZs2++bFRdDsVIqcjGDDaLeaYBC2rXhCnwkgvM8019naol
         VWo/fO6dr6sozw6m2Nry880qP9bIjlpEsnG15qkWbIDTpsKL1sbdzq4YamPil0EuoFzk
         HQc8C0nCkPFSd3Ki/gCLFrJi81hf9GvOgthagRTAjb/VxHyCofO3G2wxu3K9FIktwYjA
         DSd5HM0OuwHrgttBYAkVYEcrsVO3oUZAEl3ShaD2ZNPH8jiLbgjSIC0DOzgN3kMGA9RZ
         OOyw==
X-Gm-Message-State: AJIora9bhExF+tLtREt+X1qBQTSLAUgexcnt2Qj8qGb80VGxIyIBb7Pe
	9fZfLFcua75n5jpXUtiGDg0=
X-Google-Smtp-Source: AGRyM1tbi+i09pjDzb48Bp764UEb+iKcQH7L4pxqx18VkoNmQFOqFncOsUacjnS2oLCmUPqw1p5qOg==
X-Received: by 2002:a17:906:31d9:b0:726:a68b:b666 with SMTP id f25-20020a17090631d900b00726a68bb666mr1562836ejf.159.1657688414376;
        Tue, 12 Jul 2022 22:00:14 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p54a07b82.dip0.t-ipconnect.de. [84.160.123.130])
        by smtp.gmail.com with ESMTPSA id oz7-20020a170906cd0700b0072b16ea4795sm4474967ejb.48.2022.07.12.22.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jul 2022 22:00:14 -0700 (PDT)
Date: Wed, 13 Jul 2022 07:00:12 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 05/13] staging: vt6655: Rename wData to reg_value in two
 macros
Message-ID: <8f2e9451a24e380c997fcf7c87249f7ed9b66787.1657657918.git.philipp.g.hortmann@gmail.com>
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
 drivers/staging/vt6655/mac.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/vt6655/mac.h b/drivers/staging/vt6655/mac.h
index 16c18a1ed22e..2a31c94156b2 100644
--- a/drivers/staging/vt6655/mac.h
+++ b/drivers/staging/vt6655/mac.h
@@ -546,9 +546,9 @@ do {									\
 
 #define MACvWordRegBitsOn(iobase, reg_offset, bit_mask)		\
 do {									\
-	unsigned short wData;						\
-	wData = ioread16(iobase + reg_offset);				\
-	iowrite16(wData | (bit_mask), iobase + reg_offset);		\
+	unsigned short reg_value;					\
+	reg_value = ioread16(iobase + reg_offset);			\
+	iowrite16(reg_value | (bit_mask), iobase + reg_offset);		\
 } while (0)
 
 #define MACvRegBitsOff(iobase, reg_offset, bit_mask)			\
@@ -560,9 +560,9 @@ do {									\
 
 #define MACvWordRegBitsOff(iobase, reg_offset, bit_mask)		\
 do {									\
-	unsigned short wData;						\
-	wData = ioread16(iobase + reg_offset);				\
-	iowrite16(wData & ~(bit_mask), iobase + reg_offset);		\
+	unsigned short reg_value;					\
+	reg_value = ioread16(iobase + reg_offset);			\
+	iowrite16(reg_value & ~(bit_mask), iobase + reg_offset);	\
 } while (0)
 
 #define MACvReceive0(iobase)						\
-- 
2.37.0

