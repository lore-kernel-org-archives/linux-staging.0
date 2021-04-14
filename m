Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CBDD6D38
	for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 18:11:46 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id x12so12033596ejc.1
        for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 11:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Eoop326xhOaum2wvjim4Fuz7Vdb+NsjHAN1whL6S044=;
        b=p04bysslNEBn9fluUKQKD0bRPQL6ql8DrZzb35pmF1ftfHdNjXXX5z7XH3ROH5Yuvl
         E3HyB3GCug5CgnN0gPtjLn0Ig2Gw6fklFRYiEqdCzO4Ec9PVpIc0HdGyOQ4qqlL74rTD
         36DryNG+mnZQmtaCMxf8MaAtmFRATOac7cI08aDCfOqkIG6x3+jhQd+30VJnX6SoXRLC
         YMoTtVkITvX0Wy+NcVx8soI2Bdyb7dsmpkKHe4VtJYJHkeF4yKtxPAgFcrmlSF1OndC6
         9nQ74DmE9Uof4vmKlXoEFPy6aGcjo+PGA79HyvlvwDvQgZ+AvhMoHJAa9FxWh/pCADJ0
         D7hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Eoop326xhOaum2wvjim4Fuz7Vdb+NsjHAN1whL6S044=;
        b=YvnUk6yMgwQec1etn+NzMdw5Jc7ECVxBIJ2YJuPwciRJjSQfhcrtXYoLAfMU3o84GF
         C2Odq2iDSCKcUYzzSUtt3Qg15+fxx1sKpbvD3u06u9rtbgW4/Iuv4eQnQ3kUddt8kiMO
         u064mfMhwKm4SAKxOCj4Ms8GgfaMkrH6rMg1veA9BBUxDbQClAjHF5GBoFdWvKBWA0kR
         wnflZ9/iV6c8hWVX+kMbPnK0Ko8MqgMtJlwQKBVcazdqieEMDUCBbx2XgCQloN/1vUk7
         8lUDpnTJ8dZL3Jgymq3rWpvbPo+hUGNoIcLp40iCNfxS7twZzUo/LZFRF98AFqQSekND
         mydA==
X-Gm-Message-State: AOAM5313ZogTH5gvYr1QJ7bV45bf6ZJnKVMjghmiyuOYyAbvy4oYlT7m
	XI1XSFBmgSuQyr6t1/leI6peqKTBzCGN3A==
X-Google-Smtp-Source: ABdhPJy3aqdTyFGpqGbMgPvlGgs/qPkwowZit3JHc8AdzYoEgAvBKXUlpe6H56RoaXdCRGbhgVi2kw==
X-Received: by 2002:a17:906:4352:: with SMTP id z18mr124503ejm.387.1618423905074;
        Wed, 14 Apr 2021 11:11:45 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id v1sm279493eds.17.2021.04.14.11.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 11:11:44 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev
Subject: [PATCH 10/57] staging: rtl8723bs: core: rtw_mlme: Remove a bunch of unused variables
Date: Wed, 14 Apr 2021 19:10:42 +0100
Message-Id: <20210414181129.1628598-11-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210414181129.1628598-1-lee.jones@linaro.org>
References: <20210414181129.1628598-1-lee.jones@linaro.org>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Fixes the following W=1 kernel build warning(s):

 drivers/staging/rtl8723bs/core/rtw_mlme.c: In function ‘rtw_build_wmm_ie_ht’:
 drivers/staging/rtl8723bs/core/rtw_mlme.c:2482:6: warning: variable ‘pframe’ set but not used [-Wunused-but-set-variable]
 drivers/staging/rtl8723bs/core/rtw_mlme.c: In function ‘rtw_restructure_ht_ie’:
 drivers/staging/rtl8723bs/core/rtw_mlme.c:2498:21: warning: variable ‘pframe’ set but not used [-Wunused-but-set-variable]
 drivers/staging/rtl8723bs/core/rtw_mlme.c: In function ‘rtw_update_ht_cap’:
 drivers/staging/rtl8723bs/core/rtw_mlme.c:2647:33: warning: variable ‘pht_addtinfo’ set but not used [-Wunused-but-set-variable]
 from drivers/staging/rtl8188eu/core/rtw_mlme.c:12:

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index a7e40aaae2d9b..c624887aeed0c 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -2352,12 +2352,11 @@ void rtw_build_wmm_ie_ht(struct adapter *padapter, u8 *out_ie, uint *pout_len)
 {
 	unsigned char WMM_IE[] = {0x00, 0x50, 0xf2, 0x02, 0x00, 0x01, 0x00};
 	int out_len;
-	u8 *pframe;
 
 	if (padapter->mlmepriv.qospriv.qos_option == 0) {
 		out_len = *pout_len;
-		pframe = rtw_set_ie(out_ie+out_len, WLAN_EID_VENDOR_SPECIFIC,
-							_WMM_IE_Length_, WMM_IE, pout_len);
+		rtw_set_ie(out_ie+out_len, WLAN_EID_VENDOR_SPECIFIC,
+			   _WMM_IE_Length_, WMM_IE, pout_len);
 
 		padapter->mlmepriv.qospriv.qos_option = 1;
 	}
@@ -2368,7 +2367,7 @@ unsigned int rtw_restructure_ht_ie(struct adapter *padapter, u8 *in_ie, u8 *out_
 {
 	u32 ielen, out_len;
 	enum ieee80211_max_ampdu_length_exp max_rx_ampdu_factor;
-	unsigned char *p, *pframe;
+	unsigned char *p;
 	struct ieee80211_ht_cap ht_capie;
 	u8 cbw40_enable = 0, stbc_rx_enable = 0, rf_type = 0, operation_bw = 0;
 	struct registry_priv *pregistrypriv = &padapter->registrypriv;
@@ -2491,8 +2490,8 @@ unsigned int rtw_restructure_ht_ie(struct adapter *padapter, u8 *in_ie, u8 *out_
 	else
 		ht_capie.ampdu_params_info |= (IEEE80211_HT_CAP_AMPDU_DENSITY&0x00);
 
-	pframe = rtw_set_ie(out_ie+out_len, WLAN_EID_HT_CAPABILITY,
-						sizeof(struct ieee80211_ht_cap), (unsigned char *)&ht_capie, pout_len);
+	rtw_set_ie(out_ie+out_len, WLAN_EID_HT_CAPABILITY,
+		   sizeof(struct ieee80211_ht_cap), (unsigned char *)&ht_capie, pout_len);
 
 	phtpriv->ht_option = true;
 
@@ -2500,7 +2499,7 @@ unsigned int rtw_restructure_ht_ie(struct adapter *padapter, u8 *in_ie, u8 *out_
 		p = rtw_get_ie(in_ie, WLAN_EID_HT_OPERATION, &ielen, in_len);
 		if (p && (ielen == sizeof(struct ieee80211_ht_addt_info))) {
 			out_len = *pout_len;
-			pframe = rtw_set_ie(out_ie+out_len, WLAN_EID_HT_OPERATION, ielen, p+2, pout_len);
+			rtw_set_ie(out_ie+out_len, WLAN_EID_HT_OPERATION, ielen, p+2, pout_len);
 		}
 	}
 
@@ -2515,7 +2514,6 @@ void rtw_update_ht_cap(struct adapter *padapter, u8 *pie, uint ie_len, u8 channe
 	int len;
 	/* struct sta_info *bmc_sta, *psta; */
 	struct ieee80211_ht_cap *pht_capie;
-	struct ieee80211_ht_addt_info *pht_addtinfo;
 	/* struct recv_reorder_ctrl *preorder_ctrl; */
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct ht_priv 	*phtpriv = &pmlmepriv->htpriv;
@@ -2552,7 +2550,6 @@ void rtw_update_ht_cap(struct adapter *padapter, u8 *pie, uint ie_len, u8 channe
 	len = 0;
 	p = rtw_get_ie(pie+sizeof(struct ndis_802_11_fix_ie), WLAN_EID_HT_OPERATION, &len, ie_len-sizeof(struct ndis_802_11_fix_ie));
 	if (p && len > 0) {
-		pht_addtinfo = (struct ieee80211_ht_addt_info *)(p+2);
 		/* todo: */
 	}
 
-- 
2.27.0

