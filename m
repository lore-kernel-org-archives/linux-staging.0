Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F292A266B40;
	Wed, 16 Jul 2025 01:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752630168; cv=none; b=Ec+VVIqxFK439lcyaZ4K5f3leRYMzu56Yy/0b+1cPNZhXDprW5r2VTf0udCcx6h1D9i6mIDT9Elw3KywRiNE7WJRhbsm1M5US1hGTaKMEt+kTrvGafqTqfeLTuOSeMsCpNSaS2URT3HDzRxcys1u5CEmYRbINicJkbp/QIe4S5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752630168; c=relaxed/simple;
	bh=xPTaJ/vt4lk2a72T8bc6Fse4Xs2FqJLAdSx3tQyf6gE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=A5vchCp15kPa+gBoi2n9tFu8BWzQyBr4DVQD6VCnKCvCTnJDXUakNCwRao4PCf+zeR0xzD6AXn3Go7MFjdbgMbgXDqsbJ5u9j8cgANJFMxr4UCMmUWXzzIu9tsSR8ANg2MWtZHxuko/aVTKbvIXZJGAlfrcod3wK8uqteh5JgQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jvxFQfYd; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jvxFQfYd"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a577ab8c34so590930f8f.3;
        Tue, 15 Jul 2025 18:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752630165; x=1753234965; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GLeyLYXEFMibFLWvaUdvqmO2gpxZqhTUQ7OQNA+GmDk=;
        b=jvxFQfYdEtOXLOEhma+zVUEeJWQjIo8MvFhwC1cFOWNr7CboCiS19rdb+UKigO30uY
         i4wNZQBu8va5mUg6YvJLJ9lj1bS3mTl88E9nvZxvnRnXBUrMWhQClOl1L2GIGF/jWDCq
         OfqLkiKkU1C/51STgTBcdEvCzI5BHhs3kg/YcjI5lhv/fCegOs2t7+YkfxcB3nziq1Ro
         dBio46sEHB56aBChZRSibovTaCA4NBSCNdWGpZfOQK/sW31ETyRJpn+N/qr8uJqJgOE5
         PdJtyPSeKMGkGiFIwbewNfahUf7Fzf6dxGFMJme145XOoARBbYd9FBlnR+XAC4dQU4tR
         LWRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752630165; x=1753234965;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GLeyLYXEFMibFLWvaUdvqmO2gpxZqhTUQ7OQNA+GmDk=;
        b=YEfgSiQdNiAwHXXfIlD/4/EGtBLQHgZWn9dYHH83eVF/An1YNk5v72qbUWFLt0rTbZ
         QxfTARWJJMyOY2uJ7J7DoQGVT8uT+fmKYTsYOgPvp6UFCrwt6afRILMzQ4l785noMl/U
         bVPm0Rhqc9z+ecT4vpn4H5KYV8b5lwd3Hw62hoj7A5IiIgov1RslXb/ZpFDHroPGrLz3
         qLCrHtydXbyBDPJSzk4n1Qy9xZMkp0JBCDYWtKDP9dPio17+yuCtwqASirN9AdFBXKWo
         Sw878B/otfPx1bquOpeg6bfUK6cmETRwsFTGP4oDO5JUMFXoyIvfPazzCyuOrjXc8Air
         aUkA==
X-Forwarded-Encrypted: i=1; AJvYcCUEZKKK+UyoK6u7+zvbncF2pTFWjOgtas2G6ZfYGCSf4RsQ28P4Y3G7SqXrgeXELfOBhRp1TsMSq75wRMD2CdlcrQQIQg==@lists.linux.dev, AJvYcCXBSiaGJtrXHmsYhHkmAxDVXAKvjdNEYecGleZDZ8cGAVlMa84SD1jCVX6v2W8+rsNSMK2B6suVq636/hvPgQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxymJJj9Rf/6n0xaKguB5cCtDVvVrpDMNAmHAi+65GnFa2lOB5S
	+dzRgDEW39+/X1n2pk3BaoAAHqDDDzlTRywZkfg0WU0KhjdxrAs7E48e
X-Gm-Gg: ASbGncvtmPBJNwF1QctMRt28rv5RMjLQ5FnQZ6CEW0lAWITmzy0MkotRw4d/taJxJLP
	+vVf9iv4KMiP/dyaqdP20Y8JS3TEvQGY3xkbNGXULhWJJlr7yL/us3XG+GUSZqf9QEgCdImbaR0
	m+hZhhcr1SgTpCmOaCn+su1Zhj+u/6YmiTSE4wgPfDhkQHClne8iJpWSdmz+eSuy+jE3QHzCseF
	L/u0ArWv7UEZqdD6aL8HPUlOWqgvhN1kT80Idr06Z+KxGami7n0pKewkDtiD5dpT/1/yPusMbeT
	QpJ1V1v19+RJHtQZIvi4GrGkSUpxip4rp7c+tiRgvwoQ/2y/lxQ4RxPpdokpBOT61YInhE9VlTu
	/pKmeT451yPsa3PM+5f0uK8gXt+iNbiOBMUovgKyoya7lj5iP87QszLMghzv9
X-Google-Smtp-Source: AGHT+IENO4+qmqIviSlPAbVS9ZtjYXYAhHGWqJPgF2KWiIPDRbXn2F7WUNRL/NiNhLjZHit3fOEBMw==
X-Received: by 2002:a05:6000:471c:b0:3a5:8b43:2c19 with SMTP id ffacd0b85a97d-3b60dd52f15mr298310f8f.4.1752630164926;
        Tue, 15 Jul 2025 18:42:44 -0700 (PDT)
Received: from localhost.localdomain ([156.208.220.148])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8e0d76fsm16785637f8f.64.2025.07.15.18.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 18:42:44 -0700 (PDT)
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	dan.carpenter@linaro.org,
	Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Subject: [PATCH] staging: media: atomisp: add missing mutex lock in atomisp_s_fmt_cap
Date: Wed, 16 Jul 2025 04:42:25 +0300
Message-Id: <20250716014225.15279-1-abdelrahmanfekry375@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function atomisp_set_fmt() modifies shared device state and expects
callers to hold the isp->mutex for synchronization. While most internal
callers correctly lock the mutex before invoking atomisp_set_fmt(), the
V4L2 ioctl handler atomisp_s_fmt_cap() does not.

This results in an unsafe execution path for VIDIOC_S_FMT ioctls
(e.g. via v4l2-ctl), where shared structures such as pipe->pix and
pipe->frame_info may be modified concurrently without proper protection.

- Fix this by explicitly locking isp->mutex in atomisp_s_fmt_cap().

Signed-off-by: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index bb8b2f2213b0..9bf0be00657c 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -416,8 +416,15 @@ static int atomisp_s_fmt_cap(struct file *file, void *fh,
 			     struct v4l2_format *f)
 {
 	struct video_device *vdev = video_devdata(file);
+	struct atomisp_device *isp = video_get_drvdata(vdev);
+
+	int ret;
 
-	return atomisp_set_fmt(vdev, f);
+	mutex_lock(&isp->mutex);
+	ret = atomisp_set_fmt(vdev, f);
+	mutex_unlock(&isp->mutex);
+
+	return ret;
 }
 
 /*
-- 
2.25.1

