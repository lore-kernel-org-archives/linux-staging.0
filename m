Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15FE72C9D
	for <linux-staging@lists.linux.dev>; Mon,  3 Jan 2022 19:28:57 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id z9so69668562edm.10
        for <linux-staging@lists.linux.dev>; Mon, 03 Jan 2022 11:28:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jC9GfqAEG1oscKSGr8M4ekdmopbtvw0u4ek2tgYjuio=;
        b=YzVvPpCR7avgNkwZUnNSBL/3XExVawT59Q2+3vfBPmMv+LsJ7CYJv8whN6Woc8frlU
         B2GVajEfWzKK54+BJGZYdUJ3t7PvFHU/VY/4BVNo4AxcxHTni2sVUC8zotw3K8nx9OHw
         o+u2wz65i5ewyXDLagyTrf6Hn9zc7SqcwNViQQW2+28GMqVd9twLgWGssrgr43gMGzFp
         TGwduMVlgZLI98yH52eSgibYfkleoXbdHhrqMKU85PPoBFTe82CYDiVb6F24Cp28hB9w
         jkMpk2lp4Losxu0eJ+LycusQGgby7AhhvMtsYfz1ZeAl9JICNe4Bvepi2f2mPoz2wa2s
         e7mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jC9GfqAEG1oscKSGr8M4ekdmopbtvw0u4ek2tgYjuio=;
        b=K6le2SDAtZuJkaBz007eitI0PbNVZu3HOOUHfV7E6DCLEHGeHOm4k7oDW9/LLa12TV
         fSZS5OqJES3gkJT/hXYOTRZohkLLzkk+NDzNobS34CUAbognOQYXl6mNwsS+AJ7a+7Um
         rJeXfN0mDgv2VKS0XOn8Aswp0317YZ9PJEiYLu8eidpUVyb/+JBxRaH8GcNvzImEvFWV
         cfcMqWalDeEJJJecV2fw0MrYBQOrRY5AHeKiQ5cPipvOzt+Z7FHwvicxPqxxDfbYKRtH
         C74IdAQH+kpKDMK5kJ68cTHleoqbl2XT9gxLP3bOOUbwBqMm4wGVt2HzPgzmbS96CFn0
         2E5Q==
X-Gm-Message-State: AOAM531o4LXy2sc7mIFrUlMuqQ8s2QPUVTiCu7NzU6cJ82zdn3MX5lqR
	cujQOwcGjoMRMNsKRH3S1dc=
X-Google-Smtp-Source: ABdhPJz7SrtRrBE972zhpKE56gNIC6Ttar6VTaIVjCTj0+hsccTld5Vb09ClWz6/lWAVhlXH/gOtUQ==
X-Received: by 2002:aa7:d299:: with SMTP id w25mr46135285edq.269.1641238135523;
        Mon, 03 Jan 2022 11:28:55 -0800 (PST)
Received: from t470p.fritz.box (host-87-18-201-21.retail.telecomitalia.it. [87.18.201.21])
        by smtp.gmail.com with ESMTPSA id gt20sm7009614ejc.11.2022.01.03.11.28.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 11:28:55 -0800 (PST)
From: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
To: 
Cc: alb3rt0.m3rciai@gmail.com,
	linuxfancy@googlegroups.com,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>,
	Martin Kaiser <martin@kaiser.cx>,
	"Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Saurav Girepunje <saurav.girepunje@gmail.com>,
	Ivan Safonov <insafonov@gmail.com>,
	Yang Li <yang.lee@linux.alibaba.com>,
	Zameer Manji <zmanji@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 25/56] staging: r8188eu: rename camelcase SetPrivacy to set_privacy
Date: Mon,  3 Jan 2022 20:02:00 +0100
Message-Id: <20220103190326.363960-26-alb3rt0.m3rciai@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220103190326.363960-1-alb3rt0.m3rciai@gmail.com>
References: <20220103190326.363960-1-alb3rt0.m3rciai@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename camel case macro SetPrivacy into set_privacy.

Signed-off-by: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 2 +-
 drivers/staging/r8188eu/core/rtw_xmit.c     | 2 +-
 drivers/staging/r8188eu/include/wifi.h      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index 63e16f9deff4..f605e4a6d8a7 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -4910,7 +4910,7 @@ void issue_auth(struct adapter *padapter, struct sta_info *psta, unsigned short
 		if ((pmlmeinfo->auth_seq == 3) && (pmlmeinfo->state & WIFI_FW_AUTH_STATE) && (use_shared_key == 1)) {
 			pframe = rtw_set_ie(pframe, _CHLGETXT_IE_, 128, pmlmeinfo->chg_txt, &pattrib->pktlen);
 
-			SetPrivacy(fctrl);
+			set_privacy(fctrl);
 
 			pattrib->hdrlen = sizeof(struct rtw_ieee80211_hdr_3addr);
 
diff --git a/drivers/staging/r8188eu/core/rtw_xmit.c b/drivers/staging/r8188eu/core/rtw_xmit.c
index 3a28c02da7c8..e182f63b6c6b 100644
--- a/drivers/staging/r8188eu/core/rtw_xmit.c
+++ b/drivers/staging/r8188eu/core/rtw_xmit.c
@@ -762,7 +762,7 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 			set_m_data(fctrl);
 
 		if (pattrib->encrypt)
-			SetPrivacy(fctrl);
+			set_privacy(fctrl);
 
 		if (qos_option) {
 			qc = (unsigned short *)(hdr + pattrib->hdrlen - 2);
diff --git a/drivers/staging/r8188eu/include/wifi.h b/drivers/staging/r8188eu/include/wifi.h
index 73465becf1e4..32ff5b2aed34 100644
--- a/drivers/staging/r8188eu/include/wifi.h
+++ b/drivers/staging/r8188eu/include/wifi.h
@@ -195,7 +195,7 @@ enum WIFI_REG_DOMAIN {
 
 #define get_m_data(pbuf)	(((*(__le16 *)(pbuf)) & cpu_to_le16(_MORE_DATA_)) != 0)
 
-#define SetPrivacy(pbuf)	\
+#define set_privacy(pbuf)	\
 	*(__le16 *)(pbuf) |= cpu_to_le16(_PRIVACY_)
 
 #define GetPrivacy(pbuf)					\
-- 
2.25.1

