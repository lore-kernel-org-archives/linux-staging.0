Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4BF671
	for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 11:52:50 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id d21so3220511edv.9
        for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 04:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zkC+0GDSZPiBQ3vyP0mJ4e2YXFys3MEY7UtDz1Ik6bE=;
        b=H0dJqpPsPHMwV2BZsAoOIyrhgemVsMa6N45me+IX15vhIthYP25vRTOuuIxa9xRVdR
         zBD+Q9Ixc/PhzFZyrMAk7rxdA4W8B6Xqnal2gf9870r1lIYmiEPD/e9USKwa5HiklLQN
         80jKdh6Uq/tmVZWHqUaijnGIOBdFqlwb/+foVxKwlZNveAocTx5MxfyXztHnnQR9BsoT
         9RVn/Xdz6ClT1+sIMy7q+Rg27jxdoZP4UIyua9BsK2rB/zjk3Ju8uo2GjVkvasE4UleT
         9xNyrmxtPj+54iv53E/l2OUBgSrO889WE95EtEZNoUaJoe9CA919LvUAnBhx1izlULOd
         c+Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zkC+0GDSZPiBQ3vyP0mJ4e2YXFys3MEY7UtDz1Ik6bE=;
        b=Bugf/U5ehakvi5DL/I+dfPU7yUVS1gvhJzcEJ1+jHeDZ48CIvme76ZpaTX3gqKH9DL
         AuEL4adHhc6RXckYCHhKeuzUGaBUdGsh4PYvHjQsGGC4ch4iHTmPB1c0EicUFzCkNPVQ
         N1hKiTgTIWxbNco2hZr7Scgy43Vm7+QvP3oxY0+1vvGn6DiSMfK4D3d/je5cVsxEf7hw
         rcYnqgNOzzGhMCOztFTkcLNeDYqe70AhGJwRL+3G5jAgmLHZ9eSD1WBFTxatZcJH6aGu
         2L5FnM5l3kJOgANkT1Ou4HqmVjsx+E9b3u8EoMYiFL3uVcIT5ICgGRnvvD0v110V9xgI
         5Igg==
X-Gm-Message-State: AOAM533rFNRLt1c1MeToTjoBX2YGBtg34t1jYtiPtCBL/BNweIfot/I2
	ZKMnGlEqRzL8tTUmaR2dHCg=
X-Google-Smtp-Source: ABdhPJxSiee1B4qPCKU2WSG9UQsIOve1omYnUdHKQJb/Gh1dsovc5oIrwc2QbTnunUZ+oJSwz9wYHA==
X-Received: by 2002:aa7:d588:: with SMTP id r8mr1003516edq.318.1618401169206;
        Wed, 14 Apr 2021 04:52:49 -0700 (PDT)
Received: from linux.local (host-95-237-55-30.retail.telecomitalia.it. [95.237.55.30])
        by smtp.gmail.com with ESMTPSA id ju23sm9780679ejc.17.2021.04.14.04.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 04:52:48 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: outreachy-kernel@googlegroups.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>,
	Julia Lawall <julia.lawall@inria.fr>,
	Dan Carpenter <dan.carpenter@oracle.com>
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [Outreachy kernel] [PATCH] staging: rtl8723bs: Remove useless led_blink_hdl()
Date: Wed, 14 Apr 2021 13:52:43 +0200
Message-Id: <20210414115243.32716-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.31.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removed the led_blink_hdl() function (declaration and definition).
Declared dummy_function() in include/rtw_mlme_ext.h and defined it in
core/rtw_cmd.c. Changed the second parameter of GEN_MLME_EXT_HANDLER
macro to make use of dummy_function().

Reported-by: Julia Lawall <julia.lawall@inria.fr>
Suggested-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c         | 4 +++-
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c    | 9 ---------
 drivers/staging/rtl8723bs/include/rtw_mlme_ext.h | 3 ++-
 3 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index 0297fbad7bce..7b6102a2bb2c 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -87,6 +87,8 @@ static struct _cmd_callback rtw_cmd_callback[] = {
 	{GEN_CMD_CODE(_RunInThreadCMD), NULL},/*64*/
 };
 
+u8 dummy_functioni(struct adapter *var0, u8 *var1) { return 0; }
+
 static struct cmd_hdl wlancmds[] = {
 	GEN_DRV_CMD_HANDLER(0, NULL) /*0*/
 	GEN_DRV_CMD_HANDLER(0, NULL)
@@ -150,7 +152,7 @@ static struct cmd_hdl wlancmds[] = {
 
 	GEN_MLME_EXT_HANDLER(0, h2c_msg_hdl) /*58*/
 	GEN_MLME_EXT_HANDLER(sizeof(struct SetChannelPlan_param), set_chplan_hdl) /*59*/
-	GEN_MLME_EXT_HANDLER(sizeof(struct LedBlink_param), led_blink_hdl) /*60*/
+	GEN_MLME_EXT_HANDLER(sizeof(struct LedBlink_param), dummy_function) /*60*/
 
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
index 5e6cf63956b8..57977da78eb3 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
@@ -745,11 +745,12 @@ u8 chk_bmc_sleepq_hdl(struct adapter *padapter, unsigned char *pbuf);
 u8 tx_beacon_hdl(struct adapter *padapter, unsigned char *pbuf);
 u8 set_ch_hdl(struct adapter *padapter, u8 *pbuf);
 u8 set_chplan_hdl(struct adapter *padapter, unsigned char *pbuf);
-u8 led_blink_hdl(struct adapter *padapter, unsigned char *pbuf);
 u8 set_csa_hdl(struct adapter *padapter, unsigned char *pbuf);	/* Kurt: Handling DFS channel switch announcement ie. */
 u8 tdls_hdl(struct adapter *padapter, unsigned char *pbuf);
 u8 run_in_thread_hdl(struct adapter *padapter, u8 *pbuf);
 
+/* Dummy function used to fill elements of an array of function pointers */
+u8 dummy_function(struct adapter *, u8 *);
 
 #define GEN_DRV_CMD_HANDLER(size, cmd)	{size, &cmd ## _hdl},
 #define GEN_MLME_EXT_HANDLER(size, cmd)	{size, cmd},
-- 
2.31.1

