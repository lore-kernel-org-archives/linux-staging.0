Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E78AD2C9D
	for <linux-staging@lists.linux.dev>; Mon,  3 Jan 2022 19:12:49 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id z9so69529164edm.10
        for <linux-staging@lists.linux.dev>; Mon, 03 Jan 2022 11:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=s+MuB54PDkEfI8PHV65928kvfFhHSc+/Cs9qJcLi3fQ=;
        b=XjizaNZe9UlVUccI/ZOAhOXweQwyHLqOQ/yjsebGfXxdxK8IHTZSAB8Rr9J4q84ABu
         J8ZwEBxvRh/gj4Hu3OKxz1tzCEn8/rQj5xe43AIZncfLy1PrYjSe9bKmTnGPLV2voWVG
         6bVe5kuL6e6XXep17mrqkbsjtcgJLCPKoOpginuHGC+fCWgnrm2ENyRwWxLhTVFtRRKT
         /w95L6gMQTxMbq+IfDoN/GFCt9cuoWUIJtqy5G9cm3ROoOJB8hj+IZa8bUVfU8xcXZhk
         GWtZVISqlKt4BpbZBsW00k2naU6h/kjGyqYA47V/WxnRAMCfvgM7ghsUn8xHMeEQccUo
         RmWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=s+MuB54PDkEfI8PHV65928kvfFhHSc+/Cs9qJcLi3fQ=;
        b=J/KxgQoSNPPMU8RV66WIe7HlEOozfZ/nCI6ze4cAM+bB4js9EvUUImM9WtCtO5cCwv
         GvpFYspL5/NOw7zVU4gX6i2G3kObcTrCC4HX2M1WHAYHwVZtwhcm7MgqckI1LvjfcsUQ
         DJlFiU6l+8rg5JuUahf/6B2H1OS/6SNtPAEPjS2nidGPAh/gbNmHNCQMgxIBX6kZacAJ
         VmMQ5jnjP2QqWVCAjX+OlDwH5FhvI7tjgEe9QyTzY6j7i52CBotiyYIICEipyZpMLTu1
         0BNQl6pbv37i/PKjSGTcoG7fL5337Ne67P7mqMzX+Lof75aCZQJRKhIe8kB4KAShfwCW
         hpfg==
X-Gm-Message-State: AOAM533hB2ZR34PWRP5bR8IP3uymEBO44lur9SPDy8Wt71uIWw969noU
	JWj4lSvdsV/LQgZT9rX80ew=
X-Google-Smtp-Source: ABdhPJw88SOpvhao9DO04k3oBU4RhcYRfdpFcsOxiSdOGgUNhTlhVhQybV4RobOU7BkjKsId081Uzw==
X-Received: by 2002:a05:6402:22fc:: with SMTP id dn28mr45137352edb.65.1641237168021;
        Mon, 03 Jan 2022 11:12:48 -0800 (PST)
Received: from t470p.fritz.box (host-87-18-201-21.retail.telecomitalia.it. [87.18.201.21])
        by smtp.gmail.com with ESMTPSA id gt20sm7009614ejc.11.2022.01.03.11.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 11:12:47 -0800 (PST)
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
Subject: [PATCH 08/56] staging: r8188eu: rename camelcase SetMFrag to set_m_frag
Date: Mon,  3 Jan 2022 20:01:43 +0100
Message-Id: <20220103190326.363960-9-alb3rt0.m3rciai@gmail.com>
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

Rename camel case macro SetMFrag into set_m_frag.

Signed-off-by: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_xmit.c | 2 +-
 drivers/staging/r8188eu/include/wifi.h  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_xmit.c b/drivers/staging/r8188eu/core/rtw_xmit.c
index b6a602060c91..aa00e1711514 100644
--- a/drivers/staging/r8188eu/core/rtw_xmit.c
+++ b/drivers/staging/r8188eu/core/rtw_xmit.c
@@ -924,7 +924,7 @@ s32 rtw_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct
 
 		pframe = mem_start;
 
-		SetMFrag(mem_start);
+		set_m_frag(mem_start);
 
 		pframe += pattrib->hdrlen;
 		mpdu_len -= pattrib->hdrlen;
diff --git a/drivers/staging/r8188eu/include/wifi.h b/drivers/staging/r8188eu/include/wifi.h
index 6e39a72e49db..fc5be22c5d2a 100644
--- a/drivers/staging/r8188eu/include/wifi.h
+++ b/drivers/staging/r8188eu/include/wifi.h
@@ -175,7 +175,7 @@ enum WIFI_REG_DOMAIN {
 
 #define get_tofr_ds(pframe)	((GetToDs(pframe) << 1) | GetFrDs(pframe))
 
-#define SetMFrag(pbuf)	\
+#define set_m_frag(pbuf)	\
 	(*(__le16 *)(pbuf) |= cpu_to_le16(_MORE_FRAG_))
 
 #define GetMFrag(pbuf)	(((*(__le16 *)(pbuf)) & cpu_to_le16(_MORE_FRAG_)) != 0)
-- 
2.25.1

