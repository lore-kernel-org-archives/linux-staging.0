Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDEDF6D00
	for <linux-staging@lists.linux.dev>; Sat,  3 Apr 2021 09:15:02 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id v4so6513512wrp.13
        for <linux-staging@lists.linux.dev>; Sat, 03 Apr 2021 02:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=H7gV2Io75BmHpwhQaw6NovithxcDv0ix+Sn60I7HwJo=;
        b=asIeDQEamcOTEZcUcmXrveR7Pg1uGOXeAPUsohxX1pNb4E3hk8BucbNyQY41n5RUwd
         gwSwRXwD5/JwKZJgmePs0F01P5D17Cpd6cE88l/4kF/UGZXhQnoM1Y1NFARFRbM8o3IV
         9r6y1T3Xw/1IPTey8dA8SGIiuWzgkMXrD0vsAhEzbA3t12MDXwHOtVSRpXQONHEYxCxm
         xNDxt5+NkS1lhZVM/DLEDOwhCGWk8rRHgVKnuRbgAqlOOvMgFByp4CXsPmuVw2tVXqae
         9e51udcInG361JliXefb8fpGHsz75zrgw7c2XaHOTH6Pie/QNrtVIUlpORDA9AhrhpW1
         auog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=H7gV2Io75BmHpwhQaw6NovithxcDv0ix+Sn60I7HwJo=;
        b=qeOPhwUYOxDEA1WPp3E8W/mMKlwfuB5muYYeF0BGqCC5yogtqOg4Z440j+7c2uhxAf
         McZ76db2umjPxjtnaPHJ+OAUE0RNgFvC3HZ2DdounMonIfBWrfL367fw1yr5u2ONwjQ3
         UEjUzzyM7hBwyPKOkdzQAA9Kmw4lUKa/VcD5Fctuv+0LjanHYGglZQ/JtebmH+4LRxk2
         wvS9Fxnhnw05w0ucfId1183vJSdQN7GNH3H66JPskCZxIztDFK0d2p1N6q6t6Lpf0CJc
         2Q2Zt0AaQH3QDT8VCAs145+L1FqY8PQ8A3rzhNW8BPURu89sQ80yi0s6dnN8DckRPYh6
         da9Q==
X-Gm-Message-State: AOAM533loO3A6a/XOy8wIulF475xqpsR4EOc9DwqCEEF7bryNcrdLepb
	u9P4TiD8CxMntcCMyPiFAzM=
X-Google-Smtp-Source: ABdhPJzepbrYuBB7nKXngRQiPe5TDMA4FBkptclD5AQlng/KkxFWZFxoagrXV+iLDG+Kbj+Sv9hMBA==
X-Received: by 2002:adf:bc01:: with SMTP id s1mr19612218wrg.240.1617441301333;
        Sat, 03 Apr 2021 02:15:01 -0700 (PDT)
Received: from agape ([5.171.72.64])
        by smtp.gmail.com with ESMTPSA id c9sm17419840wrr.78.2021.04.03.02.15.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Apr 2021 02:15:01 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH v3 30/30] staging: rtl8723bs: add spaces around operators in core/rtw_ieee80211.c
Date: Sat,  3 Apr 2021 11:13:52 +0200
Message-Id: <33914c8c2b09ea2bcf845912dfe0ef04f2464856.1617440834.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617440833.git.fabioaiuto83@gmail.com>
References: <cover.1617440833.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix post-commit hook checkpatch issues:

CHECK: spaces preferred around that '+' (ctx:VxV)
161: FILE: drivers/staging/rtl8723bs/core/rtw_ieee80211.c:648:
+			*wpa_len = in_ie[cnt+1]+2;
 			                    ^

CHECK: spaces preferred around that '+' (ctx:VxV)
161: FILE: drivers/staging/rtl8723bs/core/rtw_ieee80211.c:648:
+			*wpa_len = in_ie[cnt+1]+2;
 			                       ^

CHECK: spaces preferred around that '+' (ctx:VxV)
162: FILE: drivers/staging/rtl8723bs/core/rtw_ieee80211.c:649:
+			cnt += in_ie[cnt+1]+2;  /* get next */
 			                ^

CHECK: spaces preferred around that '+' (ctx:VxV)
162: FILE: drivers/staging/rtl8723bs/core/rtw_ieee80211.c:649:
+			cnt += in_ie[cnt+1]+2;  /* get next */
 			                   ^

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ieee80211.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
index eb2058f2d139..a0d664e254a8 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
@@ -645,8 +645,8 @@ void rtw_get_sec_ie(u8 *in_ie, uint in_len, u8 *rsn_ie, u16 *rsn_len, u8 *wpa_ie
 			if (wpa_ie)
 				memcpy(wpa_ie, &in_ie[cnt], in_ie[cnt+1]+2);
 
-			*wpa_len = in_ie[cnt+1]+2;
-			cnt += in_ie[cnt+1]+2;  /* get next */
+			*wpa_len = in_ie[cnt + 1] + 2;
+			cnt += in_ie[cnt + 1] + 2;  /* get next */
 		} else {
 			if (authmode == WLAN_EID_RSN) {
 				if (rsn_ie)
-- 
2.20.1

