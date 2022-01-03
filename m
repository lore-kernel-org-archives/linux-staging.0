Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082322C9D
	for <linux-staging@lists.linux.dev>; Mon,  3 Jan 2022 19:32:41 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id w16so139717006edc.11
        for <linux-staging@lists.linux.dev>; Mon, 03 Jan 2022 11:32:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Bq1dSHQoeqlNk5QVOrOuEQOgKYZqz8cC6Xs7IfH7rcY=;
        b=oaPT/uekecFXVUfGyl2UWe6oeDmnm8XgvSWANTbdKDunLuHs4YjNPjU35Rsc8qgWzU
         M4teysVHNUtKWpeps+Xxcb36Uh+x6xGpkYpqrA2Ub6OcHoBUhxOojJJpoDLGQool45lJ
         5GMdohGoBkperuNmk805onQ6ficyotwos9vP6b8s99T094w/fbTO+8wVbeqpBvCQMd+N
         4Xc/aotXU4G7Fp4XPlHrAoSo5mor1ikiZPga5353gpNLCxuoh/ImTPq/gvyCE1smLQf1
         gYcy337Yj7GwLIn9fQSvyuBG6yJ/bGcqZ4SfMdGV6lDItUDum2pwlNbkPNgI5ts7F3cI
         dviA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Bq1dSHQoeqlNk5QVOrOuEQOgKYZqz8cC6Xs7IfH7rcY=;
        b=Z+IukHsktpiM89UEhyOh4sim4j9ejXXPSAmXaIsSKT9dJk/r+tx8JhQmYFVTzPcPvH
         ys7XgZwnAu6+wOyQuB+7hLa/8mJA91k6cNthoz9v6v/TocUm9OfDRu+yV5TapEelMQHg
         umSuj6t13x/+o9leFI8q3CzKIMhSAqRMxBVjKnI/uGDAYA464ONR7WsE+Ge4HZ5jEcH8
         pCV7998zvV0X23zB7w/Hs+CEGYaygSvwlorAFmx8aFLsyk+gBB+FFzwkceSz2RebfLAT
         x4AtD+JaD3IbOFfTlI7XtPZXbJpgSMRlH5agNfP6Bdy1iVQgHjGHThg7AilGK/BY/xSs
         H3Wg==
X-Gm-Message-State: AOAM533ceGdfXixQBldPWYLI7ezXcsM1J+hPmiyLhMGWS+Cv1tXdm0jt
	v1VPs414p1gITLaWJIH5v6ls28kLzrk=
X-Google-Smtp-Source: ABdhPJzXm7UpN5ZVUn69V6RuzJQU44zx5s1gzrrOygKDLG1wJsVgPSrqIVQlD6yjhalDk3Y39wR9iQ==
X-Received: by 2002:aa7:cb09:: with SMTP id s9mr6683199edt.379.1641238360511;
        Mon, 03 Jan 2022 11:32:40 -0800 (PST)
Received: from t470p.fritz.box (host-87-18-201-21.retail.telecomitalia.it. [87.18.201.21])
        by smtp.gmail.com with ESMTPSA id gt20sm7009614ejc.11.2022.01.03.11.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 11:32:40 -0800 (PST)
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
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Zameer Manji <zmanji@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 29/56] staging: r8188eu: rename camelcase GetOrder to get_order
Date: Mon,  3 Jan 2022 20:02:04 +0100
Message-Id: <20220103190326.363960-30-alb3rt0.m3rciai@gmail.com>
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

Rename camel case macro GetOrder into get_order.

Signed-off-by: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_recv.c | 2 +-
 drivers/staging/r8188eu/include/wifi.h  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_recv.c b/drivers/staging/r8188eu/core/rtw_recv.c
index 81f1ed9b5186..230c8198ed84 100644
--- a/drivers/staging/r8188eu/core/rtw_recv.c
+++ b/drivers/staging/r8188eu/core/rtw_recv.c
@@ -1112,7 +1112,7 @@ static int validate_recv_frame(struct adapter *adapter, struct recv_frame *precv
 	pattrib->mfrag = get_m_frag(ptr);
 	pattrib->mdata = get_m_data(ptr);
 	pattrib->privacy = get_privacy(ptr);
-	pattrib->order = GetOrder(ptr);
+	pattrib->order = get_order(ptr);
 
 	/* Dump rx packets */
 	GetHalDefVar8188EUsb(adapter, HAL_DEF_DBG_DUMP_RXPKT, &bDumpRxPkt);
diff --git a/drivers/staging/r8188eu/include/wifi.h b/drivers/staging/r8188eu/include/wifi.h
index 7eb4da42d5a7..1f65309aa1fe 100644
--- a/drivers/staging/r8188eu/include/wifi.h
+++ b/drivers/staging/r8188eu/include/wifi.h
@@ -201,7 +201,7 @@ enum WIFI_REG_DOMAIN {
 #define get_privacy(pbuf)					\
 	(((*(__le16 *)(pbuf)) & cpu_to_le16(_PRIVACY_)) != 0)
 
-#define GetOrder(pbuf)					\
+#define get_order(pbuf)					\
 	(((*(__le16 *)(pbuf)) & cpu_to_le16(_ORDER_)) != 0)
 
 #define GetFrameType(pbuf)				\
-- 
2.25.1

