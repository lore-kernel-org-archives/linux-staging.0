Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C77F3FC8
	for <linux-staging@lists.linux.dev>; Wed, 22 Sep 2021 20:05:54 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id d21so10284112wra.12
        for <linux-staging@lists.linux.dev>; Wed, 22 Sep 2021 13:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VJkcpqLnzjZnnA5rvx4w3eTJYY2j/84Osno+0Usot4s=;
        b=TiLIVNHQJ0LLrs1e4y7ag2Nl0PoOlnajHByhc4halOLwGsyWWNwMSSeYecOx40mK11
         USj2eGpGI/EjqlUnbm1arwv1um96AUGV3QiNSdmKFuVVlGy5pz4TCIrlWLePQbbvWUYp
         lCnXaIDJYlCeWYdV5XwfarsZJ13mQyjegjprY2MU/R7KKFm5U221WIfrPdzU5BRgt7gj
         tpPGh96xEAlt9L8B/ICxHiDHAupydj29qPR0k/NYy4i2D9aj6wr9Uzs+xEKLyirPPEU7
         NQYscbxmf4kKYi4yNc8xCi+4Ipxb0jQziWu9cCbrCBPxmJ39oohoTTmqBXDnRIT7xQng
         fDkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VJkcpqLnzjZnnA5rvx4w3eTJYY2j/84Osno+0Usot4s=;
        b=DCRxt/RJ+I9Hgnfnp3UYH3Nu0VdqBznJMcWHmbT+bczGAIXVSyY42aw1bw8zKdeOc/
         Yq0up4OIGcJgg9eRradpjXqOrqtRiHuhWnjbEevFqAIjB+z9kq4im2HsiHsv0a5pKUNC
         MmGUuEC8zg187qnjgnlU3m1BqxEz+NGZfk25AYFBQ7O0um8cQ7+oXaCQKN5f568DSCLe
         AbaQp0v5Ds1aWv56E6Q+bS98OoC9ZDu1QmS8gxkpKW6ndk/46/wbZ6DZp8x4CIt3Envt
         qLiD6yLMxoxOHgYQgPAl0qR6f45w7NVp6lmLqUTvwIpIJecEovuB/kINDoOWkK8XL/6N
         dzug==
X-Gm-Message-State: AOAM531KMOmI5w4CaOKiMoP1UA5T0cnU+cpPLKmhPeetc6j9YA6ZCnsA
	bxR/0Ll0KNNJoChvuU81fss=
X-Google-Smtp-Source: ABdhPJwf7OilZozm1mkBD8VbwcSXrNNWZP0mkunmyN3DTjNcUqM+EzrtiyulyKuM+cVP4iDu87X04A==
X-Received: by 2002:adf:fe08:: with SMTP id n8mr923951wrr.246.1632341152877;
        Wed, 22 Sep 2021 13:05:52 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::cde])
        by smtp.gmail.com with ESMTPSA id e2sm3219761wra.40.2021.09.22.13.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 13:05:52 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 30/47] staging: r8188eu: remove action_public_str()
Date: Wed, 22 Sep 2021 22:04:03 +0200
Message-Id: <20210922200420.9693-31-straube.linux@gmail.com>
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

Function action_public_str() is not used, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_ieee80211.c | 26 --------------------
 drivers/staging/r8188eu/include/ieee80211.h  |  1 -
 2 files changed, 27 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_ieee80211.c b/drivers/staging/r8188eu/core/rtw_ieee80211.c
index 5f8bd8cd886d..7dc40d6a5de1 100644
--- a/drivers/staging/r8188eu/core/rtw_ieee80211.c
+++ b/drivers/staging/r8188eu/core/rtw_ieee80211.c
@@ -1495,29 +1495,3 @@ int rtw_action_frame_parse(const u8 *frame, u32 frame_len, u8 *category, u8 *act
 
 	return true;
 }
-
-static const char *_action_public_str[] = {
-	"ACT_PUB_BSSCOEXIST",
-	"ACT_PUB_DSE_ENABLE",
-	"ACT_PUB_DSE_DEENABLE",
-	"ACT_PUB_DSE_REG_LOCATION",
-	"ACT_PUB_EXT_CHL_SWITCH",
-	"ACT_PUB_DSE_MSR_REQ",
-	"ACT_PUB_DSE_MSR_RPRT",
-	"ACT_PUB_MP",
-	"ACT_PUB_DSE_PWR_CONSTRAINT",
-	"ACT_PUB_VENDOR",
-	"ACT_PUB_GAS_INITIAL_REQ",
-	"ACT_PUB_GAS_INITIAL_RSP",
-	"ACT_PUB_GAS_COMEBACK_REQ",
-	"ACT_PUB_GAS_COMEBACK_RSP",
-	"ACT_PUB_TDLS_DISCOVERY_RSP",
-	"ACT_PUB_LOCATION_TRACK",
-	"ACT_PUB_RSVD",
-};
-
-const char *action_public_str(u8 action)
-{
-	action = (action >= ACT_PUBLIC_MAX) ? ACT_PUBLIC_MAX : action;
-	return _action_public_str[action];
-}
diff --git a/drivers/staging/r8188eu/include/ieee80211.h b/drivers/staging/r8188eu/include/ieee80211.h
index d64358ab8503..c6acb48059f7 100644
--- a/drivers/staging/r8188eu/include/ieee80211.h
+++ b/drivers/staging/r8188eu/include/ieee80211.h
@@ -1181,6 +1181,5 @@ u16 rtw_mcs_rate(u8 rf_type, u8 bw_40MHz, u8 short_GI_20, u8 short_GI_40,
 
 int rtw_action_frame_parse(const u8 *frame, u32 frame_len, u8 *category,
 			   u8 *action);
-const char *action_public_str(u8 action);
 
 #endif /* IEEE80211_H */
-- 
2.33.0

