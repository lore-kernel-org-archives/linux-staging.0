Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15A881E0083
	for <linux-staging@lists.linux.dev>; Fri, 21 Nov 2025 19:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763752288; cv=none; b=m3e4fwGckVKr//W+WKEbd0kDECL7iEpjwpD7JEQtXv/x0jMGnfOecotAnAgcNxC8TODB+SJMEPLUpDGRG+Yk3IcjJcAqtEXvzLt8hTGH2TfAgxsUnNv8TxRoLfZecHgytgQosuF8BO0wZ9c9xVM2aG3hPmFPQI2vf7v0Ba7CmLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763752288; c=relaxed/simple;
	bh=ljJZ4VIbpdRv0RTxM4zp0f7hTSJ+niJAY9Mm2Kk5zmY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LbxAAlBPcrvPDj7SwdZzjROnM1xBGijx9DhzkSxhbb8JTDo1XE5/TIm9loBlBZKBh2GaKpdtztUlssp1UKTIvm/avAySwdvUU7UFeLCxjn6UChm2tQjoVr1/tE0eESla9ja88soJ2HKDS05h7rV/BQK0obtBqzaUdSD16qY0KU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZNkz66W9; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZNkz66W9"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3436cbb723fso1991463a91.2
        for <linux-staging@lists.linux.dev>; Fri, 21 Nov 2025 11:11:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763752286; x=1764357086; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UxxxdFjqDtP/cMZ4I1iSXbmLYQbz5xAaQL5dakKtJT0=;
        b=ZNkz66W9uOfZjLq0Eg9iWzbj8CqI9Pvq0lG+Yo1bha/1d6QHpqikCOw9B8DN9zD+03
         zDXV3cCQhAXyuW5aHUYxW+Yx0Gl+TE+2VtNFFQwQAUM+VhDD6xOufdB4pXCnY2MI0fUu
         g60KQZxGkT5cdBNE0A1qmkKg5j/jg1+xqAylTe1ovdLq6pCtOHaKyfzxG4fmc5Tu9pSF
         +USmG9FfOyFmrVG6EBpwcWV+fKZQt04YHGu6seFASC+ael9/bAQCVkOkq7GJUBgmFOyl
         YxMGm0BMcWpDG9Fgt8t250g7U5msEMbTGHNC3vgIlmzuRkY/myVnEODv6I7k8/F8b9lj
         Jgjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763752286; x=1764357086;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UxxxdFjqDtP/cMZ4I1iSXbmLYQbz5xAaQL5dakKtJT0=;
        b=kamXu0iuSQN/Qw97e+SvVNPQj3kKhsr5JNysC75kFyQy57m2nFIQ+SLNytUtaRR5k7
         N9pnFDSC4dXbt75KUd7BgG95gyY8sF2VYQ2rvSVEwiL2cvGA4LZa02AtdqwIpkNN1yAS
         GyfBQLcpMgiO4zz93lBLNsQiGfn78xVyDucj/Q6cYrAs6989dy2yWnmFnXxwcNWR0n/d
         ce9wJ92p6c4OFkfhWfby/zxhQYzuJfL92s41xilpVHYfFHRc0NjX5dyw/Y3stuFB+bCM
         V61ZlnOfLBNBxyQNB7tVRxShZZduunu1RJ6hPY7GXE2ZdteCjcNfY2vveIEmY/qfJ4Og
         skRA==
X-Forwarded-Encrypted: i=1; AJvYcCVnbsldntdEyxhbAnDUA+PRXcu64rpQAV4kHTjFn5ALEvc5P+tLy0FS8FEm3+7b0+YABzl+UuOVussg7AFm@lists.linux.dev
X-Gm-Message-State: AOJu0YwyyJeA2C37qVnx3tyjZ4mVixtZyLYM7nlaAaUwNi9nyzfbaQ9H
	yxJ/4eTMN5qM13AjQaDrmkOejUeh6CneDqTaEXZv2Qus+qp80uMpQXDK
X-Gm-Gg: ASbGncv4aA+EyhU5V07mUeHoiG39ODmrUCktdwRUBL9xn2zrtzFa8xhqAYyIkkzE/ly
	fhTpGDquRAzsYUwsmCSxtxKvw5q8fYti3FUAzkPoUkWM23mF2my1fA8kOqMA/NHOmCU6jK+yUkE
	axlOu2MIhImYgFtCtwuhnND9OHtLW3cR6cdo9WIk3PA98j6Zgamxxflk+ouBHlDYxgVhB8/zKS6
	XS1gEFCH7ZPIgB3tM+HK8ogyJ6t/zkRZ0/nMvu74QKBLpW1VRrVvO+u1UhTCIszk/X/TabgAtAy
	1O63PBSFLPzaNRSrUcFIHdCXK4620FsJz5jHDD1oKz7U6yKzPwki13EnmaX9AB2uDr/1sAbKdf2
	EVKyyEKv7W8uXaAeFFgoJj2A2qcJPUHpsy3dd82ff0KBAGywHhBxaxTqlhWXPPX2c+w/eQ9ficf
	BaQKm20SWJNl9H9xcQuM1Cl9O269RR
X-Google-Smtp-Source: AGHT+IGIXv65UL38Z/eXmYx5Eimhi6cwqJ76cU0qfZ4QV4BAA+iqhaNo0kkNOGw5wWGytn0+KN9xgw==
X-Received: by 2002:a17:90b:58cc:b0:341:2150:4856 with SMTP id 98e67ed59e1d1-34733f0069emr4307346a91.17.1763752286246;
        Fri, 21 Nov 2025 11:11:26 -0800 (PST)
Received: from pavan.localdomain ([49.37.145.228])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-347267a1240sm6378545a91.7.2025.11.21.11.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 11:11:25 -0800 (PST)
From: Pavan Kumar Yalagada <pavankumaryalagada@gmail.com>
To: parthiban.veerasooran@microchip.com,
	christian.gromm@microchip.com
Cc: gregkh@linuxfoundation.org,
	laurent.pinchart+renesas@ideasonboard.com,
	hverkuil+cisco@kernel.org,
	linux-staging@lists.linux.dev,
	Pavan Kumar Yalagada <pavankumaryalagada@gmail.com>
Subject: [PATCH] staging: most: video: replace BUG_ON() with WARN_ON_ONCE()
Date: Fri, 21 Nov 2025 14:09:09 -0500
Message-ID: <20251121190909.115556-1-pavankumaryalagada@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

checkpatch.pl recommends replacing BUG_ON() with WARN_ON_ONCE()
to avoid a kernel panic.

Signed-off-by: Pavan Kumar Yalagada <pavankumaryalagada@gmail.com>
---
 drivers/staging/most/video/video.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/most/video/video.c b/drivers/staging/most/video/video.c
index 32f71d9a9cf7..3a622bd597e6 100644
--- a/drivers/staging/most/video/video.c
+++ b/drivers/staging/most/video/video.c
@@ -575,7 +575,7 @@ static void __exit comp_exit(void)
 
 	most_deregister_configfs_subsys(&comp);
 	most_deregister_component(&comp);
-	BUG_ON(!list_empty(&video_devices));
+	WARN_ON_ONCE(!list_empty(&video_devices));
 }
 
 module_init(comp_init);
-- 
2.47.3

