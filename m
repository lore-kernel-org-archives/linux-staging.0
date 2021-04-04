Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93E770
	for <linux-staging@lists.linux.dev>; Sun,  4 Apr 2021 14:10:14 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id u5-20020a7bcb050000b029010e9316b9d5so4468700wmj.2
        for <linux-staging@lists.linux.dev>; Sun, 04 Apr 2021 07:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aKJMQyibGkbhT7wVDkcAwfnXuo5IWQYiwpzUD+I1No0=;
        b=YIICI1EnDAQIG+agmEPc7Vd6BcInQyeh8NdLLT6IK3ebjBBOe0wbRmrO7hdAibVo1o
         9xs13W91sV5RNdYzRD+KO4ADal9ieTMjWqo+wwRyUo3Y0huiYPugWBKcgWy8wFVego3g
         6a6RWR31YefMweeUV9O2iTEvZL9djiA40qUIipPJEwbFVhCpYziOZ6hdNZpMytpMGOn8
         27BMcIDTXWC2EbR1KOEo1lqDy+5spNX46iDZtZJKBlDsh87sccE28bCRUjoRcTnt7fv4
         ZLVA5LQtZPhbvnmAoAKd7+1TSKdx59nAygH00KOXPLT6ru8RtdLsZT4nUPBhF/9Jyb5N
         TVjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aKJMQyibGkbhT7wVDkcAwfnXuo5IWQYiwpzUD+I1No0=;
        b=DPlJnz7fCgKXfh1vB/EK6vHHk3/NnCoLZx002HfhzwluVyFh2nmRhhm8yBXPbNFbaR
         pUq1ulCv+3Qg2f7kq5/56Eb5olLPSHEzwXArvj719HWAKcXjglaRbzlJcQsQvmOLMqkF
         bA8BSHzL5VItobchLDS0fLnA4R9leU0Nb8X1Ws+KtEf3etO4j7agF+moQoXYZvYx5HUT
         YHyowBLlDpyz2YaH93AYPFrTSEn+BxwCxu1CpsVfJGDFhzOHcT2q2U33ckl3GCY24bab
         ZHE0vBctgP/fUsaAaal4ExiRcN4qIDVUYidHZdI0NapYjGctnq5nmj9SCdhkJs0CdgPq
         5FOA==
X-Gm-Message-State: AOAM533z1PmHuvukC62MH8OCN7n/Dlk+mYGruAQ/qrzH0I2cvG2bJvVh
	01P/rQ5ZEqNk+P/LdAI9NkgxqcOCDTBe7Q==
X-Google-Smtp-Source: ABdhPJzrmDQybCU4L7MRdcfzVHuGRBl+4WwLhK81JhCpklUz02zwylAGQcuO2b58pmxVvhqBmZfFig==
X-Received: by 2002:a7b:cbc4:: with SMTP id n4mr21931659wmi.153.1617545413455;
        Sun, 04 Apr 2021 07:10:13 -0700 (PDT)
Received: from agape ([5.171.81.112])
        by smtp.gmail.com with ESMTPSA id h10sm23472217wrp.22.2021.04.04.07.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Apr 2021 07:10:13 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH v4 14/30] staging: rtl8723bs: remove commented RT_TRACE calls in core/rtw_mlme.c
Date: Sun,  4 Apr 2021 16:09:30 +0200
Message-Id: <09862e8783366045a08fd97523595710a08df918.1617545239.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617545239.git.fabioaiuto83@gmail.com>
References: <cover.1617545239.git.fabioaiuto83@gmail.com>
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

