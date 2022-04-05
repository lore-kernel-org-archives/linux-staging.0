Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com [209.85.167.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E74715A8;
	Tue,  5 Apr 2022 01:10:59 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id 12so11871098oix.12;
        Mon, 04 Apr 2022 18:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VzJuXZ9eAb1KbZEWv1/dEtK+XWHxhBleYz6kLAiV4gY=;
        b=DrvygdXalZezWv1MQ0WRDEj5UYJ64eGH5HWGqltOYGkdKAnx/lPrgsAzLeDlQlfReh
         DLqg5JQUTauq8DJ9XI3od9xUX/XR6rjV9ix4i3/LCFQyrVljE4DUEVF2yrIOrt7BQ5iv
         eq3r4dTrEsVrQSEXFFacl93v7o+8bElG1jD46buEPbSGemMOD+6uYUipRQADDtyijF3a
         d6s5ILB0McS8+A9XY6n35Dg0+KouaIpGxGdNXk+upukO8Hou36++SYmi1MSuiz8cRdF4
         EiXBnZaH+CEYggJQ4lwbRQQEgmBjVqRK62KmdWKfX1C71bb75zSrdYRhyKNzORnej2Lt
         719g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VzJuXZ9eAb1KbZEWv1/dEtK+XWHxhBleYz6kLAiV4gY=;
        b=iuTRC8VG1HRwX9yWXZxruvsiRvq4nAitLwvixl13DXUeqgJfZhc4vGYJsjWQrc++lj
         0krRn7LrTL4UyZ1qMFpRsMIgzWqUOJDrhNomMZBjSJlcIyQCUvgKVBs0BixTCQ3Tu8HF
         3obddvdA3NWSzmnxYUdq/j48rbC3e7KYiXlmkgDiOYiAbDSx3k+TnZ+CfmRXKngLKkif
         qxAEVi+z46N2WDq+iEIInx8BmxUoPbLYOhZB+c+xFS8KBdq7P/Gn4WNhE+orEjiRwKMJ
         RGDCSjJ9R49TO/5LB76OVey1xize7SvV6DRqQrHJrrf9Krx5bPJCxQfrVplg0zf9ewYd
         PLgQ==
X-Gm-Message-State: AOAM5328bV0UDjGLrmkITGl9K/tp37X+SXKImHwd4480TGHklviLrGfu
	nexA0nF/u55RC8qhAhkNNjA=
X-Google-Smtp-Source: ABdhPJyotuFQtGaDCSLIsEJnKpCvz+zqmaRK8vQTtrNMYpSYYIZHAm4+PGP/+cy0cBO4nvHgtiffvw==
X-Received: by 2002:aca:2b0b:0:b0:2da:3ed3:f862 with SMTP id i11-20020aca2b0b000000b002da3ed3f862mr479814oik.65.1649121058510;
        Mon, 04 Apr 2022 18:10:58 -0700 (PDT)
Received: from bertie (072-190-140-117.res.spectrum.com. [72.190.140.117])
        by smtp.gmail.com with ESMTPSA id j4-20020a9d7384000000b005b23499b66dsm5243274otk.23.2022.04.04.18.10.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Apr 2022 18:10:58 -0700 (PDT)
From: Rebecca Mckeever <remckee0@gmail.com>
To: outreachy@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rebecca Mckeever <remckee0@gmail.com>,
	Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH 2/2] staging: rtl8723bs: combine both sides of conditional statement
Date: Mon,  4 Apr 2022 20:10:44 -0500
Message-Id: <23cfd782614e09f57a514aab68407183702b0a2c.1649120568.git.remckee0@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1649120568.git.remckee0@gmail.com>
References: <cover.1649120568.git.remckee0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both sides of conditional statement are the same except for the comment.
Additional instances found with git grep.

Suggested-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Rebecca Mckeever <remckee0@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index c16a2b644296..b4170f64d118 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -1885,11 +1885,9 @@ void rtw_survey_cmd_callback(struct adapter *padapter,  struct cmd_obj *pcmd)
 {
 	struct	mlme_priv *pmlmepriv = &padapter->mlmepriv;
 
-	if (pcmd->res == H2C_DROPPED) {
+	if (pcmd->res != H2C_SUCCESS) {
 		/* TODO: cancel timer and do timeout handler directly... */
 		_set_timer(&pmlmepriv->scan_to_timer, 1);
-	} else if (pcmd->res != H2C_SUCCESS) {
-		_set_timer(&pmlmepriv->scan_to_timer, 1);
 	}
 
 	/*  free cmd */
@@ -1915,11 +1913,9 @@ void rtw_joinbss_cmd_callback(struct adapter *padapter,  struct cmd_obj *pcmd)
 {
 	struct	mlme_priv *pmlmepriv = &padapter->mlmepriv;
 
-	if (pcmd->res == H2C_DROPPED) {
+	if (pcmd->res != H2C_SUCCESS) {
 		/* TODO: cancel timer and do timeout handler directly... */
 		_set_timer(&pmlmepriv->assoc_timer, 1);
-	} else if (pcmd->res != H2C_SUCCESS) {
-		_set_timer(&pmlmepriv->assoc_timer, 1);
 	}
 
 	rtw_free_cmd_obj(pcmd);
-- 
2.32.0

