Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451E63FC7
	for <linux-staging@lists.linux.dev>; Thu, 23 Sep 2021 19:09:38 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id t8so20249582wri.1
        for <linux-staging@lists.linux.dev>; Thu, 23 Sep 2021 12:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1Ft3bNDgT8B4W6g5ne4vHNsmYverSTcCb65Lz7xgYY8=;
        b=Nc4GZg2C9kgkHmghD+zHSlCoYLkBCiIlWl7EN7uOp4XFPwg4xp4HN1eNnWAZgFcZ09
         R3nfG4pVVEoFiuNybmuEQIGPXhWiFu3lbV3NUTeGINHEdBieCthKORapJJfbGHDjcq1A
         jD86gvecjydPtZExzRYFdWRQiaeLzBjoX4Zyhna37LhrIjl/kDVtvpdWGQlsumxMtC5s
         C/x8AJh8t7GpV1glolFLmYdSSwlIHJF1IiepyyiwNP3o4wWfQBkrBtBhklKeIJcqKxL/
         CRcXYGh6CBGTonUUSLMHiYn/92EnugHZBONMsljRZal+v4VbR6Op79UecXyODPhQxMqD
         eDvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1Ft3bNDgT8B4W6g5ne4vHNsmYverSTcCb65Lz7xgYY8=;
        b=kSnv7Tm3Sydny2Q1Thok89WyA0d3ulU16vvDi9qO+OqDGVTvlvOi3Zv6QLTCaW49mn
         K9fTC2uYDk5JCXve5vR7rrajwBO9piTC1PnsMiJfnZq3jdbg599Fn8ST3baMj4Qs2I8c
         b5MjSlI1QES4ot8b6j6S1dIRo8Qh4BImdFHHXnbZoNMfUViocot1Z17NVpdz64TtiH42
         vQASI7BjL3TUnI6Ofd7tlhNncRUDdjqN9c6JXppJWLd1/q7YQUg/sbydxoy97IXSm5Y/
         8NLVvTOevAcYo1EPL4kyFUVq+9bN3/uXyN0B6l8Q2+2WWJ45EsB0XKNeJOTSrgE7e1rW
         +0uQ==
X-Gm-Message-State: AOAM530jxOOIgaL/l3hprxpZDh02F4Z+9FShVyJbpych1tmBZOUOoIf7
	1Wsrf8ByF4PEI0v5+pT0aS8=
X-Google-Smtp-Source: ABdhPJytoltHNrNXwCxE1DrHQjKYXWPtUIusEYct+oIUbbNb9/a295TXwlAabd4ltY8hid4HtIz29g==
X-Received: by 2002:a05:600c:1552:: with SMTP id f18mr17301400wmg.184.1632424176677;
        Thu, 23 Sep 2021 12:09:36 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::cad])
        by smtp.gmail.com with ESMTPSA id e28sm6323591wrc.10.2021.09.23.12.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Sep 2021 12:09:36 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 09/17] staging: r8188eu: remove rtw_set_csa_cmd()
Date: Thu, 23 Sep 2021 21:09:12 +0200
Message-Id: <20210923190920.3580-10-straube.linux@gmail.com>
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

Function rtw_set_csa_cmd() is not used, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_cmd.c    | 32 -----------------------
 drivers/staging/r8188eu/include/rtw_cmd.h |  1 -
 2 files changed, 33 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index a10fde30dc69..c7ac4a100367 100644
--- a/drivers/staging/r8188eu/core/rtw_cmd.c
+++ b/drivers/staging/r8188eu/core/rtw_cmd.c
@@ -1136,38 +1136,6 @@ u8 rtw_set_chplan_cmd(struct adapter *padapter, u8 chplan, u8 enqueue)
 	return res;
 }
 
-u8 rtw_set_csa_cmd(struct adapter *padapter, u8 new_ch_no)
-{
-	struct	cmd_obj *pcmdobj;
-	struct	SetChannelSwitch_param *setChannelSwitch_param;
-	struct	cmd_priv   *pcmdpriv = &padapter->cmdpriv;
-
-	u8	res = _SUCCESS;
-
-	pcmdobj = kzalloc(sizeof(struct cmd_obj), GFP_ATOMIC);
-	if (!pcmdobj) {
-		res = _FAIL;
-		goto exit;
-	}
-
-	setChannelSwitch_param = kzalloc(sizeof(struct	SetChannelSwitch_param),
-					 GFP_ATOMIC);
-	if (!setChannelSwitch_param) {
-		kfree(pcmdobj);
-		res = _FAIL;
-		goto exit;
-	}
-
-	setChannelSwitch_param->new_ch_no = new_ch_no;
-
-	init_h2fwcmd_w_parm_no_rsp(pcmdobj, setChannelSwitch_param, GEN_CMD_CODE(_SetChannelSwitch));
-	res = rtw_enqueue_cmd(pcmdpriv, pcmdobj);
-
-exit:
-
-	return res;
-}
-
 u8 rtw_tdls_cmd(struct adapter *padapter, u8 *addr, u8 option)
 {
 	return _SUCCESS;
diff --git a/drivers/staging/r8188eu/include/rtw_cmd.h b/drivers/staging/r8188eu/include/rtw_cmd.h
index bca7a0dba601..0881c9b99dac 100644
--- a/drivers/staging/r8188eu/include/rtw_cmd.h
+++ b/drivers/staging/r8188eu/include/rtw_cmd.h
@@ -780,7 +780,6 @@ u8 rtw_ps_cmd(struct adapter*padapter);
 u8 rtw_chk_hi_queue_cmd(struct adapter*padapter);
 
 u8 rtw_set_chplan_cmd(struct adapter*padapter, u8 chplan, u8 enqueue);
-u8 rtw_set_csa_cmd(struct adapter*padapter, u8 new_ch_no);
 u8 rtw_tdls_cmd(struct adapter *padapter, u8 *addr, u8 option);
 
 u8 rtw_c2h_wk_cmd(struct adapter *padapter, u8 *c2h_evt);
-- 
2.33.0

