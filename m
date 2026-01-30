Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B957223C4FD
	for <linux-staging@lists.linux.dev>; Fri, 30 Jan 2026 18:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769797004; cv=none; b=Z2gLb1Fwz4tkGkK9flm5YTJ56bFmpnPWSix/DEiieiglqq0Rv4KKgNV9honN/Fx/dGuV/o9ryP3o+8Xq9AslyBqWcBy+QPhVVOOZl8iExO5R5jEkw9ZrFjqPjWFG7I4KZPLrL+zaunt8trOTDHYQDJjpDxG0b/GLsWBEhngCWgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769797004; c=relaxed/simple;
	bh=6EgTXcqwqg3vJrjQbUl7izNIeYlecS/KT/v2QaMJPaw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iDqITtCqFs5zA/WAomwUq+HB45wce6wyB1I4U9b8PUoRqIn+NZwFo4psiJkNb//UKTsoEzLmyVq3OjtW8RkQ2U5vEDkYJHHJ8GSGS7pRl45dMS1oARrq0mCky/qaMInmhX5gI14t/6Q3/xZCAm6JlEeaYEJirIaPF1Otr/vn4YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TMqFhqP7; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TMqFhqP7"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4806dffc64cso18561105e9.1
        for <linux-staging@lists.linux.dev>; Fri, 30 Jan 2026 10:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769797001; x=1770401801; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XyoCKwDKnS7EHUC0xC/McmKcnrg3TfdwKe0um4NUZJY=;
        b=TMqFhqP7b90cbqxvKmRcSFFa370SU84u5ca3vFRkwyC4IWVoNke9EPixfPKYpg9hS6
         mwGALpzM2MZN39HO3MMsMAPrO0R5STEBD2bbK9sA5egwoDpnjsqot3y/R1BeE5FpLyPE
         aJUyruTLtYLayCcGQiEeXVGhAX+nEkPlv8qWEaprWM/MAhGIOLmrmwsq7enInY4y1sF2
         CpDFWmVZoCC7WRHyUeZCYE+k6CXMYCfh7/YDpgbtEhtIJsXpC8yxmaCuQSdDQV8fNfjD
         5fLrgsLx8WlD599rpXb9qHul2ANzz12gaEUG4FoNBIe7VVe2cY1Nb7T4Dvgn4HxtEkRW
         0c5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769797001; x=1770401801;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XyoCKwDKnS7EHUC0xC/McmKcnrg3TfdwKe0um4NUZJY=;
        b=Vec81K+7SAZ79jjs0wu5Q1XLunXD4Vlx2yTweL6F3XroT3UZ4ba3N2sSHQIg+P5ZJN
         HbN4efokcCvV9c99gqKsZ+0A0K/7xC++Z7xe/TiH2tUItQu/xoCKBdEE1KI6VUFoWicD
         zLyohD4ikl7NZ2pTPHLP3S7G9no6FNjTjwawjB30AOLO7Xjyc8p/MF+e7/eLaRGird27
         cT5WjGn1abs5BPOSdh20p2wsNKazZSOi+o55M6z51MLR+iRJrYBkja+xF9TggFiZJNA+
         LopkRzTkQuzRFOFjWkxQwvBhbSg3NPQeDcRyldhnhruJMEzMxMqSIesqtrRfjSqM5x4F
         HJ+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUx3cZieFeI5/EmcoAlMHt5F+3KVlWjLgXM5HGbxYwJq/eDaqL97RAchnEkr+bWMUYElywJ1skkKqGjGNeF@lists.linux.dev
X-Gm-Message-State: AOJu0YyH5fdnEBkjIXvT0etMDocQ0jIOpGhTelEL50sqDk8o9BK0AxYY
	woUqGBuqdrTKPni/5rDQkRHmbPsDaGBKeInVCvPhAVczOelXdif1994=
X-Gm-Gg: AZuq6aIk9okpAZ1G2rNl1VgGvmzF+bzLprSjMQPvjlUU4vBrUIrhI8TnVakUUnSDfAl
	3i6hTCZLkQ6e2onfjsMqgGhm6HCjGW8s9kJDRgG6CS+h1rIXfpQfSOtv4Pn3aMae0SCil2uLyxi
	aGkZP4vObyaKNH3O+learC7tsam4Q05IWW1uVB1dJECFM6A4XvJA6QJYoZ0fn6ttIJcTRIfalql
	jPS1GVULyT5phgkUINwcCrcfZei5bEW/f/yoWss4T4YDx5sKmcMMES7cOnbHZlT0JMIaBNkcS71
	cAZ7u8JsiPXB8bGIy16W5OKyC37nOaC+o4j2PQ/kNGgGD+8Q0PLt7gWVcvkThfxYtkc5uWbVIgy
	5sHYPaSk8HfoG3BCdTt0Ab/OzV18Iz1BQKf4UpPtIgDCVTbUxlgWydFA/+4QKEhhCKWfuxW00ow
	FaejUQRimwCk+9vz+VKS6karoB1YAzfS2+leAfhgWeV9XfcK4DFT6MhBf/wL/nuQ==
X-Received: by 2002:a05:600c:6298:b0:480:5951:fc1e with SMTP id 5b1f17b1804b1-482db45fbf4mr43517285e9.11.1769797000794;
        Fri, 30 Jan 2026 10:16:40 -0800 (PST)
Received: from LGPC ([31.223.131.55])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066c40e04sm280571025e9.13.2026.01.30.10.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 10:16:39 -0800 (PST)
From: Luka Gejak <lukagejak5@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luka Gejak <lukagejak5@gmail.com>
Subject: [PATCH v5 0/5] staging: rtl8723bs: fix OOB read and perform 
Date: Fri, 30 Jan 2026 19:16:15 +0100
Message-ID: <20260130181620.199152-1-lukagejak5@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes in v5:
- Corrected commit message line wrapping to 72 characters.
- Removed blank lines between tags in the Signed-off-by block.
- Removed "Security:" prefix from subject lines.
Changes in v4:
- IMPORTANT: Fixed a build regression in rtw_mlme.c found after 
submitting v3. v3 will not compile; please use this version instead.
- Fixed build regression in rtw_mlme.c found in v3.
- Removed unused variable 'i' from previous iteration.
Changes in v3:
- Reordered the series so the bugfix is Patch 1/5.
- Patch 1: Dropped memcmp change, kept original byte comparison style 
for clarity (requested by Greg KH).
- Patch 1: Added Cc: stable tag.
- Patch 1: Updated commit message to explain the OOB read logic.
Changes in v2:
- Split u1bTmp rename and spacing fixes into two separate patches.
- Split hex modernization and the WMM bugfix into two separate patches.
- Added a Fixes: tag to the WMM bugfix.
- Removed an unused variable and dead debugging code.


Luka Gejak (5):
  staging: rtl8723bs: fix potential out-of-bounds read in
    rtw_restruct_wmm_ie
  staging: rtl8723bs: rename u1bTmp to val
  staging: rtl8723bs: fix spacing around operators
  staging: rtl8723bs: modernize hex output in rtw_report_sec_ie
  staging: rtl8723bs: remove dead debugging code in rtw_mlme_ext.c

 drivers/staging/rtl8723bs/core/rtw_mlme.c     | 10 +++---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c |  9 ------
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 32 +++++++++----------
 drivers/staging/rtl8723bs/hal/sdio_halinit.c  | 32 +++++++++----------
 4 files changed, 38 insertions(+), 45 deletions(-)

-- 
2.52.0

