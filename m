Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED29268
	for <linux-staging@lists.linux.dev>; Mon, 29 Nov 2021 00:20:56 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id t83so21009295qke.8
        for <linux-staging@lists.linux.dev>; Sun, 28 Nov 2021 16:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BCgXLgppxFx/+yBAvu+NIds6u6sh50A8uraUotdl8hw=;
        b=dm/PmPeohFP+EK9dFQ+1/yxwAuq8o/L5f+U/BrlHrevero4Zud15jVH/1GURrBPysW
         y6bwnByusfQ9D6P3UqmSi2kzb87TiW8eUX+7qIEPL3uedzGl0C4dvD0G27BoIzODdS39
         59Gkq7+VtHVpiR6YdV+Dsw4KHl9KUCin65MbpvkYIurgVY7rDEQDtgzOIGVVzzmUo810
         EptBCqdiUgkkf5L0OmbzpcLxDSm7EeRxJIh80XXX1JtkKe1qudVu4LCuvWQyuOiIVeDo
         Z67I/zRvBcqZ/MnzYxdOHtXpcsTKmzD/Dy/smddCIem6P6EQo5Ct5eA2/oelXrJw8Mr0
         VWaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BCgXLgppxFx/+yBAvu+NIds6u6sh50A8uraUotdl8hw=;
        b=hQOmsPIQ63a1z3psZkRUqiKrvhNv+boy1s25AyT8xQ56w8kwqXoZfJiC9HEVsx5HDi
         Gg0Y/vjM7VaOAdPbCklLOo3WM2+sm2aRPBtF7FF4QfxLVpDkld3G7SADKc/giPDux4Br
         bQI7zOuX4SK2akMcfiuP+D/ODzYbbqhqlnz9HQLSMwgRJS1lQXq8GdYfxSQTMoFmbgc1
         ht7YLDBnGx3U9nEZYc2LaB9bxx+++xcDjUj+SYcx19LwB/vusKmMGA/6VSSA57DOblqi
         dm0sPQ6Yg+O7H40NDogkRUi8sA0V0XW9MS3I7bhRIPpfM5VzJH+EsFAx9oXMfctT+HEV
         T1Rw==
X-Gm-Message-State: AOAM530GSyZQNpf+l4O/UmmIC4XibFn4q4/jfUbQa+HVsmso8TVaZrpK
	/vPTvuZH/DrQlRNn2W9IJ+IFpA==
X-Google-Smtp-Source: ABdhPJzopBkJkxAnz5/2xSMBFyHFNb1CfIOvA81OkPa0b+x7z11KHtZH//Un1OnnFA4bF4Q/EEatkQ==
X-Received: by 2002:a05:620a:ec2:: with SMTP id x2mr33234378qkm.400.1638145255992;
        Sun, 28 Nov 2021 16:20:55 -0800 (PST)
Received: from localhost.localdomain (3.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16::3])
        by smtp.gmail.com with ESMTPSA id n74sm5681022qkn.83.2021.11.28.16.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 16:20:55 -0800 (PST)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	straube.linux@gmail.com,
	martin@kaiser.cx,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 7/7] staging: r8188eu: remove DBG_88E_LEVEL macro from include/rtw_debug.h
Date: Mon, 29 Nov 2021 00:20:41 +0000
Message-Id: <20211129002041.865-8-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211129002041.865-1-phil@philpotter.co.uk>
References: <20211129002041.865-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the DBG_88E_LEVEL macro definition from include/rtw_debug.h, as
it has no callers and is surplus to requirements. This is motivated by
ongoing efforts to remove all non-standard debugging code from the
driver.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/r8188eu/include/rtw_debug.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/staging/r8188eu/include/rtw_debug.h b/drivers/staging/r8188eu/include/rtw_debug.h
index 39b69b9ad0a3..311051757715 100644
--- a/drivers/staging/r8188eu/include/rtw_debug.h
+++ b/drivers/staging/r8188eu/include/rtw_debug.h
@@ -54,12 +54,6 @@
 
 extern u32 GlobalDebugLevel;
 
-#define DBG_88E_LEVEL(_level, fmt, arg...)				\
-	do {								\
-		if (_level <= GlobalDebugLevel)				\
-			pr_info(DRIVER_PREFIX"INFO " fmt, ##arg);	\
-	} while (0)
-
 #define DBG_88E(...)							\
 	do {								\
 		if (_drv_err_ <= GlobalDebugLevel)			\
-- 
2.33.1

