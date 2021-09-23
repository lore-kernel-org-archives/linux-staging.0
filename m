Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A0ED3FD1
	for <linux-staging@lists.linux.dev>; Thu, 23 Sep 2021 19:09:37 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id t7so20003005wrw.13
        for <linux-staging@lists.linux.dev>; Thu, 23 Sep 2021 12:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hc0JmDX9InuYV/Fu51J33tmC0KeTskY4XhLTBr56OcQ=;
        b=cNAEmNvy5SHAXhnlFeeHUHeSURzBka1CGFT5zUZKpqzdadTW15ZFTemnvbQqZjyX/W
         dpzsfg/Z/xlERzU2FIgswJwevvHwhwkrq5NyUc6kFrU7bUWAUHhpY1QIopoazPu/RmGx
         HpjVQzwsmspfZh3o19mKjvi2/qWzSlCfG6KPXPHY1rUgDOJ1zRPOU0JXihXNohSa6UKg
         JzGRd5F0GQbvhmQQ4R6HM1qrsSnIsuI3HmmiHcaqzr7Bz35MAjmi4dB4ldD1mHMXZzjd
         rKkmalP42WZzUwzqhWcPhydUsCZUzq69888WnpBCQZE5lZ6VKnuDaP66ytDyFnbz/8wT
         dG1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hc0JmDX9InuYV/Fu51J33tmC0KeTskY4XhLTBr56OcQ=;
        b=OgCaAZDazUr7wodiZ1PofqJ8H4i3LdD5KIFzf7ZfDnjkE9cRpl714k4EbtxjWVd3JR
         DTjgSlgrcznu2A0laf3Hyz6pknUS+HOBbNC/yDVmKQZwM95T0fdGBPVotxAxBTgSIrS7
         26DberGQ3KE67X9qbfeCBRCLSZ/mwT42jjdb5pIt28/B2POPNXkS6ViUgxHgHpiDHRq0
         MaMMz1139jbsLRP72J3CAJWcKzzgFwqQ3A0Lk1/Xw5rbR2YxowI2MVIMtg9Gq+XdcQwB
         0KXqTKPlef93AE+2WTaC9fsZQoxciKXlvD144qj8PFDdoym2oeZmm1KEJ6odDysbXOu9
         XmuA==
X-Gm-Message-State: AOAM531xIOGadhPBN4erJRoThaFwl+EsEK7JQH0qbC/SobI0pA2xF7dE
	jfoC9LmYr/eWFvkS5zsbHe4=
X-Google-Smtp-Source: ABdhPJwlCUs6iGD+7OZ3ZdUzdDbI8QQuPKbzGgIoQfz1eqpVZ/AGigXOc5Pz5Ca/m+iM9hKQ1C0c0Q==
X-Received: by 2002:a1c:7310:: with SMTP id d16mr6169920wmb.30.1632424175996;
        Thu, 23 Sep 2021 12:09:35 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::cad])
        by smtp.gmail.com with ESMTPSA id e28sm6323591wrc.10.2021.09.23.12.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Sep 2021 12:09:35 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 08/17] staging: r8188eu: remove rtw_set_ch_cmd()
Date: Thu, 23 Sep 2021 21:09:11 +0200
Message-Id: <20210923190920.3580-9-straube.linux@gmail.com>
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

Function rtw_set_ch_cmd() is not used, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_cmd.c    | 51 -----------------------
 drivers/staging/r8188eu/include/rtw_cmd.h |  1 -
 2 files changed, 52 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index 0b5472558899..a10fde30dc69 100644
--- a/drivers/staging/r8188eu/core/rtw_cmd.c
+++ b/drivers/staging/r8188eu/core/rtw_cmd.c
@@ -1085,57 +1085,6 @@ u8 rtw_dynamic_chk_wk_cmd(struct adapter *padapter)
 	return res;
 }
 
-u8 rtw_set_ch_cmd(struct adapter *padapter, u8 ch, u8 bw, u8 ch_offset, u8 enqueue)
-{
-	struct cmd_obj *pcmdobj;
-	struct set_ch_parm *set_ch_parm;
-	struct cmd_priv *pcmdpriv = &padapter->cmdpriv;
-
-	u8 res = _SUCCESS;
-
-	DBG_88E(FUNC_NDEV_FMT" ch:%u, bw:%u, ch_offset:%u\n",
-		FUNC_NDEV_ARG(padapter->pnetdev), ch, bw, ch_offset);
-
-	/* check input parameter */
-
-	/* prepare cmd parameter */
-	set_ch_parm = kzalloc(sizeof(*set_ch_parm), GFP_ATOMIC);
-	if (!set_ch_parm) {
-		res = _FAIL;
-		goto exit;
-	}
-	set_ch_parm->ch = ch;
-	set_ch_parm->bw = bw;
-	set_ch_parm->ch_offset = ch_offset;
-
-	if (enqueue) {
-		/* need enqueue, prepare cmd_obj and enqueue */
-		pcmdobj = kzalloc(sizeof(struct cmd_obj), GFP_ATOMIC);
-		if (!pcmdobj) {
-			kfree(set_ch_parm);
-			res = _FAIL;
-			goto exit;
-		}
-
-		init_h2fwcmd_w_parm_no_rsp(pcmdobj, set_ch_parm, GEN_CMD_CODE(_SetChannel));
-		res = rtw_enqueue_cmd(pcmdpriv, pcmdobj);
-	} else {
-		/* no need to enqueue, do the cmd hdl directly and free cmd parameter */
-		if (H2C_SUCCESS != set_ch_hdl(padapter, (u8 *)set_ch_parm))
-			res = _FAIL;
-
-		kfree(set_ch_parm);
-	}
-
-	/* do something based on res... */
-
-exit:
-
-	DBG_88E(FUNC_NDEV_FMT" res:%u\n", FUNC_NDEV_ARG(padapter->pnetdev), res);
-
-	return res;
-}
-
 u8 rtw_set_chplan_cmd(struct adapter *padapter, u8 chplan, u8 enqueue)
 {
 	struct	cmd_obj *pcmdobj;
diff --git a/drivers/staging/r8188eu/include/rtw_cmd.h b/drivers/staging/r8188eu/include/rtw_cmd.h
index 86819b0219aa..bca7a0dba601 100644
--- a/drivers/staging/r8188eu/include/rtw_cmd.h
+++ b/drivers/staging/r8188eu/include/rtw_cmd.h
@@ -779,7 +779,6 @@ u8 rtw_ps_cmd(struct adapter*padapter);
 
 u8 rtw_chk_hi_queue_cmd(struct adapter*padapter);
 
-u8 rtw_set_ch_cmd(struct adapter*padapter, u8 ch, u8 bw, u8 ch_offset, u8 enqueue);
 u8 rtw_set_chplan_cmd(struct adapter*padapter, u8 chplan, u8 enqueue);
 u8 rtw_set_csa_cmd(struct adapter*padapter, u8 new_ch_no);
 u8 rtw_tdls_cmd(struct adapter *padapter, u8 *addr, u8 option);
-- 
2.33.0

