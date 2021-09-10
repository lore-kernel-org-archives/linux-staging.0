Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBDC73FC2
	for <linux-staging@lists.linux.dev>; Fri, 10 Sep 2021 06:21:38 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id gp20-20020a17090adf1400b00196b761920aso739858pjb.3
        for <linux-staging@lists.linux.dev>; Thu, 09 Sep 2021 23:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=YZ1Cg3jt7kSg/s1Z6W7j84UpRGbFtuFXUdAmMNqttek=;
        b=pbBh2lafzMJ8pxp+1se+PF13P2h8nvIrrXnsc+fXSy/Oem1T2BRrXwSg0C5CQD2NQu
         VbNYxlYunBJZUaEXaGzIQh/Oaq5tXnCbL58yAKdWdHewniJ2v6kdsZwM9VxBHJU76Kyj
         g9cMZmRVeVAl7oy40nl9BzN7Voj6taD7U2ocrFfZMhjxwaK7Z+MpyRLjNts9oSx8FXVU
         K/ep3uVQlxHIdXILQsFTaKTpyioeYn2fgzAuHwCih9UI1qe9L/DXWOxtnevTdZBGvaGZ
         LM3g926xWS56jNLGuLF1SxKji//fb5PS/ZsSMKu8Iqx+tXfe8M+DGru4WBvTMvm4GMiJ
         sKig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=YZ1Cg3jt7kSg/s1Z6W7j84UpRGbFtuFXUdAmMNqttek=;
        b=gjHB6CUOPc71pbLUO7azZrkEZZpM71jfRUUZ3Nxt2EmvD+kGLOawSWYvZRO6mkzc9R
         tK2GBiii6kCzpq/MDOgg80bXxdfLN5JDgUD01QRxC5MDiiW7VNQABwiFaJ8Z97XCWDDk
         ymLiNr4mNXKSKP8go1UdjMdr87YsRU/938q+mRGa0gSrdT3gIovHc1DGho4QoAvvI6r3
         +schPJ0Wdq9Eou09bAO//y4DrWXdmGJ52ZqiTcIyNN1QtQwKPkFz1RA3G9xxkyRlpbhA
         XTOQkYtAirgNM92UoUT62WArqLLqSOgiiBPjGNcbf7AlQ0rtj1TnYdKDUP4TgzS7v5mF
         t1Rw==
X-Gm-Message-State: AOAM532Sy0YJQhpXHBQ4MN3nPh096lHLgcTE1LtHsXr/Fkb6AOlwjbUV
	k0TsM9bnTWDxelKk2b9uBI0=
X-Google-Smtp-Source: ABdhPJwUgdwGRc1oUeS6iivmnlzKwt980w8DajfjUlPGPVCR2WPjnS94g4QYxvhHSg9Y1SGLH5k79A==
X-Received: by 2002:a17:90b:1b06:: with SMTP id nu6mr7749738pjb.15.1631254898261;
        Thu, 09 Sep 2021 23:21:38 -0700 (PDT)
Received: from user ([117.98.200.228])
        by smtp.gmail.com with ESMTPSA id b10sm2922570pfl.220.2021.09.09.23.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 23:21:37 -0700 (PDT)
Date: Fri, 10 Sep 2021 11:51:32 +0530
From: Saurav Girepunje <saurav.girepunje@gmail.com>
To: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	gregkh@linuxfoundation.org, straube.linux@gmail.com,
	saurav.girepunje@gmail.com, fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: saurav.girepunje@hotmail.com
Subject: [PATCH v2] staging: r8188eu: core: remove duplicate structure
Message-ID: <YTr5bFrc1C4CUqZU@user>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove duplicate structure mlme_handler. struct action_handler and
mlme_handler both are having same member. Replace mlme_handler with
action_handler.

Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
---

ChangeLog V2:

- Replace the struct mlme_handler by action_handler.

ChangeLog V1:

-Remove duplicate structure mlme_handler and action_handler. Both
 structure are having same member. Replace it with mlme_action_handler.


 drivers/staging/r8188eu/core/rtw_mlme_ext.c    | 6 +++---
 drivers/staging/r8188eu/include/rtw_mlme_ext.h | 6 ------
 2 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index f314f55997bf..499eda43fd69 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -11,7 +11,7 @@
 #include "../include/mlme_osdep.h"
 #include "../include/recv_osdep.h"

-static struct mlme_handler mlme_sta_tbl[] = {
+static struct action_handler mlme_sta_tbl[] = {
 	{WIFI_ASSOCREQ,		"OnAssocReq",	&OnAssocReq},
 	{WIFI_ASSOCRSP,		"OnAssocRsp",	&OnAssocRsp},
 	{WIFI_REASSOCREQ,	"OnReAssocReq",	&OnAssocReq},
@@ -391,7 +391,7 @@ void free_mlme_ext_priv(struct mlme_ext_priv *pmlmeext)
 	}
 }

-static void _mgt_dispatcher(struct adapter *padapter, struct mlme_handler *ptable, struct recv_frame *precv_frame)
+static void _mgt_dispatcher(struct adapter *padapter, struct action_handler *ptable, struct recv_frame *precv_frame)
 {
 	u8 bc_addr[ETH_ALEN] = {0xff, 0xff, 0xff, 0xff, 0xff, 0xff};
 	u8 *pframe = precv_frame->rx_data;
@@ -408,7 +408,7 @@ static void _mgt_dispatcher(struct adapter *padapter, struct mlme_handler *ptabl
 void mgt_dispatcher(struct adapter *padapter, struct recv_frame *precv_frame)
 {
 	int index;
-	struct mlme_handler *ptable;
+	struct action_handler *ptable;
 #ifdef CONFIG_88EU_AP_MODE
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 #endif /* CONFIG_88EU_AP_MODE */
diff --git a/drivers/staging/r8188eu/include/rtw_mlme_ext.h b/drivers/staging/r8188eu/include/rtw_mlme_ext.h
index d2f4d3ce7b90..6175abbc5029 100644
--- a/drivers/staging/r8188eu/include/rtw_mlme_ext.h
+++ b/drivers/staging/r8188eu/include/rtw_mlme_ext.h
@@ -213,12 +213,6 @@ enum SCAN_STATE {
 	SCAN_STATE_MAX,
 };

-struct mlme_handler {
-	unsigned int   num;
-	char *str;
-	unsigned int (*func)(struct adapter *adapt, struct recv_frame *frame);
-};
-
 struct action_handler {
 	unsigned int   num;
 	char* str;
--
2.32.0

