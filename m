Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8782259E
	for <linux-staging@lists.linux.dev>; Mon,  5 Apr 2021 20:59:09 +0000 (UTC)
Received: by mail-oi1-f179.google.com with SMTP id i3so12874471oik.7
        for <linux-staging@lists.linux.dev>; Mon, 05 Apr 2021 13:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :content-transfer-encoding;
        bh=rnZ/+SCFR6smzC4OOQsVNnFSMdYRMfjOaDE11Bdi33k=;
        b=f1Y8RbPFc+agJhL3l2y37ACRHnZwWB8QD6d9sWjlu50E0ckwkK85rN181aWfrPNZKC
         rU8wy2bhuXT01eVE/8IH9u1sKtNfHATWr87gFiJVQuLPE4iaYpF2xTkky4+wTlkOxOHz
         POuYW4MRPX41JnoppCydFlM8SzadagpVXX1Z1Qc9COuYKz/l5D5kqhRcIwSHSUdO+pIZ
         5+ddBKGLiZX4qvGiA4kAdDXAw990M0bY9BWQBgyRkSiSTGI4PfAgKrzkvyXYOvUwDI7C
         o7D+tmKuNGbU4SqrudwQJK00S/uAZvAtxY5xzPpXwXNJgnGM9elmNbl33ZJgwZ1UhOUz
         AKgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:content-transfer-encoding;
        bh=rnZ/+SCFR6smzC4OOQsVNnFSMdYRMfjOaDE11Bdi33k=;
        b=i6zBonA55c+Siqonrcu6mDHiBVx+fqrQbMpqSws02hfHjpn8tT0a6KFkg+Sp/4IjZF
         KZ/5bnNspX7+wXboqBc2Qsx/tShzH9p4P8cpCrqBmB4wUt77oFGfw5IYPOUzQw4qYCji
         g52RobBTqo2sNh6aBuyGxdBNxE59X0eKzIBvdI+b7QaM8hZJNlzK04KAhupBhaT8kYSw
         DJY9x/+zWEjyMUV5lZhKcCTKF9ucM6NcioZWEqfyn7J/kryCxVQJ03+WJF/p6YBUWoPN
         VxWozrVTwdGsN5Kzm480jK+1TEqjDUfVXllNsFrxRbubaeXEq9jIr8fyzYx6V89aEwS8
         eDZA==
X-Gm-Message-State: AOAM530EbzROr0zhbqSan3kg0BsZ0V27xhIE0kDScT2bKK3wc/CUd6x4
	vA2AjbyGYN42RICfsWlpjKE=
X-Google-Smtp-Source: ABdhPJw8XqvnE9iO/gZdxZ9J2iI8wd1L9o2jLq4BGDzHyU05O4EyAdGiO7cJBiVHE1tbtx7sE9Y8mg==
X-Received: by 2002:aca:af43:: with SMTP id y64mr763978oie.46.1617656348908;
        Mon, 05 Apr 2021 13:59:08 -0700 (PDT)
Received: from fedora ([2806:2f0:7000:86b1:c1bc:6875:f962:d652])
        by smtp.gmail.com with ESMTPSA id l26sm4225235otd.21.2021.04.05.13.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 13:59:08 -0700 (PDT)
Date: Mon, 5 Apr 2021 15:59:06 -0500
From: David Villasana =?iso-8859-1?Q?Jim=E9nez?= <davidvillasana14@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com
Subject: [PATCH] staging: kpc2000: pcie.h: Remove extra blank line
Message-ID: <YGt6GhZHqB62Y038@fedora>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Issue found by checkpatch.pl

Signed-off-by: David Villasana Jiménez <davidvillasana14@gmail.com>
---
 drivers/staging/kpc2000/kpc2000/pcie.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/kpc2000/kpc2000/pcie.h b/drivers/staging/kpc2000/kpc2000/pcie.h
index cb815c30faa4..f1fc91b4c704 100644
--- a/drivers/staging/kpc2000/kpc2000/pcie.h
+++ b/drivers/staging/kpc2000/kpc2000/pcie.h
@@ -6,7 +6,6 @@
 #include "../kpc.h"
 #include "dma_common_defs.h"
 
-
 /*      System Register Map (BAR 1, Start Addr 0)
  *
  *  BAR Size:
-- 
2.30.2

