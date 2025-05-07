Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F961B4F0F
	for <linux-staging@lists.linux.dev>; Wed,  7 May 2025 10:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746614588; cv=none; b=dXaRjbs3Fkr76irXXC37F/SHC3o3mIl33UakLTnlcedfVaTNQcSo1vXmrUlxrWtErrQt0q21D+WhwzPIBD2emh7bpVHF+SZcKMukWLLEpODvap4JsnnPuAXbXwWzAFmkcCIYF5UPDoDM/KbolIVXWUcQ92+KqBZB/H78WH9ybIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746614588; c=relaxed/simple;
	bh=LgFEdNrQuYJc9nk8hGKt1HTO+/SskVbhW41uW9jTgCo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=edvbeZNTxZTGtTTsCAm4VvgD6i4eP00VQ1r3M1xKAxB32lrWbLdiLt0Z/0Gp5T/CcbWmhwiJYYO54zii5fyfKqtdtUQ56eWtAlzVS1NUK9bdwiTMql5eIQmW3aOTDWa+MKoXNri5uJlFCpljP5eiBJSuDCxBkmhrykE0/+MjJKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bGs2FQFi; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bGs2FQFi"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b0b2d1f2845so4819353a12.3
        for <linux-staging@lists.linux.dev>; Wed, 07 May 2025 03:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746614586; x=1747219386; darn=lists.linux.dev;
        h=content-disposition:mime-version:reply-to:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=86uLetninWAhL43YNpZUPrWnF7wJg6W9C9rPdIemG6E=;
        b=bGs2FQFioCZ1eLz/H8xs83iOu0UcHOOzQnoed2sZ6jLUmBVKX2J1bQRFD8ZHK0nbFJ
         mNYeSVnEqbda7NI70B3fdf9ZFjgMpaBKG9OtsDc8j069Urd9qND+/11Q3agD3upR82Hz
         /GKPRC1sWpq9mlPWAZWx6P3LrWuS9dp67k48JGO5kY1AakNZllifaZ+qwRiqJwIc1p48
         aWSHOHazA3ERgQRpwWs83XNBDcc+mK17lwwUhOZ8dF9BHsFz061iBJYeDcJxaJhHILZz
         ATzm33ZAJUXLG2cUD43Ol+x+n1lAD5o/pVE6EtOBLaQU6Y/1sFjHGsugoIP6Ux/H5iq6
         oxvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746614586; x=1747219386;
        h=content-disposition:mime-version:reply-to:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=86uLetninWAhL43YNpZUPrWnF7wJg6W9C9rPdIemG6E=;
        b=ebIjpWbMtbw9FNda+ThunCuqKa8ht5ScPFgzICZy/qrrpg4JGcXEywQR8v3XZ/0tPP
         vUJ9FEkqY2OzKS9+mtfBn80Svopuzpou1pYAmDXOxxoSEGTVXWVDfsPwUaO2X3iHNzTI
         LVWkSgXfbd1jqn3HPyTg9NH5x98hutCSYKwalv8j+wW1Acu6JHqHTSwTK3G853BhR8fe
         0g6JY2sMkIUr9azJRvBNGfc3kR7kPqiwemLscKH7EKP5J7k3dQH6KtXr4VpvmQ/8RF2j
         HMcvZYhSLODPxxeejuOAJUrj5XnMmaH+30CECcktU28UZ+2/N1OrMYMMRFvjAx5cH1oD
         qx5Q==
X-Gm-Message-State: AOJu0YxC018p4/hWP1zANyzAh9YjkR+1S1KRgHkAOgnRBbIaFDi51Bwu
	JrYztovFL5ssJ02zCDmeV/Fgo5zf9Bh3s1f0DxWDKQ9zxS00xxuN
X-Gm-Gg: ASbGncuwbtpBP0eaVUTNCcFwVsuE4FKZlDmgfqAkqFZnlLH4zcQU7RzMbLmWdDqxHKE
	0qj5yYx2Lh/9xA6MNkeyD4mzcmGMVelsJPDRwYx1VRO5h3/v8cKYn/pt0K0G7MwOvB/jFXwDMPQ
	E6zecMrUGht0ZPX5Mt9nTFBNWLkF3nlvzEFHFZ59VzzOaWgOSweg1hCUUJwOK2fvhSM8CfcO1ch
	H4SqBQj2XKhKD03SyZ1g15YPZFkpMKjb8x5LCGSretl6yVLgDDak+r3GlnvtBXfWpVc4jRA2v/U
	tM7kSGgEdyqinjfN4xapdfI0xibwPHEel/TClOCx2xgJuFBCbQ==
X-Google-Smtp-Source: AGHT+IHJ+9ShVGm4mc0/1bIkX4+Bj6LZl9I6ctnXsYcXsar1zyvDwIzO+nQHqlCcWQYiwjyTkQ1rfQ==
X-Received: by 2002:a17:90b:4acd:b0:308:5273:4df8 with SMTP id 98e67ed59e1d1-30aac183be0mr4708612a91.10.1746614585981;
        Wed, 07 May 2025 03:43:05 -0700 (PDT)
Received: from brak3rDesk ([115.96.77.249])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30aae525db4sm1800952a91.22.2025.05.07.03.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 03:43:05 -0700 (PDT)
Date: Wed, 7 May 2025 16:12:57 +0530
From: Rujra Bhatt <braker.noob.kernel@gmail.com>
To: dpenkler@gmail.com, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 RESEND] staging : gpib : agilent_82350b : agilent_82350b.c
 re-checked the sizeof structure, also checkpatch.pl has shown wrong error,
 hence now applied the right option and commited the changes, this will be
 PATCH V2. earlier have applied void pointer only so it will take only 8
 bytes, and not the whole structure size.
Message-ID: <aBs5MeEdCCwiGE0B@brak3rDesk>
Reply-To: lkp@intel.com
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Signed-off-by: Rujra Bhatt <braker.noob.kernel@gmail.com>
---
 drivers/staging/gpib/agilent_82350b/agilent_82350b.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
index b326058a10c0..94bbb3b6576d 100644
--- a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
+++ b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
@@ -479,7 +479,7 @@ static void agilent_82350b_return_to_local(struct gpib_board *board)
 
 static int agilent_82350b_allocate_private(struct gpib_board *board)
 {
-	board->private_data = kzalloc(sizeof(struct * board->private_data), GFP_KERNEL);
+	board->private_data = kzalloc(sizeof(struct agilent_82350b_priv), GFP_KERNEL);
 	if (!board->private_data)
 		return -ENOMEM;
 	return 0;
-- 
2.43.0

