Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10296D00
	for <linux-staging@lists.linux.dev>; Sat,  3 Apr 2021 09:14:37 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id d191so3451685wmd.2
        for <linux-staging@lists.linux.dev>; Sat, 03 Apr 2021 02:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aKJMQyibGkbhT7wVDkcAwfnXuo5IWQYiwpzUD+I1No0=;
        b=DrQ35tyuZN5EFPvt1LW+I3CFSklFL26xj20GoWgz4tE7VX0TBF7PGny5Q8MfweyBA+
         q3h5WfEAQ7G1G8n/oZFor2TrhmVd2EAiZJSa446cj9x9bRf7PjbtSWtKhMIO16smAAaZ
         VK3Fi5qC75a00FHx4gg+gva/pX7Qmoooc3vvcylxZIXoBJo8WKk+E0F8BodkBR8BoCVu
         QISrc5jXcZaUIxZDNb1j6xlfamqz3abtl9QV5/YeljBuqkdXanmDTqnWT/5Uma83ypjg
         6cOMXsV9r9tUCEaptSL7AldsQK3rt5jXONPl3rByiTe+P7RW11gV3d8RkJEQWVtIs6vd
         LjQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aKJMQyibGkbhT7wVDkcAwfnXuo5IWQYiwpzUD+I1No0=;
        b=k4dMJXQPSo7FLWLHkbEnhMv5WMusy2rwWt0VIBIqe6L17nT9wg1JlVYwGSo40ingG7
         kPmVPlJrMKklIzpNxmr3bs+SvO4VBQsKQfkKw62D7VpHPqSCdbElYbZGWFdWJtk7ACL0
         v0Vo1Fj2spcMQekqlwVUa1ToScYxCDEBunBI6pUBjQBgDU8J3XneDGxMdnn5HIGVIe58
         Eyc2z9Gv+kQCjcMtCXURZOUktX0NOQn3D1bUBLBbxv/7lBYkFcMbExCP4/HJwTPdOZaJ
         9RHmsY99RWOnkioGZfQUl+D9uzkcRH5ERO9KiDVxJDGe639PuaTyqjyWxX8D9MDRt1uG
         2RxA==
X-Gm-Message-State: AOAM533bE8bLVRPndZNZVDXPSyxk6Hkru/+L7DsWXcrJJGzaXyyw/JvM
	wFZM8E7xnEKCOwVoZOHrQ44=
X-Google-Smtp-Source: ABdhPJxsUtyzswOdFc/ln4wZpiwKoaPw8VSY/CfLIyay9KtIXtfNFa0r4zHYibgM0S5RhMVMfNREHA==
X-Received: by 2002:a1c:21c3:: with SMTP id h186mr16104071wmh.32.1617441276528;
        Sat, 03 Apr 2021 02:14:36 -0700 (PDT)
Received: from agape ([5.171.72.64])
        by smtp.gmail.com with ESMTPSA id j26sm18294690wrh.57.2021.04.03.02.14.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Apr 2021 02:14:36 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH v3 14/30] staging: rtl8723bs: remove commented RT_TRACE calls in core/rtw_mlme.c
Date: Sat,  3 Apr 2021 11:13:36 +0200
Message-Id: <09862e8783366045a08fd97523595710a08df918.1617440834.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617440833.git.fabioaiuto83@gmail.com>
References: <cover.1617440833.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove commented RT_TRACE calls in core/rtw_mlme.c

Remove all of the RT_TRACE logs in the core/rtw_mlme.c file as they
currently do nothing as they require the code to be modified by
hand in order to be turned on. This obviously has not happened
since the code was merged. Moreover it relies on an unneeded
private log level tracing which overrides the in-kernel public one,
so just remove them as they are unused.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 29d4b7493784..4289bf40aa73 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -356,7 +356,6 @@ static struct	wlan_network *rtw_dequeue_network(struct __queue *queue)
 void rtw_free_network_nolock(struct adapter *padapter, struct wlan_network *pnetwork);
 void rtw_free_network_nolock(struct adapter *padapter, struct wlan_network *pnetwork)
 {
-	/* RT_TRACE(_module_rtl871x_mlme_c_, _drv_err_, ("rtw_free_network ==> ssid = %s\n\n" , pnetwork->network.Ssid.Ssid)); */
 	_rtw_free_network_nolock(&(padapter->mlmepriv), pnetwork);
 	rtw_cfg80211_unlink_bss(padapter, pnetwork);
 }
@@ -393,8 +392,6 @@ int rtw_is_same_ibss(struct adapter *adapter, struct wlan_network *pnetwork)
 
 inline int is_same_ess(struct wlan_bssid_ex *a, struct wlan_bssid_ex *b)
 {
-	/* RT_TRACE(_module_rtl871x_mlme_c_, _drv_err_, ("(%s,%d)(%s,%d)\n", */
-	/* 		a->Ssid.Ssid, a->Ssid.SsidLength, b->Ssid.Ssid, b->Ssid.SsidLength)); */
 	return (a->Ssid.SsidLength == b->Ssid.SsidLength)
 		&&  !memcmp(a->Ssid.Ssid, b->Ssid.Ssid, a->Ssid.SsidLength);
 }
@@ -551,8 +548,6 @@ static void update_current_network(struct adapter *adapter, struct wlan_bssid_ex
 		&(pmlmepriv->cur_network.network));
 
 	if ((check_fwstate(pmlmepriv, _FW_LINKED) == true) && (is_same_network(&(pmlmepriv->cur_network.network), pnetwork, 0))) {
-		/* RT_TRACE(_module_rtl871x_mlme_c_, _drv_err_,"Same Network\n"); */
-
 		/* if (pmlmepriv->cur_network.network.IELength<= pnetwork->IELength) */
 		{
 			update_network(&(pmlmepriv->cur_network.network), pnetwork, adapter, true);
@@ -778,7 +773,6 @@ void rtw_survey_event_callback(struct adapter	*adapter, u8 *pbuf)
 
 	/*  update IBSS_network 's timestamp */
 	if ((check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE)) == true) {
-		/* RT_TRACE(_module_rtl871x_mlme_c_, _drv_err_,"rtw_survey_event_callback : WIFI_ADHOC_MASTER_STATE\n\n"); */
 		if (!memcmp(&(pmlmepriv->cur_network.network.MacAddress), pnetwork->MacAddress, ETH_ALEN)) {
 			struct wlan_network *ibss_wlan = NULL;
 
-- 
2.20.1

