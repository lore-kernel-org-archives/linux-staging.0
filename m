Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2743FC3
	for <linux-staging@lists.linux.dev>; Mon, 13 Sep 2021 19:21:12 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id t18so16377100wrb.0
        for <linux-staging@lists.linux.dev>; Mon, 13 Sep 2021 12:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3ow2AcbCkht59g9jmVFoN/IDYWnYCxeClWzmZryCz84=;
        b=X55IDDLK/NjA0sMIr2pipRl4xkVu1h/JiKRmPQkJnNGR+mrnaTeDfSmITZDqZWteBg
         LoEqmzjoSPtYG0ZS2VcD21Tz7m56d3z7E1XhfRqCIo8knHu/hkm7rkaP0x0HzqKf2Zca
         hEwyilh7Bl9RimgmLS9d0HDuluduAYDJiG2T7M+S8JXoyInvWXdT5NKoPbnHDbr2C9nw
         V98h7UGnkiH5qiFcNlw/tFlHO91Zo7FJ21W7lo/Ho8YPX+DcpoezLtFMVtLc2He2Ys8K
         uV5zQpelCu5Le7vmjEByBWuZumx7A6WshZNdcgb8aJefFwWK7dQq5ffAI6s96MCGcq99
         DCeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3ow2AcbCkht59g9jmVFoN/IDYWnYCxeClWzmZryCz84=;
        b=j9ENE2HtE5MAV1Pdui65bU42EXVtsQCEW7AJol/e7zUaXjtf6UeF5u2dq8boBOmxyR
         7Xv6LJeDjc7dsP1qIJ+ooxbRtaLh/t5IC5Y+6lKivjxns9y0Tg4rHETYNbei3yOcHiwt
         N9IVwkMjVO/E6UalJB/0ksd5zkHGpnDbMRmyUf0LtgLH9VzFHo5X5rJmTGglK8Nx5aUm
         ScnwtgWjmGOlRsYc+yRx8FJmrogxCIecAzMaIPW+wQXnIKv7TVHDAig+WBzt1F/kUD1P
         fJtNwQxF5MfOspb2jTsCO51bo7cG9wlaFFKKmCxOj7bTy59GtcBQy4c4ktx3vZ7cdHRv
         taBw==
X-Gm-Message-State: AOAM530UGhhV1GY4o3ZQJ+mgfTnNjsGsGoAHmDBj29x/JdS1XR/gXQBH
	W9RKjCSO2ORtNV6NnMDOLLw=
X-Google-Smtp-Source: ABdhPJwlKes/TevbRVdiwijg0MDLPWsePyRC4Dfi+Ar/8PoFBriXTJ4PG/6/iO4DVe1NsNMsxMzQqQ==
X-Received: by 2002:adf:e649:: with SMTP id b9mr14684696wrn.309.1631560871249;
        Mon, 13 Sep 2021 12:21:11 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::1db2])
        by smtp.gmail.com with ESMTPSA id m2sm475021wmm.3.2021.09.13.12.21.10
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
Subject: [PATCH 2/3] staging: r8188eu: remove unused defines from odm_types.h
Date: Mon, 13 Sep 2021 21:20:42 +0200
Message-Id: <20210913192043.26527-3-straube.linux@gmail.com>
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

Remove unused defines from odm_types.h. This compiles without
introducing any new warnings.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/include/odm_types.h | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/staging/r8188eu/include/odm_types.h b/drivers/staging/r8188eu/include/odm_types.h
index ecb2bef38351..b8a8465f08f9 100644
--- a/drivers/staging/r8188eu/include/odm_types.h
+++ b/drivers/staging/r8188eu/include/odm_types.h
@@ -12,10 +12,6 @@
 #define	ODM_CE			0x04	/* BIT(2) */
 #define	ODM_MP			0x08	/* BIT(3) */
 
-#define		RT_PCI_INTERFACE				1
-#define		RT_USB_INTERFACE				2
-#define		RT_SDIO_INTERFACE				3
-
 enum HAL_STATUS {
 	HAL_STATUS_SUCCESS,
 	HAL_STATUS_FAILURE,
@@ -23,8 +19,6 @@ enum HAL_STATUS {
 
 #include "basic_types.h"
 
-#define DEV_BUS_TYPE	RT_USB_INTERFACE
-
 #define SET_TX_DESC_ANTSEL_A_88E(__ptxdesc, __value)			\
 	le32p_replace_bits((__le32 *)(__ptxdesc + 8), __value, BIT(24))
 #define SET_TX_DESC_ANTSEL_B_88E(__ptxdesc, __value)			\
@@ -32,10 +26,4 @@ enum HAL_STATUS {
 #define SET_TX_DESC_ANTSEL_C_88E(__ptxdesc, __value)			\
 	le32p_replace_bits((__le32 *)(__ptxdesc + 28), __value, BIT(29))
 
-/* define useless flag to avoid compile warning */
-#define	USE_WORKITEM			0
-#define		FOR_BRAZIL_PRETEST	0
-#define	BT_30_SUPPORT			0
-#define   FPGA_TWO_MAC_VERIFICATION	0
-
 #endif /*  __ODM_TYPES_H__ */
-- 
2.33.0

