Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61DE77470
	for <linux-staging@lists.linux.dev>; Tue,  7 Feb 2023 18:16:33 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id h16so14415235wrz.12
        for <linux-staging@lists.linux.dev>; Tue, 07 Feb 2023 10:16:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l58QyEwjg2Xy1dv7GkTVk31VP5XTg2OhnS4jifX8Prs=;
        b=PbsO3vVKh4nkVD89wncFG7mQZnx+UDnqfbc83iB2kYY53j5AhUQZNIg/b0J+gIZ7AS
         1LuONgG5BtivtdspzSVh7XvjpjYSIxBCLfAphoqnM1nMMtd2SKe/idVin2J6MxzC/uLo
         Xbkw17d7kzxnyrHcSsDSEX4V+59SQll4C4yAKwavIagrtOUSO9Qdy5uHkx7Nss2Dp1R1
         kxGWv2PS0pwvL56i19PUiqQlV39II+Icxc/ijxAH3D/VxEsBj/WqxZ1p5JsmQO8vhmnx
         zt9jHsK+wZPmhOerU3T00nIOt3fjP6k3JHfSQb50yvmXFVlzGOzBh2ARVV7Hiyx4WU9V
         5dqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l58QyEwjg2Xy1dv7GkTVk31VP5XTg2OhnS4jifX8Prs=;
        b=lbMDsyegzOy9mNIGTGoFBcgRLNKYCkwuOq66mmV4nnIpBJxFcKHTcy88P4V7WIrdEy
         WaasnEn2zU1GVM0WCGHR+pEfFoxMGLqvFpInnSJTdi0F0X6rJHiAN4DyIDI564J2tpFo
         LRTUqUX11RJUaLZDht8CpPtPFin6oZVCN6UfbXJ+wyNkYJyqWJZUvZiDKviC2xKsPf+n
         h5MH39AH/A1KqwKTVZQqoVtp8d6roSU6QnEI558vbBZZDzXOi5WEkA76uV+zQSE1h4Hj
         1oUkNCPE8v6XpHMV8EOBLhz4uNLMxuvzHEFotxb6PmOPrOaYu1+YaI4ZejvuKbv0dPdt
         KTWw==
X-Gm-Message-State: AO0yUKXtvbxWkb7i7fcHS2ENX1DlyjB8rPwWJEkGBY+TsdD6OFxgiqfk
	BGVYJaTJX0FEuBV4d93G+5w=
X-Google-Smtp-Source: AK7set/bCZPKYBKvArbXgoXX89rMDNJeWOsJl4zNpuaB5tkaK+CS+G+vWep+d7xWqqL5rdcsgcLayQ==
X-Received: by 2002:a5d:595f:0:b0:2c3:f09f:7991 with SMTP id e31-20020a5d595f000000b002c3f09f7991mr2639411wri.2.1675793791730;
        Tue, 07 Feb 2023 10:16:31 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id e15-20020a5d65cf000000b002bfc0558ecdsm11693032wrw.113.2023.02.07.10.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 10:16:31 -0800 (PST)
Date: Tue, 7 Feb 2023 19:16:29 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 03/10] staging: rtl8192e: Remove blank lines in r8192E_hw.h,
 rtl_core.h and ..
Message-ID: <9d7d54c5a2cdba6162e38e8d77faca5e5f39bdea.1675792435.git.philipp.g.hortmann@gmail.com>
References: <cover.1675792435.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1675792435.git.philipp.g.hortmann@gmail.com>

Remove or add blank lines in r8192E_hw.h, rtl_core.h and rtl_dm.h so that
code fits to kernel coding style as shown by checkpatch. Remove one line
break after "}" to fit to kernel coding style.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_hw.h | 5 +----
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h  | 3 ---
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.h    | 8 +-------
 3 files changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_hw.h b/drivers/staging/rtl8192e/rtl8192e/r8192E_hw.h
index 20a35c9caee8..75ef179e28c4 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_hw.h
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_hw.h
@@ -239,14 +239,11 @@ enum _RTL8192PCI_HW {
 				RATR_MCS11 | RATR_MCS12 | RATR_MCS13 |	\
 				RATR_MCS14|RATR_MCS15)
 
-
 	DRIVER_RSSI		= 0x32c,
 	MCS_TXAGC		= 0x340,
 	CCK_TXAGC		= 0x348,
 	MacBlkCtrl		= 0x403,
-
-}
-;
+};
 
 #define GPI 0x108
 
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
index 17fc69c839d3..fd96eef90c7f 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
@@ -203,8 +203,6 @@ struct rtl8192_tx_ring {
 	struct sk_buff_head queue;
 };
 
-
-
 struct rtl819x_ops {
 	enum nic_t nic_type;
 	void (*get_eeprom_size)(struct net_device *dev);
@@ -264,7 +262,6 @@ struct r8192_priv {
 
 	enum rt_customer_id customer_id;
 
-
 	enum rt_rf_type_819xu rf_chip;
 	enum ht_channel_width current_chnl_bw;
 	struct bb_reg_definition phy_reg_def[4];
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.h b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.h
index 7339ce1e40db..a0c4006c7726 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.h
@@ -7,7 +7,6 @@
 #ifndef	__R8192UDM_H__
 #define __R8192UDM_H__
 
-
 /*--------------------------Define Parameters-------------------------------*/
 #define			OFDM_Table_Length	19
 #define		CCK_Table_length	12
@@ -49,7 +48,6 @@
 
 /*--------------------------Define Parameters-------------------------------*/
 
-
 /*------------------------------Define structure----------------------------*/
 struct dig_t {
 	u8		dig_enable_flag;
@@ -88,7 +86,6 @@ enum dm_dig_sta {
 	DM_STA_DIG_MAX
 };
 
-
 enum dm_ratr_sta {
 	DM_RATR_STA_HIGH = 0,
 	DM_RATR_STA_MIDDLE = 1,
@@ -148,14 +145,13 @@ enum dm_cck_rx_path_method {
 	CCK_Rx_Version_MAX
 };
 
-
 struct dcmd_txcmd {
 	u32	op;
 	u32	length;
 	u32	value;
 };
-/*------------------------------Define structure----------------------------*/
 
+/*------------------------------Define structure----------------------------*/
 
 /*------------------------Export global variable----------------------------*/
 extern	struct dig_t dm_digtable;
@@ -170,7 +166,6 @@ extern const u8 dm_cck_tx_bb_gain_ch14[CCK_TX_BB_GAIN_TABLE_LEN][8];
 
 /*------------------------Export global variable----------------------------*/
 
-
 /*--------------------------Exported Function prototype---------------------*/
 /*--------------------------Exported Function prototype---------------------*/
 
@@ -179,7 +174,6 @@ void rtl92e_dm_deinit(struct net_device *dev);
 
 void rtl92e_dm_watchdog(struct net_device *dev);
 
-
 void    rtl92e_init_adaptive_rate(struct net_device *dev);
 void    rtl92e_dm_txpower_tracking_wq(void *data);
 
-- 
2.39.1

