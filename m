Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E6B22B5A3
	for <linux-staging@lists.linux.dev>; Mon, 17 Feb 2025 19:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739821867; cv=none; b=pfJPJpIAkDSDgQNVDGt1H9TQYM/si3GMq65fYeivjtAS7o6Xhzb1xEDcin0ZEj1k3XGmo5bcRKFX3Vo+UkwB+CfKGoCbAmo3/rfDtv9XFTOPhjEYItdD9TvlJh0QelGBN0Uxgi+B7f5w+a66okOCpd+3CUhY7xqsLwkbkCwR8Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739821867; c=relaxed/simple;
	bh=fvxc2nA5l9IF9nEr97T0t174jPkXXoOp2oMvRCWYwHk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kgmPxOd3VmaoCUZGCwBwDLROiLbs/FVaE524Pg2B0B6CeK/xD5q27N3SoRRHxPybY3Hzmnn05xLPUsRuXA+wzZfkBnQw58oLlL/74QMqDzoTL52CVP1Ivy5ejUNTKwcfuKatpc2NqSz5Tuc/nkCnEtM+Su2pZ4BFo1Z/3/DbTBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B4M8kNRZ; arc=none smtp.client-ip=209.85.214.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B4M8kNRZ"
Received: by mail-pl1-f194.google.com with SMTP id d9443c01a7336-221050f3f00so41506845ad.2
        for <linux-staging@lists.linux.dev>; Mon, 17 Feb 2025 11:51:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739821865; x=1740426665; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yuS0adcc8Fxg+8m6s8u569Uh3Sx/1Cru69GJC1Yskkg=;
        b=B4M8kNRZP4eSteISV5nefqqIK18k6D0s4UzxGT+v6M0dfQmPgwNj0d+Kpho+ceGfhW
         LgHRd9zrXTzwZgVizG2tkNvSjV5wPC5kaRchM6u5gCUj0yBiNVwpTjsfmKdvRAfEUF0f
         50I8U7tpL8n0bG3PDlYBj9f8QsjzGDnk89Xe9qS7y48M6a7WyKRrxts5e0LZOd812SHa
         0FNePN9vmzpgspSgRrqdevAw9zmQtUaoR2/jK6N5R8EdG7Kk3IWYHT/z6UDgvouS2G9b
         +3HRay/vj/AmIhP27isLmNNEpDwWPGFD7UtnnOiqzK4hbUPU+p5GZEEwX7ZCYBJynXP5
         z8tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739821865; x=1740426665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yuS0adcc8Fxg+8m6s8u569Uh3Sx/1Cru69GJC1Yskkg=;
        b=FMSw1r9iAqlfTh3jKQMGxkRscV+xrQndf7n5ucFcThHF8X5rsrLGMExQcgLQ4ocd53
         XjFOc3zPrhRpKxNCUWhMULiXvRe7LUYAkBUaM9lpZGr2e4lLGPE72XJG77c7JEy/52fc
         CYMQrss8B0LxDWX8olZbEZfRvpMH7a1Rbj+otf097yq+4Wdorc8IDu9SVyphoMSGqpgy
         V7x0tp90yS/21JSlxY5aBYF/tapRKy9esepIEXaUdfba4pmWbwukx8uNAVy2pokGOWu5
         D68wvtZltUUmOUdBD9uubfmL8uxM9Oh0tPBq+6cQajq0FB4+PYptt6S3ELcSsG1KD7X7
         8Nhw==
X-Forwarded-Encrypted: i=1; AJvYcCVpzxuF8LSGTMIFBzLe91l6Sp+vlKxNVzpp/6wCjavbRMkwCKKyU8px6153xM5U30YV4Xhl2NS9QymsXtWG@lists.linux.dev
X-Gm-Message-State: AOJu0YwsqxTQPuyZq6oNCdiIk5N/OTl19/ludGl6GESq9xBxI1kqr8zi
	EuDPepfmOWeulxWk+2/6PYS24Lj54O6o0H5O2x4vO3Ce+5gKW3E3
X-Gm-Gg: ASbGncsKJzWsGsw+fBRO3A/GmUDFnF9vr5ANbcD88uK8ksA9TU8s/QnE2LJcvibnhtu
	kQlrs/Bu2Qdabokcfdz6lxXmVDqhJ5YRqhSi86tyFVav3RDxaYGK3IYNRmb/Pb1zsoFqgVh5OGa
	FS/CgqNNx3PtfofQifQMrF2pBGrhwUK+raU77lPMuys0rOqqC0U0xiqkDBqEwZciL0p61ZY3md+
	4Of76e3/3x8AWSC+eX3Xk6xPVdfCMUQcKIOwALnCesEKtLvvjpTa5R84RclDhce4QlNx3EIGNs5
	MBTfDRP+l22NMT1kg91O
X-Google-Smtp-Source: AGHT+IEZXTjLtFwTNfFx61i+LqglEKU3cBTh4eu1bK0kAaX4GJOeFlHPzDJQh4QCeI77CQd314ubaA==
X-Received: by 2002:a17:902:c94d:b0:21f:5cd8:c52 with SMTP id d9443c01a7336-221040eb619mr150146455ad.53.1739821865173;
        Mon, 17 Feb 2025 11:51:05 -0800 (PST)
Received: from localhost ([2409:4066:d04:319e:1d76:db25:b6bf:4f52])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-220d536698fsm74948865ad.91.2025.02.17.11.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 11:51:04 -0800 (PST)
From: Ravi Kumar kairi <kumarkairiravi@gmail.com>
To: dpenkler@gmail.com
Cc: gregkh@linuxfoundation.org,
	kuba@kernel.org,
	dan.carpenter@linaro.org,
	rmk+kernel@armlinux.org.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ravi Kumar Kairi <kumarkairiravi@gmail.com>
Subject: [PATCH v5 1/3] staging:gpib:agilent_82350b.c: fixed a typo
Date: Tue, 18 Feb 2025 01:20:48 +0530
Message-ID: <20250217195050.117167-2-kumarkairiravi@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250217195050.117167-1-kumarkairiravi@gmail.com>
References: <20250217195050.117167-1-kumarkairiravi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ravi Kumar Kairi <kumarkairiravi@gmail.com>

from havn't -> haven't

Signed-off-by: Ravi Kumar Kairi <kumarkairiravi@gmail.com>
---
 drivers/staging/gpib/agilent_82350b/agilent_82350b.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
index 5c62ec24fc..5a74a22015 100644
--- a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
+++ b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
@@ -121,7 +121,7 @@ static int agilent_82350b_accel_read(gpib_board_t *board, uint8_t *buffer, size_
 	writeb(DIRECTION_GPIB_TO_HOST, a_priv->gpib_base + SRAM_ACCESS_CONTROL_REG);
 	if (retval < 0)
 		return retval;
-	// read last bytes if we havn't received an END yet
+	// read last bytes if we haven't received an END yet
 	if (*end == 0) {
 		size_t num_bytes;
 		// try to make sure we holdoff after last byte read
-- 
2.48.1

