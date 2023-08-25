Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D3E11096F
	for <linux-staging@lists.linux.dev>; Fri, 25 Aug 2023 14:06:23 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-68a42d06d02so816113b3a.0
        for <linux-staging@lists.linux.dev>; Fri, 25 Aug 2023 07:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1692972383; x=1693577183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aS8RW24A+VhbeLeW/x1pXyWQVP1i13AEod4T/j3ZeOQ=;
        b=by3Rq0bWej+6fWMcIoZ9f+pZvhr/ca19pJ8U31QSmWYDusMvaUd+gFxSgU7ck2x3o1
         HFopoJY6yuPUp4QZKLgJl2CRNKUSub1+rijEkWFydHwOg3rrntXe6AkU+I+aeUn/T0Qc
         NFPFraYl1f5JOTO2GCDhvdVEpJHiImrQp2tha1v5N1LsMwi6mh8K0Uxr0gCLlN/tJw+Q
         48347XKUeekQREtY5yZeGwvmwglMjGU+28D/EjMmLGAVw7L/8mEhs6tSz2yHOAVcSWnS
         A7am8jXkhgXenphx/XY9OrmjCg5OwW/A8BIEi/Z1P2PLujS/60wRgNcCVsqGaaaaki50
         ha4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692972383; x=1693577183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aS8RW24A+VhbeLeW/x1pXyWQVP1i13AEod4T/j3ZeOQ=;
        b=O+NVycNBaMXM03qCXXVT1MobhhXC2cU2hEP8zq+szhgOa1EerDvNOqXGke2farN+W7
         8XFwsbGfPwflTtsrRZVoa19NUmAr/2UEBS9HoOzP/6SFItpuy/XizPtccjgQcwxLHLEa
         nyx/WPjjWRBbbCJP2hX6GBm1AIBfeHKNS4jlhd6Is5FbCFIOIrhao+CzCuPT+2u1W/8s
         zaBsaVHpgmdfakBQE5teB/ByK3yBYeSzN5Pes5xmDxT1FdG/J0u1Q878/D6v+jiUPSaD
         M+5ZWgGbWEJjYVFuAH9icjEifUJjsiLKqruQVF/dLpRMeLuIwvOzxLdiaGF03dTgo0ka
         +YVA==
X-Gm-Message-State: AOJu0YwXo/Z+vjiisPJgm1Ju0rMFuMhcxq49XULfpZBUUVIQQWTJcuHG
	pRq1NuCI8nVOzl+9a6NKfI4K+A==
X-Google-Smtp-Source: AGHT+IHav3DWiLHxKSQsCWwprt1q/ej7MVP59i96628ieP9AHXfewnr0fGy1tCSuFCYT6P/iNq17qg==
X-Received: by 2002:a05:6a00:b4e:b0:68b:e29c:b6b with SMTP id p14-20020a056a000b4e00b0068be29c0b6bmr8414938pfo.27.1692972383421;
        Fri, 25 Aug 2023 07:06:23 -0700 (PDT)
Received: from basil.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id v23-20020a62a517000000b006870721fcc5sm1628232pfm.175.2023.08.25.07.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 07:06:22 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v4 07/16] Staging: rtl8192e: Rename variable pTS in function ResetRxTsEntry()
Date: Fri, 25 Aug 2023 07:08:38 -0700
Message-ID: <20230825140847.501113-8-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230825140847.501113-1-tdavies@darkphysics.net>
References: <20230825140847.501113-1-tdavies@darkphysics.net>
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
Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
v4:Resending whole series as v4
v3:No changes
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

