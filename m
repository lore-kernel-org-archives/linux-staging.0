Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1039346E60
	for <linux-staging@lists.linux.dev>; Mon, 22 Jun 2026 22:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782168260; cv=none; b=jW1k1u0h5gBYj/06FJLEdnxOBDWaHnhplOiZueC7i15+Fj/Ltj1f1UkNe8DFrL8FkRYEj/wZeFJu3oRIyBOUmllR5JPe9wfavGcamXRAWm9jwCdusiTwg4OR4NH9SlozfdUjiKJJ5iSwkXDkLEJ+qKQy9IhBafmNzuuUy2PGRAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782168260; c=relaxed/simple;
	bh=W5lWlahgJwGGtGLW0ih66TpOa9zremeMUWH0zXFLfPA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MMO7NSVfnpKMEHT5W92MWbz5JGvYNQcPTA/T+fNOSI7LSWBb2i2OFI36f197p/cw48jqXiK2cUtySo+w3/w+uaYn4zTeTACzvHFMJWRORflUvQvzoNC6cjhYscI3/7lqZwrEeESAZdxPiJLBwv+akLKNBtAg8oWaj8Pzrt67qjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KhfghThs; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KhfghThs"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-30bf8b2bd20so8946727eec.0
        for <linux-staging@lists.linux.dev>; Mon, 22 Jun 2026 15:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782168257; x=1782773057; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9Js5zTXLWCpFXjeLRJmY47TLMJHvqvUtd9vW4J/ry+I=;
        b=KhfghThsPaR+Q99IZ3OnYUGntVEvQwuegeKLE3cjzCJjjWPTWBcxUOlwq91J7I9K3C
         LikN8BM+HDtBZo8Q3nWCb82Bk3U+AirsWgDTX44hBqT7S0nKwx0m3eITAjaU8Ad8S5OV
         PZfIyoZaCKK/Z2rs0J9M7D1tGnJc8+3DxQD59QZzTAT7slG11rPl+5SzeC9dRserK/ho
         um3pmqf09iiSrlTHODFtnMrZwe3gspdh3ASb2F9nac992nHw1lrcickEzvbMZpshErH7
         nqlo0eetW1DSBiBD125a8lnFLSKHcvbfImfA96gWpWXu7518pmjG+SUutQtRtZWUQFV1
         +zLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782168257; x=1782773057;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Js5zTXLWCpFXjeLRJmY47TLMJHvqvUtd9vW4J/ry+I=;
        b=FpHdCBWPeRn4OVQ7wiLkDf5XD1GR2BSMD3Vne4sP3wYpaa+T7dB7skgS2yFDWPsuLN
         LesWuL8C0T5Wc5zum+66M735tspDVSSnpcsoZjc4DaUDnZXnwJeamGdS42sTHpI+MG/+
         mVIDyHJrw0IRC7DSIfocPf14hJVAW8sVSoznJtecf7wwW0gfwcTLHjvrfBQH7AW7m9o5
         YX6WtCUVAsGuW8bX6HhY0X/8bYm4RQn6885UPvBcvKyCdoKgZng+v7pSaaVwWEU6lEld
         kYkBGvJ4QBN+dwLhgt/IhRhJdhlfs3BkwpVRgn4Jx8jdCSHyqJTKXud2h+GwSBS1sId+
         ibNg==
X-Forwarded-Encrypted: i=1; AHgh+RqjEHe/62m81AUuZxw5gUyDkpOobHSQVrOFmYW0D1x9tJYb59ky6qGl25Pq4VVzhztonIqf3532bSH0s4VL@lists.linux.dev
X-Gm-Message-State: AOJu0YzE9AURcdrlqEkXhfQgcm5JPBumy3ITJcb/zLQlUF9KKxEPhiYz
	SkMynq0MH4VJvmUp//jzpTh7gJPv4ZPgFpjlMWmRwN6fPIdz2dljV782
X-Gm-Gg: AfdE7cmSTKGUN5dBz4zn2nSGuugYmS9c8F53IP6D1+vE4ikkeb2EnbUuaAH6Pkgifkp
	HaU+Om1K+QBK8/EluxVoSTw20fwIiMimeAGq6idtId2YVoxjaWexFdtg2V9cGzqUHQ9dr/v6mxS
	LCOPWl3tK5C29+DwXIOFi34iQBRthKYl1wmYwl3YGn+LJqlROzp4154g5DOVaPoBsKzk4eqXChJ
	9/K+DFjdV52UPeSbbf8lkl7deQKZSu8/rOBNFLmBHxq0VsPfuE6eQyM7tWB4qr8sPYLlY0Sn+d7
	f2RN9aoMcNGIPEh7b5ULzdGT8691DpXYP4bXo/TlfEDwiTYOgDidMICYxD/bJr1N7q/KkBiahXT
	MgHdGbsj9VbQvCE+hJrlTQonCCLOh3PlqXZsYM8rIfWnmj4+laSY0a9LziXs+uGF5Kpe17g2Vi+
	o90pkKAEstDSYCilKy/xKSFIMpsplpCjHZn+P7rxhoUPzwooeBst112pUiwDqORqFb9BU=
X-Received: by 2002:a05:7300:ac8a:b0:304:6d18:3646 with SMTP id 5a478bee46e88-30c1d5955c6mr8674408eec.0.1782168256832;
        Mon, 22 Jun 2026 15:44:16 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:4c64:82a2:691c:629b:eda4:7c2e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c1ba1c376sm13087954eec.3.2026.06.22.15.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 15:44:16 -0700 (PDT)
From: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
To: andy@kernel.org,
	hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: ~lkcamp/patches@lists.sr.ht,
	linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v2 0/3] staging: media: atomisp: use kvmalloc_objs() and drop redundant OOM messages
Date: Mon, 22 Jun 2026 19:42:41 -0300
Message-ID: <20260622224402.34001-1-rodrigo.gobbi.7@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Several allocations in the atomisp driver still size their buffers with
open-coded multiplication, e.g. width * height * sizeof(*p). When the
dimensions are large the product can silently wrap, causing kvmalloc()
to allocate an undersized buffer.

Convert the remaining sites to kvmalloc_objs() with array_size(), which
saturate to SIZE_MAX on overflow so kvmalloc() returns NULL instead of
allocating too few bytes.

This continues the work started in commit [2], and picks up the stalled
sites from [1], unifying with [3].

While here, drop the redundant IA_CSS_ERROR("out of memory") messages on
the touched allocation paths: the memory management core already emits a
far more detailed warning on allocation failure as raised at [1].

[1] https://lore.kernel.org/all/20260413112904.98864-1-feng@innora.ai/
[2] https://github.com/torvalds/linux/commit/d178c7ca8fefc28115d35b94c3b1f4d653e34182
[3] https://lore.kernel.org/all/20260609215110.118860-1-rodrigo.gobbi.7@gmail.com/
---
Hi, all,
Regarding a comment from Andy at [3]:
> From: Andy Shevchenko <andriy.shevchenko@intel.com>
> On Tue, Jun 09, 2026 at 06:46:31PM -0300, Rodrigo Gobbi wrote:
> Replace kvmalloc() with multiply with kvmalloc_objs(), which handles
> the size multiplication internally with overflow checking, silenting
> checkpatch warn.
> 
> Signed-off-by: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
> ---
> Hi, all,
> There is a ongoing effort like this for other files from atomisp
> at [1], yet, it is not covering the same file.
> Tks and regards.
> 
> [1] https://lore.kernel.org/all/20260413112904.98864-1-feng@innora.ai/

> Yeah, the problem is that the activity seems stale. Can you pickup all
> the patches from the mailing list that have not been yet applied (regarding
> k*alloc() uses) and combine them into series or so and update regarding to
> Sakari's comments?
The only patches that I found from stale threads were added in this series,
hope that is fine now.
Tks and regards.

Changelog:
v2: convert to a series with additional stale patches;
v1: https://lore.kernel.org/all/20260609215110.118860-1-rodrigo.gobbi.7@gmail.com/
---
Rodrigo Gobbi (3):
  staging: media: atomisp: use kvmalloc_objs() in make_histogram()
  staging: media: atomisp: use kvmalloc_objs() for overflow-safe
    allocation
  staging: media: atomisp: drop redundant out-of-memory messages

 .../media/atomisp/pci/sh_css_metrics.c        |  11 +-
 .../media/atomisp/pci/sh_css_param_dvs.c      |   5 -
 .../staging/media/atomisp/pci/sh_css_params.c | 101 +++++++-----------
 3 files changed, 41 insertions(+), 76 deletions(-)

-- 
2.48.1

