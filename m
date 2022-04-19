Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1B91384;
	Tue, 19 Apr 2022 18:19:55 +0000 (UTC)
Received: by mail-qv1-f52.google.com with SMTP id dw17so2263236qvb.9;
        Tue, 19 Apr 2022 11:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fhC3X2SyiyAl+npbfkVlNLSTyoSpgwtiZmqJs5lxBc4=;
        b=OPKv+zXzIulJ/bChAz/N/BvFQIw/GcXNMZhcMI98zHKajTluQf7i4EbuvdfwwS2jGY
         /buH9ZVrWciy6p8exI4Uk6zeeDkzxqbd2gpMbUMJMVIZLogmAKVkumWSjBO04KFXhSWp
         0i0+gqMZKsS7E+F657CgSYirCWN32nFnRePZKrEm6eZEkr3MWKRLnZ3YH1Bd/JxSksvm
         mHFl+3PrAKqLXd996WL9Ol/hSDiJfX/BWXJ0VgB/RMh9MBUe18X/1JG6IT5dlSzJAeyZ
         nats29XlJRMqJBfBO+22dPnPArkE3TR09ZPC4WgEgA2tksfuDiNDsRCIz7Iuze/0Jf/M
         I55A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fhC3X2SyiyAl+npbfkVlNLSTyoSpgwtiZmqJs5lxBc4=;
        b=IO1uL1nNSrXyioscN+b47mkhHrve5YKZVqQrxTseckRf9EyPpKuBSGpgzb6uKrPKog
         c/ojr9v1faSNfZrM8EH7/ftwNSeVxfCZ/4MvPonOWm/jg6e5s6zXoKDhgx85R2FL+x0C
         bZ89ZxQwEoFj/dzzg8YZFy5agOdSD8qqoprKYV8wpyGeFPiJIlUvNdQPLnW86DP9Z1o/
         0mnnNBBVVGlkhSpj5pLwXQl3mNVmqCqR/AKAnBoEaoCGfkJC7UaJKnLI9Z6SLA+MD5lZ
         cDyPg/7KhoU6MiQm2OZD91aSn2D4ODIcNb7fozz9+gxsSSvlvlRcHpOZYOp4gym89JvJ
         5mvg==
X-Gm-Message-State: AOAM530ODvwAMr3BYZm7NBhKvv33MdJFhnCm5VIkbK+Q3TLEfmWUenDO
	U9HAbcKkcCRkKyBBKoTWHS0=
X-Google-Smtp-Source: ABdhPJwL1/XGUDSeSF2YDZwjDMQcm7h/PtbdT22eCAuEiEDQTwr9gswRBWcSUzRdoEyWVWt7j97EsQ==
X-Received: by 2002:a05:6214:18c4:b0:444:39f6:b328 with SMTP id cy4-20020a05621418c400b0044439f6b328mr12820589qvb.51.1650392394335;
        Tue, 19 Apr 2022 11:19:54 -0700 (PDT)
Received: from jaehee-ThinkPad-X1-Extreme.wework.com ([4.34.18.218])
        by smtp.gmail.com with ESMTPSA id e126-20020a376984000000b0069c86b28524sm373334qkc.19.2022.04.19.11.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Apr 2022 11:19:53 -0700 (PDT)
From: Jaehee Park <jhpark1013@gmail.com>
To: Larry.Finger@lwfinger.net
Cc: phil@philpotter.co.uk,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	jhpark1013@gmail.com
Subject: [PATCH v3 6/7] staging: r8188eu: correct typo in comments
Date: Tue, 19 Apr 2022 14:19:37 -0400
Message-Id: <fc808136903d360ffa2a785fdc75017ae1735d86.1650392020.git.jhpark1013@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1650392020.git.jhpark1013@gmail.com>
References: <cover.1650392020.git.jhpark1013@gmail.com>
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
index 173754c127e3..5ada336ac723 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme.c
@@ -174,7 +174,7 @@ void _rtw_free_network_nolock(struct	mlme_priv *pmlmepriv, struct wlan_network *
 /*
 	return the wlan_network with the matching addr
 
-	Shall be calle under atomic context... to avoid possible racing condition...
+	Shall be called under atomic context... to avoid possible racing condition...
 */
 struct wlan_network *_rtw_find_network(struct __queue *scanned_queue, u8 *addr)
 {
@@ -310,7 +310,7 @@ void rtw_free_network_queue(struct adapter *dev, u8 isfreeall)
 /*
 	return the wlan_network with the matching addr
 
-	Shall be calle under atomic context... to avoid possible racing condition...
+	Shall be called under atomic context... to avoid possible racing condition...
 */
 struct	wlan_network *rtw_find_network(struct __queue *scanned_queue, u8 *addr)
 {
@@ -893,7 +893,7 @@ static struct sta_info *rtw_joinbss_update_stainfo(struct adapter *padapter, str
 			memset((u8 *)&psta->dot11rxpn, 0, sizeof(union pn48));
 		}
 		/*	When doing the WPS, the wps_ie_len won't equal to 0 */
-		/*	And the Wi-Fi driver shouldn't allow the data packet to be tramsmitted. */
+		/*	And the Wi-Fi driver shouldn't allow the data packet to be transmitted. */
 		if (padapter->securitypriv.wps_ie_len != 0) {
 			psta->ieee8021x_blocked = true;
 			padapter->securitypriv.wps_ie_len = 0;
@@ -1287,7 +1287,7 @@ void rtw_stadel_event_callback(struct adapter *adapter, u8 *pbuf)
 }
 
 /*
-* _rtw_join_timeout_handler - Timeout/faliure handler for CMD JoinBss
+* _rtw_join_timeout_handler - Timeout/failure handler for CMD JoinBss
 * @adapter: pointer to struct adapter structure
 */
 void _rtw_join_timeout_handler (struct adapter *adapter)
@@ -1322,7 +1322,7 @@ void _rtw_join_timeout_handler (struct adapter *adapter)
 }
 
 /*
-* rtw_scan_timeout_handler - Timeout/Faliure handler for CMD SiteSurvey
+* rtw_scan_timeout_handler - Timeout/Failure handler for CMD SiteSurvey
 * @adapter: pointer to struct adapter structure
 */
 void rtw_scan_timeout_handler (struct adapter *adapter)
-- 
2.25.1

