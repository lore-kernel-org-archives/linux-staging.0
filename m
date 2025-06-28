Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD3719E82A
	for <linux-staging@lists.linux.dev>; Sat, 28 Jun 2025 04:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751086767; cv=none; b=t/xu0VkuusHTbi0+I4TLsuoRjzh5E3VcXu9LANpNPU/quyxt/fMUQibWTcViZ71ZYYmQJInlEOAbUYYzAjnIzNAAFR7ihs4mOa9yt3mXHfuBn/dSdssfuYZsg1UC5Nj6msX2Jx4xydlopUBmiOY2dZqouDJp2R1EpPKDFcRghUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751086767; c=relaxed/simple;
	bh=+lIP+e3qcItfXbEQi2WJcfVJn2GbwlTtYXEdcj1R2vU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TqRCIwZKA4DvY7lgb+CwJVQKrZemwiGlgfWV+mWGgZTZ1mbDR2aPBiQiCPOk+iAqZbiNLFltQQO7PXCYxUVd9oc/oT1PZ5NHlMFzxUNSxSx9PBI9M9hdVqHKmhqhnOBuN5IC/Me0/TjSNR1D+0WD4KAI6cyPHnZPybL6A4JqfFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iqtjz0fS; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iqtjz0fS"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-311d5fdf1f0so172145a91.1
        for <linux-staging@lists.linux.dev>; Fri, 27 Jun 2025 21:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751086765; x=1751691565; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v+Y62Y/ec8sThQYgTDvBjm17W/jeVagSDonchzednA4=;
        b=iqtjz0fSgdHcqxtr7jhK2pmV24NfBxKy6cSEEtAW62mBf7MaWaprxGWJtC9i9xurY1
         FT7DY2+uIvndCObPsTdjjvXuhjE5WBbYdyP4l1SB7FcXzxT2RWJJwhhaXUc8zUxZMDSR
         39My7yzxZmljd4Tredcmt4O7incqszv4/P6HDMb5DOq7aWOUcwhtSKwj3DPEvCO5lcAU
         HTuTuZBoL1PFQmlG5PuaysO0kJfXxswKeSW/7Nes/WRQWuPA6YrMf+k4u3bJ0nnVNnF9
         qp7ibksmYzYpaXWGe9+Uvzvjkv4z08/NOvVRJogiF1OrLzyp2vudBGFLUtuAOkkmt6J0
         5dTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751086765; x=1751691565;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v+Y62Y/ec8sThQYgTDvBjm17W/jeVagSDonchzednA4=;
        b=nO9evVeP9C2MSFzThjfUignyzO8SPpxkgKJZbbaBnosli6g+6qHCA+pa2lZoBmVc77
         gO1/U1AhQ1TeWoFifrwnahMH8CFxfUPWf8q0Z8Dy0fHgeYGo9ydG/MdDBcBJYGVYiuBl
         jajBFC9x9OJzcd1JHmt4QZ0po0O4Iy61Kw2bRSRKt+qmAfICMhbbhUwI0RcX78nIzoC+
         lOkPNrfLBDeMgq97f8Xxc4sgTsEBqqEFq2CvXEgImXDYKiw3bYZ0MfM7c9Ulpdl0z7bm
         mURGjo2FRoTFH6O3nzi2EW/Q/NjzFuZU1DYWkyerydYReupqWCcyvHWOPvuchF4Th4tG
         QTuw==
X-Forwarded-Encrypted: i=1; AJvYcCUCwSZ4atsU/JS1sv1Y5RFuSyLdy/nfns0XfVG9uaZsJ5GXV8GYB5Bk820e/17l+CYWTsemo4/wRAtTacy6@lists.linux.dev
X-Gm-Message-State: AOJu0Yzt1xXGEUjPAbOM2v2iMHqXFWJ3w9YLEpov917Xzb5fXohrfIZ8
	mxH4lg3rcJPYyzX9Y3AOBlC8yFI920BnGd9+910ysxmA6XHSVk6OoLtI
X-Gm-Gg: ASbGncsOBxpsbJd9EAhy/PyeyUZQG2KTIeMSQU6Y/s/5xLSI1UZCJUq/m8yj+uOfc1C
	K3WflfYy1zFs7Nr2QBrAgAlrERGGmPQlnnYR11V5u9RV7svRogXhuAoiZn6mGEhC/fPDSJq6gNn
	40CGpC4G9rv29FV2eocYFKo4z3Nhk5eKvN3SbQkaM5n7ewKSUJGPXUStI/rxCFzOoZ35yweOZWQ
	ntoF3AfcOub7vT4fzR0+kGKZkutS2sojxIry3bmJui0EUAtrOoTuirWOCqc8xXb1vyFZYQyT5bd
	7Rs2q8YjE36DnO9U8XMGxtVawRVwDcwKLbecEzLPlz+sA12X7gB++iS/BFTgeOsDzd11JOrtzZQ
	tKg==
X-Google-Smtp-Source: AGHT+IFjBRpEOyLZz+ltarHHoSDBE2VSSqu3F2myfOAXRHpw3MWf9uX5uh2VPQyAfd0HyDKo/Y1myQ==
X-Received: by 2002:a17:90b:2885:b0:311:ff02:3fcb with SMTP id 98e67ed59e1d1-318c92fa81dmr7733389a91.28.1751086765146;
        Fri, 27 Jun 2025 21:59:25 -0700 (PDT)
Received: from localhost.localdomain ([49.37.221.186])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-318c13a271asm3659713a91.17.2025.06.27.21.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 21:59:24 -0700 (PDT)
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
Subject: [PATCH v2 0/2] staging: fbtft: cleanup fbtft_framebuffer_alloc()
Date: Sat, 28 Jun 2025 10:29:05 +0530
Message-ID: <cover.1751086324.git.abdun.nihaal@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v2:
- Change the earlier patch to also handle the error code returned by
  fb_deferred_io_init() and update Fixes tag to point to the commit that
  introduced the memory allocation (which leads to leak).
- Add second patch to make the error handling order symmetric to
  fbtft_framebuffer_release() and also remove managed allocation for
  txbuf as suggested by Andy and Dan.

Link to v1: https://lore.kernel.org/all/20250626172412.18355-1-abdun.nihaal@gmail.com/

Abdun Nihaal (2):
  staging: fbtft: fix potential memory leak in fbtft_framebuffer_alloc()
  staging: fbtft: cleanup error handling in fbtft_framebuffer_alloc()

 drivers/staging/fbtft/fbtft-core.c | 39 +++++++++++++++++-------------
 1 file changed, 22 insertions(+), 17 deletions(-)

-- 
2.43.0

