Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2F77F1
	for <linux-staging@lists.linux.dev>; Sun, 20 Aug 2023 00:45:19 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-6bd04558784so1735581a34.3
        for <linux-staging@lists.linux.dev>; Sat, 19 Aug 2023 17:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1692492318; x=1693097118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a8u8V5VjoL84uXoWIqfKyu7IJTL8pgnTcpzZ0r5UbSM=;
        b=fH0lJ4RWKDQp77MplHOb8N4wRUeYPJ4A+PEHV35da4RlxP5IgssrYV6uAoaLDNpF5o
         pS5ZFjFc4WpFBCL9/7p7zj9KFfkE+pFDe0YZ6DEGJqkL3kfxcNORHf+KfLcfWzzA93xg
         hIg/2YOTbdlbCzzbf1NGHR49WZUz98h1g2Q+v1ZvhKG97pD2brNwa4Iknm8BDB5BRNJI
         402Hua8C1plKRGg18cV35c/NCiEW1TCIqr2X/y7GAMvY0eORBH/OmvnpkIsukxDoCL2J
         yMFFtOyX/uiBqLsYJFKt3cXfD26iQd0q2KiUh67SHHvr9Rnf0PZ2UTh97mTLUAw71eMC
         e51A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692492318; x=1693097118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a8u8V5VjoL84uXoWIqfKyu7IJTL8pgnTcpzZ0r5UbSM=;
        b=JIXmOth6+GMq0EIzIM4N5QB59Q9Dhc6gpj4+o7wR7DO9ykAh+x6rLyKz2qrJurv8RJ
         FLJWEo0P3kpTDGo5Zx/WiL2GwcMuIhMqruXLlx2ZItyW7gD8Q13d3ZI+0EwYN/7iVogK
         0wIAAU53Go4L5cufpYCBhpuHRLeUh14aO0XEqJYVrdHgPlEco7WbDJqaeA2Dpy0kzexX
         Dcczsmrr2m6r+fT28jc4zNsM7NhlqbpQn42eN9UefVJe5WDwLr51yKGWPcfgQXyIkKf6
         8fPcesdwLgynLC1wMHTqyP8BE21u43/N15ksotz3FKoixjGoFUOnVjsLCHhA1bx3dyhe
         psMg==
X-Gm-Message-State: AOJu0YxxVT0G1QeFHH6b5tVqBVHYxmE8+b0iuNMikwrMXPv7C913q6ni
	kczvoByFfu9XHLjNpzqnb0aEpA==
X-Google-Smtp-Source: AGHT+IFBcvVKMWQrklRVD6pweTUW/2Ako37DpuhY2lx/y3dGF5Z2yDk46p9FEy+0j5xqVRnA6hOsAA==
X-Received: by 2002:a05:6870:4193:b0:1c0:2e8f:17fd with SMTP id y19-20020a056870419300b001c02e8f17fdmr4817326oac.40.1692492318586;
        Sat, 19 Aug 2023 17:45:18 -0700 (PDT)
Received: from basil.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id 25-20020a17090a1a1900b00268b439a0cbsm4004884pjk.23.2023.08.19.17.45.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Aug 2023 17:45:18 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v3 01/16] Staging: rtl8192e: Rename variable pRxTs in function rx_ts_delete_ba()
Date: Sat, 19 Aug 2023 17:47:29 -0700
Message-ID: <20230820004744.278022-2-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230820004744.278022-1-tdavies@darkphysics.net>
References: <20230820004744.278022-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable pRxTs in function rx_ts_delete_ba() to ts
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
v3:Resend as 16 patch series - no longer throttled by email provider, fix commit msg
v2:Resending in smaller patch series
 drivers/staging/rtl8192e/rtl819x_BAProc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_BAProc.c b/drivers/staging/rtl8192e/rtl819x_BAProc.c
index 0e3372868f97..da29163f3022 100644
--- a/drivers/staging/rtl8192e/rtl819x_BAProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_BAProc.c
@@ -41,9 +41,9 @@ static u8 tx_ts_delete_ba(struct rtllib_device *ieee, struct tx_ts_record *pTxTs
 	return bSendDELBA;
 }
 
-static u8 rx_ts_delete_ba(struct rtllib_device *ieee, struct rx_ts_record *pRxTs)
+static u8 rx_ts_delete_ba(struct rtllib_device *ieee, struct rx_ts_record *ts)
 {
-	struct ba_record *pBa = &pRxTs->rx_admitted_ba_record;
+	struct ba_record *pBa = &ts->rx_admitted_ba_record;
 	u8			bSendDELBA = false;
 
 	if (pBa->b_valid) {
-- 
2.41.0

