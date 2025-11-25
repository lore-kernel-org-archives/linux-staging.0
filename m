Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB881F9F7A
	for <linux-staging@lists.linux.dev>; Tue, 25 Nov 2025 22:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764111389; cv=none; b=PbmnIqazoTmFxYQuyvkCDL7+ZD9PRyFx+XHyE/HqUOQDTFFhMn51fTPMeLJmT1BOWdaWYNJcW5nXc3kjfPZxce3iEKFRCnnP7Pw9cbFTadaUmmQt9G3XkZqGrAeBnLQX47a3ECOvjJTu33Kiu4cUISyVqqXseLFUeOqEcFUCphk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764111389; c=relaxed/simple;
	bh=AK+BcklxHz/n0s157yXYc1X4X9YELa/zUDA/PZmkRw8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=noaQSLBY0G6U6fFyXrHu2BhEFaBfcL5nk2oznGJse2fVkivRs7bh66JrQBREQjdHTJ8+wb1IThkZpmPwQJ7MOORabJlVvv2t3P4EPl+uL8XSJ2SyDo1yN3d6u35JGbt5vf9PGQg1sHeUQ5ZkPU9ThqIbiN2IulpeoTc3cJ9QjCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DMZhLpBh; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DMZhLpBh"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-29845b06dd2so75058745ad.2
        for <linux-staging@lists.linux.dev>; Tue, 25 Nov 2025 14:56:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764111388; x=1764716188; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JUymcOI9xHtRON6CUcKqa1VF8txmKZFaaWw6pHQ2mGY=;
        b=DMZhLpBh3HqAWUHgG1yUpkdVCwWO36tNyh2FubT1t8IUW4Gnl3hafulyaeG18ioKul
         ByHhiJoFo6882NbXHXii5cwiY+w+kmSrFjySohWCDgfkWYOQuzlWSAD14n1Yc+g1P6N3
         H6QLSlN7hInCM8ZeAJCG7C00dVOahgBCgfrpkUBx4zF3eQEG/w3TvtbTjozInrK88Xgq
         ZIIfvnMFKZURxdqvACCYYFNP18IQhNY3Pfchlo37k6zXzOLllDhPL6mFgm2cI3AiZo9+
         fnFL5IqNg1E7Nqqr+uummx+qYW7v40Nj4d/PIgcbp5nblAydy9YRoUB6wlmzOfp7enpu
         gMIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764111388; x=1764716188;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JUymcOI9xHtRON6CUcKqa1VF8txmKZFaaWw6pHQ2mGY=;
        b=Ol031l12wTZdG2f4tjjZjgaUNk+sUnRkScfOAzjAtRg/9khYV6quRZFtZeJbMTj+RL
         DKCZIRj7fV+Uah3bnRnj560sWGuGR1nrz+UNJ+aO7z6TqJVD4JhyQoFL1TtlNO2Gdpzm
         EGzs4A8oJPs5MQObcWnOuiuvj176i07B5TA7SdZ8rTRCJoN9MQJxf0Woylr8ZjuchwLx
         rCt36i7k858w74EVtSubOizbEQozL9oaGSJrJwZfN9dhtn9u6zB2/j37ROvjudlx7V+n
         BhZXdBhoatB4kPS3Qqp3O3YpGO7taBDEgbDwJ7cHp4gRrf2Wpw2YZZFO/zzqvO6ScIF/
         wQrA==
X-Gm-Message-State: AOJu0Yy8fY5evxsyVGje3wRAJYx4wCVxaA5ySZOvoB/dl+HPoy+Bv2qS
	wuC7XqtUMYOdUkJfuCa6o4rBvoznLHzywILCryo8lEKfTkBUl09t1hub
X-Gm-Gg: ASbGncvueo46UiR160E/KRCQHolAYm8Gwlt/tSNSP49vQdlc1WF87z5MFYEQvp/meFW
	KPf/WG+0/NDhjCKrYbFyWy/LDmg7Rr03rhd+dxUl3qg2zJy6WesAtbs/TSymMAGqPX27Kgf/MZX
	4vuZ5hKbXIoeZ4XULyugVNJefowGAHgzqrUwbYro19hDzUxM7kryMEjfJTlMmmnxlTra9heoN5h
	jg3g11oWqBhTKd5NeZH6WrKqh8ievJUYxjmmEr9KIRNK0J6xCfxh8EbX7dbKDKBVdRitp8em7f8
	zjx6ugDC/f7PuINSTbbDarwKWzTzoOzNVVedV/T8LDHuIXdkZjWilXTw+JOiD8Z4K2ytwVWmT58
	ljZD14CxrLYd/+h83ZNy8RD6LfCS0a2NQNf66jUW18w0VV5Gnwb5lVTZeLNQGTF6yJ87Nj5itVH
	0ubilbNaORJueAjEehDSA1th972mOr9878eupdRRC06O14se/Le09rXUskcNC+Dy736o7YjEMST
	x3jpJJ3+dceTtiWMmshN0PQ9TNjqG+oU+Abj0bRP7cF7sUroPuyiWxLiQl+Yk0Vyqv2zb2Abu35
	JLeut3Wdy5KUvjyst4uWDFC3RbHKG9NHSQ==
X-Google-Smtp-Source: AGHT+IE07r8Bq07/RqXBLiC3oykdev8SWTJLZzLiYuPJLdGWN94mcaB6IVS6MU6ipnXWsd3H2nqv+w==
X-Received: by 2002:a17:903:28e:b0:298:648a:f96a with SMTP id d9443c01a7336-29b6c6f1817mr185366685ad.61.1764111387585;
        Tue, 25 Nov 2025 14:56:27 -0800 (PST)
Received: from cyberkunju.asia-south1-c.c.gen-lang-client-0196962068.internal (125.31.93.34.bc.googleusercontent.com. [34.93.31.125])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3476a546ed0sm471842a91.3.2025.11.25.14.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 14:56:27 -0800 (PST)
From: Navaneeth K <knavaneeth786@gmail.com>
To: parthiban.veerasooran@microchip.com,
	christian.gromm@microchip.com,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Navaneeth K <knavaneeth786@gmail.com>
Subject: [PATCH v2 0/2] most: core: fix resource leak in most_register_interface error paths
Date: Tue, 25 Nov 2025 22:56:04 +0000
Message-ID: <20251125225606.70719-1-knavaneeth786@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes a resource leak in most_register_interface() where
early errors (allocation failures) would return without releasing the
device, leaking memory.

It switches to the split device_initialize() + device_add() pattern
to ensure put_device() can be safely called on all error paths.

It also updates the most_usb driver to remove manual error handling
that would otherwise cause a double-free with the new core logic.

Changes in v2:
  - Replaced the previous single-driver fix ("staging: most: dim2: fix
    missing cleanup...") which was NACKed because it introduced a
    double-free risk.
  - Moved the fix to the Core (core.c) to handle cleanup centrally via
    put_device().
  - Updated most_usb.c to remove conflicting manual cleanup.
  - Dropped the dim2.c patch as the upstream code is already correct for
    this new core logic (it relies on the release callback, which core
    now triggers).

Navaneeth K (2):
  most: core: fix resource leak in most_register_interface error paths
  most: usb: remove double cleanup of interface on registration failure

 drivers/most/core.c     |  9 +++++++--
 drivers/most/most_usb.c | 11 +++--------
 2 files changed, 10 insertions(+), 10 deletions(-)
