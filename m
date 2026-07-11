Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39095379C21
	for <linux-staging@lists.linux.dev>; Sat, 11 Jul 2026 11:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783767837; cv=none; b=QVmRBcXzwMeGXY5vZ6ohR+6a6lTpLcKByGFMDgR29nutpeRbpmZyGRgI7Vl1woPVIJ3wdNztF5E+mYMHn9V0V8/04JtjH/Ntea4PQxXxKPkFgzyIXbHKjSkgse95immRY5Oco4tzn4lNjuNMU2iTXil89vCNBLOR79terasN9kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783767837; c=relaxed/simple;
	bh=UchqZ86qJMg6FrLzOi6+mrEHSa53xaG4ls+kWysXszo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Gz7HEVOy9bVnA+RIreRHtXe+QyYl3/xpbDwrj7VQS/Tux5HhgnRULy6lkvpox32hgD246ryu8n885e4JgQrt7Dyv+f07gPdkd99O0h/KNToYdXrNI4ufMGGnrGVM/b7DOkmkKCpBoreIm6LBhgldKn1YIHtckt4ae+kdHoEW1W8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MTN86JBl; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MTN86JBl"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-39c9bb9d2fbso10542381fa.2
        for <linux-staging@lists.linux.dev>; Sat, 11 Jul 2026 04:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783767834; x=1784372634; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wr/bKbooztvZMLtuYCL/NrLZFAupwlqB78kkriPts3I=;
        b=MTN86JBlYSQaElGuZkjQcZE9HPMZ5cewSLOwzJyso9K5RWiC8kpwURGZh7+Oe9rCMS
         SQ1Ov/V451NrdW1kkyvsKhA3pXAP7MdCXZVnPaeDbnreoSClvsNFcOqMLYmcG7jKdC8H
         5rmNBCTpur7NMklLsJEa577kOP8HqlOcDtuHSjXK8WQ5e265CDp21d95uFZWSCLnw8rM
         LgHxViB7WNuai0/ydM2NQtDseR5e6s78ax6YM3Y2ueLEuadWwgRkCThq/INTSYTun2/P
         ttxyFfp4On5M3DBgGzJuMKqCILg9XlNac+oESW2TKiEntc7XqPaD264SAzp3iofcc6UH
         FIVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783767834; x=1784372634;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wr/bKbooztvZMLtuYCL/NrLZFAupwlqB78kkriPts3I=;
        b=DMFbQjLwdMT4P5P+0ZbLQQ2ikj5mtbPbO/mOd0pvo9VGQSSBVeL9xLZTfwNGNQZg03
         0+7I7ULP2zX8JC7I7kDpeXn86s2XcZ19iBLSffUHzJYOtQSS3qi4okj7u3j3HUQVh8Lh
         cWXUOX044L5N1xT+xH/Y/n6lioQa5snLM5ybHC3VA368qAEXOeh2X7kCq20Hy1cL3KDh
         FByXroKFBgGReV6+61D9TigoMgawcliPIm+8wSm9B3dH/U+KOuf6Ez1KmSM9yrjFr6uJ
         gbPTc/HfVNRDrNcPDWgG62IMzWBZW5zPdHVBvXN55o5sDspI+qOvAZjjuxhzH3qYZ1hP
         ZATw==
X-Forwarded-Encrypted: i=1; AHgh+RpNPj954c91OVVo0+ikk4gRPABK5LZTYpwvvnG813fHMbwiACmoV4Yf9OkwBc+ALSOtM3NDvh45ctp2dxdA@lists.linux.dev
X-Gm-Message-State: AOJu0Ywaf4YDAk4OEbXithMnL3pxA9d1FTpW3/7/XCi3vnnBlR4jgNK3
	O87O5UERwF9rIhvMeSYQyKSdiJcNK3rQqxpN5mOb1+WHjHLRvaSd/unR778+DipQV0Y=
X-Gm-Gg: AfdE7clpzcnxbQKhhMG0WRcWFtndzGcgcQMXGhvGoSmYXtk3j3GdTfcJY9C0/Ck0aFN
	6fB5GD8WoMprG1zzycWZD4xzFipVyNDdQvwB8HS6zXvFbZCMx+5Ilwt1+hUFYEZAl7p17wUtfDE
	2yeu0Fv5vk8Os4fy3wrNz5yCQuJ26MYeCD30wzc9xwioo/UdJ6XoGpIug2BIRNtmmbIlzCgLHvS
	G1eASnYHQOqfx2rBCHR58Ab2Ztr9y6Ss/LmrwPN3LDAsLv/0Aa51nZbniW2lu4anGZH6xcj/TMq
	g4XCR699wnRuQMZbO2C3orf+Ymjp0JDC4CMmerevCtSDL5AkBw27GxbBMiumhVgdp0qLj+EbTVU
	DbeJLghTgJ8JmZdk/8y2qvdOEQTjrHAsGCQWpKCdWJwvo4BlUPDSE+5Ck1IhUItwP7f89vXw7
X-Received: by 2002:ac2:51d5:0:b0:5b0:f9cb:2979 with SMTP id 2adb3069b0e04-5b0f9cb2d0dmr318048e87.15.1783767834410;
        Sat, 11 Jul 2026 04:03:54 -0700 (PDT)
Received: from linux ([195.54.40.37])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b022fac999sm516488e87.55.2026.07.11.04.03.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 04:03:53 -0700 (PDT)
From: "A. Kalimov" <erqeon@gmail.com>
To: error27@gmail.com,
	gregkh@linuxfoundation.org,
	hansg@kernel.org,
	andy@kernel.org
Cc: mchehab@kernel.org,
	sakari.ailus@intel.com,
	linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"A. Kalimov" <erqeon@gmail.com>
Subject: [PATCH v2 0/2] staging: media: atomisp: Style and clean up fixes
Date: Sat, 11 Jul 2026 15:01:50 +0400
Message-ID: <20260711110152.66188-1-erqeon@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series splits the original submission into two separate
patches and updates the function arguments indentation to match the
open parenthesis, as suggested by Dan Carpenter. Also updated the
Signed-off-by line with a real name.

A. Kalimov (2):
  staging: media: atomisp: remove unnecessary return statement
  staging: media: atomisp: fix function arguments indentation

 .../staging/media/atomisp/pci/atomisp_cmd.c    | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

-- 
2.53.0

