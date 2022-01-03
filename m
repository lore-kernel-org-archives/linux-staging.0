Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B5C2C9D
	for <linux-staging@lists.linux.dev>; Mon,  3 Jan 2022 19:33:38 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id j6so139514047edw.12
        for <linux-staging@lists.linux.dev>; Mon, 03 Jan 2022 11:33:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kElzypl4KDIO8jevq+QDfRz1McQ0vZVv9uHcni8dwrs=;
        b=PiwtAjetdLG/iEW1Zli78NYHUGqaebOBZm9BWChaUWakZtSFJ7SkAEkIBNniK0pAy/
         XGSmfMDlqo8F65OE4w1kJUTxqIezOzhrGRFM3iwz/BtkOvxg97GGFP7OBjFPdVQCgYlH
         xAy+VCT/nUeinP4ZvSvY+ifqP5/2m3T//0a6EMhUNA6t16fNxj0bOUQBoyxdIEeeEx1P
         u9dmTbzoHX13rLIa94Qlud0glWXEJBZD7Ox6BOnkq4YERZfM2j8xiEtqcQjUWikThorl
         xOuWIXssteOGkEUHQtfcOCZ3QOOpl6R0gAYANXC/JTs5XRpFHwfHZBoaIh1zruYNlE8z
         GElQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kElzypl4KDIO8jevq+QDfRz1McQ0vZVv9uHcni8dwrs=;
        b=B24SSmiNRWGHwH5PR4fNLaG1rxpw+pNPyckGoqV8/Cgxr7HbpBWdDCnp80ymDkx7Ny
         uc1vu8nnjR/dmGYIlmxy8M3LuRfwIlEeH5mgeaAB/0wWXNLyAANjiuAziBew2Qum7BOT
         qoW9m4ShcqoIjlWUd332Baq9AWYH5QIFXczaiyLbc+GXQ3VddTMGQctWjAk+OGc0jg+0
         vtbVM56V/yxiexSMdpeBk8pq0VJGZZn2Xjyk3HG4jVYny5yx1I9kwuZW6y+Z1nMTj4V2
         GOkNdnZxEn7S73G73NHYwn1SCT41x9Pmd4PHHaMTZhMQ1sUlLqe1Aecg55aSPeCZFrnK
         K4Xw==
X-Gm-Message-State: AOAM5313wnwXJb3h4O78qbp3FzM72+Eg2qK/u0WVNYQH3GuISxIrhBXg
	9XuXcLjownNYDuaD4gm9gPE=
X-Google-Smtp-Source: ABdhPJwRyz/59a9pfUpkmO/x5FqQp+vArcYyPhg5F6zGgQC1zhhxQXeGe6v3XI6r2S8uwDzJZ6Rnfw==
X-Received: by 2002:a17:907:9694:: with SMTP id hd20mr35878642ejc.360.1641238416737;
        Mon, 03 Jan 2022 11:33:36 -0800 (PST)
Received: from t470p.fritz.box (host-87-18-201-21.retail.telecomitalia.it. [87.18.201.21])
        by smtp.gmail.com with ESMTPSA id gt20sm7009614ejc.11.2022.01.03.11.33.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 11:33:36 -0800 (PST)
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
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Zameer Manji <zmanji@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 30/56] staging: r8188eu: rename camelcase GetFrameType to get_frame_type
Date: Mon,  3 Jan 2022 20:02:05 +0100
Message-Id: <20220103190326.363960-31-alb3rt0.m3rciai@gmail.com>
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

Rename camel case macro GetFrameType into get_frame_type.

Signed-off-by: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 2 +-
 drivers/staging/r8188eu/core/rtw_recv.c     | 6 +++---
 drivers/staging/r8188eu/core/rtw_security.c | 4 ++--
 drivers/staging/r8188eu/include/wifi.h      | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index 763f46dd1b5a..5d0901f72cd8 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -416,7 +416,7 @@ void mgt_dispatcher(struct adapter *padapter, struct recv_frame *precv_frame)
 	u8 *pframe = precv_frame->rx_data;
 	struct sta_info *psta = rtw_get_stainfo(&padapter->stapriv, GetAddr2Ptr(pframe));
 
-	if (GetFrameType(pframe) != WIFI_MGT_TYPE)
+	if (get_frame_type(pframe) != WIFI_MGT_TYPE)
 		return;
 
 	/* receive the frames that ra(a1) is my address or ra(a1) is bc address. */
diff --git a/drivers/staging/r8188eu/core/rtw_recv.c b/drivers/staging/r8188eu/core/rtw_recv.c
index 230c8198ed84..9902adf99142 100644
--- a/drivers/staging/r8188eu/core/rtw_recv.c
+++ b/drivers/staging/r8188eu/core/rtw_recv.c
@@ -819,7 +819,7 @@ static int validate_recv_ctrl_frame(struct adapter *padapter,
 	u8 *pframe = precv_frame->rx_data;
 	/* uint len = precv_frame->len; */
 
-	if (GetFrameType(pframe) != WIFI_CTRL_TYPE)
+	if (get_frame_type(pframe) != WIFI_CTRL_TYPE)
 		return _FAIL;
 
 	/* receive the frames that ra(a1) is my address */
@@ -1100,7 +1100,7 @@ static int validate_recv_frame(struct adapter *adapter, struct recv_frame *precv
 		goto exit;
 	}
 
-	type =  GetFrameType(ptr);
+	type =  get_frame_type(ptr);
 	subtype = GetFrameSubType(ptr); /* bit(7)~bit(2) */
 
 	pattrib->to_fr_ds = get_tofr_ds(ptr);
@@ -1345,7 +1345,7 @@ struct recv_frame *recvframe_chk_defrag(struct adapter *padapter, struct recv_fr
 	psta_addr = pfhdr->attrib.ta;
 	psta = rtw_get_stainfo(pstapriv, psta_addr);
 	if (!psta) {
-		u8 type = GetFrameType(pfhdr->rx_data);
+		u8 type = get_frame_type(pfhdr->rx_data);
 		if (type != WIFI_DATA_TYPE) {
 			psta = rtw_get_bcmc_stainfo(padapter);
 			pdefrag_q = &psta->sta_recvpriv.defrag_q;
diff --git a/drivers/staging/r8188eu/core/rtw_security.c b/drivers/staging/r8188eu/core/rtw_security.c
index 4e93c720c1b6..42ff5fd5ddad 100644
--- a/drivers/staging/r8188eu/core/rtw_security.c
+++ b/drivers/staging/r8188eu/core/rtw_security.c
@@ -972,7 +972,7 @@ static int aes_cipher(u8 *key, uint hdrlen, u8 *pframe, uint plen)
 	u8 aes_out[16];
 	u8 padded_buffer[16];
 	u8 mic[8];
-	uint	frtype  = GetFrameType(pframe);
+	uint	frtype  = get_frame_type(pframe);
 	uint	frsubtype  = GetFrameSubType(pframe);
 
 	frsubtype = frsubtype >> 4;
@@ -1166,7 +1166,7 @@ static int aes_decipher(struct adapter *padapter, u8 *key, uint hdrlen,
 	u8 mic[8];
 
 /*	uint	offset = 0; */
-	uint	frtype  = GetFrameType(pframe);
+	uint	frtype  = get_frame_type(pframe);
 	uint	frsubtype  = GetFrameSubType(pframe);
 
 	frsubtype = frsubtype >> 4;
diff --git a/drivers/staging/r8188eu/include/wifi.h b/drivers/staging/r8188eu/include/wifi.h
index 1f65309aa1fe..bd22f74e425b 100644
--- a/drivers/staging/r8188eu/include/wifi.h
+++ b/drivers/staging/r8188eu/include/wifi.h
@@ -204,7 +204,7 @@ enum WIFI_REG_DOMAIN {
 #define get_order(pbuf)					\
 	(((*(__le16 *)(pbuf)) & cpu_to_le16(_ORDER_)) != 0)
 
-#define GetFrameType(pbuf)				\
+#define get_frame_type(pbuf)				\
 	(le16_to_cpu(*(__le16 *)(pbuf)) & (BIT(3) | BIT(2)))
 
 #define SetFrameType(pbuf, type)	\
@@ -361,7 +361,7 @@ static inline unsigned char *get_hdr_bssid(unsigned char *pframe)
 
 static inline int IsFrameTypeCtrl(unsigned char *pframe)
 {
-	if (WIFI_CTRL_TYPE == GetFrameType(pframe))
+	if (WIFI_CTRL_TYPE == get_frame_type(pframe))
 		return true;
 	else
 		return false;
-- 
2.25.1

