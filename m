Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59A11C84CA
	for <linux-staging@lists.linux.dev>; Fri, 14 Feb 2025 19:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739562933; cv=none; b=EeGSfPELAMpSQxAOvI61T+VmjjWyGTIIo6X8tK8yRro6Ee+dO9M/j8uDU1PKUFUy3HZZAb1aK3IFlNWN207KyTsWvy9ASAj5Ez/Ik2WGFZyzWT2MZzJcH0PdAxcHXqitOFKWxYNhfA751mmPomn8R8cmC+P8Jq7tuP0/LJGq4nI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739562933; c=relaxed/simple;
	bh=GlLftjDRagTS13s5Ysn5RJqGQA/ImDdXkaSwQnm1HmM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XJVgTZMd6fJc3ZVMc3xzFbj8UJvMDC21XndCMNupA2WhIM8Opy8VT8/MQuyOyU56zXP0+ChZTQ6Kgd6B4FcBwgyTDLvaWzEuyfQl6Dq2HyQ89WEovrKqq8fGTNxg+2BQpavhlSitnunFXW1bLyl6aAaWGRSNLz7p7/smbfxH0vI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GiB4tTNe; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GiB4tTNe"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2f9f90103bbso532484a91.3
        for <linux-staging@lists.linux.dev>; Fri, 14 Feb 2025 11:55:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739562930; x=1740167730; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D1ls72V8E9puB3eNgIJ94RbIr4YeTpcns67AF/rE8Ko=;
        b=GiB4tTNeDJ7kIuwfoaMBuMzoQ+P2ySAs6dpHnDkngdG/YOyTrFL2BpOt+XCNgeKheb
         7RQcmu7z5b3Ue2mjdfSD9jdH1EpoYZwHtl/nspVVZi7wtU8ExpkyNADAvbLFdhjTGK7Y
         GiQRThAcfUJZIxv8fQiX00plR/6UQ6herImPuVT3/XOIWLdZ7rzEp5bEJSKqtFS8vbcn
         wAdx+hAk98PFFWOjYNf6gZ9Wd5VPptUvDwEKIFz7J3iCxQYOnCzngUXfLYAtCRyb8Y6R
         yvaFCijFiTXbiCxQZhJNUOVHZ2zAUjSo4lnkD68YBC3KwE7P6hObiCJTz6lLRKX+7ffu
         hjdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739562930; x=1740167730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D1ls72V8E9puB3eNgIJ94RbIr4YeTpcns67AF/rE8Ko=;
        b=tXA8ijZ0iKBNxp/KfHVzVwth6OcQ6szGcd3i9PNualMbFO8uDAgKa2LKBn7lANRAnw
         x4BQ0YIpMBkf1/FW174dzAQ9IZswUO9QOWpT3x576YPMvx7sbPW41ND+RqN013/aOv/j
         7XqU6kaFmFRq+J0rIYkXE6rZsBtp7SVI4B3InzAjEdLra6rtLd13IwRIaz7VLNRoA6f7
         z5346BPjfXY9i67hsywIs2eFqlIBWBXZXx0IrB7mNxK+7mfccGGR3+yTsVISJRhgFp03
         yV+maGcgQ+05L8+igbGuACM1LTQZVbzTxKck6D7nndaaYCa74YpMoqFMuIGtC9QMfuoQ
         dFDg==
X-Gm-Message-State: AOJu0YzEVKeNOXvXUXU93Ei+iC5UE1jubRqsQ7GoEXYFeTDcPw2vHJwD
	5pYvTITdtDBgaH5Far67rsH4eJAXc+IeiCmx2ECIsLXWwRKk5badI2+npte8
X-Gm-Gg: ASbGncvLVUN8h4FUlMk/WtYV4Jo409ApT6oXasTE+SHXhO0c/G9nDehvvaL3GFEKCtg
	NIp3NkSXG9wpMYLNPM/10cD33pnPAnzWUZCR3OAkfD/qc+m4ZukmbL9NCtnnuuUmrwWkpYEVNFp
	35u2UcjEfI/owjkNO4ZPAvpED4yNNvfCng06Q6mGz6+/Pj00MLma5+XdHLZD55NE5tVi0STHh+b
	9Bjoii2mswhb2xcr8o3TS+QGLTH+Pyz29LYBvTbQRN/gTLzlPllbyug37doJwaNnv8KfK0kFTII
	v2jYL3Q6e+7XDDBX/s3uapIRnvViU0w=
X-Google-Smtp-Source: AGHT+IFjYT/m1MRnPua56A4ceDqKHqnT27HdXDvwyL2LyaK5ILMPgH1OeLlvurwBgPORnzf4Xg755w==
X-Received: by 2002:aa7:8893:0:b0:730:f1b7:9ba9 with SMTP id d2e1a72fcca58-7326197e823mr404985b3a.7.1739562930518;
        Fri, 14 Feb 2025 11:55:30 -0800 (PST)
Received: from localhost.lp.veng.com.ar ([200.10.125.114])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73249fe96b4sm2670530b3a.75.2025.02.14.11.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 11:55:29 -0800 (PST)
From: Gaston Gonzalez <gascoar@gmail.com>
To: linux-staging@lists.linux.dev
Cc: dpenkler@gmail.com,
	gregkh@linuxfoundation.org,
	arnd@arndb.de,
	dan.carpenter@linaro.org,
	ajithpv.linux@gmail.com,
	roheetchavan@gmail.com,
	niharchaithanya@gmail.com,
	eleanor15x@gmail.com,
	everestkc@everestkc.com.np,
	kees@ijzerbout.nl,
	skhan@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	gascoar@gmail.com
Subject: [PATCH v2 1/5] staging: gpib: cb7210: remove unused variable
Date: Fri, 14 Feb 2025 16:54:40 -0300
Message-ID: <20250214195456.104075-3-gascoar@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250214195456.104075-1-gascoar@gmail.com>
References: <20250214195456.104075-1-gascoar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Remove unused variable 'nec_priv' in function 'cb7210_line_status'.

This removes the following warning found compiling with W=1:

warning: variable ‘nec_priv’ set but not used [-Wunused-but-set-variable]

Signed-off-by: Gaston Gonzalez <gascoar@gmail.com>
---
v2: no changes in this patch.

 drivers/staging/gpib/cb7210/cb7210.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/gpib/cb7210/cb7210.c b/drivers/staging/gpib/cb7210/cb7210.c
index 381c508f62eb..5c2b2c382df3 100644
--- a/drivers/staging/gpib/cb7210/cb7210.c
+++ b/drivers/staging/gpib/cb7210/cb7210.c
@@ -383,10 +383,8 @@ static int cb7210_line_status(const gpib_board_t *board)
 	int status = ValidALL;
 	int bsr_bits;
 	struct cb7210_priv *cb_priv;
-	struct nec7210_priv *nec_priv;
 
 	cb_priv = board->private_data;
-	nec_priv = &cb_priv->nec7210_priv;
 
 	bsr_bits = cb7210_paged_read_byte(cb_priv, BUS_STATUS, BUS_STATUS_PAGE);
 
-- 
2.48.1

