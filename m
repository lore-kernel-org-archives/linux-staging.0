Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 990A97A
	for <linux-staging@lists.linux.dev>; Mon, 27 Jun 2022 04:53:37 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id x1-20020a17090abc8100b001ec7f8a51f5so11213033pjr.0
        for <linux-staging@lists.linux.dev>; Sun, 26 Jun 2022 21:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=RDbyHGYjDokBQdeoYhSc2JkFFRAgTdHRAPgldnlL0S4=;
        b=FHLaGUQwXROdnyRwDj37Ca8eClSuuuR/przUhLT8dSMVIocqg79HUmX4pZlEyf4k3i
         tx8XMNhqMiwI8pzmkUoXMCp7AwUrKRsU3Ubn8YjD0bpR28msTTmMbx8Fg2evaHlCWZma
         OGTg+bAyqjTg+VliswfpA5djq8OvfBI34nCKpGKsEWvO2UhvCb+GuhAPDV0xHO/+kYHq
         TrhMCxYdDmq3Aoawb6hQoEwTVrhzU1GrAftTFsLNhAKiwiwKyB1iDCGSXRVJPKS44GT6
         MdlKxSChSXuy95pvPSf7mt6ziZmERzkJXWqqmo6CD56eYoXqMXKJu17S/6xIUyrhgY/f
         +tuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=RDbyHGYjDokBQdeoYhSc2JkFFRAgTdHRAPgldnlL0S4=;
        b=W4Yy1tLKJdGq+/0uc3LsnCqkkX+0Cmy7BH9KzkjaAMW5qEvK8i8jtqJBnpfCNQvdyl
         lGIn47kdCK29k8aYTEzVevykGef6HHFLPw2poSPrqb3CPYFJ13znlMMwgwbAnzrFrlxa
         47doKo2vp3t426w9ixqJFpwzCVxAHgLgMhuCRR1C/yt8BHbOrdbbGmS8Ied1bkLfs7YR
         z7ug7yVOLOYr0jKdITmqTVTfU7LvACorb5y1UMSEzR27E8lCwBtdL5fp84vIvkg5gwfb
         HhqLav5rEYwVA3yo3hf0dwKhC+5nbQvM5RM7sofrwLL9GY7w/YwY1Hn4Vvq1aNZadyPm
         Gcow==
X-Gm-Message-State: AJIora/LpW7ZsLG/luXDMf2wqgEbt6osPuw6s4Pxg77uFJfLd7frI8b2
	Jb/5bTSXTOfPIsw96JxJZkw=
X-Google-Smtp-Source: AGRyM1twkxnyrHdtAeNElq/Rz/ecdCtRlTLDjGHRMfKicL+6R4BCUy6pBvR3XZ/Y52HZE79+ZbfftA==
X-Received: by 2002:a17:903:2448:b0:16a:37de:89b3 with SMTP id l8-20020a170903244800b0016a37de89b3mr12889465pls.68.1656305616817;
        Sun, 26 Jun 2022 21:53:36 -0700 (PDT)
Received: from sug (cpe-23-241-9-246.socal.res.rr.com. [23.241.9.246])
        by smtp.gmail.com with ESMTPSA id u27-20020a62d45b000000b0050dc7628148sm6051397pfl.34.2022.06.26.21.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jun 2022 21:53:36 -0700 (PDT)
Date: Sun, 26 Jun 2022 21:53:33 -0700
From: Arun Vijayshankar <arunvijayshankar@gmail.com>
To: manishc@marvell.com, GR-Linux-NIC-Dev@marvell.com,
	gregkh@linuxfoundation.org
Cc: netdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: qlge: replace msleep with usleep_range
Message-ID: <Yrk3zeyzSJ0424Aa@sug>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

qlge_close uses msleep for 1ms, in which case (1 - 20ms) it is preferable
to use usleep_range in non-atomic contexts, as documented in
Documentation/timers/timers-howto.rst. A range of 1 - 1.05ms is
specified here, in case the device takes slightly longer than 1ms to recover from
reset.

Signed-off-by: Arun Vijayshankar <arunvijayshankar@gmail.com>
---
 drivers/staging/qlge/qlge_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/qlge/qlge_main.c b/drivers/staging/qlge/qlge_main.c
index 689a87d58f27..3cc4f1902c80 100644
--- a/drivers/staging/qlge/qlge_main.c
+++ b/drivers/staging/qlge/qlge_main.c
@@ -3886,7 +3886,7 @@ static int qlge_close(struct net_device *ndev)
 	 * (Rarely happens, but possible.)
 	 */
 	while (!test_bit(QL_ADAPTER_UP, &qdev->flags))
-		msleep(1);
+		usleep_range(1000, 1050);
 
 	/* Make sure refill_work doesn't re-enable napi */
 	for (i = 0; i < qdev->rss_ring_count; i++)
-- 
2.34.1

