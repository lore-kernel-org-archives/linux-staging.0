Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7286D00
	for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 14:20:53 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id m3so9801038edv.5
        for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 07:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UkQtWRgOp5+rpWKYZKP/ej9vGIRx+ajVCa42c5pIqgY=;
        b=ZHklPETEvXI1Degrc/Q1ml9pwO+qabqvb28Lcx4xGcVNLFzSEyTUihGYIb1kVYh1uW
         UVtVRoVMIZfNIoqyk59z8fuQDIcD1IDuMzHQ/qhzUBhXWxSa8YIOAADMtiAPbZeHlQjK
         5ugFxvxVfr3+tq40WGbF2LxVsCgtHXYBuIhf9MVwP/4vswY7doBercN2yz6pZVqdk8Ej
         xjzcaIE3ukd/+iwLlMU3ND75gIQIJ6tYftvRo7A50MqSA2cCgvTMV/KeqGdRQO44vm6k
         JKQapx4VVqyFBd464hYIlvg9VuGeZQVZZWPpwS5Te+88BymVbGyWvvNmzz65m1X0yq/r
         ZbIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UkQtWRgOp5+rpWKYZKP/ej9vGIRx+ajVCa42c5pIqgY=;
        b=dw2ey86XCCI5N0VJK7dzLwUdknedd3CX9Idu1u1qUx4Y1cZDKvl0nv4AEJp8A8Br6v
         /nQx2TSTnxF8Mvevlrdjo6cbci55lusKtmK0V/CJIqfx4RtFGnfGH0qA6o1/6eOOvd6x
         Z/CADhHD4HkRMCvnBQebiOtFASExm81nih+iFjn5MvxQIZ1sayEV49imT51vIj5ouuTf
         xp7lXMGaDqweJ2ZkG5mA/fZR4HB3FfQGpcur7qWtLrgLVIFkbVc96fBLid0dr6i5ZPmI
         Z4QtlJvEjGCCEOCkFmZwmgxHMkX+PSLZOubhaOiidh9sfYzhc6TEf3gJ4sf4NPaX5Tmo
         QC0w==
X-Gm-Message-State: AOAM5315Piv4teabGKBMeBHttQ39krTmpCy+uflfMr8RIEOOGlJavLs3
	Rtjt2xE0DqYGQiJyA3czwlI=
X-Google-Smtp-Source: ABdhPJwEApXEfATwu6xQYj366aMM8/dP8gzUZqS2lYR0uEqz3+wun+zSQ4cOtwbtj9kL5MHFrvRtHw==
X-Received: by 2002:aa7:dac5:: with SMTP id x5mr13172759eds.286.1618064451929;
        Sat, 10 Apr 2021 07:20:51 -0700 (PDT)
Received: from agape ([5.171.81.28])
        by smtp.gmail.com with ESMTPSA id c16sm2755011ejx.81.2021.04.10.07.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Apr 2021 07:20:51 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 07/25] staging: rtl8723bs: remove commented out DEBUG_RTL871X definition
Date: Sat, 10 Apr 2021 16:20:20 +0200
Message-Id: <9d04ab2b645e242e35d31abbb1a301e2ad8c4401.1618064274.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1618064274.git.fabioaiuto83@gmail.com>
References: <cover.1618064274.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove commented out DEBUG_RTL871X definition

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/autoconf.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/include/autoconf.h b/drivers/staging/rtl8723bs/include/autoconf.h
index 996198750814..222297a937ab 100644
--- a/drivers/staging/rtl8723bs/include/autoconf.h
+++ b/drivers/staging/rtl8723bs/include/autoconf.h
@@ -48,7 +48,6 @@
 
 #ifdef DEBUG
 #define DBG	1	/*  for ODM & BTCOEX debug */
-/*#define DEBUG_RTL871X */
 #else /*  !DEBUG */
 #define DBG	0	/*  for ODM & BTCOEX debug */
 #endif /*  !DEBUG */
-- 
2.20.1

