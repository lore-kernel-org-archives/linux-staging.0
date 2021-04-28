Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9905172
	for <linux-staging@lists.linux.dev>; Wed, 28 Apr 2021 11:33:55 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id g10so5822134edb.0
        for <linux-staging@lists.linux.dev>; Wed, 28 Apr 2021 04:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3hJ076sy9pVna7YQDPLSat0KUjjKGv3lXcjm2Wa8PnI=;
        b=MGPO7igde+CUkjMBdr0MSCg4rDhl1Wmpu/RDuySNCtNXEWFnpTm6knupqo9XDt5TkZ
         5cvq/83Z9Lp2W3kwTSj8PKvvrMIyeAJEiW7sNKN09ER+WhAPXB2jzyVuv5xWujAAvwM2
         RtbVTQlS75qSFDhQO53ahu594ISkP1uI+cl5TXqfZt6wsuDp5mExfKQ873vs6S7nwHnW
         t3zQsrwuSRquAKGjOqOAlyVNaPde6ltHTHNzZBGcBd3IUUxGJYLfFC0gGU/owwzo3vRj
         as0Dg9j6KlKFoqBYhrVbvVASkLgImGwlW+tY8q5+p6ryFz9ohSN9DVudUbma+96U3peX
         8gwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3hJ076sy9pVna7YQDPLSat0KUjjKGv3lXcjm2Wa8PnI=;
        b=WH/24ERew8Ly7l0I6/aHzDnQTWiXjVEdwwmPvhBrkhF8c5GqzD06YsIvCKXT66HdH6
         15rDebQGTqyOISIJ07zgzW8B4sf1ZBKGuSG3OAoU7/C0LGY8TS+0UJFqAw3ZzCidY2p7
         9xqqVklUT/2W2/Ug/RNE9gdK3Qra8hWljJmdcWqYp8i2PvdnsrBEOFDSBYfxtL8BuBqO
         WdklEBAS+bVDci8nxWU91hDx+NAZ6KcRWMxhkFxRTrCbtGshPEcy6zIA//GUHzOO3K8U
         hhj7uB3omSZXscRo4KlAlzFUO7hcSkffWz6lBYFGU8gSqUZWNJ59aspsqGnRxTcT3hQT
         qxhQ==
X-Gm-Message-State: AOAM530y4aYd7wF70T6HUQm94pVhJ65sQ+Iwa9cILR/Jm1e9CVlzcD/j
	vLQqNdchLr7u32aSpWX4kts=
X-Google-Smtp-Source: ABdhPJwF72tKwjC3U4roW3UGhf92mJpoWrOhTVLvlHBUan7sLVvNVmCtQYvpPvUa5FoIo7/qlS06OA==
X-Received: by 2002:a05:6402:484:: with SMTP id k4mr10478955edv.321.1619609634249;
        Wed, 28 Apr 2021 04:33:54 -0700 (PDT)
Received: from linux.local (host-79-52-107-152.retail.telecomitalia.it. [79.52.107.152])
        by smtp.gmail.com with ESMTPSA id u19sm4677187edy.23.2021.04.28.04.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Apr 2021 04:33:53 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: outreachy-kernel@googlegroups.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [Outreachy kernel] [PATCH 1/2] staging: rtl8723bs: hal: Remove set but unused variables
Date: Wed, 28 Apr 2021 13:33:45 +0200
Message-Id: <20210428113346.28305-2-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210428113346.28305-1-fmdefrancesco@gmail.com>
References: <20210428113346.28305-1-fmdefrancesco@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removed four set but unused variables. Issue detected by gcc.

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 082448557b53..96cb4426a0f4 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -3900,14 +3900,11 @@ u8 GetHalDefVar8723B(struct adapter *padapter, enum hal_def_variable variable, v
 			u32 cmd;
 			u32 ra_info1, ra_info2;
 			u32 rate_mask1, rate_mask2;
-			u8 curr_tx_rate, curr_tx_sgi, hight_rate, lowest_rate;
 
 			cmd = 0x40000100 | mac_id;
 			rtw_write32(padapter, REG_HMEBOX_DBG_2_8723B, cmd);
 			msleep(10);
 			ra_info1 = rtw_read32(padapter, 0x2F0);
-			curr_tx_rate = ra_info1&0x7F;
-			curr_tx_sgi = (ra_info1>>7)&0x01;
 
 			cmd = 0x40000400 | mac_id;
 			rtw_write32(padapter, REG_HMEBOX_DBG_2_8723B, cmd);
@@ -3916,8 +3913,6 @@ u8 GetHalDefVar8723B(struct adapter *padapter, enum hal_def_variable variable, v
 			ra_info2 = rtw_read32(padapter, 0x2F4);
 			rate_mask1 = rtw_read32(padapter, 0x2F8);
 			rate_mask2 = rtw_read32(padapter, 0x2FC);
-			hight_rate = ra_info2&0xFF;
-			lowest_rate = (ra_info2>>8)  & 0xFF;
 
 		}
 		break;
-- 
2.31.1

