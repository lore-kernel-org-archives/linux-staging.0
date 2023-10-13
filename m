Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CAED3D038;
	Fri, 13 Oct 2023 06:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YVllA43U"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-5aa7fdd1420so278682a12.3;
        Thu, 12 Oct 2023 23:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697176937; x=1697781737; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rkm4IcvDcpDNyn/dmP3dcHytJ9yQBVbR6NWIK3pDrZM=;
        b=YVllA43UKAlIlhlkVSf04QBR6d4r+EPBhiDjpIyEc+3t10l+FciA0uc5KP2S9JYyQu
         WWYWlZRkdfgBpU/yybtvGe1+enVpFv6q6sMLpG1Jwle1rLy6YJ3Kx5/2u2WbEUf+ebVQ
         1QrHoByTsKu+c0nSKegYmINKaBNzi0Y1qkdaGY136q610xcanR8PFTXyvVKNqTGYDLP4
         yerK6UjQ3dPfnjzLm2Jo72iuBn+aBPg3Dlkg6HpeQ9Yv84SWUCtYfe+Q/QlCNeA2alFc
         T34G4RnNL6sEMWFpsis9u2knyYnwqWxQjsRJ7abUX6P9IaIaQFEPnqsXQPnXokISXzUW
         bGbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697176937; x=1697781737;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rkm4IcvDcpDNyn/dmP3dcHytJ9yQBVbR6NWIK3pDrZM=;
        b=iw6iSDK2BbZDuc3tv67rVP51wGnLYd+RoWh5g+yUkU1pkU0q4bYSExpcqCx49BHeu+
         arVBTfeOwaO5eHGHNnqp2Ehf1C1GsiTfV6Pw4oWL9v7al7NpJNEmLbdTJHQDFa9yHYuQ
         nOLjxjxzCqXDKpblflBU+8xBXJlIIjNM3hbbayjDM0iXnBeG5QEQnbrqQYn0SKqnq/bo
         HdjcM2TQSZn8eqmj9xV3YdbH5h7qaf9aaf7fL6oOxj5EStXa4mBjCnGQelC6QRQiidC7
         psx//h1PKI4NrWmdumEOMBzt5dwT0nEnKS6WSQ72qTHUpfx+H1gGLc2bflZZeLpZmNP2
         lZXA==
X-Gm-Message-State: AOJu0Yx3qpafRziE54idCn3/jur9fxXN6hWZiqFvWvJAqkHnA/BQMYex
	WLb2fiBKuagHJQbZDIdGedc=
X-Google-Smtp-Source: AGHT+IGMG45OPEZAKO4OiwlMTwMN4sWA/GNOyRt65f1AGaPCWMqVq5McHbllL0c5DdU1PWITro7GIg==
X-Received: by 2002:a05:6a20:1584:b0:155:2359:e28c with SMTP id h4-20020a056a20158400b001552359e28cmr27705663pzj.9.1697176937436;
        Thu, 12 Oct 2023 23:02:17 -0700 (PDT)
Received: from Negi ([68.181.16.134])
        by smtp.gmail.com with ESMTPSA id l18-20020a170902d35200b001c74df14e6esm3002930plk.51.2023.10.12.23.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Oct 2023 23:02:17 -0700 (PDT)
From: Soumya Negi <soumya.negi97@gmail.com>
To: Jonathan Kim <jonathankim@gctsemi.com>,
	Dean ahn <deanahn@gctsemi.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Soumya Negi <soumya.negi97@gmail.com>,
	outreachy@lists.linux.dev,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] tty: gdm724x: Add blank line after declaration
Date: Thu, 12 Oct 2023 23:01:57 -0700
Message-ID: <20231013060202.13419-1-soumya.negi97@gmail.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix WARNING: Missing a blank line after declarations
Issue found by checkpatch.pl

Signed-off-by: Soumya Negi <soumya.negi97@gmail.com>
---
 drivers/staging/gdm724x/gdm_tty.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/gdm724x/gdm_tty.c b/drivers/staging/gdm724x/gdm_tty.c
index 4e5cac76db58..0c61eaff6122 100644
--- a/drivers/staging/gdm724x/gdm_tty.c
+++ b/drivers/staging/gdm724x/gdm_tty.c
@@ -160,6 +160,7 @@ static ssize_t gdm_tty_write(struct tty_struct *tty, const u8 *buf, size_t len)
 
 	while (remain) {
 		size_t sending_len = min_t(size_t, MUX_TX_MAX_SIZE, remain);
+
 		gdm->tty_dev->send_func(gdm->tty_dev->priv_dev,
 					(void *)(buf + sent_len),
 					sending_len,
-- 
2.42.0

