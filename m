Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3182C85
	for <linux-staging@lists.linux.dev>; Thu,  4 Nov 2021 03:03:05 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id h74so4482021pfe.0
        for <linux-staging@lists.linux.dev>; Wed, 03 Nov 2021 20:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=3TbuVrqIHgoJItA0iZIsVPVT8KU30Jz3Smu+Nxso5mw=;
        b=X3Up2YGaJ2EQyVHNyGp+Md+8unbD3tz2EwR8DJc0mDIncnRmdMumaTj17ZZWskrz19
         uwPnu0WQ1JNIJH8NAmj4CKtrhISKBuyJZRjC82gln8gd7O6qQ9npyAZE97/1MzSoqyM+
         hN958CQo1eND3gnqpM5S+QwGGZ9DfWjgusVGU+cm9oP6RBAPR+7PNojDZulTfzQEd+a5
         3XQPmx2goitRYohc45ZKh3H7o4Byf8ofCiEvBDCSZMEe+EQMIYLfEpoGTjsVuAzoCEji
         PcoKHdU3StS2gvjY5RLSGnXY9L7GUCSAxHGRYSyWxS6GV4xR809MAPSQaJSWgpys/GjV
         XEsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=3TbuVrqIHgoJItA0iZIsVPVT8KU30Jz3Smu+Nxso5mw=;
        b=kcgVyDuwo8wu3UtyokBO2mD/vtHxWhwAylR47YjZOqHtEenWCZos3xLSGKQcyfV3QE
         S9dPIvqSxrZ1JnS20arNTd8gzWUt5YOzocQvDQnete4xrYut2FENwIsf4yEX1FQ4FZm5
         O1fFPm3YyO8MdE518VNjRsqgxcbvr7G3ONkk0+96YBX3P+7EiR4VI9pnZx3sKCAn9siI
         YW2Z0f+SUW5CFiPed+2mz9Cpm5HqHWYamtvs0Kt3mTfAStfl6vlthWeTyJgk1HJ7ppAI
         LMo5vSVCjFGPTqTEDjl4WqDtpW4sxllWU4uwa+jd65iLw1HYJNGxT9XcJMdOp/s079zh
         Aeug==
X-Gm-Message-State: AOAM532ZwaryS9clYgBDFtag7aZW3gC5kac5legCvFKiqTqFkmjgRmxS
	n5fXgFxz1Wz92+DjVPCkqs0=
X-Google-Smtp-Source: ABdhPJy1HKFE4qWdl7sA91g3enosuIJfnU1FFZH9a5c+8iIl+dTuaSsEcf/W8BQSIezcA3K7Bo09rQ==
X-Received: by 2002:a63:cf48:: with SMTP id b8mr15940318pgj.434.1635994985308;
        Wed, 03 Nov 2021 20:03:05 -0700 (PDT)
Received: from Sauravs-MacBook-Air.local ([59.95.84.218])
        by smtp.gmail.com with ESMTPSA id z10sm3665213pfh.106.2021.11.03.20.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Nov 2021 20:03:05 -0700 (PDT)
Date: Thu, 4 Nov 2021 08:32:58 +0530
From: Saurav Girepunje <saurav.girepunje@gmail.com>
To: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	gregkh@linuxfoundation.org, straube.linux@gmail.com,
	saurav.girepunje@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: saurav.girepunje@hotmail.com
Subject: [PATCH] staging: r8188eu: core: remove unused variable sz
Message-ID: <YYNNDXtkICWpk6qj@Sauravs-MacBook-Air.local>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove the unused variable sz from function dynamic_chk_wk_hdl.
This variable is not used on function.

Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_cmd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index e17332677daa..d456c7e8089d 100644
--- a/drivers/staging/r8188eu/core/rtw_cmd.c
+++ b/drivers/staging/r8188eu/core/rtw_cmd.c
@@ -961,7 +961,7 @@ static void traffic_status_watchdog(struct adapter *padapter)
 	pmlmepriv->LinkDetectInfo.bHigherBusyTxTraffic = bHigherBusyTxTraffic;
 }

-static void dynamic_chk_wk_hdl(struct adapter *padapter, u8 *pbuf, int sz)
+static void dynamic_chk_wk_hdl(struct adapter *padapter, u8 *pbuf)
 {
 	struct mlme_priv *pmlmepriv;

@@ -1382,7 +1382,7 @@ u8 rtw_drvextra_cmd_hdl(struct adapter *padapter, unsigned char *pbuf)

 	switch (pdrvextra_cmd->ec_id) {
 	case DYNAMIC_CHK_WK_CID:
-		dynamic_chk_wk_hdl(padapter, pdrvextra_cmd->pbuf, pdrvextra_cmd->type_size);
+		dynamic_chk_wk_hdl(padapter, pdrvextra_cmd->pbuf);
 		break;
 	case POWER_SAVING_CTRL_WK_CID:
 		rtw_ps_processor(padapter);
--
2.33.0

