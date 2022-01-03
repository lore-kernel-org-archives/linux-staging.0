Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3B92C9D
	for <linux-staging@lists.linux.dev>; Mon,  3 Jan 2022 19:06:36 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id q14so131591943edi.3
        for <linux-staging@lists.linux.dev>; Mon, 03 Jan 2022 11:06:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=D1i///cnKfTZkbq/DWiJzY5k7VFjzMonQidtSe6VC6Q=;
        b=YSdEuaxQAZZpHrNeVdFuwOF2hsPOpINoK5GkjuOeTKDhl9wO7L8NM5N12qpAc2Sqm0
         vYqvJolZ8lPesKTazfN53sdWTTby+AbqgAeNTi1XhyuuTwmVdHi5Iaqofem4OY8awSh/
         NPiG9WrkdOMW0bQd8m00CZm7eYfnARDtKI7pGxv4SSAJYkpEaRiw219mHiSobB5T9sf1
         1te9TMHpfDUKEuWrrw2yAx4igGfemCqaNZDX7UXZo9oq0rccQr+Bo03SNEzbmJ47hF2c
         2xYay1CoY6RrW2I6618ieEzzMS3GCfaNsqO8xm6Z+o/Mt1r731hDBYzCtZ5Toji0/A31
         10hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=D1i///cnKfTZkbq/DWiJzY5k7VFjzMonQidtSe6VC6Q=;
        b=W6kowjgZUV2WEmmmLLw1s6y15JIsfqul0bv7l9xPbSJt9tKwiJNl0FZOAy53yYtWRd
         s1OWswXHeA61vyaTyUa3Y1NrhVr7nTNLdZPS7hC+OXEqJ50hhAXRmCj/F9NnlIxUwNXj
         GjyaKeIbtWlhTYWoueddKDqYWEF0jrgxw1wIwCdtvA1DrnWjskUNN0vp2CBlC0UVpKvJ
         z3DlV8yK2TE3xX13I4cKjCDVBCV8QSp0ySq7bZ0fQK0+guAJB9qmdhtsauTPIdDe7LNY
         GfyUZ6EwP/Id1DPQ2a8xY2aofu2Y2jfsr4FMa1qPKkuceAhDtWLM5c+m3NcOdtSzEb0w
         5tJg==
X-Gm-Message-State: AOAM533y4vaH6/Tr726LKaoaJV9WOHdzkXir5z2JDU2mZQnijuJpPjh2
	LWR43OZl2fUF6tXab5zxuVA=
X-Google-Smtp-Source: ABdhPJwd5azRAS9V60QFKJFbmgzEdJyfPv0l31p1pSZTK/6jM+b9sRVGTKg+g/3zDRojsLze27FexQ==
X-Received: by 2002:a17:907:72c6:: with SMTP id du6mr32976825ejc.552.1641236795124;
        Mon, 03 Jan 2022 11:06:35 -0800 (PST)
Received: from t470p.fritz.box (host-87-18-201-21.retail.telecomitalia.it. [87.18.201.21])
        by smtp.gmail.com with ESMTPSA id gt20sm7009614ejc.11.2022.01.03.11.06.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 11:06:34 -0800 (PST)
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
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Zameer Manji <zmanji@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 02/56] staging: r8188eu: rename camelcase SetToDs to set_to_ds
Date: Mon,  3 Jan 2022 20:01:37 +0100
Message-Id: <20220103190326.363960-3-alb3rt0.m3rciai@gmail.com>
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

Rename camel case macro SetToDs into set_to_ds.

Signed-off-by: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 4 ++--
 drivers/staging/r8188eu/core/rtw_xmit.c     | 2 +-
 drivers/staging/r8188eu/hal/rtl8188e_cmd.c  | 2 +-
 drivers/staging/r8188eu/include/wifi.h      | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index 0aa958f20cd6..6c784134d957 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -5409,7 +5409,7 @@ static int _issue_nulldata(struct adapter *padapter, unsigned char *da, unsigned
 	if ((pmlmeinfo->state & 0x03) == WIFI_FW_AP_STATE)
 		SetFrDs(fctrl);
 	else if ((pmlmeinfo->state & 0x03) == WIFI_FW_STATION_STATE)
-		SetToDs(fctrl);
+		set_to_ds(fctrl);
 
 	if (power_mode)
 		SetPwrMgt(fctrl);
@@ -5524,7 +5524,7 @@ static int _issue_qos_nulldata(struct adapter *padapter, unsigned char *da, u16
 	if ((pmlmeinfo->state & 0x03) == WIFI_FW_AP_STATE)
 		SetFrDs(fctrl);
 	else if ((pmlmeinfo->state & 0x03) == WIFI_FW_STATION_STATE)
-		SetToDs(fctrl);
+		set_to_ds(fctrl);
 
 	qc = (unsigned short *)(pframe + pattrib->hdrlen - 2);
 
diff --git a/drivers/staging/r8188eu/core/rtw_xmit.c b/drivers/staging/r8188eu/core/rtw_xmit.c
index 8503059edc46..b528729cad76 100644
--- a/drivers/staging/r8188eu/core/rtw_xmit.c
+++ b/drivers/staging/r8188eu/core/rtw_xmit.c
@@ -729,7 +729,7 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 		if (check_fwstate(pmlmepriv, WIFI_STATION_STATE)) {
 			/* to_ds = 1, fr_ds = 0; */
 			/* Data transfer to AP */
-			SetToDs(fctrl);
+			set_to_ds(fctrl);
 			memcpy(pwlanhdr->addr1, get_bssid(pmlmepriv), ETH_ALEN);
 			memcpy(pwlanhdr->addr2, pattrib->src, ETH_ALEN);
 			memcpy(pwlanhdr->addr3, pattrib->dst, ETH_ALEN);
diff --git a/drivers/staging/r8188eu/hal/rtl8188e_cmd.c b/drivers/staging/r8188eu/hal/rtl8188e_cmd.c
index ca24e17c369d..e452b257ccae 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_cmd.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_cmd.c
@@ -345,7 +345,7 @@ static void ConstructNullFunctionData(struct adapter *adapt, u8 *pframe,
 
 	switch (cur_network->network.InfrastructureMode) {
 	case Ndis802_11Infrastructure:
-		SetToDs(fctrl);
+		set_to_ds(fctrl);
 		memcpy(pwlanhdr->addr1, get_my_bssid(&pmlmeinfo->network), ETH_ALEN);
 		memcpy(pwlanhdr->addr2, myid(&adapt->eeprompriv), ETH_ALEN);
 		memcpy(pwlanhdr->addr3, StaAddr, ETH_ALEN);
diff --git a/drivers/staging/r8188eu/include/wifi.h b/drivers/staging/r8188eu/include/wifi.h
index f16e9f44babe..c556cf378c8a 100644
--- a/drivers/staging/r8188eu/include/wifi.h
+++ b/drivers/staging/r8188eu/include/wifi.h
@@ -163,7 +163,7 @@ enum WIFI_REG_DOMAIN {
 #define _PRIVACY_	BIT(14)
 #define _ORDER_		BIT(15)
 
-#define SetToDs(pbuf)	\
+#define set_to_ds(pbuf)	\
 	(*(__le16 *)(pbuf) |= cpu_to_le16(_TO_DS_))
 
 #define GetToDs(pbuf)	(((*(__le16 *)(pbuf)) & cpu_to_le16(_TO_DS_)) != 0)
-- 
2.25.1

