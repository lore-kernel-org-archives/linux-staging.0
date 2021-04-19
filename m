Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40DFF2F83
	for <linux-staging@lists.linux.dev>; Mon, 19 Apr 2021 19:11:41 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id e9so1308282plj.2
        for <linux-staging@lists.linux.dev>; Mon, 19 Apr 2021 12:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=CTXereTPjdkRipc48f7/rpT9ICCorkjoYsEaZmc/YWo=;
        b=PuxKS67Jgt4dLTmaGLZFBWGRneYt6PAXt9WjvQufCq4iwTMpHStxltduB/qFXXKpgU
         Mkz/k4mlFqtHSbpeheU0PGm9vMsjeJ0EmC8+wE8E2rT6eg5npCs00wToWrEVAjj7nC5E
         0CLKmFNAEiNb3UclTfSLq89QrgWK4QVuW9Cl2RbW0CQHilUzBq5JPNpXLl6nkqXjRb4e
         /PEgdwR5yBSeDUi4Uwe2lChyhnUWkx+KDIyiJ2d08Ng58GLfUrSUsIugEBii8rHJg1r6
         bWvCF1OQ6yxDuU1r4p08S98hGsboiqMZk2lx3F/8/t1aGXLsaEWNkYIxZynHQKDURw/h
         /RtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=CTXereTPjdkRipc48f7/rpT9ICCorkjoYsEaZmc/YWo=;
        b=cmCJbzE4NL54/C/Owj3bhL5Bi6+IeOwslFI2JeXMlNfpR9MlKtxKLvy4beBbL7oBcr
         tTQLXzh0QRim5zJtnBPvf3Yv4lr9u5M0WsJdt3HyJiHJntYBNnAAskhbwP9BtaBsEkA7
         iy+Vvroz+vqJ2PN3Kn5bM3r3oPkkC3Es787hXus8z18xiiqGM8XZeaiiHiXPAy8kjozl
         DOn4QiyM8vhxxuL5m4Z/y/26IqKUyy1ypyA2hiC+khYs1T1/IMXY8VlQZgYkpp4XEBw5
         JkUlAOcebbI0TQZnGPsqnkCQ8JnYnsx0KcAk+undN/yexoXRwY6Qg0Y+TEG6FrrRf/nm
         ryMw==
X-Gm-Message-State: AOAM532AwX0Iug8NAJL4FcAT9UabIvUsVDz8JDb+WinQ2bAFk7dDb2ou
	koSBUfDLrrOadY5xC1PfOHQ=
X-Google-Smtp-Source: ABdhPJysmNCph4NGs8hiLvMKqpWbw6kORIH4d73DltLJ3gzd/ahVmjVGwSyTHBPU2TlJGHIWeC+CCQ==
X-Received: by 2002:a17:902:e74f:b029:ec:b399:83b1 with SMTP id p15-20020a170902e74fb02900ecb39983b1mr1328025plf.1.1618859500818;
        Mon, 19 Apr 2021 12:11:40 -0700 (PDT)
Received: from localhost ([103.241.225.98])
        by smtp.gmail.com with ESMTPSA id w140sm2515634pfc.176.2021.04.19.12.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Apr 2021 12:11:40 -0700 (PDT)
From: Deepak R Varma <mh12gx2825@gmail.com>
X-Google-Original-From: Deepak R Varma <drv@mailo.com>
Date: Tue, 20 Apr 2021 00:41:35 +0530
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: mh12gx2825@gmail.com
Subject: [PATCH 0/6] staging: media: atomisp: code cleanup fixes
Message-ID: <cover.1618859059.git.drv@mailo.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This patch set addresses different kinds of checkpatch WARNING and
CHECK complaints. 

Note: The patches should be applied in the ascending order.

Deepak R Varma (6):
  staging: media: atomisp: improve function argument alignment
  staging: media: atomisp: balance braces around if...else block
  staging: media: atomisp: use __func__ over function names
  staging: media: atomisp: reformat code comment blocks
  staging: media: atomisp: fix CamelCase variable naming
  staging: media: atomisp: use printk with KERN facility level

 .../media/atomisp/i2c/atomisp-gc0310.c        | 12 +--
 .../media/atomisp/i2c/atomisp-gc2235.c        | 18 ++--
 .../atomisp/i2c/atomisp-libmsrlisthelper.c    |  3 +-
 .../media/atomisp/i2c/atomisp-lm3554.c        |  2 +-
 .../media/atomisp/i2c/atomisp-mt9m114.c       | 82 ++++++++++---------
 .../media/atomisp/i2c/atomisp-ov2680.c        | 26 +++---
 .../media/atomisp/i2c/atomisp-ov2722.c        | 10 +--
 7 files changed, 80 insertions(+), 73 deletions(-)

-- 
2.25.1

