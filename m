Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40ADE17F5
	for <linux-staging@lists.linux.dev>; Sun, 24 Apr 2022 07:44:10 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id s21so1985383wrb.8
        for <linux-staging@lists.linux.dev>; Sun, 24 Apr 2022 00:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=fn9CcP5Vh0+wAX3G1q2UYNdRxUFXZma/d6F4xQnG0PY=;
        b=OtLXn6e3qmo06a2AS4zWNCKvb/VLOI55uCPO2O98y+O2XnloUzd5+55kqaJwql0ncp
         juv8dm9kGGZUfzTVCgbt/r1r5irth0avs4LIGzJmpaKGyACjgchn4eUDkWbD55pxQwZj
         YeDGXcU9vVYApe0KHnFzaWxHV0vL0bWLZL0+a2bJGabVxdhSaHnGZ6D1zY/DNkpvcTSA
         aH4amop+RZlmcDhUx2AxK3kly9DFMCQ2PLySXPVvUqgeO3VuPxf17aQgipxtmhLvQG3A
         yBUk3Gqmr3ddUx9NAG/c8zsdhiIVUB5B34ddPYlx17MgJVzVTSRfgGeXyz6XVeUCBDhC
         MuAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fn9CcP5Vh0+wAX3G1q2UYNdRxUFXZma/d6F4xQnG0PY=;
        b=gdNzp6Z21LCLnhdMNbQgm5aTg8hh7SiEE5DbYfJngJqwZRnP7D0EVNVZJxwFbm8BxG
         RxPM/wlPv6pTO7EtZIfrnlI8utAWLEISxmKo6VBbrGPMy2KpsVB5Dg/z24pgW3s6WnBW
         vsjUl9y/w50RsF/lo6Sjc23LWfJiiiXEUSt8QAc96dUuR5QPtBEZ+AejgoD40NnI9WUl
         RuXWMFtq4mMktUNZXQ+kwUUrMZRnwns3Si80/W4hMnfFU8CfdihEd3XP4Z1RkzVH23Rp
         dnf8PlesMBvK3KH6hONRNO0kLV+y6RvbAXQRZALeFRCJ7JFIqKcfVsBcbnS54VCySkuL
         d2BQ==
X-Gm-Message-State: AOAM531+/FWSEjuqIHHEsbiHcZq7oPVwqdKLFDqB68UZipzYJPeTV43m
	C6prwoW0g5kzt+omyRmO/U4=
X-Google-Smtp-Source: ABdhPJz1FirqZYMc88NVRvv69nBdmxomOWK+5FiNQlDznykAa9AlPrkJifoDWUJKiNk6TCST/gBLig==
X-Received: by 2002:a05:6000:18a8:b0:20a:8a52:5c7e with SMTP id b8-20020a05600018a800b0020a8a525c7emr10114338wri.355.1650786248643;
        Sun, 24 Apr 2022 00:44:08 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p54a074e9.dip0.t-ipconnect.de. [84.160.116.233])
        by smtp.gmail.com with ESMTPSA id w8-20020a1cf608000000b0038c8fdc93d6sm8114288wmc.28.2022.04.24.00.44.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Apr 2022 00:44:08 -0700 (PDT)
Date: Sun, 24 Apr 2022 09:44:05 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] staging: vt6655: Replace VNSvInPortW with ioread16
Message-ID: <2d55e245cc530ffafe53384df03691d1b29b495c.1650784817.git.philipp.g.hortmann@gmail.com>
References: <cover.1650784817.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1650784817.git.philipp.g.hortmann@gmail.com>

Replace macro VNSvInPortW with ioread16.
The name of macro and the arguments use CamelCase which
is not accepted by checkpatch.pl

Since there are more than one checkpatch issue per line,
more steps are rquired to fix.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
V1 -> V2: This patch was 5/7 and is now 4/6
V2 -> V3: Changed from
          "Rename macros VNSvInPortB,W,D with CamelCase ..." to
          Replace VNSvInPortW with ioread16
          This patch was 4/6 and is now 2/7
V3 -> V4: added Tab so that \ is inline with above and below lines
---
 drivers/staging/vt6655/mac.h | 4 ++--
 drivers/staging/vt6655/upc.h | 3 ---
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/vt6655/mac.h b/drivers/staging/vt6655/mac.h
index 7970a42ee6e6..4c6739862188 100644
--- a/drivers/staging/vt6655/mac.h
+++ b/drivers/staging/vt6655/mac.h
@@ -547,7 +547,7 @@ do {									\
 #define MACvWordRegBitsOn(iobase, byRegOfs, wBits)			\
 do {									\
 	unsigned short wData;						\
-	VNSvInPortW(iobase + byRegOfs, &wData);			\
+	wData = ioread16(iobase + byRegOfs);				\
 	VNSvOutPortW(iobase + byRegOfs, wData | (wBits));		\
 } while (0)
 
@@ -561,7 +561,7 @@ do {									\
 #define MACvWordRegBitsOff(iobase, byRegOfs, wBits)			\
 do {									\
 	unsigned short wData;						\
-	VNSvInPortW(iobase + byRegOfs, &wData);			\
+	wData = ioread16(iobase + byRegOfs);				\
 	VNSvOutPortW(iobase + byRegOfs, wData & ~(wBits));		\
 } while (0)
 
diff --git a/drivers/staging/vt6655/upc.h b/drivers/staging/vt6655/upc.h
index d2c1528c8e1b..4d09cf18ebe0 100644
--- a/drivers/staging/vt6655/upc.h
+++ b/drivers/staging/vt6655/upc.h
@@ -20,9 +20,6 @@
 
 /* For memory mapped IO */
 
-#define VNSvInPortW(dwIOAddress, pwData) \
-	(*(pwData) = ioread16(dwIOAddress))
-
 #define VNSvInPortD(dwIOAddress, pdwData) \
 	(*(pdwData) = ioread32(dwIOAddress))
 
-- 
2.25.1

