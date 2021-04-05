Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A2A25F
	for <linux-staging@lists.linux.dev>; Mon,  5 Apr 2021 16:50:21 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id d191so5985469wmd.2
        for <linux-staging@lists.linux.dev>; Mon, 05 Apr 2021 09:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EEUP96OVrvwGYcMCP5tEx9U5jXD8e7IXitjWFfxwGhk=;
        b=fSFoP7S1yfqp+Xhz0wmvjfM0U0dGydB+lqV0x6OhkoEdOuHL4v+FOvI81Y/42AYFZ5
         S74UuRI87E10zqffPz3IhYEVzVV5DpVHETBQSozMblD4HIiK7xkGMdISEwTVdjEbeY1d
         sI5AyY/K7uE/pXyuIYT12H4c1X7LACzerSY8yF8iciqqm+fEzSg0GIWBvC/BIL39aTXM
         baLrTQjvfBfKZRRmDuziRyBR9egNbY4rXPGcJbKdgUe5nsTeFROFCw+o16/lpHHKWgBX
         HI6cL8kUIPIpjVrJmip47U41+PAK2mOOcxQtRHYxEsmLl4VsDjjElq/5CjDgZ4ZEUuQo
         0yWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EEUP96OVrvwGYcMCP5tEx9U5jXD8e7IXitjWFfxwGhk=;
        b=OH4K/8McEvVnTP57yGbsXqeFqZB50sBqzNi37xnHWlOKGpo/kkweqO/ZBTkVunGcWD
         /KYSFR7joUrVOf7+W4QSKIaHJhh8tjeK6+49xEEguZ0IN8ephSS7bgmukyA0U9ZwJFnz
         bvo15/E7VVVJNFrqm6unxwfD6woIJDpJkWNPMSwj+limjHzlrKIGOVz04IG8JqkmRDn7
         NhBoylkl3wUHQ/xSGGTjzVdqz5xMQ+TT/MRxjJfoYQ3ghLkREq+4b9bamFUZ5hUVMjFK
         aeayBdck9d6PzQsrzXh4uX9jwVV2lwVg7umq4ToH2WbQ0e67djMxZTlNC0TizKIJMvtL
         OuPw==
X-Gm-Message-State: AOAM531aFf1KraUFtwWr16nYylK5si+Me4pQ4A/pe69CTCwhlUG9zU6P
	SviNPor9pWv/2my0+FU3YM8=
X-Google-Smtp-Source: ABdhPJyOgVVzgb0TtrW7bKTdaskuxxvmpHd10cpmFd6tW9J9rx86em/nBhfmoyM/5m04hDtCk+hA9g==
X-Received: by 2002:a1c:49c2:: with SMTP id w185mr22267wma.163.1617641420248;
        Mon, 05 Apr 2021 09:50:20 -0700 (PDT)
Received: from agape ([5.171.72.58])
        by smtp.gmail.com with ESMTPSA id h14sm34304884wrq.45.2021.04.05.09.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 09:50:19 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 05/10] staging: rtl8723bs: remove empty #ifdef blocks after RT_TRACE deletion
Date: Mon,  5 Apr 2021 18:49:52 +0200
Message-Id: <f054fa97ff8197bd9d0320a601428c132de95e1b.1617640221.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617640221.git.fabioaiuto83@gmail.com>
References: <cover.1617640221.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove all empty #ifdef blocks left empty after
RT_TRACE macro deletion.

Suggested-by: Joe Perches <joe@perches.com>
Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 9c544b5888d0..9fdaefe6e183 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -2465,8 +2465,6 @@ void Hal_EfuseParseTxPowerInfo_8723B(
 				pHalData->Index24G_CCK_Base[rfPath][ch] = pwrInfo24G.IndexCCK_Base[rfPath][group];
 				pHalData->Index24G_BW40_Base[rfPath][ch] = pwrInfo24G.IndexBW40_Base[rfPath][group];
 			}
-#ifdef DEBUG
-#endif
 		}
 
 		for (TxCount = 0; TxCount < MAX_TX_COUNT; TxCount++) {
@@ -2474,9 +2472,6 @@ void Hal_EfuseParseTxPowerInfo_8723B(
 			pHalData->OFDM_24G_Diff[rfPath][TxCount] = pwrInfo24G.OFDM_Diff[rfPath][TxCount];
 			pHalData->BW20_24G_Diff[rfPath][TxCount] = pwrInfo24G.BW20_Diff[rfPath][TxCount];
 			pHalData->BW40_24G_Diff[rfPath][TxCount] = pwrInfo24G.BW40_Diff[rfPath][TxCount];
-
-#ifdef DEBUG
-#endif
 		}
 	}
 
-- 
2.20.1

