Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2B423FC8
	for <linux-staging@lists.linux.dev>; Wed, 22 Sep 2021 20:05:55 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id g16so10445969wrb.3
        for <linux-staging@lists.linux.dev>; Wed, 22 Sep 2021 13:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jzpb6fJs45vqwIx5ZuDi+xk1ZoJWj5oWD4/3xrjT52c=;
        b=IenqC1VXJ+1OXfXOBWg9iLNpVymqEdI+UOmAYUEFhEdwf/vwfh0JuUKix3nQy2+17n
         junUqvMgI9IltfA40CI1ZhR2YFlciaTD+aiNu8vfrCc10+eMjdREj9He2LuZ5RmoGW6O
         ADrvaztz27BZF8ZgVZwQMrufdTUw5Zog1eCqNb7aNhRJKN6uKKf30GXk+oUQ4kYUz2ck
         lbgOm0ovy2r0XcqiaHFmG2fxNOL1VtN2Ck8oEbYaAM4/HYmnT6wrbGoQ307r4ADNuGMb
         jpK7cuHitt40eEdu5I3dybygUlh4PQFFclQsooZFy3VrNM3nQoulPWrdsEeKRvajS9q4
         j0Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jzpb6fJs45vqwIx5ZuDi+xk1ZoJWj5oWD4/3xrjT52c=;
        b=Gb16RB7BBaFz38pToxWiof6FbHlHz5Uu3EX8OVCyQSGrf0DQFvjXz13NI6u+Lm8ZXe
         cn9P4Kz8p8fS2UMVftXtRI934+khDYzVAn12M3hhcjbuiksP+JCuP1zDc1BLEcD4MNzQ
         W+ILDq6bOMIqwaxen9zRYOjTqSNafTknyeiSJ4HN8E+qVb+f/jp1Fq3ZzudMynkwsRoI
         7N8QZvDq6ky+Zybs5qvB2ZgW7UnsrlRqCqKgUV9xepT/E8lzwTcuFj2mR2IuwrYkQhP6
         hq4FauTtUu5BBW76gezGXJI8ghEXyEo6R8maTzB6fTPTvGoqLJPAMwljmOcuDWIu2PLz
         lkoA==
X-Gm-Message-State: AOAM530avsRdZihXCki6CeC2NQQQDczUjlJPIoPnnlvJ9nSjdjv2ARWU
	6Z7D0cYTXYOUU1EAYk1j+9M=
X-Google-Smtp-Source: ABdhPJzID3D9VByICdfGpTpa20XsYymyCm7xnw6fT+Ym9/TxmfbKdWnBeRz75gqHTxsOY96mTMGl2A==
X-Received: by 2002:adf:e5c5:: with SMTP id a5mr891026wrn.290.1632341154352;
        Wed, 22 Sep 2021 13:05:54 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::cde])
        by smtp.gmail.com with ESMTPSA id e2sm3219761wra.40.2021.09.22.13.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 13:05:54 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 32/47] staging: r8188eu: remove hal_ch_offset_to_secondary_ch_offset()
Date: Wed, 22 Sep 2021 22:04:05 +0200
Message-Id: <20210922200420.9693-33-straube.linux@gmail.com>
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

Function hal_ch_offset_to_secondary_ch_offset() is not used, remove
it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_ieee80211.c | 12 ------------
 drivers/staging/r8188eu/include/ieee80211.h  |  1 -
 2 files changed, 13 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_ieee80211.c b/drivers/staging/r8188eu/core/rtw_ieee80211.c
index 182164e17b3f..9379beeccede 100644
--- a/drivers/staging/r8188eu/core/rtw_ieee80211.c
+++ b/drivers/staging/r8188eu/core/rtw_ieee80211.c
@@ -163,18 +163,6 @@ inline u8 secondary_ch_offset_to_hal_ch_offset(u8 ch_offset)
 	return HAL_PRIME_CHNL_OFFSET_DONT_CARE;
 }
 
-inline u8 hal_ch_offset_to_secondary_ch_offset(u8 ch_offset)
-{
-	if (ch_offset == HAL_PRIME_CHNL_OFFSET_DONT_CARE)
-		return SCN;
-	else if (ch_offset == HAL_PRIME_CHNL_OFFSET_LOWER)
-		return SCB;
-	else if (ch_offset == HAL_PRIME_CHNL_OFFSET_UPPER)
-		return SCA;
-
-	return SCN;
-}
-
 inline u8 *rtw_set_ie_secondary_ch_offset(u8 *buf, u32 *buf_len, u8 secondary_ch_offset)
 {
 	return rtw_set_ie(buf, WLAN_EID_SECONDARY_CHANNEL_OFFSET,  1, &secondary_ch_offset, buf_len);
diff --git a/drivers/staging/r8188eu/include/ieee80211.h b/drivers/staging/r8188eu/include/ieee80211.h
index 09d27a0b6476..2545d7ca82d9 100644
--- a/drivers/staging/r8188eu/include/ieee80211.h
+++ b/drivers/staging/r8188eu/include/ieee80211.h
@@ -1100,7 +1100,6 @@ enum secondary_ch_offset {
 	SCB = 3,  /* secondary channel below */
 };
 u8 secondary_ch_offset_to_hal_ch_offset(u8 ch_offset);
-u8 hal_ch_offset_to_secondary_ch_offset(u8 ch_offset);
 u8 *rtw_set_ie_ch_switch(u8 *buf, u32 *buf_len, u8 ch_switch_mode,
 			 u8 new_ch, u8 ch_switch_cnt);
 u8 *rtw_set_ie_secondary_ch_offset(u8 *buf, u32 *buf_len,
-- 
2.33.0

