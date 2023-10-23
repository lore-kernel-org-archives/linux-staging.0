Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDAF16FAA
	for <linux-staging@lists.linux.dev>; Mon, 23 Oct 2023 06:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RSAT7O5V"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-9bfbc393dfaso78106166b.1
        for <linux-staging@lists.linux.dev>; Sun, 22 Oct 2023 23:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698043233; x=1698648033; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RsMa50p68QhR354G2viJMWnZKa/lXMk6KHxdlxw2gzI=;
        b=RSAT7O5V3rpZnQDK6T0oj7ttBDLkkj1vxWptQPh4lhqH6NFD+4+4P1SuGL4uElQzFm
         o/Xrj4bmt7skGnaQil4GT8SiXQKp2wUAxjs3OkRTrXGHKmW02EAPM1feGxdFC5pcDBD3
         woYbmUNbP0RWnSZggUJZPMGsZhDUYtmuzg+YbAfERQTypHSc9N3frs95uoDy8DQcrNg+
         FbMYW0ZBhl5fpgkqkgifrdUs+DQnfa8HyD++5T9XC4TRVsCw4jgXmn5afIqB+zT0Gosh
         G9TLvoaLbwbevEHBDgoOMfntHBILIBIC7nSk9GCF+99bpBQQw3jwNID4xhSvmSYGv4kZ
         tjWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698043233; x=1698648033;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RsMa50p68QhR354G2viJMWnZKa/lXMk6KHxdlxw2gzI=;
        b=H5STHmPlKzJ8xuXwOZCp6+EztLefIM34l8QdMpdJ7QzlD5Lk2W+K2rT4KCEhEdbkPq
         i/lRSH3yNMF0JtynXQXaXE4NVTT/NVJ+Uy7Q/UQy0f7XqJNewRaOtgTNwBFdfDenNDrT
         v4HgVCg0Zx5IpXxWedpBOwf6PcQjtiX41I2xemThTBxTjtfbs34PcHAdgGEmfz6jbBHC
         zj2wv9fegl7xmXkyvFIbMHeMM2UizBHchHBGCnOfua25uDMxP4/bZICRq4xcmxFj6STY
         +45DXM/U5dixaOdd6VsH9rPsQ4ZMKH6ib1cwoH5S8qYov1b64FKxe7BXWqQzLB1hfKLb
         +giw==
X-Gm-Message-State: AOJu0YwjxQo4vK6N76L9ptZh/F1kcRo8sudPzJC783rRR9cRy8rhdIeR
	5p6JhkNypSVJtqgx5JUXzS91wtiVOIo=
X-Google-Smtp-Source: AGHT+IEsdcmaU2zY9FGIdiFU06ARn586Mzhve6d4j/27ev1POhNcYfLkiBTs79P6+rnoWvGp6FqQDg==
X-Received: by 2002:a17:906:51ce:b0:9ae:2f35:442a with SMTP id v14-20020a17090651ce00b009ae2f35442amr4689670ejk.5.1698043233066;
        Sun, 22 Oct 2023 23:40:33 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id gx13-20020a1709068a4d00b009ae6a6451fdsm6085254ejc.35.2023.10.22.23.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Oct 2023 23:40:32 -0700 (PDT)
Date: Mon, 23 Oct 2023 08:40:31 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 09/11] staging: rtl8192e: Remove last three parameters of
 MakeTSEntry()
Message-ID: <ebcd7eaeba89bdc4f19053681b98fd1b8cce5aaf.1698042685.git.philipp.g.hortmann@gmail.com>
References: <cover.1698042685.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1698042685.git.philipp.g.hortmann@gmail.com>

Remove last three parameters of MakeTSEntry() as those are always Null
or 0.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl819x_TSProc.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_TSProc.c b/drivers/staging/rtl8192e/rtl819x_TSProc.c
index fbbe538f0632..96022c5ed60f 100644
--- a/drivers/staging/rtl8192e/rtl819x_TSProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_TSProc.c
@@ -215,11 +215,8 @@ static struct ts_common_info *SearchAdmitTRStream(struct rtllib_device *ieee,
 }
 
 static void MakeTSEntry(struct ts_common_info *pTsCommonInfo, u8 *addr,
-			struct qos_tsinfo *pTSPEC, union qos_tclas *pTCLAS,
-			u8 TCLAS_Num, u8 TCLAS_Proc)
+			struct qos_tsinfo *pTSPEC)
 {
-	u8	count;
-
 	if (!pTsCommonInfo)
 		return;
 
@@ -228,13 +225,6 @@ static void MakeTSEntry(struct ts_common_info *pTsCommonInfo, u8 *addr,
 	if (pTSPEC)
 		memcpy((u8 *)(&(pTsCommonInfo->TSpec)), (u8 *)pTSPEC,
 			sizeof(struct qos_tsinfo));
-
-	for (count = 0; count < TCLAS_Num; count++)
-		memcpy((u8 *)(&(pTsCommonInfo->TClass[count])),
-		       (u8 *)pTCLAS, sizeof(union qos_tclas));
-
-	pTsCommonInfo->TClasProc = TCLAS_Proc;
-	pTsCommonInfo->TClasNum = TCLAS_Num;
 }
 
 bool rtllib_get_ts(struct rtllib_device *ieee, struct ts_common_info **ppTS,
@@ -321,7 +311,7 @@ bool rtllib_get_ts(struct rtllib_device *ieee, struct ts_common_info **ppTS,
 		ts_info->ucTSID = UP;
 		ts_info->ucDirection = Dir;
 
-		MakeTSEntry(*ppTS, addr, &TSpec, NULL, 0, 0);
+		MakeTSEntry(*ppTS, addr, &TSpec);
 		list_add_tail(&((*ppTS)->List), pAddmitList);
 
 		return true;
-- 
2.42.0

