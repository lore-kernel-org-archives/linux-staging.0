Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7272771
	for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 14:10:49 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id z24-20020a1cf4180000b029012463a9027fso8823262wma.5
        for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 07:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=B3rpQGWrqKW/s7QbBC9Cbbf9cXI28JVOTOSLh/yBH1M=;
        b=WpsaeFL3u13gWmEF34HRreUTaIqGah8lcSrJv73ie+KZpolrAepFs+uJ3rAJeZtplQ
         ouH5wY3MxIFNLDfU5tyuKACVQ89g34WJ8CUPTGabCvSWam/AcV8ql8071XeEmpiCQt9X
         vN9j22fgrc6LhJmcHPYeSuCeOv+6G3LsejiCseJTKkJ9b+2qBIqnJNyydY5r70GDpQV2
         t/zFMhqpoDIFB8J+vRI88jm4SeguNqqNQlGtTpYiEealhGp9GbrYi3wR6Gmeq7DuELHp
         6fMyThnIQ+wyAFOa7BS+xM8Q4HlJLwdrGe4XPDLNl8/BnOXLS0oENXUS6SbZekb10FLN
         YUpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=B3rpQGWrqKW/s7QbBC9Cbbf9cXI28JVOTOSLh/yBH1M=;
        b=N4xWQz2i2NYGA5xBexMojTnI5FgtFnSVZW2plRywILHogkIm+Sm0OFnZE6SexV1LRu
         U6nWXXhxVNtqUjuQukpx1kpsRnumMvCqNXimnexFY29OHvkKO0BdWN8Snm00yCL3c3lN
         942m/tZE3bhlqpJS/3qlH4Uu70YNyBS+MDSapooi73I1YHp9WJpyxm/pnBJyhqVDawvM
         VtJC7Ns3dKblQMZ8QSLQykHYdO15sR0WSRL+xHbmgZwFkPBIPdNOKthqEQock1r449VR
         MIKr0tzuqEwoM8VY2Kcnh9n8OpETGXPZZf8eUf6ifC2kx99oJdCI5XrBKt/zNnWaGXzi
         ZUkA==
X-Gm-Message-State: AOAM530WHwvS4Rq5ZKbfzf45HH47LYGwzHIWxieackOFkSXaPGce5xK5
	psIHhpNpHMbZd90k2zwdOnY=
X-Google-Smtp-Source: ABdhPJyiGwnP7Q9+ErwLtyrlvYnHHdXx5Pnm8vKOiNMHvca4e6/T/Z6AIUR3ZsUeuv9hIKHbm3Sigg==
X-Received: by 2002:a1c:f614:: with SMTP id w20mr226170wmc.70.1618323048095;
        Tue, 13 Apr 2021 07:10:48 -0700 (PDT)
Received: from agape ([5.171.81.171])
        by smtp.gmail.com with ESMTPSA id m17sm10525922wrq.63.2021.04.13.07.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 07:10:47 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: 
Cc: julia.lawall@inria.fr,
	joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/7] staging: rtl8723bs: remove unnecessary dump_drv_version() usage
Date: Tue, 13 Apr 2021 16:10:37 +0200
Message-Id: <d1804108cfe86375a3006134a8a2a65daefec9fe.1618322367.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1618322367.git.fabioaiuto83@gmail.com>
References: <cover.1618322367.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove unnecessary dump_drv_version() usage.

This prepares dump_drv_version() for removal and
further DBG_871X_SEL_NL removal.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
index a9a9631dd23c..d5ff22ebbc5c 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -491,7 +491,6 @@ static int __init rtw_drv_entry(void)
 	int ret;
 
 	DBG_871X_LEVEL(_drv_always_, "module init start\n");
-	dump_drv_version(RTW_DBGDUMP);
 #ifdef BTCOEXVERSION
 	DBG_871X_LEVEL(_drv_always_, "rtl8723bs BT-Coex version = %s\n", BTCOEXVERSION);
 #endif /*  BTCOEXVERSION */
-- 
2.20.1

