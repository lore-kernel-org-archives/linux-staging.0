Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C66DE3FC0
	for <linux-staging@lists.linux.dev>; Sun,  5 Sep 2021 11:03:17 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id z24-20020a17090acb1800b0018e87a24300so2688522pjt.0
        for <linux-staging@lists.linux.dev>; Sun, 05 Sep 2021 04:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=F+xPQAG2VCz0ftgXUmW/nU/xJftUNz0rnEDvPM4auEk=;
        b=XBIo81MCIrrD6Cfqy1PeMIpjqjqSE1jINHws04cjn7Z8V0lkUrqKTC5cGDFjjHMUul
         1sNIMppfB9jwR3EbF/OWJWXOApx0ABOJNiqvIyIB2ADOYA7b0A0Ya5J1L2mFcmoCX2Iz
         A4yEFgR+FkoU6dS+KeBqSyqfdDS7QJvH+6RddhHDzc/vFcjF9yPYVADB0TiIxe4iDuQ1
         QMYSwJfNl5Z4/CBR7ilwVyzYJr5fG+WpopOa6HCDncmaSg/ly09i3aOD36HmPcvjbIZ0
         oaYuEmBG1vhwFt79IDL176RiEgXwMDW1ATD8ryt4AK/T4KmZZW9y08DF8vH8ch66vt8S
         ISog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=F+xPQAG2VCz0ftgXUmW/nU/xJftUNz0rnEDvPM4auEk=;
        b=OnH99BGOx/Vl4NAQjcpM0PlIRGz9WJ0ZOddX8qsw4qQpFJ1uVJy6mQz+fRQy3hCNDm
         cnQiLtIqz3hgciPWv4QzMaMN2yKjLTmyDV4mYahUsraM0eK4oiWvUp8JZVnNnYFHU2I8
         mG6AYKI3CsjCMJ956uGae/GDzqXOQn3XoWeznSlZ+v9i4+kPlJoAzbtXN6S1WdarNlLh
         ZsnJ4chBoO9JJkS+NNG2V9MfpR0xQAjDbTns87Wb05wf6AJA4eMcerwS+Q5/k11bbD/d
         3cG+ZuPfpdBDuD7lqMoHV30FdpmWEdQaQ+Q+ygNRibHi5pdZW9G5gqtZ+feDGVkqyCtv
         cx5w==
X-Gm-Message-State: AOAM531pp31wJ7BBnea+kF4FQrkUvTMceWAlTKb+uhcV0kBl0ncNN9U3
	ty6puh/iveTV4SzOS8HCDYk=
X-Google-Smtp-Source: ABdhPJwRVzN1UQdDZoQAtCTNNbwASO2y3XlFjHDXQ5IxzSIiC2hEWufYD24Smli2BGgwO3i3v+XDLg==
X-Received: by 2002:a17:902:8f83:b0:138:9186:71d7 with SMTP id z3-20020a1709028f8300b00138918671d7mr6474891plo.56.1630839797185;
        Sun, 05 Sep 2021 04:03:17 -0700 (PDT)
Received: from user ([117.98.200.228])
        by smtp.gmail.com with ESMTPSA id n185sm4733863pfn.171.2021.09.05.04.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Sep 2021 04:03:16 -0700 (PDT)
Date: Sun, 5 Sep 2021 16:33:10 +0530
From: Saurav Girepunje <saurav.girepunje@gmail.com>
To: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	gregkh@linuxfoundation.org, straube.linux@gmail.com,
	saurav.girepunje@gmail.com, fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: saurav.girepunje@hotmail.com
Subject: [PATCH] staging: r8188eu: core: remove duplicate structure.
Message-ID: <YTSj7upqzTiccWH2@user>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove duplicate structure mlme_handler and action_handler. Both
structure are having same member. Replace it with mlme_action_handler.

Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c    | 12 ++++++------
 drivers/staging/r8188eu/include/rtw_mlme_ext.h |  8 +-------
 2 files changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index f314f55997bf..6529f7ece5e2 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -11,7 +11,7 @@
 #include "../include/mlme_osdep.h"
 #include "../include/recv_osdep.h"

-static struct mlme_handler mlme_sta_tbl[] = {
+static struct mlme_action_handler mlme_sta_tbl[] = {
 	{WIFI_ASSOCREQ,		"OnAssocReq",	&OnAssocReq},
 	{WIFI_ASSOCRSP,		"OnAssocRsp",	&OnAssocRsp},
 	{WIFI_REASSOCREQ,	"OnReAssocReq",	&OnAssocReq},
@@ -32,7 +32,7 @@ static struct mlme_handler mlme_sta_tbl[] = {
 	{WIFI_ACTION,		"OnAction",		&OnAction},
 };

-static struct action_handler OnAction_tbl[] = {
+static struct mlme_action_handler OnAction_tbl[] = {
 	{RTW_WLAN_CATEGORY_SPECTRUM_MGMT,	 "ACTION_SPECTRUM_MGMT", on_action_spct},
 	{RTW_WLAN_CATEGORY_QOS, "ACTION_QOS", &OnAction_qos},
 	{RTW_WLAN_CATEGORY_DLS, "ACTION_DLS", &OnAction_dls},
@@ -391,7 +391,7 @@ void free_mlme_ext_priv(struct mlme_ext_priv *pmlmeext)
 	}
 }

-static void _mgt_dispatcher(struct adapter *padapter, struct mlme_handler *ptable, struct recv_frame *precv_frame)
+static void _mgt_dispatcher(struct adapter *padapter, struct mlme_action_handler *ptable, struct recv_frame *precv_frame)
 {
 	u8 bc_addr[ETH_ALEN] = {0xff, 0xff, 0xff, 0xff, 0xff, 0xff};
 	u8 *pframe = precv_frame->rx_data;
@@ -408,7 +408,7 @@ static void _mgt_dispatcher(struct adapter *padapter, struct mlme_handler *ptabl
 void mgt_dispatcher(struct adapter *padapter, struct recv_frame *precv_frame)
 {
 	int index;
-	struct mlme_handler *ptable;
+	struct mlme_action_handler *ptable;
 #ifdef CONFIG_88EU_AP_MODE
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 #endif /* CONFIG_88EU_AP_MODE */
@@ -4221,7 +4221,7 @@ unsigned int OnAction(struct adapter *padapter, struct recv_frame *precv_frame)
 {
 	int i;
 	unsigned char	category;
-	struct action_handler *ptable;
+	struct mlme_action_handler *ptable;
 	unsigned char	*frame_body;
 	u8 *pframe = precv_frame->rx_data;

@@ -4229,7 +4229,7 @@ unsigned int OnAction(struct adapter *padapter, struct recv_frame *precv_frame)

 	category = frame_body[0];

-	for (i = 0; i < sizeof(OnAction_tbl) / sizeof(struct action_handler); i++) {
+	for (i = 0; i < sizeof(OnAction_tbl) / sizeof(struct mlme_action_handler); i++) {
 		ptable = &OnAction_tbl[i];
 		if (category == ptable->num)
 			ptable->func(padapter, precv_frame);
diff --git a/drivers/staging/r8188eu/include/rtw_mlme_ext.h b/drivers/staging/r8188eu/include/rtw_mlme_ext.h
index d2f4d3ce7b90..99ee28e4c500 100644
--- a/drivers/staging/r8188eu/include/rtw_mlme_ext.h
+++ b/drivers/staging/r8188eu/include/rtw_mlme_ext.h
@@ -213,18 +213,12 @@ enum SCAN_STATE {
 	SCAN_STATE_MAX,
 };

-struct mlme_handler {
+struct mlme_action_handler {
 	unsigned int   num;
 	char *str;
 	unsigned int (*func)(struct adapter *adapt, struct recv_frame *frame);
 };

-struct action_handler {
-	unsigned int   num;
-	char* str;
-	unsigned int (*func)(struct adapter *adapt, struct recv_frame *frame);
-};
-
 struct	ss_res {
 	int	state;
 	int	bss_cnt;
--
2.32.0

