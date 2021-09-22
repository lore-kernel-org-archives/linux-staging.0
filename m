Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EFAB3FD1
	for <linux-staging@lists.linux.dev>; Wed, 22 Sep 2021 20:05:56 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id d6so10291445wrc.11
        for <linux-staging@lists.linux.dev>; Wed, 22 Sep 2021 13:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gBFbr5PFWkp2zLyHuCpLtPmPZAWt0KLE/rWvpz0fVXI=;
        b=FnA/zt16amU76xOoG2QWucTBIE9RuXjm7FCmOPZHJt2AjvnLJn2GSV1kd7tbhxBIN9
         /au2SQyprP9mKzF7BDoWFaZdj5+1uLBWg0DMsMhHpNBHAr3klz1ewkbjLzGyz5SKg3K9
         mlEHXfGcxh+ziU14zSJxsWbjWXnxv4gIXvq3POxEiYVOQaHOBWCsEuN0XKjZn5lqzIaL
         +OmoXCHz4SvZU07/A45x5bkdWOypjExUtS6YUeVhwj5yepc6B0vpe3cCAV/boPkTpMl8
         548M43C5gVATeMlemWVsuV4XFOE11KDF4oSAe5Yx7HkDzxnhAahI66CVwSkW/+zwyYbb
         w7xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gBFbr5PFWkp2zLyHuCpLtPmPZAWt0KLE/rWvpz0fVXI=;
        b=ln5tZaABWHn971C8Yp274zd57FZG6eMAE4OzDiNVRNDvQbxXhiAOsKhRs2yGNjaIT1
         G1x0d4lhSFnKoeKeYPpdMM4D7UJ6MWw2H/m/4a7KcqfoP38gP1AeCBTB63zLUvpNJy4r
         hlxAwFqy+d2BaPg01VbyE99VspmQ0Ul36UggVSBrFbd4XzDGXwtg90S0j4c+sXFzyln7
         IH/PMLv5gPKi3brXYvu9pgggDljtV6lshgOid2cqdM/kKs+mHVonraW402ExxmU6hS8f
         V4MLagp5Yx+FmGULYDQTn4BLgSkoDeldA3dNLy6uWh4flCJx7hFJBJWbR7Gh8xis/F+d
         e9Eg==
X-Gm-Message-State: AOAM530jKjFLqt14AgvENvRt4v7qoVDsPwyb9tyMoH1oN9MzIx7TPJMa
	MywmxmrXd7B0vKBiuOefQHE=
X-Google-Smtp-Source: ABdhPJwHsIyEN18Fu0WjbM/YuU4HrXEuUltQ/p4XCT5aj3pAFPk4CzyDxWFGM7feF2ECbo7bvexNQg==
X-Received: by 2002:a5d:5229:: with SMTP id i9mr839804wra.373.1632341155096;
        Wed, 22 Sep 2021 13:05:55 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::cde])
        by smtp.gmail.com with ESMTPSA id e2sm3219761wra.40.2021.09.22.13.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 13:05:54 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 33/47] staging: r8188eu: remove secondary_ch_offset_to_hal_ch_offset()
Date: Wed, 22 Sep 2021 22:04:06 +0200
Message-Id: <20210922200420.9693-34-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210922200420.9693-1-straube.linux@gmail.com>
References: <20210922200420.9693-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function secondary_ch_offset_to_hal_ch_offset() is not used, remove
it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_ieee80211.c | 12 ------------
 drivers/staging/r8188eu/include/ieee80211.h  |  1 -
 2 files changed, 13 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_ieee80211.c b/drivers/staging/r8188eu/core/rtw_ieee80211.c
index 9379beeccede..3f0c1a78ccb1 100644
--- a/drivers/staging/r8188eu/core/rtw_ieee80211.c
+++ b/drivers/staging/r8188eu/core/rtw_ieee80211.c
@@ -151,18 +151,6 @@ inline u8 *rtw_set_ie_ch_switch(u8 *buf, u32 *buf_len, u8 ch_switch_mode,
 	return rtw_set_ie(buf, WLAN_EID_CHANNEL_SWITCH,  3, ie_data, buf_len);
 }
 
-inline u8 secondary_ch_offset_to_hal_ch_offset(u8 ch_offset)
-{
-	if (ch_offset == SCN)
-		return HAL_PRIME_CHNL_OFFSET_DONT_CARE;
-	else if (ch_offset == SCA)
-		return HAL_PRIME_CHNL_OFFSET_UPPER;
-	else if (ch_offset == SCB)
-		return HAL_PRIME_CHNL_OFFSET_LOWER;
-
-	return HAL_PRIME_CHNL_OFFSET_DONT_CARE;
-}
-
 inline u8 *rtw_set_ie_secondary_ch_offset(u8 *buf, u32 *buf_len, u8 secondary_ch_offset)
 {
 	return rtw_set_ie(buf, WLAN_EID_SECONDARY_CHANNEL_OFFSET,  1, &secondary_ch_offset, buf_len);
diff --git a/drivers/staging/r8188eu/include/ieee80211.h b/drivers/staging/r8188eu/include/ieee80211.h
index 2545d7ca82d9..8df83481bf47 100644
--- a/drivers/staging/r8188eu/include/ieee80211.h
+++ b/drivers/staging/r8188eu/include/ieee80211.h
@@ -1099,7 +1099,6 @@ enum secondary_ch_offset {
 	SCA = 1, /* secondary channel above */
 	SCB = 3,  /* secondary channel below */
 };
-u8 secondary_ch_offset_to_hal_ch_offset(u8 ch_offset);
 u8 *rtw_set_ie_ch_switch(u8 *buf, u32 *buf_len, u8 ch_switch_mode,
 			 u8 new_ch, u8 ch_switch_cnt);
 u8 *rtw_set_ie_secondary_ch_offset(u8 *buf, u32 *buf_len,
-- 
2.33.0

