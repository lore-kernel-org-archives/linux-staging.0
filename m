Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3856D32
	for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 18:12:07 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id g5so26116025ejx.0
        for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 11:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=P8jxM6S/XYO0Pc92+s2uo/rwCS9+bnrmj4sRd9nZNb0=;
        b=p3oup2wgTENGD6cBcDzZikivQec6VBMJdGZ9BX+jMhOlbJdb0mxsNzQ8xy5au1UGcL
         xxYYkaZ4EHzvhUBFzM87qJ2CWbNhW0I2z/P8SDANTo0TAtSdbV29JH7mQVQeBjV5UHip
         EROQwmkS1cbUdV2w8bCFzKtEBDo2dLaEj9KG9UzzXmaK4sCs6tvH4LdDWzNfp0X0fVTA
         Qbfv9PPiQiVG1GW+bJQT9ZL49z6IREPi1ggofsabQOCQqrF1+VWjCw8Hz5mBRkRNpLHO
         GwbFIa6bWeg3G+NL2bXtNQ/PgUl927xTbWYgk2kSOxxHnSbaKUdhkex+cPcHl9SNe9G9
         lYcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=P8jxM6S/XYO0Pc92+s2uo/rwCS9+bnrmj4sRd9nZNb0=;
        b=uJXzJUClYJXcaSAzJPAqdjJZdhzcqZxruU+J44BDUbCYou+wf8eZxUa4eT++wp+xkS
         UExdVIq7rbSHl7H8L2Dz/2ePI/2PN4f9E/2QhmU0b1ClEsk0wR2lvTdZ2ni5KU4/pkyp
         XpjOJegBMcStxaHhZjKUTpqQCgNqbl4tWQ5zVznmV86+1ay8CHGXbuCV2zdqodcuHWTa
         GnP7b3RbIopMwRwi4DpsMWJocrhnKsOd3SIIys4DTWJvbCYLZp27tSsfmfg8rpXZIlzT
         NS+zox/eUbrLQiAU5IdhONzJoNXNA6VLmvb5+BZ4JxU3gG60QyZyL+xCbc8319KT0HhI
         LWbg==
X-Gm-Message-State: AOAM530gF3b90zKrT/5r0/MjCyLm9i5eJj+tZyDzwxq+1xc14w/+LoVo
	fWNMTveYZlpbiAuySY6VqTVO8oNKSvQ9UQ==
X-Google-Smtp-Source: ABdhPJx7lfv2ceXJQvPUlXl3aRywYg0+nv6iP3zbHvnZRua9guDLaAEkLyT24E+5Fi+/e5cASAUeYg==
X-Received: by 2002:a17:906:4352:: with SMTP id z18mr125882ejm.387.1618423925895;
        Wed, 14 Apr 2021 11:12:05 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id v1sm279493eds.17.2021.04.14.11.12.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 11:12:05 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev
Subject: [PATCH 30/57] staging: rtl8723bs: core: rtw_ieee80211: Remove seemingly pointless copy
Date: Wed, 14 Apr 2021 19:11:02 +0100
Message-Id: <20210414181129.1628598-31-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210414181129.1628598-1-lee.jones@linaro.org>
References: <20210414181129.1628598-1-lee.jones@linaro.org>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Fixes the following W=1 kernel build warning(s):

 drivers/staging/rtl8723bs/core/rtw_ieee80211.c: In function ‘rtw_ies_remove_ie’:
 drivers/staging/rtl8723bs/core/rtw_ieee80211.c:259:1: warning: the frame size of 1048 bytes is larger than 1024 bytes [-Wframe-larger-than=]

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/staging/rtl8723bs/core/rtw_ieee80211.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
index ae057eefeeb36..d8513acf4911c 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
@@ -239,12 +239,10 @@ int rtw_ies_remove_ie(u8 *ies, uint *ies_len, uint offset, u8 eid, u8 *oui, u8 o
 	while (1) {
 		target_ie = rtw_get_ie_ex(start, search_len, eid, oui, oui_len, NULL, &target_ielen);
 		if (target_ie && target_ielen) {
-			u8 buf[MAX_IE_SZ] = {0};
 			u8 *remain_ies = target_ie + target_ielen;
 			uint remain_len = search_len - (remain_ies - start);
 
-			memcpy(buf, remain_ies, remain_len);
-			memcpy(target_ie, buf, remain_len);
+			memcpy(target_ie, remain_ies, remain_len);
 			*ies_len = *ies_len - target_ielen;
 			ret = _SUCCESS;
 
-- 
2.27.0

