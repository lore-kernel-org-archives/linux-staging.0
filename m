Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC4E70
	for <linux-staging@lists.linux.dev>; Sun,  4 Apr 2021 14:10:41 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id j18so8771263wra.2
        for <linux-staging@lists.linux.dev>; Sun, 04 Apr 2021 07:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=H7gV2Io75BmHpwhQaw6NovithxcDv0ix+Sn60I7HwJo=;
        b=OLM2g/sC2sRgrL6by+LFbhGXdMOYTRlVRGpBoL1+C0iyDrogXbbaegNmL9t6KMH7Yl
         Qw+agDzmfHlOYLB8JNgtxFYns7e9hVcQR+kG5kdM5n4owFIl58uQwZUC1Ic9UZa4a5O+
         p+oNXA9OcABwM9tqgXThGTAS6nuAyNYqnSkayHHbO81NkWIdyOBK0JEXCBVDr0LM+egN
         7m6JbGiWscQnHOZrR+4lg5acJcV7ib0Z9LB71tlk0/0yOfBXV7hGERR7/TMRU3RbiQoF
         GkwHbQLUq6uDjauhfZHPMZ5LzWnsUG7bS/WgzkvqXhtxFaWBBNlAwZzQO7ngaRlOVLv9
         PCow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=H7gV2Io75BmHpwhQaw6NovithxcDv0ix+Sn60I7HwJo=;
        b=Hm2rj8d+QsfT9kMqPDZc0HU1m+cdrmA506i/LKvjBhspanjsNrBHpKBsgo6E+SIfKO
         NTdhTf83jtJb1IPFA4ipGvKQIsTFJh4txR9VUjk8/r9T0Za+EGTrKN7T8vYePAKbtF1a
         bTybNxZuu+/f/bxdWMvMU2P+jKi9PYy62Y0E0kpCAhJvMEvPlRfhAKMdUv9z8751pGWA
         Z6xs4k+uZFa/5822D0OiSwp425eLUV96MvQImw24Q5IaP2uyLI/zscei/cx3JBLt6Sgp
         hujIiny0z0ejeIcPBf7SwaWaYKpdPy3pe1/JMMT26i16GXc64kuO3cKidPN0lkEZrnJC
         FHqQ==
X-Gm-Message-State: AOAM5337oW9B71u8IkscMACoFpSsKmrEY+q2LtgG9I51nH7DdBIRppe5
	dOLbqZGtWeiDMtzHLQGTZNg=
X-Google-Smtp-Source: ABdhPJwaQt8xyr7nbxAYdSdpj0FhMdHLQbMIHGVqXd3bc8zOuEeXtqbmLHVhcNoSle4KUC4xFCUXgg==
X-Received: by 2002:adf:fbc8:: with SMTP id d8mr25080769wrs.94.1617545440071;
        Sun, 04 Apr 2021 07:10:40 -0700 (PDT)
Received: from agape ([5.171.81.112])
        by smtp.gmail.com with ESMTPSA id k13sm28725987wri.27.2021.04.04.07.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Apr 2021 07:10:39 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH v4 30/30] staging: rtl8723bs: add spaces around operators in core/rtw_ieee80211.c
Date: Sun,  4 Apr 2021 16:09:46 +0200
Message-Id: <1b5ee3d974c336e20f034d5de449fc29967a6213.1617545239.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617545239.git.fabioaiuto83@gmail.com>
References: <cover.1617545239.git.fabioaiuto83@gmail.com>
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

