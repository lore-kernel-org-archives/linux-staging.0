Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81EF23FCF
	for <linux-staging@lists.linux.dev>; Thu, 23 Sep 2021 19:09:41 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id i24so4198156wrc.9
        for <linux-staging@lists.linux.dev>; Thu, 23 Sep 2021 12:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=F3NtaaGbqjy151+4W3CxufbnYFaPjPMNMVa9qbgnmHU=;
        b=gIGP79jp1TGS5DZYgQz4Vl6ciOJJDjuax8TFeDtNSyyL7mhy4DusPLqSRvPKU2Ui0e
         dAKTuP1yHrMUekaneYmvNuE9GTpl/oKbzPTP0u6Epgun+/6jlI5cPL1sjUWrRQCqpKNu
         Usc9KhVYiFEMJ7uauDM9zDrF0FGhrOE/kydBmOhlFTtMQk6CNz5JOAWzqsPPKSUbX5OI
         mf16kS2Eb58e9YZYlSNpwoamKlJUT2604J9u18V8Z/m8AGL2HzP7iH6CYj09c7QrIggi
         ttBDVzuIOUjVh0qQHENE8ytz7ARer42iBX/nzy729JDRqAoCQiUmomHdiJbwEbXBCcHn
         u67A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=F3NtaaGbqjy151+4W3CxufbnYFaPjPMNMVa9qbgnmHU=;
        b=8IHT5rb2DFzoHiOWre/hJUf+J1lR8DRFFEIV9gGN2IJCNEA6sDwmTrkoyqHUpmemzW
         QnFYhYILKo2tTMytwugKov4WU28msXi5MZUaDPdzvPQJ7l1QeFoP54gOgHJGrych1M/o
         LLFr9/ajTDcYxvOadrPdAMlQtzoSire7NcDEkJ62fMAzsfvX9zpmwEY3te1IWr/AUhF3
         W+k+gAOpHr4VGLhesxwVhvh4pKm5E9WETWCF+MItpzzxfDDblBzU3l4H6XwyeafnjYI0
         RR8vSZtH6PXOvdfvoXJFMvUyWeiZY2vaMQaA0/MROLbZsbxVhHWLPRL27HOafYYnEpxZ
         OZcg==
X-Gm-Message-State: AOAM531FaW3i6sefRqzy8FHXVQF3HwqbIUFF6xVVJi2aQgEX2lUU8Aag
	f+gchbVr55FrRB+sTYlHpWI=
X-Google-Smtp-Source: ABdhPJx2yzgrRUHS11NvHjZwfKEgD9iQ26k4QrlDvizYz//tS41HCv0di3BbcNEuuj9YyodY1ozYkg==
X-Received: by 2002:a7b:c242:: with SMTP id b2mr17875612wmj.182.1632424179858;
        Thu, 23 Sep 2021 12:09:39 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::cad])
        by smtp.gmail.com with ESMTPSA id e28sm6323591wrc.10.2021.09.23.12.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Sep 2021 12:09:39 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 13/17] staging: r8188eu: remove rtw_setphy_cmd()
Date: Thu, 23 Sep 2021 21:09:16 +0200
Message-Id: <20210923190920.3580-14-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210923190920.3580-1-straube.linux@gmail.com>
References: <20210923190920.3580-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function rtw_setphy_cmd() is not used, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_cmd.c    | 38 -----------------------
 drivers/staging/r8188eu/include/rtw_cmd.h |  1 -
 2 files changed, 39 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index ec21ac610bfe..9b36b23fecf7 100644
--- a/drivers/staging/r8188eu/core/rtw_cmd.c
+++ b/drivers/staging/r8188eu/core/rtw_cmd.c
@@ -475,44 +475,6 @@ u8 rtw_setdatarate_cmd(struct adapter *padapter, u8 *rateset)
 	return res;
 }
 
-/*
-unsigned char rtw_setphy_cmd(unsigned char  *adapter)
-
-1.  be called only after rtw_update_registrypriv_dev_network(~) or mp testing program
-2.  for AdHoc/Ap mode or mp mode?
-
-*/
-u8 rtw_setphy_cmd(struct adapter *padapter, u8 modem, u8 ch)
-{
-	struct cmd_obj *ph2c;
-	struct setphy_parm *psetphypara;
-	struct cmd_priv	*pcmdpriv = &padapter->cmdpriv;
-	u8	res = _SUCCESS;
-
-	ph2c = kzalloc(sizeof(struct cmd_obj), GFP_ATOMIC);
-	if (!ph2c) {
-		res = _FAIL;
-		goto exit;
-		}
-	psetphypara = kzalloc(sizeof(struct setphy_parm), GFP_ATOMIC);
-
-	if (!psetphypara) {
-		kfree(ph2c);
-		res = _FAIL;
-		goto exit;
-	}
-
-	init_h2fwcmd_w_parm_no_rsp(ph2c, psetphypara, _SetPhy_CMD_);
-
-	psetphypara->modem = modem;
-	psetphypara->rfchannel = ch;
-
-	res = rtw_enqueue_cmd(pcmdpriv, ph2c);
-exit:
-
-	return res;
-}
-
 u8 rtw_setrfreg_cmd(struct adapter  *padapter, u8 offset, u32 val)
 {
 	struct cmd_obj *ph2c;
diff --git a/drivers/staging/r8188eu/include/rtw_cmd.h b/drivers/staging/r8188eu/include/rtw_cmd.h
index f92dca3f1f89..2b5672ac9ad6 100644
--- a/drivers/staging/r8188eu/include/rtw_cmd.h
+++ b/drivers/staging/r8188eu/include/rtw_cmd.h
@@ -749,7 +749,6 @@ u8 rtw_sitesurvey_cmd(struct adapter  *padapter, struct ndis_802_11_ssid *ssid,
 		      int ssid_num, struct rtw_ieee80211_channel *ch,
 		      int ch_num);
 u8 rtw_createbss_cmd(struct adapter  *padapter);
-u8 rtw_setphy_cmd(struct adapter  *padapter, u8 modem, u8 ch);
 u8 rtw_setstakey_cmd(struct adapter *padapter, u8 *psta, u8 unicast_key);
 u8 rtw_clearstakey_cmd(struct adapter *padapter, u8 *psta, u8 entry, u8 enqueue);
 u8 rtw_joinbss_cmd(struct adapter  *padapter, struct wlan_network* pnetwork);
-- 
2.33.0

