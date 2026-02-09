Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B94436AB43
	for <linux-staging@lists.linux.dev>; Mon,  9 Feb 2026 11:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770636757; cv=none; b=GvlyhBriB9zUIXeVmsXB1ditII/jKYQDWxCC6GbyWQgY5oqgnjaThjLmGNAUnedoqnfaII3iNIHCIHbAf6FC9vzNxIRmJQ9HTHPeYyw4W6tgs7CYFJe8vEnDnwZ00RcDy3rTvZA0HTP/N6hUD6A97kPbCg9Ux9085rDEza/fuSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770636757; c=relaxed/simple;
	bh=tSWRdzC4a3WDHyz7XlQQ6MAiFTM6UL85drpE4MqmU74=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B3oetk+7G3TzZt/STkoL0hknttTRwZP2fcbIRnLqYFyHwVBkUH47poYdOZnJ1001VSZiu4uh6fTU/JfIsVaxmz/lL6oLHj5rtTfonHdkeQQpUeAgPayNBC5EbcVE4wzdJDiGd73wVmFsbMg3pgMMtVc9WvN5L/bICRTrH6AuLso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kqs/TjUP; arc=none smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kqs/TjUP"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-64ae222d87dso785638d50.2
        for <linux-staging@lists.linux.dev>; Mon, 09 Feb 2026 03:32:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770636756; x=1771241556; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=asWaBYGz1asQnuZq//tgnG9kFvU8iKKb7INHWmTc6DA=;
        b=Kqs/TjUPjwukTiCxeORCxuMGPaQD4OSl6FuHiIBBMknytG+5ya60FEO47lv596bkEK
         L0oEGYJdxgJfLuAtD8zZsPr2RWZUviBdnlvtyt6NcbdHh7bYLZ7xRuUfa0Cf30haJax2
         3xwVh6bXWrBhp7WyWa3dvNW/0c9cWP0II/AwVF6O9HoKZSI2SVynOgKbvWI8u9ARj4BF
         r0RlHvGHs6dp4p2q7wiQxvFE6XsBz+c2ifI/tb74ja3FMdlBNHoXocYACv1kb9dbn5nL
         q+Cr3i41RVV3jPFcxDDAU3F9EPhNk6kwnIUOzyFeX/wlcInTzRa/vY1xNkmFXvtSKv84
         B67w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770636756; x=1771241556;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=asWaBYGz1asQnuZq//tgnG9kFvU8iKKb7INHWmTc6DA=;
        b=N6zOi47Cu69DKcHhy8039hleoYs5kHDSYe5f7aRWDZK7LoPgMGt2Goi2IgMssfAL0y
         q7ml0UVEnVh/Ab0x+viShu7qFUtf1VzLvbVFPy/xY/EJigroQaotiTPsGX/tmgRLjnsx
         tXKWq3VYtEEpjfHTA+I6tdsqqpAKZcsKeVaOIaHH7KPBHcaKx8FPexX1XJ/wZsSWenpm
         RpxcxQ+JgXX9JnVLbWZY/X9eD7g/tUW3E9iUdo2nnj+5FMDbaEpIgo9mPDf6lu3GHbX2
         F/nM+Df8QJwMEFM0B5YwYBtPlARvNgq7NYX7YDoBrnp9AvYTcDTRrUMjNBbVsigyeVVf
         DD9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVsPdncVeGq0H3qBJvauFh7mGoeHxyVfbzxoqBjzd6t95ra4jbQZRMmNhnvOLGbkbhg8cicjZnZs9ezAbhd@lists.linux.dev
X-Gm-Message-State: AOJu0YwFiOlfdBcwX7HnCGJlwkEfjrxqacx7iawN7dKbZN3Ie4tdne31
	UoUKNVP9KHVPJCinNVU3efnAN4tjXKk4YFZhYZqbaV1JPOMft21/4o6twJAd3A==
X-Gm-Gg: AZuq6aL2dfmvX8iRMyB4l9z2Y/uaiVxrZhmEDGOQ7W0m+5MHdcvYpnrqPSw55hYemWe
	5ybeaNqqKdelDfOSctkc6w2NBYfYGfY7cm+r76GZZ63pHDKNfPrtW5ELrlILS+JeDsKO3aaeoJ5
	a7a4BbCqMx4UChHWa9sF3pfGq5Ogh9bP90s6Q/Fbvvc/A2Tt2xsUkgT2JAfXqZ+u63N0EOoqGNL
	mH7LrLXKPVy/WDAqd5G8GYVoueedcjoD4v5v3a7ZEMYM9VAiVfRG6WHm50HLAVg8AaDtc1sm8er
	Jjnsl2qsTWx5r27Do605OpL6dGYTdWhlE5r8xJa7NAJ4d1NEd0YMrmOXhMaRcfbf4g6TDFPmg5K
	PwDev1gOtfBtggwde1DZyNAJtBPAVjbZ/6VLLGowDyt5VJq4SQJcc2f6Xb4HiWZYLSF67k/bZ9p
	OsOnx2KTU2Tzqeb8/039zLf0mh6U+QIKbmAZLBwxuz4YPmD3VLKHtEuYegFL2iDAGt
X-Received: by 2002:a05:690e:2106:b0:644:5419:2e73 with SMTP id 956f58d0204a3-649f217be61mr7009138d50.76.1770636756347;
        Mon, 09 Feb 2026 03:32:36 -0800 (PST)
Received: from gustavo-arch ([2804:14c:f25a:845f:5b8d:2e7c:d238:2d28])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64acd247ee5sm8765595d50.6.2026.02.09.03.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 03:32:35 -0800 (PST)
From: Gustavo Piaz da Silva <gustavopiazdasilva2102@gmail.com>
To: gregkh@linuxfoundation.org,
	dan.carpenter@linaro.org
Cc: ovidiu.panait.oss@gmail.com,
	gshahrouzi@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gustavo Piaz da Silva <gustavopiazdasilva2102@gmail.com>
Subject: [PATCH v8 0/2] staging: axis-fifo: clean up probe logic
Date: Mon,  9 Feb 2026 08:32:27 -0300
Message-ID: <20260209113229.7871-1-gustavopiazdasilva2102@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series cleans up the axis-fifo driver probe function logic.

Changes in v8:
 - Reverted line wrapping changes to keep the diff focused strictly 
   on logic refactoring and avoid unrelated whitespace noise.

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
 - Split the original monolithic v2 patch into two separate patches.

Changes in v2:
 - Fixed checkpatch.pl coding style issues.

Gustavo Piaz da Silva (2):
  staging: axis-fifo: use u32 for fifo depth flags
  staging: axis-fifo: refactor device tree parsing

 drivers/staging/axis-fifo/axis-fifo.c | 59 +++++++++------------------
 1 file changed, 19 insertions(+), 40 deletions(-)

-- 
2.52.0

