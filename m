Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5157ED1
	for <linux-staging@lists.linux.dev>; Sun, 10 Apr 2022 16:31:59 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id s21so7589922pgv.13
        for <linux-staging@lists.linux.dev>; Sun, 10 Apr 2022 09:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=u9rqV99953emrj7ssEIoOOZLspKEgCoMFpGDn+F1RrE=;
        b=Pzi94e4PpDZb5dCXz3nOcQirN1WWnCfBSnZLadD3vR0Ksctj63D2PqayZL7k4oG97f
         FLKr4DEWu5Lr5W0NpB/FuBLMvFDF5GS21FeLZjKk9ehFt2HXbzV+yMaVFh2iPJahsixA
         vBSXLPi8yVdTZusIcTMRNSBzBmZUbk8/4TxsOasguNJMk91n0kpRa9QM8WjJKyPZtwWm
         pKKRVWJi4CQTNmZVsgKP+LkIxuanA89K/oWq9NhZQIKYCNaVvqJnXNaL5efqlLxckJ5H
         jM066WxV9vXtQUXDZTv9vNZ1ogM6QkQs65QRgRFNhBaMynBWnl/LDjT+g3JEogDc/0zc
         FXYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=u9rqV99953emrj7ssEIoOOZLspKEgCoMFpGDn+F1RrE=;
        b=WqVERLZzfRE52aSuQuSu2LkAtSoLAvLuoEW0XzWi4hW2s4MUAbC949vQNNvoPaFP/a
         bFHAwMCvKUfJAmg/4emMl4La0LlkZEqg8MugT6FXwdOS29mYrMbvQVuyo0jQ2Ktlqr6w
         q063U/g2abmAfql0Zfa2KwvPbFY7jwZrM14IHJS+6WsK96z+r/g/m5HM0c++lua5OkXD
         yNsr3fILTMkNgzGFdnykCFqu39E/fZgZMcRJuYfAAYV2TZFcRNlWGdNr+SQERU0ffZMq
         x+upICuqV1TE311jCAx5t3FAFmjUDs+/w+1emK7q3FhuMvsLbfSHjusQOKCS7C3iLr/c
         4xmA==
X-Gm-Message-State: AOAM530gntVsPEkLfhMKDPTpivF0Gy9oYiiJlrgVBWvZ7O9sQjov3FtC
	4LnfRjjmvp7KWIORDM3A2eU=
X-Google-Smtp-Source: ABdhPJzrVAXlGTxXOkCRkcBojbjEjxvI9GxlPSJj/qD9/PgEGvUAZBxDFnu1Gnf1fOi5+o1enspZXQ==
X-Received: by 2002:a63:3f84:0:b0:381:f11:20d7 with SMTP id m126-20020a633f84000000b003810f1120d7mr23502541pga.612.1649608319361;
        Sun, 10 Apr 2022 09:31:59 -0700 (PDT)
Received: from makvihas.localhost.com ([2405:201:202b:15:606b:10e4:2085:6825])
        by smtp.gmail.com with ESMTPSA id f12-20020a056a001acc00b004fb37ecc6b2sm31940021pfv.29.2022.04.10.09.31.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Apr 2022 09:31:59 -0700 (PDT)
From: Vihas Makwana <makvihas@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	Vihas Makwana <makvihas@gmail.com>
Subject: [PATCH 3/6] staging: r8188eu: drop unnecessary wrapper rtw_init_evt_priv
Date: Sun, 10 Apr 2022 22:01:14 +0530
Message-Id: <20220410163117.3964-4-makvihas@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220410163117.3964-1-makvihas@gmail.com>
References: <20220410163117.3964-1-makvihas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the unnecessary wrapper. The logic of rtw_init_evt_priv can
be moved to _rtw_init_evt_priv.

Signed-off-by: Vihas Makwana <makvihas@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_cmd.c    | 11 +----------
 drivers/staging/r8188eu/include/rtw_cmd.h |  2 +-
 drivers/staging/r8188eu/os_dep/os_intfs.c |  2 +-
 3 files changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index d843e9997..ac6e710e5 100644
--- a/drivers/staging/r8188eu/core/rtw_cmd.c
+++ b/drivers/staging/r8188eu/core/rtw_cmd.c
@@ -58,7 +58,7 @@ int _rtw_init_cmd_priv(struct cmd_priv *pcmdpriv)
 
 static void c2h_wk_callback(struct work_struct *work);
 
-static int _rtw_init_evt_priv(struct evt_priv *pevtpriv)
+int _rtw_init_evt_priv(struct evt_priv *pevtpriv)
 {
 	int res = _SUCCESS;
 
@@ -139,15 +139,6 @@ static struct cmd_obj *_rtw_dequeue_cmd(struct __queue *queue)
 	return obj;
 }
 
-u32 rtw_init_evt_priv(struct evt_priv *pevtpriv)
-{
-	int	res;
-
-	res = _rtw_init_evt_priv(pevtpriv);
-
-	return res;
-}
-
 static int rtw_cmd_filter(struct cmd_priv *pcmdpriv, struct cmd_obj *cmd_obj)
 {
 	u8 bAllow = false; /* set to true to allow enqueuing cmd when hw_init_completed is false */
diff --git a/drivers/staging/r8188eu/include/rtw_cmd.h b/drivers/staging/r8188eu/include/rtw_cmd.h
index ab47d3785..7edce0f88 100644
--- a/drivers/staging/r8188eu/include/rtw_cmd.h
+++ b/drivers/staging/r8188eu/include/rtw_cmd.h
@@ -85,7 +85,7 @@ int rtw_cmd_thread(void *context);
 int _rtw_init_cmd_priv(struct cmd_priv *pcmdpriv);
 void _rtw_free_cmd_priv(struct cmd_priv *pcmdpriv);
 
-u32 rtw_init_evt_priv(struct evt_priv *pevtpriv);
+int _rtw_init_evt_priv(struct evt_priv *pevtpriv);
 void rtw_free_evt_priv(struct evt_priv *pevtpriv);
 void rtw_evt_notify_isr(struct evt_priv *pevtpriv);
 u8 p2p_protocol_wk_cmd(struct adapter *padapter, int intCmdType);
diff --git a/drivers/staging/r8188eu/os_dep/os_intfs.c b/drivers/staging/r8188eu/os_dep/os_intfs.c
index c611e9246..f041c3d87 100644
--- a/drivers/staging/r8188eu/os_dep/os_intfs.c
+++ b/drivers/staging/r8188eu/os_dep/os_intfs.c
@@ -473,7 +473,7 @@ u8 rtw_init_drv_sw(struct adapter *padapter)
 
 	padapter->cmdpriv.padapter = padapter;
 
-	if ((rtw_init_evt_priv(&padapter->evtpriv)) == _FAIL) {
+	if ((_rtw_init_evt_priv(&padapter->evtpriv)) == _FAIL) {
 		dev_err(dvobj_to_dev(padapter->dvobj), "rtw_init_evt_priv failed\n");
 		goto free_cmd_priv;
 	}
-- 
2.30.2

