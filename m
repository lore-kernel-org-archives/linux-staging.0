Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB95063E;
	Wed, 18 Oct 2023 04:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZthgtDL4"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-577e62e2adfso4139570a12.2;
        Tue, 17 Oct 2023 21:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697603797; x=1698208597; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=czJuvzpZ9+G+JcIdKCv4XoL9kYRQrLLnwV3w5sOQ/X0=;
        b=ZthgtDL4EHG4PkKCDMpnBo6bhX6uq2llZ7ylgisLGWVQK6TyTKD4Cl8t2kO+MxEslx
         O7kwW1CofqFJfEOVgFxYMQGCH+AUzwYKPYUf8FrBCexAIm6fOdKDir6RheGJiM8TrZwL
         w8uLeEKYHuooXj2oDBQKpbz2YGhVyWgU7I446K0qdLHYTQgmr5d396LVFSqt+GrKRyLU
         uVFJcRJ72CCWYVeurevPm/YuPk4IAEpOabULmpWEaDPjxtNOJoOrXYGlkvtMW7y9X7k3
         gewMVs8M4phOUdXfKScj2uryyHuR+pyzt5Tpp2QeUpWrlxS3idErIoA7H3ejuhyoL+MH
         Uodg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697603797; x=1698208597;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=czJuvzpZ9+G+JcIdKCv4XoL9kYRQrLLnwV3w5sOQ/X0=;
        b=NPGWmNy0kWKGBYo64TJQAerEko752+GOLFNk8Qp2a4Et7eK8tjcVmmowEREDbbzQUs
         aaOwStfEjzHmjFrIrA2oOLRroyyoep9u+/wSv7qpqiuo62Rtnv4wm19bWOMoniySkDLH
         jipOwiRZvMp6KCKDN07T/dWCfn5uK/jT9Es9yOzDmDA+xSLg0IO4lj7g+5t0gT6IJ+PB
         /QlyLEPPpo1XydEGF+UUuEpbMbRYBW3VPr5K5ZqdQfqmXDvt4jgZUkn3yPISHoh9zdt5
         jwCK67qS0HdFApJ1N+l/fokLfc7IsANorQLFhNKiCzsK7qdXS7keiqLvOABmlbKvWZKD
         Lghg==
X-Gm-Message-State: AOJu0Yz2Q2jmMQN6RHnHo6h4Br2FtWS8zs91WpKCT+C5jKtZ8oAW8cie
	hUyTlYUqwexUCj2HQ1d3u6k=
X-Google-Smtp-Source: AGHT+IF4N/l3CnVfI7YkZfd8KnsjTquzB4kK5ve45u34ccR1+T1p22QjOLzpfwSQWYj+liHH2P/uEA==
X-Received: by 2002:a05:6a20:8628:b0:14c:4dfc:9766 with SMTP id l40-20020a056a20862800b0014c4dfc9766mr3194642pze.46.1697603796723;
        Tue, 17 Oct 2023 21:36:36 -0700 (PDT)
Received: from Negi ([68.181.16.134])
        by smtp.gmail.com with ESMTPSA id ja9-20020a170902efc900b001c3267ae317sm2450863plb.165.2023.10.17.21.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 21:36:36 -0700 (PDT)
From: Soumya Negi <soumya.negi97@gmail.com>
To: Martyn Welch <martyn@welchs.me.uk>,
	Manohar Vanga <manohar.vanga@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: outreachy@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Soumya Negi <soumya.negi97@gmail.com>
Subject: [PATCH 0/2] staging: vme_user: Replace printk's & cleanup log messages
Date: Tue, 17 Oct 2023 21:36:31 -0700
Message-ID: <cover.1697601942.git.soumya.negi97@gmail.com>
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

Also, cleanup the messages further by using __func__ in the string 
instead of function names.

This patchset fixes all checkpatch warnings like:
 
    WARNING: Prefer [subsystem eg: netdev]_err([subsystem]dev, ... then
             dev_err(dev, ... then pr_err(...  to printk(KERN_ERR ...
&
    WARNING: Prefer using '"%s...", __func__' to using 'vme_lm_get',
             this function's name, in a string

Patches must be applied in order.

Soumya Negi (2):
  staging: vme_user: Replace printk() with pr_*(),dev_*()
  staging: vme_user: Use __func__ instead of function name

 drivers/staging/vme_user/vme.c | 175 ++++++++++++++++++---------------
 1 file changed, 94 insertions(+), 81 deletions(-)

-- 
2.42.0

