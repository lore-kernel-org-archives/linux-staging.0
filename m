Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A3333DC
	for <linux-staging@lists.linux.dev>; Thu, 22 Sep 2022 12:23:54 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id c7so8940839pgt.11
        for <linux-staging@lists.linux.dev>; Thu, 22 Sep 2022 05:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=Sq86kzDOcqsN5l5kHfnuCcSu+rF/jyTPvh8HDjjPPXQ=;
        b=GZcjdflzUG6u/+FDp+Ml4obgd2j6AJL2qwoyrfKOqMzkAb8n6U+AePYDmXAMV3D2wm
         n3FoTl8rExGyVWXPsfdpUEYrPGpSu/5KIs9dMVXumv+i0rkhOGIiNbkQtXMASFHjiu5U
         UPLvfCh5LHJteCoGuuXpU59YdgHUb7DE2U1KsHQV551e7Wfiy9ukS1C5zNaRojUNrbzy
         euZjri486OIYdA/O/+SKOb9uocNJKIzn4+6ZHvE04XzpAlZ2NapbA4nUwM95lJVfRhQp
         V2E9O7rZRTJgkgFsGtJrRApErqzuVq6+3B/3FFkiOeq7Jxm/XRo6+g9Ieow60QpZO4LV
         V07w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=Sq86kzDOcqsN5l5kHfnuCcSu+rF/jyTPvh8HDjjPPXQ=;
        b=LQr/sYDkj2q4HB3ws0sUK5r7pFpiYs1tepP0GxkAUHu+ox4u4+n/lYeFz+Miw9sG5W
         G+TzAlv+mS6NCEiUao7j3LTCEWva+yDhPd+JJ32em0TAAWi8ZyUFKRKjYdA31qDJSQ0j
         XSVMEkIX800DSru6TpX7MQ486T1pBd7BJDm+tIHKWjKqOU7vWhnZ61bDCHUf8m1+K2P3
         3YHRwbtyea0+zjQID39GN39vfwF9Qjk78fNA96lPt+/wEkWc4Pho5/84Up6OEx7BCYz3
         kXQHJhWYtEG4GeF/wVgm/IrFWP9q4gMLmq+IHzaQqM0gRFiNgeViGmAHTt45gG76yla6
         clmA==
X-Gm-Message-State: ACrzQf2Jqc70QXiHsanFiYMU2EPKLQbG3Jh42u5lFzuMAufF3n9PBe/M
	jCFOVlhG7Gykgahr3vCY5Jw=
X-Google-Smtp-Source: AMsMyM4nPxxmURICchfAdqEO6or8oE6xV6pqBVDmicYDJM+JQ+BpmlUVn62uLlbhRCF7RcIuJx1Uhg==
X-Received: by 2002:a05:6a00:3287:b0:542:33ca:8bce with SMTP id ck7-20020a056a00328700b0054233ca8bcemr3449307pfb.20.1663849434234;
        Thu, 22 Sep 2022 05:23:54 -0700 (PDT)
Received: from uftrace.. ([14.5.161.231])
        by smtp.gmail.com with ESMTPSA id a8-20020a170902900800b00178acc7ef16sm3942901plp.253.2022.09.22.05.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Sep 2022 05:23:53 -0700 (PDT)
From: Kang Minchul <tegongkang@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Johannes Berg <johannes.berg@intel.com>,
	Veerendranath Jakkam <quic_vjakkam@quicinc.com>,
	GUO Zihua <guozihua@huawei.com>,
	Hannes Braun <hannesbraun@mail.de>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kang Minchul <tegongkang@gmail.com>
Subject: [PATCH 4/4] staging: rtl8723bs: Add a blank line after declarations
Date: Thu, 22 Sep 2022 21:23:10 +0900
Message-Id: <20220922122310.3379711-5-tegongkang@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220922122310.3379711-1-tegongkang@gmail.com>
References: <20220922122310.3379711-1-tegongkang@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch adds a blank line in order to fix checkpatch warning

Signed-off-by: Kang Minchul <tegongkang@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 57a68f9edec7..6aeb169c6ebf 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -1849,6 +1849,7 @@ static int cfg80211_rtw_get_txpower(struct wiphy *wiphy,
 inline bool rtw_cfg80211_pwr_mgmt(struct adapter *adapter)
 {
 	struct rtw_wdev_priv *rtw_wdev_priv = adapter_wdev_data(adapter);
+
 	return rtw_wdev_priv->power_mgmt;
 }
 
@@ -1954,6 +1955,7 @@ void rtw_cfg80211_indicate_sta_assoc(struct adapter *padapter, u8 *pmgmt_frame,
 	{
 		struct station_info sinfo = {};
 		u8 ie_offset;
+
 		if (GetFrameSubType(pmgmt_frame) == WIFI_ASSOCREQ)
 			ie_offset = _ASOCREQ_IE_OFFSET_;
 		else /*  WIFI_REASSOCREQ */
-- 
2.34.1

