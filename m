Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F5115A9
	for <linux-staging@lists.linux.dev>; Wed, 13 Jul 2022 04:59:42 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id r6so12622281edd.7
        for <linux-staging@lists.linux.dev>; Tue, 12 Jul 2022 21:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=QbR77KaYU0b8CrpQnqAfg4nKTl226cIZ6lhPDiInDxI=;
        b=k5LPmNUzmeiJ8k5kn7gY+1x2BNP/YPF8Hk0Tqiwp50RoSEMbIYmfAbzPYYtsAIh2Sq
         Fny0cpUJVkafQysIxsceNQw/B3g+i0KjrDXhY1zKiuMuvAyOl9A85jqx4TVYFZWJSH+n
         pPU2zL4BVblAWaE6m4sPBjVmYUNYPI/iwWHoRogEMIOrmg+Oyz5nei3HcH10eusrGNug
         FSoMsQGYaYOmK1Oyv12rH8CkE1aVOBiA/lOfoeKfrps23MrtHMCo2DVhzDLXDIKpYez7
         +uVu4T/5LqSNpDmYhor6keD7Bps+JkP7dYVrwgRNDd4mzxgbYFDoXZ9S0GlGkKzN3Ja1
         sPkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QbR77KaYU0b8CrpQnqAfg4nKTl226cIZ6lhPDiInDxI=;
        b=ndAM4iiHLWJWXn6lLnHIFkamDzVOhn15ytnwXDYdjStMKnGTl0xzCZnRc/PsKit1cF
         TblBXg8A48QnrfLUbIqg1R5ivqyH/nSxh5cCnExadQDPEWNTFpWQX0NBpVjZW+H790v6
         GkCbHymF2LwFiXaV6A91X8BhDnBj/meXWS+YKWpigFgTAfT7cit9iuIUnO9X7B7lsAeJ
         QMB7umNB202kOTPqQ1+Oc1TP6ItIaqNFtSc1MVH5FW2R+5FLLj92GJDuS+DzKnkG7Hmv
         28FrPkQMPmQpvnwyyzPhG+xqyhlSUyQRc7dwwISfZDDQBRMu+rLBuf8vvpKcL37/mFnf
         bkdw==
X-Gm-Message-State: AJIora9tyIpGquCY7DYL79RHTm1PUhk2Gd5s49gmMnEzGJq01MZGeRDj
	OIgOiIuY2iL2C+h6+FsMP5g=
X-Google-Smtp-Source: AGRyM1vPMh/lKBc+3VZvDGn4Tto6gf+E77gQ31z5PtD81c0cRx3reRfRsckERlTIDcf8sbhXOprrgg==
X-Received: by 2002:a05:6402:16:b0:43a:f435:5d07 with SMTP id d22-20020a056402001600b0043af4355d07mr2290455edu.420.1657688381130;
        Tue, 12 Jul 2022 21:59:41 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p54a07b82.dip0.t-ipconnect.de. [84.160.123.130])
        by smtp.gmail.com with ESMTPSA id w12-20020a05640234cc00b0043ac761db43sm6187706edc.55.2022.07.12.21.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jul 2022 21:59:40 -0700 (PDT)
Date: Wed, 13 Jul 2022 06:59:38 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 03/13] staging: vt6655: Rename wBits to bit_mask in two macros
Message-ID: <8929407dc7355df515b7f9fdd195b45ff44f6b98.1657657918.git.philipp.g.hortmann@gmail.com>
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
index 3037502c1883..b8f543aef716 100644
--- a/drivers/staging/vt6655/mac.h
+++ b/drivers/staging/vt6655/mac.h
@@ -544,11 +544,11 @@ do {									\
 	iowrite8(byData | (bit_mask), iobase + reg_offset);		\
 } while (0)
 
-#define MACvWordRegBitsOn(iobase, reg_offset, wBits)			\
+#define MACvWordRegBitsOn(iobase, reg_offset, bit_mask)		\
 do {									\
 	unsigned short wData;						\
 	wData = ioread16(iobase + reg_offset);				\
-	iowrite16(wData | (wBits), iobase + reg_offset);		\
+	iowrite16(wData | (bit_mask), iobase + reg_offset);		\
 } while (0)
 
 #define MACvRegBitsOff(iobase, reg_offset, bit_mask)			\
@@ -558,11 +558,11 @@ do {									\
 	iowrite8(byData & ~(bit_mask), iobase + reg_offset);		\
 } while (0)
 
-#define MACvWordRegBitsOff(iobase, reg_offset, wBits)			\
+#define MACvWordRegBitsOff(iobase, reg_offset, bit_mask)		\
 do {									\
 	unsigned short wData;						\
 	wData = ioread16(iobase + reg_offset);				\
-	iowrite16(wData & ~(wBits), iobase + reg_offset);		\
+	iowrite16(wData & ~(bit_mask), iobase + reg_offset);		\
 } while (0)
 
 #define MACvReceive0(iobase)						\
-- 
2.37.0

