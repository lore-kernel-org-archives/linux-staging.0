Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D45D715A9
	for <linux-staging@lists.linux.dev>; Wed, 13 Jul 2022 05:00:01 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id m16so12617779edb.11
        for <linux-staging@lists.linux.dev>; Tue, 12 Jul 2022 22:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=7zvWAkBTi/beWqRFaw5lDcuuxOrGcwkbEW6Pb2PXE4Y=;
        b=VyHGbrpP1vLssXF9qkHIPGZI1MV57KbSlgYwNEDzaRG0iV3mA7d/SdLRqa99Z6qzZk
         zZWcG0SgFMmJ0numAmylMJKXq7UH+14wXu6mu3E8XC6z74M59seYohKXz1Ininskig0E
         BxDG2H2X1slGxy8CE/eBZVygHn/2disnbdIFW5M2by6QyR7QJhOKByPfirE0IXzowwU8
         LR84L2Yyg6HujggtV0UpLaZpOBt0/+VvwUNpb5kJaHdKwtPR6xt/fL7wEH2a5E67S1CN
         WxpinUjxZ+wynT6SRxxMZ80oMNH910Biw3uRRaGs9yfDKmrW+LetF/WeCPTjlwHEWsjs
         0uRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7zvWAkBTi/beWqRFaw5lDcuuxOrGcwkbEW6Pb2PXE4Y=;
        b=mRAzpfUu4CsIAy4CbkbsNUlz2TNScOhsPD/8BX7h0Nas2yzcsZ0Pc8oRAHOnqgPkgd
         5rwmidis4e9K/nB/e5kEnSkrK4TTMkHpOpIB6h61zt+SzQbbg/S17OSFNN83efcdQotc
         QCxNdEXaXsELDgpETGC91Qf4AU7lpxtmqJDzRzmXcK31GmlilRtOor+D9i+8rVBaJ27N
         Dwu19Gxw5zJN7bmlT8q8mltPnYGtrZGpuGJMpTt3Chzl2HV5ms/tzKT+gR/0FdKVuToZ
         VZI/cOQVs5PeT/8rtDcVdMHmtVcPHGa+GaDljPHxtsBsM6fMm5OB6F6KiCfYTsm/2x4+
         qaZA==
X-Gm-Message-State: AJIora80mjGTyhBLsXkxJ2MwhmYmHbRBhsdR2KuDJNawxum8gU10W4Oo
	K1q3GtBBeMgvvgIk2YHITQU=
X-Google-Smtp-Source: AGRyM1vKo0fAIwILvK8iK/IJuJWaQ3vQFDqXmOJpkpJaX/bjETJTmd1uG0fxp++RWGMnNUqyvonttw==
X-Received: by 2002:a05:6402:42cb:b0:43a:5df2:bb5d with SMTP id i11-20020a05640242cb00b0043a5df2bb5dmr2292773edc.36.1657688400175;
        Tue, 12 Jul 2022 22:00:00 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p54a07b82.dip0.t-ipconnect.de. [84.160.123.130])
        by smtp.gmail.com with ESMTPSA id x17-20020aa7d6d1000000b0043a71775903sm7194112edr.39.2022.07.12.21.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jul 2022 21:59:59 -0700 (PDT)
Date: Wed, 13 Jul 2022 06:59:58 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 04/13] staging: vt6655: Rename byData to reg_value in two
 macros
Message-ID: <159014866cce40913d360a0692fb3c426d4cb840.1657657918.git.philipp.g.hortmann@gmail.com>
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
index b8f543aef716..16c18a1ed22e 100644
--- a/drivers/staging/vt6655/mac.h
+++ b/drivers/staging/vt6655/mac.h
@@ -539,9 +539,9 @@
 
 #define MACvRegBitsOn(iobase, reg_offset, bit_mask)			\
 do {									\
-	unsigned char byData;						\
-	byData = ioread8(iobase + reg_offset);				\
-	iowrite8(byData | (bit_mask), iobase + reg_offset);		\
+	unsigned char reg_value;					\
+	reg_value = ioread8(iobase + reg_offset);			\
+	iowrite8(reg_value | (bit_mask), iobase + reg_offset);		\
 } while (0)
 
 #define MACvWordRegBitsOn(iobase, reg_offset, bit_mask)		\
@@ -553,9 +553,9 @@ do {									\
 
 #define MACvRegBitsOff(iobase, reg_offset, bit_mask)			\
 do {									\
-	unsigned char byData;						\
-	byData = ioread8(iobase + reg_offset);				\
-	iowrite8(byData & ~(bit_mask), iobase + reg_offset);		\
+	unsigned char reg_value;					\
+	reg_value = ioread8(iobase + reg_offset);			\
+	iowrite8(reg_value & ~(bit_mask), iobase + reg_offset);		\
 } while (0)
 
 #define MACvWordRegBitsOff(iobase, reg_offset, bit_mask)		\
-- 
2.37.0

