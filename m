Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA671E51D
	for <linux-staging@lists.linux.dev>; Sun, 29 Jun 2025 14:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751208071; cv=none; b=TCPNdzLqqoAvNqPdSbCcK6YwwtD54aF27t+0DEHbtooLAIkV8G1REQoifq5vMd+LVYINE+CTfxhDyBsH5l7OnU7s0oCjzQKvxLNwFX80F0zLbEoBVzwjiD8lEpqQu516MXhfYru6Q8EiH4B+9P4HtNoE0PQDvDaS2T43OXvN4zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751208071; c=relaxed/simple;
	bh=iCNtVUFqhKvE4SJOApR9iY9D8ji493pCEBANWLuTF8M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AZ15NjGTr9Wd2wPzfwA36JCZHA+ZPfqV24w94mpm62hFSpHdEGBO8xMldV/1Qndm0JC7/15ts8RaPG2dnGv2y5tqLrb6jqbQuN0Li/X4RAK9OggcSlFMPRXLkcLuxr9x24Th9PLKN+kDC5mh/Gyev2vP3jtgkfWuDjlkY/C6YIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kv8qxT9F; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kv8qxT9F"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7490702fc7cso2771259b3a.1
        for <linux-staging@lists.linux.dev>; Sun, 29 Jun 2025 07:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751208069; x=1751812869; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ngH93iqwU56AyBIpW4Url2/UbBhraQmZe5IjknGkMe8=;
        b=kv8qxT9FDCTSpWPqIuyHKBLNxMO11QwZ7Id21tyO/jS9ASqXPwfRMrzp6CsUYPv+e5
         0iFfEXjRPXM6R9ZLyvZsJzgFp49djs9dFnE9D41pSBbSMQqvZ7x/2S1LzoeoIk8BwvnV
         rE57LEhYSSSmHzFo22Xe2ihua8wF3DznNTyde9Bh7CiS/fClBBydgCzbZdTijRqyYsZD
         OuA/cvTjaaPGQ1843JAWWvCznc4WdfwqNT24jNnmWzNrRgGEn2OHie1dUzJHlWDyX/7i
         rPiyUD+nP9yltKRYDP9dmPVLD+JFMxvE9UHNERFHnWiZQ3L1VLAXbmkzOn0dcupGKMlO
         ANrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751208069; x=1751812869;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ngH93iqwU56AyBIpW4Url2/UbBhraQmZe5IjknGkMe8=;
        b=bPxd0B4cYsLmQEQzpgSiQuqCp/BDi47Db0MJD+ZuowCHFP5XnXbXYDIUkRunvPNKGe
         IRGwsBfRcEaTW78B6GpUSxmZGYojvgnfGULnYXMIxZHmffYvibCz88spsXUSvMQb5ZCy
         wlAfbQFutqzD5H0AfrjsfJoBgsdDsUMnVsqXU85lpVILSXBVaSZuA6B+BL+BBnLe5cS1
         YXWxWJwBDpDa50hS5Em/D8l+xHRX1b27vrZwFgr+ml5nWFo/PDM0biz99l5Hv/E7PhGG
         0G8VnIs2XtnhE3MeBZTOKpft8gTujM3hU1+SIa/Wr+A8w9bnJxBQ5hfSr+ZzoMwm/d0O
         Mzsw==
X-Forwarded-Encrypted: i=1; AJvYcCVwd6lPN/BKa/ywnbTJXA+hqTCg0WaScc9Wu046uYfmZGnMuhrCH8XVwEpcqYl1QFPz1JglR8M35CmFMHjG@lists.linux.dev
X-Gm-Message-State: AOJu0YwuJvfjeITa6p7dtz3uymVopkrV27Jtj4kzERrCYoD1ULf6s5fy
	lTIknBfHB1kOKFwWjVbGFEcX1JRKpqCmrx1HPno1MA6DaYPeJGGmTvAg
X-Gm-Gg: ASbGncug5N8bzasNSDhedakm5tAtYl2g5MM1Tgg2/RT7lGHG7xL2TdgaggO4lvyc9vo
	foHDvSsUCigH9jLd0XxW/3jwhZAZ5falEjb2FbDa8HXLLYNlnBStwosg+xJmq13olDtaZsbes/b
	sxH3f9ijiqDlY7HFqlqLSoeJMDWp5rt09NqYzXot2TjiUPNawllM4dsMU5vKJadRwG5nw+Y1Mx+
	4ch082Xb3afuAHnKhEuQSmFRDq61+/Y/wdQkVm2NYHdO7UcBkGtj6AsXVdFles/lHYDCUKWiqBy
	A/FpyaaPqa38tOamMPMocoWyS6lUMyii/+QH3CW2m8krwW+qjv6Jl6Do+s8Sxi0M2VZIiPq87qw
	ur/yQXZF17OYg
X-Google-Smtp-Source: AGHT+IHtRc/795RNnE3dT1YxPcD9508ibGAtu/WX122P8XMCfUg4pdoaiikvlcOosNNP++JAPhMsug==
X-Received: by 2002:a05:6a21:339c:b0:21f:becf:5f4d with SMTP id adf61e73a8af0-220a169c8edmr14074658637.20.1751208069031;
        Sun, 29 Jun 2025 07:41:09 -0700 (PDT)
Received: from localhost.localdomain ([49.37.221.186])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-74af55c7e89sm7039127b3a.109.2025.06.29.07.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 07:41:08 -0700 (PDT)
From: Abdun Nihaal <abdun.nihaal@gmail.com>
To: andy@kernel.org
Cc: Abdun Nihaal <abdun.nihaal@gmail.com>,
	dan.carpenter@linaro.org,
	gregkh@linuxfoundation.org,
	lorenzo.stoakes@oracle.com,
	tzimmermann@suse.de,
	riyandhiman14@gmail.com,
	willy@infradead.org,
	notro@tronnes.org,
	thomas.petazzoni@free-electrons.com,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] staging: fbtft: cleanup fbtft_framebuffer_alloc()
Date: Sun, 29 Jun 2025 20:10:09 +0530
Message-ID: <cover.1751207100.git.abdun.nihaal@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a potential memory leak and cleanup error handling in
fbtft_framebuffer_alloc().

v3:
- Remove a redundant check before calling kfree

v2:
- Change the earlier patch to also handle the error code returned by
  fb_deferred_io_init() and update Fixes tag to point to the commit that
  introduced the memory allocation (which leads to leak).
- Add second patch to make the error handling order symmetric to
  fbtft_framebuffer_release() and also remove managed allocation for
  txbuf as suggested by Andy and Dan.

Link to v2: https://lore.kernel.org/linux-staging/cover.1751086324.git.abdun.nihaal@gmail.com/T/#md111471ddd69e6ddb0a6b98e565551ffbd791a34
Link to v1: https://lore.kernel.org/all/20250626172412.18355-1-abdun.nihaal@gmail.com/

Abdun Nihaal (2):
  staging: fbtft: fix potential memory leak in fbtft_framebuffer_alloc()
  staging: fbtft: cleanup error handling in fbtft_framebuffer_alloc()

 drivers/staging/fbtft/fbtft-core.c | 38 +++++++++++++++++-------------
 1 file changed, 21 insertions(+), 17 deletions(-)

-- 
2.43.0

