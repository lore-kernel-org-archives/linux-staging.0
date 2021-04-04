Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A24259E
	for <linux-staging@lists.linux.dev>; Sun,  4 Apr 2021 14:10:18 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id j18so8770767wra.2
        for <linux-staging@lists.linux.dev>; Sun, 04 Apr 2021 07:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=C9W8PbQLkq/rfbEk2baDBFEd4Rx3S1AqPsnjoKp+jho=;
        b=C8oIZlVfHlHfpOWSNZAExRurGEx/nNZ62GzajCrd965cp5mOPivKyAdtE+kPtu+kAv
         ERbktcg4LABxE+UxNcGVrbbHPzNxQb7mawIvj41soFiEIakbgSBlszCrnRR81zTpzye9
         oKslgdnahAd2JfuTXGLhcYdzCNxPI9JJNaTsFPQtu7JpVS4IKlwdda8znJ72dCnJc3yU
         jmLS7Hx4uODnZtWsK9R84XvLUVv5YAzbL098ildLQFKl53zQ6EpXZkEq1VIIT+y6PYvD
         hsPnugr8/h0WiEV3/Xg94lCL/DG4bp3/dttkWvH9WqtylvznfUiIKJjWNJUdWWblk0PR
         zQYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=C9W8PbQLkq/rfbEk2baDBFEd4Rx3S1AqPsnjoKp+jho=;
        b=dDnigjyKvI1M2DJccxfKz9u2YshoSYhrqDMyTLo2AudKu/Hdf0LRWddPPW1scj+SY0
         4b+vf9cEBYelIcjHrw5XrO8XVbJpcUlw9mxVV/0f7J9NeYdln2Yq4hVJZN1+F2x6pTuF
         YCON3QXzjwqJWNRO56jfF8VT6Vf/buhLhZr76ruRomRwe311kDH4bC1/0Ks9uGkO8qDw
         7ajw7f1ai5t8WojGhhidb7JqjH6B8uAOYhYDTC3IQzPe0UykIjzvyP1/wwuQiU8FWC5m
         Bb2VnIUnfP/VZ3D5KUPqC1MkhFa5q1tE5safylfRX3HL7rQKgomyRGKxAJccDR9NGF9y
         pf7Q==
X-Gm-Message-State: AOAM533KST0dWujxd2yVe1BVa56tiq3A4iidJt3u6zmulmAFW0/z/YHZ
	mFDf1nGgM7RVTac0T7TVlFO8W5+3LR+nBw==
X-Google-Smtp-Source: ABdhPJwIMrZwOtwAP1QO0WXL8O54sGT4F/O0GjmcOofZeKf/yEgGHzIrPZmpiseohNw8oy41Y/8Fkw==
X-Received: by 2002:adf:f908:: with SMTP id b8mr24179364wrr.184.1617545416896;
        Sun, 04 Apr 2021 07:10:16 -0700 (PDT)
Received: from agape ([5.171.81.112])
        by smtp.gmail.com with ESMTPSA id m14sm19861467wmi.27.2021.04.04.07.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Apr 2021 07:10:16 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH v4 16/30] staging: rtl8723bs: tidy up some error handling in core/rtw_mlme.c
Date: Sun,  4 Apr 2021 16:09:32 +0200
Message-Id: <6affc9dd905f7c94a93bbd0fa706bc9026103c2e.1617545239.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617545239.git.fabioaiuto83@gmail.com>
References: <cover.1617545239.git.fabioaiuto83@gmail.com>
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

Suggested-by: Dan Carpenter <dan.carpenter@oracle.com>
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

