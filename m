Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27914259F
	for <linux-staging@lists.linux.dev>; Sun,  4 Apr 2021 20:51:56 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id 12so14685651lfq.13
        for <linux-staging@lists.linux.dev>; Sun, 04 Apr 2021 13:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=cXiMXcPJYT2gF1ZyHKZXBRz8MdSstrc2FkV2CzET4+Q=;
        b=pNbplSVMj3El5qfqP6wnDvwFawYNC56Bv0mYtHpCQQooiUJUG6PdYrJ302oF7b21P6
         5fCo6C2xqTxnSGK6eIeRtdXnp8MGkJzbVrCrDbovEVCJalXgoGq9MkUewJy+xBjgxbsO
         LisAWAELom/Dp7zf7I92+42H24kdIJCQY2rwm5o+3aRUUq/OyOIRLo24b5URczcFjJOf
         vh9B7XFZctsc9fXXJ9Rbou0riqr9+4dy8oAgfu7E4q/8U5C7jW83sOXIU9u82uKFxxwB
         kXs8lV1SaOV9yrhZjRpvuCp4/T+P2NHNVqY5oeAuuzM2jtbfJwbJ1t6qO4a9FXwp1veD
         Fi3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cXiMXcPJYT2gF1ZyHKZXBRz8MdSstrc2FkV2CzET4+Q=;
        b=R2XXrYe2UO+pqPiXnS1Jergo2ptwKV9YZ+gTS7FalQrYIzjl/D+OEWmjfrQgHI4U64
         eKGThVzMUV0C5LC9swbEV4Pd/z1otHybIRKf64FLF3VA4wtmcSD3UbjSxn0V7THuSOih
         OzGo5OtT5AdZxEGeVyi4KvOUHG/CdiCGhXXtf7IKKcc2Bs5kRo9qcKXVZBz9DMTebeiQ
         vLc4eM+w6GkqXCJZE55EqbdPRbBnVmPtYNH18yujqtXU8enUBwUVzSknFSi8o7zVXpCy
         CugBEi3kkVoQ5BY6f5gEztxGUOigWoe7/Lxj79Bu8EV6pKSnrAM5ZWKXtvefB+12m+4K
         ghvg==
X-Gm-Message-State: AOAM530aeJIlnAM5ioIq+UfGyzVINcMkHcB9Ho6io/9g0gQV6R8coBee
	KhAtnGCUWTMvUMfp5zup6No=
X-Google-Smtp-Source: ABdhPJzYHvmehmdJizalAk72A7tzPkHvNtXHVUm+H3lU26d7dzLnsiWUkglzidMgNQxD7OMqtKKw9A==
X-Received: by 2002:ac2:5a11:: with SMTP id q17mr15758434lfn.354.1617569514393;
        Sun, 04 Apr 2021 13:51:54 -0700 (PDT)
Received: from zhans ([37.151.32.231])
        by smtp.gmail.com with ESMTPSA id e15sm1552272lfs.83.2021.04.04.13.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Apr 2021 13:51:54 -0700 (PDT)
Date: Mon, 5 Apr 2021 02:51:52 +0600
From: Zhansaya Bagdauletkyzy <zhansayabagdaulet@gmail.com>
To: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com
Subject: [PATCH 1/2] staging: rtl8712: add blank lines after declarations
Message-ID: <ffe2ab70ef3cb73d3d6dd19d88804af7ecb568a2.1617568354.git.zhansayabagdaulet@gmail.com>
References: <cover.1617568354.git.zhansayabagdaulet@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1617568354.git.zhansayabagdaulet@gmail.com>

Add blank lines after function/struct/union/enum declarations to adhere to
Linux kernel coding style.
Reported by checkpatch.

Signed-off-by: Zhansaya Bagdauletkyzy <zhansayabagdaulet@gmail.com>
---
 drivers/staging/rtl8712/rtl8712_recv.h     |  1 +
 drivers/staging/rtl8712/rtl871x_cmd.h      | 10 ++++++++++
 drivers/staging/rtl8712/rtl871x_event.h    |  1 +
 drivers/staging/rtl8712/rtl871x_mp.c       |  1 +
 drivers/staging/rtl8712/rtl871x_mp.h       |  1 +
 drivers/staging/rtl8712/rtl871x_mp_ioctl.c |  3 +++
 drivers/staging/rtl8712/rtl871x_recv.c     |  1 +
 7 files changed, 18 insertions(+)

diff --git a/drivers/staging/rtl8712/rtl8712_recv.h b/drivers/staging/rtl8712/rtl8712_recv.h
index 3e385b2242d8..c70b37ff554e 100644
--- a/drivers/staging/rtl8712/rtl8712_recv.h
+++ b/drivers/staging/rtl8712/rtl8712_recv.h
@@ -66,6 +66,7 @@ struct phy_stat {
 	__le32 phydw6;
 	__le32 phydw7;
 };
+
 #define PHY_STAT_GAIN_TRSW_SHT 0
 #define PHY_STAT_PWDB_ALL_SHT 4
 #define PHY_STAT_CFOSHO_SHT 5
diff --git a/drivers/staging/rtl8712/rtl871x_cmd.h b/drivers/staging/rtl8712/rtl871x_cmd.h
index 254182a6ce8e..bf6f0c6a86e5 100644
--- a/drivers/staging/rtl8712/rtl871x_cmd.h
+++ b/drivers/staging/rtl8712/rtl871x_cmd.h
@@ -333,6 +333,7 @@ struct getdatarate_parm {
 	u32 rsvd;
 
 };
+
 struct getdatarate_rsp {
 	u8 datarates[NumRates];
 };
@@ -377,6 +378,7 @@ struct	getphy_rsp {
 struct readBB_parm {
 	u8	offset;
 };
+
 struct readBB_rsp {
 	u8	value;
 };
@@ -384,6 +386,7 @@ struct readBB_rsp {
 struct readTSSI_parm {
 	u8	offset;
 };
+
 struct readTSSI_rsp {
 	u8	value;
 };
@@ -400,6 +403,7 @@ struct writePTM_parm {
 struct readRF_parm {
 	u8	offset;
 };
+
 struct readRF_rsp {
 	u32	value;
 };
@@ -498,6 +502,7 @@ struct settxagctbl_parm {
 struct gettxagctbl_parm {
 	u32 rsvd;
 };
+
 struct gettxagctbl_rsp {
 	u32	txagc[MAX_RATES_LENGTH];
 };
@@ -513,6 +518,7 @@ struct setssup_parm	{
 struct getssup_parm	{
 	u32 rsvd;
 };
+
 struct getssup_rsp	{
 	u8	ss_ForceUp[MAX_RATES_LENGTH];
 };
@@ -524,6 +530,7 @@ struct setssdlevel_parm	{
 struct getssdlevel_parm	{
 	u32 rsvd;
 };
+
 struct getssdlevel_rsp	{
 	u8	ss_DLevel[MAX_RATES_LENGTH];
 };
@@ -535,6 +542,7 @@ struct setssulevel_parm	{
 struct getssulevel_parm	{
 	u32 rsvd;
 };
+
 struct getssulevel_rsp	{
 	u8	ss_ULevel[MAX_RATES_LENGTH];
 };
@@ -585,6 +593,7 @@ struct setratable_parm {
 struct getratable_parm {
 	uint rsvd;
 };
+
 struct getratable_rsp {
 	u8 ss_ForceUp[NumRates];
 	u8 ss_ULevel[NumRates];
@@ -621,6 +630,7 @@ struct getbcnokcnt_rsp {
 struct getbcnerrcnt_parm {
 	unsigned int rsvd;
 };
+
 struct getbcnerrcnt_rsp {
 	unsigned long bcnerrcnt;
 };
diff --git a/drivers/staging/rtl8712/rtl871x_event.h b/drivers/staging/rtl8712/rtl871x_event.h
index d9a5476d2426..759a2d27d8f2 100644
--- a/drivers/staging/rtl8712/rtl871x_event.h
+++ b/drivers/staging/rtl8712/rtl871x_event.h
@@ -102,6 +102,7 @@ struct ADDBA_Req_Report_parm {
 	unsigned short StartSeqNum;
 	unsigned char tid;
 };
+
 #include "rtl8712_event.h"
 
 #endif /* _WLANEVENT_H_ */
diff --git a/drivers/staging/rtl8712/rtl871x_mp.c b/drivers/staging/rtl8712/rtl871x_mp.c
index 24020257bc58..099c512c8519 100644
--- a/drivers/staging/rtl8712/rtl871x_mp.c
+++ b/drivers/staging/rtl8712/rtl871x_mp.c
@@ -387,6 +387,7 @@ void r8712_SwitchBandwidth(struct _adapter *pAdapter)
 		break;
 	}
 }
+
 /*------------------------------Define structure----------------------------*/
 struct R_ANTENNA_SELECT_OFDM {
 	u32	r_tx_antenna:4;
diff --git a/drivers/staging/rtl8712/rtl871x_mp.h b/drivers/staging/rtl8712/rtl871x_mp.h
index e79a67676469..0a60b1e6ccaf 100644
--- a/drivers/staging/rtl8712/rtl871x_mp.h
+++ b/drivers/staging/rtl8712/rtl871x_mp.h
@@ -121,6 +121,7 @@ struct bb_reg_param {
 	u32 offset;
 	u32 value;
 };
+
 /* ======================================================================= */
 
 #define LOWER	true
diff --git a/drivers/staging/rtl8712/rtl871x_mp_ioctl.c b/drivers/staging/rtl8712/rtl871x_mp_ioctl.c
index f906d3fbe179..31414a960c9e 100644
--- a/drivers/staging/rtl8712/rtl871x_mp_ioctl.c
+++ b/drivers/staging/rtl8712/rtl871x_mp_ioctl.c
@@ -681,6 +681,7 @@ uint oid_rt_pro_read_efuse_hdl(struct oid_par_priv *poid_par_priv)
 	*poid_par_priv->bytes_rw = poid_par_priv->information_buf_len;
 	return status;
 }
+
 /*------------------------------------------------------------------------*/
 uint oid_rt_pro_write_efuse_hdl(struct oid_par_priv *poid_par_priv)
 {
@@ -708,6 +709,7 @@ uint oid_rt_pro_write_efuse_hdl(struct oid_par_priv *poid_par_priv)
 		status = RNDIS_STATUS_FAILURE;
 	return status;
 }
+
 /*----------------------------------------------------------------------*/
 
 uint oid_rt_get_efuse_current_size_hdl(struct oid_par_priv *poid_par_priv)
@@ -849,6 +851,7 @@ unsigned int mp_ioctl_xmit_packet_hdl(struct oid_par_priv *poid_par_priv)
 {
 	return _SUCCESS;
 }
+
 /*-------------------------------------------------------------------------*/
 uint oid_rt_set_power_down_hdl(struct oid_par_priv *poid_par_priv)
 {
diff --git a/drivers/staging/rtl8712/rtl871x_recv.c b/drivers/staging/rtl8712/rtl871x_recv.c
index efd783e7ccbc..17d4a261dea0 100644
--- a/drivers/staging/rtl8712/rtl871x_recv.c
+++ b/drivers/staging/rtl8712/rtl871x_recv.c
@@ -219,6 +219,7 @@ union recv_frame *r8712_decryptor(struct _adapter *padapter,
 	}
 	return return_packet;
 }
+
 /*###set the security information in the recv_frame */
 union recv_frame *r8712_portctrl(struct _adapter *adapter,
 				 union recv_frame *precv_frame)
-- 
2.25.1

