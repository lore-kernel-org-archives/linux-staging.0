Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE21323A7;
	Thu, 21 Apr 2022 19:20:46 +0000 (UTC)
Received: by mail-qv1-f47.google.com with SMTP id d9so4418635qvm.4;
        Thu, 21 Apr 2022 12:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NMYq8qcFTxh0xZzr+s+ajhPy8SCulftSg3sqVf1Tdxo=;
        b=gFzJ2Ur0qLFC5+5sMie2YMAG4RMwHvM/T+9Lym1w/HUKyn3+4P2HF3HDL8aRGEgaI+
         xWxwQZgyX3BlVwkzkkQeLpNsdoqHjzzj+taHP6nEWXVqEcDrE+lKIyrYOJFNXxlA+yZR
         RmB0zt7Ox2gUE4w3cFVrXGz58rgmYG0/3HCfNAlfvbSdmLSsG1CQuBOT5ssA8XsTe4CC
         vAFodrhA6RqD4rUtB4vUm4cJ5b4SKOQCaT0LJ+FXiQ4LuGLCnraBzQaNCzPsufKNUSdL
         kKoilSdywFMmXb38YWpdkZ9zXEIfimwCKK67LAePMWEHWLTWCWMIGI7zzRbHZOL81WsE
         vLfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NMYq8qcFTxh0xZzr+s+ajhPy8SCulftSg3sqVf1Tdxo=;
        b=doo8G/appke6RdsCkdWWuPz9JSOv/erOrHX3YqWMCyRgazrSxbCJToyOI/9FC970bC
         Mjm95s9kag95X8SrNWMCaj3mNWnTyr2Y7yYcDG+AUGB1IF7h+UY3rafMYEu0Zl9nkL/P
         7iWQGuFNbjRc81sTbf9Rhbq3Nb6EmBwfPvmsqsVsHHRS8AcFV906O8+tFO9Vy3wVbUdY
         +b+0WH0RtKv1MokJYNgUibfLimVW5yaK7p25cY0BdTgzhLAn+0iFG32WuJ9ltUZdDZs9
         23uQQjs9mItGA7yNKJsMZpRXcGFKol+mn6XMXXkroI1XAU0p6nFxoH4lgcNLgAgJ6VTb
         Tg7Q==
X-Gm-Message-State: AOAM531+TdrH1zlcdLWiqo61s0VrQ9fvAZGvkPFKqDMYr0rjVFnN5Mm8
	gqhUc2zmNfTW36k87hb+XA4=
X-Google-Smtp-Source: ABdhPJy8ZQnVqfEMVHIa2M8cOx+4Hsi8pqtCHRwr1SURcmiQj9TJMj9Swa3206Oj/IQ5yBhQTace2w==
X-Received: by 2002:a05:6214:c2b:b0:446:5060:2c33 with SMTP id a11-20020a0562140c2b00b0044650602c33mr811826qvd.3.1650568845665;
        Thu, 21 Apr 2022 12:20:45 -0700 (PDT)
Received: from jaehee-ThinkPad-X1-Extreme.wework.com ([4.34.18.218])
        by smtp.gmail.com with ESMTPSA id l9-20020a05622a174900b002f34421b01csm2567736qtk.23.2022.04.21.12.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Apr 2022 12:20:45 -0700 (PDT)
From: Jaehee Park <jhpark1013@gmail.com>
To: Larry.Finger@lwfinger.net
Cc: phil@philpotter.co.uk,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	jhpark1013@gmail.com
Subject: [PATCH v4 6/7] staging: r8188eu: correct typo in comments
Date: Thu, 21 Apr 2022 15:20:31 -0400
Message-Id: <56b25e4394396823d52f1fe1b312c5a307aea0fc.1650568579.git.jhpark1013@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1650568579.git.jhpark1013@gmail.com>
References: <cover.1650568579.git.jhpark1013@gmail.com>
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

