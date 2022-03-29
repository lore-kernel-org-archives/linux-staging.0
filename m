Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 599AA2598
	for <linux-staging@lists.linux.dev>; Tue, 29 Mar 2022 20:21:51 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id r13so37410583ejd.5
        for <linux-staging@lists.linux.dev>; Tue, 29 Mar 2022 13:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iwoHH2DorQoLHJxUTXcAs6n0sWifllvRMo0K56xrEzw=;
        b=mQ3AbiTBM6wCrigpmTiVd/Ll38qQH+4MXqq5afjCa0AcRph490/4HL4l5dH1Okt71G
         sElXl2tczJw/DGceqv/ckeN8TgyJO/uEvK6CqqnptIbjq8RedVVwga8UOl9nF7bvi8ZZ
         wcitcXQmn/SUHqyKN0yAJ8nM4D+59JSn9YHVYnSrDQIpvALUAQsj6KVr/i+W93gkEH3J
         oM5ttIUgNbhMQB14TTV9qjyCYxJMEqUeVOK4XJ5KEsBDOSUbpJaX+9TNH7VqhU/Wh+Ov
         gCkNfrgRRyvAgQmwXr7HVGNqi2K622a7T6EZnOJ3gWh671JUX70ZK0tUvuXNkrSf/jCn
         5MRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iwoHH2DorQoLHJxUTXcAs6n0sWifllvRMo0K56xrEzw=;
        b=DTFiQATUA4/rJTvVIdQUCgiJ1MP5ldsNyNYBI3RCjlm+YPbK/kCHtwf9CqoLIr2/yV
         H6RT/nNJ7LP79b0kmG7A7bua2dgPa5p0VByTYEYKGgaHudSVbMnkUSXPgdNTwK12UtG8
         xGM90EoMAPMd++LmPEoS7U/Sqq32rCdaCV/T6ymqBdMeW1Efo1VBCupmshuFip55YO/d
         YzUw48AGrkJATnZ66zVIlt7fOP3hFEu5IdOL5gWIci9ppLd1LvuiHFtLZhwJsBZp9u9D
         9e4GOXsbME8Om73a+npBkHw0AW12yUympbCNIwsJRpJSCdwOQGDjgl2ibnk41widFtm3
         kI2Q==
X-Gm-Message-State: AOAM5317Jw5BhRGz0lDsB4Icvsr2cf0pd/7GQUuTdW4/8KR23JIRl72U
	U2lEo1Wf/z5TtJtwwE07raA=
X-Google-Smtp-Source: ABdhPJw4oLdWWjJKgol/2/7lcJdEbAX5CWE5R7NVZULtHjCju1DvV5+XbQ2GXKKxTYyK+y8GhNAe4w==
X-Received: by 2002:a17:907:b590:b0:6cf:48a4:9a4c with SMTP id qx16-20020a170907b59000b006cf48a49a4cmr35635934ejc.6.1648585309697;
        Tue, 29 Mar 2022 13:21:49 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb55.dynamic.kabel-deutschland.de. [95.90.187.85])
        by smtp.gmail.com with ESMTPSA id ss12-20020a170907038c00b006e0ec9e806dsm3938111ejb.136.2022.03.29.13.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Mar 2022 13:21:49 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 1/8] staging: r8188eu: remove HW_VAR_RESP_SIFS from SetHwReg8188EU()
Date: Tue, 29 Mar 2022 22:21:34 +0200
Message-Id: <20220329202141.7028-2-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220329202141.7028-1-straube.linux@gmail.com>
References: <20220329202141.7028-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SetHwReg8188EU() is called with HW_VAR_RESP_SIFS only in one place.
Remove the HW_VAR_RESP_SIFS case from SetHwReg8188EU() and call
rtw_write8() directly instead. This is part of the ongoing effort to
get rid of the unwanted hal layer.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
v2: no changes

 drivers/staging/r8188eu/core/rtw_wlan_util.c | 11 ++++++-----
 drivers/staging/r8188eu/hal/usb_halinit.c    |  8 --------
 drivers/staging/r8188eu/include/hal_intf.h   |  1 -
 3 files changed, 6 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_wlan_util.c b/drivers/staging/r8188eu/core/rtw_wlan_util.c
index 5a1eede57458..e44f4752f222 100644
--- a/drivers/staging/r8188eu/core/rtw_wlan_util.c
+++ b/drivers/staging/r8188eu/core/rtw_wlan_util.c
@@ -1326,7 +1326,6 @@ void update_capinfo(struct adapter *Adapter, u16 updateCap)
 void update_wireless_mode(struct adapter *padapter)
 {
 	int ratelen, network_type = 0;
-	u32 SIFS_Timer;
 	struct mlme_ext_priv	*pmlmeext = &padapter->mlmeextpriv;
 	struct mlme_ext_info	*pmlmeinfo = &pmlmeext->mlmext_info;
 	struct wlan_bssid_ex	*cur_network = &pmlmeinfo->network;
@@ -1353,10 +1352,12 @@ void update_wireless_mode(struct adapter *padapter)
 
 	pmlmeext->cur_wireless_mode = network_type & padapter->registrypriv.wireless_mode;
 
-	SIFS_Timer = 0x0a0a0808;/* 0x0808 -> for CCK, 0x0a0a -> for OFDM */
-				/* change this value if having IOT issues. */
-
-	SetHwReg8188EU(padapter, HW_VAR_RESP_SIFS, (u8 *)&SIFS_Timer);
+	/* RESP_SIFS for CCK */
+	rtw_write8(padapter, REG_R2T_SIFS, 0x08);
+	rtw_write8(padapter, REG_R2T_SIFS + 1, 0x08);
+	/* RESP_SIFS for OFDM */
+	rtw_write8(padapter, REG_T2T_SIFS, 0x0a);
+	rtw_write8(padapter, REG_T2T_SIFS + 1, 0x0a);
 
 	if (pmlmeext->cur_wireless_mode & WIRELESS_11B)
 		update_mgnt_tx_rate(padapter, IEEE80211_CCK_RATE_1MB);
diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index 789ad11170b2..0186f8bf73c7 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -1119,14 +1119,6 @@ void SetHwReg8188EU(struct adapter *Adapter, u8 variable, u8 *val)
 			}
 		}
 		break;
-	case HW_VAR_RESP_SIFS:
-		/* RESP_SIFS for CCK */
-		rtw_write8(Adapter, REG_R2T_SIFS, val[0]); /*  SIFS_T2T_CCK (0x08) */
-		rtw_write8(Adapter, REG_R2T_SIFS + 1, val[1]); /* SIFS_R2T_CCK(0x08) */
-		/* RESP_SIFS for OFDM */
-		rtw_write8(Adapter, REG_T2T_SIFS, val[2]); /* SIFS_T2T_OFDM (0x0a) */
-		rtw_write8(Adapter, REG_T2T_SIFS + 1, val[3]); /* SIFS_R2T_OFDM(0x0a) */
-		break;
 	case HW_VAR_ACK_PREAMBLE:
 		{
 			u8 regTmp;
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index 6f661c4af358..77069cbc1e07 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -17,7 +17,6 @@ enum hw_variables {
 	HW_VAR_MLME_SITESURVEY,
 	HW_VAR_MLME_JOIN,
 	HW_VAR_SLOT_TIME,
-	HW_VAR_RESP_SIFS,
 	HW_VAR_ACK_PREAMBLE,
 	HW_VAR_BCN_VALID,
 	HW_VAR_DM_FLAG,
-- 
2.35.1

