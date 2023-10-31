Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A44ED6
	for <linux-staging@lists.linux.dev>; Tue, 31 Oct 2023 10:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FdKvClqn"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6b497c8575aso5557415b3a.1
        for <linux-staging@lists.linux.dev>; Tue, 31 Oct 2023 03:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698746796; x=1699351596; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DzncjTyuGFW5TKPcprBNQRe7Jwt07iBenfFhkZIrVrM=;
        b=FdKvClqn6KleqLbXDsw64TXxP8l/32ky5vnGGIHWGinD0Ro70HYCEuoPg6rRfgMzb/
         0gKAB6ovK0GSwQIS4tUBBLT5zkGKu8mh1gj7SO3pcun1ItnzvTxNG7s2khzSZDniijVk
         OagCzA7TVUXmIp5h7UKI3qYOVU5A6CihW2mbT5RONLspRZwY7a6BUODrNqQITyPm/WvF
         f0q10ImEjKcjIUcEnwYzqGfwFuldMpxw25+xYL0eCkyrWam6jLiP+ZSpM4nPj5z510Y7
         6QCi/GxSojvrPlSrmuL8bjYtInXVtxpIEnG72siKKMBDEHbIkGMJr2DTBdCPKcJx07a1
         0tWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698746796; x=1699351596;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DzncjTyuGFW5TKPcprBNQRe7Jwt07iBenfFhkZIrVrM=;
        b=RxWzo/sfF1b0j2m4NKvxJwzFkE+5iLVqSiApJtLTDNtVWgk3enZgJFgMN6Pff4eaxC
         7pqak8nsGdbiBkDTYPuioJBa1I/0mZDsWGD61me8wjY3gqA/HbAtw0d1+uxmGBhQCxaH
         MsMontm2IbWbZ4hv2zVh4vYNY93mfUbSZA+c79djrIOHaB9hHjxhQnkn6uCwaKALa2/D
         mexNXysYtEiaV0dSoBBV0ObkGQVVlMyEZU5jFe6L+3Tj3B8cgtJ4afYS2vw0u28EcdmJ
         XDW59TvJizxJwUL0irYCu5G2xnPOnw0YDjcRzRz2gE7wwrjqJP7d7ESw4FX8bM9fBhyl
         9wqQ==
X-Gm-Message-State: AOJu0YyiuYxneQSqBS70czmIydpIULOkcu4wjvtQa8zbX9Zq8qGNKZXo
	V5Mg9GAKMPvD4vJ6ygq55xA=
X-Google-Smtp-Source: AGHT+IHRjDMYkqOd3qJtLBi0MoLRPYC0gpzUeVuvD6bBYVu2w1cw0Vz41r9oCptSvIjdYN3h/jjr8g==
X-Received: by 2002:aa7:904e:0:b0:6c2:cf23:3e25 with SMTP id n14-20020aa7904e000000b006c2cf233e25mr5158pfo.0.1698746796214;
        Tue, 31 Oct 2023 03:06:36 -0700 (PDT)
Received: from localhost.localdomain ([129.41.59.5])
        by smtp.gmail.com with ESMTPSA id gx26-20020a056a001e1a00b0065a1b05193asm915719pfb.185.2023.10.31.03.06.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Oct 2023 03:06:35 -0700 (PDT)
From: Rohit Chavan <roheetchavan@gmail.com>
To: Martyn Welch <martyn@welchs.me.uk>,
	Manohar Vanga <manohar.vanga@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: Rohit Chavan <roheetchavan@gmail.com>
Subject: [PATCH] staging: vme_user: Added blank line after declarations
Date: Tue, 31 Oct 2023 10:06:10 +0000
Message-Id: <20231031100610.5394-1-roheetchavan@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes below warning reported by checkpatch.
WARNING: Missing a blank line after declarations

Signed-off-by: Rohit Chavan <roheetchavan@gmail.com>
---
 drivers/staging/vme_user/vme_fake.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/vme_user/vme_fake.c b/drivers/staging/vme_user/vme_fake.c
index 7f84d1c86f29..c4acc010c37b 100644
--- a/drivers/staging/vme_user/vme_fake.c
+++ b/drivers/staging/vme_user/vme_fake.c
@@ -67,6 +67,7 @@ struct fake_driver {
 	unsigned long long lm_base;
 	u32 lm_aspace;
 	u32 lm_cycle;
+
 	void (*lm_callback[4])(void *);
 	void *lm_data[4];
 	struct tasklet_struct int_tasklet;
--
2.34.1

