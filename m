Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A2B198E81
	for <linux-staging@lists.linux.dev>; Thu, 17 Apr 2025 00:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744849973; cv=none; b=nGyW9sdDgyhQb53yXxMzBRcZLsNJk3WCpiy0n8OPnrsCuTEtPJzHiLIXOKi3G1MahHwFjJZqzMFyHIz68iz9Yy+x9dwUzX7Aus8yl3e6hYgmFoFjrcoNnrNeyVe+1ibx21aRDNUmqqyK3ZFPCjk92zFY0mRxbZglHTIyWLWOSSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744849973; c=relaxed/simple;
	bh=TRUv0Lx9qIYRkHYXYiephf2tTbsRuyIpmQ7XTHKKyrU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W+UIpJz1HY3pIgeTYlKengC2ogYLj3QBEGtlc0BvESAL2qpyRDxH8A1s2mipBQLaCXdiLAoveqGUFy6E38P3f3qWhrR2wZEVDoK+iEiN2eD/AZJXLrphcSX84N9yb/4jP9Z2IFRTlBQNiD/ltp/uY04ii9RreI9h7voKcufCRXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=drGlZljd; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="drGlZljd"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-736e52948ebso210196b3a.1
        for <linux-staging@lists.linux.dev>; Wed, 16 Apr 2025 17:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744849971; x=1745454771; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dsbToqR2eAba/23hpGloCvJcl86xogM+KUwP2i6K5Dw=;
        b=drGlZljd37SDU3r+gNzpWEh3ftAU2HId5SYJUbfvyzSIWEdtobdelPdCeUrcHXCvVX
         wLOWND7KPyafiXM2oYORBtIhzrAfTRsXjidrcXX+hY0aKNTevg4IuXpz2q8Dw/gQVVWw
         NcbLrIsGIOGaS0l2DUTjazDkhOgb/zKqX7L7Xp9PGZUjnd/I0YA4v7lAFTQP4TzG7b8x
         /ZCZlfYHG+5ISJH/jQRe1dFqMuL5ua4Th6OUXS6g4wuoLW6vlh93o1SS9cu9EWuW4xHz
         5+M053KsLLWn0ktC/dbEpMFn1f990vK6xsp3K48TVN4BULnzPMErt2RM1ArpRCtODt7F
         sjZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744849971; x=1745454771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dsbToqR2eAba/23hpGloCvJcl86xogM+KUwP2i6K5Dw=;
        b=pqcESwCBcUtxNfLTERavMA40+ujYtiunvT+ACJ5D8kRFrtoe0+EMzXH+7IxswVnDfF
         kmv96QdDAMtSeR6MZdKoQGjRbbJFiu0Pc9v9+aXiBksbrkUsPcAViYsjK+AGrgFaEH0y
         W+G5/f2+TzxHd9/IV5LzY6dmzQE6AXJXfect92QUGZLPM10VZNJzX87IhrKw0dGGMt8b
         X1mqg+DKV0vmnWxsUep5R5GmImIvpnI9GXVsUPV4UK6c4iSzDZkUnNInsd6plJhXi1VI
         IB+1pPS4oblqTCprHoPR5mwW9N5WlHtf42nD+tjY7lIMEZgXePOHM/WVjaLglBLuCSa3
         3t9g==
X-Gm-Message-State: AOJu0YyHEz4cSpkZ+s3SZvK3w/KLobbC714wUveAmxhFWkZLGVM+Vu6O
	a1rSWrKmN/64c5XUTBry4ktKpspyDqKNmq9xRcdfeTmaZjMRzI8sp07N8oDlmw==
X-Gm-Gg: ASbGnctsRZ/mWZNmPe+Bcab09VrprMso36nD9zMN51aS+8cZxeukXBL6XpBx4Cj24dI
	pw+Ql9UgbfpYc4GY4OJzyNCVJTGACRQwsi3Lw5acyOvy2RhlLWIkSgTaEp/4llXNrnwFnMsGaQ1
	hG/O55lAqnHDYSJRb9Qw8OBQAOcBY/jFU7LHz6FIoFEEPnFzZpvCVEVCWkWJJyp7cRwuQOWe+7B
	h8OPD9RR0N33lNF2MVLbZWV8GDCvKpO7Pbu+g7B1r2gJYauRZStIN4u/zigfh/iL4h43d6IzQBl
	ltvGyAxqB8I7k5/Pf3s3MYgZRf6Sr/9o5BLndROgDZkvExU19y+nGyA+WAI4SqmOde8CHi2o6cO
	+K2iGWg==
X-Google-Smtp-Source: AGHT+IEzGyc78qt3I2Ea9h/ua6Bmt+3aTG77DQd6AZy/bfiPA5+q0GqkntNar2iof23jKJEGMNEiZw==
X-Received: by 2002:a05:6a00:aa8d:b0:736:5dc6:a14f with SMTP id d2e1a72fcca58-73c267f5570mr5754297b3a.23.1744849971084;
        Wed, 16 Apr 2025 17:32:51 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b0b2221f01fsm1875561a12.74.2025.04.16.17.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 17:32:50 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v3 02/18] staging: gpib: agilent_82350b: gpib_interface
Date: Thu, 17 Apr 2025 00:32:30 +0000
Message-ID: <20250417003246.84445-3-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250417003246.84445-1-matchstick@neverthere.org>
References: <20250417003246.84445-1-matchstick@neverthere.org>
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

