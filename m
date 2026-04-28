Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79EEF24501D
	for <linux-staging@lists.linux.dev>; Tue, 28 Apr 2026 18:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777402240; cv=none; b=rgFnfFraJGTX1i6KtFDAWJ+Jk5s10NA49SEv6783z/HpUbdsnqTHmUW5igOaRx4dAKTM/CAKdWyzair2VGjpwjOwnyZB5gIxkmqUB46W0QwHRhb8+Cll2DY3zRqg1iT97OVT0HgnT2K+ZUdoSY/Jys8jbyRPihq0EOL7j1nIY/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777402240; c=relaxed/simple;
	bh=uDaNoagHys08JDYY0sUwwSl3qH/ea5LeNwTnG/ymv1o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a9aKMJqenErF89m+5Xgm0IVFLvPaS2QVeR3lJPUk51X5xrdcOipUZ2yDhdDfMOox1nBjjT71II6PXTu3k5PNBhf4zBpAQSMngU9wBUlLHSphn0sc964TR8EK3F6aDrDWB1QFj+O8XnIUYHMl/Kb9/H5LK0l9UQNNNeWOW066v/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EroEw+8h; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EroEw+8h"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-479e4835e26so5344052b6e.3
        for <linux-staging@lists.linux.dev>; Tue, 28 Apr 2026 11:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777402238; x=1778007038; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QIv1W6wjvbNHFz0BT7UvNZrlsknFtuu9/9aZ0cJuVUQ=;
        b=EroEw+8hRU2AEibUrihEPS/QxtdHnR+u4wD2PCvQ2HVx9TJxAAOAq/q9gptf7uXy7N
         STcWT9yTv6V46pQ0JE7Us/Iq3m6CKS4OEwHsT1qZHakHLyvBYQw4syE8lwvm94rgd7JT
         O+m5D6NuGYfYFsD4AJV6MBgElbbmFGh5liJZ0DFD4Sqlb6iHR3NrzbLEglKgEGbf3O8T
         ubNmHI2hBrkPcoKpbG/+bmBvoXKHuwg0pmgj6AWn2rz2YsAOyHNJSBDnMEyQxrnzfi4P
         5ABvhL+BtXKGhWfSocQL+Tz22tzHK/i65N018AaUT+TlOjlWn2+rPejP6sPGBGU4wXVA
         8nUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777402238; x=1778007038;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QIv1W6wjvbNHFz0BT7UvNZrlsknFtuu9/9aZ0cJuVUQ=;
        b=IMFwu2cwqS8Orp9pQFqS2RWSd4qkgOfFdfErg5roGqsuDt8VejIKJlw3RCNQD4fSAJ
         Jr0bsfKRpv8dkIrfeKYVHO6uD6AQ6sTx8OkhJXJCLiUXs9hflwvWWM7XJS4kj4NEwWM6
         PLDhhD92V000k99CdU4bfo45EGvYvC+VNU2nE2EDbCpWz0vSO+WI76ZhQl+AKi9i3KAa
         rW1wIPxZpeBRwcQ7c9mfA3klCWGuUeHWNu399lIKzJ+ua2hL6RxcIAZWK33PUEnVDD+Y
         u2qnRraAxuFmUc9vSAHm4fQzh6phpIseeypcOxt4lDwNGtTYDoEOByfqoEvpojgpDm12
         3cfg==
X-Gm-Message-State: AOJu0YwR8PU/IixH9+Bk7La9t7O+GzM7htzGEbM5Dp+SSYG1dQIqfGR1
	6Xqk0H/wNsTO2fmP/brln/xq15XH0s/8r2C1GcRSBX5SZEQUcBfeF2M=
X-Gm-Gg: AeBDies5/ZR7paH/bNETywL42yTBL4daaNPf8FbRxrTl8j5PQ4M86+pcxKmjKWy43HI
	dcmntJCTqnqfSqwTZiYETXhM75YP0IAhsYMPgvN8OF8PTUFGem55Lu8j+xUB5krjXaNe9uL7wjK
	Vj0tZFvagdbDD5ScgQqdpT9tTHWBAVXhN3HPnCjs3CERPHmjYG4VfTN09AgN6XG1QqjPbj/MLgi
	8jMKmEZqlEayMLgvsBrOtlePYbq0bVmi54dr+dImFtJiMRSUGmLIi40eUlN/elNK6wX8c4Cq7LN
	E5U3nNrFaSnYEaP8q7AZJKUvcyPAPHaAZbgAc17pmFuYQptuKOhcudsq8VBKOjxAXoIEBHBClv6
	8vZzdSvqUKquEiL3MCgzZf7lmgBxbhYisWeTIubpbS20KEzG1JlPjwwGSt00LgITHkfjZxiPISG
	uhBdmT5OKXerdyVTlc1fWqeQVCCjMuKaxsClwpVxKT5bDaI5RxYoi7H6nix/et+TwlzSSNbxx7Z
	yURat8Y4mx6PDQ9iCxaTBBlsW0=
X-Received: by 2002:a05:6808:30a7:b0:467:2f84:b0c6 with SMTP id 5614622812f47-47c28d69514mr2327577b6e.8.1777402238476;
        Tue, 28 Apr 2026 11:50:38 -0700 (PDT)
Received: from MSI.hitronhub.home (24-40-252-177.fidnet.com. [24.40.252.177])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-47c291c314fsm2008443b6e.16.2026.04.28.11.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 11:50:37 -0700 (PDT)
From: Marc Hanna <marchanna111@gmail.com>
To: linux-media@vger.kernel.org
Cc: linux-staging@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	skomatineni@nvidia.com,
	luca.ceresoli@bootlin.com,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	Marc Hanna <marchanna111@gmail.com>
Subject: [PATCH v2] staging: tegra-video: Align wrapped function arguments
Date: Tue, 28 Apr 2026 13:50:24 -0500
Message-ID: <20260428185024.853-1-marchanna111@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Align wrapped arguments in tegra20.c
to follow kernel coding style.

v2:
- Fix From header
- Update commit message per review feedback

Signed-off-by: Marc Hanna <marchanna111@gmail.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index e513e6ccb776..eb1fc5b7e2cd 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -552,7 +552,8 @@ static void tegra20_channel_vi_buffer_setup(struct tegra_vi_channel *chan,
 	case V4L2_PIX_FMT_YUYV:
 	case V4L2_PIX_FMT_YVYU:
 		tegra20_vi_write(chan, TEGRA_VI_VB0_BASE_ADDRESS(TEGRA_VI_OUT_1),  base);
-		tegra20_vi_write(chan, TEGRA_VI_VB0_START_ADDRESS(TEGRA_VI_OUT_1), base + chan->start_offset);
+		tegra20_vi_write(chan, TEGRA_VI_VB0_START_ADDRESS(TEGRA_VI_OUT_1),
+				 base + chan->start_offset);
 		break;
 	/* RAW8 */
 	case V4L2_PIX_FMT_SRGGB8:
@@ -565,7 +566,8 @@ static void tegra20_channel_vi_buffer_setup(struct tegra_vi_channel *chan,
 	case V4L2_PIX_FMT_SGBRG10:
 	case V4L2_PIX_FMT_SBGGR10:
 		tegra20_vi_write(chan, TEGRA_VI_VB0_BASE_ADDRESS(TEGRA_VI_OUT_2),  base);
-		tegra20_vi_write(chan, TEGRA_VI_VB0_START_ADDRESS(TEGRA_VI_OUT_2), base + chan->start_offset);
+		tegra20_vi_write(chan, TEGRA_VI_VB0_START_ADDRESS(TEGRA_VI_OUT_2),
+				 base + chan->start_offset);
 		break;
 	}
 }
-- 
2.43.0

