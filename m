Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394166ADB
	for <linux-staging@lists.linux.dev>; Mon, 24 Oct 2022 21:24:26 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id a5so20471827edb.11
        for <linux-staging@lists.linux.dev>; Mon, 24 Oct 2022 14:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bQAYa+fLJox/NZH1tjJ+liVfXSJpT0A7dg3CtjYLJqI=;
        b=HhVMJjUWnEX2/bI1fcYlS2gBN4LO5cARc0+K9EyA62L3szY9ESDnBfmlenWCHBxTIG
         9vy5a96kBS86oMQaLFq2PEa81BKgxzaMg8HEKjzO7ZgvdtKLEnUV5RvLGBnvtZ6aEOuz
         ik8XLDXu2o9bv8KWayqeYf3zAWmDghmP1FdyX45mPd/35U0XTYMeTjbX7keIWzpMCjUX
         nNG/Sunew4FwvjZyw8Ql8JKMDOq7Fzs8DruAQ52t1GC/f5ekIjUqdBx3Ho/GlwKn5F1t
         W+l1441yRnA+T7AuovrqQD6zItmfx7sHzwzmdqWw22FLvB5UFyuaw7qQiGbMycTXLhcd
         0ptw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bQAYa+fLJox/NZH1tjJ+liVfXSJpT0A7dg3CtjYLJqI=;
        b=ckHn4T+OxabCw7N9GFEfwL2j1+zHKNdJFtx28pFqrsmvuhDJ7JB+BBU72YoK4V2rBT
         KRs+4t6mxPh8yQ163cC2wLGj7fGwDzcfdPOKiicQRHZfvyYGAN4L9BCPYEXEy4ru5FOk
         wkqCXaJnX1h3b4O6GVXT0ybgkGL72/u+xZHwVy1LWq9s6kLLRrOCLrcOil7ko5gido1f
         51vd1HFS7ApnTmONUW3IsP8AZtr+38hOf5IqkHm2jCg0S1MdhjflqmkYlBWSN6ZQAi3K
         M4sAqN1Q0vmHNHhKJ/BNNplXW05Yr6j5hczWUwzptEYt3vRLFuDJCHqiRMNPmX9/FRbA
         IoEg==
X-Gm-Message-State: ACrzQf1ZcuKW2H+uNs6asPoI0CvDjk+25V7ocyfL1z8XKjG8xhlRAJ2M
	oebri+bweyitu87omJIiSVA=
X-Google-Smtp-Source: AMsMyM6/qCmr5spS+W5iEx75xawJB3t7ZI7urvtVo4wnsCnv/FqyPoOcz92/orCA8VKCHXNyjWd/tA==
X-Received: by 2002:a05:6402:406:b0:458:a47:d14c with SMTP id q6-20020a056402040600b004580a47d14cmr32275444edv.41.1666646664353;
        Mon, 24 Oct 2022 14:24:24 -0700 (PDT)
Received: from localhost.localdomain (ip-217-105-46-178.ip.prioritytelecom.net. [217.105.46.178])
        by smtp.gmail.com with ESMTPSA id r1-20020a1709061ba100b007a9c3831409sm379354ejg.137.2022.10.24.14.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 14:24:23 -0700 (PDT)
From: Nam Cao <namcaov@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Florian Schilhabel <florian.c.schilhabel@googlemail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: namcaov@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] staging: rtl8712: clean up dynamic memory management
Date: Mon, 24 Oct 2022 23:24:05 +0200
Message-Id: <cover.1666645510.git.namcaov@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This driver is fine if memory allocation never fails. However it does not
handle allocation failure well. This can either lead to memory leak, or
unallocated buffers being used.

Nam Cao (4):
  Revert "staging: r8712u: Tracking kmemleak false positives."
  staging: rtl8712: check for alloc fail in _r8712_init_recv_priv()
  staging: rtl8712: check for return value of _r8712_init_xmit_priv()
  staging: rtl8712: fix potential memory leak

 drivers/staging/rtl8712/os_intfs.c     | 27 +++++++++++++++++++++-----
 drivers/staging/rtl8712/recv_osdep.h   |  8 ++++----
 drivers/staging/rtl8712/rtl8712_recv.c |  7 ++++---
 drivers/staging/rtl8712/rtl871x_recv.c | 16 ++++++++-------
 4 files changed, 39 insertions(+), 19 deletions(-)

-- 
2.25.1

