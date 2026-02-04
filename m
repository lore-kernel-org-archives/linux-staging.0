Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBCF0426D15
	for <linux-staging@lists.linux.dev>; Wed,  4 Feb 2026 18:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770229818; cv=none; b=ODbg+fdqAFHmolxcl/D6CzjXxnRX6mqOjMj8l2CPK89/3WhpbWZRt4sKOUobqvvIbPT4h99uwcRKhjFwwByfpUoOFcH/U8GBpyuldipYyZQVzFldR5p+UlDHVNzaFE8spP8B7MxjxWUXJfvrCqB/ezt7eYZXu8iOtg2H8Px1VSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770229818; c=relaxed/simple;
	bh=mlMCrq/2qogAwxN0+vAVUVPgiMFuK3LBsx+MCaiipWQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rjVsMIfaEdizkV++UV3t2cB9GoQrpm94EXiht/nup1b+NrFKJV3FILHUKZgWMmYJ5jxeyxCGELoYnH4qNnPNJFpEWoLn+8M3dJIqpY9ywbI/CGiT8ImSBu5/8D0M0/Xn/M3wqIUm18E2g7V429I26i2D7/ceRRnF1/IzBUFw76c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XqCBatzT; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XqCBatzT"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-82311f4070cso135067b3a.0
        for <linux-staging@lists.linux.dev>; Wed, 04 Feb 2026 10:30:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770229817; x=1770834617; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XeKtehgegrBJK1qC444tDoPU5h/Cv5FUsriYQwcl1xw=;
        b=XqCBatzTUUlwSbvXeSkvtADy87mBxorNHrkR/ctJsboKd6k9QoprKIlip0Fx16tYPy
         NHGKs6QLAQKDaYe0hUf59kYFG0xA8wEdf2DwWXxiutXXqdxkyvJL3k2yGoC7fM3suoFD
         1R+2vbnZm+ng5KjN9zLyj2uQBfm4DfgwT1/Hs4LDy8+VpkcCmnYprUx6usS82LoVYTbX
         /WqWEKzYTtHmHuaj063OqtO/h0l03WYQwyt033Z/HQCo72PVudjBZo/CU5tVNi87Lzua
         TxVF4GqkxWT7fYTd90P4cEEYRVMLSml7oSNy9RmQdGhQ1w59T7FXsoZYdi4OKJ/hHv7d
         5TbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770229817; x=1770834617;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XeKtehgegrBJK1qC444tDoPU5h/Cv5FUsriYQwcl1xw=;
        b=liRWF1IUUdUx/56AAAu3ohG8LdctXdTH4+BrjpsqsY/3kBWcFEsXcKiKqcwiyFMuK+
         8TUshvODdKd4KyGq4JO/FaO2AKweeFsvriX54IbbM51qatyJa7XaOSTCBVMOvlkR5B4A
         eCu1rrzf+X7kH7Z36LnOdg4thHrXmmp8QPxPX6Tz+Il52811XRrTApVzo+vIVJiQVAst
         raQoSqH/pUaKSuCG/1pJKU6IzToFmFjSxdvb7h2uxWt4PPofFvBVYDPt5aJlmciiX7Xe
         woltEDZkhkAIq5BNpdzYMmBYK6c1E8qNLBMPUIdFDj7zy5iNgc945z3Ol7xof8cay79t
         BAsA==
X-Forwarded-Encrypted: i=1; AJvYcCVn+0UMO0BLR7pZgf4tT1t01vkTUFSeNU0GH+nUz3MET7gpjFgf4bhftFHMWU/Upp1ZkGrpuuIpBst+6eMB@lists.linux.dev
X-Gm-Message-State: AOJu0Yya11Jl7LgCR3gt/pbLDomrPkN0txvCirZgICGbsLozWfhuytTq
	GNp89KJog42njKQeuzb7ycUb8Yjyx4gb6xFlSH2Ev/SdGCtXdQxJvTPH
X-Gm-Gg: AZuq6aLp3xLfoA2sdIv2JsDF/NLWG0P38ISe24APNHs6/HzAQQGOouwXqigyTV7bJ5b
	8uDrr0YciRYCqhEw4sm1q5yc3S2Y8iBJrNwyf85sNZJi9GS2B7RTyRbzp4MFkgxRjm30jrpmZGh
	v7ayg2ZTper1K0KKYLYVe95na3oenwRcIo3A0gTRS5iV+kT6nDcLOfsoEm8CN76CTcUhf6FbykS
	xrUoUR0GZ/GXw18HW2E33jWZUelI2Zyt8DOGL4q5hi7Pl58lLfT48LANUoAZy89ge1Pyv+4qofq
	5fQtWKqDxUJw46E8isBR2A1+3UJmQc7wHWtAJpdlxM2G/nwPvb5r7EDrErx6kfozPETR0PFWWw8
	FW1sW4IILKx1SyFMUSts+2Va5E2zdVfkKjrTvynETQ5Sutsr9tqPcyRs3RoxoPA7kPQVQlumFEd
	uaxal6mbCsWYClW5Kc57SSOdcKInXb
X-Received: by 2002:a05:6a00:983:b0:823:ec5:430c with SMTP id d2e1a72fcca58-8242d4eb74fmr184781b3a.29.1770229816985;
        Wed, 04 Feb 2026 10:30:16 -0800 (PST)
Received: from DESKTOP-7ISABPS.localdomain ([223.233.85.111])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8241d1e55b8sm3902912b3a.30.2026.02.04.10.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 10:30:16 -0800 (PST)
From: Rachit Dhar <rchtdhr@gmail.com>
To: Viresh Kumar <vireshk@kernel.org>
Cc: Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rachit Dhar <rchtdhr@gmail.com>
Subject: [PATCH v3 1/4] staging: greybus: added comment to mutex declaration in fw-management.c
Date: Wed,  4 Feb 2026 18:30:03 +0000
Message-ID: <20260204183003.182728-1-rchtdhr@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Added comment to mutex declaration, to resolve a checkpatch.pl check.

Signed-off-by: Rachit Dhar <rchtdhr@gmail.com>
---
 drivers/staging/greybus/fw-management.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/fw-management.c b/drivers/staging/greybus/fw-management.c
index 152949c23d65..07a0e6b63cf3 100644
--- a/drivers/staging/greybus/fw-management.c
+++ b/drivers/staging/greybus/fw-management.c
@@ -28,7 +28,7 @@ struct fw_mgmt {
 
 	/* Common id-map for interface and backend firmware requests */
 	struct ida		id_map;
-	struct mutex		mutex;
+	struct mutex		mutex; /* protects fw_mgmt->disabled, and serializes ioctl */
 	struct completion	completion;
 	struct cdev		cdev;
 	struct device		*class_device;
-- 
2.43.0

