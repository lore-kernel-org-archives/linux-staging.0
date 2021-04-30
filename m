Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC552F9C
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 14:44:57 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id r12so105638527ejr.5
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 07:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vvsMkKSxObWfrYf5zpIINvfbNjNueuFKMoVjdC9Jfxw=;
        b=m0KOGYIA5/VfFfq0uaQiUbOwOrfPt4Be0Hh7t9woZUoxBVwzn09M+XN8NfSdKiSVJw
         MVW3zN0MS8SDIy5v4SSL8lEJVtDSWSRcQI6MG0qWUaX514JuEBR69w37uOaLquPCWLK+
         ezcX0DxUgjCkYH32KcBfRwhYk+mLAHXSUrAXdDgdRMXBdIN6FzcLQbcwQAD/nG/4HLHE
         xzqnPHfF5NpKuNfak6Zr39S2RXbh/GLCOdal3LVFF8x8+Xr+WtPYbtpD7Dxy4UM4D7Ca
         +Yih+9vu8umYwI9ymEvdLrSgx3mhWxp0qaP3BWp4C3gmLHwXE9j0kTB00jGjL9rGLkWe
         gyGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vvsMkKSxObWfrYf5zpIINvfbNjNueuFKMoVjdC9Jfxw=;
        b=eaVTYbHKE7VxXGzkTxzJFyLR1grkuNt95BqCsxXnHYscn8oEunIC9ld53mxieshXQ2
         5dhcwhD38gHItZreTLDyK8z/ZwSlJeLmwEY0nt1OCO9zH0EfWJfCv8zNenI1ivORPERs
         Iyn7BJf2z90YqT9MqMy5MHoloXc+zCopY2muVCHKKQS0JzucQwH5YqAihYh7/vSl2w0u
         1JNbJ27Okqtn6+T8aVTjEvZW/93K7Xbz0jpfG01nJd620/VaJ8bgc3xzxG6EyV/dHmBr
         ELI3W9yooUD0PlMG/XrWcMZQ6AfXrh1JMPTduNpAXYOTyEYrFtK9rPQ38if2kL6Ji/A+
         UuLQ==
X-Gm-Message-State: AOAM5321y4F9e7sEf6qcZ6HVk7SPKMmBk+FnFhCk79HkIYqd1uGX4fEC
	PAt1c/sUXV7Hef+zb49+4+4Da7Du6Lg=
X-Google-Smtp-Source: ABdhPJz4qnedGXiWBOucuM9Gvvu+0eqMN3iz27s5wwFAy8gqk32Xt5JkYDV2vXWt/GGBhLx/SHHeRw==
X-Received: by 2002:a17:906:a006:: with SMTP id p6mr4794139ejy.350.1619793896558;
        Fri, 30 Apr 2021 07:44:56 -0700 (PDT)
Received: from agape ([109.52.244.36])
        by smtp.gmail.com with ESMTPSA id k12sm1388931edo.50.2021.04.30.07.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 07:44:56 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 28/43] staging: rtl8723bs: remove empty #ifdef block
Date: Fri, 30 Apr 2021 16:43:58 +0200
Message-Id: <2e8d7412862296eabbc64f0b5e7f23994c13e36a.1619793406.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619793405.git.fabioaiuto83@gmail.com>
References: <cover.1619793405.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove empty #ifdef block.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h b/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h
index 9c9ad29870e2..f2793d5d9a30 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h
+++ b/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h
@@ -112,11 +112,6 @@ extern u32 		GLBtcDbgType[];
 #define CL_SPRINTF	snprintf
 #define CL_PRINTF	DCMD_Printf
 
-/*  The following is for dbgview print */
-#if DBG
-#else
-#endif
-
 struct btc_board_info {
 	/*  The following is some board information */
 	u8 btChipType;
-- 
2.20.1

