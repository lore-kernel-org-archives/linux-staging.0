Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA372C9D
	for <linux-staging@lists.linux.dev>; Mon,  3 Jan 2022 19:09:46 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id f5so139442958edq.6
        for <linux-staging@lists.linux.dev>; Mon, 03 Jan 2022 11:09:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6/SsS7YY6jOZKW1D8whhVsYEANLlR3P378c7ShG7aio=;
        b=nOnH7F4QvBFOeuviF9btR9omm60fz+0iEmwKCTbUoE1f1Z//V3bmwJijbGqzA6aZjW
         iVqtaL9IZwKPEsJkn6nzb+IWbDC1Q0z518aXeCDT0/1c4nrYB2iuDcqrOh9l1d0fSmEr
         JSAIAZwVSB9CTIvVTWDQ70C5S+uckDY5QlEnkpkG1UE8EkdoXmUrlrRrY4vfl1KCofr0
         ouYrjj5XztPQmOFINcXw/Psti8xsxSVV9L7b07GB//NaIZt96DMsfz0pXl2LkSDjlDzg
         /WaNxbJDfMFvkU5wCu352Ge08/ozmlFqQKgf2G8D7yl/PMB6EhPi3ktgUDcFuJ9nXsT/
         Pqfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6/SsS7YY6jOZKW1D8whhVsYEANLlR3P378c7ShG7aio=;
        b=sJAu15JstsdX3QLnhVOQEWLzYr6uRkqJwXC5YItjNljnkdgiqDUD9aKf5AqXGg10fm
         7lOQzO3CJzmr1w2mNJyfLl6m1cM1Rl/jINvOgdRH+oe9L89IeOozqBklEKW3pl5rEFDW
         UevQv3iwjuFEJCK3OOgIZ3ArJ0bNHaO6vRWz7s48DNA4rVTSZITI+V/TwFIlbSxqsM3B
         cnrqM3YiTpj1UaQtoitXAIicCb7a0Nv1ZWENprmN+IsbJL6n3bn2A+GerCllhGPR4Qj2
         w/pvoLT5TBdGXVwDydtPRRzS6UuFAzJMaabtei1FFTaM/wCcx+zHJtHxNLavNB9z8JNr
         Sohw==
X-Gm-Message-State: AOAM533qbW2YPpqBfUywzLebrlFhASgs7SPgvlqLQDXiw2ShuVWIGKD8
	1qPtYcNfbKcNX8o7T6A6vOU=
X-Google-Smtp-Source: ABdhPJzuY/MENW576uNULMvtYRIWbael5usldtJPG+VOi5Sig6YNrPwu/mRuKS6hu6uT3HWkS/k55A==
X-Received: by 2002:a17:907:72c6:: with SMTP id du6mr35818639ejc.7.1641236984819;
        Mon, 03 Jan 2022 11:09:44 -0800 (PST)
Received: from t470p.fritz.box (host-87-18-201-21.retail.telecomitalia.it. [87.18.201.21])
        by smtp.gmail.com with ESMTPSA id gt20sm7009614ejc.11.2022.01.03.11.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 11:09:44 -0800 (PST)
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
Subject: [PATCH 05/56] staging: r8188eu: rename camelcase SetFrDs to set_fr_ds
Date: Mon,  3 Jan 2022 20:01:40 +0100
Message-Id: <20220103190326.363960-6-alb3rt0.m3rciai@gmail.com>
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

Rename camel case macro SetFrDs into set_fr_ds.

Signed-off-by: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 4 ++--
 drivers/staging/r8188eu/core/rtw_xmit.c     | 2 +-
 drivers/staging/r8188eu/hal/rtl8188e_cmd.c  | 2 +-
 drivers/staging/r8188eu/include/wifi.h      | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index 6c784134d957..b033705c0578 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -5407,7 +5407,7 @@ static int _issue_nulldata(struct adapter *padapter, unsigned char *da, unsigned
 	*(fctrl) = 0;
 
 	if ((pmlmeinfo->state & 0x03) == WIFI_FW_AP_STATE)
-		SetFrDs(fctrl);
+		set_fr_ds(fctrl);
 	else if ((pmlmeinfo->state & 0x03) == WIFI_FW_STATION_STATE)
 		set_to_ds(fctrl);
 
@@ -5522,7 +5522,7 @@ static int _issue_qos_nulldata(struct adapter *padapter, unsigned char *da, u16
 	*(fctrl) = 0;
 
 	if ((pmlmeinfo->state & 0x03) == WIFI_FW_AP_STATE)
-		SetFrDs(fctrl);
+		set_fr_ds(fctrl);
 	else if ((pmlmeinfo->state & 0x03) == WIFI_FW_STATION_STATE)
 		set_to_ds(fctrl);
 
diff --git a/drivers/staging/r8188eu/core/rtw_xmit.c b/drivers/staging/r8188eu/core/rtw_xmit.c
index b528729cad76..b6a602060c91 100644
--- a/drivers/staging/r8188eu/core/rtw_xmit.c
+++ b/drivers/staging/r8188eu/core/rtw_xmit.c
@@ -738,7 +738,7 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 				qos_option = true;
 		} else if (check_fwstate(pmlmepriv,  WIFI_AP_STATE)) {
 			/* to_ds = 0, fr_ds = 1; */
-			SetFrDs(fctrl);
+			set_fr_ds(fctrl);
 			memcpy(pwlanhdr->addr1, pattrib->dst, ETH_ALEN);
 			memcpy(pwlanhdr->addr2, get_bssid(pmlmepriv), ETH_ALEN);
 			memcpy(pwlanhdr->addr3, pattrib->src, ETH_ALEN);
diff --git a/drivers/staging/r8188eu/hal/rtl8188e_cmd.c b/drivers/staging/r8188eu/hal/rtl8188e_cmd.c
index e452b257ccae..b7385ec7ce93 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_cmd.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_cmd.c
@@ -351,7 +351,7 @@ static void ConstructNullFunctionData(struct adapter *adapt, u8 *pframe,
 		memcpy(pwlanhdr->addr3, StaAddr, ETH_ALEN);
 		break;
 	case Ndis802_11APMode:
-		SetFrDs(fctrl);
+		set_fr_ds(fctrl);
 		memcpy(pwlanhdr->addr1, StaAddr, ETH_ALEN);
 		memcpy(pwlanhdr->addr2, get_my_bssid(&pmlmeinfo->network), ETH_ALEN);
 		memcpy(pwlanhdr->addr3, myid(&adapt->eeprompriv), ETH_ALEN);
diff --git a/drivers/staging/r8188eu/include/wifi.h b/drivers/staging/r8188eu/include/wifi.h
index 07195a11aa78..fd70b9513329 100644
--- a/drivers/staging/r8188eu/include/wifi.h
+++ b/drivers/staging/r8188eu/include/wifi.h
@@ -168,7 +168,7 @@ enum WIFI_REG_DOMAIN {
 
 #define GetToDs(pbuf)	(((*(__le16 *)(pbuf)) & cpu_to_le16(_TO_DS_)) != 0)
 
-#define SetFrDs(pbuf)	\
+#define set_fr_ds(pbuf)	\
 	(*(__le16 *)(pbuf) |= cpu_to_le16(_FROM_DS_))
 
 #define GetFrDs(pbuf)	(((*(__le16 *)(pbuf)) & cpu_to_le16(_FROM_DS_)) != 0)
-- 
2.25.1

