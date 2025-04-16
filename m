Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB781F8937
	for <linux-staging@lists.linux.dev>; Wed, 16 Apr 2025 20:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744836131; cv=none; b=qii3F11Tf6A5rgs4nDpRWE2M8v3cuAFOoU5DJ4lVBcUqdb2YdclWzKR3n8eyalD87vlVn8SR0ZsJdV+1Q6OXDv7TAcdsC70a+HuqLaiBeVimuAsBKdFMfx7h4Y1gt31pmEIhI/OBqRZkkRWQtnawRhAhDlrqE78wOmFblTAeQ4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744836131; c=relaxed/simple;
	bh=TRUv0Lx9qIYRkHYXYiephf2tTbsRuyIpmQ7XTHKKyrU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aH4eXrGuilNS/hlpUE43ExZBKTB2z31zjfoo+PInSFFXpYcULa///9B2du8W1rSKubWzW4GpKqQizvmBPbb1qwegKf9pf9AU3nbancKyyb8nN7wOuPHSD+GlB3FzUrUBHUgPEtwi1hWuRIBIr4ZOV1KMHGi8YV4BU3nCMVef1HA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=c4kYW82a; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="c4kYW82a"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2279915e06eso1194085ad.1
        for <linux-staging@lists.linux.dev>; Wed, 16 Apr 2025 13:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744836130; x=1745440930; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dsbToqR2eAba/23hpGloCvJcl86xogM+KUwP2i6K5Dw=;
        b=c4kYW82aCQdAJbMOENNOIaKpf2exKAy2vm5G0J9mJP4DMzkm6Gi8SpKfkRLIGHJ/K4
         rRNgazL0n0mX5wI7SPNJBUUezieO2o7nfVULkboRIhTMraUHhPnyEPxqelb7K2REe70R
         9OxdQHthKY3nC1gtIXg+/G252nxhxFeQD2GgCTHHN8tQG0fWhtp/pKCsz5wUA7xJ9yfq
         WJlcIATLOhWZvdnhJsYZ4TemC6y0ni18PlkBJxQP09eYALJv1CZKklrqJbzZ70oI0w+y
         8iFNcEw6Xh7C/1BGNeddCSPRkFwE+yrEHZAL7dO0PK3ZrkvRUT3+jrV0U/Wuww+A/oKu
         8aVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744836130; x=1745440930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dsbToqR2eAba/23hpGloCvJcl86xogM+KUwP2i6K5Dw=;
        b=b0dwKM9I9sjiCtL2nDraOfQ412yHybIu0GFCpZ8wGqmPYoRzzQAArzjYnfXUHvgsej
         W+SwfcjniLTbNsm6XLVqUUToXyumyenAy1wIDMQubJVv2GV40CGaDnv5qjtk83QyDWIe
         iO1ZnIlDa5CFiXsCXH27s+bLxoON/yiF5o+YuypEWRtQIQCPijLxWhPXhU0F8Wfbf063
         9U9UbduAkvLe2Ns/xVx1B9lvIpXj80vAua/R0fPDMrMNKCqWnYv5CMKWTwS+Mk3kgAun
         RAv7cSwnXvoWYtxF1o+So28ElZmo6+ccIlOmgr63JriyxEcyAglXsfH3uuyigjwcelGE
         6I7w==
X-Gm-Message-State: AOJu0Yy7U7j0swEWq/D3n45SlYgG53wKNdZe2KvergQJBYZ4mrqWlsdf
	Uytpyj72T8lNoJ8GpA6wb+H/0Z/cxpUvm6PvFZ39W2DYm4Ei9K/tGUBc0DQo0Q==
X-Gm-Gg: ASbGncv6vLW+DVDmTOtK2Zvcfwv0jkST1jxw+hTT+NAshauzIe1bUBEsGXSloSU0p1S
	V3nYUJ5BdQStCsxJzy58/2mYmeVoxlQcwx3IiaN8dUq2ww3Uze982Cv1ua+e0+HKsdO7/immKoB
	b60yZDnjXVn1+LyrK02Hk8Ln/u/TbpTNoDCVty8vTx9+1B8QAEbQWeMYsTQoqWHHScjTAAByLQo
	wWE2ezrHJhttVQdv9w9M/ljEF/QZnYMsyiQHQdOphOZDmqCi9nhOpUyaYSAKlxg8VdVAvzVcU5G
	CCPderCZJ7Yrj4L8q9iFuM/8z+KdAe5hJ2j/GBvGqgRK5K1/8Jq5YdZJRO+b/agvbjwuzXz6StY
	6vVqNng==
X-Google-Smtp-Source: AGHT+IFchMugIT2n9/0iO9Fu/n4Z213xFLKHBSZJPWGuKhQ/ZsCoXn/li8GCNELI2QxNen8CwXI5Ag==
X-Received: by 2002:a17:902:cec5:b0:21f:61a9:be7d with SMTP id d9443c01a7336-22c35983aa0mr41389005ad.49.1744836129830;
        Wed, 16 Apr 2025 13:42:09 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd219894bsm10934022b3a.34.2025.04.16.13.42.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 13:42:09 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v2 02/18] staging: gpib: agilent_82350b: gpib_interface
Date: Wed, 16 Apr 2025 20:41:48 +0000
Message-ID: <20250416204204.8009-3-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250416204204.8009-1-matchstick@neverthere.org>
References: <20250416204204.8009-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style for struct gpib_interface.

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/agilent_82350b/agilent_82350b.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
index 97717afbb214..901f7182502b 100644
--- a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
+++ b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
@@ -773,7 +773,7 @@ static void agilent_82350b_detach(struct gpib_board *board)
 	agilent_82350b_free_private(board);
 }
 
-static gpib_interface_t agilent_82350b_unaccel_interface = {
+static struct gpib_interface agilent_82350b_unaccel_interface = {
 	.name = "agilent_82350b_unaccel",
 	.attach = agilent_82350b_unaccel_attach,
 	.detach = agilent_82350b_detach,
@@ -801,7 +801,7 @@ static gpib_interface_t agilent_82350b_unaccel_interface = {
 	.return_to_local = agilent_82350b_return_to_local,
 };
 
-static gpib_interface_t agilent_82350b_interface = {
+static struct gpib_interface agilent_82350b_interface = {
 	.name = "agilent_82350b",
 	.attach = agilent_82350b_accel_attach,
 	.detach = agilent_82350b_detach,
-- 
2.43.0

