Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDDC28488
	for <linux-staging@lists.linux.dev>; Sat, 26 Jul 2025 04:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753504396; cv=none; b=WuUEfQBitsSkc0dUGBFY145XrMdcX6jED+1zEq4twNMK6oio1ueoGdKFlCuMHKJGY2A+shL9ed/uUiZ8xsjYzlS+Ot3iun4d+AxStUAUgTX+s/D8Cs7SpzA8wxRNbFwzkJQdeX2Mfk/RjpTEMaDhHMvySWcC/JOpiYbcli0xfeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753504396; c=relaxed/simple;
	bh=yqLflEss5+rW5p1lBzUzxijl/tQZexw316Q+5lZBc9A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZV3Il0PjT2w37DM/TBudXHIY4TVvkOwDWmd6sbZg0H+mJIKYYcNvGcr7S4WsL4KT4Ru60EkRpx/rE7y2xyKcj0bhiOBrtg0U5WrMhWRMxbQnY4BUgDogCgSRArhU0CuySc+FV/ZEI85lfj6hfaz0EpMr4wjisJuqtVwvAE+3Q3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E/XoxPR1; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E/XoxPR1"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7e62a1cbf81so397463385a.0
        for <linux-staging@lists.linux.dev>; Fri, 25 Jul 2025 21:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753504394; x=1754109194; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BW1xnx+eic9ymH8SDNqekLeIBVOT7EdCfOdZuvvoJF4=;
        b=E/XoxPR1M5k/iaEsE/fI8nZwp+ooYiryaVeFCohrp6jF2PjTk570JwIqnMJVYdMSYo
         mhQDOpLkvGdgsIbFyb8mWX9kuyHyMkUNceTLHAgRKumQ6SvLzNA03K0RLEwTfcw1tYZf
         4YfWte8jfb7XA5oPZ+hve/fE+CpkFAD4P31AFvewfWRozfhiHK7E56OS2xKHAAwqtHDg
         WNsekFocIWqmpU8fUqhFELt/qGurciAcNvblPSjU8QbJc+UXMtU4PYnkdxyv2G/iTITj
         67SPxcg4KMWhUNNMGa/TgXHrlHreOBsq0O2rl44m7f5NSQPwxuKS0DcVx1/MXCyT8I1y
         fQmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753504394; x=1754109194;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BW1xnx+eic9ymH8SDNqekLeIBVOT7EdCfOdZuvvoJF4=;
        b=SvhgwsolXihUaBOezco00+PD67OUvfLv80MHCrGgAy/An4XmiRknTtmWSf/B0H8fFG
         GE2Gv2m39lvl1u7A0JZEdec737THAbplQH7tuwjdaD2zT6ZD1Y4GJ4Yx9Jn96BdGfmki
         2sVzxGE9MzHIH0HiqMPeazMbtA83GO7/8zedL3AqJct/zziex+QkVO9EXz3S3REVi2Z6
         z+r5gipiDsX4Fayh7q1DokhJyKH9V3oyTg8o120nQp/XBzPhoqaypbyMO8F10AV4Ssec
         8cI7T1vuIjPEm3hZX6y1BMtil4E2voYKJUn9/5SBPiXCcTtA+LXtGKG21AEm1/YpA88T
         jROw==
X-Gm-Message-State: AOJu0YyXl3i2YsTq0wj2PibC/TDuVkAzC2ze19uAuW3JTJ7CB+w4ajo/
	Ya5NBpxG7bxTfD/SLOqCMq32p6VGDjb+292HDil2wIdPwnH5siIirCFx
X-Gm-Gg: ASbGnctUQYsPVNfblk0mJeXYO5pOZ0VF2IKkFg808LTGObSY7svUov/mFoacOJ2+eLI
	mdJPUhqFEDM7Cm8VoBAz3aWREnO4clL3aWOzwqZWY8zWro1vjIm2JHYQ7O8O+O6LuBLYFlEBCMG
	9BvKRbkU2U5HjiiLZIJR4+GF7gjcS1sZgJ+blCKLLwNIUaKrcC7RMNWMzho4Zwq5Rw+8LDcT0BA
	J87W4XN2GrV9ebGIn5cZy97DDIlI0NRJTQUdzJPYa9wJmOBgxWPRat9ZEpQ2iGzXeIJeIf/r6xU
	sZKu9MehhA4iGhBb6jeI1nEARLyKEIWFSlxKCQW5RtFWoCGD66LTcR9dCTT3sLviE/RGAq0K781
	04ladjybYa6MMpNYwfBC4OIOAwTPyIyg58kGJNIxIy0sX4gKspJQ=
X-Google-Smtp-Source: AGHT+IHd3rG8570Bas2ZttHZNDcdf3KiYipJI+hbnOt3fNKzufWFCnJEWz0pfoRYwZE5qJwTFLQcuQ==
X-Received: by 2002:a05:620a:260f:b0:7d4:2c9:e0c4 with SMTP id af79cd13be357-7e63bfb3348mr447476785a.28.1753504393652;
        Fri, 25 Jul 2025 21:33:13 -0700 (PDT)
Received: from linux-kernel-dev-start.. ([159.203.26.228])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e6432a885asm70322185a.36.2025.07.25.21.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 21:33:13 -0700 (PDT)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	vivek.balachandhar@gmail.com
Subject: [PATCH 00/20] rtl8723bs: cleanup and style improvements for better readability 
Date: Sat, 26 Jul 2025 04:31:58 +0000
Message-Id: <20250726043218.386738-1-vivek.balachandhar@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series includes 20 commits that clean up and improve
the style and formatting of the rtl8723bs driver in the staging tree.
The changes address spacing issues, indentation, comment formatting,
blank lines, and minor code clarity improvements.

No functional changes are introduced. All commits adhere to the Linux kernel
coding style guidelines to enhance code readability and maintainability.

The patches have been tested and are ready for review.

Vivek BalachandharTN (20):
  staging: rtl8723bs: fix spacing around operators
  staging: rtl8723bs: remove unnecessary blank lines around braces
  staging: rtl8723bs: add blank line after function declaration
  staging: rtl8723bs: remove unnecessary space after type cast
  staging: rtl8723bs: remove space before tabs
  staging: rtl8723bs: fix overlong lines and clarify lengthy comments
  staging: rtl8723bs: align asterisk in block comment to fix formatting
  staging: rtl8723bs: fix logical continuation style by moving to
    previous line
  staging: rtl8723bs: fix indentation to align with open parenthesis
  staging: rtl8723bs: adding asterisks in multi-line block comments
  staging: rtl8723bs: remove space before semicolon
  staging: rtl8723bs: fix excessive indentation in nested if statement
  staging: rtl8723bs: fix unbalanced braces around conditional blocks
  staging: rtl8723bs: remove unnecessary parentheses around assignment
  staging: rtl8723bs: remove unnecessary braces for single statement
    blocks
  staging: rtl8723bs: add braces to all arms of conditional statement
  staging: rtl8723bs: add blank line after variable declarations
  staging: rtl8723bs: fix line ending with '('
  staging: rtl8723bs: place constant on right side of comparison
  staging: rtl8723bs: merge nested if conditions for clarity and tab
    problems

 drivers/staging/rtl8723bs/core/rtw_mlme.c | 506 ++++++++++++----------
 1 file changed, 285 insertions(+), 221 deletions(-)

-- 
2.39.5

