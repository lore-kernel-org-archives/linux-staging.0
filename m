Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2264234973
	for <linux-staging@lists.linux.dev>; Sun, 18 Jan 2026 11:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768737293; cv=none; b=Xg8Z0MLtd3phWG5ZvHbso/3pI5rzTgJkWooE4W2KiNFmkeNvXIxYGL0ufcWkhSUlnPJphcQK8AMUhVcpzaPh+74/I9TQaFwTmvvVDjH5Iel1NSGcVZdFlplxqCMNSTt6i9S3+Gdcb5/63jTSiCzgXmYtZAAv9TuSWQycHew6oIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768737293; c=relaxed/simple;
	bh=Yp66+YVi0UlF6Yvkg3EoRRJzlhUMeTD5q86NbuSZx2Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CtZhh5TCXLp2opiNpubjka/4l52Pb0WMdi+RT9wVFcW9+ZWlwRTTeeHjC9r5LeUexO4QcJOY0S10O0xAHakm/sIicJHOlqZg8wfQjnGyd0wB1r0lq2ycdBKbKL6QuIJbCl7f3UIeVDmyWpajzlkgGTGeHiJowKABUkFiStjDqZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aJbhjF8V; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aJbhjF8V"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-42fbbc3df8fso1732238f8f.2
        for <linux-staging@lists.linux.dev>; Sun, 18 Jan 2026 03:54:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768737290; x=1769342090; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MRO+zMDiJj0tO69OGgF4iIKFSdGIrMGKjDnnGbe9DbM=;
        b=aJbhjF8VtXMavfYaxSGVD6T1Et3obTdYIMJBHy39HQ9wh3ymv6C+FdiIUWcOA1fQAc
         I1sqfU6JjmGUO7FzPUY6/mXvrHhsTTPry+zCHQMIbwTfBzHYgMQ/N1dZ4MdoOzxD8KFF
         jayVRW1xcuOcJ3sWTYCLrQm7onGOj/HWXcBmp0cGkWElNLFWRWWYh4yE76po4ll2jc/u
         f6z8zlNzbqbUyw4b4hCDC7ihjoxzO2bjfDG2Rb6BVx9f/vhEMVuvxpDIL79Ad1BtXj7+
         2BieWJaKAxUgN68G9+o5t1HKfezOTPFWtS9qav0pfqkZnJMEdtYfIZZEOs6nBTx2Gh5Z
         3srg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768737290; x=1769342090;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MRO+zMDiJj0tO69OGgF4iIKFSdGIrMGKjDnnGbe9DbM=;
        b=xTCcgDw1rUVvIHh1RBnl8hVsCuh6pKnLlUBbrtaXTskZkBefyXf0zohMI9cNoSso2H
         8kzqgRE9lhJPPYkTsckIsAa1ptUYRrAEwIZNYIYXGx/F7zX1+Zl9dagWayLEN41GCyE9
         ZNL2uCUEcCRS+IOqKLR35KZxC25kw1pKw1np82A9adJFG/VUlmqIheJd4InYgRw/hq39
         L7T9Tg/nUoob8XDFHz1BbyXnCxKK5wzS+fkcA5glC6mCLzKdrBpjGkz6lNguKu7x961X
         ILXxyf9qegreyv9ay7QTUZkwEY+IiIacwXS1C6HlrZwFhQDWWoVP8N1zO21vq9La3OV5
         fHBw==
X-Gm-Message-State: AOJu0Ywe4uDh3NDS9O0b9RuQr396bAOrkbL607IdSSy+j5c5Z4esARvn
	EpZnku8Is8xI6gAaKL4aF2fTjHU7nF3hLg9H9WqMBXG2LRgLME8+N3Gy
X-Gm-Gg: AY/fxX5F1JmhNd+U/LkzupBNNuhXdyUaeUGGTtN+Jea+pGuQw7qZcc0kEoo9ZKmsI/l
	rAhspZJbA5pevJ1fW6QPrRM5IbYr31RGhSLZGF7rjBUrEfpIpoit1lT5uHUvwNGCTn7iw2szr4+
	QxxSZG0SgG+1jeap2gfLdVC2lYLFf500JKI2eJx8MItaU5mo4NBUrChdw599zofEtlqz3QjifPl
	cPy3VIw7g1LXeJshQs0NxZKF9QZOMjMh07rMp3j2MYF4+XzhAjIOFbD2QBLHDdQTP374LE7Dl2y
	EQiQa/fDMAEO9w1NxQM4Xz7kVVNHFmn6QqVa9mN04h9a47tg312T2uZlUcZ5ARJzElxlD5DcPYW
	eRb1+HNiC+FLG1u5kmQ43AWEfAOp2KD60eGzfT6wOgzkb4pF29K20aO/vRSA5aW2d3S4jozw+IN
	YHz7iSvhylkKyyZJWuayLK+SM7VcnOLftTssaoeODH15ngAzUptA==
X-Received: by 2002:a05:6000:2f83:b0:430:fd9f:e705 with SMTP id ffacd0b85a97d-4356999c900mr11283649f8f.27.1768737290046;
        Sun, 18 Jan 2026 03:54:50 -0800 (PST)
Received: from localhost.localdomain ([2400:adc1:447:6d00:1c1a:7818:23f6:aae1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356996dad0sm16368686f8f.27.2026.01.18.03.54.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 03:54:49 -0800 (PST)
From: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
Subject: [PATCH v2 0/4] staging: rtl8723bs: fix remaining checkpatch.pl
Date: Sun, 18 Jan 2026 16:54:41 +0500
Message-ID: <cover.1768736361.git.mahad.ibrahim.dev@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series addresses the style issues that were rejected in the
previous v1 series (Patch 3/10 and Patch 6/10). The other 8 patches have
been accepted into staging-next.


In this v2 series I have restructured fixes to apply one logical change
per patch across multiple files instead of grouping by file, as suggested
 by Greg KH.

Changes in v2:
- Fix open parenthesis alignment.
- Remove multiple blank lines.
- Add missing blank line after declaration.
- Fix line length issues by redistributing comments.


Files touched:
- HalHWImg8723B_BB.c
- HalHWImg8723B_MAC.c


Mahad Ibrahim (4):
  staging: rtl8723bs: fix open parenthesis alignment
  staging: rtl8723bs: fix multiple blank line check
  staging: rtl8723bs: fix missing blank line after declaration
  staging: rtl8723bs: fix line length check

 drivers/staging/rtl8723bs/hal/HalHWImg8723B_BB.c  |  5 +----
 drivers/staging/rtl8723bs/hal/HalHWImg8723B_MAC.c | 14 ++++++++------
 2 files changed, 9 insertions(+), 10 deletions(-)

-- 
2.47.3

