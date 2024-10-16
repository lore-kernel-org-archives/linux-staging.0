Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB0191D47D7
	for <linux-staging@lists.linux.dev>; Wed, 16 Oct 2024 07:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729065268; cv=none; b=gxy7R+709PME9QQ4XQh4S1BDT7QHh9XRaG5enxBqnwjHMOHAjkiLa7ZajLoUOo6sorrrfoBdejKsTzWZV5F73+XWvZNMHidok6/aJZsKR0XGjWjvBB34pHNMrNMi1H9+4ErO10c9fEOKG28uq2Z3rpE9YwvfddI/kFBX7mjWSYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729065268; c=relaxed/simple;
	bh=pzemOVMWm3UmIYM1ZkUNL8i+q+D8kbSwIq6b2AW9isY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bdP1ybYfxiel+UVBi/wp28CaOCeMBHblcFoUQcFZXBOctqojMDe0OIoY4NKJkNXaJCFV7EdLbjSAoEnAEc8ujJypqjGtQV2ZVb+UAF9zq5ob3C/Hhii2tk/DBLdnnFmbdqaTbCorVWVlNXSd3V6Sj2LQWHN8e28IdohmH2itjcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=everestkc.com.np; spf=pass smtp.mailfrom=everestkc.com.np; dkim=pass (2048-bit key) header.d=everestkc-com-np.20230601.gappssmtp.com header.i=@everestkc-com-np.20230601.gappssmtp.com header.b=oEPPRg2t; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=everestkc.com.np
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everestkc.com.np
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=everestkc-com-np.20230601.gappssmtp.com header.i=@everestkc-com-np.20230601.gappssmtp.com header.b="oEPPRg2t"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2e2e87153a3so3754583a91.3
        for <linux-staging@lists.linux.dev>; Wed, 16 Oct 2024 00:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everestkc-com-np.20230601.gappssmtp.com; s=20230601; t=1729065266; x=1729670066; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BFR80fYrDpP6X7LmDbHOd9DE6LuBDDhguOyT+PK1VWU=;
        b=oEPPRg2tWp1Z7mDlahhepj3o9/GOCl8irur7CLg1dzvYy9JdkYbUmRqe2km90M6uN7
         14/YhMtRV3a9Bkxw2lKwIfWL5seRF9WT13D7ONXy1IJY1W9wVgTLytw3gwAtfwwAdbl8
         TqVH8qRqp7PNdCssenjzOaFYWh1fORCNpaPrkOLDmlFqQ73Kss9DLCTE6KB9dIHiYhdw
         NPCJkIWETT7K1Cdag0eZzlFeMbThR5Ne40/N9bleil4ctLWJ+IWhQxeTw/AMRM2Vs2VD
         oOTIG3fUyEUt8z0EN0S2od7KtYSIBPO8JhwwvWITuZ8bKiYz5cS2/MnxkNeor/TxpmoW
         X+2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729065266; x=1729670066;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BFR80fYrDpP6X7LmDbHOd9DE6LuBDDhguOyT+PK1VWU=;
        b=hBk3bqEhvumXEbAWuIhUxU+rSy6bxnGQ6gg7V8LV3o5y1gAvAoieDEOALzslU3QdBv
         z7LtlQJNilrrxDi0jMnOfI8KQUuj/gC9doape+pkfEka2s+WWX7CFjAtkPL2V7R34cgS
         vbBiGXU6zs+2oCekaE37bOTxgZw/b2klpFBMSEQyBEH9/mY6eTxKItOc7A4ZLhH4O625
         cOTR/nqvfI6KdLV/WHNNezK/Z4UvS89qkp96ACgMofUiU02734jY8OkSIsi9IxdSv0V3
         JbWnVimBlodsN0rdjo9jRhTaNXvRpZM+MuyrRzG7JytLg6Qix9RBnMpJFQM4ARj+Ucis
         nk+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVxkA2pOvs7hARLoo6P7lAUg2rsaWQumNRz7RmyGF8ERVbSl7o7nz5ZR77TU4f7Ks0quXSa/o/ZSrugCW/4@lists.linux.dev
X-Gm-Message-State: AOJu0Yzshl0HXMWnquA7h0TKy7lSQQP0LJ2Pth0Agqs00OnbduBPmjAV
	/5P8ifJspylcD4LtEcCSpJCTHyEI5yMJzGlUFx/G3XbaNSVtQoBLF8OgBDbeFvw=
X-Google-Smtp-Source: AGHT+IEUZnnpNJ+yGIHniIzFYqXySalU3xZmq4Xh79xaZ5D3jOGyUYeoLywGBCVvrAftvG6Nuiwxvw==
X-Received: by 2002:a17:90b:802:b0:2e1:ce7b:6069 with SMTP id 98e67ed59e1d1-2e31538f1camr17781211a91.33.1729065266295;
        Wed, 16 Oct 2024 00:54:26 -0700 (PDT)
Received: from localhost.localdomain ([132.178.238.27])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2e392f7605dsm3370980a91.54.2024.10.16.00.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 00:54:25 -0700 (PDT)
From: "Everest K.C." <everestkc@everestkc.com.np>
To: dpenkler@gmail.com,
	gregkh@linuxfoundation.org
Cc: "Everest K.C." <everestkc@everestkc.com.np>,
	skhan@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2] staging: gpib: Remove a dead condition in if statement
Date: Wed, 16 Oct 2024 01:53:18 -0600
Message-ID: <20241016075319.4092-1-everestkc@everestkc.com.np>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The variable `residue` is an unsigned int, also the function
`fluke_get_dma_residue` returns an unsigned int. The value of
an unsigned int can only be 0 at minimum.
The less-than-zero comparison can never be true.
Fix it by removing the dead condition in the if statement.

This issue was reported by Coverity Scan.
Report:
CID 1600782: (#1 of 1): Macro compares unsigned to 0 (NO_EFFECT)
unsigned_compare: This less-than-zero comparison of an unsigned value
is never true. residue < 0U.

Signed-off-by: Everest K.C. <everestkc@everestkc.com.np>
---
V1 -> V2: - Fixed typo of comparison in changelog
          - Removed Fixes tag 

 drivers/staging/gpib/eastwood/fluke_gpib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/eastwood/fluke_gpib.c b/drivers/staging/gpib/eastwood/fluke_gpib.c
index f9f149db222d..51b4f9891a34 100644
--- a/drivers/staging/gpib/eastwood/fluke_gpib.c
+++ b/drivers/staging/gpib/eastwood/fluke_gpib.c
@@ -644,7 +644,7 @@ static int fluke_dma_read(gpib_board_t *board, uint8_t *buffer,
 	 */
 	usleep_range(10, 15);
 	residue = fluke_get_dma_residue(e_priv->dma_channel, dma_cookie);
-	if (WARN_ON_ONCE(residue > length || residue < 0))
+	if (WARN_ON_ONCE(residue > length))
 		return -EFAULT;
 	*bytes_read += length - residue;
 	dmaengine_terminate_all(e_priv->dma_channel);
-- 
2.43.0

