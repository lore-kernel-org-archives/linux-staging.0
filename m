Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E3821771F
	for <linux-staging@lists.linux.dev>; Mon, 17 Feb 2025 10:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739788288; cv=none; b=E790fkotcpCG9F2j2Tw7Nh2+6dY6qRxFFjQOQBzFs/85uiMwv2Mv0mU8h6O73C+yHJFjr8oKkTqkdxlJ7aQwYVXiumcOwG/wNXvkHnxAE8CSLvzNAzDa2JzsEsNipur+JlR+iITDBttQmFrkIyuyKFNP74z7TkAC0z/XZAmo6t4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739788288; c=relaxed/simple;
	bh=eIbUoOIO/oPlM/ArywSv2GC++LTTbctguFEEFD+IOC8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IrWqzEUjeaKnZlJPPWeE9n7GAP7ME4EWndiJdW/NLXxJwyGqLXVgnTc3gFHR6sc7L9uxnK2DKLcu7Zh2+SRnT8D3tlEgycBdY1ql6rtxNoD+QBCTz5FH0nS/3e5AEprQHY4LzBQ/Y4uI1yeUA27f+Wd9Y1nDhTQ12nm6fir2qBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MsSD9VLA; arc=none smtp.client-ip=209.85.214.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MsSD9VLA"
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-221206dbd7eso17056995ad.2
        for <linux-staging@lists.linux.dev>; Mon, 17 Feb 2025 02:31:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739788286; x=1740393086; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uMj86FWLmYH9fJq/mESep7lKDCa0pYdVlxGvc/mylb8=;
        b=MsSD9VLAGx6AqaV1vTmg+PCiZXjifQdy86xhwNQkWvaXCoAjKaeNsYCwemYOoc2ZJ4
         CQ1Myb9VDQhOxS/ngHyL5VsLscVy4BhvoaXIGqTkSUcGbtKuS1marquVs/IY62gvKIjM
         TSarPs5tkPyJ6WQ1uBBBn36/PzNQVykYThg+lIK1PcXKhdDGdleWmyN+7S5IeZ1gx31S
         HbMkmg9faoGz5uOB0YBifBHKxWqbqonSz0bYuBfOM9iAp/vVFFvfQoBRpqbpjMUGBZbJ
         kKWvfHu9Sxc5JRe61MJBzgGedg9KQqTOz5GMC5QrsLsZIeyvrUPlJG08bqgspRbCoNKh
         EgZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739788286; x=1740393086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uMj86FWLmYH9fJq/mESep7lKDCa0pYdVlxGvc/mylb8=;
        b=oyFoEngj+xGU827oeZFCLTj7+K1J54ymFup8UN3nU3CZmeRXUaWxduWy4cjnzgjH1U
         Mkd5uiMzhZkEseR5zX6WwvrABvg39e9/pMko4FxMYUXFsIz2g9NRpk388rjoTMptu7nk
         HckxAdBDVmitBbRLRLz0KgMYWxUl/mxJ6M854dLOiB1HDWwFCl9IT7fW6vG6Yp2PwqUx
         bHDAMjGuxOc7sI8xawodWjRehLTC/3x8Dwp3m6iwKP3SZvihGQCeHUpPxl7gLmFequl3
         3BWtSUNFQvR18olqr2gftOdiVVpeKD9c+jYuxJir6hhwx8xxv/WxpQPZJk9N7k8cXxLm
         Euyw==
X-Forwarded-Encrypted: i=1; AJvYcCWt1paPGfMvX9YKDGpSTGg+tYy5j4k4jFqeYFIh1gSub/rbOD8NdvxccW3BYRjJWYz7EjChvE557gzEkLKn@lists.linux.dev
X-Gm-Message-State: AOJu0YxrXTeEzLcOEyPzk7YV7leRtSaGn6nae3/zdGDcORwPt5KepDu0
	QQ+yQzWSi/hNDik4rQVRcDRFRw0os0K2B5l9sPr6RteO7en0NWLW
X-Gm-Gg: ASbGnctyI3DydVln7z/OR7Qf6zuEP9abxYXSAzwgYiZk0K+rCyfW2Or4qard6AuLeqn
	dao7DiMuu8vS/CmARrBB/xunQmSSY0Qtrvu7aje/gvmgKPJDAt79rwjMQnC/80M/lj2w/j+9jPS
	87JM7D6TTbsABArdUgg7aUaaeLO+iUxrp7/AewGnFBn8PzvDdmm/+NrDUYRN2xL0GA7Ter6P4Yx
	aCh1FtVReQQEPfDBJebqm0GaDZYoxQrWJWE62+bktERHjl7MKTcGpQBsvuuUu/R+1oQRzrcjcZw
	Tp2cvGmaflazVNqjfQDL
X-Google-Smtp-Source: AGHT+IFxZBzg+LpprLkstU58txPBPKskJUnxyvWBmso/e3hDytAWFtcvj9yLj3ndKgM/HHa9AENsGw==
X-Received: by 2002:a17:902:ed03:b0:21f:7077:2aaf with SMTP id d9443c01a7336-2210409d463mr112254205ad.44.1739788286087;
        Mon, 17 Feb 2025 02:31:26 -0800 (PST)
Received: from localhost ([2409:4066:d04:319e:1d76:db25:b6bf:4f52])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-220d53491b3sm67938395ad.40.2025.02.17.02.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 02:31:25 -0800 (PST)
From: Ravi Kumar kairi <kumarkairiravi@gmail.com>
To: dpenkler@gmail.com
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kuba@kernel.org,
	dan.carpenter@linaro.org,
	rmk+kernel@armlinux.org.uk,
	Ravi Kumar Kairi <kumarkairiravi@gmail.com>
Subject: [PATCH v3 4/4] [PATCH V2 4/4] staging:gpib:agilent_82350b: Fix Indent issue with block
Date: Mon, 17 Feb 2025 16:00:38 +0530
Message-ID: <20250217103046.54294-5-kumarkairiravi@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250217103046.54294-1-kumarkairiravi@gmail.com>
References: <20250217103046.54294-1-kumarkairiravi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ravi Kumar Kairi <kumarkairiravi@gmail.com>

There was a empty line, which was causing the checkpatch script to think
it's a single line statment, after removing the empty line it's no
longer asking to check that line.

Signed-off-by: Ravi Kumar Kairi <kumarkairiravi@gmail.com>
---
 drivers/staging/gpib/agilent_82350b/agilent_82350b.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
index b6871eb3c8..1d644d000a 100644
--- a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
+++ b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
@@ -228,7 +228,6 @@ static int agilent_82350b_accel_write(gpib_board_t *board, uint8_t *buffer, size
 		return retval;
 
 	if (send_eoi) {
-
 		retval = agilent_82350b_write(board, buffer + fifotransferlength, 1, send_eoi,
 					      &num_bytes);
 		*bytes_written += num_bytes;
-- 
2.48.1

