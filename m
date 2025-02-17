Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A38199E8B
	for <linux-staging@lists.linux.dev>; Mon, 17 Feb 2025 10:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739788263; cv=none; b=Nw+vM69kZcKOzNX4R1OJZmMJbXTmLynMBoNgjjkm9rHJzeleg3G9JNGVwfKMOaBge4/3GpNRB7rguDNXYzdwi8U/3EDUSh2YtSraMAZIR/64H/JuxGVvsM4YkwZNzu9wALosmwUEHhJVR5ViKX9whM0xvogUupkLVce/eO63CwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739788263; c=relaxed/simple;
	bh=080Z4wK9EH3MjqeP8zBi2rpewLDDrS7pCi1DZ0WVkE0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jdGEfgLidDFsapgZn0uat7NhWeWoAoW+J3gotpWP5mmJRbZ++BNg+3GY667C87vC4rqa3OMBNBM5QFnb/zNHNAQi5imYPntV3hLZtLmI/mPKdJ6VWA3YY7xB9EPG6kDQnAWuIhOpeWh6eVdjRFW59a8jQLJW0AYavz+SKhkMVtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gWICymaH; arc=none smtp.client-ip=209.85.214.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gWICymaH"
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-221050f3f00so31503035ad.2
        for <linux-staging@lists.linux.dev>; Mon, 17 Feb 2025 02:31:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739788261; x=1740393061; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=85D9OooNZswo11gxtTbtf41n+VaqASeLQXWypT0ulVY=;
        b=gWICymaHSkmpC3r7KYHgtAUaIZPbNHcA/eqteJ1TXFBUXt1KWQgSxf7HD6lnj81BJk
         L1xc/6dpBd7K4ZjRCNlM6YW0YY9n/Wvm3YfUBlGra7KnHAl4r2z6wNn5VXD3lwS+hTUo
         +k7wBBlbuFtnL3qPKNF75Fq6uQTxt7LYn2rOhO9rHlhNj9y9GeW/sGF8CfpZ+6ooeBpB
         p3klBiEBW8vbO6k+lvmizGV07/afvLQaHIMvbdMBNZtV6phRb11jWwXewHaYjY9T/43G
         nPWEi6y6NxL2S+539CnY/TENqBAyW2bIWY8DvZELh1aYbinkqNnGRnMHH8WVcv4I6OuW
         WdTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739788261; x=1740393061;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=85D9OooNZswo11gxtTbtf41n+VaqASeLQXWypT0ulVY=;
        b=waDlAVruuVmqzuxU4bO/nBp3CC9Tklhw+kaDaHI+JCY/pllwOLG5UupL1nvmpvGnJ+
         xcI21Cg4tHHijGVcbCGBcHtZYnqhqW6Lc/cMqZKjiHKYjLDFDFL4ZHKMBrjP/OxwfYmY
         AH2r4IHtTp76shGEbuNBsjv4QO0wJmeOfJNnENi2qoswtor1t3LrBLEZSocofcVL1S6G
         i2RCk/Oe7Wo2t45ncWdpj3z9lFBAW7KQdMMX1kngoSO6cyWfr0xdkvI1+uNlGsqdBPWS
         N5iXmzghH1xjuI3g2CN5a5I9R42HgyNnQGkgn9kLClIAeYQEqw5Xo5x8hXsMyiLCAkpt
         iqxA==
X-Forwarded-Encrypted: i=1; AJvYcCVP8eIViCwvc9WRnSvg830cJsZxUd2bpcpcRpOomtVEwmV65fo0u/xO4CIELcy2oQw25sMQjXNqGiiiyABZ@lists.linux.dev
X-Gm-Message-State: AOJu0YykYFLKKKY44S9dnyCbV223j2en0u23xsNBCF0Lfx73vcJS7FIy
	430+hxHmT+7cxpriWKS2vX4jCWgAvZtBcZ4oxHWdtrcwqUjeS5Cd
X-Gm-Gg: ASbGncvzz6oK/cJmy9f4r9B4KNQAsyGdtKo5vzvW7h2WCpj/poK13CCnNvhilpeCGz9
	3WNPnzWUyQSUCNRiqzWTa7qV1eqXdLcmDhwUhqEmDVpBfV1qsLOLKMJDqvkz8W70pdwNT4Y9Q4a
	cAHrWYhnO1LpZvcaFYAZYn/cBsmMdSGohvYjRqxPZFhP4QqkTzr2kcrybORubteDsVf7IWodYW8
	f6/a2nsOffNdyk0x1CHjYYsCjAVxGwpflUBXxUPoOnsUJk9479SLYX7stH5bfF9mxLs7yGnRYuO
	ayG+deygGGXNLqWvcZbk
X-Google-Smtp-Source: AGHT+IEQaXTY1qxk+NaxY51RFRu2PEcSWfy909O9l//GMcEQq9KicCAyb04t28KVbM1eaJWJZDdA1w==
X-Received: by 2002:a17:902:f54e:b0:220:ca08:8986 with SMTP id d9443c01a7336-2210402d6b2mr172061855ad.22.1739788260979;
        Mon, 17 Feb 2025 02:31:00 -0800 (PST)
Received: from localhost ([2409:4066:d04:319e:1d76:db25:b6bf:4f52])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-220d545c897sm69294305ad.118.2025.02.17.02.30.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 02:31:00 -0800 (PST)
From: Ravi Kumar kairi <kumarkairiravi@gmail.com>
To: dpenkler@gmail.com
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kuba@kernel.org,
	dan.carpenter@linaro.org,
	rmk+kernel@armlinux.org.uk,
	Ravi Kumar Kairi <kumarkairiravi@gmail.com>
Subject: [PATCH v3 0/4] staging:gpib:agilent_82350b: Code cleanup, spelling fixes
Date: Mon, 17 Feb 2025 16:00:34 +0530
Message-ID: <20250217103046.54294-1-kumarkairiravi@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Ravi Kumar Kairi <kumarkairiravi@gmail.com>

This patch series addresses the following changes:
1. Fixing spelling mistakes such as "havn't" → "haven't"
2. Removing unnecessary commented-out code
3. Cleaning up whitespace and formatting inconsistencies
4. Removing an empty line in if{} which was causing it to be read as a single line

These are minor changes aimed at improving code readability and maintainability.

I appreciate your time in reviewing this series. and I'm deeply sorry
for the spam beacuse I messed up last time I sumbiited
Thanks,
Ravi Kumar Kairi (4):
  staging:gpib:agilent_82350b: Fixed spelling error
  staging:gpib:agilent_82350b: Removed commented out code
  staging:gpib:agilent_82350b:Removed blank line
  staging:gpib:agilent_82350b: Fix Indent issue with block

 .../staging/gpib/agilent_82350b/agilent_82350b.c | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

-- 
2.48.1

