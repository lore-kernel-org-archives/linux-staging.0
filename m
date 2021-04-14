Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05EC071
	for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 19:28:01 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id l4so33101623ejc.10
        for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 12:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=av0jQOTJIUMGDZ5JlBg9J5NuC7eaxG6UgWRpBDlzXG0=;
        b=MQMgbj01xhogw78xBc3/IIZV83BqH13/t1wthxCFJtz4Sl9JrcOHGTzbCWuA/NWtCZ
         M0DL18mXdnJNHQBvb94FTB23AlzXykQI4sHguH+iAnDXREGWs/HPvnTe2Gdi+W+96Wsl
         XrjG0Ir0gti0N5CsFS/Ld6dJhlY3m+j1ypDK6LRIgGVXa2gYAyxurCT4PVMHq1wejSZa
         udLd4ytLxSrsXGAiNbuTSv4qW6WNOpbZZeElY+wMccY6EyPNZhZqg4EMUnutbbNYmJm0
         Y2lokRl9jntIn2icSEsLVVdrQlJwPdNTYKvfo4VoNJuzdUclKxY5T2cABxVfQE8Kv5V6
         05Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=av0jQOTJIUMGDZ5JlBg9J5NuC7eaxG6UgWRpBDlzXG0=;
        b=Xd9jbfkkRvvbRAhjWScbkW86cNJXvgsXtl+5B+VY805HqVFBanNyknIEhII5a/zXJv
         dvBK36UjPFhHjV2QmdcQx2HJGh8HTFinswxeNFgVjtb73iouFob0W8jaaT42cZ/w5Qrz
         l0oMf9xTSwdM46ZXdGcaw0LKd9CzRdolg/tZWaJt882WDUNUd4+9NCML7XH8h/pfk80N
         eaWqHYL4jBDWKlW1j+1mcmE7gl1iH16885kvnuVzFSV7X2k9PUoHHmGdoom+Tho88iEv
         CNpByO8PoBrZ93p5Q2/4T2HocNGDV/cnm+x4raKybF5yTtvImqkhubao2PWgAOkSKhkD
         cBvQ==
X-Gm-Message-State: AOAM5328u9TrjV3uzYJrqbrKxYXBDr6nA0N0V7QS+lKDmUbHZIU65PFr
	F3V63croVsIcl+mwAoYrTKw=
X-Google-Smtp-Source: ABdhPJyFex+ge8v/9Ek1h+qTQrz66XUo4d0tRiPFga88An9U8iB+B1ngHuDY+uZcY5QGl49c/I8aKQ==
X-Received: by 2002:a17:906:8293:: with SMTP id h19mr418169ejx.217.1618428479653;
        Wed, 14 Apr 2021 12:27:59 -0700 (PDT)
Received: from linux.local (host-95-237-55-30.retail.telecomitalia.it. [95.237.55.30])
        by smtp.gmail.com with ESMTPSA id gn3sm259049ejc.2.2021.04.14.12.27.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 12:27:59 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: outreachy-kernel@googlegroups.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>,
	Julia Lawall <julia.lawall@inria.fr>,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
	Dan Carpenter <dan.carpenter@oracle.com>
Subject: [Outreachy patch] [PATCH v3 1/2] staging: rtl8723bs: Remove useless led_blink_hdl()
Date: Wed, 14 Apr 2021 21:27:49 +0200
Message-Id: <20210414192750.4974-2-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210414192750.4974-1-fmdefrancesco@gmail.com>
References: <20210414192750.4974-1-fmdefrancesco@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removed useless led_blink_hdl() prototype and definition. In wlancmds[]
the slot #60 is now set to NULL using the macro GEN_MLME_EXT_HANDLER. This
change has not unwanted side effects because the code in rtw_cmd.c checks
if the function pointer is valid before using it.

Reported-by: Julia Lawall <julia.lawall@inria.fr>
Suggested-by: Matthew Wilcox <willy@infradead.org>
Suggested-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---

Changes from v2: no changes.
Changes from v1: Corrected a bad solution to this issue that made use of
an unnecessary dummy function.

 drivers/staging/rtl8723bs/core/rtw_cmd.c         | 2 +-
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c    | 9 ---------
 drivers/staging/rtl8723bs/include/rtw_mlme_ext.h | 1 -
 3 files changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index 0297fbad7bce..f82dbd4f4c3d 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -150,7 +150,7 @@ static struct cmd_hdl wlancmds[] = {
 
 	GEN_MLME_EXT_HANDLER(0, h2c_msg_hdl) /*58*/
 	GEN_MLME_EXT_HANDLER(sizeof(struct SetChannelPlan_param), set_chplan_hdl) /*59*/
-	GEN_MLME_EXT_HANDLER(sizeof(struct LedBlink_param), led_blink_hdl) /*60*/
+	GEN_MLME_EXT_HANDLER(0, NULL) /*60*/
 
 	GEN_MLME_EXT_HANDLER(sizeof(struct SetChannelSwitch_param), set_csa_hdl) /*61*/
 	GEN_MLME_EXT_HANDLER(sizeof(struct TDLSoption_param), tdls_hdl) /*62*/
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 873d3792ac8e..963ea80083c8 100644
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

