Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C9E2561A7
	for <linux-staging@lists.linux.dev>; Sun,  1 Mar 2026 21:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772401701; cv=none; b=fgiGytXEYqgvHAPpJuerAosPmVNt56aPg9NCTJE32UWO1ieu8hlnmRIzpS2pUfZiazNo5a6lNUReU96nb4U0E67btEjtODSVD9d2clZOb+VJKOe5/b3bpHB4K0H8OJUXKGZgXaHb+oF1jauBzJ3HWpGFV1YNRITyFOrOzH5vb1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772401701; c=relaxed/simple;
	bh=LUy1QzCzZ2Vt49l4Ogih2TytM0hTHyN3IaBeGxYcOAQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PnB5H4pWTdNB5//msYQaSANVK26cXFXRz5OKS5weubHWfm/6ybjJD+PgQCe/LwZrymeTigk17Ly2QGU8EPBz+18VRg6Na6RhULVgwrB5zQLGjzS9XVp1j5u5RjCPLG66SQQM1Ad4fho6tFZHWSSuMIz+geSVgG7rQhZ+KeodF/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KtOV/THy; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KtOV/THy"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-899ed41208fso18906326d6.1
        for <linux-staging@lists.linux.dev>; Sun, 01 Mar 2026 13:48:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772401699; x=1773006499; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WgQTXI0MuVbXZoitGibu+W9qoch/e7f+GVRyujwVuMw=;
        b=KtOV/THywif0iuQ0aptiM1yZ8KzsfhTlHknL8CoUUN9iF5GhiNzQ0LuXgol5K7uiue
         XEsnEp133rJA562Etw96pQsmycMs4TvwtEV7VRSrmZ39ug/zEkaszlU1ksE+CjPG937i
         /HMQBvVPbqTCKMQJxfqFLLqA1ql0bq+tIvTkrpR5KQoiPrW9WZYbmlKdZ/0ZlF+3MjVn
         zOWL92i7ImWkmV+sW/kjij0cOWOk6bQlCVp4Bcriy3HHXAVzR8tZoQkUIjg0bhzlBeua
         X60DEegH7nXmoAU5SDuis8kXVgxu/c+diS4s9yTKBKFJb6c41JRNbxC8wqBsylzlaD8o
         l0dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772401699; x=1773006499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WgQTXI0MuVbXZoitGibu+W9qoch/e7f+GVRyujwVuMw=;
        b=iaqU8QB2r22fd3GhbKdjRvIZLqjpJWPEcMMwVJsr//a4fOEDi/FrGN0LelL5Thkqi0
         Dh4DEqFc15oA+15Bc7jf4mw4HRADiurzmXAcSX2EUdnSeAAhaGq6Vo8S1rLDkgA04TpO
         31/esA/mehrw57WQzPt0IaCQITiVHWG+LL7lz9YKe/1v2xR6E/eF78UqYJRcLgEw38gx
         OuVl5yCM9WzD2OorBfswqVNkD8W221Pn22HDSca0+z3zzTY7QMyaRWWkny41ptAbjAxx
         2uL7g4/QI1AQqtPeDkCSBT0huut3Wpum4eSqeuATOo0gHMnPrSXbzZQNj/HJ519xtWlQ
         V/Nw==
X-Forwarded-Encrypted: i=1; AJvYcCUgcXSjzuOOcgPa+t/OlqJ+JM5DzczYYEO43baZvyCv9jnVd8HVeZgGo3BD5omgqrOcDyJ8u/huuBQxopZU@lists.linux.dev
X-Gm-Message-State: AOJu0YxSkxUphMxVr7hpC9QVqi2d/ko+fi0amBe9GeJH66bb5adkEO8h
	8nvCgguIz6xxMXQsn3D5rx467urNaWyOAc4SlTYnRsje3yJvZ7IcvYge
X-Gm-Gg: ATEYQzyfu1fsGdTQ+hHppjTXgzSQBBFZMHWy3ORqhXQZeSz5Mwc841dJgqZAGTMEcH9
	V3JKpuAtiySyTvpmj8+HyxwSFxQOChDBjjRSKUCg9OrQqDOm9wEZADRTuU2KyXasBFajo45wevm
	iBBLVjya2Je9J3URAoSlsHn5BM5RtkFpeqh3tG+wh+PURMq0BHWxYJOTivONOpD1cWZo06fQeWc
	L094ytqPFUurAoRLbLasQdeDDRh5LCHi3lXSaqEq7mY+nmCcOPVc/tNCZiLNNk2Q99KNhx6TvsG
	BO5/oIaweCoNTbj5u6VmD4hj7Vd4V6di7xd90QqBlfpxsYHFkf92lsNJFj8Wn0dMgk6bGw486lj
	cqFnjyauZxH81YWlKSGa5VNVHa8cuXk2WvYLXNSuKoDBBA/21j6qoDXoqCapmTIvIbFqQYxyM5D
	hbAgpVDOhmrzH8Qx7FU378MnvWayHf6u1lHlCs7NLYiD82Dsn+vZDGPkZmi0EXuWjuXyYjZH4CU
	LEo5gYLJ9btwJ4=
X-Received: by 2002:a05:6214:21cd:b0:897:306d:98c1 with SMTP id 6a1803df08f44-899d1e3dc5emr158000926d6.34.1772401699349;
        Sun, 01 Mar 2026 13:48:19 -0800 (PST)
Received: from instance-20260207-1316.vcn12250046.oraclevcn.com ([150.136.248.187])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cbbf6f948dsm1006700085a.30.2026.03.01.13.48.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 13:48:18 -0800 (PST)
From: Josh Law <hlcj1234567@gmail.com>
X-Google-Original-From: Josh Law <objecting@objecting.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ovidiu Panait <ovidiu.panait.oss@gmail.com>
Cc: Gabriel Shahrouzi <gshahrouzi@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Josh Law <objecting@objecting.org>
Subject: [PATCH v2 02/10] staging: axis-fifo: remove redundant goto end
Date: Sun,  1 Mar 2026 21:48:07 +0000
Message-ID: <20260301214815.2628942-2-objecting@objecting.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260301214815.2628942-1-objecting@objecting.org>
References: <20260301214815.2628942-1-objecting@objecting.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Josh Law <objecting@objecting.org>

Signed-off-by: Josh Law <objecting@objecting.org>
---
 drivers/staging/axis-fifo/axis-fifo.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index aac2c58ef9b3..d83a0fd5b231 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -395,22 +395,22 @@ static int axis_fifo_parse_dt(struct axis_fifo *fifo)
 				   &value);
 	if (ret) {
 		dev_err(fifo->dt_device, "missing xlnx,axi-str-rxd-tdata-width property\n");
-		goto end;
+		return ret;
 	} else if (value != 32) {
 		dev_err(fifo->dt_device, "xlnx,axi-str-rxd-tdata-width only supports 32 bits\n");
 		ret = -EIO;
-		goto end;
+		return ret;
 	}
 
 	ret = of_property_read_u32(node, "xlnx,axi-str-txd-tdata-width",
 				   &value);
 	if (ret) {
 		dev_err(fifo->dt_device, "missing xlnx,axi-str-txd-tdata-width property\n");
-		goto end;
+		return ret;
 	} else if (value != 32) {
 		dev_err(fifo->dt_device, "xlnx,axi-str-txd-tdata-width only supports 32 bits\n");
 		ret = -EIO;
-		goto end;
+		return ret;
 	}
 
 	ret = of_property_read_u32(node, "xlnx,rx-fifo-depth",
@@ -418,7 +418,7 @@ static int axis_fifo_parse_dt(struct axis_fifo *fifo)
 	if (ret) {
 		dev_err(fifo->dt_device, "missing xlnx,rx-fifo-depth property\n");
 		ret = -EIO;
-		goto end;
+		return ret;
 	}
 
 	ret = of_property_read_u32(node, "xlnx,tx-fifo-depth",
@@ -426,7 +426,7 @@ static int axis_fifo_parse_dt(struct axis_fifo *fifo)
 	if (ret) {
 		dev_err(fifo->dt_device, "missing xlnx,tx-fifo-depth property\n");
 		ret = -EIO;
-		goto end;
+		return ret;
 	}
 
 	ret = of_property_read_u32(node, "xlnx,use-rx-data",
@@ -434,7 +434,7 @@ static int axis_fifo_parse_dt(struct axis_fifo *fifo)
 	if (ret) {
 		dev_err(fifo->dt_device, "missing xlnx,use-rx-data property\n");
 		ret = -EIO;
-		goto end;
+		return ret;
 	}
 
 	ret = of_property_read_u32(node, "xlnx,use-tx-data",
@@ -442,10 +442,9 @@ static int axis_fifo_parse_dt(struct axis_fifo *fifo)
 	if (ret) {
 		dev_err(fifo->dt_device, "missing xlnx,use-tx-data property\n");
 		ret = -EIO;
-		goto end;
+		return ret;
 	}
 
-end:
 	return ret;
 }
 
-- 
2.43.0

