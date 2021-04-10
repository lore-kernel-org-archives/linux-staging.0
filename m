Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CFBB6D00
	for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 14:20:59 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id g17so9041758edm.6
        for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 07:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=J4fG4J1055h70nJZ2wPuBhZ3bQDllQogeXLUfm2yN0o=;
        b=Nbb/1vCd/ly1TkQo38k9kjQzi56QtrkS6z47cLcvIpeFaTQy5s9MKXMGcEuHOlnuuB
         kDtZZg5RF7/DJdoqoMaWZqC8o+0avgOrRmS0Lpa6tWPbVk4WbfNHZbgTJJhAK2iCriFX
         Jefe+4aGtwSW3XmAJnvuFbl2R74/FDFTGgN50oLPq9bF2IzT7ZGW4KgsIACretidj5A2
         3O7qLDbDbhtcKkHp6m3V5Y3EFa5IUvYtE/VBJo4MxbYJbYTLY+IC02s97oYNBb1p7cV6
         QmGQSOk7Pr1VsTBzSdbgQBYG2/8/LqLwj++SGukAWzxzo6UUJHnyMYuDD9qwidPD5JTn
         yGMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=J4fG4J1055h70nJZ2wPuBhZ3bQDllQogeXLUfm2yN0o=;
        b=H/KLezdRP6iaMRlWXpeGYi4e7WbGihaHre3AIKwwX9X7SQXyMC34Tb2ud6hBm+bZAB
         4K126W+ONG/IMUYCgaqoSsonTuSy61/vUggGddzCYh439rRA4l0MU/y3XBHuawT9hCTf
         oyB24UZYa1ZEvZLg+7NWKWMbZLP4svYipv+Y0tzRCWs/t6v4RPFWVrSR8OvxrFawEs0R
         +2TTZD4IHXpNynfUG+5ecwpZwb1eRAjzDmiAhhYhYzUCGSenFW5FQ2oodx1GT/XB0xhW
         f/999yGFX6hjCaNBrnxk4YpPbGF7eLQF2ufJhum8ufgihO9/RwPREg4lYYg/rJzCJJBQ
         Hwxg==
X-Gm-Message-State: AOAM531IM7tMealyP1Zvzz4J50eM/GX8TWcyxYf4JERC43IRyvYWk4ed
	E4GZEtMHIinjhSlOS477Ml4=
X-Google-Smtp-Source: ABdhPJyafHRgytUD2sLVZxZmcsdlVpr8OdoWELhbkI0FyocHA/7RZW+8s+Q1Wjp61PcB2gUnKWLwPQ==
X-Received: by 2002:a05:6402:518c:: with SMTP id q12mr22284661edd.11.1618064458204;
        Sat, 10 Apr 2021 07:20:58 -0700 (PDT)
Received: from agape ([5.171.81.28])
        by smtp.gmail.com with ESMTPSA id q19sm2710034ejy.50.2021.04.10.07.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Apr 2021 07:20:57 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 11/25] staging: rtl8723bs: remove commented out SDIO_DEBUG_IO symbol definition
Date: Sat, 10 Apr 2021 16:20:24 +0200
Message-Id: <7a45b1419bcf4eb2abc25d661acae77018432e46.1618064274.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1618064274.git.fabioaiuto83@gmail.com>
References: <cover.1618064274.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove commented out SDIO_DEBUG_IO symbol definition.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/sdio_ops.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/sdio_ops.c b/drivers/staging/rtl8723bs/hal/sdio_ops.c
index 24e45f734bdd..a8d8fe54fea8 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_ops.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_ops.c
@@ -10,9 +10,6 @@
 #include <rtw_debug.h>
 #include <rtl8723b_hal.h>
 
-/* define SDIO_DEBUG_IO 1 */
-
-
 /*  */
 /*  Description: */
 /*	The following mapping is for SDIO host local register space. */
-- 
2.20.1

