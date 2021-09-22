Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C89363FC9
	for <linux-staging@lists.linux.dev>; Wed, 22 Sep 2021 20:06:01 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id d6so10292029wrc.11
        for <linux-staging@lists.linux.dev>; Wed, 22 Sep 2021 13:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YJNghPoHOove76hh2URD2RvudIykHuzA7svrBXn3LBk=;
        b=gHaMg5ELpj+rzpcl9d5o2rYtxDBtOQbdTo0rVNB/l0gIrUPKS4WVrTPU9lmIJ+bPqo
         KOX8EZNH88e0pPjBI/oT8BGujMklXI6ePbQx1Oq3URQmEUHRD+8YgZUA5Lob2onVyLJ+
         Z2lydoxF9qdeKlZzFxQvDxhNWZCSIjlCN1438EE/Ump93eZAMXp6iWYCq/AthYb5G07a
         eRuBf+cpBmoGDBR1PRx0fx0jeipvO5j9P0yQ4ubZ88Bx19CXzJ79ZIHtvrbuyDgVjyVV
         Q1mqN4fDg69bTCQ2lR9TLswg1Q3bZa0FXeMWmvigV6wbgyTUSqsf43F74PKQ7PDa5R9P
         AXeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YJNghPoHOove76hh2URD2RvudIykHuzA7svrBXn3LBk=;
        b=ja08/g2+3ncb4DX3pgPfULk22CS12Ox9fNB/gINfckZwm539Hbsc04S2UokNyEJ15x
         twd3qUQYC8coziop3amEg7x7Hf5QQ3lsoqs1cdphzfjXBjUrxICGf72PrHVZEO3I7q4B
         n4MSeWx4axnve+FY8mi1NgWm63R3hw3e/rF9bkwcuO2XMJPIujHfZtlvixX2F0eaJuyv
         6XdRivid7gqVCh9ZCtb2mih6Ygmxa0cUYEX2Mc7lnnGQl7OvZD8tkH2SmgO+GEnh+UnL
         KfWsl0SFF29DTXaGhhZrrwEO5NxV8HBheVC2f8gFiJFqI5EfhvAhyZ01FOulJAHdmwnh
         HZlg==
X-Gm-Message-State: AOAM530B1gO8aMLLg9jtvY+A9VPKVABd5HhogEqd6zzphQ+ztLakLits
	1OtOTuqadBNa1Ui+U4jJgwM=
X-Google-Smtp-Source: ABdhPJyBUQqzBSFb8Q+ZDVWiVqxYUllG4c1NBKx9efKz4/k/UEvOcffpk4u9YVeWF1QOOzjIRL2a0g==
X-Received: by 2002:a1c:4406:: with SMTP id r6mr12427193wma.150.1632341160231;
        Wed, 22 Sep 2021 13:06:00 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::cde])
        by smtp.gmail.com with ESMTPSA id e2sm3219761wra.40.2021.09.22.13.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 13:05:59 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 40/47] staging: r8188eu: remove rtw_set_ie_secondary_ch_offset()
Date: Wed, 22 Sep 2021 22:04:13 +0200
Message-Id: <20210922200420.9693-41-straube.linux@gmail.com>
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

Function rtw_set_ie_secondary_ch_offset() is not used, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_ieee80211.c | 5 -----
 drivers/staging/r8188eu/include/ieee80211.h  | 2 --
 2 files changed, 7 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_ieee80211.c b/drivers/staging/r8188eu/core/rtw_ieee80211.c
index cc053a5d0f01..343c2f9a4ce8 100644
--- a/drivers/staging/r8188eu/core/rtw_ieee80211.c
+++ b/drivers/staging/r8188eu/core/rtw_ieee80211.c
@@ -140,11 +140,6 @@ u8 *rtw_set_ie
 	return pbuf + len + 2;
 }
 
-inline u8 *rtw_set_ie_secondary_ch_offset(u8 *buf, u32 *buf_len, u8 secondary_ch_offset)
-{
-	return rtw_set_ie(buf, WLAN_EID_SECONDARY_CHANNEL_OFFSET,  1, &secondary_ch_offset, buf_len);
-}
-
 /*----------------------------------------------------------------------------
 index: the information element id index, limit is the limit for search
 -----------------------------------------------------------------------------*/
diff --git a/drivers/staging/r8188eu/include/ieee80211.h b/drivers/staging/r8188eu/include/ieee80211.h
index d97ba27f7f72..f0d5a640143f 100644
--- a/drivers/staging/r8188eu/include/ieee80211.h
+++ b/drivers/staging/r8188eu/include/ieee80211.h
@@ -1095,8 +1095,6 @@ enum secondary_ch_offset {
 	SCA = 1, /* secondary channel above */
 	SCB = 3,  /* secondary channel below */
 };
-u8 *rtw_set_ie_secondary_ch_offset(u8 *buf, u32 *buf_len,
-				   u8 secondary_ch_offset);
 
 u8 *rtw_get_ie(u8 *pbuf, int index, int *len, int limit);
 
-- 
2.33.0

