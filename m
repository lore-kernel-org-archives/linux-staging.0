Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5A66F
	for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 12:44:57 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id p19so12832324wmq.1
        for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 05:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=r4sh+kHc1NuzpbkgVXhc8VvTW4BS40gwx8/RtoNOoQw=;
        b=jPO6AFcrg1ivzimUyFHALxIJDwfae+fjG56NY1fB+5BTDfLjlyZ7OaTXlqGQ6B9/fB
         gFG7TbVQRjGMajCuDoBWDT3zxn0vd/cXZHHx/nJcbI4q1Ojwp5Zg6E9u4rPthl5bWaXS
         oO/I2RKjE27HKWkR7lwtGEQbpch5D8/39k+sG/5Xfzc0MGP9UPAynv20oKbNnJmehaP8
         f7kcR7dy0+rWERhILOK50xgKcyOp9pdJq5H3U64cJ5xnmLUiEk1hObLE23FAHgY9fPOA
         MKE7s7r8rtZkl5SoWufXY47H+8kspyvstVfVc5qZ8HrXT1mKN9ivPzZDQA6yW0fxR7zN
         jKxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=r4sh+kHc1NuzpbkgVXhc8VvTW4BS40gwx8/RtoNOoQw=;
        b=E6tqLC62F5wXxKk72kWy451pYhDwWA2etr0GakBFp+4Hq1K0Kpl0CvxZ9wZqfnqtuz
         48MFq4/BEq6pklbD6VLMowxaaCcXotFeXdvCUnGygiMGZXFF9p5PZZiRcEnlWNUp+SqG
         yaGqxFMuAVIQwSlAGO+H35BddPnafyFZAGldk+TrkYCxo+nNrW04x68YDsovKuUlfquB
         pr9fjbi9o/HZ0g1FQMThP+XhNNW6A3rFlYTvTikkPgW/135Vk23iJD68iVmp6/Q0Iab7
         9ukmchXzCvulBkj6fgn5P5WHPTLwBVZZkKgWc/8KsBHqpnGWjoJKSom+rIB8EsFJtQGk
         htUg==
X-Gm-Message-State: AOAM530RhlhkgIdWfOfUGL7RcJXI5UWLaFfiTI4FFI5ce8lmRBpjbWbc
	YoLo2qhCJRoyJ3ZmI4vut/5Sr3wq3dc=
X-Google-Smtp-Source: ABdhPJytzgptJzhkGxksm24zExzHGQQ95kO6f9uWG9PeZ7ICpZAop9Rcl0AWkg2vUGgfKEeJATDehQ==
X-Received: by 2002:a7b:c112:: with SMTP id w18mr2749644wmi.28.1616589896451;
        Wed, 24 Mar 2021 05:44:56 -0700 (PDT)
Received: from gimli.home (93-48-145-141.ip257.fastwebnet.it. [93.48.145.141])
        by smtp.gmail.com with ESMTPSA id s20sm2324005wmj.36.2021.03.24.05.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 05:44:56 -0700 (PDT)
From: Marco Cesati <marcocesati@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	linux-staging@lists.linux.dev
Subject: [PATCH 10/33] Staging: rtl8723bs: remove named enums in osdep_service.h
Date: Wed, 24 Mar 2021 13:44:33 +0100
Message-Id: <20210324124456.25221-11-marcocesati@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324124456.25221-1-marcocesati@gmail.com>
References: <20210324124456.25221-1-marcocesati@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the following unnecessary enum definitions in
include/osdep_service.h:

	enum mstat_f
	enum mstat_status

Signed-off-by: Marco Cesati <marcocesati@gmail.com>
---
 .../staging/rtl8723bs/include/osdep_service.h | 25 -------------------
 1 file changed, 25 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/osdep_service.h b/drivers/staging/rtl8723bs/include/osdep_service.h
index c4d29d65187f..fd8830a51707 100644
--- a/drivers/staging/rtl8723bs/include/osdep_service.h
+++ b/drivers/staging/rtl8723bs/include/osdep_service.h
@@ -58,34 +58,9 @@
 
 extern int RTW_STATUS_CODE(int error_code);
 
-/* flags used for rtw_mstat_update() */
-enum mstat_f {
-	/* type: 0x00ff */
-	MSTAT_TYPE_VIR = 0x00,
-	MSTAT_TYPE_PHY = 0x01,
-	MSTAT_TYPE_SKB = 0x02,
-	MSTAT_TYPE_USB = 0x03,
-	MSTAT_TYPE_MAX = 0x04,
-
-	/* func: 0xff00 */
-	MSTAT_FUNC_UNSPECIFIED = 0x00<<8,
-	MSTAT_FUNC_IO = 0x01<<8,
-	MSTAT_FUNC_TX_IO = 0x02<<8,
-	MSTAT_FUNC_RX_IO = 0x03<<8,
-	MSTAT_FUNC_TX = 0x04<<8,
-	MSTAT_FUNC_RX = 0x05<<8,
-	MSTAT_FUNC_MAX = 0x06<<8,
-};
-
 #define mstat_tf_idx(flags) ((flags)&0xff)
 #define mstat_ff_idx(flags) (((flags)&0xff00) >> 8)
 
-enum mstat_status {
-	MSTAT_ALLOC_SUCCESS = 0,
-	MSTAT_ALLOC_FAIL,
-	MSTAT_FREE
-};
-
 #define rtw_mstat_update(flag, status, sz) do {} while (0)
 #define rtw_mstat_dump(sel) do {} while (0)
 void *_rtw_zmalloc(u32 sz);
-- 
2.30.2

