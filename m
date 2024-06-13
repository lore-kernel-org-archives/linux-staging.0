Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6CAD149C52
	for <linux-staging@lists.linux.dev>; Thu, 13 Jun 2024 15:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718291863; cv=none; b=jkDHqkYaiRPHsr4L7Wqgjkrh05tZMqtqiBNnOnaJisGG2ocCupRxfQFRQWJyiue/Az8WKAanfuiw+v6I05t8Pq/kaAbihB5+4wnbGAR6PG76hZhAGf7a+utAa1Kn8sSpoMARBfk+LqAl+CjuuXzZMjooljgn+zBJGEJGx6fJMCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718291863; c=relaxed/simple;
	bh=7k4aQBPIY7VXjwledGhr2hpwVjyeNFq1b0YYDaLYpAI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bu+2lqEx0WE82T3pVlc5Fk9J5K+SNfUSZY0n0sAc8ZhMyHR8etjYp5H4N5QTiekpsRCJTd4VmCZ7bFlatHxHx0O7qW6eSPnKPD9WoM7H7Fndv1c5JReZ5YvB+Fr/rX3J6xbJuVclnpgS4032nTEtN5ZOXeTuq9G+yxh1cjeKz2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NTDL0axF; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NTDL0axF"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2eaafda3b5cso13259641fa.3
        for <linux-staging@lists.linux.dev>; Thu, 13 Jun 2024 08:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718291860; x=1718896660; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QOMvYW8v+/gfHgXfZ8t+AJs9E5nzbKnAHaRLNm28O4s=;
        b=NTDL0axFnwtqwfqL0A+UIf5j5zv6AV2rclEpM7IyHRVbepRTz0GaxK3KlbCbK89CEQ
         QQoMmCpgPO6YY5Xg8oAPU5lHf+425ivyAleDHX/4L2+IetHKWWwz0iLRjqMLL6lF/RJK
         Rkg+gQPm0cK62/NXGKCnXv6/uin1LVjJ097YCijW+ltjBn35oT0a3HirLO/Qswuc/KTA
         v1QkDmppmIU8Tb6gqfeh98wiBIS7vV7oNfFy3bHNR6BZaB3qXagwQjpDuy3hR1YdLo+h
         yb3El3SgrZKFvOvkcPtE0MYpiCQlcIX5DTLl8aQWAtYTKjY3561nv61+eI4SDVndjamb
         e7OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718291860; x=1718896660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QOMvYW8v+/gfHgXfZ8t+AJs9E5nzbKnAHaRLNm28O4s=;
        b=dvonMcFqJzulZsC5eC8kZGOmeVAYMrj5VaTS62tzsWN0VDYfTjrenE7BVFA7+iMeC5
         qzYz4Qh2KOQJXmOVe9+qKjpAn+C7SoMah9WiARgnDVeEv3XcNsGPIdPM51wSs/Vie6HN
         MJNyPz5QzSrpauzsQE3eVZrml1Ric4hKrc5hVV7GPB6DLPjs0gvpn+N7IAGwTHrdoRA3
         16l2YbrEJuKK/IRN0u2dpPhC6jFdp4bweHUQk/4X2i53FVSILX/NFVCoUziUvTPpThs0
         O/CdA7ls7FIzelNlXnsY6Hcxhw8Up0Y1hSlHMbLJla4qSHCS6bNYtIdfSPa2knfn2oRK
         Cu8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVXxxsRtvNIJ1zQs7/8BgsasWAVvNdp8DBH9nsFyAppuXLGGVDi5yXcZDnYSTv5yfxl0F2S+HuHy9sI0KTIDO/NcN5kLc3S1Wku22ODqQ==
X-Gm-Message-State: AOJu0YwSO83QPjwdwXSiBdRzmQ6Z1+27FLPgLpr2jU5om9rO5xoHdazc
	Mjqe9ea0dBj3zwGLhDQ6sB+a8aDifBWKTBRIIMhsyEmLGVnrgryu
X-Google-Smtp-Source: AGHT+IGukcD4qlZInGkajgjuT5XG5uaxfEaxrKOdWOsXFTQnXavupB0xwpnPvuzcLBx18FyDlA2TIg==
X-Received: by 2002:a2e:8250:0:b0:2eb:ed3a:9c65 with SMTP id 38308e7fff4ca-2ec0e46e7aamr889691fa.15.1718291859932;
        Thu, 13 Jun 2024 08:17:39 -0700 (PDT)
Received: from localhost.localdomain ([31.120.167.14])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36076515a80sm1856978f8f.76.2024.06.13.08.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 08:17:39 -0700 (PDT)
From: Teddy Engel <engel.teddy@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Teddy Engel <engel.teddy@gmail.com>
Subject: [PATCH 1/6] staging: rtl8192e: Remove unused constant IC_VersionCut_E
Date: Thu, 13 Jun 2024 16:16:32 +0100
Message-Id: <3e3de9ddf37b4c20813c9293b81d0589020266db.1718291024.git.engel.teddy@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1718291024.git.engel.teddy@gmail.com>
References: <cover.1718291024.git.engel.teddy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused constant.

Signed-off-by: Teddy Engel <engel.teddy@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8190P_def.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8190P_def.h b/drivers/staging/rtl8192e/rtl8192e/r8190P_def.h
index 2cab232bbf30..486397d7db84 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8190P_def.h
+++ b/drivers/staging/rtl8192e/rtl8192e/r8190P_def.h
@@ -89,7 +89,6 @@ enum version_8190_loopback {
 };
 
 #define IC_VersionCut_D	0x3
-#define IC_VersionCut_E	0x4
 
 enum rf_optype {
 	RF_OP_By_SW_3wire = 0,
-- 
2.39.2

