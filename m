Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC39E142E7C;
	Tue,  8 Apr 2025 13:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744119143; cv=none; b=L7fUcL62UInh2uNzss3m0k7zKtqkQVVvwAT5rwEPpm3h32Bx10NMFO0vHmny6U4e4iRVbqKZQLCTMT6jNbKB3XO+qmFCLLYsvp1wOzGZ8i2uyCp2ok7CnGIeUEJQsIoK4U6kQfeByO+wqMKwO/ikzgG96d4rUlM0JhGVXeVxBVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744119143; c=relaxed/simple;
	bh=hmK7xZSP/TrL/aGU4yYwggY4mAze38UQN+xeOLax+fk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=spcGrsGDdR8IqzuEqFNwunbGh+PuA3eL90v7U6yVFZBGSyKEG8s50kvvwjAWwOzYYw0xryTWcG1XfI8juF8rdTGKUe6jZf9nIRWiv5b6Y6L5jBMFf83EtXIUZQzqC0cxBoa0NPSunJrQXfjkwrcLemGeZEv5VNYWsf11k5uhQ7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iIg5Bd25; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iIg5Bd25"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4769b16d4fbso28052201cf.2;
        Tue, 08 Apr 2025 06:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744119141; x=1744723941; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cVc2yBWBNeVkQp8L5/khTVMylls0C7oPE8ISuX2JCkk=;
        b=iIg5Bd25+P9aGj7LB2LpEqT5eOnyBSW/uZ1P4flOG+RPXJls6KCN3wgBB9iPyaDvt0
         AClCBQ4LRyikRHdlnlaWP4q597koK2e/8+QgQy6/aUWq8JnRBPd21MIOYRgrE+mpzY5C
         DTu+KFjk12J2Rq2B3DQrNc4NEhvwNA2gVZPL3j+QeICrEan9nOy8s5vEnV3UetpYJyfD
         /LurPUZXSO/iApyrcQvoQ89jVEx5mPLgbZPR34ajBN8xA8BNcN/yGDV5rKIYqHzvUQG5
         +sgtNr4Yuoig/Cg3dz1n0/kgxu56l629viMznfPpldPM7kX3AAXsHPSuoQxJa3THCrBL
         MpAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744119141; x=1744723941;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cVc2yBWBNeVkQp8L5/khTVMylls0C7oPE8ISuX2JCkk=;
        b=ZuBTJF3xz5NDyn0/rL9CAJJKaEbQXnQEP4dQEbZsGph6YYFwNEcSUnU+n6UwPBbIQF
         A584EoTQpKHmv/bgj2rGSMVPjoUwjEzd58auV7iDc8WUDT0o7Cnkl6eRF6/Z5aB2wx5l
         jORXBTHusDcW+MOAer6/r1/5hXYQPO1dW+Ra1r3/nabzl6RX1RwEV7MX6n0iM2XkXcdo
         1n/cEw5YQ0lD/oSug/89acCJQNkrQbSyaAk1ZRHLITicPMbIecxd2Os2VMkuDJl87GAf
         RAFkWm/L73VWEwT1BoOoGlhvmZgndd0NNL52qWWrX+5HHNL+CW168G6iQWfjl1BmBYfx
         Xp5g==
X-Forwarded-Encrypted: i=1; AJvYcCUVq0GePI18yCh/gHwRSMzAwMnkzHCI3rpTgdwuisT/NAkcSm3MEp8crjskSAw7xgNT0r0gfb5FScO9apkC@lists.linux.dev
X-Gm-Message-State: AOJu0YxkUgpKys6O7EP5ZBInvWzrE9QVFSvzSMpYQJRW1qnikDqkPVGU
	/9A8dPnxwZsBTMHykaIP7xi1LOUWVR/cR0iz487ybUrC/lcijhUf
X-Gm-Gg: ASbGncvX27Wgs8yInA8xYqL7UJ+MtF6ImO50EjZCXWoz4bQb+79gAxIloBTwQcTkjAL
	I7zDvMSPS1vfYdmmh67r68D0qMe8f52QgrI25t62fspoU62hMdKC5Ssk2k/zCkLOznleYcu/dN8
	CiXKWPXXc9KHz2SLZEa5DOqcb4zsS1bJZsMP5HT0XuYwLU5Wt0+uYv11inpEKQluia0jGL/7117
	SeUa2qTkSaTwzj9d4vAQKQdIRpiydV4Mb2Ptoyw3WlNmoY1TJ1DdEbRGPUElNKF9wSnTtjN8b8Z
	fv/1Vp2qWP9th371SyJHkllKVIjsX4N72hS6mIrjXFGoJvY=
X-Google-Smtp-Source: AGHT+IHaAKkw7ePak1dBQHCJ57Uk2UodgseNi6b5nngGTa7XmLNaGUTdqsDKsZTYdaSV580TSeEK1A==
X-Received: by 2002:ac8:57c5:0:b0:476:89d2:8234 with SMTP id d75a77b69052e-47925a26e09mr191577441cf.36.1744119140612;
        Tue, 08 Apr 2025 06:32:20 -0700 (PDT)
Received: from ubuntu ([105.117.1.177])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4791b1444bbsm76281671cf.74.2025.04.08.06.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 06:32:20 -0700 (PDT)
From: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
To: outreachy@lists.linux.dev,
	julia.lawall@inria.fr
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	david.laight.linux@gmail.com,
	dan.carpenter@linaro.org,
	andy@kernel.org,
	Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Subject: [PATCH v7 0/2] staging: rtl8723bs: Improve readability and clarity of sequence number wrapping
Date: Tue,  8 Apr 2025 13:31:40 +0000
Message-Id: <cover.1744117091.git.abrahamadekunle50@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patchset adds spaces around binary operators, breaks long lines to enhance readability
and provides clarity on sequence number wrapping by using a modulo operation % 4096u, in
place of the bitwise AND(&) operation & 0xfff.
The patches are required to be applied in sequence.

Changes in v6:
	- Modified cover letter BLURB to reference newly added line breaks.
* PATCH 1:
	- Added line breaks to long lines to improve readability.
	- Changed commit message to include the information about the broken
	  lines added to the patch.
	- Changed subject line title to also include the newly added line breaks.
* PATCH 2:
	- Changed instances of `& 0xfff` to `% 4096u` which were now in the broken lines
	  after the broken lines have been done in PATCH 1.
Changes in v5:
	- Converted the patch with the subject "Use % 4096 instead of & 0xfff"
	  patch to a patchset.
	- Added a patch to add spaces around binary operator.
Changes in v4:
	- Corrected patch to use '%' instead of '&'.
	- To ensure this change does not affect the functional
	behaviour, I compared the generated object files before and
	after the change using the `cmp` which compares the two
	object files byte by byte as shown below:

	$ make drivers/staging/rtl8723bs/core/rtw_xmit.o
	$ cmp rtw_xmit_before.o rtw_xmit_after.o

	No differences were found in the output, confirming that the
	change does not alter the compiled output.
Changes in v3:
	- Added more description to the commit message.
	- Removed blank line in the tag block.
	- Added more patch recipients.
Changes in v2:
	- Changed the commit message t a more descriptive message which
	makes it clear why the patch does the change.
	- changed the subject title to include `4096u` to show that an
	unsigned module is used.
Changes in v1:
	- Added more patch recipients.

Abraham Samuel Adekunle (2):
  staging: rtl8723bs: Add spaces and line breaks to improve readability
  staging: rtl8723bs: Use % 4096 instead of & 0xfff

 drivers/staging/rtl8723bs/core/rtw_xmit.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

-- 
2.34.1

