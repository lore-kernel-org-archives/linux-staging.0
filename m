Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B052C9D
	for <linux-staging@lists.linux.dev>; Mon,  3 Jan 2022 19:49:36 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id z29so139717743edl.7
        for <linux-staging@lists.linux.dev>; Mon, 03 Jan 2022 11:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VlUnAdpZCxh+p4k3M8H06cBUwhFklxuHnBgx5rYHCfA=;
        b=nxG5yv12GZBGOv4v3ACa2CrerQjzvSm/Nh8O43gRWEp53WI8tSHY4IhEexJhnJfqs0
         V7gq/4vfix0M6gv9HB+Zawq7ydxr7jVJRhYDBICJTiVroUTF7WD6iPdWYyp9fKj4juR8
         V6dFvuWhOC75CSsRUuCZCv70+2qJ4IrKgPeWnwUGHLE34SnotvSPqTBPqj6LMPYNKqLf
         OxNINmHoZLnxHOCvV4DPY7xNLlX6vCYaumDj3ohiW3mquBAsA0RVd5Fz5TbuPLf19Bic
         hoDGMxzvYpNZ4oip3nBj3w5hDMnw9GOsQHtVr8EgXUxMewv/AWHf9MrszbP8rQzr98XD
         GP5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VlUnAdpZCxh+p4k3M8H06cBUwhFklxuHnBgx5rYHCfA=;
        b=ZoWYvfrpzjLtBLDQYjZwz8JoQixlrm3L/wpxj9iH4YQsAmAu1BBIagoUCvsr3foh28
         AZNf7QZB+HQTiYjXTAChc5y7OSnYf2onAhJL9zqpFthYU68zvuVJ5p3DhHZvXcLgNuUp
         1VSywwrvvbFmfe99NJIunoHL4efZtUNFBD+vxAqr6lN8NIhftfZ6/p71eYZeaUnxNiQC
         1ecVUtC05mkswnx3exB0a54FM1TzWvRSLQ+J/YK1V2oK17IMstttPCkHso0l/SXwjS4u
         bQdrbTiqpeaQCCwirtsjnDSa/zovvObIM7olYh6JsFz6Y1UimXW/su9mosFc7+aObkuG
         4DWQ==
X-Gm-Message-State: AOAM531xrRqD1DefdbXvukArA9PlQpK6xxVSgTFz0Db8OupfM7juQQ0r
	NJ0baMu7ePd4UnFflsqRzi5MLsg2CEw=
X-Google-Smtp-Source: ABdhPJxPXnGoyrGmVduRpZU2vZynEnj12nigymPYNTyICBWyUmrxMOksSE86HAPYL9g8T6p9fIt0gA==
X-Received: by 2002:a17:907:6d9c:: with SMTP id sb28mr36521799ejc.393.1641239374708;
        Mon, 03 Jan 2022 11:49:34 -0800 (PST)
Received: from t470p.fritz.box (host-87-18-201-21.retail.telecomitalia.it. [87.18.201.21])
        by smtp.gmail.com with ESMTPSA id gt20sm7009614ejc.11.2022.01.03.11.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 11:49:34 -0800 (PST)
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
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Zameer Manji <zmanji@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 47/56] staging: r8188eu: rename camelcase SetAckpolicy to set_ack_policy
Date: Mon,  3 Jan 2022 20:02:22 +0100
Message-Id: <20220103190326.363960-48-alb3rt0.m3rciai@gmail.com>
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

Rename camel case macro SetAckpolicy into set_ack_policy

Signed-off-by: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 2 +-
 drivers/staging/r8188eu/core/rtw_xmit.c     | 2 +-
 drivers/staging/r8188eu/include/wifi.h      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index 13f6831fb53b..6ec53f1039cc 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -5532,7 +5532,7 @@ static int _issue_qos_nulldata(struct adapter *padapter, unsigned char *da, u16
 
 	set_eosp(qc, pattrib->eosp);
 
-	SetAckpolicy(qc, pattrib->ack_policy);
+	set_ack_policy(qc, pattrib->ack_policy);
 
 	memcpy(pwlanhdr->addr1, da, ETH_ALEN);
 	memcpy(pwlanhdr->addr2, myid(&padapter->eeprompriv), ETH_ALEN);
diff --git a/drivers/staging/r8188eu/core/rtw_xmit.c b/drivers/staging/r8188eu/core/rtw_xmit.c
index 1d22f6dc2cdc..eed9a2efa21b 100644
--- a/drivers/staging/r8188eu/core/rtw_xmit.c
+++ b/drivers/staging/r8188eu/core/rtw_xmit.c
@@ -772,7 +772,7 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 
 			set_eosp(qc, pattrib->eosp);
 
-			SetAckpolicy(qc, pattrib->ack_policy);
+			set_ack_policy(qc, pattrib->ack_policy);
 		}
 
 		/* TODO: fill HT Control Field */
diff --git a/drivers/staging/r8188eu/include/wifi.h b/drivers/staging/r8188eu/include/wifi.h
index 16acf7df0144..75b54ab0fe9c 100644
--- a/drivers/staging/r8188eu/include/wifi.h
+++ b/drivers/staging/r8188eu/include/wifi.h
@@ -241,7 +241,7 @@ enum WIFI_REG_DOMAIN {
 #define set_eosp(pbuf, eosp)	\
 		(*(__le16 *)(pbuf) |= cpu_to_le16((eosp & 1) << 4))
 
-#define SetAckpolicy(pbuf, ack)	\
+#define set_ack_policy(pbuf, ack)	\
 	*(__le16 *)(pbuf) |= cpu_to_le16((ack & 3) << 5)
 
 #define GetAckpolicy(pbuf) (((le16_to_cpu(*(__le16 *)pbuf)) >> 5) & 0x3)
-- 
2.25.1

