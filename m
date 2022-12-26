Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38ED01367
	for <linux-staging@lists.linux.dev>; Mon, 26 Dec 2022 12:50:02 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id m7-20020a17090a730700b00225ebb9cd01so2784365pjk.3
        for <linux-staging@lists.linux.dev>; Mon, 26 Dec 2022 04:50:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/GvTGLH9wrG1dCqu/5/WQGE+DMEzGakELb3zwl+tBa0=;
        b=ZV6CAnSyA36rapcnwmd3Ep0yrUgrs2XPBHldnl9/I1+k3g9Bk716X71MufTHnAY3GQ
         bMmgi3O0Ms7TbWrlQ+BjHWPBExSBpHUJeIc61ksqlsNAZDMR/2DiQgXvW+uKwApuUJmP
         oCrIC8jSdeVaNpZ+sNvWBi+3rHSV58j/MdEOg0sa0G3bKibSSOFRwnJcdbCsaPyNXyfW
         adkhgB5FZFR78N7UaIJVOmP6VDwXIcXmztwkEdMT+9wcRaWIUrDopBp3Of+5QR+4Mm6w
         JTZ6J/BVfWRB+C/31ca0C1zMUafmloMUNQW/RlBhUeGfzMDpTrZlPmSkz6hYQW4dtARN
         oINg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/GvTGLH9wrG1dCqu/5/WQGE+DMEzGakELb3zwl+tBa0=;
        b=S6ecLHLRAth0lR4045q30+puaKqB4C69s6jqtWify5GII/NnC8AnssSwWZHue6A4qe
         /PSZTLE8JmgQIJIdeYk+IGmA4tET9eqDDnNtagWuZRnm8hrXWxNBzgmW7zJpvEsMbhn7
         sKZujj5Bqr+ro4C+sbvGhponmiER5bYniJr8PddSZ/Vuv6fc3av4Rhgy3RRj2FNYXG3Y
         2IQkGWX74hAc9vQaGqG3jYIt1/8blc/W/wiIMBuIDaj90g4/D4Az3nFPXBLdRLkLNhh6
         pR4FnNJbAP+s9Jv56Pkuy9j6d859ucs6O385MjTTHD5bxXPQFhl7nwUAQbJc74VhwCme
         Qe1g==
X-Gm-Message-State: AFqh2kr478Gk9TQVLz1I7e4RMP5dP45kAlSkyz36/HkHjURy190Xjd37
	KrF8Yl2m0KgLLD8YOpShDVQ=
X-Google-Smtp-Source: AMrXdXucTJQJGxJert5x9oCW51PRvCm9yYuQlnzdBAx1nImYk8WxmCI/3VAmxgakvv6m6fkqd0Gi1A==
X-Received: by 2002:a17:902:f80c:b0:185:441e:90dd with SMTP id ix12-20020a170902f80c00b00185441e90ddmr21235067plb.67.1672059001254;
        Mon, 26 Dec 2022 04:50:01 -0800 (PST)
Received: from local ([202.131.133.59])
        by smtp.gmail.com with ESMTPSA id n18-20020a170902f61200b001783f964fe3sm7128299plg.113.2022.12.26.04.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Dec 2022 04:50:00 -0800 (PST)
Date: Mon, 26 Dec 2022 18:19:56 +0530
From: Anup Sharma <anupnewsmail@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH] staging: rtl8723bs: hal: Fix spelling mistakes in comments
Message-ID: <Y6mYdPlqIK1VgQ0Z@local>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

They are appear to be spelling mistakes, initially identified in a codespell report and never been addressed so far.

Signed-off-by: Anup Sharma <anupnewsmail@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index f1fc077ed29c..0fcae6871108 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -653,7 +653,7 @@ static void Hal_EfusePowerSwitch(
 
 
 	if (PwrState) {
-		/*  To avoid cannot access efuse regsiters after disable/enable several times during DTM test. */
+		/*  To avoid cannot access efuse registers after disable/enable several times during DTM test. */
 		/*  Suggested by SD1 IsaacHsu. 2013.07.08, added by tynli. */
 		tempval = rtw_read8(padapter, SDIO_LOCAL_BASE|SDIO_REG_HSUS_CTRL);
 		if (tempval & BIT(0)) { /*  SDIO local register is suspend */
@@ -1693,7 +1693,7 @@ void rtl8723b_InitBeaconParameters(struct adapter *padapter)
 	rtw_write8(padapter, REG_BCNDMATIM, BCN_DMA_ATIME_INT_TIME_8723B); /*  2ms */
 
 	/*  Suggested by designer timchen. Change beacon AIFS to the largest number */
-	/*  beacause test chip does not contension before sending beacon. by tynli. 2009.11.03 */
+	/*  because test chip does not contension before sending beacon. by tynli. 2009.11.03 */
 	rtw_write16(padapter, REG_BCNTCFG, 0x660F);
 
 	pHalData->RegBcnCtrlVal = rtw_read8(padapter, REG_BCN_CTRL);
@@ -2089,7 +2089,7 @@ void Hal_EfuseParseIDCode(struct adapter *padapter, u8 *hwinfo)
 	u16 EEPROMId;
 
 
-	/*  Checl 0x8129 again for making sure autoload status!! */
+	/*  Check 0x8129 again for making sure autoload status!! */
 	EEPROMId = le16_to_cpu(*((__le16 *)hwinfo));
 	if (EEPROMId != RTL_EEPROM_ID) {
 		pEEPROM->bautoload_fail_flag = true;
@@ -2510,7 +2510,7 @@ static void rtl8723b_cal_txdesc_chksum(struct tx_desc *ptxdesc)
 	/*  Clear first */
 	ptxdesc->txdw7 &= cpu_to_le32(0xffff0000);
 
-	/*  checksume is always calculated by first 32 bytes, */
+	/*  checksum is always calculated by first 32 bytes, */
 	/*  and it doesn't depend on TX DESC length. */
 	/*  Thomas, Lucas@SD4, 20130515 */
 	count = 16;
@@ -2723,7 +2723,7 @@ static void rtl8723b_fill_default_txdesc(
 	 * multicast / mgnt frame should be controlled by Hw because Fw
 	 * will also send null data which we cannot control when Fw LPS
 	 * enable.
-	 * --> default enable non-Qos data sequense number. 2010.06.23.
+	 * --> default enable non-Qos data sequence number. 2010.06.23.
 	 * by tynli.
 	 * (2) Enable HW SEQ control for beacon packet, because we use
 	 * Hw beacon.
@@ -2777,7 +2777,7 @@ void rtl8723b_fill_fake_txdesc(
 	SET_TX_DESC_PKT_SIZE_8723B(pDesc, BufferLen); /*  Buffer size + command header */
 	SET_TX_DESC_QUEUE_SEL_8723B(pDesc, QSLT_MGNT); /*  Fixed queue of Mgnt queue */
 
-	/*  Set NAVUSEHDR to prevent Ps-poll AId filed to be changed to error vlaue by Hw. */
+	/*  Set NAVUSEHDR to prevent Ps-poll AId filed to be changed to error value by Hw. */
 	if (IsPsPoll) {
 		SET_TX_DESC_NAV_USE_HDR_8723B(pDesc, 1);
 	} else {
@@ -3406,7 +3406,7 @@ void SetHwReg8723B(struct adapter *padapter, u8 variable, u8 *val)
 				/*  polling bit, and No Write enable, and address */
 				ulCommand = CAM_CONTENT_COUNT*ucIndex+i;
 				ulCommand = ulCommand | CAM_POLLINIG | CAM_WRITE;
-				/*  write content 0 is equall to mark invalid */
+				/*  write content 0 is equal to mark as invalid */
 				rtw_write32(padapter, WCAMI, ulContent);  /* mdelay(40); */
 				rtw_write32(padapter, RWCAM, ulCommand);  /* mdelay(40); */
 			}
-- 
2.34.1

