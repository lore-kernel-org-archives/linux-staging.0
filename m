Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8322A1B395B
	for <linux-staging@lists.linux.dev>; Wed, 16 Oct 2024 12:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729083400; cv=none; b=rLeDc8dib9LdNIUBo4WrxI5f8PDBBUetnpp36UhBtNtf5uswzfQUWU2P3crjf9/Jxx7Z5GIFiK9fmP1XogkpvLwxs5P1QuDn76tgLwlO3yNcy2SXWqzwFl20qSIH+X/pa018y3oyiDtL1E9OQuoek3oio69O+SriMjY0D3uRoLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729083400; c=relaxed/simple;
	bh=40jNpBqONAglr0rAnKjClm1zev1ITz0PCjipGGbqWJQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KDs7XKNkjpNsgyVUXkNfTs8p0bc25Cavn1CmPOyUKyy9iXfItU6ExT3TgvBbrQB2qPYl/sJ9xvs8Hsv9dEs7aJwObBMT4i6azctqqvRrg4c5X547M9sFRsxHqOfHWqLIpHuHULO0w6ex0N6om6Z+ReSgLO0B0JQMAJB9aInGhVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c5wowcwl; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c5wowcwl"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4311d972e3eso41182675e9.3
        for <linux-staging@lists.linux.dev>; Wed, 16 Oct 2024 05:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729083397; x=1729688197; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VkrzBqeYfiBn4foEI0NWKM2d6hVY8y2fg24S6Mu3iZ0=;
        b=c5wowcwlyhyjvMVMtgFuda/9k2ei/ESqUf5pOq1eHqbmiAuSjRhGxF6v+Xu1u3CnLR
         lbZsMNyFCijqC9/1UrbFcYIry3YWcKjiv76tL1rxaMawoCBEwmLLdODce2Y5SSVo5Ku2
         eKtxKNYYNEhVQPd93JtzHl+tV/8fy1JFlh95Na41FkG6MxwZWQQgIeQ7LgUw8W02FOXK
         vXlin/g/FqJEEQzHVRv4j/q9w8OTRnYdhmUeKczp/puxa8Gk1eANbl7A4XijkFvVZaEU
         jDS5gqXrr0XqlEDGC9RdeDUSQIE9GEceRyUyli1TUvvrhYF+GxYDsoydOGrXNXIW0Lwy
         LTuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729083397; x=1729688197;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VkrzBqeYfiBn4foEI0NWKM2d6hVY8y2fg24S6Mu3iZ0=;
        b=QVBQFpQropHeKXrQOT3e7nSLo/7OzB3J0OZZrVYR/QHAGuhWkiOKvdg1B2r1CVuDJB
         K4jQsOG8llv2k84TQJX+wd7rjQTBzmBvc/Qj+PnHUUEBUrkTObfUzusm+wKI82JAuTSV
         kZBc52GMr1K1zNim2noaqXhmyedOaBSe4xy+qhEQrYEvm3lHwzYtNhpuZ90SD+dM8QAw
         LOCMs4E3ZJcgzOXlQll/F3QQYl4XXVOz9MWukT1jiVqWAFYv57MgvoGx+yE7B8omVsqH
         YqRK3f+gXNfbBrs1s9qFFk4wkdM/95KZvr7QD9IHAmkMcf/7+b+2lsvF2hUVg9t7BFci
         i/0A==
X-Gm-Message-State: AOJu0YzJI8uz54gmYG9ADWsbxWuZi4fvgulrr7HmNJ29UzUoJnNUL3EX
	jKsJCHOp+82IYeyBF8JcfJ7AvvEjWIFCJoe8yYTQ3YDGV3PBOlEO
X-Google-Smtp-Source: AGHT+IH+b9BL0Tj/WUGfeXACneyOC6vJTPov5TKploJWjDP0AkmZ3xOTD7QG95BAkFzwCizWiVqFrw==
X-Received: by 2002:a05:600c:4f43:b0:42a:a6d2:3270 with SMTP id 5b1f17b1804b1-431255e9df5mr131548395e9.21.1729083396545;
        Wed, 16 Oct 2024 05:56:36 -0700 (PDT)
Received: from ARL1114-LINUX.. ([196.233.5.237])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d7fa7a13bsm4249405f8f.13.2024.10.16.05.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 05:56:36 -0700 (PDT)
From: Aymen Khalfa <a.khalfa.1012@gmail.com>
To: gregkh@linuxfoundation.org,
	hdegoede@redhat.com,
	Larry.Finger@lwfinger.net
Cc: linux-staging@lists.linux.dev,
	Aymen Khalfa <a.khalfa.1012@gmail.com>
Subject: [PATCH 0/4] Fix coding style issues.
Date: Wed, 16 Oct 2024 14:56:26 +0200
Message-Id: <20241016125630.2479807-1-a.khalfa.1012@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix different coding style issues that generated warnings when running
checkpatch.pl.

Aymen Khalfa (4):
  drivers: staging: rtl8723bs: Fix braces coding style issue.
  drivers: staging: rtl8723bs: Fix space coding style issue.
  drivers: staging: rtl8723bs: Fix missing blank line after declaration
    coding style issue.
  drivers: staging: rtl8723bs: Fix comment alignment coding style issue.

 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c | 27 ++++++++++----------
 1 file changed, 14 insertions(+), 13 deletions(-)

-- 
2.34.1

