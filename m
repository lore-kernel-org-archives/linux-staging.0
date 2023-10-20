Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584DB648;
	Fri, 20 Oct 2023 01:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g0OXrCOC"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1c9b7c234a7so2612435ad.3;
        Thu, 19 Oct 2023 18:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697766926; x=1698371726; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=67URzkOz2NZ+RP75J+cnzPWwyvWGIBXhKdfsX2HVXi0=;
        b=g0OXrCOCBnVbVauq+a9uneV+GRe9kXR8P8i5LeqFliLUye20Vh0RhFhVd0SKzInCjn
         bykUE2OZXaEeIWKiFXAX6gARLcAjg3BEuo7eq6lw+EOw2QebJ/iAGZNIkTWZrI4jZ9qi
         wlbxjOfbN10wSpcrM80LdzYCRD+w72sYgnXZX0d1GnqXQa/RNZZr2hb0jK+ID0OwoQo/
         zzkC0pm6KbB12f1MAFQv6JHt4ZPmvx0mXTW7x8fpY+8NfD6P39TAIf2i1KtCn5AyQrkm
         klbbWtwh4RqEStLHdtKqxSEKu3Jb0/sxHO+koHRirfX/mfeZBuG4kcg6byzyk6vxjDS0
         3Z3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697766926; x=1698371726;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=67URzkOz2NZ+RP75J+cnzPWwyvWGIBXhKdfsX2HVXi0=;
        b=Ix5lia7box8IARKRJbLdS0u6auUgZRvDv46gCmTg0YcDFGTsM+hJa0iE2pXOVpoSf/
         g2uzyCDjrUkaV5IRr+Qm6SHgHyLPvOqdKFf5xQJdXAWiy+fNud4oQCNlLree09GG93Pk
         whBTiljW/Zssy4YfRiBO68hYmXpAeYPHN8l9NQd2NR5WFkDa0x0OjI2DVdbwmx4i5X0S
         bNrEl3FTF7ImdGuCvVlcoMoFRQ5Yq2zqClCH/PRiNyw8LKsYLwT+QfvuBcNhHCzSTlQe
         jGv+yyVlBTeGaXOc7QZUOA70s4GXwq9OoLc7muwpluefS4Vma8dU0JRQUS6SPnL+MGFr
         nnYw==
X-Gm-Message-State: AOJu0YyLWYVKhm0ehG38P3LoY20SWHdk70RiMInyUQgadr6qq/scgNFm
	lu/I8XtsPOevmTtdLFfTlpw=
X-Google-Smtp-Source: AGHT+IHD6V3+VlPlrLy2mcmmE7vxwcXbnDv+dr/HtFRbxHFXvPT9BtDdD61CDSYP5Rn85eHrZWmarw==
X-Received: by 2002:a17:903:27d0:b0:1ca:7a4c:8356 with SMTP id km16-20020a17090327d000b001ca7a4c8356mr566418plb.27.1697766926448;
        Thu, 19 Oct 2023 18:55:26 -0700 (PDT)
Received: from Negi ([68.181.16.134])
        by smtp.gmail.com with ESMTPSA id y22-20020a1709027c9600b001c61073b076sm362211pll.144.2023.10.19.18.55.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 18:55:26 -0700 (PDT)
From: Soumya Negi <soumya.negi97@gmail.com>
To: Martyn Welch <martyn@welchs.me.uk>,
	Manohar Vanga <manohar.vanga@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	julia.lawall@inria.fr,
	Andi Shyti <andi.shyti@kernel.org>
Cc: outreachy@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Soumya Negi <soumya.negi97@gmail.com>
Subject: [PATCH v3 0/5] staging: vme_user: Remove printk's & clean up log messages
Date: Thu, 19 Oct 2023 18:55:18 -0700
Message-ID: <cover.1697763267.git.soumya.negi97@gmail.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Staging driver vme_user has a bunch of printk() calls in vme.c which
triggers checkpatch warnings. Remove all printk's by either changing
them to the appropriate logging mechanism i.e dev_err()/dev_warn() or
by dropping the unneeded printk's.

Also, clean up the messages further by using __func__ in the string
instead of function names.

This patchset fixes all checkpatch warnings like:

    WARNING: Prefer [subsystem eg: netdev]_err([subsystem]dev, ... then
             dev_err(dev, ... then pr_err(...  to printk(KERN_ERR ...
&
    WARNING: Prefer using '"%s...", __func__' to using 'vme_lm_get',
             this function's name, in a string

Patches must be applied in order.

Changes in v3:
 1. Patch 1: Use only dev_err() to replace printk(). v2 replaced some
    of the printk's using pr_err(). Leave the calls as printk's. New 
    patches added in v3 handle these printk's. 
    (as per feedback from gregkh@linuxfoundation.org)
 2. Added Patch 3: Remove unneeded printk.
    (suggested by gregkh@linuxfoundation.org)
 3. Added Patch 4: Remove NULL-checks for bridge device & resource.
    Corresponding printk's(part of the check blocks) are removed too.
    (as per feedback from gregkh@linuxfoundation.org)
 4. Added Patch 5: Replace printk with dev_err() in vme_check_window()
    Since vme_check_window() doesn't have access to bridge device, pass
    the bridge pointer to it.
    (suggested by gregkh@linuxfoundation.org) 
 5. Edit cover letter subject & body according to patches added in v3.

Changes in v2:
 1. Correct "cleanup" to "clean up" in cover letter.   (as per feedback
    from julia.lawall@inria.fr)
 2. Patch 1: Change the pr_*() calls used to replace printk's in v1 to 
    dev_*() wherever possible, as it adds more context to the messages.
    (as per feedback from julia.lawall@inria.fr & 
    gregkh@linuxfoundation.org)

Soumya Negi (5):
  staging: vme_user: Replace printk() with dev_*()
  staging: vme_user: Use __func__ instead of function name
  staging: vme_user: Remove printk() in find_bridge()
  staging: vme_user: Remove NULL-checks
  staging: vme_user: Use dev_err() in vme_check_window()

 drivers/staging/vme_user/vme.c | 222 ++++++++++++++++-----------------
 drivers/staging/vme_user/vme.h |   4 +-
 2 files changed, 108 insertions(+), 118 deletions(-)

-- 
2.42.0

