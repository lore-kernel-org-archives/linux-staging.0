Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678998F77
	for <linux-staging@lists.linux.dev>; Fri, 18 Apr 2025 17:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744997697; cv=none; b=uIbP0txz38VwV1P/deLMRX00iUh5AF2FEtUGCOk4ORHzGknJSX97Hmakt7M9MJxiEwXbAPXz1R/Wz9ipiZUG9F8fCrpNaKEfL9OYSyJjc6MVUIY7VxjVO6nNHL/5nkG3H3Q0/LlSwa/S/3TWYo13WNdJ7CWCwy/sfuzh7PiDofk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744997697; c=relaxed/simple;
	bh=+Cfmlh/tFskvomgcuf43AocP180cBqSgLobstPW/aU0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QVJ1Igr6bMWXpOaYUV7fvfcS5hWyicVVRw9FiYRdBVC1nQ5NLOl1pAnCNKNAITexAPQ/oCxP/v7lVjGYZ4WA3bpLbibaRCFsIPlazzxNQEALddHEPt9AnP08dSUrVJNR9n9LnVuFEUvHq8aUrXEQTOxv3Ww2u6LKeN1B+zhhLiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mDUbfwwV; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mDUbfwwV"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43ce70f9afbso18187005e9.0
        for <linux-staging@lists.linux.dev>; Fri, 18 Apr 2025 10:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744997694; x=1745602494; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Eny/t4ZgpgtXxVb00JLrcfOtgOyKPjsxmDHcNqfqiQQ=;
        b=mDUbfwwVE7kRf5m3yjaxdotsVbAhnjOhJdjuur8xuqIatdc/y/dF/2fcTpZUEJ3v+f
         QpqrrbE910NU8v+K0bmtDVlIOGxg8PQDpQYCUj0/ZmKPZioJfujsswtWJhZzVfAh83NU
         DUE5XWzptW1w1UNrP5jx1GUKdnUYJ+abm1htR5KkHnGtpAJqtQDrFDcS2VnsEyo5EaG8
         kxWKHXzphurrCpthYhkPZbnOh+Vp0Dss+fQmKr8q5bG1OSwWSsdLlbNm8dBcK3XNKcSk
         ccL4oNskPG/uwSeYoU/RAoOWqJ5HRWItIxiT4auw8D3suXzxHJ9/lHKV10Giy6ntXu9I
         W+vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744997694; x=1745602494;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Eny/t4ZgpgtXxVb00JLrcfOtgOyKPjsxmDHcNqfqiQQ=;
        b=dptipES8snFymSIEgH6PdFHJCOUx2fZkoPSmrOVkJytUm0OWQdEzhGEnR9YKQn95m0
         jsKsTbhRrhubJ0mhrKgjGyOqlX3ex3ZaB1ZFGrOszrNkmmLe+OpeEmJ0VbLGMLKrW7bp
         jF/J9Om0399u4275fcCHvMhVbKR8U9q0FneesJVBZGfPKp9xvl1wi1RIuYVxy5QuDd0w
         Ns5S40LiOTSJJ6/Tskif4MYX1Ynsv9uWEfjmKMALsu46w/9B7EgqK2mveR5E+nAlpuU4
         lLX9lufMGK5pl5RGzkvtDC01V8yWmqL3A67+4gkZiBkNm7skz4cyRGs2PNh13rLigj4g
         nCXA==
X-Forwarded-Encrypted: i=1; AJvYcCXWtzY5uhW+xO9VrDAuy0d7iqWZ66XvXVQTNou4XiQw9PyT3q0/w7AmpWJ6MTaLLBKKIRtTGh6jkAZceBWG@lists.linux.dev
X-Gm-Message-State: AOJu0YybHEsG+ZAoyu0rzgjeb0d5qYdqsEtAbT4aqFSX4bHAsNVW35Dl
	HjtCPIIQmITFPYQ7kNj4Rq5UMI9YAkeQTAwsNUtMPwq8RglRTxDU
X-Gm-Gg: ASbGncths//YgfP+jdlmx55AKYHu/2fUyEjOA7UUe4usjztRoba3g7U6AaZ6iY1afWd
	g/ngs60lDgcjWlS9z5P8VJT9g1+Oj1R+saNH98n3bT5SfZQf4i2DKoHT82NFSS8WhO3Dg4QiJ9Q
	cTain7aftJxW1/KDwRuy4wB17iQsweaM6wctKWvvVsxN1Mt2u9eKMAyrNzApDuZ9QyJglvHJcx/
	8M0iz933lGKvXYYmEG4MwMw+ZZthzG491z7MdkiW09BnW+6SNVakSLe20KBlpTiASa7WeV+K8RM
	mC8p5T8KJ23ABR198mOdmsDHiqtqlAVT9vV1Q+vki5fv+jLr9wQYatLipJCpt2rMZrrMO6WYvCH
	+jPY5sJhAiX8=
X-Google-Smtp-Source: AGHT+IFXrAWBOqPlUUZP+RBiFOy3JVuCE+yAXQdvYnHWj4oxZYbr+Maj8YlJM8WlYKKMBWViZ1RPRA==
X-Received: by 2002:a05:600c:cc4:b0:43b:ce3c:19d0 with SMTP id 5b1f17b1804b1-4406ac176ecmr31651665e9.29.1744997693568;
        Fri, 18 Apr 2025 10:34:53 -0700 (PDT)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4332f8sm3287320f8f.40.2025.04.18.10.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 10:34:51 -0700 (PDT)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: marcello.carla@gmx.com,
	Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH 0/8] staging: gpib: Fixes and cleanup for gpio driver
Date: Fri, 18 Apr 2025 19:34:26 +0200
Message-ID: <20250418173434.2892-1-dpenkler@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This set of patches addresses a number of fixes and cleanups for
the gpio bitbang driver.

Patch 1 Fixes the faulty implementation of the request_system_control
        function.
Patch 2	Moves the code for setting the controller-in-charge to the
        correct function as per the standard.
Patch 3 Defers enabling the SRQ irq to when becoming system controller.
Patch 4 Removes need for cumbersome setup for the activity led with
        the yoga board.
Patch 5 Removes a no longer needed workaround for missed irqs.
Patch 6 Corrects the error return for no listeners so that the user
        library reports the appropriate user error code.
Patch 7 Improves the code for the allocate_gpios function
Patch 8 Fixes potential hangs due to undefined control line state
        on initialization.
        

Dave Penkler (8):
  staging: gpib: Fix request_system_control in gpio
  staging: gpib: Fix setting controller-in-charge
  staging: gpib: Enable SRQ irq on request_system_control
  staging: gpib: Remove dependency on LED subsystem
  staging: gpib: Remove atn_asserted global variable
  staging: gpib: Change error code for no listener
  staging: gpib: Cleanup allocate_gpios code
  staging: gpib: Set control lines in attach

 drivers/staging/gpib/gpio/gpib_bitbang.c | 102 +++++++++++------------
 1 file changed, 49 insertions(+), 53 deletions(-)

-- 
2.49.0

