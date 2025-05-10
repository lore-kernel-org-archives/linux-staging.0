Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A8064B1E57
	for <linux-staging@lists.linux.dev>; Sat, 10 May 2025 15:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746891490; cv=none; b=ogThR1+Wawh2QnTAUGRWbfgvuqR8twGM/bOYxSnUcGof3y4wOPYMMWmq+376FJGV6SP7dMPufmgIovXaWe7sDLjy9fdNtIpg2NyRzYznvEdfGoNdxwRN5Ep+Q8OJJGa2SoWL4HQtefNoIOM2lfPTvgRNNLF3J2rujtvpxpVTuRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746891490; c=relaxed/simple;
	bh=FI4bk2uvupimMFJpuFZh5GpeoaWpAnt1WVk6KoMoWlc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nEg87PAKX44BE7S7qZ1P7rwlWSUP+5pVbp7TuYQf4XlAmGeEs1l3LIZpxvVfMIX1Mscv0Lr6sRWBC7+9siXWuPYcTFgXgfP47uE3ddYeG6UsYHZxLgI0FSCLv924FdFvgoIDnWT8ERy495TyxDESqf10lqOk5YZIl0EZZhphvzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lkBgx/P6; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lkBgx/P6"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5fbf0324faaso6233197a12.1
        for <linux-staging@lists.linux.dev>; Sat, 10 May 2025 08:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746891486; x=1747496286; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aCRLY6PSOaTqAxmVdWEjXCR36yqNhZAvTLdz/IG0MaQ=;
        b=lkBgx/P6WHqtgcMOjFCUOzMrgK3c3vNhCzXLY8ufd5mtwswILut/E/AWkvJgCrO7bs
         H6P18tK+0JsCRNFTNV+AOzcSPTddYNcbzNQFsLbkYlvcDZxVjLbjRFIA1cvcUH+6md2q
         5IB9ktvwjre5NUubYspMX1Vgce8ba8UfhOMyPDn47cYRwizqlgw/GUQkHqB6r6M7Qypw
         Zv9VV2H9s1KF8tnfVh2svWQSlLoGIyRqsAvhkDbAgtneBg2pv78WxA5otXoDbA+b7cH2
         fiYoH3BMMzSX61CeGmWFWrRUZkb6PtFjTeMlhX9GueM5k/y83jHSF1WB4A9bZU2KHJkJ
         jA+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746891486; x=1747496286;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aCRLY6PSOaTqAxmVdWEjXCR36yqNhZAvTLdz/IG0MaQ=;
        b=sMVmom40RbbMWWmhDb/VsxKbRYzIErI/DE6xGWOCJ3RAb2ygLAuw4Kx0kqXR0hP1eR
         PcIt0A0J4ofcXY3bZuXnb7UrV3h69P7fGrkOsxhpWBbxTsMcFNiTf4r+oZk05I4cYSle
         KicWtDsbBzJ+LyPxkG8JUzAHwnJofiISzSgbBljkYo+4FN4wCEaEsDGM0aTXg7fwDweg
         38C2yZmxHJ35U0+cibHFD+iwnMeee+vyJXDvNNncFYD04uLGU91pDmibwzw1tFxQxUkX
         YkRPjb4/cGXX1OODpH4ZMzy5xTQd1GkX2IrOmZw8EyIUQpYkLFYtxrLEzi/2Xp1DHxea
         Eoew==
X-Forwarded-Encrypted: i=1; AJvYcCVjWuo9CiMmPMU1uhngdlWykO2SoAClH4+LutYPFUpWtI0ZtemdJZ9FN3R0qGTnCuz9+Cwauiiq3Yvl+lXC@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4ZwULj/nuUsmctIznRqaZtbOSI4pjkATgpO7PZvS4tu0D9O1I
	+ErAE+g70pb07iljKTRRjfH5Ccsz+X9IjLoX7UJE22DW2/jdVYhW
X-Gm-Gg: ASbGncsXBD8HT8SQ+gsiMFERknFwh7+GWU6U11+zu/XnINN18tMW8OhCDVxxAKUQnKm
	cK6Ebu4kah9O6Ftl6WmwYbflhgDgD1QQn1xgfs9hsnfNjBHqzLAOsgqOOdouKIP7kkCyqww5ySf
	emIPFnt6fFJDH8Goy2dzavoUbXoZAyaOILF7cqWHe1eSaPKRYog3OLYerbNyr054VXotfuejbWa
	udHdwOjooSBP+Gc+Eoo5Wth/vB+/CWVTmgHzN3TTS3jsW/VdfXWX900UKkSLQ13Yun5urPMx2o2
	XYJvPk+5wjQugYLMO6kaRJvE64GokKSQG4z+v+0wCgc4SjHSDk8SMxaiH9IVx40N40VYzJMCTfT
	36bxC+sKr+aBgGkhfbjmF2fnQaWCJ5GkKLAkANWy55r2+gH1055TspSkSDUGX2yH9XOiMLvQH8F
	HELaVx39YRQ7c=
X-Google-Smtp-Source: AGHT+IGFdMZcsOY7f2tt7vpbB1oV8Xxo5s/81U/bkxLxz5rk1rLAGldrYx5xLBlmMnknbg6GEMlasA==
X-Received: by 2002:a05:6402:90e:b0:5fb:1cbb:9390 with SMTP id 4fb4d7f45d1cf-5fca081bc55mr6639155a12.33.1746891486412;
        Sat, 10 May 2025 08:38:06 -0700 (PDT)
Received: from chimera.arnhem.chello.nl (2001-1c08-0706-8b00-79cf-0e0d-6e5d-219d.cable.dynamic.v6.ziggo.nl. [2001:1c08:706:8b00:79cf:e0d:6e5d:219d])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fc9d70e296sm2986376a12.75.2025.05.10.08.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 08:38:06 -0700 (PDT)
From: Thomas Andreatta <thomasandreatta2000@gmail.com>
X-Google-Original-From: Thomas Andreatta <thomas.andreatta2000@gmail.com>
To: dpenkler@gmail.com
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Thomas Andreatta <thomas.andreatta2000@gmail.com>
Subject: [PATCH 1/2] Staging: common: iblib: Changed ibrsc function type
Date: Sat, 10 May 2025 17:37:59 +0200
Message-Id: <20250510153800.130974-1-thomas.andreatta2000@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function ibrsc type changed from void to int.
Returning 0 for success.

Signed-off-by: Thomas Andreatta <thomas.andreatta2000@gmail.com>
---
 drivers/staging/gpib/common/iblib.c       | 4 ++--
 drivers/staging/gpib/include/gpib_proto.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/gpib/common/iblib.c b/drivers/staging/gpib/common/iblib.c
index b297261818f2..8b4280309ae7 100644
--- a/drivers/staging/gpib/common/iblib.c
+++ b/drivers/staging/gpib/common/iblib.c
@@ -418,12 +418,12 @@ int ibsic(struct gpib_board *board, unsigned int usec_duration)
 	return 0;
 }
 
-	/* FIXME make int */
-void ibrsc(struct gpib_board *board, int request_control)
+int ibrsc(struct gpib_board *board, int request_control)
 {
 	board->master = request_control != 0;
 	if (board->interface->request_system_control)
 		board->interface->request_system_control(board, request_control);
+	return 0;
 }
 
 /*
diff --git a/drivers/staging/gpib/include/gpib_proto.h b/drivers/staging/gpib/include/gpib_proto.h
index 2c7dfc02f517..9ef1cc247289 100644
--- a/drivers/staging/gpib/include/gpib_proto.h
+++ b/drivers/staging/gpib/include/gpib_proto.h
@@ -38,7 +38,7 @@ int iblines(const struct gpib_board *board, short *lines);
 int ibrd(struct gpib_board *board, uint8_t *buf, size_t length, int *end_flag, size_t *bytes_read);
 int ibrpp(struct gpib_board *board, uint8_t *buf);
 int ibrsv2(struct gpib_board *board, uint8_t status_byte, int new_reason_for_service);
-void ibrsc(struct gpib_board *board, int request_control);
+int ibrsc(struct gpib_board *board, int request_control);
 int ibsic(struct gpib_board *board, unsigned int usec_duration);
 int ibsre(struct gpib_board *board, int enable);
 int ibpad(struct gpib_board *board, unsigned int addr);
-- 
2.34.1

