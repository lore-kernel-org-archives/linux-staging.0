Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28FE7B
	for <linux-staging@lists.linux.dev>; Sun, 19 Jun 2022 19:42:56 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id g16-20020a17090a7d1000b001ea9f820449so8900426pjl.5
        for <linux-staging@lists.linux.dev>; Sun, 19 Jun 2022 12:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yjFKNxuzMVouA/d7fakclf85AnSbfILJPYcTGegW5qw=;
        b=UwCbSawCcCT1UcHKQ3M2FG2+4vDf7xUy5BppVWuP8zcEKMltcHzlCAU9goZZhKkMuK
         GfjHBPV8O9uLFM2m9jImf+0vJfn4Sl07FyTaDimQwH7vHiqg87j+tfXRYOCOYFPYyUWt
         608BGhM6JUS1iTw7GI1JxTlUYSwTlphnMW9L461Fo25xd3kZf8LUCfAL5WC/I50THChc
         b9iQQenIDMvMqRnqmHhFDWwh/AvdAS/BeE1jkF1Z1DFJmctUDJmcHs/tXr5dbNLWELMY
         iCoXmQyZROu8bUcW0fHaKdKf+saodmPhJvQUied7GtTgkM3pJ0feN5cBPwNpyAwYZwgu
         Brhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yjFKNxuzMVouA/d7fakclf85AnSbfILJPYcTGegW5qw=;
        b=YkgmMb0nu3E4JkOk+bGCJ40LWN7hwlzCc7Y1uXkYlUwLfyA/sY3s/4cfItXyiBfPZA
         CRh5+DtdlRUfBZBf+2LMwFn0lPeulPmeOhu9Eetm4MeK10Niu5IXhBXndyeZgLlgUI6J
         qfr6uU8DpvHXWv8N0uNEn46vhI2LFS68/h1gei/rJcsVDgdT8JFlT4zWIkRy+lLlqncZ
         06jZYBY1ACvZr3FOc5I5suSJmwF7WFWsxsVRJS5ZRhxsK+jQ4zIi8vK925cuKdnYXRC+
         JbpFzavfUZnpl4cbAQvWVvFWUnCNsAd8DJ9ZJN5Qgu+OjvrYufizjZm9vzk0vKRTVatr
         qUoA==
X-Gm-Message-State: AJIora/gDwSXf86yEdxuWwKSBKKmzp085Yr+HtL0e9RghclDlyKinRH4
	RKVhvF8SmMaBJl/+QQBFB28J9dHREpjylFWh
X-Google-Smtp-Source: AGRyM1sB6AxmQpzfGNf7BsMzM2Ds5TDND0OugBJof33s1XvvM2leHIW8TPCsJ7tM0vdaZnhc0TKb0Q==
X-Received: by 2002:a17:902:bc84:b0:167:80c6:aedd with SMTP id bb4-20020a170902bc8400b0016780c6aeddmr20759705plb.97.1655667776376;
        Sun, 19 Jun 2022 12:42:56 -0700 (PDT)
Received: from localhost (c-67-180-87-133.hsd1.ca.comcast.net. [67.180.87.133])
        by smtp.gmail.com with ESMTPSA id q3-20020a170902edc300b0016370e1af6bsm7129923plk.128.2022.06.19.12.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jun 2022 12:42:55 -0700 (PDT)
From: Chang Yu <marcus.yu.56@gmail.com>
To: Larry.Finger@lwfinger.net,
	paskripkin@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Chang Yu <marcus.yu.56@gmail.com>
Subject: [PATCH v2 3/5] Staging: r8188eu: core: rtw_xmit: Fixed some spelling errors in the comments
Date: Sun, 19 Jun 2022 12:42:29 -0700
Message-Id: <8d2f49631551b53ad970c9165cceb845c4d60b75.1655666628.git.marcus.yu.56@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <cover.1655666628.git.marcus.yu.56@gmail.com>
References: <cover.1655666628.git.marcus.yu.56@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed the spelling of "broadcast" and "update" in the comments.

Signed-off-by: Chang Yu <marcus.yu.56@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_xmit.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_xmit.c b/drivers/staging/r8188eu/core/rtw_xmit.c
index 2bc059808a71..73eb2f01c176 100644
--- a/drivers/staging/r8188eu/core/rtw_xmit.c
+++ b/drivers/staging/r8188eu/core/rtw_xmit.c
@@ -957,7 +957,7 @@ s32 rtw_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct
 		}
 
 		if (bmcst) {
-			/*  don't do fragment to broadcat/multicast packets */
+			/*  don't do fragment to broadcast/multicast packets */
 			mem_sz = _rtw_pktfile_read(&pktfile, pframe, pattrib->pktlen);
 		} else {
 			mem_sz = _rtw_pktfile_read(&pktfile, pframe, mpdu_len);
@@ -1765,8 +1765,8 @@ int xmitframe_enqueue_for_sleeping_sta(struct adapter *padapter, struct xmit_fra
 
 			pstapriv->tim_bitmap |= BIT(0);/*  */
 			pstapriv->sta_dz_bitmap |= BIT(0);
-
-			update_beacon(padapter, _TIM_IE_, NULL, false);/* tx bc/mc packets after upate bcn */
+			/* tx bc/mc packets after update bcn */
+			update_beacon(padapter, _TIM_IE_, NULL, false);
 
 			ret = true;
 		}
@@ -1816,7 +1816,7 @@ int xmitframe_enqueue_for_sleeping_sta(struct adapter *padapter, struct xmit_fra
 				pstapriv->tim_bitmap |= BIT(psta->aid);
 
 				if (psta->sleepq_len == 1) {
-					/* upate BCN for TIM IE */
+					/* update BCN for TIM IE */
 					update_beacon(padapter, _TIM_IE_, NULL, false);
 				}
 			}
@@ -2085,7 +2085,7 @@ void xmit_delivery_enabled_frames(struct adapter *padapter, struct sta_info *pst
 		if ((psta->sleepq_ac_len == 0) && (!psta->has_legacy_ac) && (wmmps_ac)) {
 			pstapriv->tim_bitmap &= ~BIT(psta->aid);
 
-			/* upate BCN for TIM IE */
+			/* update BCN for TIM IE */
 			update_beacon(padapter, _TIM_IE_, NULL, false);
 		}
 	}
-- 
2.36.1

