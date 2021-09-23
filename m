Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD2D3FC7
	for <linux-staging@lists.linux.dev>; Thu, 23 Sep 2021 19:09:42 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id d21so19994136wra.12
        for <linux-staging@lists.linux.dev>; Thu, 23 Sep 2021 12:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xEbzIwLK/Xvr0Muz7SnuyCofjdeJtEqSOMje7EWn9ZU=;
        b=jewXKrJhpU7Sy39EXg08eAI12ZanqFkMs0M3fmp6q4BBWfEmwPjQNUKct4vsQTWPeP
         j+Zj39zixN/l87atu6QjblQyDJfTzgAAQ2JPJeyEoYWMmCyHF8YGwD/nGAybG++grXs7
         TTi15o5eJxhZRmn2XZ1Ro6AqdK2TTUKA2ouR35UgczTXNBpb5zCyVI87dJuxvCgkSEqc
         grh/GHmE1MX3XhNucTPZQtIzqycNVUagzxKW1ijV8q6QXPeLLNtU/ZBR9UEQnsr5BtEO
         2For15ZbNt7iNIkhSY8h0tHMBz6YPjZoROtJhGlI00lxJGFL18eqsE3vimk4ZYkJsLyY
         UN+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xEbzIwLK/Xvr0Muz7SnuyCofjdeJtEqSOMje7EWn9ZU=;
        b=pnTM2Y13mCSGZcK/MoLIJtgINWtb+hIQEfrPQ+YLClI2hJsesdn6mKB3IHsJba9BzK
         MRlW6bYX2hED6HmmlTUL0Z7v2byysp27jj6OcDoCbDVpb67DMqLCdWpESI5sP9/+Z6c2
         65uZkL7OaSxO99HUN5ADXQCJq5PDKswg5XU1JD2AxvHW6XgEGyQZ4+3d4hHvpF8xY9Gw
         Zn43ppee9+MYo8d+MQhP35U7/T7OkJjgQC4lU+1wRmwm4Wa5/XR3j6CvGm+JHW76J2Mi
         AAy3tSiAOjmnDMSaK1mUBmBJXNoBhHYZyzUUzsSKcX7qv6d+L92CYsDrnvfbb9vcAIbe
         SovQ==
X-Gm-Message-State: AOAM532NAXV/GrkmFgEhvjIeLHs7w6QwJ11jVCuxoXICsA6jRycy7LvK
	vjiVw7mCtvcXsRsjEbSV5qU=
X-Google-Smtp-Source: ABdhPJzkaz9LWhbL1PgNURl+G6sC/drb8pRV2jd+8RowUHTKjUG/R7eQVLgYQ3DY5/NPx7xg2/3y0g==
X-Received: by 2002:adf:d209:: with SMTP id j9mr7136850wrh.97.1632424180676;
        Thu, 23 Sep 2021 12:09:40 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::cad])
        by smtp.gmail.com with ESMTPSA id e28sm6323591wrc.10.2021.09.23.12.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Sep 2021 12:09:40 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 14/17] staging: r8188eu: remove rtw_setrfreg_cmd()
Date: Thu, 23 Sep 2021 21:09:17 +0200
Message-Id: <20210923190920.3580-15-straube.linux@gmail.com>
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

Function rtw_setrfreg_cmd() is not used, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_cmd.c    | 31 -----------------------
 drivers/staging/r8188eu/include/rtw_cmd.h |  1 -
 2 files changed, 32 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index 9b36b23fecf7..52edf3def405 100644
--- a/drivers/staging/r8188eu/core/rtw_cmd.c
+++ b/drivers/staging/r8188eu/core/rtw_cmd.c
@@ -475,37 +475,6 @@ u8 rtw_setdatarate_cmd(struct adapter *padapter, u8 *rateset)
 	return res;
 }
 
-u8 rtw_setrfreg_cmd(struct adapter  *padapter, u8 offset, u32 val)
-{
-	struct cmd_obj *ph2c;
-	struct writeRF_parm *pwriterfparm;
-	struct cmd_priv	*pcmdpriv = &padapter->cmdpriv;
-	u8	res = _SUCCESS;
-
-	ph2c = kzalloc(sizeof(struct cmd_obj), GFP_ATOMIC);
-	if (!ph2c) {
-		res = _FAIL;
-		goto exit;
-	}
-	pwriterfparm = kzalloc(sizeof(struct writeRF_parm), GFP_ATOMIC);
-
-	if (!pwriterfparm) {
-		kfree(ph2c);
-		res = _FAIL;
-		goto exit;
-	}
-
-	init_h2fwcmd_w_parm_no_rsp(ph2c, pwriterfparm, GEN_CMD_CODE(_SetRFReg));
-
-	pwriterfparm->offset = offset;
-	pwriterfparm->value = val;
-
-	res = rtw_enqueue_cmd(pcmdpriv, ph2c);
-exit:
-
-	return res;
-}
-
 void rtw_getbbrfreg_cmdrsp_callback(struct adapter *padapter,  struct cmd_obj *pcmd)
 {
 
diff --git a/drivers/staging/r8188eu/include/rtw_cmd.h b/drivers/staging/r8188eu/include/rtw_cmd.h
index 2b5672ac9ad6..9ec0332e96f4 100644
--- a/drivers/staging/r8188eu/include/rtw_cmd.h
+++ b/drivers/staging/r8188eu/include/rtw_cmd.h
@@ -755,7 +755,6 @@ u8 rtw_joinbss_cmd(struct adapter  *padapter, struct wlan_network* pnetwork);
 u8 rtw_disassoc_cmd(struct adapter *padapter, u32 deauth_timeout_ms, bool enqueue);
 u8 rtw_setopmode_cmd(struct adapter  *padapter, enum ndis_802_11_network_infra networktype);
 u8 rtw_setdatarate_cmd(struct adapter  *padapter, u8 *rateset);
-u8 rtw_setrfreg_cmd(struct adapter * padapter, u8 offset, u32 val);
 u8 rtw_setrfintfs_cmd(struct adapter  *padapter, u8 mode);
 u8 rtw_setrttbl_cmd(struct adapter  *padapter, struct setratable_parm *prate_table);
 
-- 
2.33.0

