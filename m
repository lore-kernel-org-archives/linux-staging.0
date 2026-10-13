Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC6F502567
	for <linux-staging@lists.linux.dev>; Tue, 13 Oct 2026 14:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791901775; cv=none; b=iel7b1wshd9cpLQFoMOuqD5NzVTd+fmXvxPPUdEaviIcCYQYLUkdW8P5oSKGFGGZDdvnoTion88p5XlnxqmIuRjQWhBycjZ3rF5NZWw/RG/Bt88O81vsZoxUyKGDC1dUNBfJ/nMrF3jC8eaAo6NkEqv6l3leR8qGMGeN4xldhRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791901775; c=relaxed/simple;
	bh=+mE7mXs9FSK3OKtza6Zete/g8pAuxQQijr3UMZefDpA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fVlT3mdgdUpcHQCgqajh1BTX2GUAQvOeQeX8Pdr7sEymA9tUR5O9yicc4NBiyj/log50Nx2Rg92BI0+h+SZRK8gIxNIWSDF2FqW5L3t00rnJNJq2hQB6eNaxybGrjjKdNvMSt97sNU4LDa+L3xpRwP1GTq30F8tp5BXtQU2MikY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hB4WsVJL; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hB4WsVJL"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2df8c28a0b1so15024105ad.1
        for <linux-staging@lists.linux.dev>; Tue, 13 Oct 2026 07:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791901774; x=1792506574; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2A8qYWgVmxVZskPAtuBTjYWM8uCy5WAXwZZq8DzcTYU=;
        b=hB4WsVJLGJub351Hp6D8GBCXXSuQ8AzY9L1YvvKtWqMWq9+iZEt8aVGgU7Ru/TFUVg
         D9esWt9Jbe/szHrrv1fzQIDiUGDoHO6UEBuv1X4v2mgTSij4RXhBUw5+HIm3Bxvqr7zS
         e+oKKjVmpThj5MzRenXPn54Gvr5fxLrmIAQjKrWn5jMNZbb6Btb5W8mgRxNFww2AU4Ol
         caz/m0vO0wb5BfcDHzg5mPG6emOmA3Bi6Zni977tZ7S+Mypxqhvre6VJzCmyIeX35s/6
         17LoSsxdXKI8yNSc49xIIL9Jwenu43THCzi84XoYBmi7AxswXXZtKjx8vYAvNeX5xu5/
         7jig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791901774; x=1792506574;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2A8qYWgVmxVZskPAtuBTjYWM8uCy5WAXwZZq8DzcTYU=;
        b=O5Z5LD2QtSIkzwvBXfAkZjiZ8opSbhke4m+dPcPewqmMLcbQR3TLYR7sAPcjDqJ9ST
         teEHaIByczm+M+sCwgQ7CuiCM9Eqt3oP/flfifQNw45AsGkfhaa8DP9U8U3/M5YevqtP
         HRsH34OjqX9JCyt2mh3G3QGi2xv9a2Zpw0EiCslTuoBGdG5mDAwVtF/QHVjekrnsgCFZ
         lzaVn8IgtFhzQ4qX45nWV+C+8uk2xq0dkE+PxT3gVn4xWWycsSEpeuJcgxdetfs7E6x2
         hc8HMbFT6K7CvAN+iBbq9DiYi438TU3Pw7wuKlogQKma5ukgVRn9bzihpLYHoYnJsOUI
         0NOQ==
X-Gm-Message-State: AFq9FYJaWGmCOn3ZyaIiVVBar+Alz5v1YsMJji5WX05PmnJgVfTeIQby
	CqGlo9wGcENJVFZCEjFb7egLgF2Cideo7k6EcGV3kREIcZZ+CDk6L6A=
X-Gm-Gg: AYBFou26FzB94P/GzvJWnydNFlQOYJsVm98ZAdaJlA9wWeOrY2gF27+J+EZLB19qeOz
	rpa9qI6esvF+gbsgFG3XFLZ28mRG7CCnNG2OYARR1Y6MYzpEUlbe+M2a03cL28VA3dc238lqvPe
	8Y6BF7rnWNsWDt8XEO38YF/zZrDcyTx9pKa5zIW5WiUGYIFcm9HIpWH9G8jvqL1n8OCLLpZxklu
	7MyVofZ6LLto/1U85u6bDMvgyZSrQO+oR9Bz2K3U3G2kuNyJ6ozrDYl8S08KkMtGbrR6kMwQ0O4
	208yOUpLZsrJ0eTbZmXx/AgKe+EFeUHGSI3D5r2L1lsGj3d7zu++6QazMjI9/Z0GTywp4fTz3L3
	KNjHjQKHcuqiicWQWkXK3bS/RnpNNxaXPP80GC9WrcBUbqm1ptxvGYkRQE4RyjmzghzyBpLZqS9
	DSbOKVi0zt0XWq5sgerv3x52IOAPB9zwcDcUZxON0RfVi6whmfccn2XPKfskZHHE3OB+CeX6yGd
	QaTAeY5
X-Received: by 2002:a17:902:ce12:b0:2dd:ad73:5b6d with SMTP id d9443c01a7336-2e8429ad1bdmr103140745ad.29.1791901773175;
        Tue, 13 Oct 2026 07:29:33 -0700 (PDT)
Received: from localhost.localdomain ([185.220.238.36])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e84219e519sm58353405ad.25.2026.10.13.07.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 07:29:32 -0700 (PDT)
From: Wang Yibo <szwyb123@gmail.com>
To: Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
	Christian Gromm <christian.gromm@microchip.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mustafa Karamanli <mbarancemkaramanli@gmail.com>
Subject: [PATCH v2] staging: most: fix typo in driver_usage.txt
Date: Tue, 13 Oct 2026 22:29:28 +0800
Message-Id: <20261013142928.443858-1-szwyb123@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a spelling mistake in the ALSA component description of the
application layer section: 'can by used' should be 'can be used'.

The same typo was fixed for the networking and V4L2 sections by
commit b114ef1efc49 ("staging: most: fix typos in driver_usage.txt"),
but this third occurrence was missed.

Signed-off-by: Wang Yibo <szwyb123@gmail.com>
---
v2:
 - Fix the author name in From: and Signed-off-by: (use the full name
   instead of the nickname), as requested by the patch bot.  The diff
   itself is unchanged.
 drivers/staging/most/Documentation/driver_usage.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/most/Documentation/driver_usage.txt b/drivers/staging/most/Documentation/driver_usage.txt
index f1b6977f4543..32a2e5ecb48b 100644
--- a/drivers/staging/most/Documentation/driver_usage.txt
+++ b/drivers/staging/most/Documentation/driver_usage.txt
@@ -109,7 +109,7 @@ following components are available
 	   driver via the V4L subsystem.
 
 	4) Advanced Linux Sound Architecture (ALSA)
-	   Standard sound applications (e.g. aplay, arecord, audacity) can by
+	   Standard sound applications (e.g. aplay, arecord, audacity) can be
 	   used to access the driver via the ALSA subsystem.
 
 
-- 
2.25.1

