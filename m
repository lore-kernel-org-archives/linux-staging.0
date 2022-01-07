Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88032C9D
	for <linux-staging@lists.linux.dev>; Fri,  7 Jan 2022 14:36:33 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id o6so22889370edc.4
        for <linux-staging@lists.linux.dev>; Fri, 07 Jan 2022 06:36:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gEWeNIEj4706/zj4lUnxZgjHllySGSpEuZM0Df7nbPA=;
        b=Jmjz7vbDBiU4Nxyx51tIBLQhABG+k3vXyOgOf9OcCu/ivEjqWGSfLaqekjcvfuSQac
         cX0mFcTsFxOuYfTCCtlfFansEe6Rjwx7InbgX/QVd3PW4+m1787hX5MSkAvjkLZhS92k
         qENB5Z/dxST2Y0cC9M4jf4/whFe9FRYfRDsQw887Aff3YFgDma2/BiHvDmFU3LD5yjZ+
         2rlljwEgEB5K3Vv+A2gMNZcuVOFd00ILklnp+fT8+qgImRi+gsHPnfN8/40xh2NGZBiF
         G093prkTEnFB4lxVEj9zDv74qAJP3Jblp5ajBQyLz7XHuGIOJpEUtRGm2d+Xy8kbRhFZ
         6IJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gEWeNIEj4706/zj4lUnxZgjHllySGSpEuZM0Df7nbPA=;
        b=UIKysMZ83UhBZjalYVseFuZePM9/a+8CNqwIcGCUSJjivV18a+rGmU4VUlvNVXZfxh
         6wiVckZJf/f8Nywbh5jpkVoJr5ABSyyt80b2X075c7+RxZWKqseW9zV/LJZsV3j7DAzV
         6tbxnHozASchy9Eu+CUSM2vPkGT7rcd5Okog6OMBIGCvrgLj7bvFIFCFf/xjcFYdTeXa
         z6OmttVeTsynOq+HPn1pb3KEK5OabwG2avokD4TinI/ECNKHZMODaRPQsdfNGExhS2yM
         tRTQGEsLiLZImgcWLEGNV32s2yHspMmKpm4+UGIRLp83u8ybj49vZ8ArxkSNftWRfEcq
         msCQ==
X-Gm-Message-State: AOAM5336bJHO86fCeb/tkEWPMIMU9ExsESs/jYTuUBtsrkjhF4h+TeRi
	o1Mq7iGBvk/fQCajCI8VuFs=
X-Google-Smtp-Source: ABdhPJyKQfaPj8uxkmWEE02vF5KjOMqrmzMyM5/JShuXC1Bg9/XtimQSi8Ul2SHvEuH2RgSHKcv5VA==
X-Received: by 2002:a17:906:c14e:: with SMTP id dp14mr586731ejc.138.1641566192390;
        Fri, 07 Jan 2022 06:36:32 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::51e2])
        by smtp.gmail.com with ESMTPSA id b4sm1445181ejl.206.2022.01.07.06.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jan 2022 06:36:32 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 2/3] staging: r8188eu: add spaces around & operator in IS_FW_HEADER_EXIST
Date: Fri,  7 Jan 2022 15:36:16 +0100
Message-Id: <20220107143617.2214-3-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220107143617.2214-1-straube.linux@gmail.com>
References: <20220107143617.2214-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add spaces around & operator in the macro IS_FW_HEADER_EXIST to
improve readability and follow kernel coding style.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/include/rtl8188e_hal.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/r8188eu/include/rtl8188e_hal.h b/drivers/staging/r8188eu/include/rtl8188e_hal.h
index d8892acad224..dad2aa473a1c 100644
--- a/drivers/staging/r8188eu/include/rtl8188e_hal.h
+++ b/drivers/staging/r8188eu/include/rtl8188e_hal.h
@@ -40,10 +40,10 @@
 #define MAX_PAGE_SIZE			4096	/*  @ page : 4k bytes */
 
 #define IS_FW_HEADER_EXIST(_fwhdr)				\
-	((le16_to_cpu(_fwhdr->Signature)&0xFFF0) == 0x92C0 ||	\
-	(le16_to_cpu(_fwhdr->Signature)&0xFFF0) == 0x88C0 ||	\
-	(le16_to_cpu(_fwhdr->Signature)&0xFFF0) == 0x2300 ||	\
-	(le16_to_cpu(_fwhdr->Signature)&0xFFF0) == 0x88E0)
+	((le16_to_cpu(_fwhdr->Signature) & 0xFFF0) == 0x92C0 ||	\
+	(le16_to_cpu(_fwhdr->Signature) & 0xFFF0) == 0x88C0 ||	\
+	(le16_to_cpu(_fwhdr->Signature) & 0xFFF0) == 0x2300 ||	\
+	(le16_to_cpu(_fwhdr->Signature) & 0xFFF0) == 0x88E0)
 
 /*  This structure must be careful with byte-ordering */
 
-- 
2.34.1

