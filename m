Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 373FF762F7
	for <linux-staging@lists.linux.dev>; Mon, 14 Oct 2024 06:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728885900; cv=none; b=WXVpwfEQLllZvOwwN2ZsUBDnt7W9k65SkHB4OsCuTb8VHFo+hzy714VMiZ9vQgIo38R4L4eBtttIaaR5TETwZjkVZyNnhqfTFg7Tp2zCkhP76bd4x/i9L0aI07m9FMLAOm/Fy/BNzEFBzxgXSGxE8R9q3tNvm4tC4pAwwKw0Gko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728885900; c=relaxed/simple;
	bh=znU59uJgP8/aTBB3ZXAKZBYoSiO4aYtb8EgLLo83IsA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nDfW37aDl27b2k56w1tuQADBmL3iVn1lyyCIZi+AXr+rNzu8KAM5zs7iFt1AtMcz3SkocLAaOT1zuWx/INXWBp5cuJ4Rr6C1qL2ck1mtiiGieX9/VfpEQaSmyDBXZCFNvLllnJBPKez3R99PINLLDeBnBDyO3GTfsB5QOhaO5GE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z3+gR+Kw; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z3+gR+Kw"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2e2a97c2681so2797525a91.2
        for <linux-staging@lists.linux.dev>; Sun, 13 Oct 2024 23:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728885898; x=1729490698; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hj7nzagu+uMKvRlSwKyqT4g1m+IqUs/iPZmR2zWRGQE=;
        b=Z3+gR+KwdPBj0EXhXl7Fh9t54MA5vMHNz1OrPqcr3yANZ774RrJdK87Vjz69sup5UC
         UllWZ8k/dEpBAB/8Cvd4iQP5gicjo/u0uooDwWdW5fYyuC55Trp6RgjYXLsoZppspJ5l
         6i3//SeljJ2kpHWWgnywOJ7bfpGdaemwJDCYIdGx30y+sOB1/HOAwgB2LckLzP2ioRlU
         FgngjHfzB4gLNE80+r6q7S5CQRI5oUtXT125WQiUs87wrFYTldNtrvvkTi2RK41AhxSs
         O8/tuiqWQjPZxvhjLf6VkBgorbcTRgM4dIadvSnYk1tdvqj5Bwuw5Kfd+dT/a7hqXzsW
         XDiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728885898; x=1729490698;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hj7nzagu+uMKvRlSwKyqT4g1m+IqUs/iPZmR2zWRGQE=;
        b=H9NTeH/AKLVRXKmpSwX4YZBHNgT9jvYHdAOLnaEvgKrjKdAlFx4CeTx4kf70ywqNHA
         TbNiEVpHL8GfU4vD/pMUpF70cmTKgU3M6SgdO4X4lOqTsagA6V4xQlKtHb2fvpT92bl5
         qZxB1fVu/hZMb8D6QgSRVp1l3sr+b4vgvEik4pRXCZAVzReF/PG+9Uc93SBhgJg6w9Hj
         fS64+VsZUIQoqy/bmmgqOmkLdYcYDxJZx9is3tzVJt/I+enX96OzakG8wNQMy5ceXJFd
         9ry6YskaSP4N36Ev22hluV6vzpd/hzSlaYUW8RA/iwVRACke3yfPrTZNNvjV99gNdjVS
         PmPQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7GzxLpb2Gkc7bK2ZbynOvaxjvSnIpMm7I43ZoYZoS+w346mcGxG9CPjKlarb025VjutRwh28937NwL9Ii@lists.linux.dev
X-Gm-Message-State: AOJu0YzwReV0MxwiuWbYmR9dalxHe2EE3wGT8Dynn57qwloVyYCD3lrw
	k+TAEU9X8MeaKlb3N4W3Q7AksYg1SzhgI7OrnbpEh7tykdMUdpRn
X-Google-Smtp-Source: AGHT+IHImB8RQ3XxIX1T6+ZDB20H4WiJeIMtsn6kc5w65W/a9/0ivGhYYBGWkIecouWP/DPTbwITBg==
X-Received: by 2002:a17:90b:1843:b0:2e2:991c:d790 with SMTP id 98e67ed59e1d1-2e2f0a36567mr11475511a91.8.1728885898532;
        Sun, 13 Oct 2024 23:04:58 -0700 (PDT)
Received: from dev.. ([129.41.59.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e2d5fcc759sm7915156a91.57.2024.10.13.23.04.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Oct 2024 23:04:58 -0700 (PDT)
From: Rohit Chavan <roheetchavan@gmail.com>
To: Dave Penkler <dpenkler@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Rohit Chavan <roheetchavan@gmail.com>
Subject: [PATCH] staging: gpib: Replace kmalloc + memset with kzalloc for zero initialization.
Date: Mon, 14 Oct 2024 11:34:30 +0530
Message-Id: <20241014060430.1533329-1-roheetchavan@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This change simplifies memory allocation by using `kzalloc`
for zero-initialization, improving readability and reducing
uninitialized memory errors.


Signed-off-by: Rohit Chavan <roheetchavan@gmail.com>
---
 drivers/staging/gpib/tnt4882/mite.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/gpib/tnt4882/mite.c b/drivers/staging/gpib/tnt4882/mite.c
index adb656a5eb2c..54d80f89195f 100644
--- a/drivers/staging/gpib/tnt4882/mite.c
+++ b/drivers/staging/gpib/tnt4882/mite.c
@@ -57,12 +57,10 @@ void mite_init(void)
 	for (pcidev = pci_get_device(PCI_VENDOR_ID_NATINST, PCI_ANY_ID, NULL);
 		pcidev;
 		pcidev = pci_get_device(PCI_VENDOR_ID_NATINST, PCI_ANY_ID, pcidev)) {
-		mite = kmalloc(sizeof(*mite), GFP_KERNEL);
+		mite = kzalloc(sizeof(*mite), GFP_KERNEL);
 		if (!mite)
 			return;
 
-		memset(mite, 0, sizeof(*mite));
-
 		mite->pcidev = pcidev;
 		pci_dev_get(mite->pcidev);
 		mite->next = mite_devices;
-- 
2.34.1

