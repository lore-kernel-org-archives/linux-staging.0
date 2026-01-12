Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C8C730E843
	for <linux-staging@lists.linux.dev>; Mon, 12 Jan 2026 04:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768192490; cv=none; b=gixEj4gy6Ril4L7m45O8b6BA3VR8Y4XAN/rtGdp/8xwWLOhA7hlXWVlPp3o/e7Q6HD5wfUBaNTo7gMhZPdNnU/zvNxA832Z8MgGExbMTqOxBw7mpMMxi2AnS+dFsLKPYQ6apVJjNzXhr5FYAgvChRLCNSbQfGj5/Xi8p0vCKzUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768192490; c=relaxed/simple;
	bh=UipHr64NVP28dzcWZkDIYYbm4g/11oekLPz5unL9mFM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B9gtIpKqqbHNv8vqA8J3T0A91nk2iaj3mdZXLISly0qR5NC2rZ5p2XMWKsM6SqEQ/OhuYEGf5afGZJuv0A8vkTgtQdFwD5h26isuDpTC/Tp5hcuEqOc48M7J/KTgxEYNXapV0THK1G3Kl+lZMD1sLyy2ScE51H1fq77GSg9NXRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aSRZke92; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aSRZke92"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-81f3fcdb556so502750b3a.2
        for <linux-staging@lists.linux.dev>; Sun, 11 Jan 2026 20:34:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768192481; x=1768797281; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UipHr64NVP28dzcWZkDIYYbm4g/11oekLPz5unL9mFM=;
        b=aSRZke92QlQLUJ6IX8M0jdrHIJFj7FuQvi4tw789wdwb/L4mRZNaFr9A2jl+FYXB5Q
         ExRuPYmmofuxPfd+r8tzPc8RjxIkgSgXLdasYKCmt+/CzJ2z/Y7T5iel6vb8KC1DdN39
         4Je7LQ5MP1AlfiW6Yh+a4yPwAItN5ev46wEZ65w0G9R+82mIyFFARkx0YzLaHaFHR/cI
         QF46IGgY6dU1H8KsLU0ej9eJ7SMXTM0PyC7I4E+JoyBXCPMoEXL6YlHm8IYorzQ0pfrE
         OHM8aWFW7ktQRl3gQovk8sCQegoneHGCsD4QJoBwz9rMFrWcsYDWLU5Lst7UerZ6F9/V
         gIyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768192481; x=1768797281;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UipHr64NVP28dzcWZkDIYYbm4g/11oekLPz5unL9mFM=;
        b=Y/gtP1Vq72CG9LdJXZiz5Roc+q2myVNOas7Zi7KmhmWl2GrUD/4TsmXon7CIkQNsuN
         h+QP6lwwxTLSvXPZq5rXqIJJkKKOjOLjq8t2VjVBzD8l2vGDRrXXvFX2YR+ao2RKO1fI
         jdH8Mv0bMRKNI8kF4PMIPu/0VMuRpuEfDJfUGL2mtGXj/HamL/jHXwHje1bKxeND9Lk9
         KapJyiO44X4a1fqcOlU6lMbnF4M9OD1OrZ50yFtR/BRtkWNwl0+dMjWNAYlVJ0FqL9dy
         UJvX7MyRW/2yKwXK3jfAvej/iPYd9o2fXNJjotp9pSE8zrom9RbANHUcqkvs9F2SJvv0
         x6HA==
X-Forwarded-Encrypted: i=1; AJvYcCXFmFcuFlW4a2KyPIz++0k6UOuhjFwMSsWCnbQxhUtv3byiHApbbymP9uLD2cBoFTK40X0th/FZurNUuDgC@lists.linux.dev
X-Gm-Message-State: AOJu0YwjjWmQNoSAi1tFygAvUCg1J+JgZBkLywA36ZSO5gJXGIu3SG+Z
	nyqZtlb0HYKNKa3Zb6TKYfxThleCHUofrOFAZrUHfZU3Uj8y3SQBjZHi
X-Gm-Gg: AY/fxX6X3/6VkmqK0bcrLxE4hVcK4/zGuWFZ98P0Zo5kQjdjKurwwUokwrNlg3XZcUu
	j9+7yDn0ycSDZzjoPZM+jzqwVzEsliCOaHH4nqyf5JDcGj70dvcuq558+uy5CdBLrbb0lShgecu
	MKRGsmuNUaFomtUicedTefx4nV9+5lrZbrtNVJ3em/8od3n86udZ6gj+MZzfRhiAe/SKZm40Xle
	dpCUeYF3QAeRBvqG3Y4Kg0eugOJlBjtmwjzantK+W7uOHYdq7jHvYPgKq02VRkaaCf194d85eYy
	pH8PszNE6sfTCbuTbVqRp+abUQcUJOx/FCphrkjrDtR4WaaYZx24OuMlEvy+YL6LtPY5v2ywlPO
	FMUjybaGP9CNfmYB4mQT3nwCKI13Lp0k2FgyqE3Fe47Nd5dHX15a8PCy5fomoCKlSe1AlV3a/cK
	xWRsjtYoEtXn4rcE0kLmSk
X-Google-Smtp-Source: AGHT+IFdeAteyYGKKaEcfCnlYiYUemSKHIeuur/2nhXXxmCNJum4vrIOoEWTSDqYN7D+fmhEnNgrJQ==
X-Received: by 2002:a05:6a00:ac0a:b0:81f:61d2:849b with SMTP id d2e1a72fcca58-81f61d2896amr659205b3a.6.1768192480825;
        Sun, 11 Jan 2026 20:34:40 -0800 (PST)
Received: from UbuntuDevVM.. ([103.171.99.41])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81f3909d2cbsm5418655b3a.48.2026.01.11.20.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 20:34:40 -0800 (PST)
From: Nayana Mariyappa <nayana.mariyappa@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Nayana Mariyappa <nayana.mariyappa@gmail.com>
Subject: [PATCH v2 0/4] staging: rtl8723bs: coding style fixes
Date: Mon, 12 Jan 2026 04:34:25 +0000
Message-ID: <20260112043429.42615-1-nayana.mariyappa@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a series of 4 small coding style fixes for rtl8723bs. Each patch is
self-contained and focuses on a single logical change, as requested.

Changes since v1:
- Split the original patch into 4 separate patches.
- Each patch now fixes one coding style issue.

Patches in this series:

1/4 staging: rtl8723bs: fix block comment style
2/4 staging: rtl8723bs: remove extra blank lines
3/4 staging: rtl8723bs: add blank lines after declarations
4/4 staging: rtl8723bs: expand multiple assignment into separate statements

Signed-off-by: Nayana Mariyappa <nayana.mariyappa@gmail.com>
