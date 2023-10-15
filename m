Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C4152119;
	Sun, 15 Oct 2023 11:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gfnh4Mz6"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-5a7db1f864bso41847797b3.3;
        Sun, 15 Oct 2023 04:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697368018; x=1697972818; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VFbOF3573uN2XsjzuWMYl1qqk639YGQ/7wnYm7Gey2M=;
        b=Gfnh4Mz6j6pyMcAnkGXhkwT60SzuA2DwxDITGAGMtuwbaxsNgWvLeWFMVUyB97po26
         7nO4D00PUVZ4l9sKmbfKXKYX7OlDlMg7730a9QlI2S5FHCUiXlwbx7TzUiZdkaFUKewV
         q4Hrvc/twh0EOP6BrOBU1wkJCDuflFhnfTiPiZ+IBRW+1Mer3tHapbnFIXvH2kB0gSvO
         voLOPa4sEZtX7Ub3xEXJkBQw1jDQ9RWBkDn2MWiYAdzLNx3K9WHCk0qF302T3z+NGZ4s
         M102vnQFp6b7bcrmIkHvvYlT7HAaGIPHW5GyAP8Objk1ZJoUJDDmZzZqNu4efyT8Zy3l
         lSkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697368018; x=1697972818;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VFbOF3573uN2XsjzuWMYl1qqk639YGQ/7wnYm7Gey2M=;
        b=noUxQ8ZG7q+FBCz03qlsEOOD8U9Y5MmFzdsAqIzrHA133v/jBCKsWUzAMQR0IWFMAg
         b2BP6i0aWJNor2Cov8ZzqNqL56VvazW1SDIDqmDSQZNFWFGwSzLbowWS2tO10AC/6oCn
         u8+u1LhAIcBeUDmVse0ulnD2WvTSb4Zx05q7p8QCKeYl6s4bubk60DEOlvHi0gNOuvrA
         S7jLhJOsIo11EGJZOEsgonPVIPz0M3pNUnJvZaTQf/LCn+xBy8JVK3AWLzUE/hMLxKo6
         CMyRT96dKhz2SFIkNjcs8EgigcZ4s4l48ij04QfHp8rXH2Y+HTaPcLGMDLpd7EW3SaQS
         YZgQ==
X-Gm-Message-State: AOJu0Ywbsupl21UVqeSR+2T9+pSIwRxWOHVFfQ0RK0a0FaDzTcn37oKU
	Vb00ZvHtGHDQ+2xFgQKF6mp53WBWqF13buH9
X-Google-Smtp-Source: AGHT+IG9SqycCh+aJkrrd1ftgs68PBXqV6Nv82psbGlYW5dVk1EiLuLltW9MXQsnpg+fQQnl6EAwFg==
X-Received: by 2002:a0d:f8c4:0:b0:59c:b61:898b with SMTP id i187-20020a0df8c4000000b0059c0b61898bmr31684125ywf.52.1697368018073;
        Sun, 15 Oct 2023 04:06:58 -0700 (PDT)
Received: from gilbert-PC ([105.112.18.68])
        by smtp.gmail.com with ESMTPSA id d187-20020a814fc4000000b005a4d922cf77sm1303676ywb.119.2023.10.15.04.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Oct 2023 04:06:56 -0700 (PDT)
Date: Sun, 15 Oct 2023 12:06:46 +0100
From: Gilbert Adikankwu <gilbertadikankwu@gmail.com>
To: gregkh@linuxfoundation.org, outreachy@lists.linux.dev
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 0/6] staging: rtl8192u: Mute checkpatch error
Message-ID: <cover.1697367161.git.gilbertadikankwu@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Align descendant arguments to the open parenthesis as per the "Linux
Kernel coding style" in Documentation/process/coding-style.rst

Mute the following checkpatch error:

CHECK: Alignment should match open parenthesis

Gilbert Adikankwu (6):
  staging: rtl8192u: Align descendant arguments
  staging: rtl8192u: Align descendant arguments
  staging: rtl8192u: Align descendant arguments
  staging: rtl8192u: Align descendant arguments
  staging: rtl8192u: Align descendant arguments
  staging: rtl8192u: Align descendant arguments

 drivers/staging/rtl8192u/r8180_93cx6.c     |  4 ++--
 drivers/staging/rtl8192u/r8190_rtl8256.c   | 16 +++++++--------
 drivers/staging/rtl8192u/r8192U_core.c     | 20 +++++++++---------
 drivers/staging/rtl8192u/r8192U_dm.c       | 24 +++++++++++-----------
 drivers/staging/rtl8192u/r819xU_firmware.c |  4 ++--
 drivers/staging/rtl8192u/r819xU_phy.c      |  2 +-
 6 files changed, 35 insertions(+), 35 deletions(-)

-- 
2.34.1

