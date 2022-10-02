Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA15623C1
	for <linux-staging@lists.linux.dev>; Sun,  2 Oct 2022 07:48:49 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id m15so10852572edb.13
        for <linux-staging@lists.linux.dev>; Sun, 02 Oct 2022 00:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=MeUagKMqLt8xwygfI7Rpy9NQam9xN4XTEL4NIRU0X5U=;
        b=X88fLBEp/yxMlHnIPnDMWluSdNXYBG+JJCy2GcrYkxP4+y4Ew++JA/32GKUKFW064z
         9tEJRuqa7ZzqiZPr4PFMn5qMsd08HP0W/oyekST+9AmfJMiS3hGZrkdr7PoM3UGcrhO4
         Yq/rIPF/0jWYUkrb/KHRjnKRZMH8GTVQkuBdKQGmT40niFD5VQGvwwUdyX231f2peCDF
         TPb+zwrDAMhzLXV3vTRugwxnUfES6dvSYChDrOeoT+iFbT53tZCMtryCAw/pioubTnld
         AzfwBhbNlTzru6OqRhk1ci/wra1YAfpF/GHKdvzFGUx6RlWXS8oweFdul8YVV9KWYfLJ
         HaRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=MeUagKMqLt8xwygfI7Rpy9NQam9xN4XTEL4NIRU0X5U=;
        b=cj9k9FFkV0lElzD06uiFECNAHEPIdwovhpreXYBfmmgyIYSoyT3FuuQdl94HvNmXS5
         sQigMN7KSLm8jjl3OunwtNB6ImJe1fZqEPqZmhZBprzjK76PT/X1P3Phtp/P14bjdS5t
         nMixIKurqzUSHaP7stddjn3HW6128ruK2TLYZaWcjBMX1c4Kmtf5GluteZK70NHo3PVd
         7KTceQZLbHrh3fg2gfVozN/WtE6QYTZrTMMzp6GqWfE0RZPLbrbgJ5A3Cp1a0kbrVbWb
         IrO4ufgz778zUqRGEoR7Xgp1rJ6iEVNKPaoeTXPrHFoVgc9Iu4MJ3+Rb7paWtqmq2afV
         lxTg==
X-Gm-Message-State: ACrzQf2+M9WkJ3N4iouyCD/a10jDkonWjEK02KzP5r7WHXow3ZULFdPL
	pWlGaIcneFHJubQ35eb1t/M=
X-Google-Smtp-Source: AMsMyM4SKYf2u5KGEOkJ72hBl/3xQH6I+tj5+Zc7/drnjl7FqUag/vegCrfr4/0MLTNXinkxIDzXaw==
X-Received: by 2002:a05:6402:3603:b0:451:fdda:dddd with SMTP id el3-20020a056402360300b00451fddaddddmr13748554edb.81.1664696928230;
        Sun, 02 Oct 2022 00:48:48 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb59.dynamic.kabel-deutschland.de. [95.90.187.89])
        by smtp.gmail.com with ESMTPSA id q26-20020a17090676da00b0077ce503bd77sm3608536ejn.129.2022.10.02.00.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Oct 2022 00:48:47 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 2/5] staging: r8188eu: convert rtw_init_evt_priv() to common error logic
Date: Sun,  2 Oct 2022 09:48:24 +0200
Message-Id: <20221002074827.8566-3-straube.linux@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221002074827.8566-1-straube.linux@gmail.com>
References: <20221002074827.8566-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the function rtw_init_evt_priv() to common kernel error logic.
Return 0 on success and negative value on failure. This is part of
getting rid of returning _SUCCESS and _FAIL which uses inverted error
logic and is used all over the driver.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_cmd.c    | 8 +++-----
 drivers/staging/r8188eu/include/rtw_cmd.h | 2 +-
 drivers/staging/r8188eu/os_dep/os_intfs.c | 2 +-
 3 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index 3fadace33de6..88b939e42f5a 100644
--- a/drivers/staging/r8188eu/core/rtw_cmd.c
+++ b/drivers/staging/r8188eu/core/rtw_cmd.c
@@ -90,10 +90,8 @@ u32	rtw_init_cmd_priv(struct cmd_priv *pcmdpriv)
 	return _SUCCESS;
 }
 
-u32 rtw_init_evt_priv(struct evt_priv *pevtpriv)
+int rtw_init_evt_priv(struct evt_priv *pevtpriv)
 {
-	u32 res = _SUCCESS;
-
 	/* allocate DMA-able/Non-Page memory for cmd_buf and rsp_buf */
 	atomic_set(&pevtpriv->event_seq, 0);
 
@@ -101,9 +99,9 @@ u32 rtw_init_evt_priv(struct evt_priv *pevtpriv)
 	pevtpriv->c2h_wk_alive = false;
 	pevtpriv->c2h_queue = rtw_cbuf_alloc(C2H_QUEUE_MAX_LEN + 1);
 	if (!pevtpriv->c2h_queue)
-		res = _FAIL;
+		return -ENOMEM;
 
-	return res;
+	return 0;
 }
 
 void rtw_free_cmd_priv(struct	cmd_priv *pcmdpriv)
diff --git a/drivers/staging/r8188eu/include/rtw_cmd.h b/drivers/staging/r8188eu/include/rtw_cmd.h
index 9a76aa85de94..c6c48e1fb961 100644
--- a/drivers/staging/r8188eu/include/rtw_cmd.h
+++ b/drivers/staging/r8188eu/include/rtw_cmd.h
@@ -85,7 +85,7 @@ int rtw_cmd_thread(void *context);
 u32 rtw_init_cmd_priv(struct cmd_priv *pcmdpriv);
 void rtw_free_cmd_priv(struct cmd_priv *pcmdpriv);
 
-u32 rtw_init_evt_priv(struct evt_priv *pevtpriv);
+int rtw_init_evt_priv(struct evt_priv *pevtpriv);
 void rtw_free_evt_priv(struct evt_priv *pevtpriv);
 void rtw_evt_notify_isr(struct evt_priv *pevtpriv);
 u8 p2p_protocol_wk_cmd(struct adapter *padapter, int intCmdType);
diff --git a/drivers/staging/r8188eu/os_dep/os_intfs.c b/drivers/staging/r8188eu/os_dep/os_intfs.c
index 6a45315d01a2..dd4c89d7390d 100644
--- a/drivers/staging/r8188eu/os_dep/os_intfs.c
+++ b/drivers/staging/r8188eu/os_dep/os_intfs.c
@@ -468,7 +468,7 @@ u8 rtw_init_drv_sw(struct adapter *padapter)
 
 	padapter->cmdpriv.padapter = padapter;
 
-	if ((rtw_init_evt_priv(&padapter->evtpriv)) == _FAIL) {
+	if (rtw_init_evt_priv(&padapter->evtpriv)) {
 		dev_err(dvobj_to_dev(padapter->dvobj), "rtw_init_evt_priv failed\n");
 		goto free_cmd_priv;
 	}
-- 
2.37.3

