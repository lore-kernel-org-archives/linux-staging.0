Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E97AA346E4E
	for <linux-staging@lists.linux.dev>; Fri, 16 Jan 2026 12:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768565159; cv=none; b=TQaG1/vzeF0MEZ008nywd+n0XaDv1uWvqU45xoobX8s8c5t/jQCucRRXQf5RbH5yqKfghr4fnsy9+YVRnJrpTf6EcdBwSgaiMWIi31y7BRPX2wYn27nmsRRMc+KhkvtGqFl+IA+o/Kr6ut88U8N291oG88NXdWbcxYJ5FEifTyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768565159; c=relaxed/simple;
	bh=mU3/7nFt9JDIRZTAKaBr+lbR7m+qVZVroAB+SVBRvwo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WbkuGz56lXNO5vtzc7x8AF6Tnqv2ciLsyAGff8peP02zEIg7cJLsKL5Xu9nyEbVbuSjFpdYDffvJw/b7LFcAQtHIbJyOaFxed96dPp5uS1dkx6belpZ2GKEPijoEuQXD+/snGBK5ov5Ja9VpYyY8gHMQGM/Z2iL+n+gmWhIJBdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bvuq88AO; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bvuq88AO"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c2a9a9b43b1so1340340a12.2
        for <linux-staging@lists.linux.dev>; Fri, 16 Jan 2026 04:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768565157; x=1769169957; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g+VGhq8j4llSl/PrBsSPcapxGfVbNohj7BdFP012D0Y=;
        b=Bvuq88AOdvce7xcomGmCLVleA8iXOwyMj+dzHMzYWgRWj1dph54aJvUq+1uSDIkOfT
         aSUo0Qxn9aP/Da0IVlLqaKBopXqNKUDQaQpMnbYWZFUx4cH+fICRoKeAHsqcbop3WUIl
         qnB6QgwaOnBPXGPMWEkXLSyhD0CuJHccDHCkbpK+dJHvdKWQSeypxICaTC1QCn0GsThZ
         P7wIO3nN+ui9GaFOOS2QIwboigNrkc00fuj2e01vbsJ/zdOGhfmCRGA2TrrQOU7MliVA
         K9DSTA+GVZGSnoqs5a3GKtJSD1tRGTPzQDW33OIvuAkYIh6VIEIRulsEbRDG5gu69HYk
         9REA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768565157; x=1769169957;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g+VGhq8j4llSl/PrBsSPcapxGfVbNohj7BdFP012D0Y=;
        b=o01h5nZFsrhNyT2hZQI3DbxFQAee+P1Ez5icEZ7BszYBsgljBGHX1vGI8WSVkHOAmm
         rB3ws16ManPdjvDsyPPhr+MyE2AaxptckHX9yt0OE9eJ0iRqHmtzvW8+mjFpvcMatUfB
         laJfXcNhvlc0qMuEPXfi4txs8+YmO9M9BMKzei51g8UQowD/ZW0jaaB4d6Q2AmjxZp1j
         RVt2UGS7TkDjPAzD8I2uPUcTrlfHOhfUbnSxyNqJoW7LqHkF6hJfmSJ/Et58iMxE2fRh
         4QHkFsZWdXrrkghN2BEPesEZG6Zypdvi0LvXFvb4EAdkaLwFV5Y6oOgbhHo8mQ/TGycR
         cIbg==
X-Forwarded-Encrypted: i=1; AJvYcCWNuEfywSbSpyUhYPmBgQtu4rQ+M4FaFKBTB8gW8ZkFSV/iEkCD6Lv4yTk6vLciF4/kFMxFNt/X68Od5bea@lists.linux.dev
X-Gm-Message-State: AOJu0YwYOb6wZTrgfeilkvr+/H8XabAbNIKfDDulQ+KMyjTe5d1jAZfj
	cie/0c7/wlGpCtMi6ezrEeklVetEgd1mymRondxEEyKfQKSiYbNqOQZD
X-Gm-Gg: AY/fxX4PVw82JX2S25qzQkfzr6kjc8fyMLINo37JLnohPIX74nAuNXHrCTjkjaForDo
	QD8fOw6X0YCOGdtRdYiOWm7sjW+0iiguQuyv2fuTLwhKjmq4H1Ie07EsCxQkrFhBlfwNn6YDE7V
	GFwLTai+TA5iXVPZwS7fGGE4wviM0CxNpKmL8dDqTca5/EKTQajtpm5OTXDWETR759HsiPQnKbi
	c3QUuIBF9PTpmVtfqjT+SJQ2FiRf58e2sVcJ1L+5Q5KhS5lo77mQSjYOqVbDrEWACv7kZHLeP6j
	D/Dp1M6ss8R32IYHxW+bZA1jjSQbq3YaNEv3vhrWlPi1bA3tPkG8X0sYmb73KWUy54pEB7ZXF05
	lLBPC6H9wHVTXsN32QIuj8HLwcts8xKMCr2qAjnwMRq947qibHG43nOWaD0t1fpnDnGmBgpOPv/
	GePHTf1Bv8GKzNJpWwPgB1
X-Received: by 2002:a05:6a21:6f07:b0:35d:6b4e:91e6 with SMTP id adf61e73a8af0-38e00d5d099mr2528060637.46.1768565157217;
        Fri, 16 Jan 2026 04:05:57 -0800 (PST)
Received: from UbuntuDevVM.. ([103.171.99.41])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3527310202dsm1992539a91.12.2026.01.16.04.05.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 04:05:56 -0800 (PST)
From: Nayana Mariyappa <nayana.mariyappa@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Nayana Mariyappa <nayana.mariyappa@gmail.com>
Subject: [PATCH v5 0/4] staging: rtl8723bs: coding style fixes
Date: Fri, 16 Jan 2026 12:05:07 +0000
Message-ID: <20260116120511.48272-1-nayana.mariyappa@gmail.com>
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

Changes since v2:
- No code changes (resend only due to email/threading issue).

Changes since v3:
- Fixed multi-line comment in RTW_STATUS_CODE from /** to /*.
- The previous separate patch fixing the non-kernel-doc comment
  (reported by kernel test robot) has been merged into this patch.
- Version bump to correct patch series numbering.

Changes since v4:
- Simplified RTW_STATUS_CODE comment to a single-line non-kernel-doc
  comment per review.

Patches in this series:

1/4 staging: rtl8723bs: fix block comment style
2/4 staging: rtl8723bs: remove extra blank lines
3/4 staging: rtl8723bs: add blank lines after declarations
4/4 staging: rtl8723bs: expand multiple assignment into separate statements

Signed-off-by: Nayana Mariyappa <nayana.mariyappa@gmail.com>
