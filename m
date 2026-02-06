Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F076436C5AA
	for <linux-staging@lists.linux.dev>; Fri,  6 Feb 2026 13:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770383517; cv=none; b=jaA+MjOZRFt5E+zrm+8Dz0m5qI4GpHj7G64HPCkmfbuZEeiAiEReIvRbzvczbbS7sGD7Ic4lmLW7HG5pcvIpm5k9MxizqSVKZKb7AX9Uv8b33rdKwAbe+7d+3JY4ExJRwmNuIDqW2zFj+PrN0rKxsRo2ZyCx6DHSibd8Dd5BgDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770383517; c=relaxed/simple;
	bh=CYrgFG+ppuAeh+tXC2rK3oQG4b4aNCH2s98yWn+IfyQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T+K+DFsK/WIBQuebu3e00AEH9nweI5KaW3VEqg9dlKhZk+jryyNAfnLsEbC+TZoj+GzSkkukcXXlqInZjJ9jOH33Lk+tEbvlY/JMWs18QV1/SekRPC55faIEu3TAieKcakU4C+1IDNV6dW8a2kfLEzdSrm2NGFET0HVZ5Rc93F8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZDJe3RQ+; arc=none smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZDJe3RQ+"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-649f0025965so643885d50.2
        for <linux-staging@lists.linux.dev>; Fri, 06 Feb 2026 05:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770383516; x=1770988316; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9jGbl/Gqq11iS2jixnN+HmrPbsBAWaaZl/8Pj1X0g9c=;
        b=ZDJe3RQ+1TaBJFRVMmY53VZReWUHV747GpCaWNBQGjPHtd6pniVjCOxdQQKW3Tcy0p
         /mr+ZAthBBbNG/bEJHJ6YXnH0dcc92LrEjKNM5fxZPXB/Edb+lQ0HB/o/MREuKLyaJiB
         RRJS9q/emZeQ0HqMeWbPOUn1K1QEG+6sRXALdtIJUhX6CTrzLhXCiqQFL3ZDk9Ux8C3O
         2tE6aCMEHHyPqSzGsrDzUjAdTBAR82LMbozEzWpncTruh6eSRqWz74x7INFJhdtiDqj+
         maS0othLJlJh22l9nqviQlZEMJHY9Qkzs8KtR6PZ4ezDxZfs0hEaFSAWLvsdpor2v21S
         uW/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770383516; x=1770988316;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9jGbl/Gqq11iS2jixnN+HmrPbsBAWaaZl/8Pj1X0g9c=;
        b=WSMv5UdNLmOjMBBipoDNZZ/hik9BQ9XT6NSW/Jc05ZJS6e0eDUhc0ffhtzTPQDTmLn
         eINdJdtGEkVUqpU7D0EZ4usYHRAF5GHqjQAfHf5CzATeDfndcHXFXTh56jmBCPIAc880
         OOVLfTydrRTjmlCwDilj3y7fi3HbF3gjPuF+suUzlpDbwLxRs/oqhoBWyJNDRse14oil
         26t9bjBKYOmsjbB0eTCm06PsozctLIbAcvTdQ2da+EvwReGp/bKWiksOm1MV9Yj/8Zv0
         VCT12PPN1DlDcjVENMuPx3ip0TU+m/klIB2hKnoSwHS9qaJEjxdxulEtX6z3pHT7vYai
         Lw1g==
X-Forwarded-Encrypted: i=1; AJvYcCWUwZvKpsK64aJJI/z1Uq7z1rAJcZj64Jml1eRosUs1tciMizuejjp61gEBYwmeN2uztq8vhrD5p6UKsWUN@lists.linux.dev
X-Gm-Message-State: AOJu0YwhlUulWlccJ7Hps3Ly89CRF3/eahEj0oWzSV8EWeSengc6LVnl
	ZJQq/PWMI4t8L+2YqoN+wmUZTXjyOSXTQC/oZbfwckBf9BuBsT2PyhwY
X-Gm-Gg: AZuq6aIzx/V0KgVVM0EnV6T1sKzKI5kEGzfQB9fKk8JH8Knq+Scoc+NRc+qYhPkRdFN
	lxA10OBGhy9nh8oVO3RPPsOozKC05Clb4QQ3BY7WImqsOfQVeqFa0O0UV4uL59Hf8LSJFk1g8Xv
	rhxNfV3GjG+Z8DEm8gZGECf4cJMQjzurHgsuaUcBFQfYAM5ngxq3VzNJFy7gS+YlLsWhq4PjpvY
	eAfJo+1ASAoY7HVIr+/mDihJZozTFF6mtgPtIhW8eGlxBLCEbhE2RlKFBikjoEuzAEddb9QwrBd
	gxrEGJ0XiOYXuYGB6e37G+ra+f/UWrT2mKIdE6YY554skRWbZskLMhHztCgCt831l0snlNBWfav
	SRqLI9XY8I5Dpq8UIgnbElzmzzg33e5B/XEgkkpeRhVo23xSMmLbKf/vc9jInYyiR7U6jdYK1Ii
	PllFzSqK12lT6PCdLC3NR9xbIN3nsSfV0YtibaJdAHtHNq419EswfG7X/YMI+H57Cx
X-Received: by 2002:a05:690e:3c8:b0:649:e501:21a6 with SMTP id 956f58d0204a3-649f1e5a96bmr1998941d50.16.1770383515822;
        Fri, 06 Feb 2026 05:11:55 -0800 (PST)
Received: from gustavo-arch ([2804:14c:f25a:845f:5b8d:2e7c:d238:2d28])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-649f255ea1asm2160559d50.18.2026.02.06.05.11.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 05:11:55 -0800 (PST)
From: Gustavo Piaz da Silva <gustavopiazdasilva2102@gmail.com>
To: gregkh@linuxfoundation.org,
	dan.carpenter@linaro.org
Cc: ovidiu.panait.oss@gmail.com,
	gshahrouzi@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gustavo Piaz da Silva <gustavopiazdasilva2102@gmail.com>
Subject: [PATCH v7 0/2] staging: axis-fifo: clean up probe logic
Date: Fri,  6 Feb 2026 10:11:46 -0300
Message-ID: <20260206131148.13643-1-gustavopiazdasilva2102@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series cleans up the axis-fifo driver probe function logic.

Changes in v7:
 - Rewrote Patch 1 description for better clarity and acknowledged 
   that the original code works.
 - Reverted variable name and type back to 'unsigned int value' to 
   minimize diff noise.
 - Removed unnecessary whitespace and extra blank lines between 
   function calls and error checks.

Changes in v6:
 - Removed axis_fifo_get_u32() helper function entirely.
 - Removed all dev_err() calls in parse_dt.
 - Kept 'node' local variable in parse_dt to avoid checkpatch 
   line length warnings.
 - Added missing "---" line after Signed-off-by.
 - Fixed checkpatch style warning (missing blank line after declarations).
 - Ensured newline at the end of the file.

Changes in v5:
 - Added missing newline at the end of axis-fifo.c file in Patch 2.

Changes in v4:
 - Removed extra blank lines in commit messages.
 - Added "rx" and "tx" prefixes to error messages (removed in v6).

Changes in v3:
 - Split the original v2 patch into two separate patches.

Changes in v2:
 - Fixed checkpatch.pl coding style issues.

Gustavo Piaz da Silva (2):
  staging: axis-fifo: use u32 for fifo depth flags
  staging: axis-fifo: refactor device tree parsing

 drivers/staging/axis-fifo/axis-fifo.c | 77 +++++++++------------------
 1 file changed, 25 insertions(+), 52 deletions(-)

-- 
2.52.0

