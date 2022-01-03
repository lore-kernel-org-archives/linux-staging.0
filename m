Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 285F62C9D
	for <linux-staging@lists.linux.dev>; Mon,  3 Jan 2022 19:43:03 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id w16so139805111edc.11
        for <linux-staging@lists.linux.dev>; Mon, 03 Jan 2022 11:43:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=29qe7PV2hIBYA8eyxnjqIXhxOBsDzY6Fxmr6ym+4elM=;
        b=qQJMdnoAqHoD6pD8b1Lg5VdAOVbcDJeOcvZ8o9vZ+8SYjOMr0Hop1rPqkudD7E2zPr
         3klmBVhWvevKFTNet2cw2lqLykm4nVLwHcT/VTJRiAWA0MVc22aKP597IPKWZlTgaiy3
         RoXVrByoa/6G7W6mjteqdElY822+JWEDVLb4KV2jOQkkY7e6A9NfMnU/qSIejT1u9Rl5
         ihkyIzkR9QYEsL/i+Dcu/pDVweywI+tt1hsCawcldEdHWnsHFP/5WxvUYWrDEp+/OhN0
         Wiy+0u5p83ImYl5+m2En7/30e+y50ExbuCJSDuWDnd7geZcJuXc+qHdIXY7vkzkHAYY2
         +pRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=29qe7PV2hIBYA8eyxnjqIXhxOBsDzY6Fxmr6ym+4elM=;
        b=k25SVYxaK3GYoLbzRd5mqrVUI62CnLBa9WeZUS7jWELmkKKArZRo8NUBIb9jmQ84vX
         KrLkS54iy4vcQ1au7ITRiGvpwEDQXx1wFc+/BGoFTCghijpSZ1Ahh3bKb/Wizxm1JDht
         xWGnLKkQypYkTUrrdc5CtF8KotsUuyoYnV2HSOBOy1TIXABL1qCVj61xRcq5I5ORH3C1
         Nm6FxxSPAHcSin7+W2W07C+vOHzQvc2n5RPZXHFfo0YvdE93lR75sC8Cxdmvb/+too4q
         wrLO0ce15XYRB2ztZbBLuc5WePXnhJ/fzWNj3nWuMbNi6IeFlJmEJcOpl/y4hzhOyODa
         QIGg==
X-Gm-Message-State: AOAM530c8r8CswpJHshOBeNz4v7+LdWlezBqDU4GsPMpRvUwa8HJzJby
	8Ty3U+31KSWPhO7BjCzb5UxKJmLsSXs=
X-Google-Smtp-Source: ABdhPJyqbNyx6LzYJX/vUIrldLZ02XHfKTuVLIc23SIJsKUZ7c8vG4bWapi5Zp4HOiVdgiN++bIRCQ==
X-Received: by 2002:a17:907:72c6:: with SMTP id du6mr33055285ejc.552.1641238981565;
        Mon, 03 Jan 2022 11:43:01 -0800 (PST)
Received: from t470p.fritz.box (host-87-18-201-21.retail.telecomitalia.it. [87.18.201.21])
        by smtp.gmail.com with ESMTPSA id gt20sm7009614ejc.11.2022.01.03.11.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 11:43:01 -0800 (PST)
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
	Nathan Chancellor <nathan@kernel.org>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Saurav Girepunje <saurav.girepunje@gmail.com>,
	Ivan Safonov <insafonov@gmail.com>,
	Yang Li <yang.lee@linux.alibaba.com>,
	Zameer Manji <zmanji@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 40/56] staging: r8188eu: rename camelcase SetPriority to set_priority
Date: Mon,  3 Jan 2022 20:02:15 +0100
Message-Id: <20220103190326.363960-41-alb3rt0.m3rciai@gmail.com>
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

Rename camel case macro SetPriority into set_priority.

Signed-off-by: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 2 +-
 drivers/staging/r8188eu/core/rtw_xmit.c     | 2 +-
 drivers/staging/r8188eu/hal/rtl8188e_cmd.c  | 2 +-
 drivers/staging/r8188eu/include/wifi.h      | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index e0cd1779d0c8..29075d7516ec 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -5528,7 +5528,7 @@ static int _issue_qos_nulldata(struct adapter *padapter, unsigned char *da, u16
 
 	qc = (unsigned short *)(pframe + pattrib->hdrlen - 2);
 
-	SetPriority(qc, tid);
+	set_priority(qc, tid);
 
 	SetEOSP(qc, pattrib->eosp);
 
diff --git a/drivers/staging/r8188eu/core/rtw_xmit.c b/drivers/staging/r8188eu/core/rtw_xmit.c
index cb189758a2b1..a13ef82b41f1 100644
--- a/drivers/staging/r8188eu/core/rtw_xmit.c
+++ b/drivers/staging/r8188eu/core/rtw_xmit.c
@@ -768,7 +768,7 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 			qc = (unsigned short *)(hdr + pattrib->hdrlen - 2);
 
 			if (pattrib->priority)
-				SetPriority(qc, pattrib->priority);
+				set_priority(qc, pattrib->priority);
 
 			SetEOSP(qc, pattrib->eosp);
 
diff --git a/drivers/staging/r8188eu/hal/rtl8188e_cmd.c b/drivers/staging/r8188eu/hal/rtl8188e_cmd.c
index 45cc7cbed156..e4f5b877c559 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_cmd.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_cmd.c
@@ -372,7 +372,7 @@ static void ConstructNullFunctionData(struct adapter *adapt, u8 *pframe,
 		set_frame_subtype(pframe, WIFI_QOS_DATA_NULL);
 
 		pwlanqoshdr = (struct rtw_ieee80211_hdr_3addr_qos *)pframe;
-		SetPriority(&pwlanqoshdr->qc, AC);
+		set_priority(&pwlanqoshdr->qc, AC);
 		SetEOSP(&pwlanqoshdr->qc, bEosp);
 
 		pktlen = sizeof(struct rtw_ieee80211_hdr_3addr_qos);
diff --git a/drivers/staging/r8188eu/include/wifi.h b/drivers/staging/r8188eu/include/wifi.h
index 275c6fb0cfc1..f1955ddb6460 100644
--- a/drivers/staging/r8188eu/include/wifi.h
+++ b/drivers/staging/r8188eu/include/wifi.h
@@ -233,7 +233,7 @@ enum WIFI_REG_DOMAIN {
 #define set_duration(pbuf, dur) \
 	*(__le16 *)((size_t)(pbuf) + 2) = cpu_to_le16(0xffff & (dur))
 
-#define SetPriority(pbuf, tid)	\
+#define set_priority(pbuf, tid)	\
 	*(__le16 *)(pbuf) |= cpu_to_le16(tid & 0xf)
 
 #define GetPriority(pbuf)	((le16_to_cpu(*(__le16 *)(pbuf))) & 0xf)
-- 
2.25.1

