Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C0370
	for <linux-staging@lists.linux.dev>; Thu,  5 Aug 2021 18:37:33 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id 61-20020a9d0d430000b02903eabfc221a9so6165574oti.0
        for <linux-staging@lists.linux.dev>; Thu, 05 Aug 2021 11:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lFSSR+B2VNCO9CHsb870x2POa5wOsOAfxAuwjoPuEis=;
        b=K4BRMbfUK6XZeLpv4Kb1TgO7NqJGJrrA8ef+LHvB6W1vcOYc/3IQ26WyGe2kyheXZ1
         5JkybDvhXeuimuFGXtVp4MsX7LPOXbtV1cqdlPZaV4R136f35PeHzkNuUKtFhqq9onor
         QA3AdT2hgNNo448KBRyYKVYZCky85bCwhtxx9iWfNrvcxF6lZwVsj/mqFzBcJ3e2C+49
         7ZyjrMSKSOK73M5KuJq/fH9FTCcEkE4RpTC2x0fcYScHdkpb/n2Y0DHyB64TwYSZ2bLY
         gUlITBpMNYopjktkFoaUUze9m8OIJizAb3Y4SQ3wwtyDX1KTaU20o6yyV77SOlt9Az2S
         7fJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=lFSSR+B2VNCO9CHsb870x2POa5wOsOAfxAuwjoPuEis=;
        b=ljxY3wpvtrSPR9zzE9eaedbfor9CdVIugX6BD9d6nD0yKLP3CnKwVMjPmhk25M89f4
         YD8JYnx9o2jpcq5u2ULwhdtF3s3doRHD2AewrorrDBWKQIWWJs1Gk1VKxkORJ97mnIXD
         Kv+FCjV8GHklJt9y5o+25NCi5buXYXZC+Kwh5EHVugAOPWa5iVpLGqXuYJ2yvvckOd/t
         rF7rDWbBLRYGCtsr75SmlC56U0PBtRNpvLRytl3FECdRyJNkCkqHLDW5PLP9ciyTRsRT
         u8OgQ/gqbi5mdZVf3U9d3nWCBA5KxzQmZyrh2iNmh3pxP5g9EIPAUUOtsZzZy2vKPmQN
         M0UQ==
X-Gm-Message-State: AOAM5313LVf0LoR5WpdgBowwNoNnFj6LA6eTjBCNsLY5lmv6S1WN/8qa
	bofmRjqc+nan3fCmOzg2yew=
X-Google-Smtp-Source: ABdhPJxX2pVqOzXaAaY1MUFcMFy9KZFbXojNb5gWWQMobWy8MqnqcG+yHSS4CzkVvesw/OcvGOj66w==
X-Received: by 2002:a9d:75da:: with SMTP id c26mr4696519otl.289.1628188652637;
        Thu, 05 Aug 2021 11:37:32 -0700 (PDT)
Received: from 2603-8090-2005-39b3-0000-0000-0000-1016.res6.spectrum.com.com (2603-8090-2005-39b3-0000-0000-0000-1016.res6.spectrum.com. [2603:8090:2005:39b3::1016])
        by smtp.gmail.com with ESMTPSA id q32sm1156726oiw.37.2021.08.05.11.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Aug 2021 11:37:32 -0700 (PDT)
Sender: Larry Finger <larry.finger@gmail.com>
From: Larry Finger <Larry.Finger@lwfinger.net>
To: gregkh@linuxfoundation.org
Cc: phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Larry Finger <Larry.Finger@lwfinger.net>
Subject: [PATCH 5/5] staging: r8188eu: Remove rtw_buf_free()
Date: Thu,  5 Aug 2021 13:37:17 -0500
Message-Id: <20210805183717.23007-6-Larry.Finger@lwfinger.net>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210805183717.23007-1-Larry.Finger@lwfinger.net>
References: <20210805183717.23007-1-Larry.Finger@lwfinger.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This routine is just a wrapper around kfree(). The wrapper also sets
buffer length to 0, and the pointer to NULL. The length variable is in
the struct to be freed, thus setting it to zero is meaningless. Setting
the pointer to NULL is also not needed.

Signed-off-by: Larry Finger <Larry.Finger@lwfinger.net>
---
 drivers/staging/r8188eu/core/rtw_mlme.c         | 4 ++--
 drivers/staging/r8188eu/core/rtw_mlme_ext.c     | 9 ++++-----
 drivers/staging/r8188eu/include/osdep_service.h | 1 -
 drivers/staging/r8188eu/os_dep/osdep_service.c  | 7 -------
 4 files changed, 6 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme.c b/drivers/staging/r8188eu/core/rtw_mlme.c
index 4ffed8a35054..e3d5a721d25c 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme.c
@@ -99,8 +99,8 @@ static void rtw_free_mlme_ie_data(u8 **ppie, u32 *plen)
 
 void rtw_free_mlme_priv_ie_data(struct mlme_priv *pmlmepriv)
 {
-	rtw_buf_free(&pmlmepriv->assoc_req, &pmlmepriv->assoc_req_len);
-	rtw_buf_free(&pmlmepriv->assoc_rsp, &pmlmepriv->assoc_rsp_len);
+	kfree(pmlmepriv->assoc_req);
+	kfree(pmlmepriv->assoc_rsp);
 	rtw_free_mlme_ie_data(&pmlmepriv->wps_beacon_ie, &pmlmepriv->wps_beacon_ie_len);
 	rtw_free_mlme_ie_data(&pmlmepriv->wps_probe_req_ie, &pmlmepriv->wps_probe_req_ie_len);
 	rtw_free_mlme_ie_data(&pmlmepriv->wps_probe_resp_ie, &pmlmepriv->wps_probe_resp_ie_len);
diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index a8ed4e1a0278..470c338b44e1 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -1519,11 +1519,10 @@ unsigned int OnAssocRsp(struct adapter *padapter, struct recv_frame *precv_frame
 	UpdateBrateTbl(padapter, pmlmeinfo->network.SupportedRates);
 
 report_assoc_result:
-	if (res > 0) {
+	if (res > 0)
 		rtw_buf_update(&pmlmepriv->assoc_rsp, &pmlmepriv->assoc_rsp_len, pframe, pkt_len);
-	} else {
-		rtw_buf_free(&pmlmepriv->assoc_rsp, &pmlmepriv->assoc_rsp_len);
-	}
+	else
+		kfree(pmlmepriv->assoc_rsp);
 
 	report_join_res(padapter, res);
 
@@ -5534,7 +5533,7 @@ void issue_assocreq(struct adapter *padapter)
 	if (ret == _SUCCESS)
 		rtw_buf_update(&pmlmepriv->assoc_req, &pmlmepriv->assoc_req_len, (u8 *)pwlanhdr, pattrib->pktlen);
 	else
-		rtw_buf_free(&pmlmepriv->assoc_req, &pmlmepriv->assoc_req_len);
+		kfree(pmlmepriv->assoc_req);
 }
 
 /* when wait_ack is ture, this function shoule be called at process context */
diff --git a/drivers/staging/r8188eu/include/osdep_service.h b/drivers/staging/r8188eu/include/osdep_service.h
index cb876b50d68c..10f0203fd905 100644
--- a/drivers/staging/r8188eu/include/osdep_service.h
+++ b/drivers/staging/r8188eu/include/osdep_service.h
@@ -370,7 +370,6 @@ void rtw_free_netdev(struct net_device *netdev);
 		(a)[3] = (u8) (((u32) (val)) & 0xff);		\
 	} while (0)
 
-void rtw_buf_free(u8 **buf, u32 *buf_len);
 void rtw_buf_update(u8 **buf, u32 *buf_len, u8 *src, u32 src_len);
 
 struct rtw_cbuf {
diff --git a/drivers/staging/r8188eu/os_dep/osdep_service.c b/drivers/staging/r8188eu/os_dep/osdep_service.c
index db6ee1dca48e..232d3a337be4 100644
--- a/drivers/staging/r8188eu/os_dep/osdep_service.c
+++ b/drivers/staging/r8188eu/os_dep/osdep_service.c
@@ -283,13 +283,6 @@ int rtw_change_ifname(struct adapter *padapter, const char *ifname)
 	return -1;
 }
 
-void rtw_buf_free(u8 **buf, u32 *buf_len)
-{
-	*buf_len = 0;
-	kfree(*buf);
-	*buf = NULL;
-}
-
 void rtw_buf_update(u8 **buf, u32 *buf_len, u8 *src, u32 src_len)
 {
 	u32 dup_len = 0;
-- 
2.32.0

