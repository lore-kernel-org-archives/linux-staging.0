Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F464168493
	for <linux-staging@lists.linux.dev>; Tue, 30 Jul 2024 06:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722322755; cv=none; b=dPwWlIZgSoN2VhGpnaO8JKBo/pWuEuwKVPaLcqqOPUP/toTsKzxHbDR+CcZCy3bivG9nkVZG++7cyaCDDdA+0n+vHXa9NtqbbKULiCgAoahiDE044ttpN9Y24PYfQ8Vl7fKjQEoejNsbo/Fl5Cbbri7sEmKK3zfkl1pIGUKGQ64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722322755; c=relaxed/simple;
	bh=aOINiKi8h9bi8olxYJIxv55XJ4wLBEoWJa6Rw/bhqIY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=twC0GLSwKuCjk+tBpsvKu5JjvA/C2Cs0hC5juAnuUI4M1dGt9qt84EdKUyw5VRP+aRkegUBUhbG/oyLXfwW4Ix+5sb+9PTLVVtoQpmbTuyrRm0zY9Ggg5aRGJBJyxKKXys1PhCgHBwsmt8lM0bxdFTkgtsAa02KvZVD3D4+dRYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AKPgdjJd; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AKPgdjJd"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1fc5239faebso24855915ad.1
        for <linux-staging@lists.linux.dev>; Mon, 29 Jul 2024 23:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722322754; x=1722927554; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BRZxFFJxsWDQZRh+bmJi1OBc9hBJcJtDXXsB0kvWwMM=;
        b=AKPgdjJd0Dis0lMsJ3o5cG+fpZdw12Rs9pz15JR7KOXlAVwm+pU/GLybECsmRPzlmI
         7G7GoFy3cA3rv0opaxuFrYciEKzS1n0OivfDCjxDgeIZ3j5CJ3Vx6szt2p/j84F/1SJ+
         yMjrFx7W+dku2P5/C9uYiieu8msV0EnkaNB1jiTd7ytoiCQK4gIW6PvfJWb8Bt0iAd57
         tD38RDv6WHdYt5ar91BM0hYKm2aTIbMz6Wyc9DuQ/J/XMsqEbzxQJK9bh+t5R4eYSetK
         7/cUf/and4ipPOoGyU9Sni6+TwQJM+uJzqB2mkoG+VsTyfDUH4vl815SmoUEHNU/Gtdo
         kE0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722322754; x=1722927554;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BRZxFFJxsWDQZRh+bmJi1OBc9hBJcJtDXXsB0kvWwMM=;
        b=Er6qDvHpBrGRAkR5O+c/cQp/qptdrM8pskPlN3GuoT76qQ9m8brW3T8why/zp1A0Ju
         OfkVYLY/gqiqc+dwP+nLONNQq8S15aU+z23XqIL/4AuDHPiKJCeLSgsOpOpZVeLMlqWP
         khQTKzug6lPlD081sfXY/kxYE1ieuD7xioA1ZM27as8VLM5vzac3mroO96RoIjmZm6eB
         cyovAelU+AdHhsUP5ZAvnB460/kKdyi1Qm7h8yKLYEl8hWKsK0VIzEw88BIAWtOSyEQ5
         Xvmofd5cb+pXIX4WoLhrUvGmbGxmGz+l128rGsy9wOkivJw2NykTEnMyS/e/jmhegfvC
         RQBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNpQoiSIw26B6KAINZeLNBFLiVj3v9Y+q6xoOLhWcchlfaO5nHq1Hz2Sr08ZM1q2aylRXLituyaoivtLvBhvHf7JqdWc63CVpbVBxGtw==
X-Gm-Message-State: AOJu0YyT8W7GT/q4SucMMHIpzf+kF4oriirUTfvmgFd59KeJ7973wwZi
	TmwimoYjrafW4TON5nf6DXdx+Ue4wq/22sFkGwMR/d7aCZ5jY2SSaElZn5MHieA=
X-Google-Smtp-Source: AGHT+IFlkzD18e53lfpx2YGQDksypAKMBrVfclfV1BiDSbW2j7Wy3xsFQ1mMR/7wvPWF2e0Fp4yNJw==
X-Received: by 2002:a17:902:f681:b0:1fb:973f:87f with SMTP id d9443c01a7336-1ff048e1b5emr83515545ad.45.1722322753576;
        Mon, 29 Jul 2024 23:59:13 -0700 (PDT)
Received: from 3a25d514abef.debconf24.debconf.org ([116.89.172.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7fc9cc0sm94075425ad.279.2024.07.29.23.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 23:59:13 -0700 (PDT)
From: Sai Sree Kartheek Adivi <sskartheekadivi@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: ~lkcamp/patches@lists.sr.ht,
	helen.koike@collabora.com
Subject: [PATCH v2] staging: rtl8723bs: style fix open brace on new line
Date: Tue, 30 Jul 2024 06:59:01 +0000
Message-Id: <20240730065901.35254-1-sskartheekadivi@gmail.com>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It fixes the following checkpatch.pl error
"ERROR: that open brace { should be on the previous line" and avoids the
warning "WARNING: braces {} are not necessary for single statement blocks".

Signed-off-by: Sai Sree Kartheek Adivi <sskartheekadivi@gmail.com>
---
Updated the commit message.
This is my first contribution. Hope I did everything right!

 drivers/staging/rtl8723bs/include/osdep_service.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/osdep_service.h b/drivers/staging/rtl8723bs/include/osdep_service.h
index cf96b5f7a..5629123cd 100644
--- a/drivers/staging/rtl8723bs/include/osdep_service.h
+++ b/drivers/staging/rtl8723bs/include/osdep_service.h
@@ -81,9 +81,7 @@ static inline void thread_enter(char *name)
 static inline void flush_signals_thread(void)
 {
 	if (signal_pending(current))
-	{
 		flush_signals(current);
-	}
 }
 
 #define rtw_warn_on(condition) WARN_ON(condition)
-- 
2.20.1

