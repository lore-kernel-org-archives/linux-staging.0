Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2980A2D29B7
	for <linux-staging@lists.linux.dev>; Sat, 30 Aug 2025 17:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756575542; cv=none; b=OrDma4gEB6I6xWOqk9ab63lKEwFAbxGi5s6P6tEmbERH64lDS718Y75C92KX6NTv5sn6ouY0L28YJ7Pq6KvnOlhFQw8auErQN3li9lvlQ0nb3Aa91jkMmIbeT3YXvQGwX2kBmm6JrplOzSNiWbRXxiAz4/hHesL6mKMH9cifat8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756575542; c=relaxed/simple;
	bh=XUFaq11L06NRQuF5veBS9YFaeK3iZLILO+qa6z0KLig=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=L8v2I5WZA4SPx1uS2WoIxBC+3JcmI4JmVQ6wyaxRdSd6mRJfxoCeHodAw89+D1OYuwsb92CNEvcZeXq/qprCo369YQcCyGEOjfHiu5uAyPqwVFgIVtjgOfPuarycLCGnFjQrXMR+oT/1aQSbJPZj12BCovaT4aR++LjgmGJYfGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=msoj1k+O; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="msoj1k+O"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-248e01cd834so7379585ad.0
        for <linux-staging@lists.linux.dev>; Sat, 30 Aug 2025 10:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756575540; x=1757180340; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pd3QAgaI6xLn3TSraR7jO04+lJz847xBQQfmdUU8S+4=;
        b=msoj1k+OkO1yj5v9W+OV2lg/9Z8DktkZ7znEyIk6bTO/ucFEb3QpEiOlcdl9TG33EO
         mE3msz/9eMEjvWhR/IAXLMIjWe3i30xRkgrGUfAURqk3q1EzSxZQdeTevph/IHbhgFIZ
         wY/0OGxCtMpUe2me3QC9j5IBuZBFnU3VVVExOek464hZX1oYP57kSn//9/gJOF9aFbik
         DYIb7oxSF6f3qwNjHubImgQmXGdJ9YPsVHxZ925/q8k4S+SQ7Rw5H6R1Mnpps1O1Zz7J
         DFRGZx/DZAsYFr0bR1rXRjqJP3MLHco8Z+E8ZBXjKnSXCcOZg04ktKY8M1GlOePsKurY
         qw8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756575540; x=1757180340;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pd3QAgaI6xLn3TSraR7jO04+lJz847xBQQfmdUU8S+4=;
        b=C/k0UQFDu9gLWtVoHKqTKEinqAAUE9N3SVN3PGnzRBDIH9GjZHzdmk++CkJ55DrR0w
         6/y2pjz98mRTZgvdbmOFmmBihcZj3WO0n+h4FR3MSfRpl74nrCsz14zs6ErTZvOscURv
         d+C1O5+HoiTa9aA1VHtWYeEhJ+8g00SLYnpgoE1CIx9YCV8jmPdsLRKhnLMsl0qjVlT7
         ccK5AF55vVFWmMYCHqImffIq6DbzK+AE874jXm2ljIGCurA2+H6Lx84EOm45cfnzHW4J
         3bgRQ/Q9MwxjVEMzqsoVImnxBgviN3WtEDXDHAxme2YjlumV2GCv4MG0PbyGibyWkbFQ
         naEw==
X-Forwarded-Encrypted: i=1; AJvYcCVemOCSql7bD7P8W3gzZ9NBFZeBmsuLUGv0nQ6nyVL+Lv25X9MgTskSfbmiONJ50/fUacBxtma2FRTiRhIY@lists.linux.dev
X-Gm-Message-State: AOJu0YyzgvjJMXeWjCF8GGwYWCiHiKMznYWg0uwwmQWSRg+LafHShaXP
	xvQQ2Sb/0/AXLB0Kq1wBnHl8gToHGR2GUlesqQ+jjg2wsqkGjr7a3t68
X-Gm-Gg: ASbGncscEOozqdi4w+EJY1s5M3qDZj4bXt3Ruug7qOHwQ92XkhyFMb3wliqPYkNoIkN
	rdZg52CVXuptJd6mejr5RQpKWK6aDeIHdhBbSfZm6VIx5FffIgGyBmf+ghzl+LLHHeqy1l+s3XF
	u7MOb4Y4kyNzz/UtiNWyfkiDSchVRdR9q5H5lS2Vv/LH4sbIil3NcnjlGUcCHTigWgatNXnAwec
	bifyHeA0xaw6miEChsrZne08Mo/7TkEEF1oHxMJYf5Qp6irkU+IUnkHaIvY6rjCfW6BqZo0FvgN
	ONMrq/oH+CLDpaYzSBlgPGjyzn7PvA/QsWgMv4QXRlNSdzZ9EWoSJoRNsWrI0zCmItQ2tXZgpPK
	OWlVS9f/3JKSa11TjO3DIA2NwKBnEu/AR6UnwoQgAYw==
X-Google-Smtp-Source: AGHT+IGXSHsujaSl2ROKONAWQE6+Ygosv4F3z5UVve5pQ4wzulH1rYWqg7jKwQSm4YJbOk69qQJB0w==
X-Received: by 2002:a17:90b:4b87:b0:324:f79c:2dd2 with SMTP id 98e67ed59e1d1-327e666e931mr5142096a91.8.1756575540232;
        Sat, 30 Aug 2025 10:39:00 -0700 (PDT)
Received: from raspberrypi.flets-east.jp ([2400:4050:d860:9700:eabe:57a8:cf74:875e])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4cd28ad39csm5154525a12.27.2025.08.30.10.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 10:38:59 -0700 (PDT)
From: Masaharu Noguchi <nogunix@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev
Cc: vaibhav.sr@gmail.com,
	mgreer@animalcreek.com,
	johan@kernel.org,
	elder@kernel.org,
	greybus-dev@lists.linaro.org,
	florian.fainelli@broadcom.com,
	rjui@broadcom.com,
	sbranden@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	dave.stevenson@raspberrypi.com,
	laurent.pinchart@ideasonboard.com,
	hverkuil@kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Masaharu Noguchi <nogunix@gmail.com>
Subject: [PATCH 0/2] staging: fix W=1 format-truncation warnings
Date: Sun, 31 Aug 2025 02:38:48 +0900
Message-Id: <20250830173850.323897-1-nogunix@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

    - This series fixes -Wformat-truncation warnings in staging drivers found with W=1 builds:
    - greybus: prefix device id to widget/control names safely
    - vc04_services/bcm2835-camera: compose V4L2 bus_info safely
    Both changes use scnprintf() for the prefix and strscpy() for the remainder. No functional change
    intended.

Masaharu Noguchi (2):
  staging: greybus: audio_topology: avoid -Wformat-truncation
  staging: vc04_services: bcm2835-camera: avoid -Wformat-truncation

 drivers/staging/greybus/audio_topology.c              | 11 ++++++-----
 .../vc04_services/bcm2835-camera/bcm2835-camera.c     |  5 +++--
 2 files changed, 9 insertions(+), 7 deletions(-)

-- 
2.39.5

