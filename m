Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FDB442BC38
	for <linux-staging@lists.linux.dev>; Tue, 14 Jul 2026 22:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784069566; cv=none; b=Ot7yVOp5ifuaNeHg4OEc2KDXp/G1KpboS+k1D0nlOhZ7t/H75wjDYmxuK4dL9yOG7Xyh+KjnCEAORoUlo7LUKzMxSzyUXmUa9es3slKR8iYEPP2/JOIcq1YuJWOftFfG7C3j3b/vjRSkOrciENtmRh0tQhmVJbuqVWNCMpZxz64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784069566; c=relaxed/simple;
	bh=hII1+EpO76dP+zuiHl33FQnNw3xAMPFb+8sWj3r6nIc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f3znNxDF8IceQtVsyKFzTn78GwaMkP7ix8/yNJGNJey6w54Tt/hvz7UtZYANjrM2knMTR34mhAltp+lXDLrveAmhE3HDngrJ91WSqjGD+nrxpu1iMSEKJRx8COxIXtAEqAsqf+71NiE8yqAhuy47EhSnVmSVy/EeyvVsX88jaLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m+wm13jV; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m+wm13jV"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-81e6f2ee60bso856287b3.1
        for <linux-staging@lists.linux.dev>; Tue, 14 Jul 2026 15:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784069562; x=1784674362; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XaVrA3HODxV67MqxZaxfvdN/jDJhMYGWIyIOq2g23Ic=;
        b=m+wm13jVBOvuDCtmVtminfWwVAf0nKFAdHV8Y1PuJYsBgsDwPy/bG8rJRcqU1Jk8XQ
         zSITtcVjVFnvPvH7BMwjlXo85YJlxfcPyn1H0Z10ghzwm9cPV0J0igeRfwvJJGUKjxJ+
         V161ytCesyaOhs+Mc4+eSrEFBS5xiBL8husp1WVErFatE/BFCU+KBCQacjPkelAbb08A
         DfrBcY6tloE2aypZqOXW3kbfHGK5KS5GGoQ1c1u+kvWlIKuPNl/nftKlnyae3lWhvB0o
         vRCad15mmchM4cwIodOE15nqRJ1bJzVIHJ7tuq/52vBugBMHmjepDn2yaF5cTtmpz0S3
         PjqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784069562; x=1784674362;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XaVrA3HODxV67MqxZaxfvdN/jDJhMYGWIyIOq2g23Ic=;
        b=WbXSwvnT/nS5vuVTuP7iXu3sEEjyxj5vmDRA8LZz4d2KOzmeuFV2o0zmutW5b+j36Q
         HeYt55PdmzMgyC9+E8dWdz6cjUDtd3SgchNIa0GJrqpRlDdOD/z8RZa9QywRFGl2/tuj
         lv/DEM5NbdpT1UBEPUWlK5qBHgzSQ6fIlNsR08iCeU+ZU7ZmOq9QjZnPpE2kCvf8cbTd
         SQlKs//IYl3/Cod6U/32/+3InSMBZK1P4QYKKgLOzml9D6gKwuZ3DWy4RaX82C98zEpG
         pnmCYUNF6xCqgUlifRXSVYOUl7Bw1/qxg+nCSeOJZCSvwyLrJguxBKgDNiw+CDcXVWAf
         mZWg==
X-Forwarded-Encrypted: i=1; AHgh+RqnFLMMrfKq/HKxR09SSp7LGdF8FuvrnLQUuIDv5RJxB0CJH+NERtV0wnTM9o5SEmp8jXvuVJCy6P2xn4Ee@lists.linux.dev
X-Gm-Message-State: AOJu0YxXGB3gax5wBViSXs5Ddhxk3gr+sRAhsEYlqQvECRrppLYwatWr
	38BjDpCWvn0rp26KftjyM/k54STD3WErm+F4RHRDMD/gQ6QVZTvt+pwg
X-Gm-Gg: AfdE7clzEvSqEHvna0vY0YGeJvUTDmILft8EJQw2IeCEGVqqq9E/GiKaDdK8hdjPWuV
	45YSL517HONB0Rpl6tmwvuJgDHSNQ4+NJ4BOdbHwKTFIevTsp/Qso5n1jroJ7iHEwWmbyC2NXVV
	/OFTa0Z0WXhjGzUQodzfXmd1/NYKbPn4P5H2/EuOSV3dV4ABIw+CiJ9xUbu4KAsrogFWCX2teiR
	eoIlM0oyv+n2+0hdkPxhDhKmqDLLRQZ8FsJ0DDF3qXIRd5chFs8YwzTm43RXBWnWVmEoBnVwWlc
	MI6CZtP16Hw6uRb2E5eC2WUuGjdxxr/8eLrnLfb7IYM8hfcELGXgr7m6HQXkQyaYpxBmF/5Dqgk
	L1ocQc1Tzaud9Ux6HViGF5XhKctSUUiFUKUc4XG3KyDYyj4bLCjqZBhI7Wh9ExH5fJUAe0Z+eGF
	CLKoMp4q0yDR9FstxbbW+eDyOwLjOWN6mqZWHMNm0UsLn+k5D4ZS+CgZobnIaeul26pA==
X-Received: by 2002:a05:690c:399:b0:7ef:e7ec:b6e7 with SMTP id 00721157ae682-81e7bc9497cmr150082747b3.27.1784069562556;
        Tue, 14 Jul 2026 15:52:42 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:4c64:82a2:a510:f4e7:1a8:cf71])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6c249b87sm153446897b3.49.2026.07.14.15.52.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 15:52:42 -0700 (PDT)
From: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
To: andy@kernel.org,
	hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	feng@innora.ai
Cc: ~lkcamp/patches@lists.sr.ht,
	linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v4 0/3] staging: media: atomisp: use kvmalloc_objs() and drop redundant OOM messages
Date: Tue, 14 Jul 2026 19:48:59 -0300
Message-ID: <20260714225235.47134-1-rodrigo.gobbi.7@gmail.com>
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
[2] d178c7ca8fef ("staging: media: atomisp: use array3_size() for overflow-safe allocation")
[3] https://lore.kernel.org/all/20260609215110.118860-1-rodrigo.gobbi.7@gmail.com/
---
Changelog:
v4: 0002: use the full commit reference form for d178c7ca8fef (Media CI checkpatch); collect Andy's Reviewed-by;
v3: https://lore.kernel.org/all/20260623221028.40238-1-rodrigo.gobbi.7@gmail.com/#t
v2: https://lore.kernel.org/all/20260622224402.34001-1-rodrigo.gobbi.7@gmail.com/
v1: https://lore.kernel.org/all/20260609215110.118860-1-rodrigo.gobbi.7@gmail.com/


Feng Ning (1):
  staging: media: atomisp: use kvmalloc_objs() for overflow-safe
    allocation

Rodrigo Gobbi (2):
  staging: media: atomisp: use kvmalloc_objs() in make_histogram()
  staging: media: atomisp: drop redundant out-of-memory messages

 .../media/atomisp/pci/sh_css_metrics.c        |  11 +-
 .../media/atomisp/pci/sh_css_param_dvs.c      |   5 -
 .../staging/media/atomisp/pci/sh_css_params.c | 101 +++++++-----------
 3 files changed, 41 insertions(+), 76 deletions(-)

-- 
2.48.1

