Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712B92F9A
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 07:44:51 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id r12so103837350ejr.5
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 00:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jMN4zuhUHvB3cXnh9Uh5ILIZdfR0r9cSa/aL/onWxjs=;
        b=thH0C61hU2D4xp55V7rsZqJPTjyHLJZFuMZhrAOgPxTiQCZHXvbKfyrVD6eKyIWctz
         4Ix8cOc32UapMn0/eee01pwP3hnf4qaPzvCbCbJfgLuGWj/So+AJs02An7qPpxgYeV3+
         9abDpJMzufhJtwE7uKVfNocwGVUvN7/VxLi2skka54cDGzTAg5ZegQ/8/8p8ZGhQ8bVV
         cZpa18qRM1ABuApV4Hg1ayE3TdepmMS2URcsPw/MomFhx/NYhnCl2pgKSeNq5yivtftH
         AuzAxqKn0CesQKGeo+VhlP2oguEVeiPJMGgKY2zRiGIcHfTjwlyst+jvtGN2ThuyY3wx
         uf+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jMN4zuhUHvB3cXnh9Uh5ILIZdfR0r9cSa/aL/onWxjs=;
        b=hU9Z5D2bEry4dC3YuAYF3FwieUnTyl7Rbzefei88+HTNlEUevlULjcxbt6XPsmFlB2
         Y0VcksUWYrgd1dXGhzYlfeXFvAZnOy6u11peiYDJV9qtWqrX3u4NUR+YJVKZKsq4n6tu
         UulUMbWMIjLiExbAe64hGrRKD6as8dp5KJSFPBp7NmgFR0ljLhrCLp30vsbzrOJEgcfj
         QqvVg8DpCqlT7nCcF4kUXhdHPTQJKKQJ6lfpDhm1eq+JMERpJ4jDd8dcgtF2UGJFYQXQ
         FdoVxQbtTz2He17NZrntaUBQ0YiL1Bi2mI+bAzVpWQppMoUeZOhclVA+b9wlMnF9LPCB
         DUfQ==
X-Gm-Message-State: AOAM531L6/7+7HCBgUgeAaP5D0mymZbcW39h1z6FS04Jf6DpIc8ZjXwa
	UnN/wdApv3Bcv6fb/L32o67kbYd+UKTDTw==
X-Google-Smtp-Source: ABdhPJwaYejqCz2dYUv46+N4WfReOlFcrVp9pUU+GXtfVdojDzCaG6AgaYm4XuHWc2ysVHkX/B+vrA==
X-Received: by 2002:a17:906:87cc:: with SMTP id zb12mr2924254ejb.138.1619768690083;
        Fri, 30 Apr 2021 00:44:50 -0700 (PDT)
Received: from agape ([5.171.81.86])
        by smtp.gmail.com with ESMTPSA id o6sm650449edw.24.2021.04.30.00.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 00:44:49 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 27/43] staging: rtl8723bs: remove BTC_PRINT_F macro definition
Date: Fri, 30 Apr 2021 09:43:45 +0200
Message-Id: <892fb6bb161ac4357eb3d2b6962a937e7159e540.1619768150.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619768150.git.fabioaiuto83@gmail.com>
References: <cover.1619768150.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove unused BTC_PRINT_F macro definition.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h b/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h
index 36636ad62aac..9c9ad29870e2 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h
+++ b/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h
@@ -115,7 +115,6 @@ extern u32 		GLBtcDbgType[];
 /*  The following is for dbgview print */
 #if DBG
 #else
-#define BTC_PRINT_F(dbgtype, dbgflag, printstr)		 no_printk printstr
 #endif
 
 struct btc_board_info {
-- 
2.20.1

