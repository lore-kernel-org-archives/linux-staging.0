Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C0B71
	for <linux-staging@lists.linux.dev>; Mon, 21 Jun 2021 13:50:20 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id g24so10003513pji.4
        for <linux-staging@lists.linux.dev>; Mon, 21 Jun 2021 06:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nQXYpr9OGIzLz2GoYn3JoWophCOazgqDgqjJlPCW9Rs=;
        b=lv9U+FuTpoaz7AymRBNPFNKHjQcfwKiwWvhz1Hdsy28AWvlUDmXgBbGSTehyn8QEzF
         MD6zLkgSKagDIpdWXB/WoYDb8mMK3Vghy3WAOWoivQculdGRbRsfGmTRJWgsVAmH4Qe2
         HCWIhP4rXcEJ1xU29jjK8zrxsJ5l5XyUCirCUT/OLlwm1ny80NucLs8bXUkbMFk9wNQk
         y75q0JMy2C2Q8op1YWqdSGANcVQUUfqZcZZMBMIk1+M/US+fDoDzG7lRY0sHmt0QEriK
         gg249+gg9XDwoV6ZrkGCUkDO/FN/+PnonfDZV3g08FSN7v2CfE7JiIO1bwLF9ujNMS1r
         LS3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nQXYpr9OGIzLz2GoYn3JoWophCOazgqDgqjJlPCW9Rs=;
        b=MpXv6x/FzG8bf5TNRDWyJMOuHX8FHKw5Zs0tN8bOG8BUFtYdZoa4MaSrNy9xbtlECs
         4ITlTc5O/+ViOXvrL5MJgbby8Ea8MVav3gV2VqZNGnRPvmct3zmQGK7oV+H9VU1Onn2z
         vRiNgX/l+ah/tdrrlm1EZIn8EUKbn7ERKP1vArT4WXci+fPJ20a+xOIfD1nckqb9U4wN
         bX1dwurI69UcQw15vd7t0bHSqkzseV+wPsTIkY6+9Y/HVFt+3c795P9fZdCkW/OT0S4/
         bKT2stSS3eIYog+5uRI2w7SlFQzMoSgc/NBSDwKnT7nLN4ejdK+3ZsY1Kgobx6MTJmRn
         uqLw==
X-Gm-Message-State: AOAM531T+O2sixd/A415yJNDJBZbiWv0JOXbB+wvU8oB4WhFAAy2hE30
	sdOjbMHPqUHVEnlrxEEYACEM8LIotlnGxcON
X-Google-Smtp-Source: ABdhPJyPXvMmTVBBrohbhigbDD75fOJj+C8VChO1klkLtEa4TIchsmrFlvmYANSMpmEV0qTu6XMEiw==
X-Received: by 2002:a17:90b:3646:: with SMTP id nh6mr14994751pjb.73.1624283420237;
        Mon, 21 Jun 2021 06:50:20 -0700 (PDT)
Received: from localhost ([209.132.188.80])
        by smtp.gmail.com with ESMTPSA id n6sm16959160pgt.7.2021.06.21.06.50.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 06:50:19 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
To: linux-staging@lists.linux.dev
Cc: netdev@vger.kernel.org,
	Benjamin Poirier <benjamin.poirier@gmail.com>,
	Shung-Hsi Yu <shung-hsi.yu@suse.com>,
	Manish Chopra <manishc@marvell.com>,
	GR-Linux-NIC-Dev@marvell.com (supporter:QLOGIC QLGE 10Gb ETHERNET DRIVER),
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [RFC 07/19] staging: qlge: remove the TODO item of unnecessary memset 0
Date: Mon, 21 Jun 2021 21:48:50 +0800
Message-Id: <20210621134902.83587-8-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210621134902.83587-1-coiby.xu@gmail.com>
References: <20210621134902.83587-1-coiby.xu@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

commit 953b94009377419f28fd0153f91fcd5b5a347608 ("staging: qlge:
Initialize devlink health dump framework") removed the unnecessary
memset 0 after alloc_etherdev_mq. Delete this TODO item.

Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
---
 drivers/staging/qlge/TODO | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/qlge/TODO b/drivers/staging/qlge/TODO
index 8c84160b5993..cc5f8cf7608d 100644
--- a/drivers/staging/qlge/TODO
+++ b/drivers/staging/qlge/TODO
@@ -4,8 +4,6 @@
   ql_build_rx_skb(). That function is now used exclusively to handle packets
   that underwent header splitting but it still contains code to handle non
   split cases.
-* some structures are initialized redundantly (ex. memset 0 after
-  alloc_etherdev())
 * the driver has a habit of using runtime checks where compile time checks are
   possible (ex. ql_free_rx_buffers(), ql_alloc_rx_buffers())
 * reorder struct members to avoid holes if it doesn't impact performance
-- 
2.32.0

