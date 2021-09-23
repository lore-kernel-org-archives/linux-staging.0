Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0232E3FCF
	for <linux-staging@lists.linux.dev>; Thu, 23 Sep 2021 19:09:39 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id u15so20112547wru.6
        for <linux-staging@lists.linux.dev>; Thu, 23 Sep 2021 12:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3vBZp68Yhk5l6nMspT4ibXT8y5p8fYROMJidP+c50QI=;
        b=grBf+Tc6UZl9uIjyBXhKCkDh4KCST25IOAS8FUgilsnCFYjAgMxdtggbvxZCy0k0jY
         7ZAT06kza7bjMvvBr7mlqa+VCaGUpyNd4MbK0XrciFgmmJzUL0YgYbdmK8G/2VwkBclu
         qJ/2Qpgmyas4J/XuHP0B6Von3OGXL4E45aaXVUO5JCwA3I4SNzvW9Qbpl92ZXMeHS0r9
         irUJj5N2Z+P1Mp3cf4WqjttoftY9hmH0dK2a2Iwa1WCvFF2E2LE3Evt7AtKdiWDvTxI3
         ohbLZiHg6A6Fp1CQn/ZvkvKNvaldP263/qfLsJJpOcYtWdrgwqvuYeJoNajIciDnTHfh
         obmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3vBZp68Yhk5l6nMspT4ibXT8y5p8fYROMJidP+c50QI=;
        b=JusMNSd3wjeIBERq+OKk9yJtoo3bwes7HBxSvrq+ltbTQUn32JPicCaW2VPa9UDRk3
         kc012LrWMSU/cBbLnZGb2U+z2EbH4GEcI0LEK0MOQ3YwYs0Fh1rk1acegpV+gk77uBc2
         M9aqE9YGhzofyOyKzOfNTy5+tUkfuTMTckOIM6lW46FVekY0VmuekESdTXsQdzIlbC3n
         2PxUUKiPsjK96R6xpQ38Lde3U+KqjBlhMeyJc0wUp+da4SYN7JeHFwQ+aDvDwM+cJ7n1
         jdgtn6lOsLcet7pjtTiuaPggrx5vrXSOfPXdbgvKS9UHreYkon0v6TQ3fxDt1ST08Mvp
         82bw==
X-Gm-Message-State: AOAM531Pgpr7BTWMTNSzIV9/b0975jFXsfmeRTYi1uQg7J1dkLtci2eF
	QJJi8gBGh+9ckaDausdI5Z8=
X-Google-Smtp-Source: ABdhPJzSqVM5NAYB5oVzcl0SEd2/+oZ6WAlv38jMoS8e+cPztWyRithvPHVzYPQxiqxQjjbdvWGO8Q==
X-Received: by 2002:a05:600c:3b1b:: with SMTP id m27mr17668777wms.15.1632424178166;
        Thu, 23 Sep 2021 12:09:38 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::cad])
        by smtp.gmail.com with ESMTPSA id e28sm6323591wrc.10.2021.09.23.12.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Sep 2021 12:09:37 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 11/17] staging: r8188eu: remove rtw_setbasicrate_cmd()
Date: Thu, 23 Sep 2021 21:09:14 +0200
Message-Id: <20210923190920.3580-12-straube.linux@gmail.com>
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

Function rtw_setbasicrate_cmd() is not used, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_cmd.c    | 30 -----------------------
 drivers/staging/r8188eu/include/rtw_cmd.h |  1 -
 2 files changed, 31 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index c2be84b474f9..01e3fcaada3e 100644
--- a/drivers/staging/r8188eu/core/rtw_cmd.c
+++ b/drivers/staging/r8188eu/core/rtw_cmd.c
@@ -475,36 +475,6 @@ u8 rtw_setdatarate_cmd(struct adapter *padapter, u8 *rateset)
 	return res;
 }
 
-u8 rtw_setbasicrate_cmd(struct adapter *padapter, u8 *rateset)
-{
-	struct cmd_obj *ph2c;
-	struct setbasicrate_parm *pssetbasicratepara;
-	struct cmd_priv *pcmdpriv = &padapter->cmdpriv;
-	u8	res = _SUCCESS;
-
-	ph2c = kzalloc(sizeof(struct cmd_obj), GFP_ATOMIC);
-	if (!ph2c) {
-		res = _FAIL;
-		goto exit;
-	}
-	pssetbasicratepara = kzalloc(sizeof(struct setbasicrate_parm), GFP_ATOMIC);
-
-	if (!pssetbasicratepara) {
-		kfree(ph2c);
-		res = _FAIL;
-		goto exit;
-	}
-
-	init_h2fwcmd_w_parm_no_rsp(ph2c, pssetbasicratepara, _SetBasicRate_CMD_);
-
-	memcpy(pssetbasicratepara->basicrates, rateset, NumRates);
-
-	res = rtw_enqueue_cmd(pcmdpriv, ph2c);
-exit:
-
-	return res;
-}
-
 /*
 unsigned char rtw_setphy_cmd(unsigned char  *adapter)
 
diff --git a/drivers/staging/r8188eu/include/rtw_cmd.h b/drivers/staging/r8188eu/include/rtw_cmd.h
index 6a8dbfdf0bc4..bb6163941742 100644
--- a/drivers/staging/r8188eu/include/rtw_cmd.h
+++ b/drivers/staging/r8188eu/include/rtw_cmd.h
@@ -756,7 +756,6 @@ u8 rtw_joinbss_cmd(struct adapter  *padapter, struct wlan_network* pnetwork);
 u8 rtw_disassoc_cmd(struct adapter *padapter, u32 deauth_timeout_ms, bool enqueue);
 u8 rtw_setopmode_cmd(struct adapter  *padapter, enum ndis_802_11_network_infra networktype);
 u8 rtw_setdatarate_cmd(struct adapter  *padapter, u8 *rateset);
-u8 rtw_setbasicrate_cmd(struct adapter  *padapter, u8 *rateset);
 u8 rtw_setbbreg_cmd(struct adapter * padapter, u8 offset, u8 val);
 u8 rtw_setrfreg_cmd(struct adapter * padapter, u8 offset, u32 val);
 u8 rtw_setrfintfs_cmd(struct adapter  *padapter, u8 mode);
-- 
2.33.0

