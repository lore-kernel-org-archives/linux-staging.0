Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6EFD3FC4
	for <linux-staging@lists.linux.dev>; Tue, 14 Sep 2021 12:14:04 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id x6so19813210wrv.13
        for <linux-staging@lists.linux.dev>; Tue, 14 Sep 2021 05:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RoJvBnKBOpOjZqtzLlm6r3dvhs4vOZnc+8JZoV4fMA0=;
        b=B+CDqLAoKa4kJVCfKVFIjkvZH4MoHyqTAkLYmWNdaAEhskI1RxiLaY0LLVZVuUZBZd
         x1VssxCNRhlqmzcIqVGRhdO4SrhFO0vDFbBx+qbP4fIqTiJhVNbJnZ726dAZHBA+vU4m
         dN/2agRyClv2L43gpMyb0W7sUTkRn1bCsnyprvnXtbY4etSaZ7zc8FTGAeNWuU853z3a
         PVt5fFzS5gXXDZzrUCk4xgpS1v8Vtws6TkVrS/3RXD1OohopGK5LcOiKFsLW7phFswb4
         lTa0y2CVWcmPJuK9XEUl7V0A7FllDF3pJ5drU29BWdohVg/Hk45injR2defgsa1z9H9h
         2aDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RoJvBnKBOpOjZqtzLlm6r3dvhs4vOZnc+8JZoV4fMA0=;
        b=bFPHap7nNASAAH+G/4fFrcyW7uETQlulSOCZEu3195NauSENIg3rt9oWuO2xnz5953
         uCDCujJx7M8yrZFpHboRQXkA4TvFAA/5wLld6XBOq9olygtBiDKa/fdvDxZBgigpb6aZ
         z0hGHgJRVNhagx0fjFo9TJVLcz4jkHAMIzwH64tOujmQJxzAmB2VN6/+sVjGusWCoafJ
         Td/BO1ICAEqfV2tuwkUk8PDcm278pV75XJGFKzWH1nnnv/gwy86yRCukTqfRpnC7oFZP
         dN3d1GcJ/+WOJTu9SMitNl5fFWPDz6je5z9DMCa2paK9TsOM1kQnVQkGdXOiuEb7scac
         veqg==
X-Gm-Message-State: AOAM533glTjKV9C13rofkX38f9WUwKJom8+wf7J8gnX4M9ffzKIkNKZD
	MYdArGCplmRXvTtuHM5SarcyEp0zv9hiiA==
X-Google-Smtp-Source: ABdhPJzwt7sL/X15JIuK/UP65hzOWrQazW+J3Y0qUhw8dcKMaf67VyXTuR7cHHbiUeKjCpOzJ7I67A==
X-Received: by 2002:adf:cf05:: with SMTP id o5mr18261260wrj.270.1631621643254;
        Tue, 14 Sep 2021 05:14:03 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::ae40])
        by smtp.gmail.com with ESMTPSA id j19sm10028100wra.92.2021.09.14.05.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Sep 2021 05:14:02 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 1/4] staging: r8188eu: remove unused macros from rtl8188e_hal.h
Date: Tue, 14 Sep 2021 14:13:49 +0200
Message-Id: <20210914121352.26052-2-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210914121352.26052-1-straube.linux@gmail.com>
References: <20210914121352.26052-1-straube.linux@gmail.com>
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

