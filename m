Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23CA41531DB
	for <linux-staging@lists.linux.dev>; Mon, 14 Oct 2024 07:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728892763; cv=none; b=QZdvDtAqzRoEKwEfh/exvkJQmzrjjKDLvKnj/wF/izkNWH5+Kg97nz3jqSUNNagXnGNdFs3S4s8BKRehCwgCsKPBNqZbs7qDw3o0ieYXR5230AP2NuDOuTwznZ34VA+sf/LOpi+58ndfKTSG0L98RDkQo1v+jhhiWaGoMEVU6sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728892763; c=relaxed/simple;
	bh=upgrwTvo7xO8WX12+oZnlIX+0zS10YgOPfhzCNsxdL4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JysP9vDU4V7WlewwxbqSRu12L1DfQmETjYOs07LiRpK1ewOvZ097tuhc97pAyReShw9iv+uLQeDSHCDauf9ydXSWL390rRwrJZIH4uN0znqbQjIWvzu4F8nAsHBxsv50x3rvvqE81qHkV7nrmgnEf68o65pemHS7tdfmWtN1Ld8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GnPSDf0f; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GnPSDf0f"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-20c714cd9c8so29772905ad.0
        for <linux-staging@lists.linux.dev>; Mon, 14 Oct 2024 00:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728892760; x=1729497560; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rITiXOpgMIOgb0l4pa06zrGp6TC0ZBdEjqCWpggTjmc=;
        b=GnPSDf0fuUZ8BU5cktIEsMFVYukrlaKbw2fRPd/6m6Nj6JGAqQ8ANDTprUqSnYmd3/
         qpyhbrrnK+HZGeJUi7wJY+wFa2cgfmB5HQjuBrHWtE4RI/Sqz9zz7U4pg3z/AaF66IVd
         0CzgnHLql1KjKknS4ZFbyp82AFxgaHAFaHs+BI6HAIh3rND/2vXYgUPaSE/dFQbHrHE8
         0rY5Mo1qqfjnDPhyOhihUVsZQvjx4n3KIt56BWb8AcPP0x+8OqAh2ZJ4GtmTkZS1Kmea
         5MSaJlrEDXR6H8Dvk9Qh2jFQQW6fXmSzvWOFkBND+Ey/9/M8YtjGCKrOhNeVtvDC6Yz4
         HOFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728892760; x=1729497560;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rITiXOpgMIOgb0l4pa06zrGp6TC0ZBdEjqCWpggTjmc=;
        b=NzBBMp/y+7GUbOk2lbJuSzZ6DB+lcUipuRKAKfUZMSPfc85WwXNjZHNkR/syiZ01SV
         nvQNKdcDQZuWzkbqMJz1e/X+G98g/q4BY2dR9SCXc0B+hPa82DsdbddMsnL9OHETEazs
         Le0BbRXUgWzeatjYSjG+nmBKGEFRE9h80x5Ld1he+SPtvSrpPK3DNGFireBetVM7H1EU
         ud36RvCdttR+jNfEtkErpBChNIZhv8D0FBD1+dikBUPPLs+vYga9CEQ34GcenU4CnPJC
         OzVtZvoBIPyUHQe1TcmCM2v3mbtTEE4Ki23KUH9k5k+b5prgA/97Aj9ZfnRunoUye0IO
         rSUA==
X-Forwarded-Encrypted: i=1; AJvYcCXr9EoJJkUCK5J6IQ8NdSU9HaLOzrEpDT1KFGgTZBWN84NXkg0vcalKPzpDIY3iCH7hERbfAWmpV9tVrz58@lists.linux.dev
X-Gm-Message-State: AOJu0YzzAPI9jWdmgXZ83ixKRaaeMmwmSzFwKz7Q2fEKcp0xtv4JXmTZ
	q0CM+xFStUyDVavUkm6Po+jhkJLrNzuN+f8IKrwZutTnNzQF5hpA
X-Google-Smtp-Source: AGHT+IEqRspu7jOjsn6zm0jDrQMHpP/fh42hMbjigYXyF2deDDOlnLbWLfey54h1ShErqj1Bp8UU8g==
X-Received: by 2002:a17:902:ccca:b0:20c:5c13:732e with SMTP id d9443c01a7336-20cbb22ee88mr134925725ad.38.1728892760196;
        Mon, 14 Oct 2024 00:59:20 -0700 (PDT)
Received: from dev.. ([129.41.59.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c8c31c3acsm60738035ad.236.2024.10.14.00.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 00:59:19 -0700 (PDT)
From: Rohit Chavan <roheetchavan@gmail.com>
To: Dave Penkler <dpenkler@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Rohit Chavan <roheetchavan@gmail.com>
Subject: [PATCH] staging: gpib: Replace kmalloc/memset with kzalloc for zero initialization.
Date: Mon, 14 Oct 2024 13:29:07 +0530
Message-Id: <20241014075907.1571439-1-roheetchavan@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch updates the GPIB driver code by replacing the use of kmalloc
followed by memset with kzalloc. This change simplifies the memory
allocation process by ensuring that the allocated memory is zero-initialized
in a single call, improving code readability and reducing the potential for
errors related to uninitialized memory.

Signed-off-by: Rohit Chavan <roheetchavan@gmail.com>
---
 drivers/staging/gpib/agilent_82350b/agilent_82350b.c | 3 +--
 drivers/staging/gpib/cb7210/cb7210.c                 | 3 +--
 drivers/staging/gpib/gpio/gpib_bitbang.c             | 3 +--
 drivers/staging/gpib/hp_82335/hp82335.c              | 3 +--
 drivers/staging/gpib/hp_82341/hp_82341.c             | 3 +--
 drivers/staging/gpib/ines/ines_gpib.c                | 3 +--
 drivers/staging/gpib/tnt4882/tnt4882_gpib.c          | 3 +--
 7 files changed, 7 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
index 1296db4d47c6..cff555447ee9 100644
--- a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
+++ b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
@@ -518,10 +518,9 @@ void agilent_82350b_return_to_local(gpib_board_t *board)
 int agilent_82350b_allocate_private(gpib_board_t *board)
 
 {
-	board->private_data = kmalloc(sizeof(struct agilent_82350b_priv), GFP_KERNEL);
+	board->private_data = kzalloc(sizeof(struct agilent_82350b_priv), GFP_KERNEL);
 	if (!board->private_data)
 		return -ENOMEM;
-	memset(board->private_data, 0, sizeof(struct agilent_82350b_priv));
 	return 0;
 }
 
diff --git a/drivers/staging/gpib/cb7210/cb7210.c b/drivers/staging/gpib/cb7210/cb7210.c
index 59f6dde3d966..d32576c21988 100644
--- a/drivers/staging/gpib/cb7210/cb7210.c
+++ b/drivers/staging/gpib/cb7210/cb7210.c
@@ -1199,10 +1199,9 @@ static int cb_gpib_probe(struct pcmcia_device *link)
 	DEBUG(0, "%s(0x%p)\n", __func__, link);
 
 	/* Allocate space for private device-specific data */
-	info = kmalloc(sizeof(*info), GFP_KERNEL);
+	info = kzalloc(sizeof(*info), GFP_KERNEL);
 	if (!info)
 		return -ENOMEM;
-	memset(info, 0, sizeof(*info));
 
 	info->p_dev = link;
 	link->priv = info;
diff --git a/drivers/staging/gpib/gpio/gpib_bitbang.c b/drivers/staging/gpib/gpio/gpib_bitbang.c
index 81a952beee0d..847e4bea2cb1 100644
--- a/drivers/staging/gpib/gpio/gpib_bitbang.c
+++ b/drivers/staging/gpib/gpio/gpib_bitbang.c
@@ -1105,10 +1105,9 @@ static int bb_line_status(const gpib_board_t *board)
 
 static int allocate_private(gpib_board_t *board)
 {
-	board->private_data = kmalloc(sizeof(struct bb_priv), GFP_KERNEL);
+	board->private_data = kzalloc(sizeof(struct bb_priv), GFP_KERNEL);
 	if (!board->private_data)
 		return -1;
-	memset(board->private_data, 0, sizeof(struct bb_priv));
 	return 0;
 }
 
diff --git a/drivers/staging/gpib/hp_82335/hp82335.c b/drivers/staging/gpib/hp_82335/hp82335.c
index 4e277997684b..cf92fc0b3337 100644
--- a/drivers/staging/gpib/hp_82335/hp82335.c
+++ b/drivers/staging/gpib/hp_82335/hp82335.c
@@ -201,10 +201,9 @@ return_to_local : hp82335_return_to_local,
 
 int hp82335_allocate_private(gpib_board_t *board)
 {
-	board->private_data = kmalloc(sizeof(struct hp82335_priv), GFP_KERNEL);
+	board->private_data = kzalloc(sizeof(struct hp82335_priv), GFP_KERNEL);
 	if (!board->private_data)
 		return -1;
-	memset(board->private_data, 0, sizeof(struct hp82335_priv));
 	return 0;
 }
 
diff --git a/drivers/staging/gpib/hp_82341/hp_82341.c b/drivers/staging/gpib/hp_82341/hp_82341.c
index d37dd8335523..8ad1c885a9fb 100644
--- a/drivers/staging/gpib/hp_82341/hp_82341.c
+++ b/drivers/staging/gpib/hp_82341/hp_82341.c
@@ -459,10 +459,9 @@ return_to_local : hp_82341_return_to_local,
 
 int hp_82341_allocate_private(gpib_board_t *board)
 {
-	board->private_data = kmalloc(sizeof(struct hp_82341_priv), GFP_KERNEL);
+	board->private_data = kzalloc(sizeof(struct hp_82341_priv), GFP_KERNEL);
 	if (!board->private_data)
 		return -ENOMEM;
-	memset(board->private_data, 0, sizeof(struct hp_82341_priv));
 	return 0;
 }
 
diff --git a/drivers/staging/gpib/ines/ines_gpib.c b/drivers/staging/gpib/ines/ines_gpib.c
index 9dbbdb048b9f..87f9d3789c5f 100644
--- a/drivers/staging/gpib/ines/ines_gpib.c
+++ b/drivers/staging/gpib/ines/ines_gpib.c
@@ -1063,10 +1063,9 @@ static int ines_gpib_probe(struct pcmcia_device *link)
 	DEBUG(0, "%s(0x%p)\n", __func__ link);
 
 	/* Allocate space for private device-specific data */
-	info = kmalloc(sizeof(*info), GFP_KERNEL);
+	info = kzalloc(sizeof(*info), GFP_KERNEL);
 	if (!info)
 		return -ENOMEM;
-	memset(info, 0, sizeof(*info));
 
 	info->p_dev = link;
 	link->priv = info;
diff --git a/drivers/staging/gpib/tnt4882/tnt4882_gpib.c b/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
index ef4b9ce36741..0a850926c118 100644
--- a/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
+++ b/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
@@ -1644,10 +1644,9 @@ static int ni_gpib_probe(struct pcmcia_device *link)
 	DEBUG(0, "%s(0x%p)\n", __func__, link);
 
 	/* Allocate space for private device-specific data */
-	info = kmalloc(sizeof(*info), GFP_KERNEL);
+	info = kzalloc(sizeof(*info), GFP_KERNEL);
 	if (!info)
 		return -ENOMEM;
-	memset(info, 0, sizeof(*info));
 
 	info->p_dev = link;
 	link->priv = info;
-- 
2.34.1

