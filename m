Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F089A70
	for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 15:59:18 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id v6so25490359ejo.6
        for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 08:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=t80Ay0RM+FSktFuIVmdmHsgIKuVKC6dk8w1F4+C4e8M=;
        b=Q2lfUhHd0jGJMAVNDwb7Opdm+DyQ3AeqNzu23r3ykYgH/NA9048hTnRz8m32kSjeqe
         cC8YY2uu+ifsa8uoo32WCKYYRgnESPEZn/G/gdXHTDeaYnJ5HJh8TwaPWLMUkrfzI2jk
         3gjBiVnIACSyFMIcnUArUvNx3YnGzmqj7gNCdzuJ9y0C4nCUQdEjHmK9xdDweaiavT8T
         +Hivdj6cIIQntQukoQtlJnufFaEf/J1vrXVtbWAxyGYS6PyH3tKuMdD4edzGtHLlHzSR
         UJsHvdZALW/iHhfLAspxsycS7Hj+lwP+1x32T5HwZcOQEz3EPqepURZRGyjTgu08tX/2
         SBgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=t80Ay0RM+FSktFuIVmdmHsgIKuVKC6dk8w1F4+C4e8M=;
        b=GTKplRH6UZQ1DkzSi6PUQ6YfjON9XVLUOKZ1dzbBkZZG9c7sCQ7l2fmLn6QdochDwY
         VP5BTFhVFatmMundqwGqmXE5rYM6b6JeQ5EHbcnGIAE0v1Nl3QekxYvHt634MLbsoEPy
         gNON1YUZ6TBR2HCx3nedooHaH1PECf+WS787OC85TDvnkbInltRWQWrbl+RP0jzygzlT
         BCSgsVGtZemrb5JPUCVgOqElFXWD5Ua1iE8Hb1pXHjrgjq9hzFDo3yzFJOkLsUQNhpbk
         UFtjJ9bepElcLNICpH4LsrM/BWnAB/CqgPqZFAeC+t/yiTIiau/KCxAojB237eWqX3Yq
         e0dw==
X-Gm-Message-State: AOAM530v12zZl6krjGr1B8prfrP6ZWp6txbqFzauQm4JUUQLjxux2Fw2
	t6y4FRx57SyTK0FNEMrdukQ=
X-Google-Smtp-Source: ABdhPJwvcOcs6oBSjuASpP7E87KvEDv66H3z82OyfO6XgkjpRk7CZwks7HuotpHpEhqbcgt48hdlHA==
X-Received: by 2002:a17:907:3f8b:: with SMTP id hr11mr33680401ejc.477.1618329557497;
        Tue, 13 Apr 2021 08:59:17 -0700 (PDT)
Received: from linux.local (host-95-237-55-30.retail.telecomitalia.it. [95.237.55.30])
        by smtp.gmail.com with ESMTPSA id a18sm2119910ejr.76.2021.04.13.08.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 08:59:17 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: outreachy-kernel@googlegroups.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [Outreachy kernel] [PATCH] :staging: rtl8723bs: Remove useless led_blink_hdl()
Date: Tue, 13 Apr 2021 17:59:08 +0200
Message-Id: <20210413155908.8691-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.31.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removed the led_blink_hdl() function (declaration, definition, and
caller code) because it's useless. It only seems to check whether or not a
given pointer is NULL. There are other (simpler) means for that purpose.

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c         | 1 -
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c    | 9 ---------
 drivers/staging/rtl8723bs/include/rtw_mlme_ext.h | 1 -
 3 files changed, 11 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index 0297fbad7bce..4c44dfd21514 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -150,7 +150,6 @@ static struct cmd_hdl wlancmds[] = {
 
 	GEN_MLME_EXT_HANDLER(0, h2c_msg_hdl) /*58*/
 	GEN_MLME_EXT_HANDLER(sizeof(struct SetChannelPlan_param), set_chplan_hdl) /*59*/
-	GEN_MLME_EXT_HANDLER(sizeof(struct LedBlink_param), led_blink_hdl) /*60*/
 
 	GEN_MLME_EXT_HANDLER(sizeof(struct SetChannelSwitch_param), set_csa_hdl) /*61*/
 	GEN_MLME_EXT_HANDLER(sizeof(struct TDLSoption_param), tdls_hdl) /*62*/
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 440e22922106..6f2a0584f977 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -6189,15 +6189,6 @@ u8 set_chplan_hdl(struct adapter *padapter, unsigned char *pbuf)
 	return	H2C_SUCCESS;
 }
 
-u8 led_blink_hdl(struct adapter *padapter, unsigned char *pbuf)
-{
-
-	if (!pbuf)
-		return H2C_PARAMETERS_ERROR;
-
-	return	H2C_SUCCESS;
-}
-
 u8 set_csa_hdl(struct adapter *padapter, unsigned char *pbuf)
 {
 	return	H2C_REJECTED;
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
index 5e6cf63956b8..472818c5fd83 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
@@ -745,7 +745,6 @@ u8 chk_bmc_sleepq_hdl(struct adapter *padapter, unsigned char *pbuf);
 u8 tx_beacon_hdl(struct adapter *padapter, unsigned char *pbuf);
 u8 set_ch_hdl(struct adapter *padapter, u8 *pbuf);
 u8 set_chplan_hdl(struct adapter *padapter, unsigned char *pbuf);
-u8 led_blink_hdl(struct adapter *padapter, unsigned char *pbuf);
 u8 set_csa_hdl(struct adapter *padapter, unsigned char *pbuf);	/* Kurt: Handling DFS channel switch announcement ie. */
 u8 tdls_hdl(struct adapter *padapter, unsigned char *pbuf);
 u8 run_in_thread_hdl(struct adapter *padapter, u8 *pbuf);
-- 
2.31.1

