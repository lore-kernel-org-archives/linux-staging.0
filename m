Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6FC53A3;
	Wed, 19 Oct 2022 19:31:13 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id z20so18199440plb.10;
        Wed, 19 Oct 2022 12:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+QM1RVijKOjtLzd+GJ+CVT6xe047a5u1xhBsLiuogqI=;
        b=GIxNBmtFP0FYW2Kws+nZniM3JJX2TCfuwct7Nj0h08LRD8PVgwPBQrJEbW5QZGCQmH
         I5Mp52dZBT9/xHAXVVYEywCF1qF4WtWa07MmMlPAdks7OvyUHeNj2tYgJNlNqw1IJd2L
         9XEWY30nzAtFWzgq+RrDax4ACOTKo4eYSonIfhEA0apNHaTHkW8ysEdzDPZvtivtqQnJ
         sDasXhFi0435UK7B8RGlcWYJOTgL1AKpfsF3K9s2o2JtG58ncs/qutc3wTYzR+WY10YY
         R5DFZWQVxrlLxENYdB1lROQ2aRHbT/yYQ44TEKdZ2HmZuwOmzgXhBV+dhYOD5jiAvc23
         azEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+QM1RVijKOjtLzd+GJ+CVT6xe047a5u1xhBsLiuogqI=;
        b=3Cu23d61XjTO7a22dBb9wPU09s1FE053JaqKl2S9nKc5wr87WAyW1Ux6OPwoEF6XIE
         JJXWRnd+C0IfWRRVCHWZBOwXxaUlkqMNb+69CCxwHMu4kOX87+0c20XdckV4XB0LxjFu
         A9TOzUF5BZZXC3ED8lwyYfSZHk8mnPCxiRRgOv0G+pMYs6HuO9MlcfIeu+RRRw6D5KDC
         8KImv0V6eAGZ8klWWrJP2LQAs9bSoKp9V8scUCRAF1DcekcTOafYebmBJOTsTLr1MEdA
         vSscsVBvjahZd1Mb5lN3b0ACBSuSoOksD4YBMU9sNa8KLBRLx95R8lRboNIBI/yiPVhH
         qtsg==
X-Gm-Message-State: ACrzQf2wwV7PUwQZhZOtwjzbTPJ04T3rKX6oKzlRcvCiZYgCmj8A3HaH
	jy0InGFx9JKq3NoeTqYlc3GXbTxccfhstQ==
X-Google-Smtp-Source: AMsMyM4k0YO+I0kmDM92aBNf8vpquGWSy+QJYPjTVZoGdTtbOmF+Bi5apjDhoyDjR0d9HY3hwBdzGQ==
X-Received: by 2002:a17:90b:3b50:b0:20d:93f3:9c8d with SMTP id ot16-20020a17090b3b5000b0020d93f39c8dmr44983053pjb.150.1666207872673;
        Wed, 19 Oct 2022 12:31:12 -0700 (PDT)
Received: from marshmallow (192-184-163-51.fiber.dynamic.sonic.net. [192.184.163.51])
        by smtp.gmail.com with ESMTPSA id y126-20020a62ce84000000b0056885e0b273sm1902020pfg.8.2022.10.19.12.31.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Oct 2022 12:31:12 -0700 (PDT)
Date: Wed, 19 Oct 2022 12:31:10 -0700
From: Emily Peri <eperi1024@gmail.com>
To: outreachy@lists.linux.dev
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: Removed extra tabs in conditional
 statements
Message-ID: <Y1BQfiwOXzAZpCCa@marshmallow>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

checkpatch found extra tabs in two conditional statements in
rtw_ieee80211.c. Should be one tab instead of two.

Signed-off-by: Emily Peri <eperi1024@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ieee80211.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
index 3d8a64f69448..30e7457a9c31 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
@@ -1063,18 +1063,18 @@ void rtw_get_bcn_info(struct wlan_network *pnetwork)
 	/* parsing HT_CAP_IE */
 	p = rtw_get_ie(pnetwork->network.ies + _FIXED_IE_LENGTH_, WLAN_EID_HT_CAPABILITY, &len, pnetwork->network.ie_length - _FIXED_IE_LENGTH_);
 	if (p && len > 0) {
-			pht_cap = (struct ieee80211_ht_cap *)(p + 2);
-			pnetwork->bcn_info.ht_cap_info = le16_to_cpu(pht_cap->cap_info);
+		pht_cap = (struct ieee80211_ht_cap *)(p + 2);
+		pnetwork->bcn_info.ht_cap_info = le16_to_cpu(pht_cap->cap_info);
 	} else {
-			pnetwork->bcn_info.ht_cap_info = 0;
+		pnetwork->bcn_info.ht_cap_info = 0;
 	}
 	/* parsing HT_INFO_IE */
 	p = rtw_get_ie(pnetwork->network.ies + _FIXED_IE_LENGTH_, WLAN_EID_HT_OPERATION, &len, pnetwork->network.ie_length - _FIXED_IE_LENGTH_);
 	if (p && len > 0) {
-			pht_info = (struct HT_info_element *)(p + 2);
-			pnetwork->bcn_info.ht_info_infos_0 = pht_info->infos[0];
+		pht_info = (struct HT_info_element *)(p + 2);
+		pnetwork->bcn_info.ht_info_infos_0 = pht_info->infos[0];
 	} else {
-			pnetwork->bcn_info.ht_info_infos_0 = 0;
+		pnetwork->bcn_info.ht_info_infos_0 = 0;
 	}
 }
 
-- 
2.34.1

