Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CC6F5F
	for <linux-staging@lists.linux.dev>; Fri,  2 Apr 2021 17:30:44 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id 12so2801781wmf.5
        for <linux-staging@lists.linux.dev>; Fri, 02 Apr 2021 10:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JAPYh3wLO5wVpTnW+OZ78M9DCvkkaloWIctMWkpD8UY=;
        b=FLrrateY6zeRD8tY6DW7bs1C8XUbinTGjh05hRhcIvsrD+Tg9McsNgBv7LSwcf2Asb
         64l6ngSOk0ICx2KD06OtbW4j69GPaqqRBBcJ1cez5VOEFv4kA6gbJm+OWg26ZvgLB8o6
         H2WZXlG8ynuOOKeXeW5k7mW+ctqh2+fJFGqS6cCOya8VYiBSQ7EuR+jkeOWemkRkzd3b
         Gn3zY4CZnSVe1YKf3FYRw+JoZH/ZbGC+MToxof6KlOj+F3vl4+ldpgDf7tcazOvDFPgW
         e6e6wYl0nn4L7s9AP6tfKatywjcAJ/oa8N7HcVUKMSjwNlSVqmD/GmMzVdCxvz7T1uFC
         30Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JAPYh3wLO5wVpTnW+OZ78M9DCvkkaloWIctMWkpD8UY=;
        b=SBqgt5xy0L8INOGOCDUtrDpBZL5fbTrRhoHKDy9OaPwYGJOarS2uZ5Inq+IhCarBdN
         7N23sjcr5U26IdolVP7ypmwbtpwi/mvvqhUm3sLsZ5pHtHv4mzyylKOcftvH2BwdMwVE
         ofRm94DUJFOVSQ3jC0Cq0THrowXq2N1EZ3c74Ob3ul2DxLdaPuunRxfJ4kuZdZfU728Y
         WRvP+G1PnvgvVxRcfaMSvwz4PCGDjibk6Z38s3Yrb7yCGSPloOZKF1ng6B9vMxG2cCjE
         UE47wrbxXp27uzbO0d1tIjkY0RZdj/EdKqiU3O+2mt9YGrprl2FfK2EBDBZHo8IUmLJl
         sQnw==
X-Gm-Message-State: AOAM532f3mgvBC/eUKqG9L5xTC5FzYamww8ZDVkpRoTNPseDesNqYXm0
	d7mQAF3V9gyNXwAf/V9KEV0=
X-Google-Smtp-Source: ABdhPJzcuiBOMLjGQ0tG3D8mYqOvq9e7JTvldouE+BcKh+FXIv6G0gQ0zS6AXQ3Q0fVHO0iZ6EsotA==
X-Received: by 2002:a1c:5455:: with SMTP id p21mr13672472wmi.138.1617384643110;
        Fri, 02 Apr 2021 10:30:43 -0700 (PDT)
Received: from agape ([5.171.81.4])
        by smtp.gmail.com with ESMTPSA id c2sm13042708wmr.22.2021.04.02.10.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 10:30:42 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH v2 16/30] staging: rtl8723bs: tidy up some error handling
Date: Fri,  2 Apr 2021 19:29:58 +0200
Message-Id: <4b5034466ee33e65d9fee026c7bb20f8f71bc4f9.1617384172.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617384172.git.fabioaiuto83@gmail.com>
References: <cover.1617384172.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

the RT_TRACE() output is not useful so we want to delete it. In this case
there is no cleanup for rtw_cleanbss_cmd() required or even possible. I've
deleted the RT_TRACE() output and added a goto unlock to show
that we can't continue if rtw_createbss_cmd() fails.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index e8a39519fed8..e6bced0269b1 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -815,6 +815,7 @@ void rtw_surveydone_event_callback(struct adapter	*adapter, u8 *pbuf)
 				if (rtw_select_and_join_from_scanned_queue(pmlmepriv) == _SUCCESS) {
 					_set_timer(&pmlmepriv->assoc_timer, MAX_JOIN_TIMEOUT);
 				} else {
+					u8 ret = _SUCCESS;
 					struct wlan_bssid_ex    *pdev_network = &(adapter->registrypriv.dev_network);
 					u8 *pibss = adapter->registrypriv.dev_network.MacAddress;
 
@@ -828,10 +829,11 @@ void rtw_surveydone_event_callback(struct adapter	*adapter, u8 *pbuf)
 
 					pmlmepriv->fw_state = WIFI_ADHOC_MASTER_STATE;
 
-					if (rtw_createbss_cmd(adapter) != _SUCCESS)
-						;
-
 					pmlmepriv->to_join = false;
+
+					ret = rtw_createbss_cmd(adapter);
+					if (ret != _SUCCESS)
+						goto unlock;
 				}
 			}
 		} else {
@@ -877,7 +879,7 @@ void rtw_surveydone_event_callback(struct adapter	*adapter, u8 *pbuf)
 	}
 
 	/* DBG_871X("scan complete in %dms\n", jiffies_to_msecs(jiffies - pmlmepriv->scan_start_time)); */
-
+unlock:
 	spin_unlock_bh(&pmlmepriv->lock);
 
 	rtw_os_xmit_schedule(adapter);
@@ -1564,6 +1566,7 @@ void rtw_stadel_event_callback(struct adapter *adapter, u8 *pbuf)
 		rtw_free_stainfo(adapter,  psta);
 
 		if (adapter->stapriv.asoc_sta_count == 1) {/* a sta + bc/mc_stainfo (not Ibss_stainfo) */
+			u8 ret = _SUCCESS;
 			/* rtw_indicate_disconnect(adapter);removed@20091105 */
 			spin_lock_bh(&(pmlmepriv->scanned_queue.lock));
 			/* free old ibss network */
@@ -1591,12 +1594,14 @@ void rtw_stadel_event_callback(struct adapter *adapter, u8 *pbuf)
 				_clr_fwstate_(pmlmepriv, WIFI_ADHOC_STATE);
 			}
 
-			if (rtw_createbss_cmd(adapter) != _SUCCESS)
-				;
+			ret = rtw_createbss_cmd(adapter);
+			if (ret != _SUCCESS)
+				goto unlock;
 		}
 
 	}
 
+unlock:
 	spin_unlock_bh(&pmlmepriv->lock);
 }
 
-- 
2.20.1

