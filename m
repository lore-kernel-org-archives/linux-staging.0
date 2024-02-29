Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B187C6F6
	for <linux-staging@lists.linux.dev>; Thu, 29 Feb 2024 12:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709208078; cv=none; b=lLWdQAYbTvaAxhbv80+roHWjH1Sck/sPtkTBeFovezxAwuyPPmJiuqY6YcUVFTGPYqYvUmRhbi5L/+XyJHB1lqvgsgwiVZOJCeK9HTDdGpLX3RD/Gl7gjbep8/BeJ85ApJ8RdE4l0yKGg98EVnSe1Qa7BZA6WL6L5X855tHHArk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709208078; c=relaxed/simple;
	bh=tsUHJaDpIn+D7l8huEZQkJle1PO20bTndyJz5QMVCEo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=jlMkJtvZErX8or9YZeYECgABFmxJiXxjNDhxAL9rTTjL8rHG1TVPjtEMEvMPQXxQX098ph9PPsEw6VgmhAu+UN4yPTjAOkzj4hZ5FDfHJ0AuaX9vippVzsPNGhASzoykteLcukzscmEejDxHSofDnK2fgir7feg2O7xXwg4wGa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aPZJHj8/; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aPZJHj8/"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-412b83cfb44so5310995e9.3
        for <linux-staging@lists.linux.dev>; Thu, 29 Feb 2024 04:01:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709208075; x=1709812875; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eEAjs0RdcfPAuQlAjUQMeit5zsCbuLGbEFFZ96le7No=;
        b=aPZJHj8/KPxi9HMonvjar1u4qFVOuS2l4se5WkqBcNlg65LKAj03R+ElJXKvDsUrGw
         hcjpexsoxlOZ5gO06HuVeIHvRD8pGqKBOT8XqYVJtC9gB3iX50/P06c1XkMN+22NdoQ2
         GuaVQ6zS0M15eaNf0Sd+eE63mj905aIyIFBKq04DG7zuC1IRr2MWH3KI5Mvr+RD3NDDK
         /eh+FSMvWEUwo6uTsPoruklpyTktTANAR0jBTMzRACGth2oKEfUL68wFatZFAu1VttG0
         RFaTqeOddzMKAmIQSA5oIFJo2FITLucXt6Qs0X6bkYOzZzTu4l8O8VScAo/2jdYUfLkf
         aisA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709208075; x=1709812875;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eEAjs0RdcfPAuQlAjUQMeit5zsCbuLGbEFFZ96le7No=;
        b=PqoiUUb/OAJcLTX37ADNbSWXIQhZslNjY1JC14qcLR0sfmUIja7/hRiZ2PayucBwDs
         eUT+3/r5m+tYRsxx2LcawrB3Qu9dVpmMb13o623tf31C6mpMVNiNtI9dSAneQ0K8Hc8r
         6WglwKkyR68CLXWMicLqsfr+PpEoPTv6Nrrn9O3LFOlhdOd97sXyfnQ9Xun9Kek5eB+q
         u30gxtSRfrvGwU/bVC0itLdxvWJPp0LxXjviofPhiKg8yV5E5zaJQ3/ViWGQbgz9eHfK
         0xVGDXc85u1GYpo3UHfNNB6T4bmC33D7UJyPkDOmQLHENn2xaYsn3blnreK1/Cl7XfYL
         IxiA==
X-Forwarded-Encrypted: i=1; AJvYcCXzaoC3SDnn090s5Kpo3nhB1cGJm6sT+EumNPMRngMT+CtxnzItr4YZZo36KRCneNI20uxTz6Qx90wjjJ9StBbqD/a7rblOZrmuJkGBmw==
X-Gm-Message-State: AOJu0YybJlhHjDQ+kUB19HmimUHxkyFCd9s3Y1D4ZmAMB9TAsIb6Nyk0
	qGCk3zqYiRQ2QaA6NSkJtTn63aEnN98BIs1Awv+vZzZY5fVSsPC0
X-Google-Smtp-Source: AGHT+IHC3vwxsZB7sP4Fov8PtZ8j3jocrLNBn1PvwUm276KL0P9EU9+xvQoaqFjvMvY+vAlNTY8CIg==
X-Received: by 2002:a05:600c:4ed4:b0:412:9842:c4f2 with SMTP id g20-20020a05600c4ed400b004129842c4f2mr1610641wmq.12.1709208075311;
        Thu, 29 Feb 2024 04:01:15 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id u17-20020a05600c19d100b00412a31d2e2asm1908421wmq.32.2024.02.29.04.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Feb 2024 04:01:14 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] staging: fbtft: remove unused variable 'count'
Date: Thu, 29 Feb 2024 12:01:14 +0000
Message-Id: <20240229120114.219085-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

The variable count is being initialized and incremented but it is never
actually referenced in any other way. The variable is redundant and can
be removed.

Cleans up clang scan build warning:
drivers/staging/fbtft/fbtft-core.c:330:6: warning: variable 'count' set
but not used [-Wunused-but-set-variable]

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/staging/fbtft/fbtft-core.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index 68add4d598ae..38845f23023f 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -327,7 +327,6 @@ static void fbtft_deferred_io(struct fb_info *info, struct list_head *pagereflis
 	unsigned int dirty_lines_start, dirty_lines_end;
 	struct fb_deferred_io_pageref *pageref;
 	unsigned int y_low = 0, y_high = 0;
-	int count = 0;
 
 	spin_lock(&par->dirty_lock);
 	dirty_lines_start = par->dirty_lines_start;
@@ -339,7 +338,6 @@ static void fbtft_deferred_io(struct fb_info *info, struct list_head *pagereflis
 
 	/* Mark display lines as dirty */
 	list_for_each_entry(pageref, pagereflist, list) {
-		count++;
 		y_low = pageref->offset / info->fix.line_length;
 		y_high = (pageref->offset + PAGE_SIZE - 1) / info->fix.line_length;
 		dev_dbg(info->device,
-- 
2.39.2

