Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92553FC1
	for <linux-staging@lists.linux.dev>; Tue, 24 Aug 2021 07:27:24 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id p38so43517174lfa.0
        for <linux-staging@lists.linux.dev>; Tue, 24 Aug 2021 00:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eP/fzaCJf83R5w9CDsCe7nt2TiaRQKPHnE9dwKIQjLo=;
        b=TaY/dGFNh66ahf0u939KNhrEWvSqy+kTfCR5FtPemYu5CsIDh9EsyvyDMirGEd+Feh
         A9jGi5paDcg9YC8WGRbKhJTfMkMSy4knUPer6hNjegoMNBzoLs0OgadeWmj8b1s+tTNp
         kr26B4XpXhhbf0xajGkKVyW0qJkgzuh1GQyN61NqPcfHlq+rMMPN1i1zgcYlLd+EfgbQ
         nQWQA7+XCYLOgLQjVSKkVS37YXNvEHNnffPyJf8bsuap7wFKNFGpsCYmUglD2Sp+SS/5
         oc3pEGCovIFnIZHwcFW13VP9F4ADKxe3k11lW5gOA4X62pHpT9N2I1jRO3Jdgff1wfgo
         o+9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eP/fzaCJf83R5w9CDsCe7nt2TiaRQKPHnE9dwKIQjLo=;
        b=I/qTIS1BtmjFaI+PO8f91uQMcvy2w3s1Dz4R6erDwm489MWHtAkBoox5fDJPJzphiB
         dRbcxEiS1ypG5Xlr4eNmubKYTN9zd9Njfi7duHXjyo/kztz8iHsbm6uEA4v+CyzMEzYA
         GJnBJul4clAoS/bE8CIIdCg/EOXz3Pb0cKxYiiSlzLVLlEEjuO/nn+84Z+o4VCKS198a
         Cxt+n7J8Bc0JgsiAcuSRYR38F7kmKGwh5uKfYD+sdGLySkjm7C0TRkxGTl8BIBMCTKIb
         gFi8Ju5GlwbF82TSo6hyXSqHpqXqDqudrOPtZodVFfWHabUgIFVBKuKv3qkpEpMeJX45
         oJLg==
X-Gm-Message-State: AOAM5336yiq/5a3V9YeaKbIH7HarMz6k+pBLNLijjaeohGBPp3ViSh7V
	hy+YzGR4YCDftF933x9oOj4=
X-Google-Smtp-Source: ABdhPJwLQ68d1LIl+AbK49RoUxCf2VKbXG/iTsjl4UsgYEvDwhhLIlV1N2RMd+Hw+LogsZ3I5rtwjg==
X-Received: by 2002:a05:6512:ac3:: with SMTP id n3mr27759041lfu.583.1629790043067;
        Tue, 24 Aug 2021 00:27:23 -0700 (PDT)
Received: from localhost.localdomain ([46.235.66.127])
        by smtp.gmail.com with ESMTPSA id a22sm1672127lfl.259.2021.08.24.00.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Aug 2021 00:27:22 -0700 (PDT)
From: Pavel Skripkin <paskripkin@gmail.com>
To: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	gregkh@linuxfoundation.org,
	straube.linux@gmail.com,
	fmdefrancesco@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Pavel Skripkin <paskripkin@gmail.com>
Subject: [PATCH v3 2/6] staging: r8188eu: add helper macro for printing registers
Date: Tue, 24 Aug 2021 10:27:20 +0300
Message-Id: <84e388b0eaaf3c56f575216b0571318ed799a4d2.1629789580.git.paskripkin@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1629789580.git.paskripkin@gmail.com>
References: <cover.1629789580.git.paskripkin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are a lof of places, where DBG_88E() is used to print register
value. Since following patches change _rtw_read*() family
prototypes, we can wrap printing registers into useful macro to avoid
open-coding error checking like this:

	u32 tmp;
	if (!rtw_read(&tmp))
		DBG("reg = %d\n", tmp);

So, added DBG_88E_REG{8,16,32} macros for printing register values.

Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
---
 drivers/staging/r8188eu/include/rtw_debug.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/staging/r8188eu/include/rtw_debug.h b/drivers/staging/r8188eu/include/rtw_debug.h
index 3c3bf2a4f30e..059647b9cd3a 100644
--- a/drivers/staging/r8188eu/include/rtw_debug.h
+++ b/drivers/staging/r8188eu/include/rtw_debug.h
@@ -72,6 +72,19 @@ extern u32 GlobalDebugLevel;
 			pr_info(DRIVER_PREFIX __VA_ARGS__);			\
 	} while (0)
 
+#define __DBG_88E_REG(fmt, adap, reg, size)				\
+	do {								\
+		u##size __tmp__;					\
+		if (rtw_read##size((adap), (reg), &__tmp__))		\
+			break;						\
+		if (_drv_err_ <= GlobalDebugLevel)			\
+			pr_info(DRIVER_PREFIX fmt, __tmp__);		\
+	} while (0)
+
+#define DBG_88E_REG8(fmt, adap, reg)	__DBG_88E_REG(fmt, adap, reg, 8)
+#define DBG_88E_REG16(fmt, adap, reg)	__DBG_88E_REG(fmt, adap, reg, 16)
+#define DBG_88E_REG32(fmt, adap, reg)	__DBG_88E_REG(fmt, adap, reg, 32)
+
 int proc_get_drv_version(char *page, char **start,
 			 off_t offset, int count,
 			 int *eof, void *data);
-- 
2.32.0

