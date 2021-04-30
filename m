Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 973762F9A
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 14:44:44 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id gx5so13547762ejb.11
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 07:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kxnsY7XxgR5LPkLt/HzBZqQVJx7TOeoHfiVCxdpmUW4=;
        b=huHmkcG0shMFd+wVfhIXFj6YLFfnIhH9F8fowk6Wb+mZCEcLlAQIBcGNovzPSRHPJW
         VLI/SBO+BoZ5zS3JpX4quytJKRA3ApdYPj0Kbk5S52ofE+cpk1G3slEGvdv0Az+pk9/J
         881mre3wrtzEBavU0WaGJHuE+H/KINRo/8LAe6DJF3CM+5m49NSHho27HSde4BTS/jqS
         y7mw3C1ktOp8vQ/mg92cJJxF0lCQ9pCEoP8CA/3wwdRiNRHuLOFT0VbMVyz82Gt0MvbC
         LDCJekrmj3IDxiZu4h7jJgH01bGn/OZoFLmBa6MtBwHzmwz7uAIHgwYe9t+m2McEBGXC
         OsXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kxnsY7XxgR5LPkLt/HzBZqQVJx7TOeoHfiVCxdpmUW4=;
        b=q2/MQKY9Wbm357CFkYYsWPAbQU5/++nHMQrA+8ceM9tCgcpNFKjZfYnuNJ1Cf7B/QE
         j4ID2OwveKgGTIm10CBtfhpvwcAJoqYrX76FYT+UEVCVhqtLK8TgAey3hGu3+p0dOt+L
         C6rt1kiArqQ2UXaXBUFZLPdj6l0B9+Omn2pVgSdSWBqmKiWsziKRIlcdHNxkN4CHfySR
         GfsBCuodPsAnNC7PYSPFkGLqbgJz3GFYbwrN4kCTL3uZ5S5VB0zNDHsr3LyHOb+PM1TU
         VWNTvN6YXFg8z/LJoLLcsYXxlPZTOEnZw0gZ9T8RhHqehmwk44L/ccphERme7ZEVahkf
         pSBw==
X-Gm-Message-State: AOAM531GVnQfeuDn6smI2bcvh4VdFTodY1MNBTZDKIujKimIqSOsDshf
	//lbDTIxdmpQe5i+G+Yby0U=
X-Google-Smtp-Source: ABdhPJwTZY4wiYi1atNVhq1UQzNeOhJMl2IhzE2Vy3lTRxdqed5/gFxnkT4PaHc8Ghl9srvDglgjQg==
X-Received: by 2002:a17:906:3111:: with SMTP id 17mr4626782ejx.403.1619793883210;
        Fri, 30 Apr 2021 07:44:43 -0700 (PDT)
Received: from agape ([109.52.244.36])
        by smtp.gmail.com with ESMTPSA id k5sm1623710edk.46.2021.04.30.07.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 07:44:42 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 19/43] staging: rtl8723bs: remove unused RT_PRINTK macro
Date: Fri, 30 Apr 2021 16:43:49 +0200
Message-Id: <4ff899706cdbf0fc496e06105d074a4c5cc5f220.1619793406.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619793405.git.fabioaiuto83@gmail.com>
References: <cover.1619793405.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove unused RT_PRINTK macro definition.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm_debug.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm_debug.h b/drivers/staging/rtl8723bs/hal/odm_debug.h
index 3faf4da42bd7..5c4412bf6fbd 100644
--- a/drivers/staging/rtl8723bs/hal/odm_debug.h
+++ b/drivers/staging/rtl8723bs/hal/odm_debug.h
@@ -87,8 +87,6 @@
 
 /*------------------------Export Marco Definition---------------------------*/
 	#define DbgPrint printk
-	#define RT_PRINTK(fmt, args...)\
-		DbgPrint("%s(): " fmt, __func__, ## args)
 	#define RT_DISP(dbgtype, dbgflag, printstr)
 
 void ODM_InitDebugSetting(struct dm_odm_t *pDM_Odm);
-- 
2.20.1

