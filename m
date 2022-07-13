Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4458915A9
	for <linux-staging@lists.linux.dev>; Wed, 13 Jul 2022 04:59:01 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id os14so17860263ejb.4
        for <linux-staging@lists.linux.dev>; Tue, 12 Jul 2022 21:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=HbcwIWPSC+fHCTXFOVsF8fnI4X1+WKG7wU3WnkyeDuU=;
        b=o9musvqbQVU5I5PDu4GLHZOb+zFGklvW+bWoAKcw+fPMYo5FLQJNn5Ik47CvKDSlvd
         Ab87o0eSbRP1qCbZc0jxELNlz0amZjQnHSlaYooRoiBPqciTTdUTHlHaQC6cMQOAAKJ9
         qQ/M7r40tsBENKUvqBVUlcxH7IWdvSoJ7rtWlfrK8Ut5QH0Wjcd37gLDaQaiaSgLCBdT
         2VV4UBYun6kRBmR/uNu2R+As7hcT7FtsgnAUHOELtI4QqvC9DoLBZ8uoJvJGLaR3VKos
         ELRXbCVSomzrfY2BdnUTxHEUuFJxY+Xn6og/LbzrwIffNI7UaDjCy0GhU67ODP68xHPN
         DWNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HbcwIWPSC+fHCTXFOVsF8fnI4X1+WKG7wU3WnkyeDuU=;
        b=N6SbfJhy/Wh3XKs8QeIZ1hoKV45IdCO1JPyQRCv30klVWR8QEv1W/HOYGoXDaWIxmj
         vUarVVpWqYG3vpwgl++i+ZIyKkHr0Ux0iFonadjqVoVvGqPazUDVs2RIEAPTaY+ALy7g
         HK8KclAEcv2MXFCOzpkeLN0z6965pqoHTIzKeiqxj5BgvwYaEW/qyR2CudrOo8V8E6/P
         Yf6O94+NE36H8X3q+xw67S0LZXvWahwjd9quxBBHGDRdaXJ+RPTjArd32p08pYNaV5rx
         cDDEM+SoCkOBq2L/j7bZXS8zlz/+/NC9muQQ7tFKBQdj9JBMeNX2M+4mCTxe5AmHJQHI
         OPmw==
X-Gm-Message-State: AJIora/s5tX3HQ+VKWXF1Fn9tMwCcO9buzHXI6rTRo/PJBs6l4yQXoRh
	NpKwkw0mNBS187zjAk4M7kee1d1RVAY=
X-Google-Smtp-Source: AGRyM1uKPuG2RuL009Jkm1vV9QPWuHjuZ9gD+QENU2/oRbaIlbDz1W0BLnCQmqlE336rNarCEbGnrg==
X-Received: by 2002:a17:907:1dca:b0:72b:3cb2:81f7 with SMTP id og10-20020a1709071dca00b0072b3cb281f7mr1443032ejc.567.1657688339683;
        Tue, 12 Jul 2022 21:58:59 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p54a07b82.dip0.t-ipconnect.de. [84.160.123.130])
        by smtp.gmail.com with ESMTPSA id h4-20020a50ed84000000b0043a85d7d15esm7151457edr.12.2022.07.12.21.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jul 2022 21:58:59 -0700 (PDT)
Date: Wed, 13 Jul 2022 06:58:56 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 01/13] staging: vt6655: Rename byRegOfs to reg_offset in four
 macros
Message-ID: <82f65d22ac8cd75b2c7790c13be3d0068968925b.1657657918.git.philipp.g.hortmann@gmail.com>
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

Fix name of a variable in four macros that use CamelCase which is not
accepted by checkpatch.pl

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/vt6655/mac.h | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/vt6655/mac.h b/drivers/staging/vt6655/mac.h
index 5c14a76ed799..b3803143673c 100644
--- a/drivers/staging/vt6655/mac.h
+++ b/drivers/staging/vt6655/mac.h
@@ -537,32 +537,32 @@
 
 /*---------------------  Export Macros ------------------------------*/
 
-#define MACvRegBitsOn(iobase, byRegOfs, byBits)			\
+#define MACvRegBitsOn(iobase, reg_offset, byBits)			\
 do {									\
 	unsigned char byData;						\
-	byData = ioread8(iobase + byRegOfs);				\
-	iowrite8(byData | (byBits), iobase + byRegOfs);			\
+	byData = ioread8(iobase + reg_offset);				\
+	iowrite8(byData | (byBits), iobase + reg_offset);		\
 } while (0)
 
-#define MACvWordRegBitsOn(iobase, byRegOfs, wBits)			\
+#define MACvWordRegBitsOn(iobase, reg_offset, wBits)			\
 do {									\
 	unsigned short wData;						\
-	wData = ioread16(iobase + byRegOfs);				\
-	iowrite16(wData | (wBits), iobase + byRegOfs);			\
+	wData = ioread16(iobase + reg_offset);				\
+	iowrite16(wData | (wBits), iobase + reg_offset);		\
 } while (0)
 
-#define MACvRegBitsOff(iobase, byRegOfs, byBits)			\
+#define MACvRegBitsOff(iobase, reg_offset, byBits)			\
 do {									\
 	unsigned char byData;						\
-	byData = ioread8(iobase + byRegOfs);				\
-	iowrite8(byData & ~(byBits), iobase + byRegOfs);		\
+	byData = ioread8(iobase + reg_offset);				\
+	iowrite8(byData & ~(byBits), iobase + reg_offset);		\
 } while (0)
 
-#define MACvWordRegBitsOff(iobase, byRegOfs, wBits)			\
+#define MACvWordRegBitsOff(iobase, reg_offset, wBits)			\
 do {									\
 	unsigned short wData;						\
-	wData = ioread16(iobase + byRegOfs);				\
-	iowrite16(wData & ~(wBits), iobase + byRegOfs);			\
+	wData = ioread16(iobase + reg_offset);				\
+	iowrite16(wData & ~(wBits), iobase + reg_offset);		\
 } while (0)
 
 #define MACvReceive0(iobase)						\
-- 
2.37.0

