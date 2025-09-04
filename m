Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7861C6FE8
	for <linux-staging@lists.linux.dev>; Thu,  4 Sep 2025 01:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756949167; cv=none; b=t4f/Pp0f2VWci/uK2Kb0OmNszdRJ1p125w62/Fi8RNZCC6Tjc7ry5W/Qx4+SpAVLWaTdIictsXqft0gbS8FnyqH8pVwU0MCwfdOWq83JolQ7L0gyzRQRWgBGf2evExdVeEoXtDEnYGMkgxe6ebHhBnHLI886fu65l92dAD5IZuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756949167; c=relaxed/simple;
	bh=y9ZABqf+yHMqEW+QEAi4I7ocMN68Syj5J3cajh4yIcQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cSuBpUhs67ks9P4P2WNyKwR2BwxOmyh2gINAXsI4qzyMwcasDDcDU/SAF+hhbiCdTy5YnCXuA6UCof+jzAAaYAg9BPR6ivwvG7WkJ3vhOSCeVRdoB7U+464P2eST/qeSYeNeE62BvbzrLQB5aKQHvaJ+pJuUkE3fB9FPThv1lcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mq7YZO7x; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mq7YZO7x"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4b32bbefa14so6761481cf.1
        for <linux-staging@lists.linux.dev>; Wed, 03 Sep 2025 18:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756949165; x=1757553965; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TLkWJqA+Qpg0LFBNtfXvmc5DTZiOLOhodc1Nry+glzc=;
        b=mq7YZO7xI/VzyCO+x6d8fr0yqSETJIBoTuqRBYXf8fZRXwi1h2/9Yfo+uNSINOiBdE
         CCqjnyhGW+ZqxBEq0DbsVxyysnhSWcBGaSuXR5QEKiUWI7N2djzlEvv7nMw2+wwdqb2K
         lvPzyNMMGX/V4bxQ+uOR2i6Ezln12hDL4TOrTXVZReaI0YVCWXnbEEoFSmiERXZgM5+Y
         owAxRw6bjCxMQYha0X7Pn/EfuABlvMaoiRtiW5Znjkxeyon8yLd6ukjdO3Fx3DAjtIAo
         bjnBrCN9QUAxUSmCmuRjPHeD02IcNo6PRDpu2gbmutAt9JxrX8r1OGPGqlgK6sHvL2LO
         5QLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756949165; x=1757553965;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TLkWJqA+Qpg0LFBNtfXvmc5DTZiOLOhodc1Nry+glzc=;
        b=MOCQx0W4udzcDhTvfcqKqQxBCT7Ykj8jWk9mVceYkSVBfE5IaTiTFQgWqsXWfFm9Y7
         srvUKAHkWOVT83DHnn++4emA7FnUHo14Q42N0stZ+yq4RM9ELsPlv6WqqE8H7bwG444m
         KgagGMjJ4s9VGUtrK+/pIKXnoUePr64UVjcIhGoQ0yglyuN/W2qATyCuLHwDgIUYXqpb
         +N85La8ep2wmorVbP4zrPru2OPc5nVc1K+hwnNMmUSjwi6v1yfqnHsmA5W3XnITcdXh1
         cF0aq1elNPLfsE1erdX6ZnK0LqYanV40quHGEu+BlPduNnhVQER3sdGZK1u956H23YwV
         DvPg==
X-Gm-Message-State: AOJu0Yxi2Xvra+/2VuUgmxYu4mPI2ntF0M7bC3zuPpvLqYae6eNz6UJ3
	SQ5DmmTGknKug4rWUO3hM3jE/7TknDQF/rO7kKIT7ffH6VFCSvP83LP1
X-Gm-Gg: ASbGnctClpzP3EVPIenHaiXh/gc2NOcZ0jpffqplvbRM659j03DOowmIyxmExt0CWDI
	NegBFymrLgC7C4vGD0YWSDUjcDFaWDqtik8zG91fnRSsJ70FcMdfYKC2g+5g1ytlhfBkOQrZg+4
	3KlvR5YQEhpglVfFpqYACLn0JA18yJ3WZC8rZJdQu7sRggQJuWwdARkmOD59jEQ/ZgIXmFt/cmD
	wI6HHUQquQiW5QG8/5sBVjChTQnad6Ia3qZqzC57tQRgyOKhdfuPPQf3JzD7IleN+yf5UOCRBc8
	Xrk5rR8SAGI3zWy1wDt8yogU4ZOzP4XOLCytOMdNvIcbbcKZ1ra7TJFPuGj23mMzlWZpnGSP0xN
	UeJiTijPSV+fB9CT7nEeU1w0G8fyYIyd1EnqqZ+CftXb/HuixD3hSYHpjCX8r04xI4LyBlMlE
X-Google-Smtp-Source: AGHT+IHuH1eBpiwG5vcqaGvUdDOknBvDXSPL9gGVmJCrJaxicgfo1GvDc2matEFCDaCgaDcEdCsDKw==
X-Received: by 2002:a05:620a:2805:b0:7e9:f820:2b60 with SMTP id af79cd13be357-7ff2c32f99fmr1705598285a.74.1756949165209;
        Wed, 03 Sep 2025 18:26:05 -0700 (PDT)
Received: from linux-kernel-dev-start.. ([159.203.26.228])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-720b682faf5sm38423266d6.65.2025.09.03.18.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 18:26:04 -0700 (PDT)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Vivek BalachandharTN <vivek.balachandhar@gmail.com>
Subject: [PATCH 00/16] rtl8723bs: cleanup and style improvements for better readability
Date: Thu,  4 Sep 2025 01:25:20 +0000
Message-Id: <20250904012529.215521-1-vivek.balachandhar@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series includes 16 commits that clean up and improve
the style and formatting of the rtl8723bs driver in the staging tree.
The changes address spacing issues, indentation, comment formatting,
blank lines, and minor code clarity improvements.

No functional changes are introduced. All commits adhere to the Linux kernel
coding style guidelines to enhance code readability and maintainability.

The patches have been tested and are ready for review.

Vivek BalachandharTN (16):
  staging: rtl8723bs: fix spacing around operators
  staging: rtl8723bs: remove unnecessary space after type cast
  staging: rtl8723bs: fix overlong lines to conform with kernel coding
    style
  staging: rtl8723bs: align asterisk in block comment to fix formatting
  staging: rtl8723bs: fix logical continuation style by moving to
    previous line
  staging: rtl8723bs: fix indentation to align with open parenthesis
  staging: rtl8723bs: adding asterisks in multi-line block comments
  staging: rtl8723bs: remove space before semicolon
  staging: rtl8723bs: fix excessive indentation in nested if statement
  staging: rtl8723bs: fix unbalanced braces around conditional blocks
  staging: rtl8723bs: remove unnecessary parentheses in conditional
  staging: rtl8723bs: remove unnecessary braces for single statement
    blocks
  staging: rtl8723bs: add braces to all arms of conditional statement
  staging: rtl8723bs: fix line ending with '('
  staging: rtl8723bs: place constant on right side of comparison
  staging: rtl8723bs: merge nested if conditions for clarity and tab
    problems

 drivers/staging/rtl8723bs/core/rtw_mlme.c | 421 +++++++++++++---------
 1 file changed, 252 insertions(+), 169 deletions(-)


base-commit: 5141ae32d4b8971d7b689854fd47a200e695bda3
-- 
2.39.5

