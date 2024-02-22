Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D42A40BED
	for <linux-staging@lists.linux.dev>; Thu, 22 Feb 2024 11:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708601269; cv=none; b=EVVDMUPqVh87Uk6aCnnqLafg2mli8M7rJvBJbMaTzdBEMvyAC7o2Ib2byTT3/KF0G/XBo+L13zFdIf0Rf6MGJpCTu8fMhLqCF7tuuIVY08+WR3DcalJ3Eey9ulsGL94K4BRmxHbKrXEEtsPCyGytpGFKw3PZNgW0PBE71Tq2PYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708601269; c=relaxed/simple;
	bh=DG4XrtsqgphYVsnmeLdkLtDdcGvur1lDat2Ig6P6zi8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l3L5Q4FbTfFuZdz625po6hQzMqhEPKg8fygmZda0NzoemruD6CoDt+u5T+jlphi5m1t+R1dac1DZ39NpuEDVk8ojTVllKcHSyEOwsA+YiVwVZYHZXdwGGY9h6qHQSIIEZBkpYMb3q42A/DrJscQHMVnlzYnZ7dMJGcDCgLHyJdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EchctQzx; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EchctQzx"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-563c0f13cabso9899806a12.3
        for <linux-staging@lists.linux.dev>; Thu, 22 Feb 2024 03:27:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708601266; x=1709206066; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ALsJyHwdi+2qR/Va23biwRHOywzsGpcHTh1aUvggZuc=;
        b=EchctQzxOXQfyAMdpMgpIo5DNpV5rumJHPgQAU21VanQVW8KHIayndyJnx+dKooUs2
         jNrbhp5kh0qG/cuu4/DHlu3A29T9OaThsIaImqAV0S5eXT+rEsyy7s/MDkdNFHPssOOV
         zLYWezzqPCgQhS5W6jMbb4AMmCIspAgY562aK4FKZa4mTLOmN+74MFU4bpvoRlsY3F0H
         uNSdgM31nv6vgZ8DMv0s7u0V02Ll0DW1tqNpL2ASk2Gle/gy23fiF2WljIBi8XsZ8uP1
         J7pChYvT27P5NmwTP+YapDoRDveY3QMIGJpzKhc0C6EqkbqLDVVNsBUALXKQKu86xR4D
         Ti8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708601266; x=1709206066;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ALsJyHwdi+2qR/Va23biwRHOywzsGpcHTh1aUvggZuc=;
        b=cFt5xji0UCrJp28zS2GIyjaCMVCZeYzDzOzo8VZ3Q0jYS4Dp5KZU9fsJK7uzKEvnH5
         P9agCaTzVP/WDc401nqGkmAf/MbxfgAPeI9EzflnDTmbROQnrziuVrM8/jAJ6sd3d5m/
         I9YR8dM64S6nZAIwZjflcItGwz0QftACbOPyjFRWMA9GM5UUaHPTIjLF/SvsFyeq/0YL
         dgZAX/chxs/xcdQWieEqUB1dCMeTCkmO4QCx/dMcYH89HrUpd4qv/9C7dwtkIMfeY7nl
         mKsPfeRtg0aLp6S4o9I9e5VLqaBS2DHaE2FrIE2jqbsUB7lrfYEGcMFekmcssV8aVOBV
         u9MQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDKsVlz2oHbcOL4Jqr6d7ptywBfcnZeOootpQzX6Y+QL0GOzPI+BPgzKuY7YA/5Tmo9lZ1zLqdhrQ7zqKYyQ1FfzIQzIPdTndyUaLJ8g==
X-Gm-Message-State: AOJu0YwHnXf8+QGWFnys27k2LNHiuIpvBN1k5FV+DpCRc36uPQGsa7nm
	nLIjpSFp7gab4JyyPfErANZhPPra7cGfreDXbYXLlGhKvvbmS8RdA0r/gnzU
X-Google-Smtp-Source: AGHT+IH0aJIT1HFwj4QA1KMRPq4lg7hQfp6qn4cgB7VR+7USZ/uYp2Z1PaKBMqnYQiKkuS0p+ATxJQ==
X-Received: by 2002:aa7:c886:0:b0:564:46be:5e0d with SMTP id p6-20020aa7c886000000b0056446be5e0dmr7514772eds.21.1708601265524;
        Thu, 22 Feb 2024 03:27:45 -0800 (PST)
Received: from localhost.localdomain ([95.90.186.51])
        by smtp.gmail.com with ESMTPSA id ck8-20020a0564021c0800b0056452477a5esm4338524edb.24.2024.02.22.03.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 03:27:45 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 0/3] staging: rtl8192e: coding style cleanups
Date: Thu, 22 Feb 2024 12:27:20 +0100
Message-ID: <20240222112723.18428-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.43.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Another small series with coding style cleanups.
Compile-tested only.

Michael Straube (3):
  staging: rtl8192e: rename rateIndex to rate_index
  staging: rtl8192e: remove empty cases from switch statements
  staging: rtl8192e: rename enum members to upper case

 .../staging/rtl8192e/rtl8192e/r8192E_dev.c    | 64 +++++++++----------
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c    | 29 ++++-----
 drivers/staging/rtl8192e/rtllib.h             |  6 +-
 3 files changed, 48 insertions(+), 51 deletions(-)

-- 
2.43.1

