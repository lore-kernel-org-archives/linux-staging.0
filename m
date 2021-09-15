Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D261A29CA
	for <linux-staging@lists.linux.dev>; Wed, 15 Sep 2021 09:02:19 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id i3so1542925wmq.3
        for <linux-staging@lists.linux.dev>; Wed, 15 Sep 2021 02:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RoJvBnKBOpOjZqtzLlm6r3dvhs4vOZnc+8JZoV4fMA0=;
        b=I63nVdJbqIeW35Xp8HmPvz9AMRl+ZEwPP5gMxbLve4Ttlhafe9uZqFSTn7dXEVDyFb
         QVSXeeY9dKCcIuQdwQX5rOcy+CVUWoK2URKPgEnPyYKrWOPG2QmjfScQmprH5QKtHat+
         5rmPfZCSHOZMll6pxN+etWEmbEDcZHoVnNQv0yOVCKQh5CtLi5hEvH2OSfgo+CTtstCh
         wfV4/OcaRT3/CXwXJgkusUEh+Qz0tPV/jgEnCXu8lll87rmQMY+lR8MlE2hC9Qy6t23s
         5PUJWNgOdWLXhpRzY1a5/3JgMviA3iGxqGIHiH4/jyij0TP0AxIn+p6xgC5CFYBpEMV/
         bK9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RoJvBnKBOpOjZqtzLlm6r3dvhs4vOZnc+8JZoV4fMA0=;
        b=gPR/HkW5r7CmeKi1KkRc0Jk+iuw+46PG26901DtfrVvpW4ej/q10BhM75d1aBO/iiA
         2YUPAFZ9b3esG47rzJu2plEPtZ/4QfI54ReEeUa9eDqaQjHUKGLgbngl90FBMFSVqH1N
         Xkk0Gj4xyaa3yDwfLq6XEjWd3ko1UQ7MdvQA1cG49+1EWDLXArH9NO0IRXh2E90lkLHH
         wu2v8gKblfX3373r5zAYLRhuqLUWQTbUUEKlNLFsMhHmeyaSDXVRXk46jjXIVWozQnI9
         ZAXvRtpOWJSFg0FGsRGXs4wplmrCYwwRLvaRvho5aL5NtR69Cc4hXRzYy3R9+auSEgIB
         o/dg==
X-Gm-Message-State: AOAM532cxzAZZf1yFwn0pGH7NwsGnlZPefJkSPWHx7iyFkG+zIO6BH14
	exEV3fh5fAa4kWYwB7+/3go=
X-Google-Smtp-Source: ABdhPJy2Bz8F2C4FesebsFH93lNrGkQr998ZqovXUNIerDVXj2GTTX+MsIJdkH6wPK5/2GmOIf/Umg==
X-Received: by 2002:a1c:9dd2:: with SMTP id g201mr3283992wme.46.1631696538266;
        Wed, 15 Sep 2021 02:02:18 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::1db2])
        by smtp.gmail.com with ESMTPSA id n186sm3565530wme.31.2021.09.15.02.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Sep 2021 02:02:18 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 1/4] staging: r8188eu: remove unused macros from rtl8188e_hal.h
Date: Wed, 15 Sep 2021 11:01:53 +0200
Message-Id: <20210915090156.4169-2-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210915090156.4169-1-straube.linux@gmail.com>
References: <20210915090156.4169-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The macros INCLUDE_MULTI_FUNC_BT and INCLUDE_MULTI_FUNC_GPS are not
used in the driver, remove them.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/include/rtl8188e_hal.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/staging/r8188eu/include/rtl8188e_hal.h b/drivers/staging/r8188eu/include/rtl8188e_hal.h
index 537a8d17642c..f16ffd952215 100644
--- a/drivers/staging/r8188eu/include/rtl8188e_hal.h
+++ b/drivers/staging/r8188eu/include/rtl8188e_hal.h
@@ -394,11 +394,6 @@ struct hal_data_8188e {
 	((struct hal_data_8188e *)((__pAdapter)->HalData))
 #define GET_RF_TYPE(priv)		(GET_HAL_DATA(priv)->rf_type)
 
-#define INCLUDE_MULTI_FUNC_BT(_Adapter)				\
-	(GET_HAL_DATA(_Adapter)->MultiFunc & RT_MULTI_FUNC_BT)
-#define INCLUDE_MULTI_FUNC_GPS(_Adapter)			\
-	(GET_HAL_DATA(_Adapter)->MultiFunc & RT_MULTI_FUNC_GPS)
-
 /*  rtl8188e_hal_init.c */
 s32 rtl8188e_FirmwareDownload(struct adapter *padapter);
 void _8051Reset88E(struct adapter *padapter);
-- 
2.33.0

