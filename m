Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE5746684;
	Thu, 19 Oct 2023 07:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cakrfTGc"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1c434c33ec0so53012695ad.3;
        Thu, 19 Oct 2023 00:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697700020; x=1698304820; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VJ8K0FN0Qpyz/8G/jYt1sKfnOsJUIjYOYEd3rSEKCTI=;
        b=cakrfTGcDHqJpxQamRfGVRGFE55sDkCBtej4OjQcfHWZdrUPcWJCvqdqecDA/6S0n/
         JCW8YDDu0oi8jYwLe2D+6KyEUo9C4lv8eXFmKDNtyg1ZrwqRF3QMWCUty7FH9/Ck4hkA
         xpWc5izAJxX8QYb+V1MwG5RIDK90N39v8R/n4K3yVCk9YFsWyRZZCU2p8NDEDeBjrIbe
         DIU3d0cwdOPa8L5nnR2bJj9L0FhXHkhJ4NerCLNX2WAvmjikPOjbe9hASojKDgTMbp5d
         R02OwC40krE2tiedbq1U18r4XO43VkAMlDYQBIksWCbZc/OPoDDfprWzOg2OUK2e6W/n
         WrtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697700020; x=1698304820;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VJ8K0FN0Qpyz/8G/jYt1sKfnOsJUIjYOYEd3rSEKCTI=;
        b=EgytaNO9ZSyCD/wvwfJpvj5OEj/vhO1wJhMC7Ym9s3OFfVUHNqRWoQw6SbqpSQgqv7
         c92dFL2a5ldXXJheGqmESVjHm7bIYiyQHddsQRxNIZ8KTPVgcqmJZ/OK3SecgnOG/H+p
         0YDUBs4ri8ltOUTR2cawiVpIPMiMo1u7jiC5Tp8GOn7EKNIlYrOkl0QJjzphA/aFOzg8
         DTx/CFHziE6ykXXdEZxgvGiNdqjfZZVjwnCQgl7kDxa/85DdShPvojxKd1FT/2ta72EK
         SuWmwABcy1pviwkx6VXfuQypT2MVmYWhJUfVbbS9RXqGuQtDpwoG3ht47Onym6nVkZCq
         uIKw==
X-Gm-Message-State: AOJu0Yx9V1fIkP+RaMjpAXVBWdsRKlMOYaYjTI4tFDWmNwLsXSzQntoq
	mpKYKx3k6W34wQcb5+IFtwA=
X-Google-Smtp-Source: AGHT+IE6mU6qXpkdMqXl3bSFTtKXy50t1qwvAy5M+NVCJV0u99P1HxZPkhpYT80egprsqK6qkol5sw==
X-Received: by 2002:a17:902:da8d:b0:1c7:495c:87df with SMTP id j13-20020a170902da8d00b001c7495c87dfmr1971350plx.53.1697700020238;
        Thu, 19 Oct 2023 00:20:20 -0700 (PDT)
Received: from Negi ([68.181.16.134])
        by smtp.gmail.com with ESMTPSA id u17-20020a17090341d100b001c1f4edfb9csm1141686ple.173.2023.10.19.00.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 00:20:19 -0700 (PDT)
From: Soumya Negi <soumya.negi97@gmail.com>
To: Martyn Welch <martyn@welchs.me.uk>,
	Manohar Vanga <manohar.vanga@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andi Shyti <andi.shyti@linux.intel.com>,
	Julia Lawall <julia.lawall@inria.fr>
Cc: outreachy@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Soumya Negi <soumya.negi97@gmail.com>
Subject: [PATCH v2 0/2] staging: vme_user: Replace printk's & clean up log messages
Date: Thu, 19 Oct 2023 00:20:08 -0700
Message-ID: <cover.1697696951.git.soumya.negi97@gmail.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Staging driver vme_user has a bunch of printk() calls in vme.c which
triggers checkpatch warnings. Remove all printk's and change them to
the appropriate logging mechanism i.e pr_err()/pr_warn(), or
dev_err()/dev_warn().

Also, clean up the messages further by using __func__ in the string
instead of function names.

This patchset fixes all checkpatch warnings like:

    WARNING: Prefer [subsystem eg: netdev]_err([subsystem]dev, ... then
             dev_err(dev, ... then pr_err(...  to printk(KERN_ERR ...
&
    WARNING: Prefer using '"%s...", __func__' to using 'vme_lm_get',
             this function's name, in a string

Patches must be applied in order.

Changes in v2:
 1. Correct "cleanup" to "clean up" in cover letter.   (as per feedback
    from julia.lawall@inria.fr)
 2. Patch 1: Change the pr_*() calls used to replace printk's in v1 to 
    dev_*() wherever possible, as it adds more context to the messages.
    (as per feedback from julia.lawall@inria.fr & 
    gregkh@linuxfoundation.org)

Soumya Negi (2):
  staging: vme_user: Replace printk() with pr_*(),dev_*()
  staging: vme_user: Use __func__ instead of function name

 drivers/staging/vme_user/vme.c | 193 +++++++++++++++++++--------------
 1 file changed, 109 insertions(+), 84 deletions(-)

-- 
2.42.0

