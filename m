Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7CB0249F9
	for <linux-staging@lists.linux.dev>; Wed, 19 Feb 2025 18:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739989932; cv=none; b=jNjF8YrqFPfHuSYea4aRFApskVFsponi91UvusxAXfmTn3rAVQOsw4C0yz6iM+5PXUxI3yyr3f0BOK2UFdzrv1nXP9PcjowlqVBqv/4JFe8+s7HhwDfZjJmMJ1uspM/HnYCXEFwxpVJVq0otGKeuplvSJIy7sH91fS/eGEr+0RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739989932; c=relaxed/simple;
	bh=wL9Ik+xXqHJbN2qyPDcr0qOQkl3NLgnRawCzk52jTc4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o1Vo2SCFHwjhy+KrUUR/+Dks5F/niBH0y1NLMmxe/QQ7TasUrgQfsHF1A3/n99ioWjUgeDkHzIf++aWvYjn3wjnsl/ILpyDCVAIL5ClRjoaiIs0bvZ9b4yEhJyAp/cclNPofq/r20UzH0dVESJgSvVK8eR5qZa49N80TwotmmKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lrHWATYa; arc=none smtp.client-ip=209.85.214.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lrHWATYa"
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-220dc3831e3so19730535ad.0
        for <linux-staging@lists.linux.dev>; Wed, 19 Feb 2025 10:32:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739989930; x=1740594730; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PyA/qxLpHzDa7m7gleRh0GHVhCDPWxqWnpSwv4G7nqs=;
        b=lrHWATYa0EAPsY4WBN8TUXBtCNT0rLjkWwW1ZfiTThrV+BEeE2v678tuyytNhNH+pz
         AjC6AVEOKaRvjFFf7dm2M1TK4payRGxt86QkoWUio0p4mOWHoYpm39l0ON5MTUDSPduI
         1o0nFWfPt0SQl8XXZnhJTaryJmfD6LEDEAxBmLEjZrl/zRukPTBdvMqV+0QSOQ7NE/kY
         moQcuBZzUL0e9F/rwbnylbnUSRnwhltkBmTwF4uczh481KjjH0/w2AelHa7zm4ffuRtS
         dFI49tggxtH8QCDA5WiwHqSgaPZ5SmnN/NpwRtTWnZvPRT5e5kPX5YU1ANFxGn3d0+0P
         0I6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739989930; x=1740594730;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PyA/qxLpHzDa7m7gleRh0GHVhCDPWxqWnpSwv4G7nqs=;
        b=LAr1xNxHCEFG7S8K+CXtFYtyDNFpVZ7bkc2bcKCLIDND3Z2E1KAOk4t/wVLEWg6EI8
         dUMfh8AhZqh3U9TzSZH2pChvzt4bqUihsRlsV090Dxx4HZ21x0NwNd5RX8uvIaA1WIad
         KEZ0NTN/RGT5SDiOEHqircTn02qKtM985Gja9UsF06qG7OfREI+CS53b9/3THy2hTJ1I
         ctZ7cq6Y97KwomZW1IxpXnTZOR8VdB7HWZ0TSTNFeGQ5j6vF6+kVBZ+FN0uhigTflQ4u
         qGygLQnVFBP8IcwTTzWvcDub08SHbjaV7lD8HxmZGveLFir67gNb9BU3aypLFnntLrUp
         fOUg==
X-Gm-Message-State: AOJu0Yzt4aDUrtb8gCqL9mq0fER4zTe/crr07xnljJ8Fsc2RmAo0Z7TS
	gtpOvdyvB5BhNHGbEw7icfD8KywCN06jsHz2CYPYt7npKJlu0Ohj
X-Gm-Gg: ASbGncv7dxWTdTKvQRLHanCf7qCgKROEjdQ4YFBYt+Sfheqvxwu9+4rRGk2q+t6M8xd
	c8h+nOiGFqOfYtXAruyxh7zQKhtOD6zLX3LlYWYAJqpeZPbQZb0BxZGeaal1dSbsCFGTDWGJare
	pj9gh10dl8Ga7piwTkMAolbQ5M++ryYIEM5JU3SmezbU9gMxaWYE3cLAlSJ4hVtWpGzmimIfXyK
	TazEr+BFFlEbMMGBGx/LkzkJKspfxQRF5J7AxjoSIV5JLl4roFE13s0HEgqkA3T4oGEnemZ8X4U
	tbpLBfu9DO762vZYH4xO
X-Google-Smtp-Source: AGHT+IFefd+I9cxI3fFqatvOSUGEJg/3d68Lrk2bff0rX/jEQ4q4CVE9+5Eg0UIeohwYYZFgBlLjfA==
X-Received: by 2002:a05:6a20:7f8b:b0:1ee:d19c:45f9 with SMTP id adf61e73a8af0-1eee2f09d2dmr461059637.19.1739989929842;
        Wed, 19 Feb 2025 10:32:09 -0800 (PST)
Received: from localhost ([2409:4066:d04:319e:e1bd:18fd:9875:3b67])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-73256a5680dsm10254605b3a.112.2025.02.19.10.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 10:32:09 -0800 (PST)
From: Ravi Kumar kairi <kumarkairiravi@gmail.com>
To: parthiban.veerasooran@microchip.com,
	christian.gromm@microchip.com,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ravi Kumar Kairi <kumarkairiravi@gmail.com>
Subject: [PATCH] Cleanup of most_video_dev structure
Date: Thu, 20 Feb 2025 00:01:50 +0530
Message-ID: <20250219183152.176679-1-kumarkairiravi@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ravi Kumar Kairi <kumarkairiravi@gmail.com>

This patch series removes unused synchronization primitives from
struct most_video_dev to improve maintainability.

Patch 1 removes an unused mutex, and Patch 2 removes an unused spinlock.

Ravi Kumar Kairi (2):
  staging: most: Remove unused mutex from most_video_dev
  staging: most: Remove unused spinlock from most_video_dev

 drivers/staging/most/video/video.c | 3 ---
 1 file changed, 3 deletions(-)

-- 
2.48.1

