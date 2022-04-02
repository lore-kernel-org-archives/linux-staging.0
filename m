Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F31F7A
	for <linux-staging@lists.linux.dev>; Sat,  2 Apr 2022 07:29:24 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id bh17so10116738ejb.8
        for <linux-staging@lists.linux.dev>; Sat, 02 Apr 2022 00:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=HVq5l4DEGGu5eDsQOm9+fxU3g/O+ru6NFRfeksiXUpY=;
        b=nMzCegp4ex+gSCJ5748N8CSkptydtg96MXwKP+c5MwrPRbQ/rbCwPcMc0038+NfXKG
         3pGDAqepOL5TRAIiHlkUKAWv1dvfKxdUDUOye2HGiRY9h0VfGfBuIK3Gf8T8BSLu00bQ
         u4bX0tJi7NXcI2n8Vp+ZPgqdXBu/sEy7uxIO229lHpNbEEe1ceWm6Zh5zTqyAtOkbqO1
         AtOC3K4DQyZzx5384FuQ2wjRncZ08phZCyoHAsHya4DH45VnryNweSA//71Ykz4+RBJE
         S29xG9j9qIu8aUHu6ju6qpOdIQWKnxmU4isNvqH8+updFhlH/ObBJJItd80Fh6TOsBps
         NSmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HVq5l4DEGGu5eDsQOm9+fxU3g/O+ru6NFRfeksiXUpY=;
        b=GtOjJQO6mVvz9W1eCpwFgoa50/1Kk1UCKaQWY1HsdMYYMwhtCylVKz1mZMxNEK/TNp
         N6cylAVC/WcYSZkV2LmptC5hosNPoYoWRzaMb6G9McMtuZiGofXcRyG8KXVdDkzyZEbs
         0+P8NPrX7msBsNtuE3GDLhezm8v+XkxBR75x1Ueg3crDsXx55CJiFOSM/Rrh0wvxxqcU
         zGAw/ce0wewxQ2MqnA8e8sTfQkCZJDtJMSpX5jGM0T3QWGYuInLZUYEyJkBIDB76DtZ/
         r4++2qn7b+0CKPrTQQZn5hVG7lj/fRjui1vPTxxfcsS8lb73FFwwaeM3un/JhlW975bO
         yTHA==
X-Gm-Message-State: AOAM531NLnDjJanjpx5UdUYU7RpO2mGa3T6FXtaX1t2wa5/s0fXvLQi6
	mcZ4wozUYFMn/PLHoiXRG2A=
X-Google-Smtp-Source: ABdhPJyaelKkWpK/klTy7DyTRaqYPKpyimKx2n2JdfVCIaLph+RadQ5xtzftJJ43D8M9AqYZNRHdQQ==
X-Received: by 2002:a17:906:d789:b0:6e0:bdd5:a884 with SMTP id pj9-20020a170906d78900b006e0bdd5a884mr2861344ejb.201.1648884562487;
        Sat, 02 Apr 2022 00:29:22 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p54a074e9.dip0.t-ipconnect.de. [84.160.116.233])
        by smtp.gmail.com with ESMTPSA id y27-20020a170906519b00b006dfaf4466ebsm1822635ejk.116.2022.04.02.00.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Apr 2022 00:29:22 -0700 (PDT)
Date: Sat, 2 Apr 2022 09:29:20 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 1/7] staging: vt6655: Remove unused macros with do while(0)
Message-ID: <8e1ff43ff0bd636d0a64c977291bb06eee3a1ab6.1648882847.git.philipp.g.hortmann@gmail.com>
References: <cover.1648882847.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1648882847.git.philipp.g.hortmann@gmail.com>

Remove unused macros with do-while(0) loop in mac.h as
they are not accepted by checkpatch.pl

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/vt6655/mac.h | 85 ------------------------------------
 1 file changed, 85 deletions(-)

diff --git a/drivers/staging/vt6655/mac.h b/drivers/staging/vt6655/mac.h
index 550dc4da80a9..c8bc4b6d2938 100644
--- a/drivers/staging/vt6655/mac.h
+++ b/drivers/staging/vt6655/mac.h
@@ -552,21 +552,6 @@ do {									\
 	VNSvOutPortW(iobase + byRegOfs, wData | (wBits));		\
 } while (0)
 
-#define MACvDWordRegBitsOn(iobase, byRegOfs, dwBits)			\
-do {									\
-	unsigned long dwData;						\
-	VNSvInPortD(iobase + byRegOfs, &dwData);			\
-	VNSvOutPortD(iobase + byRegOfs, dwData | (dwBits));		\
-} while (0)
-
-#define MACvRegBitsOnEx(iobase, byRegOfs, byMask, byBits)		\
-do {									\
-	unsigned char byData;						\
-	VNSvInPortB(iobase + byRegOfs, &byData);			\
-	byData &= byMask;						\
-	VNSvOutPortB(iobase + byRegOfs, byData | (byBits));		\
-} while (0)
-
 #define MACvRegBitsOff(iobase, byRegOfs, byBits)			\
 do {									\
 	unsigned char byData;						\
@@ -581,13 +566,6 @@ do {									\
 	VNSvOutPortW(iobase + byRegOfs, wData & ~(wBits));		\
 } while (0)
 
-#define MACvDWordRegBitsOff(iobase, byRegOfs, dwBits)			\
-do {									\
-	unsigned long dwData;						\
-	VNSvInPortD(iobase + byRegOfs, &dwData);			\
-	VNSvOutPortD(iobase + byRegOfs, dwData & ~(dwBits));		\
-} while (0)
-
 #define MACvGetCurrRx0DescAddr(iobase, pdwCurrDescAddr)	\
 	VNSvInPortD(iobase + MAC_REG_RXDMAPTR0,		\
 		    (unsigned long *)pdwCurrDescAddr)
@@ -622,24 +600,6 @@ do {									\
 	VNSvOutPortW(iobase + MAC_REG_BCNDMACTL + 2,		\
 		     wCurrBCNLength)
 
-#define MACvReadBSSIDAddress(iobase, pbyEtherAddr)		\
-do {								\
-	VNSvOutPortB(iobase + MAC_REG_PAGE1SEL, 1);		\
-	VNSvInPortB(iobase + MAC_REG_BSSID0,			\
-		    (unsigned char *)pbyEtherAddr);		\
-	VNSvInPortB(iobase + MAC_REG_BSSID0 + 1,		\
-		    pbyEtherAddr + 1);				\
-	VNSvInPortB(iobase + MAC_REG_BSSID0 + 2,		\
-		    pbyEtherAddr + 2);				\
-	VNSvInPortB(iobase + MAC_REG_BSSID0 + 3,		\
-		    pbyEtherAddr + 3);				\
-	VNSvInPortB(iobase + MAC_REG_BSSID0 + 4,		\
-		    pbyEtherAddr + 4);				\
-	VNSvInPortB(iobase + MAC_REG_BSSID0 + 5,		\
-		    pbyEtherAddr + 5);				\
-	VNSvOutPortB(iobase + MAC_REG_PAGE1SEL, 0);		\
-} while (0)
-
 #define MACvWriteBSSIDAddress(iobase, pbyEtherAddr)		\
 do {								\
 	VNSvOutPortB(iobase + MAC_REG_PAGE1SEL, 1);		\
@@ -676,24 +636,6 @@ do {								\
 	VNSvOutPortB(iobase + MAC_REG_PAGE1SEL, 0);		\
 } while (0)
 
-#define MACvWriteEtherAddress(iobase, pbyEtherAddr)		\
-do {								\
-	VNSvOutPortB(iobase + MAC_REG_PAGE1SEL, 1);		\
-	VNSvOutPortB(iobase + MAC_REG_PAR0,			\
-		     *pbyEtherAddr);				\
-	VNSvOutPortB(iobase + MAC_REG_PAR0 + 1,		\
-		     *(pbyEtherAddr + 1));			\
-	VNSvOutPortB(iobase + MAC_REG_PAR0 + 2,		\
-		     *(pbyEtherAddr + 2));			\
-	VNSvOutPortB(iobase + MAC_REG_PAR0 + 3,		\
-		     *(pbyEtherAddr + 3));			\
-	VNSvOutPortB(iobase + MAC_REG_PAR0 + 4,		\
-		     *(pbyEtherAddr + 4));			\
-	VNSvOutPortB(iobase + MAC_REG_PAR0 + 5,		\
-		     *(pbyEtherAddr + 5));			\
-	VNSvOutPortB(iobase + MAC_REG_PAGE1SEL, 0);		\
-} while (0)
-
 #define MACvClearISR(iobase)						\
 	VNSvOutPortD(iobase + MAC_REG_ISR, IMR_MASK_VALUE)
 
@@ -759,26 +701,6 @@ do {									\
 		VNSvOutPortD(iobase + MAC_REG_AC0DMACTL, DMACTL_RUN); \
 } while (0)
 
-#define MACvTransmitSYNC(iobase)					\
-do {									\
-	unsigned long dwData;						\
-	VNSvInPortD(iobase + MAC_REG_SYNCDMACTL, &dwData);		\
-	if (dwData & DMACTL_RUN)					\
-		VNSvOutPortD(iobase + MAC_REG_SYNCDMACTL, DMACTL_WAKE); \
-	else								\
-		VNSvOutPortD(iobase + MAC_REG_SYNCDMACTL, DMACTL_RUN); \
-} while (0)
-
-#define MACvTransmitATIM(iobase)					\
-do {									\
-	unsigned long dwData;						\
-	VNSvInPortD(iobase + MAC_REG_ATIMDMACTL, &dwData);		\
-	if (dwData & DMACTL_RUN)					\
-		VNSvOutPortD(iobase + MAC_REG_ATIMDMACTL, DMACTL_WAKE); \
-	else								\
-		VNSvOutPortD(iobase + MAC_REG_ATIMDMACTL, DMACTL_RUN); \
-} while (0)
-
 #define MACvTransmitBCN(iobase)					\
 	VNSvOutPortB(iobase + MAC_REG_BCNDMACTL, BEACON_READY)
 
@@ -861,13 +783,6 @@ do {									\
 #define MACvWriteATIMW(iobase, wCounter)				\
 	VNSvOutPortW(iobase + MAC_REG_AIDATIM, wCounter)
 
-#define MACvWriteCRC16_128(iobase, byRegOfs, wCRC)		\
-do {								\
-	VNSvOutPortB(iobase + MAC_REG_PAGE1SEL, 1);		\
-	VNSvOutPortW(iobase + byRegOfs, wCRC);		\
-	VNSvOutPortB(iobase + MAC_REG_PAGE1SEL, 0);		\
-} while (0)
-
 #define MACvGPIOIn(iobase, pbyValue)					\
 	VNSvInPortB(iobase + MAC_REG_GPIOCTL1, pbyValue)
 
-- 
2.25.1

