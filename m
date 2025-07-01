Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D4425B31E
	for <linux-staging@lists.linux.dev>; Tue,  1 Jul 2025 09:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751362861; cv=none; b=cltivMmtlTHyuNmQYDeWv3mQ9F0FVcAeP27FMEFGTI+5Ajgi6KTuckn/MQI+0DIQX2Y1rHnGAcgW4jJp5oQfqYNlvRCL/EVS3HCK62WqugVGl2ASa4oZ1wedgEhgmveRaWpMbiWRxOIsNTXfNTo0SwV3kEWJPbR/cEKI4jLnluQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751362861; c=relaxed/simple;
	bh=bsZ5UdT4JH38E2rK4XtH6CO5bid0OUO3ry5BThwTOps=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jBa22YvF7dbIcU7ex9aXHT4K1sSx00Stfz0VcrclCuTO3zQZiOUvxWjFRrGYO7Htse8cZpoxI3EN7lt162Cu9LNGEkQhcHvXcqJPuWUslvbPmC6Gd/PlYFFcCcGOi0nPZAOlauAuJqAm/01iQxdBqr0LmfuTjFPYdUGcklc0Fdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NmhWaASU; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NmhWaASU"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-74af4af04fdso3928126b3a.1
        for <linux-staging@lists.linux.dev>; Tue, 01 Jul 2025 02:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751362859; x=1751967659; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y91NncPK7/NcNQ1UmJol8Fd0Ci46AhdIGyCjKnxZtQM=;
        b=NmhWaASUBO6FcQa9R5bgpzxd+8xJH1Esb7W3h8QJEUFwckXfvwPARCaWTMpYgIC/lv
         yd3rMQF6fYpJC+U3cXS05r7TnouhZxOWcMgWafoCDWH1xyyNzpeoNWjckki6zQ2oFUmd
         zmwKgW95WbhBsur3mNZvSHP0jAtsyLhK91Qo/t4R+kQDMxXYSevlsJgLCpQ7W32uUFQS
         RWdEthRDECakX83lsLd2xtOqCa5EiUqGGOGuNojW2Y+3VAOImnu1hvLOz7dEd/6cCMkw
         JF7yFeIGg0saR71WjpN+8mBmjaBB7GfESteY2ic92lFhXtoZ0+MaRIR4Ox+Wlv2kC5JN
         hGsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751362859; x=1751967659;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y91NncPK7/NcNQ1UmJol8Fd0Ci46AhdIGyCjKnxZtQM=;
        b=W/2SFkAfJduPTHN6TRdXseBU9qloV8sJd0czMc3jclmU/v93oWiFEhdri+88KqztKn
         +cOTNxSnTYqKA7xTFn7wIsptlZzpNjE2SFMcSYyndKjfDCmrMfpSemvHhYcxpWpk0jIr
         SYcZT0wHbJcT2/Lfo5latoXQmcb9QUuOYB7eW/i4fvqTh/movKvB2yBmgQ8cdKLPnXRW
         4Xv9tzSs0lM5hLNVaMofIpwhu9vGT1EL/+Uh0R4607A4vw9f1E7OWxFnAgGkmT+HzT5p
         3144xOJWqwLQI/68WXGvBmrHiWAImL7SQZ7mHa/gAsibIC9ovFi7mGBBfNP02CJPyo13
         29RA==
X-Forwarded-Encrypted: i=1; AJvYcCUhHE4wJLGzze16gZQhYZkLwmMAH1Pd1iJFrHuzcK0umg2dly8NQyPJTWQtCrWDPkmB5FFiCMY20LSmxl2H@lists.linux.dev
X-Gm-Message-State: AOJu0Ywv8/dTZVvGWh3wsZk9PROICle0YaWR6zyqy/ZSMZYEg5qYoTJy
	Bk4V07VCECQmo8FHB/3FVX0gTIYLl5sQmdhNUVns92bzkRHC2OKLHnwN
X-Gm-Gg: ASbGncv2GwLJDgwtvq64zD6o2JaHmmdnpL2+E6WNztFnMMlD4STpHGxphOZXUHjmj5B
	XSE0pea29U3q+CiMKR+3J7NeSe6Is4v54rh15W7A6hSAs7QfQbYFit9yORLBgL+8sINDlM1HdGg
	qWR61kn2dVjvdyhEdnD64vzYK9XZfdJ6x3b2tdXM3w8zfrxGmjdwEEibSPn5R3KQNExLnXdMbKm
	gxtbOFPhvFJ3POYiUTuUtcWfxWbS69IrRJTmyNfgxz+Rtq9zvXZQq17GfZB/sIMl8banFMWc/wV
	9Q1IUa99DvjQDOSNQKFANojN9o2xR5h+8tO+0XqHBijc9ToUus2ezQ+9BTSsRjBZilKrralR0ly
	xgg==
X-Google-Smtp-Source: AGHT+IGVMTwoGg5+t/VBPlWizgX/TDlm9njeq315sfW+K8E17Imd2YRP7ugM+hDbZut/vexETw2A2Q==
X-Received: by 2002:a05:6a21:7109:b0:220:898b:2ca1 with SMTP id adf61e73a8af0-222c9a71c21mr4955815637.21.1751362859066;
        Tue, 01 Jul 2025 02:40:59 -0700 (PDT)
Received: from localhost.localdomain ([49.37.221.186])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-74af57e7279sm10945766b3a.150.2025.07.01.02.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 02:40:58 -0700 (PDT)
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
Subject: [PATCH v4 0/2] staging: fbtft: cleanup fbtft_framebuffer_alloc()
Date: Tue,  1 Jul 2025 15:10:21 +0530
Message-ID: <cover.1751361715.git.abdun.nihaal@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Cleanup error handling in fbtft_framebuffer_alloc()

This patchset includes the revert commit for the v1 patch, and the
cleanup patch that is not yet applied.

I have not included the v3 patch ("staging: fbtft: fix potential memory 
leak in fbtft_framebuffer_alloc()") in this patchset, as it has been 
already applied on staging-testing

v4:
- Add a revert patch to remove v1 patch
- Not included the patch that is already applied on staging-testing
- Added Reviewed-by tags

v3:
- Remove a redundant check before calling kfree

v2:
- Change the earlier patch to also handle the error code returned by
  fb_deferred_io_init() and update Fixes tag to point to the commit that
  introduced the memory allocation (which leads to leak).
- Add second patch to make the error handling order symmetric to
  fbtft_framebuffer_release() and also remove managed allocation for
  txbuf as suggested by Andy and Dan.

Link to v3: https://lore.kernel.org/linux-staging/cover.1751207100.git.abdun.nihaal@gmail.com/
Link to v2: https://lore.kernel.org/linux-staging/cover.1751086324.git.abdun.nihaal@gmail.com/T/#md111471ddd69e6ddb0a6b98e565551ffbd791a34
Link to v1: https://lore.kernel.org/all/20250626172412.18355-1-abdun.nihaal@gmail.com/

Abdun Nihaal (2):
  Revert "staging: fbtft: fix potential memory leak in
    fbtft_framebuffer_alloc()"
  staging: fbtft: cleanup error handling in fbtft_framebuffer_alloc()

 drivers/staging/fbtft/fbtft-core.c | 32 +++++++++++++++---------------
 1 file changed, 16 insertions(+), 16 deletions(-)

-- 
2.43.0

