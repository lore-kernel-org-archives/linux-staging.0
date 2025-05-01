Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C47528382
	for <linux-staging@lists.linux.dev>; Thu,  1 May 2025 21:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746135044; cv=none; b=g+RjzOmhbBhoC/wqHkXFC2JW03oW9Du0qJbWkakYp9ZzOd0NvdPWRkJNVZvPaFGMSlweT7pfJxxFyBb5vI6wn+Xtva13hkO0EvFM0LDvcgWuOSChx0zm0adnfVZAz616SzEIBr3M3xVSNYG7MgEAlAz6P3hxPsi6oyC1TClwNFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746135044; c=relaxed/simple;
	bh=YyW/COy8u0xSHkNYfU0H94CrJ1LP/F4ydjWB0Z03IIw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=t2eG2X7dVhX8TJt6p6rli7xgobcNt5TFgD7oijz2ACCs33hi3Q0BQ9HrfNj+Y+XT0O0r0ho/8+P+wRCWZjK7vFNK49Mk57EO8dZ8DlVPg1xUWapwYb5oRXmjsAzgAmhhl338kEgzhfJ7HeXpcqIG8ajl3B+JupVdR7MCGthFXTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=khiy+a9s; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="khiy+a9s"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-acbb48bad09so237543466b.0
        for <linux-staging@lists.linux.dev>; Thu, 01 May 2025 14:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746135040; x=1746739840; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iU/SN4E12P0EznwvjosLSqRTc+oShnSCyWHNdSLiMcA=;
        b=khiy+a9slcYp/yTmwlVabCYHLEwNdcv79b54LkCnULkGus9irZZ3/qgJTdL2TWKxSe
         PAiOwyaiNxMLS/EwQy41J4Jrvj+7WTIxkcxxZ8IrernzbQlDPWP/Cgr66z3nBTFI9CXP
         3upNctDhjThLF3M/EwKJmGUUUiJNQiQHmjU7o7hBexbKWBOs/nTmhWHb4/ZafEBYgDjl
         lJrYuo5TtBgeQ9Sn3/b2Bedm8iCiwG1Iem1FI/hARqXDbzVgdJYQRDUQY9VtLt5TspsV
         CikaVm2M69Na13y4v9Mo8fFz4TeqDC1c/rO885iUkimJW22ArZ4/ENjcgnS5z6SYWCml
         xYnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746135040; x=1746739840;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iU/SN4E12P0EznwvjosLSqRTc+oShnSCyWHNdSLiMcA=;
        b=g0s1VJEhQPhlioxZpOgIV/LqoVdyToiLWwvpD0Oa5wXQQtw0MR6WvgM+02k/rkM/Mx
         SSEub41ar3O44eqLs70qkRnYVjcBwI3AKkNEHyM+n8JB380uwz7zlQqhGrXpnzlJ8QN2
         YmdpFBHtuum3p7Y6iu2iDnYqiULr9tMHOuDiZkS+v4ay1kpg+g+U4wUSYYJPJPBjpwMh
         juk20xQVs2uqCcCEUi98pzxJBOYLUpJJ2QJn2KxSyGtq1He/CU+91M6LH4EpvexigyqS
         G1nBCxRHWTEnH2L5lLz4bYFhZ42ohR/T1gvGhtjJaJ8D9+FuMqoVBGvqmtsdLbkJdRlO
         mlMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzUkMxW8IGf9J+4N42WzdpFvS2YP9HuBh34RbwbIwMwpvh40c8ZA/KAVHB1HvcIRc1ON3ukMcPk8WWBuRu@lists.linux.dev
X-Gm-Message-State: AOJu0YypoLI221ureIJQGKFiPqByDIjbW74OB9wRj1aOt4inhGbBBscz
	TfhWt4OLNWmX5hVujdhAsAg9nAGX/W+qYp58nvDdjIgXBhIBGelz
X-Gm-Gg: ASbGnctYN0tW/qo+YONt9KU3rvkvNWcYeCAMTtEauzW2FwVCzLrzHGHyEyT/hk1Afbq
	PQzt3UzDpHXgyw4ttlOpya1rUl7amZe5mpgSshM1OiGmpDuPZi2ulvHnKqqM8DVaQYIRndauBAW
	oST2rjL3szS332EAvIO9Gs9m7JPELGBDB02fbRg7+sthEG4yL0eniXTjHs9fTDnEKEdefoN3AOd
	4NGRbITeWR4+6GERzb0z9LdCbkvpS3fxYvhpAJg6pGMwTC9Y8fbQNDQZDxmSGiFnmLtrZWBSv+2
	FQ2BgYgohaZhzm0szvg7//niU/7fw5hVV9R0BsZOfW1nRIT10F6w0KX2xw/AMTP3WM66ZxubwKc
	x3lTx9nw64e+aexmd8DwTQ/daNXsw69daaUeglJ84UWO5OAjV1qMEOKEcReV8/ddIOfeGG8uJlR
	zV5g==
X-Google-Smtp-Source: AGHT+IFBTxdVdQrLfnEhXg0W6c/Yj8/PyvkL5d89UZu3/fKawbDUQB7kLSAVoeyo37fJrpZwjPTuBw==
X-Received: by 2002:a17:907:728a:b0:ace:5461:81dd with SMTP id a640c23a62f3a-ad17acfda03mr73271966b.3.1746135039633;
        Thu, 01 May 2025 14:30:39 -0700 (PDT)
Received: from chimera.arnhem.chello.nl (2001-1c08-0706-8b00-41fd-2957-14cb-eff7.cable.dynamic.v6.ziggo.nl. [2001:1c08:706:8b00:41fd:2957:14cb:eff7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad0da560a63sm96466866b.139.2025.05.01.14.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 14:30:39 -0700 (PDT)
From: Thomas Andreatta <thomasandreatta2000@gmail.com>
X-Google-Original-From: Thomas Andreatta <thomas.andreatta2000@gmail.com>
To: dpenkler@gmail.com
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Thomas Andreatta <thomas.andreatta2000@gmail.com>
Subject: [PATCH 0/8] Staging: gpib: Update return types and error handling for request_system_control
Date: Thu,  1 May 2025 23:30:29 +0200
Message-Id: <cover.1746133676.git.thomas.andreatta2000@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series improves error propagation in the gpib driver by changing
the return type of `request_system_control` and related functions from void to
int, allowing proper error handling.

The changes follow these steps:
* Fix the FIXME comment in agilent_82357a.c by changing the return type
   from void to int
* Update the function prototype in gpib_types.h
* Update all implementations of the function across drivers to return int
* Implement proper error checking for the new signatures in the resume function
* Improves the mutex unlocking path process in the resume function

All functions that used to be void and didn't had any intended return code are
now returning success (0), and the resume code is refactored to ensure mutex
unlocking in all execution paths.

Thomas Andreatta (8):
  Staging: gpib: agilent_82357a: changing return type void in int
  Staging: gpib: Updated return type `request_system_control`
  Staging: gpib: Updated return type for `request_system_control`
  Staging: gpib: Updated return type `ines_request_system_control`
  Staging: gpib: Updated return type for `ines_request_system_control`
  Staging: gpib: Updated return type for `request_system_control`
  Staging: gpib: `request_system_control` error handling in resume
  Staging: gpib: Optimize error handling in agilent_82357a_driver_resume

 .../gpib/agilent_82350b/agilent_82350b.c      |  3 ++-
 .../gpib/agilent_82357a/agilent_82357a.c      | 27 ++++++++++---------
 drivers/staging/gpib/cb7210/cb7210.c          |  3 ++-
 drivers/staging/gpib/cec/cec_gpib.c           |  3 ++-
 drivers/staging/gpib/hp_82335/hp82335.c       |  3 ++-
 drivers/staging/gpib/hp_82341/hp_82341.c      |  3 ++-
 drivers/staging/gpib/include/gpib_types.h     |  2 +-
 drivers/staging/gpib/ines/ines.h              |  2 +-
 drivers/staging/gpib/ines/ines_gpib.c         |  3 ++-
 .../gpib/lpvo_usb_gpib/lpvo_usb_gpib.c        |  3 ++-
 drivers/staging/gpib/ni_usb/ni_usb_gpib.c     |  8 +++---
 drivers/staging/gpib/pc2/pc2_gpib.c           |  3 ++-
 drivers/staging/gpib/tnt4882/tnt4882_gpib.c   |  3 ++-
 13 files changed, 38 insertions(+), 28 deletions(-)

-- 

Best regards,
Thomas

