Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C984D2F37;
	Wed, 22 Mar 2023 19:21:26 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id d17so9775097wrb.11;
        Wed, 22 Mar 2023 12:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679512885;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mJENhm8ShO0PGzLw3S99cPmiVxD1DZ2HE0JEziChhl8=;
        b=OeXlljxwgtvGbBkwUfhHaORzvJTxBN3WOP00Do+v7XDi9ICYzhtwrVH8YazkLsL9cq
         0ejnDRJwhJ/xf0rxcVJE+/ipoIfE03WQFsItUOa77GK21LyUHvT5bMil6uPNxR5m+OTv
         CE1/Leb7/lId5w3Oa5wJqT3d94QhTvSBApjO2caHbm90kYleVSf/PXro7l75blpCew49
         e5nMLmCw+vfKuQWMcHrGsVFQJ8vbddqnzyaM14F8tibc+/tqQuQMymZRG9Zdi4NCdTAQ
         7Z+z+an9viYNOwOGLlSIJ9tmMX9OFCuEFailgMwUxgClacgP9S7z6lvgFsCISIshSOTc
         dr5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679512885;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mJENhm8ShO0PGzLw3S99cPmiVxD1DZ2HE0JEziChhl8=;
        b=juXy2b07SqWjtMjk234Gj0wp/Ai8NEbu6mCNGg1/TRecTn4HfMgnUX+LtfWAtvOnsv
         hJwLg67/zAnPRwzrHS9stAAt6jeIOW1xybl07RvteeLNCpvX2YOyYfh9LesjGAitl8pO
         I5zZBXlQIi/v6lv/RkJcHGFBqbiL9IzDBK0qGTZKkg2ry4jiewllojuSMk1IYjqvYc9z
         fIRN1snN/9OZQ6SXnqd3ZsD5VfxKTofy6vgfA6Wh33TJ+pEkpeHwNcfPh8yTWi2Q4ASF
         q5nMMcUYd/Zc0xF9M35MSi4ZwQ+XGgqM4HxIRoNGIKES0RxdjcZv2uFOJXFKCgOofnN/
         W6oA==
X-Gm-Message-State: AAQBX9dG7Y5iLYmWSFbEtO05m0Iq3X7pA9GyxsTg9mXWAOVQG3xlP/cV
	v9SWBEXsjr8Uw/meGm4N85U=
X-Google-Smtp-Source: AKy350bnyPGFwFAGEI3db5guKJe9Ckq4bHVhrNmOKxHrndmmnvcLhbdDU5ftfgrIuVX0lTNfWv6xtQ==
X-Received: by 2002:a5d:570e:0:b0:2d1:e3b7:26ad with SMTP id a14-20020a5d570e000000b002d1e3b726admr709815wrv.61.1679512884832;
        Wed, 22 Mar 2023 12:21:24 -0700 (PDT)
Received: from khadija-virtual-machine ([39.41.14.14])
        by smtp.gmail.com with ESMTPSA id r10-20020adfce8a000000b002cefcac0c62sm14595548wrn.9.2023.03.22.12.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 12:21:24 -0700 (PDT)
Date: Thu, 23 Mar 2023 00:21:22 +0500
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: outreachy@lists.linux.dev
Cc: Manish Chopra <manishc@marvell.com>, GR-Linux-NIC-Dev@marvell.com,
	Coiby Xu <coiby.xu@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	netdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: qlge: avoid multiple assignments
Message-ID: <ZBtVMs1wHWyyl2A6@khadija-virtual-machine>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linux kernel coding style does not allow multiple assignments on a
single line.
Avoid multiple assignments by assigning value to each variable in a
separate line.

Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
---
 drivers/staging/qlge/qlge_main.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/qlge/qlge_main.c b/drivers/staging/qlge/qlge_main.c
index 1ead7793062a..b35fb7db2a77 100644
--- a/drivers/staging/qlge/qlge_main.c
+++ b/drivers/staging/qlge/qlge_main.c
@@ -4085,7 +4085,11 @@ static struct net_device_stats *qlge_get_stats(struct net_device
 	int i;
 
 	/* Get RX stats. */
-	pkts = mcast = dropped = errors = bytes = 0;
+	pkts = 0;
+	mcast = 0;
+	dropped = 0;
+	errors = 0;
+	bytes = 0;
 	for (i = 0; i < qdev->rss_ring_count; i++, rx_ring++) {
 		pkts += rx_ring->rx_packets;
 		bytes += rx_ring->rx_bytes;
@@ -4100,7 +4104,9 @@ static struct net_device_stats *qlge_get_stats(struct net_device
 	ndev->stats.multicast = mcast;
 
 	/* Get TX stats. */
-	pkts = errors = bytes = 0;
+	pkts = 0;
+	errors = 0;
+	bytes = 0;
 	for (i = 0; i < qdev->tx_ring_count; i++, tx_ring++) {
 		pkts += tx_ring->tx_packets;
 		bytes += tx_ring->tx_bytes;
-- 
2.34.1

