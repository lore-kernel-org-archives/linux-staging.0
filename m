Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 885692F3D;
	Wed, 13 Apr 2022 20:11:50 +0000 (UTC)
Received: by mail-qv1-f44.google.com with SMTP id gg1so1558626qvb.11;
        Wed, 13 Apr 2022 13:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NMYq8qcFTxh0xZzr+s+ajhPy8SCulftSg3sqVf1Tdxo=;
        b=oYhBgOSuosl6tL48jTUohiHOpUf+YjueYnMYdwuKylf3p7YWpj1FOXPT2pIUio/kik
         sYD8+KyL+GtLbTg2+kmbODB2pglVR+1LR1koJ/BEl6ntVqI3SEuSHDVkeqMwS5eolv6E
         J6jCQUKYhkfju81I83DDmPIEFvcI+xDve2lSMat6lyYmw0IFWUcyLJEBjIwAPji95MAW
         3s9Su3v/mSWoqn9gVwQnVZlyVvcMd03WhS6BYHfuh1WbN9s15MYG5+WfNV2oyvI6ARVt
         hTm5WDUPPtvH+6EUbq1eXWr/O+55a8JxCwwf2vsh1yOtSkKhum8QnYWpzd3F8lc9slLt
         GxGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NMYq8qcFTxh0xZzr+s+ajhPy8SCulftSg3sqVf1Tdxo=;
        b=luWVixD1s3VBNCjaFDxOGCieTkL3kmOfos6UKDZOFHjFGPCoZ00ARCkRHw2CCD0AEK
         tKF8/npFoISjRcrtP6rseoQt7NnmwTj/5G1iX95t7ThmV3sNwLbA7aoVrFqxq/zDe6ry
         RM6Ot11XqppLSZKpcgql0plVU+bPK2YLSucjzxyWrJeQ9e4qahi+MMvOqGBICzEzeLyA
         yVuLLOFTqfBpyHKoPtho3xY4PczWdMrjTvWAgsL9HojaefBFi1eI8RxNL5dk2VWJWTiG
         huQaOttR8gkI3/Xk02zjeUXNe8jCVuswjuvfqDj1mtUvbgDhcPLCAYBQje5W5AZb61hO
         /6NA==
X-Gm-Message-State: AOAM530q3kOBB+W00PWCGnCeF7htlmay4WG+nDaWsQWwyOs8/j3jUv7N
	xFB0eyn/jZRpFPsWtnlHKvs=
X-Google-Smtp-Source: ABdhPJy0EsEhPQ/ILFgSmyz6uo6YpNecGOiFrkVwEzNx23WvjkMRvqdLlxdZsF0Cts/4ng4i7j133A==
X-Received: by 2002:a05:6214:18c4:b0:444:39f6:b328 with SMTP id cy4-20020a05621418c400b0044439f6b328mr10001532qvb.51.1649880709390;
        Wed, 13 Apr 2022 13:11:49 -0700 (PDT)
Received: from jaehee-ThinkPad-X1-Extreme.wework.com ([4.34.18.218])
        by smtp.gmail.com with ESMTPSA id 7-20020a370907000000b0069c5598584esm1469827qkj.105.2022.04.13.13.11.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Apr 2022 13:11:48 -0700 (PDT)
From: Jaehee Park <jhpark1013@gmail.com>
To: Larry.Finger@lwfinger.net
Cc: phil@philpotter.co.uk,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	jhpark1013@gmail.com
Subject: [PATCH 6/6] staging: r8188eu: correct typo in comments
Date: Wed, 13 Apr 2022 16:11:34 -0400
Message-Id: <f4c3e6a2ed65597544c18fe34f6bd3f4676072c5.1649880454.git.jhpark1013@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1649880454.git.jhpark1013@gmail.com>
References: <cover.1649880454.git.jhpark1013@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct misspellings in the comments. Issue found with checkpatch.

Signed-off-by: Jaehee Park <jhpark1013@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_mlme.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme.c b/drivers/staging/r8188eu/core/rtw_mlme.c
index 7a90fe826d1d..d422ce87ba7c 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme.c
@@ -192,7 +192,7 @@ void _rtw_free_network_nolock(struct	mlme_priv *pmlmepriv, struct wlan_network *
 /*
 	return the wlan_network with the matching addr
 
-	Shall be calle under atomic context... to avoid possible racing condition...
+	Shall be called under atomic context... to avoid possible racing condition...
 */
 struct wlan_network *_rtw_find_network(struct __queue *scanned_queue, u8 *addr)
 {
@@ -328,7 +328,7 @@ void rtw_free_network_queue(struct adapter *dev, u8 isfreeall)
 /*
 	return the wlan_network with the matching addr
 
-	Shall be calle under atomic context... to avoid possible racing condition...
+	Shall be called under atomic context... to avoid possible racing condition...
 */
 struct	wlan_network *rtw_find_network(struct __queue *scanned_queue, u8 *addr)
 {
@@ -911,7 +911,7 @@ static struct sta_info *rtw_joinbss_update_stainfo(struct adapter *padapter, str
 			memset((u8 *)&psta->dot11rxpn, 0, sizeof(union pn48));
 		}
 		/*	When doing the WPS, the wps_ie_len won't equal to 0 */
-		/*	And the Wi-Fi driver shouldn't allow the data packet to be tramsmitted. */
+		/*	And the Wi-Fi driver shouldn't allow the data packet to be transmitted. */
 		if (padapter->securitypriv.wps_ie_len != 0) {
 			psta->ieee8021x_blocked = true;
 			padapter->securitypriv.wps_ie_len = 0;
@@ -1305,7 +1305,7 @@ void rtw_stadel_event_callback(struct adapter *adapter, u8 *pbuf)
 }
 
 /*
-* _rtw_join_timeout_handler - Timeout/faliure handler for CMD JoinBss
+* _rtw_join_timeout_handler - Timeout/failure handler for CMD JoinBss
 * @adapter: pointer to struct adapter structure
 */
 void _rtw_join_timeout_handler (struct adapter *adapter)
@@ -1340,7 +1340,7 @@ void _rtw_join_timeout_handler (struct adapter *adapter)
 }
 
 /*
-* rtw_scan_timeout_handler - Timeout/Faliure handler for CMD SiteSurvey
+* rtw_scan_timeout_handler - Timeout/Failure handler for CMD SiteSurvey
 * @adapter: pointer to struct adapter structure
 */
 void rtw_scan_timeout_handler (struct adapter *adapter)
-- 
2.25.1

