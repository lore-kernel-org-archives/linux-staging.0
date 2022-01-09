Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 626252C80
	for <linux-staging@lists.linux.dev>; Sun,  9 Jan 2022 19:51:32 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id v6so22805438wra.8
        for <linux-staging@lists.linux.dev>; Sun, 09 Jan 2022 11:51:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=p1AMiJvHNkryIw3zq3NggfXLhQA0Q2EvdEfeBbUqQJk=;
        b=aHe7mNIczcm7TCfDxqBQG2VIjLxWDMqx/qbHztIUodmkRcpR0c/nzNuApL4Q9K4Mdj
         16Axw2LGRfw5uaRPWd5uJBfyCgxXAON9phKk8ZIO+N/VbSsqL6I6yCxDF9fO3H3P21ew
         4L4DQFLYzJaYHG1HnmrENGenh+7h+/v9kELHvblwdyQn/obdp4+Bfw0qzlIFrx302OLu
         E8yy9UpOUGHnt6O2QvnkyffXJ+zOSzOu0wGtKqwGMU03Bdzc65xzV6BMxqh+xpzJ0ens
         3v+ihWU7UaMO0RTLgyTzfwekIDtyOoe3Mp4FCgyk8420yBFTKcceUH+i0Pqxj2RYl5Qb
         Eb2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=p1AMiJvHNkryIw3zq3NggfXLhQA0Q2EvdEfeBbUqQJk=;
        b=jAQdueHzsU/lvga1U7BE3/0tV2qRNh3DUfFqEwgT96GzbRY1fz4vn9zutgS4XbCjcK
         2tskp/1YAy1T5jpbyNcVWPQePY4hwLzhPwX7gxueRP+XtUEwKM6kPhwKVs3wreMR9epW
         jVo0ihP4ju0kOBa2g+ZB5FiPnRicsx8njQMPfJ/kzvSfWk0kYQM7HGLTXxbAhT1nL2Qr
         dsq0suH4tsqrEZQjptltj45wQebfXL4oELLCOlRxM5y2eGOYY2a37jwhL7I8y3r+NTJk
         TNkVz1MjpXMHkFrD215GTw02BcvkPn3ygNHnZCWd/z6NY0ZfHeHNFZ7UfcfksrKomVoN
         wL+g==
X-Gm-Message-State: AOAM530rTgr03krHOqsRbXGw4P9yzgCCoTTACsudsZHLnUNwBCCkf/kd
	dn0++QSBF5HYAvZe4LbRYFY=
X-Google-Smtp-Source: ABdhPJxjZVTMHT+0k4EdM0whztncj82t+8E6deuAW+u7Dda4nR1z+UqDqS9/1mLW8rO7FS80wkxrXQ==
X-Received: by 2002:adf:d1c9:: with SMTP id b9mr21664358wrd.560.1641757890760;
        Sun, 09 Jan 2022 11:51:30 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id 5sm5411820wrb.77.2022.01.09.11.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jan 2022 11:51:30 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: atomisp: make array idx_map static const
Date: Sun,  9 Jan 2022 19:51:29 +0000
Message-Id: <20220109195129.46118-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.33.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Don't populate the read-only array idx_map on the stack but
instead it static const. Also makes the object code a little smaller.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 .../atomisp/pci/isp/kernels/macc/macc1_5/ia_css_macc1_5.host.c  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/macc/macc1_5/ia_css_macc1_5.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/macc/macc1_5/ia_css_macc1_5.host.c
index 562662ab8a44..a70bce1179da 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/macc/macc1_5/ia_css_macc1_5.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/macc/macc1_5/ia_css_macc1_5.host.c
@@ -44,7 +44,7 @@ ia_css_macc1_5_vmem_encode(
     unsigned int size)
 {
 	unsigned int i, j, k, idx;
-	unsigned int idx_map[] = {
+	static const unsigned int idx_map[] = {
 		0, 1, 3, 2, 6, 7, 5, 4, 12, 13, 15, 14, 10, 11, 9, 8
 	};
 
-- 
2.32.0

