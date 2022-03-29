Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3D02598
	for <linux-staging@lists.linux.dev>; Tue, 29 Mar 2022 20:21:56 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id p15so37397813ejc.7
        for <linux-staging@lists.linux.dev>; Tue, 29 Mar 2022 13:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=d7XcUVJ/bFv2YOKU/4L/gZCPvA4Jcc/g7XOEqyRUVvA=;
        b=L+2MCEYTGsuGik3/UJSVfjjPoKdqGfa1XwEGM3LMdjhhCKJWIEWhOInYt8iBXgkMs9
         BYm0LWR+8mXcck5me0zURYESi/Qdfj7dTOhX5BL9npgCih6y3sRVOI3pI186rvp4+49S
         yN63ngAtKE35JdXxx8okz+6c2qV2DAfD5e5sWaTxT1/fY+vmjaz/I2Y0HkAoxKXPX+5j
         JJxeeEsx5zoUtuaZN0lyCAXl5rTlWLEBltWYjMWsnD1DC4Hi5N2XdmVV8zc0l9NIDNv6
         ruVYd5/e8Y/mZznDaq64hhr3zXqONYfQkuEzj9dHHg6D9NotLqs8ERz8cB7hl9UHqQDK
         X8Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=d7XcUVJ/bFv2YOKU/4L/gZCPvA4Jcc/g7XOEqyRUVvA=;
        b=PYeMB6olbVJ/M2LnW9oFVxFVs7v8EMDzrQolVuCm9Ls43vbbTX4tGN0dlRnLfYyqGO
         K9VwlizLAsOmUBD4I8xfVDJNQ3wI3IaENX0hSHS01sfgOeL+0n29or4U8ywH7s7X2LxF
         sYWC1Cfl+OsxtkSp0fYXK3Dw1RhlGRCRsOCFdWQSQU4jtxY18uoNLaNEx38MUkF71hAZ
         b5vtGHrj5bsYEUwvQbSrYPKRNks+kpBIRAnuB97+ftgffTSISwEpE6BpEj0yMl/hoQXE
         QhL/k92/kiFul2uQXvYOfW5XTZ8OumWsK+t+98G/fKfTga4dtbHxT8LTahBpNhYi8I6q
         OMgg==
X-Gm-Message-State: AOAM53106zLzYgVuMnWF7lqiIr+anWFBHktOwgW03KMv86A0TykiN1vv
	rxLkUYzF3HyCMTtDGWVHudqX+wTzSxI=
X-Google-Smtp-Source: ABdhPJwKrsTrjZ5SGRWAIzq4kAwHHpxrsbpyCj8qpAo+CW6Dg3SiBQ4zU/5ywq2OfBGG+bZnlsAZaA==
X-Received: by 2002:a17:907:6297:b0:6da:6388:dc58 with SMTP id nd23-20020a170907629700b006da6388dc58mr37854195ejc.472.1648585314580;
        Tue, 29 Mar 2022 13:21:54 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb55.dynamic.kabel-deutschland.de. [95.90.187.85])
        by smtp.gmail.com with ESMTPSA id ss12-20020a170907038c00b006e0ec9e806dsm3938111ejb.136.2022.03.29.13.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Mar 2022 13:21:54 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 7/8] staging: r8188eu: remove HW_VAR_TX_RPT_MAX_MACID from SetHwReg8188EU()
Date: Tue, 29 Mar 2022 22:21:40 +0200
Message-Id: <20220329202141.7028-8-straube.linux@gmail.com>
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

The HW_VAR_TX_RPT_MAX_MACID case in SetHwReg8188EU() just calls
rtw_write8(). Remove HW_VAR_TX_RPT_MAX_MACID from SetHwReg8188EU() and
call rtw_write8() directly. Move the call to a new function to indicate
what it actually does. This is part of the ongoing effort to get rid of
the unwanted hal layer.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
v2: Moved the code into a function.

 drivers/staging/r8188eu/core/rtw_mlme.c     | 8 +++++++-
 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 3 ++-
 drivers/staging/r8188eu/hal/usb_halinit.c   | 6 ------
 drivers/staging/r8188eu/include/hal_intf.h  | 1 -
 drivers/staging/r8188eu/include/rtw_mlme.h  | 1 +
 5 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme.c b/drivers/staging/r8188eu/core/rtw_mlme.c
index 1d52cfac1999..ee48dfd09fb3 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme.c
@@ -1096,6 +1096,11 @@ void rtw_joinbss_event_callback(struct adapter *adapter, u8 *pbuf)
 
 }
 
+void rtw_set_max_rpt_macid(struct adapter *adapter, u8 macid)
+{
+	rtw_write8(adapter, REG_TX_RPT_CTRL + 1, macid + 1);
+}
+
 static u8 search_max_mac_id(struct adapter *padapter)
 {
 	u8 mac_id;
@@ -1132,7 +1137,8 @@ void rtw_sta_media_status_rpt(struct adapter *adapter, struct sta_info *psta,
 		return;
 
 	macid = search_max_mac_id(adapter);
-	SetHwReg8188EU(adapter, HW_VAR_TX_RPT_MAX_MACID, (u8 *)&macid);
+	rtw_set_max_rpt_macid(adapter, macid);
+
 	/* MACID|OPMODE:1 connect */
 	media_status_rpt = (u16)((psta->mac_id << 8) | mstatus);
 	SetHwReg8188EU(adapter, HW_VAR_H2C_MEDIA_STATUS_RPT, (u8 *)&media_status_rpt);
diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index 4a9321e6e327..9df87a878121 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -6749,7 +6749,8 @@ void mlmeext_joinbss_event_callback(struct adapter *padapter, int join_res)
 
 		/* set per sta rate after updating HT cap. */
 		set_sta_rate(padapter, psta);
-		SetHwReg8188EU(padapter, HW_VAR_TX_RPT_MAX_MACID, (u8 *)&psta->mac_id);
+		rtw_set_max_rpt_macid(padapter, psta->mac_id);
+
 		media_status = (psta->mac_id << 8) | 1; /*   MACID|OPMODE: 1 means connect */
 		SetHwReg8188EU(padapter, HW_VAR_H2C_MEDIA_STATUS_RPT, (u8 *)&media_status);
 	}
diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index 1b08346f2afd..a3c955e54321 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -1274,12 +1274,6 @@ void SetHwReg8188EU(struct adapter *Adapter, u8 variable, u8 *val)
 			}
 		}
 		break;
-	case HW_VAR_TX_RPT_MAX_MACID:
-		{
-			u8 maxMacid = *val;
-			rtw_write8(Adapter, REG_TX_RPT_CTRL + 1, maxMacid + 1);
-		}
-		break;
 	case HW_VAR_H2C_MEDIA_STATUS_RPT:
 		rtl8188e_set_FwMediaStatus_cmd(Adapter, (*(__le16 *)val));
 		break;
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index 8708675c3478..a997bbbae69f 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -33,7 +33,6 @@ enum hw_variables {
 	HW_VAR_ANTENNA_DIVERSITY_SELECT,
 	HW_VAR_FIFO_CLEARN_UP,
 	HW_VAR_RPT_TIMER_SETTING,
-	HW_VAR_TX_RPT_MAX_MACID,
 	HW_VAR_H2C_MEDIA_STATUS_RPT,
 	HW_VAR_CHK_HI_QUEUE_EMPTY,
 };
diff --git a/drivers/staging/r8188eu/include/rtw_mlme.h b/drivers/staging/r8188eu/include/rtw_mlme.h
index 01de253c0376..37d217aaf524 100644
--- a/drivers/staging/r8188eu/include/rtw_mlme.h
+++ b/drivers/staging/r8188eu/include/rtw_mlme.h
@@ -594,6 +594,7 @@ void _rtw_roaming(struct adapter *padapter, struct wlan_network *tgt_network);
 void rtw_set_roaming(struct adapter *adapter, u8 to_roaming);
 u8 rtw_to_roaming(struct adapter *adapter);
 
+void rtw_set_max_rpt_macid(struct adapter *adapter, u8 macid);
 void rtw_sta_media_status_rpt(struct adapter *adapter, struct sta_info *psta,
 			      u32 mstatus);
 
-- 
2.35.1

