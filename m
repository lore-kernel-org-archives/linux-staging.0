Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8635317FE
	for <linux-staging@lists.linux.dev>; Fri, 15 Jul 2022 06:29:18 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id sz17so7245203ejc.9
        for <linux-staging@lists.linux.dev>; Thu, 14 Jul 2022 23:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=X89jDaGowxydv3IxBOHofGRc/LRUGA8qaJv5vJJEJVY=;
        b=Pk/8mX6wNFZD0mvSAiDLz/5lUSt/eRgeJ8mJp/TWVlbD696I+jh8Yq+NZhV1ncznUS
         52KtsYVKeG8niQ+cvnu1SLBQ/1FbS78ClBon+dwsxvL1hS6NXDQIqs9w9dmmh8jWvvf/
         rTqsDzoYMCohIV8tlcwFvI3aiFAJ3jgZg0Ie5goFzigpvCtZvFkDzSwUIyLBddoTmiMo
         /yOmj5At0CZOfxyWtKzyHXQ7s9Of9S5D0bIaeXFT7/Z2eY22vXjsNWFVfgcMln10qfYm
         vg+EVCI0uhjLkzzHTIWTQok/lIKBzlD8zt8ia0spAiG7q775dYmkP3W16+aYwxbdkcD6
         KO5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=X89jDaGowxydv3IxBOHofGRc/LRUGA8qaJv5vJJEJVY=;
        b=vtL7kgeQe8hz78hG/7G0Xi3d9UdGNWfXDOrZ+nnOn6YgIboYZVOZg4u42k3e1FsQGS
         1lJ2Cdj9tbaVS05UmXdLTayzuDedXDWeQRplpWkjydzSidynMLGtMfxipxMRz5qr1oMd
         N0Uta90+3QD0CkhN8Uuon0OA3IzWE1jgLBQond7QkyltCnwiLQCz+nF5h+Ayj46xQLzf
         XAUzaN3xy9Fh5nxFF6WuYuv/Cr/Xa5oW82MRABwxhNtFU75Kc/klTPkx4bdmgdkTH35K
         Y5ANM43bluaVJ/LLfL1oYWFchvRDmuFJXObj3+A3RPVGNcsgv06o/yqWSxhYFfwZOg1k
         C/3Q==
X-Gm-Message-State: AJIora+Gmwh3RGOID3iqIfMKZqwAJoL/4L0MXqvV7Oi5lGzIU0WL57iZ
	xkgDYyxZwqzRa72JJdanJPY=
X-Google-Smtp-Source: AGRyM1txKGyzNMEuhzHcXfn5j6w5auIMxfTrFVAQ1+0tR5vwE9KQgYN9G+Evgqv3F8bDhAkYx40vOg==
X-Received: by 2002:a17:907:e89:b0:72b:3059:a8c3 with SMTP id ho9-20020a1709070e8900b0072b3059a8c3mr12155332ejc.613.1657866556808;
        Thu, 14 Jul 2022 23:29:16 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb91.dynamic.kabel-deutschland.de. [95.90.187.145])
        by smtp.gmail.com with ESMTPSA id ku5-20020a170907788500b007262a5e2204sm1614515ejc.153.2022.07.14.23.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jul 2022 23:29:16 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 2/5] staging: r8188eu: remove unused parameter from correct_TSF()
Date: Fri, 15 Jul 2022 08:29:05 +0200
Message-Id: <20220715062908.8547-3-straube.linux@gmail.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220715062908.8547-1-straube.linux@gmail.com>
References: <20220715062908.8547-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The parameter 'pmlmeext' of correct_TSF() is unused. Remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c    | 4 ++--
 drivers/staging/r8188eu/core/rtw_wlan_util.c   | 2 +-
 drivers/staging/r8188eu/include/rtw_mlme_ext.h | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index 0edcf84db16d..985cb3b4ba30 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -6893,7 +6893,7 @@ void mlmeext_joinbss_event_callback(struct adapter *padapter, int join_res)
 
 	if ((pmlmeinfo->state & 0x03) == WIFI_FW_STATION_STATE) {
 		/*  correcting TSF */
-		correct_TSF(padapter, pmlmeext);
+		correct_TSF(padapter);
 	}
 	rtw_lps_ctrl_wk_cmd(padapter, LPS_CTRL_CONNECT, 0);
 }
@@ -6908,7 +6908,7 @@ void mlmeext_sta_add_event_callback(struct adapter *padapter, struct sta_info *p
 			/* nothing to do */
 		} else { /* adhoc client */
 			/*  correcting TSF */
-			correct_TSF(padapter, pmlmeext);
+			correct_TSF(padapter);
 
 			/* start beacon */
 			if (send_beacon(padapter) == _FAIL) {
diff --git a/drivers/staging/r8188eu/core/rtw_wlan_util.c b/drivers/staging/r8188eu/core/rtw_wlan_util.c
index b48e0b9dfd7b..7b705e2ea04a 100644
--- a/drivers/staging/r8188eu/core/rtw_wlan_util.c
+++ b/drivers/staging/r8188eu/core/rtw_wlan_util.c
@@ -1586,7 +1586,7 @@ void update_TSF(struct mlme_ext_priv *pmlmeext, u8 *pframe, uint len)
 	pmlmeext->TSFValue |= le32_to_cpu(*pbuf);
 }
 
-void correct_TSF(struct adapter *padapter, struct mlme_ext_priv *pmlmeext)
+void correct_TSF(struct adapter *padapter)
 {
 	SetHwReg8188EU(padapter, HW_VAR_CORRECT_TSF, NULL);
 }
diff --git a/drivers/staging/r8188eu/include/rtw_mlme_ext.h b/drivers/staging/r8188eu/include/rtw_mlme_ext.h
index 28416d1bd15c..2110affc180f 100644
--- a/drivers/staging/r8188eu/include/rtw_mlme_ext.h
+++ b/drivers/staging/r8188eu/include/rtw_mlme_ext.h
@@ -597,7 +597,7 @@ bool cckrates_included(unsigned char *rate, int ratelen);
 bool cckratesonly_included(unsigned char *rate, int ratelen);
 
 void update_TSF(struct mlme_ext_priv *pmlmeext, u8 *pframe, uint len);
-void correct_TSF(struct adapter *padapter, struct mlme_ext_priv *pmlmeext);
+void correct_TSF(struct adapter *padapter);
 
 struct cmd_hdl {
 	uint	parmsize;
-- 
2.37.0

