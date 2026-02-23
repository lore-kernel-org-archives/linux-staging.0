Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 745B73783BA
	for <linux-staging@lists.linux.dev>; Mon, 23 Feb 2026 20:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771879240; cv=none; b=G3r+VXthzJsQyxnpMEK7ZFhud89jPqQ+7fHeqYkDUgmDv9oOpcjjlDKA+c+yYl9PBAdN1yhOemBlG511OxSjhZp26BSf9lHHgbgUTG+y2YhOiOqn4N6pGaYBVu9/AIRmPYL93ELfoZxzWybKx2OuFkobU7LR6yERtuKAKWwifOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771879240; c=relaxed/simple;
	bh=iLrI0oKeHJI6vTO9iVFt6Z4J+XrTGfdOhIfuqzP9Z80=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N5Del4trQ0pOh0Rps4pRuc43ScY9jQB5zrVtCC+2IcFr0aYovAoeEPTEuaJ5tG3aYlt2eprcFurflPO8SguPELnJvYuaQMQfbfTeSuuBN39Z08i+nhKwTUXmapIAG4m0kd2KuBQdxjdW7ydfhjT9gs42qDykTpF/BV5SWvHJNAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zh3tT8nK; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zh3tT8nK"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-65a3fdeb7d9so6837600a12.0
        for <linux-staging@lists.linux.dev>; Mon, 23 Feb 2026 12:40:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771879238; x=1772484038; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y98wuvmXcXm/f7cu36+wgO8AddS0+bB60iMwr95bFUE=;
        b=Zh3tT8nKjfdDTFI8eYxiJMawwjJZq6W9NB2cchnsraCnhJyRQUZpp1ne6euRe6pXRC
         2WKvJ/gyq1quh8AEhbKs8UjFdqB1s/3m7bYuTb6Zn2fTXtj0gi+hp5RpimQa4jRO0d9+
         HNS6joImzJNkyeRz1CxSFqHfUVLolrQ7rgsYOf0acTK+ZF2zSy3oLntGL1+nnKYc3qaD
         KnZdab8hS0j92brXKl0PgqzL1bmpArSztY8JVWf6O+SZCbJwFfi+SVNCW7T2woM7WMst
         KfVCwAvF1ITF7Pav2DGZW7egbRnvX4uw4t+XpD9BzZSAEBF4alt4Dz6I3QQuQ/hdf4Jd
         6vdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771879238; x=1772484038;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y98wuvmXcXm/f7cu36+wgO8AddS0+bB60iMwr95bFUE=;
        b=AclrF4XdBEIUmbhvk+gphtsBfaTOXrKkFUGlb9phALGXp42n0GnA37y3gfBO9vq4fI
         dKMgHe/3OYDuljz0Cv8M0KDM/J02Eixlwv47rdsWHENzE6tmbWIz3SSWoMERwB//1OnB
         E1rYVLAIBz4hkDocjDis9PToiiWmhva1CKraZnNi0uPaxOvP9ihfmXs9ysDoqzKkAfRE
         GPF0X4i5TmwXub9NOy20TutnHYYvgNCx0tJafqtH8Hdb5yzaWG1nVciWvkXt5kRtR4ui
         H3RnEkSAhTQSXMiYyhlcoOVBIdMF0MExOCaNBwaZ2K3QD0WJoyQh9vytZnkAlr4CcVv3
         lxTg==
X-Forwarded-Encrypted: i=1; AJvYcCUCZsiJZMMqLEioyGD3pX4wbPS5dda0bYaUYkXxSqZRaQEPMRH+B7DhkM+KI8cUTqPqLH1ctvI47pY+ntBi@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9a4YDztA/So0lNuV9RaSPsqVFfledDW6jyB4WU1/OrtTsznQF
	+aPUQbnGkMvVwW5X6bUM3H4V/A9+NiNObvdaKIFwoSSdlhjTXOUaOiZ7
X-Gm-Gg: ATEYQzyKA37P/sz10rKU70X+CKVV6UN6CeB1VW60rJI6YhiX0CIbov7pBB+/fdI0EpG
	Q/njYmhUmSjnruusR+xYbvwhjDa99YNYtKfziX7A0IOxE9faF6rB+CZsIgYE4T3LAf/wGVBkJGm
	ndXL0uC4iv5JpVg/h4IRfiJqnzo3QaoKrTwQ6Y/KsNfZ+dhJQCOlI9ZXK4XZ3XKrhXXwQCTpkdB
	wu0/qQHlA+fyKY503kgmvu/ra3LtRGj6t7Nr3+xy41z4Spt9EewVpvYCCgelRKFMBK8gLIG/bK5
	Mfthr13EnsgkvnchEFBPI4ps4eLBKD6DNKWq19itknTARICoeqNJSgvESckF9z6bW/wEXp9B9aT
	ERg/621P3p9UdscwzcCB+Bv18YEYWwCuRDYB+rv7bOIQnVheacXEpxp7Rv7L2+TCqkhr6Xt2kA4
	DXJOx/sl1DtUARgc76TB0fDyQzVbCscHr8pkjByqeDQnqD7B/E+EAqdXRFDjw690QpYu6ELDn0p
	je/Mbs6bk5DKPYg1jI3hewcSSvYs03p9Jflik0Qx5tCgSuC6VKAKpLrBP7XifmD2jwoGgSLhUyM
X-Received: by 2002:a05:6402:280a:b0:65c:353b:41eb with SMTP id 4fb4d7f45d1cf-65ea57e3623mr5481129a12.31.1771879237335;
        Mon, 23 Feb 2026 12:40:37 -0800 (PST)
Received: from cs-874966990260-default.europe-west4-b.c.i2f7e30109524dc12-tp.internal (186.209.141.34.bc.googleusercontent.com. [34.141.209.186])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65eab9aae0csm2818662a12.10.2026.02.23.12.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 12:40:36 -0800 (PST)
From: Artem Lytkin <iprintercanon@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Artem Lytkin <iprintercanon@gmail.com>
Subject: [PATCH v5 0/2] staging: sm750fb: clean up logging
Date: Mon, 23 Feb 2026 20:40:34 +0000
Message-ID: <20260223204036.1780-1-iprintercanon@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series cleans up the logging in the sm750fb driver.

Changes since v4:
  - Rebased on staging-testing to resolve conflicts with CamelCase
    renames (fixId, initParm) that landed since v4
  - Dropped patch 2/3 (sm750.c dev_err conversion) as it was already
    applied from v4

Patch 1 removes all pr_info/pr_debug/pr_warn diagnostic prints
from both sm750.c and sm750_hw.c.

Patch 2 converts the remaining pr_err() calls to dev_err() in
sm750_hw.c for proper device context.

Artem Lytkin (2):
  staging: sm750fb: remove debug and diagnostic prints
  staging: sm750fb: convert logging to device-based in sm750_hw.c

 drivers/staging/sm750fb/sm750.c    | 76 +-----------------------------
 drivers/staging/sm750fb/sm750_hw.c | 26 ++--------
 2 files changed, 7 insertions(+), 95 deletions(-)

-- 
2.43.0

