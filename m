Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E964D2F84
	for <linux-staging@lists.linux.dev>; Sun, 18 Apr 2021 14:43:31 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id u15so7823656plf.10
        for <linux-staging@lists.linux.dev>; Sun, 18 Apr 2021 07:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=8gZJU83R+0zpO/uK+jvzr7GcvwjV1r6DfaVYHOO6r/k=;
        b=V0PZ3ziM40TqnfkHywTsYlHAB2lP6vByhxyRPMxyPb0PEF8pmn7/IfkAAKO7aGC6uV
         jUK2MXSYQiEFvfj9ntoavjaIuBE9qUNBMHX44kXRJVZHCUqBynfzFDGYtOy6IoGsSpud
         HDFB33egb+KorMWtTdyw8On5nOIH52J3GfujMrZj61ZEDJtZHRq1ZS5rZkG6sP97qkBz
         mjwGiluiSASKscyjNj+yHTgU8D65XHzneaXDKXsQeKpjn8e9p6WxO3mwhHnlrv3yoFN7
         zvkGkeXv6bIZGAcI10M0dkcR2FBLeDz70CL6Cy4+CQmT1HX1ZBTh6dy1BqBN5F0n/TSS
         cZHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=8gZJU83R+0zpO/uK+jvzr7GcvwjV1r6DfaVYHOO6r/k=;
        b=f+Ut3XnGh/w+vFIrynovzUp8bGdGkSWbEs3Uh+agjkhogh/NhB1KPsAqGls2vbr2eG
         +ZftXKNJsHcBA9XXcOsTBmqCOy4Yeg27l2mhfJ3dB2ze4zOqw6CvAX4zULxhGFvJp+ov
         JYTzy1k6sVor4gTeZ/qfMA4PMY95gIMChILge0k7lI1V3m5NJvFl1o5R/t4XVpu1qeIX
         9qwI5Z7nIemT6vDSkzvjAzJj9uPSPEOgtusroCBwPvsbMJBbkIQL6OgiUBwvudhCJyqq
         mzYnifmmuTUloeSz3DWE4QXMJdeG7C+APjUftp5P0UCHC/Grdn/3/20MAac30nwIWcZQ
         rT5w==
X-Gm-Message-State: AOAM5311uUjYQ4IHE2zIjuSiXtqshEHGxCnwmglVxyfFfs5En0tWMQ1v
	O0sJxBLAqD5+Qyn/WfHPZoY=
X-Google-Smtp-Source: ABdhPJwcRiX6atPSTp6oK46nmHcq6XLahpMm3uwJNEtpm6saTPPsKxtzNEF4T4Ki7ZZsbE8G863OVw==
X-Received: by 2002:a17:90a:fe11:: with SMTP id ck17mr19996518pjb.49.1618757011349;
        Sun, 18 Apr 2021 07:43:31 -0700 (PDT)
Received: from user ([2001:4490:4409:d07c:b4ac:39e7:e05c:f39b])
        by smtp.gmail.com with ESMTPSA id t19sm10495667pfg.38.2021.04.18.07.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Apr 2021 07:43:30 -0700 (PDT)
From: Saurav Girepunje <saurav.girepunje@gmail.com>
X-Google-Original-From: Saurav Girepunje <saurav.girepunje@google.com>
Date: Sun, 18 Apr 2021 20:13:23 +0530
To: mchehab@kernel.org, sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org, saurav.girepunje@google.com,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: saurav.girepunje@hotmail.com
Subject: [PATCH] media: atomisp: pci: remove unneeded variable 'err'
Message-ID: <20210418144323.GA54920@user>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fix the following coccicheck warning:

drivers/staging/media/atomisp/pci/sh_css_mipi.c:39:5-8:
Unneeded variable: "err". Return "0" on line 44

Signed-off-by: Saurav Girepunje <saurav.girepunje@google.com>
---
 drivers/staging/media/atomisp/pci/sh_css_mipi.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_mipi.c b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
index d5ae7f0b5864..708903a31b08 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_mipi.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
@@ -36,12 +36,11 @@ ref_count_mipi_allocation[N_CSI_PORTS]; /* Initialized in mipi_init */
 int
 ia_css_mipi_frame_specify(const unsigned int size_mem_words,
 			  const bool contiguous) {
-	int err = 0;
 
 	my_css.size_mem_words = size_mem_words;
 	(void)contiguous;
 
-	return err;
+	return 0;
 }
 
 /*
-- 
2.25.1

