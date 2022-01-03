Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CDAC173
	for <linux-staging@lists.linux.dev>; Mon,  3 Jan 2022 19:30:49 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id o6so139663686edc.4
        for <linux-staging@lists.linux.dev>; Mon, 03 Jan 2022 11:30:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mkWZTdmzHLtl3zJs0ahCeqlyHJTujkjI+nji+bzQIEI=;
        b=X/q4shJMTCZY88XqZabGDUacZoSfxxIcd6/z7hB5yfYXdobTkTRUUkhWtWU1PQ51Bb
         P7NQfkpRSymdYoIUZuF61INnJYpbGKz6lqrLPB1fUSNpfhn87xV/cNSeLEUipuIsDtmo
         Wx1yt0WYWQac+bwYZ/Y6Xd8+2/aW/8pzI3Vahtm/9YA9o/KeCI60EeGaBbUo0FbDoooT
         rbcCkjEqYiiXjbL2sigYLaLrclAqXZROyxtNYJoUK9CEmxKkizoLIrLxvBli3p4Uin9V
         rtLv0eaxtKJNH9EWmkXiSS87JJnIGZ/j7M4ZlWBXP48FBhn88cjN79NSgxHy+kesaxzc
         A7kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mkWZTdmzHLtl3zJs0ahCeqlyHJTujkjI+nji+bzQIEI=;
        b=hoCdG9n0cgL9C/2X/NP+XD5s8ziJjVDm5Ng2myDkXukKmuAIEkuSrR1hzyGqLCcmfX
         M3FpGjJLAfc1yl3hNmiMtT2rQ9MKsVek0P5hWzrY7yb47yUMFktbW9Gs4ctZG3GYDTil
         KiywCtOaIH6XWgkYJHdPZqhWmBPnux186e4JXFFHCVphWV23MXBksax22EQwnv+9sLyP
         GSz9o4E83fPor6CBM6ieM9HJ5V4yZE+csLBQiB6QpfMIeTn1xk24CjJEOdSn4KwDg8pU
         xsflogLQzs7Kdthdq2XuwwPmGsw588vPyq8dRNz+COl8021xXOXxAJaFnmE0aWox3pc4
         IKSQ==
X-Gm-Message-State: AOAM531IX07FQSQPOI9g5kv7NF6wRuuiNXvoXmGAZ+1mocFQzaMO2mzO
	fzI7vMBSxD5zMPQn8GBtAVs=
X-Google-Smtp-Source: ABdhPJyqRIB4uII+kp9RObUBWGeHRRd7j2xt3PHdweqmanUg004Pz4ztlHQJX7WUzVF3+VbwJDqFIw==
X-Received: by 2002:a05:6402:2791:: with SMTP id b17mr45689676ede.373.1641238247765;
        Mon, 03 Jan 2022 11:30:47 -0800 (PST)
Received: from t470p.fritz.box (host-87-18-201-21.retail.telecomitalia.it. [87.18.201.21])
        by smtp.gmail.com with ESMTPSA id gt20sm7009614ejc.11.2022.01.03.11.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 11:30:47 -0800 (PST)
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
Subject: [PATCH 27/56] staging: r8188eu: rename camelcase GetPrivacy to get_privacy
Date: Mon,  3 Jan 2022 20:02:02 +0100
Message-Id: <20220103190326.363960-28-alb3rt0.m3rciai@gmail.com>
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

Rename camel case macro GetPrivacy into get_privacy.

Signed-off-by: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 2 +-
 drivers/staging/r8188eu/core/rtw_recv.c     | 2 +-
 drivers/staging/r8188eu/include/wifi.h      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index f605e4a6d8a7..763f46dd1b5a 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -886,7 +886,7 @@ unsigned int OnAuthClient(struct adapter *padapter, struct recv_frame *precv_fra
 	if (!(pmlmeinfo->state & WIFI_FW_AUTH_STATE))
 		return _SUCCESS;
 
-	offset = (GetPrivacy(pframe)) ? 4 : 0;
+	offset = (get_privacy(pframe)) ? 4 : 0;
 
 	seq	= le16_to_cpu(*(__le16 *)((size_t)pframe + WLAN_HDR_A3_LEN + offset + 2));
 	status	= le16_to_cpu(*(__le16 *)((size_t)pframe + WLAN_HDR_A3_LEN + offset + 4));
diff --git a/drivers/staging/r8188eu/core/rtw_recv.c b/drivers/staging/r8188eu/core/rtw_recv.c
index 59560a3c87df..81f1ed9b5186 100644
--- a/drivers/staging/r8188eu/core/rtw_recv.c
+++ b/drivers/staging/r8188eu/core/rtw_recv.c
@@ -1111,7 +1111,7 @@ static int validate_recv_frame(struct adapter *adapter, struct recv_frame *precv
 	pattrib->pw_save = get_pwr_mgt(ptr);
 	pattrib->mfrag = get_m_frag(ptr);
 	pattrib->mdata = get_m_data(ptr);
-	pattrib->privacy = GetPrivacy(ptr);
+	pattrib->privacy = get_privacy(ptr);
 	pattrib->order = GetOrder(ptr);
 
 	/* Dump rx packets */
diff --git a/drivers/staging/r8188eu/include/wifi.h b/drivers/staging/r8188eu/include/wifi.h
index 75a69323e787..da8a5bd12646 100644
--- a/drivers/staging/r8188eu/include/wifi.h
+++ b/drivers/staging/r8188eu/include/wifi.h
@@ -198,7 +198,7 @@ enum WIFI_REG_DOMAIN {
 #define set_privacy(pbuf)	\
 	(*(__le16 *)(pbuf) |= cpu_to_le16(_PRIVACY_))
 
-#define GetPrivacy(pbuf)					\
+#define get_privacy(pbuf)					\
 	(((*(__le16 *)(pbuf)) & cpu_to_le16(_PRIVACY_)) != 0)
 
 #define ClearPrivacy(pbuf)	\
-- 
2.25.1

