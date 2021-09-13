Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D94352FB2
	for <linux-staging@lists.linux.dev>; Mon, 13 Sep 2021 19:21:11 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id g19-20020a1c9d13000000b003075062d4daso764294wme.0
        for <linux-staging@lists.linux.dev>; Mon, 13 Sep 2021 12:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8vZ8jAUCs6rj3NiyzP7WPgKnLWOxsjYG6LIzs7abVHU=;
        b=BcgqRicZMRbKv1AhtG8S7MwOkvoJWuba1cD8fCFat6oJP8b7abeT80FCriiXYbHymf
         IvOh8TTqouyNkiHxFBIOg82FRMx0WkJG6Z8TeoFS3tLjhf1f0l4az2hra3OJugHUlSeN
         X7u6adFjlQ5kwHA6wUc5qvHwZM5ro4ssnhzwxJu74AypRPO1lYt+izfNRRyk5YhSnxgK
         cmklt6Uf7RBRJz9+NHOtCC4R6TzfXHrLMc/+pT+qbPLbfIoFLi//XzNobmgrADqp8fE1
         9jfjhBzz+I/LEMInEOY8CcmGIXyhSQVVOeKZCms6O+FLrtKmebNwKzbRoqL/Z4oEwa2u
         /Mdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8vZ8jAUCs6rj3NiyzP7WPgKnLWOxsjYG6LIzs7abVHU=;
        b=wPZWa6A9f6PtNA0H9vDKvH8/78Lb+wrO374Vt4waDcAbjpf/KNRrOjt89ZL/fnr6MR
         4lIFTvRJf2QEV6Api0JeUh9+5y0297Ha0OHpChXrlM3xbgEy5HSH4qRyXjH6xmrdxWq2
         l6icyc602t3DYE1/y2iO4O9JBXk0pgU0MxJiqC2mkm1PZ38AXrq+85bmtZj+KEYEUHuy
         Qlg3Enmu0hhgnEzfaPuyTQqM9r2Gm1fkA9XoayfxRtoKSYa4WzfYtci04a6DuulyhHKa
         QV0Frb+6Dx+YNrI8BvDhnVffhQpdw7DhhlZRFc3pO+4tr4m3UmVnSMdUGF9tfg6i4mbz
         PNKg==
X-Gm-Message-State: AOAM532H+3zUuh2oBLMUUzq6VK+CBPymJrJvsL5F3BAvbC5mTeCMSRug
	CrLa2jpXWTkBYBhoWyoomoJDuMh488rdyA==
X-Google-Smtp-Source: ABdhPJwcCzHgJmUbrS84pRpZsjGhvaigXnrFxSMIhoACpnUWSo34fC2QoTbxAkoSOFZPe3slTTlMzQ==
X-Received: by 2002:a7b:c009:: with SMTP id c9mr12855088wmb.106.1631560870394;
        Mon, 13 Sep 2021 12:21:10 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::1db2])
        by smtp.gmail.com with ESMTPSA id m2sm475021wmm.3.2021.09.13.12.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 12:21:10 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 1/3] staging: r8188eu: remove unused enum RT_SPINLOCK_TYPE
Date: Mon, 13 Sep 2021 21:20:41 +0200
Message-Id: <20210913192043.26527-2-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210913192043.26527-1-straube.linux@gmail.com>
References: <20210913192043.26527-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The enum RT_SPINLOCK_TYPE is not used in the driver, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/include/odm_types.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/r8188eu/include/odm_types.h b/drivers/staging/r8188eu/include/odm_types.h
index 6f4a4bd37ec1..ecb2bef38351 100644
--- a/drivers/staging/r8188eu/include/odm_types.h
+++ b/drivers/staging/r8188eu/include/odm_types.h
@@ -21,10 +21,6 @@ enum HAL_STATUS {
 	HAL_STATUS_FAILURE,
 };
 
-enum RT_SPINLOCK_TYPE {
-	RT_TEMP = 1,
-};
-
 #include "basic_types.h"
 
 #define DEV_BUS_TYPE	RT_USB_INTERFACE
-- 
2.33.0

