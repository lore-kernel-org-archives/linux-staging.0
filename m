Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC7016FB1
	for <linux-staging@lists.linux.dev>; Wed, 25 Jan 2023 20:08:35 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id d4-20020a05600c3ac400b003db1de2aef0so2135785wms.2
        for <linux-staging@lists.linux.dev>; Wed, 25 Jan 2023 12:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bF+Lp+JDPbwdrmjIfQ0g/QFY3xJvOU79Nk3DY5MrQzU=;
        b=lZjNXxnG0NwYLfZGiRVHlHOqlnjaMPZ1JSID3VMPnHtvUjKMLeD8kgH7GkoAlRPX/d
         lZsrQftznCgl+6B9zFnjD0+R9mTZi5VWhbUqy+4Dn9yPmXaY6jyYgA05zUKIL4QREQK5
         860WaQ3CHo79PSRDa601F2pA1CnldWLfwjFHehb6YLT3RlbdoLrWrgFfXYGOaht7gepv
         INCRHLR1CmWe+DN+syp7s+t92FtOLxWMVgWyvQN3aeNBwzg5pTrvlQhgsWUr4Mnq5ALl
         Pjus4IqrryktYkJ6L4HFew8xH3VG4y/sS7B0imQPMEb4osTROToIXx1df3catPY43Fdy
         Wg9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bF+Lp+JDPbwdrmjIfQ0g/QFY3xJvOU79Nk3DY5MrQzU=;
        b=bnPbI0FWCmS0As32/pSdsHsU37f80Sw8xKgr6zbC7mhRv805sFXMc3H/5+jtbzOES1
         /w5SzcSdbHAY7G8m7gaB3ymwGHo+5zGlmO9YVvpkh35E3XMpasAvS6dUTI3cEwI5i/NL
         6NALPKlxUF56QRUtC5/XU6ZeqAALtwqdbCGzKyId/Tuzrm/AVfQXELf0lRQdDx2fE3ma
         3kL2p1Neg3IsPgsPP3GcmsyRK6fGFVClyMTQ8b+Ilvwjee/kYS0HfKhxC5ruTDpPvpmM
         7ZGHY4r8ojKsxiqtjr1K4zRK16Ump42lVl7mB/3bNP7IxoM9nIOTkn8INciVJdXhp1sM
         I8zw==
X-Gm-Message-State: AFqh2koZtODVNGLXBJ2it5FSs9siREH+9O3OkyXXFjlENCRuWT+gDh7h
	Tyt4NUo6s+vMddhXtv6eHxzMJTR85Us=
X-Google-Smtp-Source: AMrXdXuPLC9TNzoxh2qQMgwhJ2ZPBby8KQ2A7s3S3pJ34Cz3y7HlrsLZZ6qnvRp141wNiT4CSj68aQ==
X-Received: by 2002:a05:600c:3ba8:b0:3d9:8635:a901 with SMTP id n40-20020a05600c3ba800b003d98635a901mr8573813wms.3.1674677314209;
        Wed, 25 Jan 2023 12:08:34 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935ca5.dip0.t-ipconnect.de. [87.147.92.165])
        by smtp.gmail.com with ESMTPSA id bi5-20020a05600c3d8500b003db0bb81b6asm2751098wmb.1.2023.01.25.12.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 12:08:33 -0800 (PST)
Date: Wed, 25 Jan 2023 21:08:31 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 02/11] staging: rtl8192e: Remove unused variables
 rxdatacrcerr and rxmgmtcrcerr
Message-ID: <32c9183fa2f4edd24ae6f93d56b808eb1821832b.1674675808.git.philipp.g.hortmann@gmail.com>
References: <cover.1674675808.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1674675808.git.philipp.g.hortmann@gmail.com>

rxdatacrcerr and rxmgmtcrcerr are initialized and increased but never
read. Remove dead code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 7 -------
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h | 2 --
 2 files changed, 9 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index 605146c840c7..e0d0f4faeca7 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -1926,13 +1926,6 @@ static void _rtl92e_rx_normal(struct net_device *dev)
 				priv->rtllib->LedControlHandler(dev,
 							LED_CTL_RX);
 
-		if (stats.bCRC) {
-			if (type != RTLLIB_FTYPE_MGMT)
-				priv->stats.rxdatacrcerr++;
-			else
-				priv->stats.rxmgmtcrcerr++;
-		}
-
 		skb_len = skb->len;
 
 		if (!rtllib_rx(priv->rtllib, skb, &stats)) {
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
index 82cbc7f5536a..f91a6f7a4e0a 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
@@ -183,8 +183,6 @@ enum reset_type {
 };
 
 struct rt_stats {
-	unsigned long rxdatacrcerr;
-	unsigned long rxmgmtcrcerr;
 	unsigned long rxcrcerrmin;
 	unsigned long rxcrcerrmid;
 	unsigned long rxcrcerrmax;
-- 
2.39.1

