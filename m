Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388E92FB2
	for <linux-staging@lists.linux.dev>; Sat, 28 Aug 2021 11:10:58 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id m4so5769960pll.0
        for <linux-staging@lists.linux.dev>; Sat, 28 Aug 2021 04:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=plYRYTqUUFSzAFVzV7cfqMcFyLCLsZfoGtDYWiyJWFk=;
        b=Vp5uPO6kvb0NngbsoEoLcvI+7eyinFZMjM46948dtH07TDYiW0BQ6xr1UTQ0waWndp
         m4jCQu+vkVpv8HN1DH0FqzFmQUI5g23cuGkdiMHJxLuzjevfTDYNO/scWEnJ0QC+V7CU
         lPxgDj5TncK6fk2uq1Kh3tecjQrqaBPtu39aKj2YUHC1Ff441j+yRzR17DX04HWpmAdl
         bXJzO0HluTqiExXfZ70V2pAaJeGGZ3QQpj5h38G1YUI9ovFbHoSic0SLmtzEM+nqOc0c
         U98GL88RAmswaOTjMGR63zqTXlwb8MN+F25hnuJXqeIowXI0zbK2/tr3fdq9NgNb+e0D
         bcZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=plYRYTqUUFSzAFVzV7cfqMcFyLCLsZfoGtDYWiyJWFk=;
        b=H1bDiD7lX8U0iQAZDnaGkUL9acvq/hDxuXyfea833qkDNDtXcpNnpVNfc4JA3LPIkM
         eOQmqMqs4b96+Cy9W9CiPAOe6a1yw0rK0iPlgB7UT8F9cxoRkkOCdTQs4qa7H6St82nM
         HZV3ytr8FcSTTYE9p721nBKTvjNa7tGfAqJeW1A1XCxDgd8N/e0k1Nu3xnAoCrRfuhwM
         bgsQ1+9wOtXmKrtRhtEqYyNX5pYkHSoUzq8JElzb4EkMQoQUhHpeP61uFHuPsPqwFU+q
         2bk2UG93qulo4/l+ERhu6dXV0AgBVpTAYZiM6m9nyOrBMfOjsEi/8/5++hZNl9FxnSg0
         SpiQ==
X-Gm-Message-State: AOAM533h7X0bXpj4FQwR5AI1zdVPBai9v0IR3JNig2X4nN5/5+dQ11Qz
	TbBISOcFdJf3SxAOnGyu3IA=
X-Google-Smtp-Source: ABdhPJz7RH9YRchqoNkWpECvsbcuBGFEa+zzDcohGqE3t6tY1OYaoPQQchjsuO0gJw2PH3ZIKqw+ww==
X-Received: by 2002:a17:90b:1952:: with SMTP id nk18mr28843980pjb.193.1630149057820;
        Sat, 28 Aug 2021 04:10:57 -0700 (PDT)
Received: from xps.yggdrasil ([49.206.124.188])
        by smtp.gmail.com with ESMTPSA id y64sm10205379pgy.32.2021.08.28.04.10.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Aug 2021 04:10:57 -0700 (PDT)
From: Aakash Hemadri <aakashhemadri123@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 3/3] staging: r8188eu: incorrect type in assignment
Date: Sat, 28 Aug 2021 16:40:46 +0530
Message-Id: <74c156553614f44a900e987f1185f3388dd740f6.1630148641.git.aakashhemadri123@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1630148641.git.aakashhemadri123@gmail.com>
References: <cover.1630148641.git.aakashhemadri123@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix sparse warning:
> rtw_br_ext.c:516:57: warning: incorrect type in assignment
    (different base types)
> rtw_br_ext.c:516:57:    expected unsigned short
> rtw_br_ext.c:516:57:    got restricted __be16 [usertype]

*pMagic holds __be16 change it's type to __be16

Signed-off-by: Aakash Hemadri <aakashhemadri123@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_br_ext.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_br_ext.c b/drivers/staging/r8188eu/core/rtw_br_ext.c
index 38f1bd591da9..bce73e8cbd52 100644
--- a/drivers/staging/r8188eu/core/rtw_br_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_br_ext.c
@@ -474,7 +474,7 @@ int nat25_db_handle(struct adapter *priv, struct sk_buff *skb, int method)
 		/*                Handle PPPoE frame                 */
 		/*---------------------------------------------------*/
 		struct pppoe_hdr *ph = (struct pppoe_hdr *)(skb->data + ETH_HLEN);
-		unsigned short *pMagic;
+		__be16 *pMagic;
 
 		switch (method) {
 		case NAT25_CHECK:
@@ -512,7 +512,7 @@ int nat25_db_handle(struct adapter *priv, struct sk_buff *skb, int method)
 						tag->tag_len = htons(MAGIC_CODE_LEN+RTL_RELAY_TAG_LEN+old_tag_len);
 
 						/*  insert the magic_code+client mac in relay tag */
-						pMagic = (unsigned short *)tag->tag_data;
+						pMagic = (__be16 *)tag->tag_data;
 						*pMagic = htons(MAGIC_CODE);
 						memcpy(tag->tag_data+MAGIC_CODE_LEN, skb->data+ETH_ALEN, ETH_ALEN);
 
-- 
2.32.0

