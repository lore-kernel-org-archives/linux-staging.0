Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56FF57FA
	for <linux-staging@lists.linux.dev>; Sun, 20 Aug 2023 00:45:22 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-26b7c16556eso1522514a91.1
        for <linux-staging@lists.linux.dev>; Sat, 19 Aug 2023 17:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1692492321; x=1693097121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=omkWyR4xIKDeiUIHgBXUEIHWvvX1GVtW/wpsSw0X3Og=;
        b=jAZL4vLogMuyo6I2DmdYidBZVvrPJs0328rHjlEWaqYOhFy4NPpdy+Ep/CVCRp2XVf
         zO+x7l8s4mFpjsuc2P01++QQ/wLcfl8stKpQ5oTXp2mzu6a0qEJCThnvQVja2/I21pTG
         bMXARE/Gj37qimwUNnYZIEt4oETn13/CZUnIeFoHgmsXWpdBiTVuEFOjcG/ynjS5TkTc
         +90ZfZJ1Ex+oYiYrzEvJdXMcYKh0WhF39zsQ6vj5eMZJcxn2aB5FkzWV49C3iPz/KHWJ
         gtRagnL9uEAs21MfJ4i0y2DRerSURBC/phi2/29XSRQMGsRoJgY0FH1oXE9KryvJ0USb
         LaVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692492321; x=1693097121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=omkWyR4xIKDeiUIHgBXUEIHWvvX1GVtW/wpsSw0X3Og=;
        b=LqWMHnbQU37Cjyje6pPbcMANxMnRA+JS1F602tWHAOxgdVRV3rJkDMI1Qr6FjP50Gb
         00e8R1LVaC9tKl0CWyrAOSfL53RPQjH0zlIzjL8YlCTrsYQh+I8RahSV5jlMUtNp8kJz
         pGfV0f26nGihBff7umPuZtEiDtQKR8tP5acro8VoKBLqjjrvJJbVl9qOKZYOoidoCSCH
         jgYyWyrtWCYh+nRvWjswr3Yh8AZtWjbpwMQ9qK3+T+7GXv3BnaAKGeYJak8Afqn7s4NM
         4UkOzvUy60rPVWTeBw5fuRnvmZJVBIJ/xRpkSbtVed7DjoDIzXVFG44RjoOaOxzgZSx+
         9Frg==
X-Gm-Message-State: AOJu0YzZL0X4C3Z50lWXXb0JVq8frzFLYQxMJ4LRyMjTuBznza1AYmma
	xy54v0L8HEdD0vMIrPFisG7BWg==
X-Google-Smtp-Source: AGHT+IFNjKz6Ddyj1m7sOsb3A96bX7j+amzrtBbhni/k5+OSCW3aN/0EMl8Urq67u7Kh3WN7QjNc6g==
X-Received: by 2002:a17:90a:e28d:b0:26d:43f0:7ce4 with SMTP id d13-20020a17090ae28d00b0026d43f07ce4mr2733062pjz.8.1692492321677;
        Sat, 19 Aug 2023 17:45:21 -0700 (PDT)
Received: from basil.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id 25-20020a17090a1a1900b00268b439a0cbsm4004884pjk.23.2023.08.19.17.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Aug 2023 17:45:21 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v3 04/16] Staging: rtl8192e: Rename variable pRxTs in function rtllib_ts_init_del_ba()
Date: Sat, 19 Aug 2023 17:47:32 -0700
Message-ID: <20230820004744.278022-5-tdavies@darkphysics.net>
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

Rename variable pRxTs in function rtllib_ts_init_del_ba() to ts
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
v3:Resend as 16 patch series - no longer throttled by email provider
v2:Resending in smaller patch series
 drivers/staging/rtl8192e/rtl819x_BAProc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_BAProc.c b/drivers/staging/rtl8192e/rtl819x_BAProc.c
index c584e9ec48b6..2aa624bcbfd1 100644
--- a/drivers/staging/rtl8192e/rtl819x_BAProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_BAProc.c
@@ -499,11 +499,11 @@ void rtllib_ts_init_del_ba(struct rtllib_device *ieee,
 					(&pTxTs->TxPendingBARecord),
 					 TxRxSelect, DELBA_REASON_END_BA);
 	} else if (TxRxSelect == RX_DIR) {
-		struct rx_ts_record *pRxTs =
+		struct rx_ts_record *ts =
 				 (struct rx_ts_record *)pTsCommonInfo;
-		if (rx_ts_delete_ba(ieee, pRxTs))
+		if (rx_ts_delete_ba(ieee, ts))
 			rtllib_send_DELBA(ieee, pTsCommonInfo->Addr,
-					  &pRxTs->rx_admitted_ba_record,
+					  &ts->rx_admitted_ba_record,
 					  TxRxSelect, DELBA_REASON_END_BA);
 	}
 }
-- 
2.41.0

