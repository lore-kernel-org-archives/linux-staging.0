Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 320EC71
	for <linux-staging@lists.linux.dev>; Sat, 24 Apr 2021 09:03:10 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id n84so62793wma.0
        for <linux-staging@lists.linux.dev>; Sat, 24 Apr 2021 02:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=91fZeTranZX1H5Z/+RUWnPue6CJoyhVbwkd9ov6Mo+w=;
        b=WjqZ+JXxwky7sNEd45JSuQPTOUkBZWVKSHBHWCu+FNIPfbJnu9kelvno/DmXTOJdxz
         1giyV3udda7TJIAt6yX39HudcZ1fGk2k1N/QjiuQ8/hZSLWqKOqJK0OZf2/KMIxhR6db
         VMovgEb3HprszHr2QIBUfqJm5Cmi3DQflaHi23T0DXt9Vg/L9VtBn8xOe/X8dkq4YYSQ
         nq37u9wTxgNdMz7bnV1MG0R19QWW2Kq3uosLgD/oXvAtyG5wyzId6m0G7PbkmfyNjzrw
         z/2tv1DBiqguJHUVMLNPgC3CG+ZcO4A/yn87U0L0YyCuiVeK4cLjo3YvRQwWtf3yF3Ph
         6K4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=91fZeTranZX1H5Z/+RUWnPue6CJoyhVbwkd9ov6Mo+w=;
        b=Vl1muWrUCKz3qnf2IU7TDsICvaQymbcf/3nN5A60E3lR40HKX3Y0QheENqEna2twhp
         Lfpezd4US43DjzEPQbx31ebe1rbZAnKCQ2EHK6CJISu8mdDGTNX0ISp2sxsbuZfW5jaf
         5jwd5LdECuAUsNd9LXbOmIpa0auRPE335Xuaom/I0gePlj//Lbv0RJcJTrlg4kSA8Bom
         ANrMM0mnVTuShXYvWqQZ3CQFOIkn2v9gNSih1OImrGd4h3opXn6GBAsAIK+uFJova8hd
         +ddc044mBQdnCcqw+Ee+LTAdBhFQILjG+zJBGUuE86XC2cMVzt29I96Jb94XqmyXmbdc
         cphg==
X-Gm-Message-State: AOAM5326NhRGaB0oeABuWxkkNAaWMBeJXJFNarGGafUrCZpRKASRdghN
	+o1g+LV7gp1zbwxrOJ6NDKHKzWChM+qCbA==
X-Google-Smtp-Source: ABdhPJwYZKgcXzNtwHX63bsJ6nlgTuNlHAoCqJkEDSWlNPwsfRJ6qRM3LB57/BCKJNl1gZ2shAsymg==
X-Received: by 2002:a1c:1cf:: with SMTP id 198mr6373505wmb.114.1619254988853;
        Sat, 24 Apr 2021 02:03:08 -0700 (PDT)
Received: from agape ([5.171.80.252])
        by smtp.gmail.com with ESMTPSA id p13sm13578093wrt.0.2021.04.24.02.03.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Apr 2021 02:03:08 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 20/50] staging: rtl8723bs: move static array definition from header to .c file
Date: Sat, 24 Apr 2021 11:02:03 +0200
Message-Id: <665c9d33a97954508ca9257850a5690afcf0a9a9.1619254603.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619254603.git.fabioaiuto83@gmail.com>
References: <cover.1619254603.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

move static array definition from header to .c file.
This prepare removal of a conditional compile block
_RTW_MLME_EXT_C_.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 30 +++++++++++++++++
 .../staging/rtl8723bs/include/rtw_mlme_ext.h  | 32 -------------------
 2 files changed, 30 insertions(+), 32 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 9031cf7657ae..1ff2b3a28bab 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -5997,6 +5997,36 @@ u8 set_tx_beacon_cmd(struct adapter *padapter)
 	return res;
 }
 
+static struct fwevent wlanevents[] = {
+	{0, rtw_dummy_event_callback},	/*0*/
+	{0, NULL},
+	{0, NULL},
+	{0, NULL},
+	{0, NULL},
+	{0, NULL},
+	{0, NULL},
+	{0, NULL},
+	{0, &rtw_survey_event_callback},		/*8*/
+	{sizeof(struct surveydone_event), &rtw_surveydone_event_callback},	/*9*/
+
+	{0, &rtw_joinbss_event_callback},		/*10*/
+	{sizeof(struct stassoc_event), &rtw_stassoc_event_callback},
+	{sizeof(struct stadel_event), &rtw_stadel_event_callback},
+	{0, &rtw_atimdone_event_callback},
+	{0, rtw_dummy_event_callback},
+	{0, NULL},	/*15*/
+	{0, NULL},
+	{0, NULL},
+	{0, NULL},
+	{0, rtw_fwdbg_event_callback},
+	{0, NULL},	 /*20*/
+	{0, NULL},
+	{0, NULL},
+	{0, &rtw_cpwm_event_callback},
+	{0, NULL},
+	{0, &rtw_wmm_event_callback},
+
+};
 
 u8 mlme_evt_hdl(struct adapter *padapter, unsigned char *pbuf)
 {
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
index 472818c5fd83..0248b91b4525 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
@@ -805,38 +805,6 @@ enum {
 
 #ifdef _RTW_MLME_EXT_C_
 
-static struct fwevent wlanevents[] =
-{
-	{0, rtw_dummy_event_callback},	/*0*/
-	{0, NULL},
-	{0, NULL},
-	{0, NULL},
-	{0, NULL},
-	{0, NULL},
-	{0, NULL},
-	{0, NULL},
-	{0, &rtw_survey_event_callback},		/*8*/
-	{sizeof(struct surveydone_event), &rtw_surveydone_event_callback},	/*9*/
-
-	{0, &rtw_joinbss_event_callback},		/*10*/
-	{sizeof(struct stassoc_event), &rtw_stassoc_event_callback},
-	{sizeof(struct stadel_event), &rtw_stadel_event_callback},
-	{0, &rtw_atimdone_event_callback},
-	{0, rtw_dummy_event_callback},
-	{0, NULL},	/*15*/
-	{0, NULL},
-	{0, NULL},
-	{0, NULL},
-	{0, rtw_fwdbg_event_callback},
-	{0, NULL},	 /*20*/
-	{0, NULL},
-	{0, NULL},
-	{0, &rtw_cpwm_event_callback},
-	{0, NULL},
-	{0, &rtw_wmm_event_callback},
-
-};
-
 #endif/* _RTL8192C_CMD_C_ */
 
 #endif
-- 
2.20.1

