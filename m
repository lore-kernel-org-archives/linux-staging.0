Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5732472
	for <linux-staging@lists.linux.dev>; Mon, 10 May 2021 11:29:38 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id y32so13049185pga.11
        for <linux-staging@lists.linux.dev>; Mon, 10 May 2021 04:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=u7kwQuQc09sCEmYFDSsBxiPEjHb+SjER7KEW/q9aBeM=;
        b=GhTXHV3iRipnohnB8mk6igF7KQTfIbrkHT/UGk0AxMDSzi3+AIE69eG7YapDlaMrPQ
         Ymds8zb+g87yG2HZ4Z0JAUW7lhZxhTfQp7/tVVBfrwmMMAugSa8hYsFVlpXhrCZe7cM/
         BfQniveZhHEqJ3cXTOb26Qp1Ph8+/Brpiu+RAj3AFMchXt3QzY13KGqIzF9UhaJez9Dz
         Vh0bh2kHAJ3JsXDVWK86ZPjALg3H08Y3uiENwDXvgc3KBBRyV1QSjFqHOeuZQvg87ANM
         voVHaNaad02zRKv3TKjrWNuSw7cMShlfNs+d4Mvt9NqFkXaZoRMfi+/PaZnio/x2avUy
         dMDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=u7kwQuQc09sCEmYFDSsBxiPEjHb+SjER7KEW/q9aBeM=;
        b=ppuxMMrbwG+xd6fb30rAtQVrFfMGPPLpFvaNoMKck1JqGvMW4QkW1RhXiU/o6yemFd
         d9K4E9EN6yVSFDhDoy7F4AiC2tkqT1fW+Ors70DYSgnvx02u6+gk3UX+4T+PRjBpe8HJ
         fdZGfuo+Y/39DvqFw4K9f3GlQuJcANQXCKc6uWwzD2lZmLCTle2YAuLDrMvBh0qTGynD
         Mv/RJC9Ex1WDV5my6HHWFGypzMvhq6xCuDIjd7gXV+10HNMk4nuHi645pisLo27I6Xf7
         RYDmP632jCkCB0WxmKPK74gndI7x3OXIj8ubqDfayijTj2IFxqXxsZmwgXeUdtf6YiVd
         ukaA==
X-Gm-Message-State: AOAM530WShSfTOmHmXdp1xmfwUvwnPrPkQwFaoiUwf61Al3x5ZsWX4BV
	6uUFxjzZiH54bon3YLn957GofTOkBm5Zvw==
X-Google-Smtp-Source: ABdhPJyhPFULlPmf5JjZr5dSB1k+4B3e8GDiWgBUAhShAddRlC/o676Oj9y+zzSMAWWAjxU07k9t4w==
X-Received: by 2002:a65:618c:: with SMTP id c12mr24754664pgv.296.1620646177767;
        Mon, 10 May 2021 04:29:37 -0700 (PDT)
Received: from ojas ([122.177.206.92])
        by smtp.gmail.com with ESMTPSA id js6sm46169607pjb.0.2021.05.10.04.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 04:29:37 -0700 (PDT)
Date: Mon, 10 May 2021 16:59:27 +0530
From: Ojaswin Mujoo <ojaswin98@gmail.com>
To: linux-staging@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, ojaswin98@gmail.com,
	gregkh@linuxfoundation.org, atulgopinathan@gmail.com,
	yashsri421@gmail.com
Subject: [PATCH 0/3] staging: rtl8192e: Fix style warnings in rtl8192e driver
Message-ID: <cover.1620642396.git.ojaswin98@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This patchset fixes several style warnings as reported by the
checkpatch.pl script, in the rtl8192e staging driver. 

In patch 1/3, the changes have improved readability at the cost of 
crossing the 80 character limit, by a few characters. I believe the
trade off is worth it however would love to hear your thoughts on
it.

Ojaswin Mujoo (3):
  staging: rtl8192e: Avoid multiple line dereference
  staging: rtl8192e: Add identifier name to function definition
  staging: rtl8192e: Fix whitespace around conditional statement

 drivers/staging/rtl8192e/rtl8192e/rtl_cam.c  | 12 ++++--------
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h |  4 ++--
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c   |  2 +-
 drivers/staging/rtl8192e/rtllib_rx.c         |  3 +--
 4 files changed, 8 insertions(+), 13 deletions(-)

-- 
2.25.1
