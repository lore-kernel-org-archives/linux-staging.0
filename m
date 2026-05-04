Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C633D905D
	for <linux-staging@lists.linux.dev>; Mon,  4 May 2026 14:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777904904; cv=none; b=mqA3xjIHx4CaOTdquf3hpSLPvsmIUFDMEPdEdaQVNGFkTZegVp5//qn3wx0CushX6kNX2uFwR30aaMolOqzYJA7Yak39h4BW1HN50WnhpBMuo7G/EQUcfvLXCQ+Te9jJiE3vHSLhFa4Cwp5C91Z4pZiqDE5kKeKtgqpk7xaV7R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777904904; c=relaxed/simple;
	bh=+HTu2H0US9VsW+r2s/rP+oT2ZhattAOsQCF2rEe1SPM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=N4SmMC6aLzjZmHVfXxrqt9OQSvbUZPDyahAGB1lRm5XVT0BjZfCq6wZa62Q5RKwUE9jxihXIFyrED0046gLN4bnE2c5jrBqPYJK1duPsMdFzQjd/QK+EaN+vw2FJL8W8N3QW1EV54lMzzHLukEJiUVRJU+M1GVXZf3jcwaaf+O8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qo6c7N3m; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qo6c7N3m"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ad4d639db3so17997975ad.0
        for <linux-staging@lists.linux.dev>; Mon, 04 May 2026 07:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777904902; x=1778509702; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QywUMqi6cy4LsxnMr5eUqNEObI5pzzZnt3BiurTOG/0=;
        b=Qo6c7N3m27D4jrwNVDDRl30XZ/Ec3dewl8XxyVETeC80MyvALZ6s49mSJOMgx12WQ3
         iOwgUr0fX9QeQqg69elH6sucPTEzAH0p5m2FVN/0g+8zvlFP5BJd/+pzzyFwkaj1U5hE
         SeVPDWGjA9zJ9e/GeZ008TmL9X+AhpVgiMEMaMGIYzxcgoC7NbNrbIES6qWXFwUTwrt4
         5w/qG+mrC91XjPYMjUBFKE6vMor3+2BOvxZtq5CaP6O5g2JMldHof8nYOjngzBggFWC/
         5ehgwtEpHeZOZmMP0Mor7cgCTO2HdiqrLDtGvwsMQSh6kgCGYBM5sZ9fKnwcywZ3uD9X
         PA5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777904902; x=1778509702;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QywUMqi6cy4LsxnMr5eUqNEObI5pzzZnt3BiurTOG/0=;
        b=hrRfx2a/NftSQpeOF9gZsr2I0ch850D9aXDACGAXm2oH4s4nvN+eoO6SyhxirW1Epv
         3ehZjhTgN9LC1JD4bJDqBoEooiN2Ycw2RIpvWNtehi2GRuOIzdRIHVzq8kQnw+b2U04C
         ub0xPqvzgyGP3uFy3sJZD1AdJG7WNjeSJUmhNBpJBPsEMeimoSRr1z61Clx+zO62WZvM
         UK/lAWTm6CIA4exPA33KjJLP2qozk+01Z6UEMaN5N74gCxkSnZ3yDBB3yD1a0+xqDM3F
         GM+ISxDTNFIy5NLQmFvJVTZFG5TSSWSbed9hBoKpFj5PJ26Cyie/MlfaSqHVLEJqqmxG
         KM4g==
X-Gm-Message-State: AOJu0YxYzpdXobSaiD8ee3v54+MzKsheygZjbxTJM/wG2Ef5dfxEhz3M
	hbYMq5EAQp/RUn9pk+Bres6oTXwnNebYIkU/zL05yeaetGgkrkk5+WTb
X-Gm-Gg: AeBDievaJrRc5q11r3tb6e3yIurf/GZMO4R13ta9l76KVdpJazbUy/Nng7l+CtrL+bH
	cidURc961Q18I4ZWBosA0KHOUeZYjGWB75oTdWBcdjFQqaOOLsiRmIprDN7pvfjBpC5j3fypcCr
	1va1TUdKUwRWhjKFoWCMmGuUYE3Z4zrK9TPZ1JGmZ/Zvz1fIIEzGUwdd9JFIgg6UB0Qgi0EjDyX
	v3q0gUN6PhTY5WBwJNQ7/qxmMopc49H/+Fu49I2J3pkNBmGDhkHvf5VtdMv8NTRiewowFSeFwrg
	p+fVre9gbBUdgJMOxKRQHteIjqK1e8xZlFHmchdhyAw5QXH5hMmcbd0BiMB5gfUfr01LQeAx3bw
	js9EgtKqQAd1hjMDZuUFeWc1U4YyL5cdpLqDTorompOxhzgKlkT353ICAgEU1ASrT3Lg408gJOG
	e5zoNLRgEZqU+qOCYAoTgz8JbxMXfpIPwPVgiaJwx/kPbGNSIF3eaLEw==
X-Received: by 2002:a17:902:cf4c:b0:2ba:307:4577 with SMTP id d9443c01a7336-2ba03074751mr74474725ad.2.1777904902077;
        Mon, 04 May 2026 07:28:22 -0700 (PDT)
Received: from moksh-Nitro-ANV15-51.. ([202.148.63.80])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9cae59f57sm105468605ad.77.2026.05.04.07.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 07:28:21 -0700 (PDT)
From: Moksh Panicker <mokshpanicker.7@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Moksh Panicker <mokshpanicker.7@gmail.com>
Subject: [PATCH v1 0/3]  staging: rtl8723bs: misc cleanup patches
Date: Mon,  4 May 2026 14:28:09 +0000
Message-Id: <20260504142812.21964-1-mokshpanicker.7@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series contains three small cleanup patches for the rtl8723bs
staging driver, fixing checkpatch.pl warnings.

Moksh Panicker (3):
  staging: rtl8723bs: Remove unnecessary braces in rtl8723bs_xmit.c
  staging: rtl8723bs: Remove commented-out dead code in hal_btcoex.c
  staging: rtl8723bs: remove blank line after open brace in hal_com.c

 drivers/staging/rtl8723bs/hal/hal_btcoex.c     | 3 ---
 drivers/staging/rtl8723bs/hal/hal_com.c        | 1 -
 drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c | 4 ++--
 3 files changed, 2 insertions(+), 6 deletions(-)

-- 
2.34.1

