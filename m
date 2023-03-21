Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795212FB3
	for <linux-staging@lists.linux.dev>; Tue, 21 Mar 2023 10:41:27 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id c18so15517607ple.11
        for <linux-staging@lists.linux.dev>; Tue, 21 Mar 2023 03:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679395287;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NutowQWWvA8KzD6Imc6Lpq5s6FGUF1181fRYLY+sn0c=;
        b=ElvNgyrNA3hMhZ9l2m9W7JfLg9JlIpDKzxPUaf9kMs3n+9HTAfg81J3J8deZsf/Dm5
         n6dNDL2CO8SJLpg9FLhksnhkW/wnVDIkydlCvUIX3oE7D/1KdxjfKHolXyaWG/TYNTn2
         svXM4ykgAIG+wdwbu6UighNOGC4eN812pixRXeEL/yoGIah+KuSU+baZhxlerq+fGn1B
         sM4HAhYT4c0tcHuqZyueipwfPWEGo6SGlF5fH7U3ZPMbSQ2flfGk0Is9uYSylYUqUd43
         Y488e/zurwMZ5zKtFx213mbo3ULxg0HoHHVIIv9EdodnVhHcoM5KrWFI+peMHlWz2aU0
         6E5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679395287;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NutowQWWvA8KzD6Imc6Lpq5s6FGUF1181fRYLY+sn0c=;
        b=EQETzkjDf/gcbi4ShAh2uG45D22va9vvHVIxYXMHQuYqAUip5VnlHK8JVPndrkfRsv
         mxnuQ/nd5Amfde/obUJMWmEh/LePAibCRcPu3ytppXcwegzJbJa118bs0o0Fu9gAqabq
         D+DAJN7Jsjqh3d1lfBUUR3lEJCzuGlJw5pjVxM2TGIykAVCjLGMaeYxrUj9KzKoMrJHf
         Bfr3EACAQBK0xUzYi26s1aU3E2em5iHTXhgRMJE2HqCNm21olLwpXO5BaLCgVJC9EHdc
         5iUgWOvOh3tfyH3oIwK0hxRg1ZvkGDCEbKckd0EYOSVRp2+d8OwSsOP7ID6g7JrpV4wa
         S/qQ==
X-Gm-Message-State: AO0yUKUJMlq1TCrR9RSGGFje8aeCzsbwi+nRnApL8v/X/P6eA8R1CHOJ
	DSSuSA6Vs/uj3Vr5nc6UFSx6Gnm7Tw==
X-Google-Smtp-Source: AK7set/9dXpPINDmGeABMc+s359MyB2wzfm95K5K0nSmVUYdbfVnlrlykcOrFSM62PgBGVQwqcXJag==
X-Received: by 2002:a17:902:e891:b0:19e:5965:8694 with SMTP id w17-20020a170902e89100b0019e59658694mr2100517plg.60.1679395286578;
        Tue, 21 Mar 2023 03:41:26 -0700 (PDT)
Received: from mehmed-HP-Pavilion-Laptop-15-eh2xxx ([2401:4900:1c19:e99d:c9dc:9d9e:85b3:1d9e])
        by smtp.gmail.com with ESMTPSA id s14-20020a170902a50e00b00194d2f14ef0sm8363132plq.23.2023.03.21.03.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 03:41:26 -0700 (PDT)
Date: Tue, 21 Mar 2023 16:11:22 +0530
From: Inshal Khan <kziaul123@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] Staging: rtl8712: Remove redundant parentheses and improve
 macro definition
Message-ID: <ZBmJ0luUeoX/uhZp@mehmed-HP-Pavilion-Laptop-15-eh2xxx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This commit simplifies the code in the ieee80211 and osdep_intf modules by
removing unnecessary parentheses and improving the readability and avoiding
any unexpected as well as operator preceedence side effects of RND4 macro.
These changes improve the robustness of the driver and make it easier to
maintain going forward.

Signed-off-by: Inshal Khan <kziaul123@gmail.com>
---
 drivers/staging/rtl8712/ieee80211.c  | 10 +++++-----
 drivers/staging/rtl8712/osdep_intf.h |  5 ++++-
 2 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8712/ieee80211.c b/drivers/staging/rtl8712/ieee80211.c
index 7d8f1a29d18a..85e698c2126d 100644
--- a/drivers/staging/rtl8712/ieee80211.c
+++ b/drivers/staging/rtl8712/ieee80211.c
@@ -63,8 +63,8 @@ uint r8712_is_cckrates_included(u8 *rate)
 	u32 i = 0;
 
 	while (rate[i] != 0) {
-		if ((((rate[i]) & 0x7f) == 2) || (((rate[i]) & 0x7f) == 4) ||
-		    (((rate[i]) & 0x7f) == 11) || (((rate[i]) & 0x7f) == 22))
+		if (((rate[i] & 0x7f) == 2) || ((rate[i] & 0x7f) == 4) ||
+		    ((rate[i] & 0x7f) == 11) || ((rate[i] & 0x7f) == 22))
 			return true;
 		i++;
 	}
@@ -76,8 +76,8 @@ uint r8712_is_cckratesonly_included(u8 *rate)
 	u32 i = 0;
 
 	while (rate[i] != 0) {
-		if ((((rate[i]) & 0x7f) != 2) && (((rate[i]) & 0x7f) != 4) &&
-		    (((rate[i]) & 0x7f) != 11)  && (((rate[i]) & 0x7f) != 22))
+		if (((rate[i] & 0x7f) != 2) && ((rate[i] & 0x7f) != 4) &&
+		    ((rate[i] & 0x7f) != 11)  && ((rate[i] & 0x7f) != 22))
 			return false;
 		i++;
 	}
@@ -147,7 +147,7 @@ static uint r8712_get_rateset_len(u8 *rateset)
 	uint i = 0;
 
 	while (1) {
-		if ((rateset[i]) == 0)
+		if (rateset[i] == 0)
 			break;
 		if (i > 12)
 			break;
diff --git a/drivers/staging/rtl8712/osdep_intf.h b/drivers/staging/rtl8712/osdep_intf.h
index 9e75116c987e..3d4f82cc60f9 100644
--- a/drivers/staging/rtl8712/osdep_intf.h
+++ b/drivers/staging/rtl8712/osdep_intf.h
@@ -17,7 +17,10 @@
 #include "osdep_service.h"
 #include "drv_types.h"
 
-#define RND4(x)	(((x >> 2) + ((x & 3) != 0)) << 2)
+#define RND4(x) ({ \
+		typeof(x) _x = (x); \
+		(((_x) + 3) & ~3); \
+		})
 
 struct intf_priv {
 	u8 *intf_dev;
-- 
2.34.1

