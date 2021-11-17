Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ADE32C81
	for <linux-staging@lists.linux.dev>; Wed, 17 Nov 2021 14:39:57 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id n15so2859159qta.0
        for <linux-staging@lists.linux.dev>; Wed, 17 Nov 2021 06:39:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7h7Lt/b8pjCkn+yNnqb7aBRnrGz1ydzrcNdi9m9JZ9M=;
        b=EUfs91+TNjJC5+7SR897mnLqjCs6X82LRkBRwPdjJHUY03ab8zGgpqAdHRDn+YIYBl
         nhqfuuKSj1qoa+iy1Caio/1CQJO1TtqeBtmfkEMigPR5QDm0UYw+lVzFX8EaRfBREqqM
         f67fW4tZ+ePmH/vevcpuGU1p94287ZT1RzjCmj+1K4+s1IiChEEwJaRLV8tZcFFJitEr
         2FbjEYfEKwy8N3Lw9fzWNaF4ka+4U3rZjrgsoNY4s8utdWkAWCDsNb9O1nBa3SdYFCfP
         Hf4BTNjgrT/kUZqX2QmqFkT3fwcgHVyc5o4RkMCEWXi3Y4+Ri9zxeMewgZPNPyZcpNcS
         9ICA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7h7Lt/b8pjCkn+yNnqb7aBRnrGz1ydzrcNdi9m9JZ9M=;
        b=dh081zABRdvWYDjNsSoVvf58nNf36CFIrb1R7O0GEIDfTs6DxgqW37uQZtejKMipPA
         aquHmtrQR04zzLv5enE4s2Pny6r2ZADADoIQUYKU8Tx/iDWvHje99mFGmb5d8MFmEj1V
         SXaMzMWeS121AAEQ2BIV1dRA+CFNRK3fJbqWju7art4sPwBa1hdo87THxGJH6y9n+XG/
         FxmLYvXkiONZ2DsLF6fD6on7N/fp20xJrpKhY9EPAkyQSx7jvmcnoxRI8XSCoC2woHsV
         NwRySUifd+otQVVsZIXjmtZLMqe8ObDq5Emh6sxmTnu9IzIOtGJgwotZAO7u7YcuXptj
         6L5A==
X-Gm-Message-State: AOAM532mXQNkoL+4ih7mpUTyjTZGd2CnLABDM6wOhVx3dpKeXYVLYQ5j
	dAPXJpBwmqSidQsJiw7DOc8=
X-Google-Smtp-Source: ABdhPJyilmlMEPQ5hm2huOVKkoFwy4VZwD1b3VckdepObuDsNgY57prcjlveDpQzdcdS3Lk/IJETrQ==
X-Received: by 2002:ac8:5a0b:: with SMTP id n11mr17649089qta.372.1637159996913;
        Wed, 17 Nov 2021 06:39:56 -0800 (PST)
Received: from localhost.localdomain (pool-98-113-42-30.nycmny.fios.verizon.net. [98.113.42.30])
        by smtp.googlemail.com with ESMTPSA id c3sm10788698qkp.47.2021.11.17.06.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 06:39:56 -0800 (PST)
From: Zameer Manji <zmanji@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Zameer Manji <zmanji@gmail.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	"Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: r8188eu: remove unused code in rtw_cmd.h
Date: Wed, 17 Nov 2021 14:38:14 +0000
Message-Id: <20211117143831.1511437-1-zmanji@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch removes unused code in rtw_cmd.h.

Signed-off-by: Zameer Manji <zmanji@gmail.com>
---
 drivers/staging/r8188eu/include/rtw_cmd.h | 196 ----------------------
 1 file changed, 196 deletions(-)

diff --git a/drivers/staging/r8188eu/include/rtw_cmd.h b/drivers/staging/r8188eu/include/rtw_cmd.h
index 47c3c80cc24a..14e8a4c03449 100644
--- a/drivers/staging/r8188eu/include/rtw_cmd.h
+++ b/drivers/staging/r8188eu/include/rtw_cmd.h
@@ -8,13 +8,9 @@
 #include "rtw_rf.h"
 #include "rtw_led.h"
 
-#define C2H_MEM_SZ (16*1024)
-
 #include "osdep_service.h"
 #include "ieee80211.h" /*  <ieee80211/ieee80211.h> */
 
-#define FREE_CMDOBJ_SZ	128
-
 #define MAX_CMDSZ	1024
 #define MAX_RSPSZ	512
 #define MAX_EVTSZ	1024
@@ -425,37 +421,6 @@ struct	getphy_rsp {
 	u8	modem;
 };
 
-struct readBB_parm {
-	u8	offset;
-};
-struct readBB_rsp {
-	u8	value;
-};
-
-struct readTSSI_parm {
-	u8	offset;
-};
-struct readTSSI_rsp {
-	u8	value;
-};
-
-struct writeBB_parm {
-	u8	offset;
-	u8	value;
-};
-
-struct readRF_parm {
-	u8	offset;
-};
-struct readRF_rsp {
-	u32	value;
-};
-
-struct writeRF_parm {
-	u32	offset;
-	u32	value;
-};
-
 struct getrfintfs_parm {
 	u8	rfintfs;
 };
@@ -523,167 +488,6 @@ struct drvextra_cmd_parm {
 	unsigned char *pbuf;
 };
 
-/*------------------- Below are used for RF/BB tunning ---------------------*/
-
-struct	setantenna_parm {
-	u8	tx_antset;
-	u8	rx_antset;
-	u8	tx_antenna;
-	u8	rx_antenna;
-};
-
-struct	enrateadaptive_parm {
-	u32	en;
-};
-
-struct settxagctbl_parm {
-	u32	txagc[MAX_RATES_LENGTH];
-};
-
-struct gettxagctbl_parm {
-	u32 rsvd;
-};
-struct gettxagctbl_rsp {
-	u32	txagc[MAX_RATES_LENGTH];
-};
-
-struct setagcctrl_parm {
-	u32	agcctrl;		/*  0: pure hw, 1: fw */
-};
-
-struct setssup_parm	{
-	u32	ss_ForceUp[MAX_RATES_LENGTH];
-};
-
-struct getssup_parm	{
-	u32 rsvd;
-};
-
-struct getssup_rsp	{
-	u8	ss_ForceUp[MAX_RATES_LENGTH];
-};
-
-struct setssdlevel_parm	{
-	u8	ss_DLevel[MAX_RATES_LENGTH];
-};
-
-struct getssdlevel_parm	{
-	u32 rsvd;
-};
-
-struct getssdlevel_rsp	{
-	u8	ss_DLevel[MAX_RATES_LENGTH];
-};
-
-struct setssulevel_parm	{
-	u8	ss_ULevel[MAX_RATES_LENGTH];
-};
-
-struct getssulevel_parm	{
-	u32 rsvd;
-};
-
-struct getssulevel_rsp	{
-	u8	ss_ULevel[MAX_RATES_LENGTH];
-};
-
-struct	setcountjudge_parm {
-	u8	count_judge[MAX_RATES_LENGTH];
-};
-
-struct	getcountjudge_parm {
-	u32 rsvd;
-};
-
-struct	getcountjudge_rsp {
-	u8	count_judge[MAX_RATES_LENGTH];
-};
-
-struct setratable_parm {
-	u8 ss_ForceUp[NumRates];
-	u8 ss_ULevel[NumRates];
-	u8 ss_DLevel[NumRates];
-	u8 count_judge[NumRates];
-};
-
-struct getratable_parm {
-                uint rsvd;
-};
-
-struct getratable_rsp {
-        u8 ss_ForceUp[NumRates];
-        u8 ss_ULevel[NumRates];
-        u8 ss_DLevel[NumRates];
-        u8 count_judge[NumRates];
-};
-
-/* to get TX,RX retry count */
-
-struct gettxretrycnt_parm {
-	unsigned int rsvd;
-};
-
-struct gettxretrycnt_rsp {
-	unsigned long tx_retrycnt;
-};
-
-struct getrxretrycnt_parm {
-	unsigned int rsvd;
-};
-
-struct getrxretrycnt_rsp {
-	unsigned long rx_retrycnt;
-};
-
-/* to get BCNOK,BCNERR count */
-struct getbcnokcnt_parm {
-	unsigned int rsvd;
-};
-
-struct getbcnokcnt_rsp {
-	unsigned long  bcnokcnt;
-};
-
-struct getbcnerrcnt_parm {
-	unsigned int rsvd;
-};
-
-struct getbcnerrcnt_rsp {
-	unsigned long bcnerrcnt;
-};
-
-/*  to get current TX power level */
-struct getcurtxpwrlevel_parm {
-	unsigned int rsvd;
-};
-struct getcurtxpwrlevel_rspi {
-	unsigned short tx_power;
-};
-
-struct setprobereqextraie_parm {
-	unsigned char e_id;
-	unsigned char ie_len;
-	unsigned char ie[0];
-};
-
-struct setassocreqextraie_parm {
-	unsigned char e_id;
-	unsigned char ie_len;
-	unsigned char ie[0];
-};
-
-struct setproberspextraie_parm {
-	unsigned char e_id;
-	unsigned char ie_len;
-	unsigned char ie[0];
-};
-
-struct setassocrspextraie_parm {
-	unsigned char e_id;
-	unsigned char ie_len;
-	unsigned char ie[0];
-};
-
 struct addBaReq_parm {
 	unsigned int tid;
 	u8	addr[ETH_ALEN];
-- 
2.25.1

