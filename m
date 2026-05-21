Received: from mail-dy1-f194.google.com (mail-dy1-f194.google.com [74.125.82.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9DB3BB40
	for <linux-staging@lists.linux.dev>; Thu, 21 May 2026 10:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779360237; cv=none; b=RWuUf6otZu2KO61IPo+puTeh6hIN9wXw0y5gPBUBcmue7l3IGR+n3ETcn6rATPMxbtMcsJU9EpbuMy2S2u6KWbBzkpuX19/4h6SAb4RIrgwzKvjFSiQ0SujY8HLU/eh16XI3ibQKwNFjiasEbq/svOaxQ6ogdhNC+VsRYmyAgcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779360237; c=relaxed/simple;
	bh=Aa8N9sawpeP2yl7ZM207sHIUnQW5bw08zD8SP/lAn9M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tKrFO7EP9geMP4A+lPRlW1Mt/m4Mcx9nMN001doAqBm1mWLyB2IxFY8f2f+aIJaBkQSmiKDMXNhIyRoxKAn763bYbRjSrWFtN6mlrkSAd4IZ9bYXaR86byH1C+bJgichA1ib9xwRDZd70WfXTvbGZX31u79jb7JXdZ98liuQNik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dKA7WkhU; arc=none smtp.client-ip=74.125.82.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dKA7WkhU"
Received: by mail-dy1-f194.google.com with SMTP id 5a478bee46e88-3042dffd80bso964303eec.0
        for <linux-staging@lists.linux.dev>; Thu, 21 May 2026 03:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779360235; x=1779965035; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q1DIfBBxN1n/y3mP653V3AFT2cXl1biVHSC3Q08Z44s=;
        b=dKA7WkhUKIv+AH2qXrKmPSj9BOhPlxiFk40KYN4XxPU9j+iypteju3P3r85RO/nR3L
         Zj5n1mseqYokD1SsbqorIEYu/fH+EwTZm4+nb5gPdBlppOPnaTpyhs/oQT0jQaANLgtW
         Ou/KDiR3ipDm8Pknc1SCPv/rS+j0Hm+lDxOuCtnlZkrVdmOuod01Zvy19Mtqy3fdtMBE
         DFwjKk+HAo5iRgpf9HzHs7ov+oJaPqC5Slhken1lo0NtvDZN76mHqtsIx85GT2szA4b8
         bS59sXe2B/eud4O82ToycS8DGmq+5+ZAc/gnhV/X4fawZiNB9QkAAVAJTjdLqcPCPJs1
         pE7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779360235; x=1779965035;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q1DIfBBxN1n/y3mP653V3AFT2cXl1biVHSC3Q08Z44s=;
        b=fLBTU1z7D08EY4OVLDxDjxbgwiLnuqHymmXcpCA7/CQOuQXlTzikqvCJvNfZWwuYrj
         n373VeDg+g//7/lXwaRNTNkzAy8/AXAm0cRGLYNJSAo5X7SlkJOrGJvTL3pl/Jyut3WK
         2M3F/3ZSwF37VMjJqKLLAf8VtT43tbwm5qEbAtDqwBilB51IRKOfe7TGcijLktzN9WSr
         T1l0MmAilc1pxhOTWgOU/ccHn0Hms3iR3QVIqqGSZ8Fw9FEA2Gnb8PC4AaLhkdyp5OoG
         c52v8Hp4haCvh9Z8DIQh3Es167uZSkxr5RYZmDiFpDnrev5UTCGhYGHNJHG73Z8IH1qU
         ZpHQ==
X-Forwarded-Encrypted: i=1; AFNElJ8yoWtDkFEc4eqkxkXL4zXDsQusUptkykCeLK+3E7SNOdhXi5NC8DR6XMBDTZcg09EfXCyE5v8t/MkxZloi@lists.linux.dev
X-Gm-Message-State: AOJu0YyBfgNBBU+PbhFPgMmKJFcvgwKdPF0BwuD3yr5TymDSY2ek62gw
	mOUWQO5krrnkph19YJBoXl7RcjedxLid1OtvBhKokAIl5iZ80n5eHaw8
X-Gm-Gg: Acq92OGzDj/DSwWQwbfEYeVqNqSrUlQpO0NFrAxiB/4NesyawKfz2RvAkp8O/Q3GvE7
	nyPjmcQVatyRgsfcasHP6mfYfiufN51aClzD+l44bIxkr0w3Js/Oa98qFmxRxDF5T5qjw9ORCeC
	QO+PgJRUugn7gjAQWf0dgAgcDr8pBizJg2aRL9UidWO1TuAPg7xBTyRVt86W2br53Qp3Ghh/fLG
	GCGq6G4Db9y89AJQNFRPPOKufQOVYJsnFdfjRQEbboyJ0WiUwEceJhFWKYHdpIexEYUoJPtAsjH
	WBW7c1r3lKcXg+5k42hXKx1Mufu65fVD0J8oz9ZNZYICwVvTyCFO+QyzYjJ5HY2Xdt1Ef+nAv7U
	yMFPZL2RQN+g8HP1pNNw40W9F+0e+YF2RcUL6e7jZHjNP+mEpgqziHqFNW8PduaBLyW6XtS/dlS
	vXIOiLmuehf8GzZkE6z4sV4DV4w493hISvniw03B6GKjgcuDQBprLyjAU=
X-Received: by 2002:a05:7301:9f0e:b0:2ea:b85c:153d with SMTP id 5a478bee46e88-3042f94ed81mr1343324eec.27.1779360235355;
        Thu, 21 May 2026 03:43:55 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30443578ab8sm167176eec.14.2026.05.21.03.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 03:43:55 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v2 0/2] staging: rtl8723bs: cleanup LPS_RF_ON_check
Date: Thu, 21 May 2026 10:43:14 +0000
Message-Id: <20260521104316.27739-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series cleans up LPS_RF_ON_check().

Patch 1 simplifies the control flow by removing the err + break
pattern and using direct returns.

Patch 2 converts the function to use standard kernel error codes.

No functional changes intended.

v2:
 - Drop unrelated comment formatting changes from patch 1

Hungyu Lin (2):
  staging: rtl8723bs: simplify LPS_RF_ON_check control flow
  staging: rtl8723bs: convert LPS_RF_ON_check to errno

 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c  | 26 +++++++------------
 .../staging/rtl8723bs/include/rtw_pwrctrl.h   |  2 +-
 2 files changed, 11 insertions(+), 17 deletions(-)

-- 
2.34.1

