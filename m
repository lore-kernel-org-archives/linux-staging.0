Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C036C72
	for <linux-staging@lists.linux.dev>; Sun, 11 Apr 2021 04:33:48 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id p12so6822992pgj.10
        for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 21:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=Fhx4bFoz4AMpMdIpkI4YdswXasRpyjIs7bwxZv1lokc=;
        b=naSRNKXl4+AVcsZ6V0ZzIrqr+ioCnJZtER7CZP6F5ddHLxFAFxbb6x/AeZyc8NaXhX
         O/+NKprUHBa98HXhjhjsyVe9xOSDDTEw/U3F4fXao3ObGki0df2ZbGHFCCb8iRE3CVe1
         K3FWwEy31KV7a0v/ZXz2JSkvMKZr/HTb9vu9bQz1/9nV6Ku0Qjr81B8xnprQ/tFAo/AO
         KXC0z+rEI41lOBi0kMM/Rl4Y6SOtbbfTOfnDK21R8t3F9ggYDQuEu5p7AgZ2brvFPp3L
         ZkR2xbsqI8+rqT60XJzBgklqcybOuwbhV4cDJYNSBA8Q71Bb+znxBmgT1H0W6K8Qtn7V
         ubxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=Fhx4bFoz4AMpMdIpkI4YdswXasRpyjIs7bwxZv1lokc=;
        b=ZJIfQnz2udW58IgQlBgnsRvtHQbcenC9du7XngJUIYmgsRFBretieIu1FHVMqvhZXQ
         2eGlggVL0jHzL0emPPGIE/eKBTGraVHBB91BlbuWGNS6o0YhP4olP18PFJDL0H/yqvZQ
         8vUQasW6ZWUxyeqNxHo+rrBBPDK27R4Xf61Lt69BuVV3V/961W+L9ZUIronWJSyjLKcA
         pyeOglrfFK7i+1B0t5DJ0FBx5ASYUTCdC/64YKcXY8BqwoNCtr8Ol5CYDGSEWlgiiuMH
         AbsNIjeYGfEQBSIuVCRVZR2GE4qo989bCjrXsHhb8JrtSZuPO+x6f3J7+Pl5qkszWoQ6
         7DBA==
X-Gm-Message-State: AOAM533qeN+vl8tPnELBXS5JUa1xgpwLwnQWw8eENO1oUK2LqsXGbPmu
	SUnO2VWr3/F8AlhuMAOCjTg=
X-Google-Smtp-Source: ABdhPJxd3xnYxhBFQMfSIVs0XvpyUtF+yS1cyow1AA1E1biddxprVFf4vqcLIsV29MfDawuQuVPWYg==
X-Received: by 2002:a63:d815:: with SMTP id b21mr20632938pgh.217.1618115628183;
        Sat, 10 Apr 2021 21:33:48 -0700 (PDT)
Received: from kali ([103.141.87.254])
        by smtp.gmail.com with ESMTPSA id p22sm6570951pjg.39.2021.04.10.21.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Apr 2021 21:33:47 -0700 (PDT)
Date: Sun, 11 Apr 2021 10:03:40 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com, mitali_s@me.iitr.ac.in
Subject: [PATCH v2 0/3] staging: rtl8192e: remove unnecessary parentheses
Message-ID: <cover.1618110617.git.mitaliborkar810@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This patch fixes style issues
Changes from v1:-
[Patch 1/3]:- Removed unnecessary parentheses around boolean expressions
[Patch 2/3]:- No changes
[Patch 3/3]:- No changes

Mitali Borkar (3):
  staging: rtl8192e: remove unnecessary parentheses
  staging: rtl8192e: remove unnecessary ftrace-like logging
  staging: rtl8192e: remove unncessary parentheses

 drivers/staging/rtl8192e/rtl819x_HTProc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.30.2

