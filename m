Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F735F
	for <linux-staging@lists.linux.dev>; Mon, 22 Mar 2021 13:37:13 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id k8so16814705wrc.3
        for <linux-staging@lists.linux.dev>; Mon, 22 Mar 2021 06:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=T7MMgBtWv8GZ0bs3XGYgaFb8Cqs2SZJishXLSnEhPOA=;
        b=khUIIDtYGoDPRH916Wm2Ou7l4fHx6h4v3iW1gAEEKbVcj392rcB+4bKadO6xKiArVu
         /VBkyk/VuwttEavjVLwnw5lrMmTUdXuF9yW0s/cEyBM3pAF3cA5KNQHluTOuv4zf4357
         51WOuyVCMkTELuQ2Mr9ANasGaI66vF0Np5ZDdvcwMK8czWxOFRITkGE4kHK7S63LWWya
         AhtD/gtzGa+0G+I4NqqVSAfCYQmy1ZckqBfKmp4dSzvz/hplM53W1FT+fDzPEs1s9YfR
         j1hXj1Vm5hDh7HHWP5wbL/Ggn4zGyK4LpPPY2OJn0mkZ1B7d+80sB4MnUrgwp3YkNQw2
         2HnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=T7MMgBtWv8GZ0bs3XGYgaFb8Cqs2SZJishXLSnEhPOA=;
        b=FUOzXrGviISKR79U69dIYL41JlmHB3/x9u3VSvkM6dW5L86gykZo99PXkL5n1BkhT8
         WMmFH7jX8hPjuHHIR23yMl8qqdcCog0+mumn/ABQAcmzJfqYqhWQ4fKACMC+O/KKR2KS
         WXA91CbUb+OYR2ncGH2xj1DuhGCIWnYjeVzIsbqsh3CcAr/PX6xcN1FPavVqYwcILKCu
         qhDYclJXrY+r13vlDFbXOT4+unWYItedIZjWYKd+UNlYfyP+GA1qoR6ePhT4GMlonBA9
         LwABKUW+5jzTHyvBYfSH5zS1SYyGpcWiYPoj2fnZIbOoHRZIbiY/qdf/m+EQ+6LZVnz7
         VwOg==
X-Gm-Message-State: AOAM533hFoGq85MVXbYnn/NO1AP/CjOHeiclTP/+1z/YgSPK6I2nwToM
	tiX4Nu+69FDC7e8Y2U8jEOFOZ5PfWN4=
X-Google-Smtp-Source: ABdhPJy9w/aSW4tEP1FGaRFDa02dGvvOoxaE8UBcRG4D8ZuBRYzOhtrrSeT6K+AUgUAFd7LKg5TT0w==
X-Received: by 2002:a05:600c:2f08:: with SMTP id r8mr16129030wmn.95.1616420231770;
        Mon, 22 Mar 2021 06:37:11 -0700 (PDT)
Received: from gimli.cesven (93-48-145-141.ip257.fastwebnet.it. [93.48.145.141])
        by smtp.gmail.com with ESMTPSA id d204sm17091770wmc.17.2021.03.22.06.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 06:37:11 -0700 (PDT)
From: Marco Cesati <marcocesati@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	linux-staging@lists.linux.dev,
	Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH 02/19] Staging: rtl8723bs: remove useless structs in rtw_cmd.h
Date: Mon, 22 Mar 2021 14:37:00 +0100
Message-Id: <20210322133717.17797-3-marcocesati@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210322133717.17797-1-marcocesati@gmail.com>
References: <20210322133717.17797-1-marcocesati@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the following unreferenced struct's in include/rtw_cmd.h:

	struct P2P_PS_Offload_t
	struct P2P_PS_CTWPeriod_t
	struct usb_suspend_parm
	struct getbasicrate_rsp
	struct getdatarate_rsp
	struct readBB_parm
	struct readBB_rsp
	struct readTSSI_parm
	struct readTSSI_rsp
	struct writeBB_parm
	struct readRF_parm
	struct readRF_rsp
	struct writeRF_parm
	struct getrfintfs_parm
	struct settxagctbl_parm
	struct gettxagctbl_parm
	struct gettxagctbl_rsp
	struct setagcctrl_parm
	struct setssup_parm
	struct getssup_parm
	struct getssup_rsp
	struct setssdlevel_parm
	struct getssdlevel_parm
	struct getssdlevel_rsp
	struct setssulevel_parm
	struct getssulevel_parm
	struct getssulevel_rsp
	struct setratable_parm
	struct getratable_parm
	struct getratable_rsp
	struct gettxretrycnt_parm
	struct gettxretrycnt_rsp
	struct getrxretrycnt_parm
	struct getrxretrycnt_rsp
	struct getbcnokcnt_parm
	struct getbcnokcnt_rsp
	struct getbcnerrcnt_parm
	struct getbcnerrcnt_rsp
	struct getcurtxpwrlevel_parm
	struct getcurtxpwrlevel_rsp
	struct setprobereqextraie_parm
	struct setassocreqextraie_parm
	struct setproberspextraie_parm
	struct setassocrspextraie_parm

Signed-off-by: Marco Cesati <marcocesati@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_cmd.h | 231 --------------------
 1 file changed, 231 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_cmd.h b/drivers/staging/rtl8723bs/include/rtw_cmd.h
index 6f3b018463e4..88cbc12ce5d4 100644
--- a/drivers/staging/rtl8723bs/include/rtw_cmd.h
+++ b/drivers/staging/rtl8723bs/include/rtw_cmd.h
@@ -107,21 +107,6 @@ struct c2h_evt_hdr_88xx {
 
 #define c2h_evt_valid(c2h_evt) ((c2h_evt)->id || (c2h_evt)->plen)
 
-struct P2P_PS_Offload_t {
-	u8 Offload_En:1;
-	u8 role:1; /*  1: Owner, 0: Client */
-	u8 CTWindow_En:1;
-	u8 NoA0_En:1;
-	u8 NoA1_En:1;
-	u8 AllStaSleep:1; /*  Only valid in Owner */
-	u8 discovery:1;
-	u8 rsvd:1;
-};
-
-struct P2P_PS_CTWPeriod_t {
-	u8 CTWPeriod;	/* TU */
-};
-
 int rtw_enqueue_cmd(struct cmd_priv *pcmdpriv, struct cmd_obj *obj);
 extern struct cmd_obj *rtw_dequeue_cmd(struct cmd_priv *pcmdpriv);
 extern void rtw_free_cmd_obj(struct cmd_obj *pcmd);
@@ -174,18 +159,6 @@ enum rfintfs {
 	HWPI,
 };
 
-/*
-Caller Mode: Infra, Ad-HoC(C)
-
-Notes: To enter USB suspend mode
-
-Command Mode
-
-*/
-struct usb_suspend_parm {
-	u32 action;/*  1: sleep, 0:resume */
-};
-
 /*
 Caller Mode: Infra, Ad-HoC
 
@@ -399,10 +372,6 @@ struct getbasicrate_parm {
 	u32 rsvd;
 };
 
-struct getbasicrate_rsp {
-	u8 basicrates[NumRates];
-};
-
 /*
 Caller Mode: Any
 
@@ -428,10 +397,6 @@ struct getdatarate_parm {
 	u32 rsvd;
 
 };
-struct getdatarate_rsp {
-	u8 datarates[NumRates];
-};
-
 
 /*
 Caller Mode: Any
@@ -456,11 +421,6 @@ struct	getphyinfo_parm {
 	u32 rsvd;
 };
 
-struct	getphyinfo_rsp {
-	struct regulatory_class class_sets[NUM_REGULATORYS];
-	u8 status;
-};
-
 /*
 Caller Mode: Any
 
@@ -487,46 +447,6 @@ struct	getphy_parm {
 	u32 rsvd;
 
 };
-struct	getphy_rsp {
-	u8 rfchannel;
-	u8 modem;
-};
-
-struct readBB_parm {
-	u8 offset;
-};
-struct readBB_rsp {
-	u8 value;
-};
-
-struct readTSSI_parm {
-	u8 offset;
-};
-struct readTSSI_rsp {
-	u8 value;
-};
-
-struct writeBB_parm {
-	u8 offset;
-	u8 value;
-};
-
-struct readRF_parm {
-	u8 offset;
-};
-struct readRF_rsp {
-	u32 value;
-};
-
-struct writeRF_parm {
-	u32 offset;
-	u32 value;
-};
-
-struct getrfintfs_parm {
-	u8 rfintfs;
-};
-
 
 struct Tx_Beacon_param {
 	struct wlan_bssid_ex network;
@@ -596,161 +516,10 @@ struct drvextra_cmd_parm {
 
 /*------------------- Below are used for RF/BB tunning ---------------------*/
 
-struct	setantenna_parm {
-	u8 tx_antset;
-	u8 rx_antset;
-	u8 tx_antenna;
-	u8 rx_antenna;
-};
-
-struct	enrateadaptive_parm {
-	u32 en;
-};
-
-struct settxagctbl_parm {
-	u32 txagc[MAX_RATES_LENGTH];
-};
-
-struct gettxagctbl_parm {
-	u32 rsvd;
-};
-struct gettxagctbl_rsp {
-	u32 txagc[MAX_RATES_LENGTH];
-};
-
-struct setagcctrl_parm {
-	u32 agcctrl;		/*  0: pure hw, 1: fw */
-};
-
-
-struct setssup_parm	{
-	u32 ss_ForceUp[MAX_RATES_LENGTH];
-};
-
-struct getssup_parm	{
-	u32 rsvd;
-};
-struct getssup_rsp	{
-	u8 ss_ForceUp[MAX_RATES_LENGTH];
-};
-
-
-struct setssdlevel_parm	{
-	u8 ss_DLevel[MAX_RATES_LENGTH];
-};
-
-struct getssdlevel_parm	{
-	u32 rsvd;
-};
-struct getssdlevel_rsp	{
-	u8 ss_DLevel[MAX_RATES_LENGTH];
-};
-
-struct setssulevel_parm	{
-	u8 ss_ULevel[MAX_RATES_LENGTH];
-};
-
-struct getssulevel_parm	{
-	u32 rsvd;
-};
-struct getssulevel_rsp	{
-	u8 ss_ULevel[MAX_RATES_LENGTH];
-};
-
-
-struct	setcountjudge_parm {
-	u8 count_judge[MAX_RATES_LENGTH];
-};
-
-struct	getcountjudge_parm {
-	u32 rsvd;
-};
 struct	getcountjudge_rsp {
 	u8 count_judge[MAX_RATES_LENGTH];
 };
 
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
-struct getratable_rsp {
-        u8 ss_ForceUp[NumRates];
-        u8 ss_ULevel[NumRates];
-        u8 ss_DLevel[NumRates];
-        u8 count_judge[NumRates];
-};
-
-
-/* to get TX, RX retry count */
-struct gettxretrycnt_parm {
-	unsigned int rsvd;
-};
-struct gettxretrycnt_rsp {
-	unsigned long tx_retrycnt;
-};
-
-struct getrxretrycnt_parm {
-	unsigned int rsvd;
-};
-struct getrxretrycnt_rsp {
-	unsigned long rx_retrycnt;
-};
-
-/* to get BCNOK, BCNERR count */
-struct getbcnokcnt_parm {
-	unsigned int rsvd;
-};
-struct getbcnokcnt_rsp {
-	unsigned long  bcnokcnt;
-};
-
-struct getbcnerrcnt_parm {
-	unsigned int rsvd;
-};
-struct getbcnerrcnt_rsp {
-	unsigned long bcnerrcnt;
-};
-
-/*  to get current TX power level */
-struct getcurtxpwrlevel_parm {
-	unsigned int rsvd;
-};
-struct getcurtxpwrlevel_rsp {
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
-
 struct addBaReq_parm {
 	unsigned int tid;
 	u8 addr[ETH_ALEN];
-- 
2.30.2

