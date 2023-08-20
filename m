Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 959F3A2A
	for <linux-staging@lists.linux.dev>; Sun, 20 Aug 2023 00:45:25 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4108da3a9efso4461351cf.0
        for <linux-staging@lists.linux.dev>; Sat, 19 Aug 2023 17:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1692492324; x=1693097124;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3LjrlfpbfTpftGZcF5StkTdptZ9z68CeCu6EmjZizZM=;
        b=K8DZSeZkpZ1p7FOiMND2Zva+xw0J4ttBgmbng0+qXHPA2f3MEDMVgGUlWFMAbiOBQq
         e026tqSqu0pyBMiRQDdCyABSLr83SyKyOcyBEN3lr8rU7D/b2RpnwRS/5DfQzAdcwD14
         /3J1MrH8M07O5fygwjNnLDimz6iRaQE4FFMDDOCcTYpbvZ+2/6ith7q8qIsOGDaZr73K
         tIiI/17QYsJfDbzSzrfp37geRpLiigSlpFhJgzF6Thc3mTpZVmda+KP2oubcN7OEMot/
         kqNGXyprzP/AqkYj9foyoQDUT60lyk1Ms2lWViJ8KVxY3bbtWCbU4fIcT6hCPFsLdRDy
         ybHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692492324; x=1693097124;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3LjrlfpbfTpftGZcF5StkTdptZ9z68CeCu6EmjZizZM=;
        b=jUWpVP7qlZlEqPWcefEKtV0w9wBh+outbcT7ZoqW8RgfjPGuX62dtg71xtWtPeciC+
         Nv8UKyzdWzXmZeLv6r5IZF3ST7Kp1zjyzE81/sf9k8ZZMvhnNKpA4eBvy+z2ll10wBs8
         Jv5yeSdCHsW/W11HTdkitGKxWRM2P4TUSuHQtkbSqycP5C0Jyb5wrzd0gD4euLDCiLnf
         UIZKjoY9dVHgFBbwerHkbGx6USzJW8DLPLFlsjARMYd8h6A+cVEvgzMUmA0vyp1NsKGH
         3/eus90XWC0maRcxwXUY8bQwMWcqjDKts+1pM8CrPNFxo5GENtAFU79YiqIA2D9UkbZh
         qMHg==
X-Gm-Message-State: AOJu0Yy2IbCum/cwFkqJYn+Vb9yorBTCzcI37/kIp/AkB4tuCoVz7pw2
	LlvGiIl/r8OHYxDxSZMXOXMHlQ==
X-Google-Smtp-Source: AGHT+IGd8yrFtbZdtxSLHzY7AXTZ3j5s/h8OTlruqiWp4XBbLCJcw9jADxu1nn/f/Ygoa5uyqoAKog==
X-Received: by 2002:a05:622a:13cc:b0:407:fb08:c44c with SMTP id p12-20020a05622a13cc00b00407fb08c44cmr3148730qtk.47.1692492324417;
        Sat, 19 Aug 2023 17:45:24 -0700 (PDT)
Received: from basil.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id 25-20020a17090a1a1900b00268b439a0cbsm4004884pjk.23.2023.08.19.17.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Aug 2023 17:45:24 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v2 07/16] Staging: rtl8192e: Rename variable pTS in function ResetRxTsEntry()
Date: Sat, 19 Aug 2023 17:47:35 -0700
Message-ID: <20230820004744.278022-8-tdavies@darkphysics.net>
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

Rename variable pTS in function ResetRxTsEntry() to ts
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
v2:Resend as 16 patch series - no longer throttled by email provider
 drivers/staging/rtl8192e/rtl819x_TSProc.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_TSProc.c b/drivers/staging/rtl8192e/rtl819x_TSProc.c
index 75bf59d267c2..c892fe044f29 100644
--- a/drivers/staging/rtl8192e/rtl819x_TSProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_TSProc.c
@@ -112,12 +112,12 @@ static void ResetTxTsEntry(struct tx_ts_record *pTS)
 	rtllib_reset_ba_entry(&pTS->TxPendingBARecord);
 }
 
-static void ResetRxTsEntry(struct rx_ts_record *pTS)
+static void ResetRxTsEntry(struct rx_ts_record *ts)
 {
-	ResetTsCommonInfo(&pTS->ts_common_info);
-	pTS->rx_indicate_seq = 0xffff;
-	pTS->rx_timeout_indicate_seq = 0xffff;
-	rtllib_reset_ba_entry(&pTS->rx_admitted_ba_record);
+	ResetTsCommonInfo(&ts->ts_common_info);
+	ts->rx_indicate_seq = 0xffff;
+	ts->rx_timeout_indicate_seq = 0xffff;
+	rtllib_reset_ba_entry(&ts->rx_admitted_ba_record);
 }
 
 void TSInitialize(struct rtllib_device *ieee)
-- 
2.41.0

