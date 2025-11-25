Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFFC131A555
	for <linux-staging@lists.linux.dev>; Tue, 25 Nov 2025 11:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764069681; cv=none; b=Ikb0+NXuWgCNZjCFAZdfuS6NBXs9Vkg4MO9OudmIFnp8Fs1QSh087N483x66QmoJRK5Z4VmmGqGNYN/TZjE67kCovVGWYv7YcNv+syEnc1JZ/CFjPqGCQPz0YCvz0ZkirlDbG8kTlgziclIuIft5FJgx5VmY6gY9N51H9vRt/w0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764069681; c=relaxed/simple;
	bh=YBtaO/eBYbzQQWoYMOteVAhhJ+DKjGwoQ/N2zOVhKW0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VIH6/PbNcv5URwmGu9QLpFkExvRdBOi9k/TvDOOiHYRXDUVyjz3337EH3d6gvwBJEbM69onAuRsONTmz62k2uQ3LFTVSAtuaTVc0MkVpAQngzvJCAS2MbInTb0IdmWHY0moca9nV7VC+IXRNztHwBVA9KtAxrniKyIOCWumc1Gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W4n9Z6ea; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W4n9Z6ea"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-29558061c68so72792915ad.0
        for <linux-staging@lists.linux.dev>; Tue, 25 Nov 2025 03:21:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764069679; x=1764674479; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ol6FJ1vrGQKaUJffz/esQb5b2URIUDMsH3CGBHb/slA=;
        b=W4n9Z6eafWcgwPm2EMNGXEE1Mk2A+Wbmcp6h0PMEQ8Q5aQvmqglKmnT4s2bMhR9L2V
         SS52W/IwqoJ3jnQN1qHNDsLF9Jy39cv2D514NOGJE4rfvbboCKmCSZOz4/MPQ28TCQQj
         w9mduDrx2wvdT2RLiTKS9TdXhHzvvJFeSiHcV3Lh9j0+yzHj1biSTXXohsCRaIg8mKS/
         NxV1PzhzwmSfwC7xZwq1AT4e5A+ngw/Sqi0HdyuLeobl+04Dw0f3Ay8f1Es2bgAHJEPY
         ZJF9aY1dfcFAJyz0t0MBc2ulNac/0OgbDxLSYXKFVj0mxpV15IyYiQ56J/r5uqbng+7s
         IVCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764069679; x=1764674479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ol6FJ1vrGQKaUJffz/esQb5b2URIUDMsH3CGBHb/slA=;
        b=XMp4A7/2Amgag9kmBbXWQc1ZL6KvsJkEdUaCgIZ7zRSVbRlUII/UUPy3sW+IYx4rr7
         k5HLSI2wBTIz8E8YV4O6YhwuS2SF7hxl+Dt0VQFn6lOI78DLnAKER4ykEwFekoCx9/vB
         9WWLmMeQBrm7Uj+e+f0duQzinIlFCFWfDeNG7nXHB0IVSOx/zzi3U/5I9RzJOshi0nTN
         SvUB5eR7XJ3EOykSSFyDKS5SGozwZqpnxC+3Yhbob+7doZ2jjO1JA3jCzb6ZsVnXB/7y
         4MbGNYnGQLwIS7qO6cCF0VLi1OU09KRPUf39M6lKBYTnZTY2dPMy6IRyPYXdFIe4cync
         H0zA==
X-Gm-Message-State: AOJu0YwLQMWGse2ZMJh5f+8e+zqnaeM8FLiD2JTgt0NKGucVSBO9/iUn
	AT/MHLKzOgRQdUIuu4AkSVZUX6H0VOKEA3L2Z09JGnTvOWp8CPEKAgX/
X-Gm-Gg: ASbGncs4EvSSravQvtuZB6VyvB00m6rV8FtpkDKhX1K796lirj4QCjuW6IBbzwwcFT/
	r8KDNML67g7hRqUd1gZLfdJ7mItGhzX9iSS5JDTXrwU2hFHSxlVL9PgifPOO47AxsXjZGDyW5hP
	hPKsCCG7I0iXxoue133bPA7aPptYmjKjjV5exSihN+I4OEY4LEHRtu9xeKC0yN32ylU7jsQhLt0
	XXLEcbL5Fmu8G7mHirDqnsEpOrOPJkedZMRt1jhXsBtsYyuJoyuTgIU4KT131t3PeAG0nNyyxUm
	Z9VJNgKtSqc+Mzw/JmfA4RBTaMq9ZTuwt9TgrLjDvRJlV+r+zsstUF721REWKF73LyKZlL8yzwp
	dTUC0RSm5UwCMI7p0lfbZ6cya5VizJYyDb4opOOP9dLJscOHzUA6YFiEi7wWhWsrUmr8XOjO58b
	n3g670e3JaI1IV+4ZXS/gFrOb0lNStMvf26q0+LIxL3rxxqhAFynnjgN3rjTFOHhCvKmPk6qT+m
	jZOXvppT+SkrOu5REK0KBrySMFFfL3PQNgDA5mgtauXh5TVRukXGrRwi8N0bmOkXMYJWfswpB+C
	rcHtbYmFlmQl/FPXrM4osrUAx2EKrysifQ==
X-Google-Smtp-Source: AGHT+IEznkxcTSR7i/lIJr2+8XsplWKM45jT6llpuiaa5oIQh+yi25Xglc4E8X8i2VZvEBaHegRsFQ==
X-Received: by 2002:a17:90b:48c6:b0:340:5c38:3a56 with SMTP id 98e67ed59e1d1-34733f5cef1mr14909715a91.37.1764069678967;
        Tue, 25 Nov 2025 03:21:18 -0800 (PST)
Received: from cyberkunju.asia-south1-c.c.gen-lang-client-0196962068.internal (125.31.93.34.bc.googleusercontent.com. [34.93.31.125])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34727bcaf13sm16296250a91.1.2025.11.25.03.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 03:21:18 -0800 (PST)
From: Navaneeth K <knavaneeth786@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	dan.carpenter@linaro.org,
	david.laight@runbox.com,
	Navaneeth K <knavaneeth786@gmail.com>
Subject: [PATCH v2 3/5] staging: rtl8723bs: remove dead commented code from odm.c
Date: Tue, 25 Nov 2025 11:20:57 +0000
Message-ID: <20251125112059.16913-4-knavaneeth786@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251125112059.16913-1-knavaneeth786@gmail.com>
References: <20251125112059.16913-1-knavaneeth786@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove obsolete commented-out code that references unsupported chip
variants (ODM_RTL8723A, ODM_RTL8188E). This code has been dead since
the driver was added to staging.

Also fix the resulting formatting by removing the unnecessary outer
parentheses and moving the inline comment to its own line.

Signed-off-by: Navaneeth K <knavaneeth786@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm.c b/drivers/staging/rtl8723bs/hal/odm.c
index 4b36af47f680..639b6da2302b 100644
--- a/drivers/staging/rtl8723bs/hal/odm.c
+++ b/drivers/staging/rtl8723bs/hal/odm.c
@@ -609,15 +609,12 @@ void ODM_DMWatchdog(struct dm_odm_t *pDM_Odm)
 	/* 8723A or 8189ES platform */
 	/* NeilChen--2012--08--24-- */
 	/* Fix Leave LPS issue */
-	if ((adapter_to_pwrctl(pDM_Odm->Adapter)->pwr_mode != PS_MODE_ACTIVE) /*  in LPS mode */
-		/*  */
-		/* (pDM_Odm->SupportICType & (ODM_RTL8723A))|| */
-		/* (pDM_Odm->SupportICType & (ODM_RTL8188E) &&(&&(((pDM_Odm->SupportInterface  == ODM_ITRF_SDIO))) */
-		/*  */
-	) {
-			odm_DIGbyRSSI_LPS(pDM_Odm);
-	} else
+	if (adapter_to_pwrctl(pDM_Odm->Adapter)->pwr_mode != PS_MODE_ACTIVE) {
+		/* in LPS mode */
+		odm_DIGbyRSSI_LPS(pDM_Odm);
+	} else {
 		odm_DIG(pDM_Odm);
+	}
 
 	{
 		struct dig_t *pDM_DigTable = &pDM_Odm->DM_DigTable;
-- 
2.43.0

