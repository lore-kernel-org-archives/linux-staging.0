Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D882770
	for <linux-staging@lists.linux.dev>; Thu,  8 Apr 2021 20:38:43 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id a85so2271678pfa.0
        for <linux-staging@lists.linux.dev>; Thu, 08 Apr 2021 13:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=cXGFaEh6PCrLA6C4q9RtpEQVCq3uC/hVZI//O0eMp4g=;
        b=f/LlkGDqmvtigaRHyNZ4I7tRGUf+Iw+okC/qvDjTGAoDJNOMZ1b1czJ/FPYgmAeM7b
         iBcNNjQwepUk/36qBXAwS9Jz6FipKOh05oUYmHpV/wi5cWC7H2I0QgMTo14YbBb5WNbl
         IiciUhySQIOpGvhgCJr1kgY9wMC7CMIUH7MnCUdn0XJ4k7xB5Wn7CrhHcZQLr2shK3ya
         k8vEIjKaaA7ykKGrIznSYynY5XVKiY4Vf5ujhPmGzSSMu4nWhAEz7Xiu58kTVoIrcN9L
         g0cAV7xzmVezFd3MXtnIul78/qbk3infSQP8/fPDHFAfBBXEjFEcFBwU5VOFZlySTE6q
         CYEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cXGFaEh6PCrLA6C4q9RtpEQVCq3uC/hVZI//O0eMp4g=;
        b=aN2jgpzVDl3EUUhEcTIETT3ZWS2tiPSWN0iCVQqrPVSCFIJobd6EzU/82AV+dwHJVb
         p5Tb78TRxs45cUIty5R2bzVxDNp4DgADGO4+otn5V2+DoveSUMRdAwiDSMObcLnzJTlC
         usREWVLkTpfowoLxD+mMIfuTu3+4p0G5ULG/zFjCgzHHsEuEp5lrkL+I/8ut/66dlXKJ
         LoKWQeMYBOpaWlP9yY63XsX0JayhF6qhgt6OYDA3S5jz00Vr+OcPD6OYXPzK0wdBTzBV
         4Sd3GJeMFq2225caWYt0IgT4LZjZhjcjnfzVOpStbTsGNgi21PSpo8TESKkTbEsKAkGt
         N1rw==
X-Gm-Message-State: AOAM5332Oi/AfuWEMk6zmGVFdrWu9Zk3fLYFP0E1JMbLDGq1vhFHgYW2
	zdA66fSUXY2XF1RF5cBTiZ/3a0kHLLonvg==
X-Google-Smtp-Source: ABdhPJx3a8gSyQdgA6Zh4GvOvO+mkRCzmOGvUik8GwGc2Wy9UXkzaDW3AFUjjSM91mnutPA7Uceujg==
X-Received: by 2002:aa7:943b:0:b029:23f:8fa1:5f11 with SMTP id y27-20020aa7943b0000b029023f8fa15f11mr9091978pfo.67.1617914323385;
        Thu, 08 Apr 2021 13:38:43 -0700 (PDT)
Received: from kali ([152.57.11.236])
        by smtp.gmail.com with ESMTPSA id t10sm258894pjy.16.2021.04.08.13.38.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 13:38:43 -0700 (PDT)
Date: Fri, 9 Apr 2021 02:08:35 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: clabbe@baylibre.com, mchehab@kernel.org, gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
	mitali_s@me.iitr.ac.in
Subject: [PATCH 1/2] media: zoran: add spaces around '<<'
Message-ID: <8e8ac690d97478f7cbb9b91d46ef7a95e4444e5f.1617912177.git.mitaliborkar810@gmail.com>
References: <cover.1617912177.git.mitaliborkar810@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1617912177.git.mitaliborkar810@gmail.com>

Added spaces around '<<' operator to improve readability and meet linux
kernel coding style.
Reported by checkpatch

Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
---
 drivers/staging/media/zoran/zr36057.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/zoran/zr36057.h b/drivers/staging/media/zoran/zr36057.h
index 71b651add35a..a2a75fd9f535 100644
--- a/drivers/staging/media/zoran/zr36057.h
+++ b/drivers/staging/media/zoran/zr36057.h
@@ -30,13 +30,13 @@
 #define ZR36057_VFESPFR_HOR_DCM          14
 #define ZR36057_VFESPFR_VER_DCM          8
 #define ZR36057_VFESPFR_DISP_MODE        6
-#define ZR36057_VFESPFR_YUV422          (0<<3)
-#define ZR36057_VFESPFR_RGB888          (1<<3)
-#define ZR36057_VFESPFR_RGB565          (2<<3)
-#define ZR36057_VFESPFR_RGB555          (3<<3)
-#define ZR36057_VFESPFR_ERR_DIF          (1<<2)
-#define ZR36057_VFESPFR_PACK24          (1<<1)
-#define ZR36057_VFESPFR_LITTLE_ENDIAN    (1<<0)
+#define ZR36057_VFESPFR_YUV422          (0 << 3)
+#define ZR36057_VFESPFR_RGB888          (1 << 3)
+#define ZR36057_VFESPFR_RGB565          (2 << 3)
+#define ZR36057_VFESPFR_RGB555          (3 << 3)
+#define ZR36057_VFESPFR_ERR_DIF          (1 << 2)
+#define ZR36057_VFESPFR_PACK24          (1 << 1)
+#define ZR36057_VFESPFR_LITTLE_ENDIAN    (1 << 0)
 
 #define ZR36057_VDTR            0x00c	/* Video Display "Top" Register */
 
-- 
2.30.2

