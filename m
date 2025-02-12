Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA6017996
	for <linux-staging@lists.linux.dev>; Wed, 12 Feb 2025 02:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739328182; cv=none; b=t6RfK3mG2zWjOwDtf0StLLWQhrpZUhxkND7loiTYYe1qdfr0rMt2gXAklk+Sa+yj0YgEfJ5066z1pQa7K1JBHGDSqMDMNhoXzD90TWlISggr/+JWJ+Iw2mwo57MZQmTcvyezfiaJWUm3+JUyPgioetDeoJBlyoKUnV6mSbw37mU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739328182; c=relaxed/simple;
	bh=55rHbZg6TNlgCEr5uMpGiZRMKNWT/zv5XI+4Tb9Vv0s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MZAdnkbzobR7oP8ZN69j/+6pIQnI4b3zAEmyLeXLr8Q1amXB0JQUVI8U9t4QbzDSnLEAfwKEi2JTVbEGyB+cUt8V/4dHTZuA6ZkTWmxm/sggsWqRmzpqX8/3B8jLMFuAAi6FZUAI/W+rIVypYM38WPhdf/Yg7OMgsgDXKj6+bio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a5QXt2Ry; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a5QXt2Ry"
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3f3a6980ba7so1989149b6e.3
        for <linux-staging@lists.linux.dev>; Tue, 11 Feb 2025 18:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739328180; x=1739932980; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EjpiqZwwlsiNfkr1x+iRLMWGCVXZjDSBuvkj25teNyM=;
        b=a5QXt2Ryt/Yn5whzEw5aJ4TkBGIF0ew9VXnG43AEEtMz6oFOGpL2W6KBqZ+ql5R545
         XFwU7LlXXQYh77P7EIhE/UbD3ejMzIhJ0y85Hq+9gHMDAZP6Sviyasl9Y/znnR0biG1s
         0Yw/fpmWDTqUOWNGIGpsTcPnjspRlXonrTzd+zTfBLQt+74Ealto/MReEFxajjJJ3nQA
         A4UNYmS8sntMCqxJMJXfojYXfgZkHwHfAf7QeX6JOksSm5blIagL63zkDfh2MJZBHrW7
         D4LVJzUSrqVnZSuEe40XnoUn5rIbgUQ3ZWPX56hzaxSmNnMGpOZciXEBMy4jZwUCyUu1
         awsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739328180; x=1739932980;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EjpiqZwwlsiNfkr1x+iRLMWGCVXZjDSBuvkj25teNyM=;
        b=LLImPFawkiFHO3lQurcwxmpFXBSf9RADFmj1sgEbeGEBu2vPoKaf0bxG9rdVriLqfT
         n6DG7ZD3KOrj4di90dmMNi5xqS/awGSxIGHr9Th2hcE0UVAotCJ2Y5CCACTgBkOU4wcK
         McoLv+Mpt5D+/vLD9RGlwESu7txauQXOSpPmW61ZF8T9WWkjtbolLU0kiz9Jt76pwbcH
         YDcxq3AGyP29Vk5SYVtf/JvD+aQSj6NL9lN8JrNYYJ8L+tNG4GaQr/RugOrh+vPAcfbB
         rUo0wcf08ReSR9BdOGeVZzJeldOROwEvn9yRWi8qgyx7i53JBxQKvfJ3Aq3l/FM4l2kw
         cpRg==
X-Forwarded-Encrypted: i=1; AJvYcCVZvNRE+m1MCHCfrqsc0t1+fl0vqVcwIr6ZT9zQtbO5kogY3mjbPhhDigJrQ3NW4x7ryf/IuwSqZ45c1aT+@lists.linux.dev
X-Gm-Message-State: AOJu0Yxh8RGVUARa6SsgoFcyVoL94J0c39+lLHT6YTkcjt8nZEkevhSd
	IDf9pf8yEbWqkezIK5+c4c/dWrzPYeVU6FNWKTZFkLdVZBPusPC6
X-Gm-Gg: ASbGncsoDpxkxFz3GxeyyATdI7Y0qOJ24Cj9yn034K9R9UeCh4Pzaws7GKhHblsxFGs
	6g7KmDk5+Qc78Na6BtZLSALkimT1DEKwJne6yHIlHJAZRU/Fgp4DgfaXrV8RjC5irtYgLgnBNVd
	xqGMQmgN1zvb6k8VgY/E18HCWxZkls1B0t/KNrBigTskGtNWVp10QhSwct5hOofMs8005UDl6cN
	HPkcB+PAQYGr93JBpRnSfel7vP8r4nFkYIJHHuP0EdffbcLsJbRaCF3Rk25owAQs017mIFXoHCA
	URi/g81lm3eYdyEntRPpxJ9mkI7dbjteS+JaEAM=
X-Google-Smtp-Source: AGHT+IGel5eaV3DwS7l4aGWgv3bGi7TDkD3DXbXBBsUt8VFU3wp+kXtES5MXkv7rCXgvkpRxhfFdIg==
X-Received: by 2002:a05:6808:114:b0:3f3:cad0:5c6a with SMTP id 5614622812f47-3f3cda178f3mr1200522b6e.26.1739328179628;
        Tue, 11 Feb 2025 18:42:59 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:4c64:81ec:7409:107a:a63b:a3da])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-726afa4efb8sm4059667a34.66.2025.02.11.18.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 18:42:59 -0800 (PST)
From: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
To: gregkh@linuxfoundation.org,
	dan.carpenter@linaro.org,
	dpenkler@gmail.com
Cc: ~lkcamp/patches@lists.sr.ht,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] staging: gpib: change return type of t1_delay function to report errors
Date: Tue, 11 Feb 2025 23:35:35 -0300
Message-ID: <20250212024247.176572-1-rodrigo.gobbi.7@gmail.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Propagate t1 delay configuration error to userspace
---
Noticed that at [1] there is a FIXME tag to propagate ni_usb_write_registers() 
errors but the t1_delay pointer definition is defined as unsigned int. Checking at
userspace libs, it is possible to notice that the error could be returned/treated in the
following sequence [1], [2] and [3] (I'm simplyfing the codepath here).

The patch is big due the pointer signature change affecting all gpib drivers.
I'm suggesting to return a int value.
I've tested the compilation of every driver after that change.
Tks and regards.

[1] https://github.com/torvalds/linux/blob/master/drivers/staging/gpib/ni_usb/ni_usb_gpib.c#L1608
[2] https://sourceforge.net/p/linux-gpib/git/ci/master/tree/linux-gpib-user/lib/ibconfig.c#l70
[3] https://sourceforge.net/p/linux-gpib/git/ci/master/tree/linux-gpib-user/lib/ibutil.c#l469
[4] https://sourceforge.net/p/linux-gpib/git/ci/master/tree/linux-gpib-user/lib/ibutil.c#l433
---
Rodrigo Gobbi (2):
  staging: gpib: change return type of t1_delay function to report errors
  staging: gpib: fix style at nec7210_t1_delay definition

 drivers/staging/gpib/agilent_82350b/agilent_82350b.c | 2 +-
 drivers/staging/gpib/agilent_82357a/agilent_82357a.c | 2 +-
 drivers/staging/gpib/cb7210/cb7210.c                 | 2 +-
 drivers/staging/gpib/cec/cec_gpib.c                  | 2 +-
 drivers/staging/gpib/common/gpib_os.c                | 5 ++++-
 drivers/staging/gpib/eastwood/fluke_gpib.c           | 2 +-
 drivers/staging/gpib/fmh_gpib/fmh_gpib.c             | 2 +-
 drivers/staging/gpib/gpio/gpib_bitbang.c             | 2 +-
 drivers/staging/gpib/hp_82335/hp82335.c              | 2 +-
 drivers/staging/gpib/hp_82341/hp_82341.c             | 2 +-
 drivers/staging/gpib/include/gpib_types.h            | 2 +-
 drivers/staging/gpib/include/nec7210.h               | 4 ++--
 drivers/staging/gpib/ines/ines.h                     | 2 +-
 drivers/staging/gpib/ines/ines_gpib.c                | 2 +-
 drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c   | 3 +--
 drivers/staging/gpib/nec7210/nec7210.c               | 2 +-
 drivers/staging/gpib/ni_usb/ni_usb_gpib.c            | 4 ++--
 drivers/staging/gpib/pc2/pc2_gpib.c                  | 2 +-
 drivers/staging/gpib/tnt4882/tnt4882_gpib.c          | 2 +-
 19 files changed, 24 insertions(+), 22 deletions(-)

-- 
2.47.0

