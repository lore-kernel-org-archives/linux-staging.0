Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E304805
	for <linux-staging@lists.linux.dev>; Sun, 20 Aug 2023 00:45:23 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-26d60e6fe19so630109a91.1
        for <linux-staging@lists.linux.dev>; Sat, 19 Aug 2023 17:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1692492322; x=1693097122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NbcFNW0BUC/zpWNLlWYI8k63oVquqAWvkdReaUZSuGI=;
        b=bNjB0cfZYCXhEY7OmJ3sdza6OGLKW1KL1jjyMBsP9QTIz15gPoC2h/tEvp+PfwH57i
         V8D1fEUhywM/NJMMjMdBTwzdVk8dkdoU+ujfAW6U8hk6Rn6z+yuemkRZF88lh7ywisg/
         oOcyoL4oHzX5k5j4fXxuKmjJ+U3q4A4hlK9lIi/a0iBOz2cZdRiO/6ntUF1sThZZoTGc
         zgqoQryngFcjGugUZZx8jajcGElAhaLkERi5JCRwytZHCvWDTe4HizdVHLKtz4eOKt7+
         T9FikaXXts5JxOdgaY8I76atlR128GkhnbVo7H/NGxcd+aSQZLgiQrUlZxwEPyBrSXP0
         Kb/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692492322; x=1693097122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NbcFNW0BUC/zpWNLlWYI8k63oVquqAWvkdReaUZSuGI=;
        b=HUAHINtbBkTG/lDCT80or0/kyzMIw3fs1Kn1gLdXvpVmx3LiNYKhtf+RuSTlQnbota
         shxf1xc/8TRC0yfQ45pGwv9Nt5C7ppQBMxhJhaC368pFBR0IMcRXyLzEHpR6n12eHcU+
         DBFmzzd8r13DR1k08kcdXCgSUaksXSdHcWxW57I3sugFZ+Xl3Z9HrtVRkifLqhTIdJAF
         220FlxN4bzabX60iH6k9FYsBSsXTHcRNIc3ZiZD1b0ce/Iu46BncTth3IzrloUx25Z3x
         FUfTAqAXDQNsL6cAYbsw1kMS8/HkTaxk+2y1D9jTySFOYxEgPxM2ya4GGozzqtFZmAEm
         lK9w==
X-Gm-Message-State: AOJu0Yyhlz169XmT33P8s59yeeT59vEkRApr2R+86oL8VMpJQ64hVVFD
	cT+DSwsXOWyqYnF0jHD9pDcz8A==
X-Google-Smtp-Source: AGHT+IEfZe+qfAxhdSXOQwOGeaumbxBXE/LXnlt3hImQYRepy/BjDaazhz+yYbS4H9KIo1i1WCa9UQ==
X-Received: by 2002:a17:90a:6282:b0:268:5c3c:866f with SMTP id d2-20020a17090a628200b002685c3c866fmr1785727pjj.46.1692492322720;
        Sat, 19 Aug 2023 17:45:22 -0700 (PDT)
Received: from basil.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id 25-20020a17090a1a1900b00268b439a0cbsm4004884pjk.23.2023.08.19.17.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Aug 2023 17:45:22 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v3 05/16] Staging: rtl8192e: Rename variable pRxTs in function rtllib_rx_ba_inact_timeout()
Date: Sat, 19 Aug 2023 17:47:33 -0700
Message-ID: <20230820004744.278022-6-tdavies@darkphysics.net>
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

Rename varialbe pRxTs in function rtllib_rx_ba_inact_timeout() to ts
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
v3:Resend as 16 patch series - no longer throttled by email provider
v2:Resending in smaller patch series
 drivers/staging/rtl8192e/rtl819x_BAProc.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_BAProc.c b/drivers/staging/rtl8192e/rtl819x_BAProc.c
index 2aa624bcbfd1..bc6f9e8c5dd8 100644
--- a/drivers/staging/rtl8192e/rtl819x_BAProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_BAProc.c
@@ -532,13 +532,13 @@ void rtllib_tx_ba_inact_timeout(struct timer_list *t)
 
 void rtllib_rx_ba_inact_timeout(struct timer_list *t)
 {
-	struct rx_ts_record *pRxTs = from_timer(pRxTs, t,
+	struct rx_ts_record *ts = from_timer(ts, t,
 					      rx_admitted_ba_record.timer);
-	struct rtllib_device *ieee = container_of(pRxTs, struct rtllib_device,
-				     RxTsRecord[pRxTs->num]);
+	struct rtllib_device *ieee = container_of(ts, struct rtllib_device,
+				     RxTsRecord[ts->num]);
 
-	rx_ts_delete_ba(ieee, pRxTs);
-	rtllib_send_DELBA(ieee, pRxTs->ts_common_info.Addr,
-			  &pRxTs->rx_admitted_ba_record, RX_DIR,
+	rx_ts_delete_ba(ieee, ts);
+	rtllib_send_DELBA(ieee, ts->ts_common_info.Addr,
+			  &ts->rx_admitted_ba_record, RX_DIR,
 			  DELBA_REASON_TIMEOUT);
 }
-- 
2.41.0

