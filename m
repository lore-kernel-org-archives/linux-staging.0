Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 917A1177
	for <linux-staging@lists.linux.dev>; Mon,  2 Aug 2021 15:16:02 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id c2-20020a0568303482b029048bcf4c6bd9so17776654otu.8
        for <linux-staging@lists.linux.dev>; Mon, 02 Aug 2021 08:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Xz1TfUVEcn4VN5Yf6UriAQEnDPCjhr9VpGKyeC7lwS0=;
        b=Lbc9Zh5SwMhfxLj5RjFjU4V6ZyKgVgX+wzYlR1VNWnY1SVwCjlu7/c6Q5WVirTRIII
         +o24ZcID8IyDVaOb7LIrTnK4TagnFCB+hI55UvzhDe27UeElF8szTtC3cor4q0WzzVMN
         U44MdBNHSSc9S24h5+aTrOMavGbMyYQbu4EzLyfM3n1wPWVXXvVuVmyjTFHDQ796/2pl
         5rjqqCADQjL2NN4KRl1MS23ojZ87hdRLskZCtmSDM/EQ73+heRDsIt5P5+Dy1Fvd+wpV
         jsQ+jDAkuiCKwLA2V+TdkpvtdIZjX1SfumADJbPoTiosHsBx9qDstOdLsFYVujk12KgY
         W9eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=Xz1TfUVEcn4VN5Yf6UriAQEnDPCjhr9VpGKyeC7lwS0=;
        b=Qt3HnFhI/PcQQQ3iRadmc+rI8j3Iol0NBj2y0I18P/a7q+uYYhLyFYyN2SIG7olHmE
         BYauxKrMz4MXK7VtQNPdvuMhP12dJNhkA1hUmHkZk1+xJrYGgwcTJHGBTk6qho+EaaDI
         eaDyM1yfhVuD8gxG1kiL8huO2evTJ7qLx41bybFHS9YnCmqmMizoL8Xp0Zw6CUL4OVJI
         rKalwGjT3z9WLi+v99T1Q22PMtwK/ueKn+ks7muDu6/MIkFbMIhf8pbEu4PF/1ac5Ah6
         7x0EiLL4ls8IvryO/g7YSfhYBLYUxFek3UaCqa5ParywK0/2liMlPPxLi1wbVL8R0Kq9
         YesQ==
X-Gm-Message-State: AOAM531fKPP2VW9JXVva3VW4jsrBBWHyPboTSuhH64tCPOhUMc1z8q1o
	Hsds8CtIh+/8ugo24zFkyIE=
X-Google-Smtp-Source: ABdhPJze3WRi17wxCk+laIvQ3YP6RKSX6f7vPtBzAvdqt//ALbw0F7edhSpWGd+w2vp1TDqplGRXrg==
X-Received: by 2002:a05:6830:3109:: with SMTP id b9mr12452428ots.276.1627917361862;
        Mon, 02 Aug 2021 08:16:01 -0700 (PDT)
Received: from 2603-8090-2005-39b3-0000-0000-0000-100a.res6.spectrum.com.com (2603-8090-2005-39b3-0000-0000-0000-100a.res6.spectrum.com. [2603:8090:2005:39b3::100a])
        by smtp.gmail.com with ESMTPSA id w16sm1807034oiv.15.2021.08.02.08.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Aug 2021 08:16:01 -0700 (PDT)
Sender: Larry Finger <larry.finger@gmail.com>
From: Larry Finger <Larry.Finger@lwfinger.net>
To: gregkh@linuxfoundation.org
Cc: phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Larry Finger <Larry.Finger@lwfinger.net>
Subject: [PATCH 3/6] staging: r8188eu: Remove wrappers for atomic operations
Date: Mon,  2 Aug 2021 10:15:43 -0500
Message-Id: <20210802151546.31797-4-Larry.Finger@lwfinger.net>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210802151546.31797-1-Larry.Finger@lwfinger.net>
References: <20210802151546.31797-1-Larry.Finger@lwfinger.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These wrappers were useful when this driver had the hooks for Windows,
but are no longer needed.

Signed-off-by: Larry Finger <Larry.Finger@lwfinger.net>
---
 drivers/staging/r8188eu/core/rtw_cmd.c        |  2 +-
 drivers/staging/r8188eu/core/rtw_mlme_ext.c   | 14 +++---
 drivers/staging/r8188eu/include/drv_types.h   |  2 +-
 .../staging/r8188eu/include/osdep_service.h   | 14 ------
 drivers/staging/r8188eu/include/rtw_cmd.h     |  2 +-
 .../staging/r8188eu/include/rtw_mlme_ext.h    |  2 +-
 drivers/staging/r8188eu/include/usb_ops.h     |  4 +-
 .../staging/r8188eu/os_dep/osdep_service.c    | 50 -------------------
 8 files changed, 13 insertions(+), 77 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index 55971c47c90a..35222a10b10c 100644
--- a/drivers/staging/r8188eu/core/rtw_cmd.c
+++ b/drivers/staging/r8188eu/core/rtw_cmd.c
@@ -64,7 +64,7 @@ int _rtw_init_evt_priv(struct evt_priv *pevtpriv)
 	int res = _SUCCESS;
 
 	/* allocate DMA-able/Non-Page memory for cmd_buf and rsp_buf */
-	ATOMIC_SET(&pevtpriv->event_seq, 0);
+	atomic_set(&pevtpriv->event_seq, 0);
 	pevtpriv->evt_done_cnt = 0;
 
 	_init_workitem(&pevtpriv->c2h_wk, c2h_wk_callback, NULL);
diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index 045179b4a1d6..d5298a782786 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -204,7 +204,7 @@ static void init_mlme_ext_priv_value(struct adapter *padapter)
 		_12M_RATE_, _24M_RATE_, 0xff,
 	};
 
-	ATOMIC_SET(&pmlmeext->event_seq, 0);
+	atomic_set(&pmlmeext->event_seq, 0);
 	pmlmeext->mgnt_seq = 0;/* reset to zero when disconnect at client mode */
 
 	pmlmeext->cur_channel = padapter->registrypriv.channel;
@@ -7013,7 +7013,7 @@ void report_survey_event(struct adapter *padapter, struct recv_frame *precv_fram
 	pc2h_evt_hdr = (struct C2HEvent_Header *)(pevtcmd);
 	pc2h_evt_hdr->len = sizeof(struct survey_event);
 	pc2h_evt_hdr->ID = GEN_EVT_CODE(_Survey);
-	pc2h_evt_hdr->seq = ATOMIC_INC_RETURN(&pmlmeext->event_seq);
+	pc2h_evt_hdr->seq = atomic_inc_return(&pmlmeext->event_seq);
 
 	psurvey_evt = (struct survey_event *)(pevtcmd + sizeof(struct C2HEvent_Header));
 
@@ -7065,7 +7065,7 @@ void report_surveydone_event(struct adapter *padapter)
 	pc2h_evt_hdr = (struct C2HEvent_Header *)(pevtcmd);
 	pc2h_evt_hdr->len = sizeof(struct surveydone_event);
 	pc2h_evt_hdr->ID = GEN_EVT_CODE(_SurveyDone);
-	pc2h_evt_hdr->seq = ATOMIC_INC_RETURN(&pmlmeext->event_seq);
+	pc2h_evt_hdr->seq = atomic_inc_return(&pmlmeext->event_seq);
 
 	psurveydone_evt = (struct surveydone_event *)(pevtcmd + sizeof(struct C2HEvent_Header));
 	psurveydone_evt->bss_cnt = pmlmeext->sitesurvey_res.bss_cnt;
@@ -7111,7 +7111,7 @@ void report_join_res(struct adapter *padapter, int res)
 	pc2h_evt_hdr = (struct C2HEvent_Header *)(pevtcmd);
 	pc2h_evt_hdr->len = sizeof(struct joinbss_event);
 	pc2h_evt_hdr->ID = GEN_EVT_CODE(_JoinBss);
-	pc2h_evt_hdr->seq = ATOMIC_INC_RETURN(&pmlmeext->event_seq);
+	pc2h_evt_hdr->seq = atomic_inc_return(&pmlmeext->event_seq);
 
 	pjoinbss_evt = (struct joinbss_event *)(pevtcmd + sizeof(struct C2HEvent_Header));
 	memcpy((unsigned char *)(&(pjoinbss_evt->network.network)), &(pmlmeinfo->network), sizeof(struct wlan_bssid_ex));
@@ -7162,7 +7162,7 @@ void report_del_sta_event(struct adapter *padapter, unsigned char *MacAddr, unsi
 	pc2h_evt_hdr = (struct C2HEvent_Header *)(pevtcmd);
 	pc2h_evt_hdr->len = sizeof(struct stadel_event);
 	pc2h_evt_hdr->ID = GEN_EVT_CODE(_DelSTA);
-	pc2h_evt_hdr->seq = ATOMIC_INC_RETURN(&pmlmeext->event_seq);
+	pc2h_evt_hdr->seq = atomic_inc_return(&pmlmeext->event_seq);
 
 	pdel_sta_evt = (struct stadel_event *)(pevtcmd + sizeof(struct C2HEvent_Header));
 	memcpy((unsigned char *)(&(pdel_sta_evt->macaddr)), MacAddr, ETH_ALEN);
@@ -7216,7 +7216,7 @@ void report_add_sta_event(struct adapter *padapter, unsigned char *MacAddr, int
 	pc2h_evt_hdr = (struct C2HEvent_Header *)(pevtcmd);
 	pc2h_evt_hdr->len = sizeof(struct stassoc_event);
 	pc2h_evt_hdr->ID = GEN_EVT_CODE(_AddSTA);
-	pc2h_evt_hdr->seq = ATOMIC_INC_RETURN(&pmlmeext->event_seq);
+	pc2h_evt_hdr->seq = atomic_inc_return(&pmlmeext->event_seq);
 
 	padd_sta_evt = (struct stassoc_event *)(pevtcmd + sizeof(struct C2HEvent_Header));
 	memcpy((unsigned char *)(&(padd_sta_evt->macaddr)), MacAddr, ETH_ALEN);
@@ -8249,7 +8249,7 @@ u8 mlme_evt_hdl(struct adapter *padapter, unsigned char *pbuf)
 		goto _abort_event_;
 	}
 
-	ATOMIC_INC(&pevt_priv->event_seq);
+	atomic_inc(&pevt_priv->event_seq);
 
 	peventbuf += 2;
 
diff --git a/drivers/staging/r8188eu/include/drv_types.h b/drivers/staging/r8188eu/include/drv_types.h
index 8cefb5c288f3..04f4224c11de 100644
--- a/drivers/staging/r8188eu/include/drv_types.h
+++ b/drivers/staging/r8188eu/include/drv_types.h
@@ -178,7 +178,7 @@ struct dvobj_priv {
 	struct usb_interface *pusbintf;
 	struct usb_device *pusbdev;
 
-	ATOMIC_T continual_urb_error;
+	atomic_t continual_urb_error;
 	u8 signal_strength;
 };
 
diff --git a/drivers/staging/r8188eu/include/osdep_service.h b/drivers/staging/r8188eu/include/osdep_service.h
index 48d49919b2d5..fd7716b6de2a 100644
--- a/drivers/staging/r8188eu/include/osdep_service.h
+++ b/drivers/staging/r8188eu/include/osdep_service.h
@@ -327,20 +327,6 @@ void rtw_suspend_lock_uninit(void);
 void rtw_lock_suspend(void);
 void rtw_unlock_suspend(void);
 
-/* Atomic integer operations */
-#define ATOMIC_T atomic_t
-
-void ATOMIC_SET(ATOMIC_T *v, int i);
-int ATOMIC_READ(ATOMIC_T *v);
-void ATOMIC_ADD(ATOMIC_T *v, int i);
-void ATOMIC_SUB(ATOMIC_T *v, int i);
-void ATOMIC_INC(ATOMIC_T *v);
-void ATOMIC_DEC(ATOMIC_T *v);
-int ATOMIC_ADD_RETURN(ATOMIC_T *v, int i);
-int ATOMIC_SUB_RETURN(ATOMIC_T *v, int i);
-int ATOMIC_INC_RETURN(ATOMIC_T *v);
-int ATOMIC_DEC_RETURN(ATOMIC_T *v);
-
 struct rtw_netdev_priv_indicator {
 	void *priv;
 	u32 sizeof_priv;
diff --git a/drivers/staging/r8188eu/include/rtw_cmd.h b/drivers/staging/r8188eu/include/rtw_cmd.h
index 0f64b72bb5de..c14d9052b997 100644
--- a/drivers/staging/r8188eu/include/rtw_cmd.h
+++ b/drivers/staging/r8188eu/include/rtw_cmd.h
@@ -53,7 +53,7 @@ struct	evt_priv {
 	bool c2h_wk_alive;
 	struct rtw_cbuf *c2h_queue;
 	#define C2H_QUEUE_MAX_LEN 10
-	ATOMIC_T event_seq;
+	atomic_t event_seq;
 	u8	*evt_buf;	/* shall be non-paged, and 4 bytes aligned */
 	u8	*evt_allocated_buf;
 	u32	evt_done_cnt;
diff --git a/drivers/staging/r8188eu/include/rtw_mlme_ext.h b/drivers/staging/r8188eu/include/rtw_mlme_ext.h
index b9c76f04445c..88d4ec073723 100644
--- a/drivers/staging/r8188eu/include/rtw_mlme_ext.h
+++ b/drivers/staging/r8188eu/include/rtw_mlme_ext.h
@@ -382,7 +382,7 @@ struct p2p_oper_class_map {
 struct mlme_ext_priv {
 	struct adapter	*padapter;
 	u8	mlmeext_init;
-	ATOMIC_T	event_seq;
+	atomic_t event_seq;
 	u16	mgnt_seq;
 
 	unsigned char	cur_channel;
diff --git a/drivers/staging/r8188eu/include/usb_ops.h b/drivers/staging/r8188eu/include/usb_ops.h
index 273bc2705558..5d290199e37c 100644
--- a/drivers/staging/r8188eu/include/usb_ops.h
+++ b/drivers/staging/r8188eu/include/usb_ops.h
@@ -38,7 +38,7 @@ static inline int rtw_inc_and_chk_continual_urb_error(struct dvobj_priv *dvobj)
 {
 	int ret = false;
 	int value;
-	value = ATOMIC_INC_RETURN(&dvobj->continual_urb_error);
+	value = atomic_inc_return(&dvobj->continual_urb_error);
 	if (value > MAX_CONTINUAL_URB_ERR) {
 		DBG_88E("[dvobj:%p][ERROR] continual_urb_error:%d > %d\n",
 			dvobj, value, MAX_CONTINUAL_URB_ERR);
@@ -52,7 +52,7 @@ static inline int rtw_inc_and_chk_continual_urb_error(struct dvobj_priv *dvobj)
 */
 static inline void rtw_reset_continual_urb_error(struct dvobj_priv *dvobj)
 {
-	ATOMIC_SET(&dvobj->continual_urb_error, 0);
+	atomic_set(&dvobj->continual_urb_error, 0);
 }
 
 #define USB_HIGH_SPEED_BULK_SIZE	512
diff --git a/drivers/staging/r8188eu/os_dep/osdep_service.c b/drivers/staging/r8188eu/os_dep/osdep_service.c
index dab61fac976c..8cf84cad5094 100644
--- a/drivers/staging/r8188eu/os_dep/osdep_service.c
+++ b/drivers/staging/r8188eu/os_dep/osdep_service.c
@@ -183,56 +183,6 @@ inline void rtw_unlock_suspend(void)
 {
 }
 
-inline void ATOMIC_SET(ATOMIC_T *v, int i)
-{
-	atomic_set(v, i);
-}
-
-inline int ATOMIC_READ(ATOMIC_T *v)
-{
-	return atomic_read(v);
-}
-
-inline void ATOMIC_ADD(ATOMIC_T *v, int i)
-{
-	atomic_add(i, v);
-}
-
-inline void ATOMIC_SUB(ATOMIC_T *v, int i)
-{
-	atomic_sub(i, v);
-}
-
-inline void ATOMIC_INC(ATOMIC_T *v)
-{
-	atomic_inc(v);
-}
-
-inline void ATOMIC_DEC(ATOMIC_T *v)
-{
-	atomic_dec(v);
-}
-
-inline int ATOMIC_ADD_RETURN(ATOMIC_T *v, int i)
-{
-	return atomic_add_return(i, v);
-}
-
-inline int ATOMIC_SUB_RETURN(ATOMIC_T *v, int i)
-{
-	return atomic_sub_return(i, v);
-}
-
-inline int ATOMIC_INC_RETURN(ATOMIC_T *v)
-{
-	return atomic_inc_return(v);
-}
-
-inline int ATOMIC_DEC_RETURN(ATOMIC_T *v)
-{
-	return atomic_dec_return(v);
-}
-
 static const struct device_type wlan_type = {
 	.name = "wlan",
 };
-- 
2.32.0

