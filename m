Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B898528936D
	for <linux-staging@lists.linux.dev>; Tue,  3 Jun 2025 18:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748976251; cv=none; b=qMc78Nj6vityLoeZ5MKsX7CSolrdg8ONjAAInR79kJNcSNYXv/bcGcP0XQ8IFFzd272Xh+WYSoqRKnLC0VayNfCyGjXxV9L+smKzgzEYBqCilw0dtk7e1AOGVzYOFDQMDRCBBB/+UQy6kUf7S6yI7HTLk1uk9ODd6c9JxHVRdOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748976251; c=relaxed/simple;
	bh=cs0d62jUhTsQ4M0UtMJEMQnYLyBLCUuZP7GJM7VZ4Mc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j4XLb3kFTUmNOGFzdtQjIHLtzND+4z+bavmyyQB3TH1R7tGkVkIZKpxld1xpTk1R/UD0VTnjPBTyMWz0WQb4xilKzVHEqGGJLCTU4MEb/AnvAO+tA57gv2XfDESJl7uXZ6vd8qjTyieTm8XFNFhSmURl5qhy/4Pp2ZiMcJ+ra4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ov7+UIbI; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ov7+UIbI"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a365a6804eso4516985f8f.3
        for <linux-staging@lists.linux.dev>; Tue, 03 Jun 2025 11:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748976248; x=1749581048; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B9FZ5oqjuv5Ikr1VhUnEUNb3J4Oy/+PaHPwc/4HpVkQ=;
        b=Ov7+UIbINs7HRKl4suwJ7jybQvxmI/9bX9uppdYUgeDkRvVT1gnY1nE88dvtz/p8sf
         SjuWJyubGrk2FUaUIrudRA64k/EOhfu2fTjmZOOAPaVnOLbMB5wvcG1bazxLPRAMwYJ9
         2HEBLn4pRrkl/51Cz45+tnivVB0bkgFfdzrz6AztqmQmxdqRmXKG29oMI+Uka/bvJlp1
         7eRvSm4pyBRC+GoFTelPaYP20NWuzxRdq113LII5tWAx3rMqk14tvLw9hg7XxJdp5TTZ
         o/bnKRg4WEUhj9djN6eCYbD2M+D4h/dY+dmPhIHUcUGfk4rTmMSjJy1+CKlwWTlT1i3G
         7M4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748976248; x=1749581048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B9FZ5oqjuv5Ikr1VhUnEUNb3J4Oy/+PaHPwc/4HpVkQ=;
        b=KZFVlgNnEHrie3dUzkTRdWk0v5zfksL2UXJb84Qn6VPIeQ4AN3YOOBaONagE7ZkKtn
         vbYTUoGpU1ZR16QK763ws2cqFFnFHkOw0giYawtzaLfb2vRZ9JE8jmAXl8OZ6zc1AWdN
         0z19rYOf/OVLp8+R8xqp1mzO9mzxOQ65ZNQNEPb23xTBySRrKeDj0TSuelDBR8q7ZkQx
         8D104uZ2JfbNZ2+05AsoYAOp8X/shHE4LX9g+sbvUlvIHaAyYEX07swvoDloNxwVsJo1
         31YXVYBtJX24YAFfteu52kXA/nX/5t5ZSzEIxG1gJzudN1lwu3R89MaHfX6FO6Z43Yb5
         m8cQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKW4ZhbhO0pLmqxjIDqcDTtIduITs7ndyqBf4qoJajEkpE4tQMksv/bjPYdfkMtOzOrDrRdE8AgSxkZ4Zz@lists.linux.dev
X-Gm-Message-State: AOJu0YwC7iGl4qiWq8Tq/gfJB/v5iGvd3DAPQEIwqpiBGKcw2lndgYrA
	90nIOS2GgwmZheLZGFlNM/YHPjxaCy9K7s1Ve76VdyJ646EjPm4KQJD5
X-Gm-Gg: ASbGncvTzOAUgDZ+ClA1MAxTL95mZW5e7RcekDeiLNfDKx5bTF/Kw12kXO7q+m6FH+h
	ao7S+0Z4OY0KX//Y6hDZUwKMLPIMzRhk2ykXCfccJcwQainPI5JAbGa7yEezPUfU0MpNdRTNf1V
	DuYLJC9hmCUoNfZe+0lnjIsmtOBnY/sjOXGYQ9DA3RNpu19hfIxxDUWw+u6BZQ4Y9IH4dZGb4qE
	XE9mcMtA7SEDzXsT8f6Pt+DA36lf6kAaNbCLgk0/MOpoRk5zCak/BYGgRL4z8Wka5G3OgoTqTV0
	SZz/bFep7hL/Z1pz6bhgURAC2gbXVrtf6p1Jp4tt2oHTXL//P12LMQq9T1uQv1W5DUqt5e+821F
	1ljRqnX3fbEM=
X-Google-Smtp-Source: AGHT+IF5Hwuvnc/0J0y8rHsrGxR6kUfr4vat5I1FdEtpqaq/YMu7JxaNXcvi1U8W2zY7/o/ig/bjaw==
X-Received: by 2002:a05:6000:2089:b0:3a4:e68c:beeb with SMTP id ffacd0b85a97d-3a4f7a4d34dmr12758179f8f.22.1748976247866;
        Tue, 03 Jun 2025 11:44:07 -0700 (PDT)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe73f83sm18449959f8f.49.2025.06.03.11.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 11:44:07 -0700 (PDT)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH 4/4] staging: gpib: Add bit and byte padding to ioctl structs
Date: Tue,  3 Jun 2025 20:43:20 +0200
Message-ID: <20250603184320.30594-5-dpenkler@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250603184320.30594-1-dpenkler@gmail.com>
References: <20250603184320.30594-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ensure that all structs have a size that is an integral mutliple
of 32 bits.

Change trailing single bit field to __u32 in gpib_open_dev_ioctl
Add byte padding to  gpib_serial_poll_ioctl and gpib_request_service2
Add bit padding to gpib_board_info_ioctl and gpib_ppoll_config_ioctl

Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/gpib/uapi/gpib_ioctl.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/uapi/gpib_ioctl.h b/drivers/staging/gpib/uapi/gpib_ioctl.h
index 0da47e28caaa..55bf5e55507a 100644
--- a/drivers/staging/gpib/uapi/gpib_ioctl.h
+++ b/drivers/staging/gpib/uapi/gpib_ioctl.h
@@ -29,7 +29,7 @@ struct gpib_open_dev_ioctl {
 	__u32 handle;
 	__u32 pad;
 	__s32 sad;
-	unsigned is_board : 1;
+	__u32 is_board;
 };
 
 struct gpib_close_dev_ioctl {
@@ -40,6 +40,7 @@ struct gpib_serial_poll_ioctl {
 	__u32 pad;
 	__s32 sad;
 	__u8 status_byte;
+	__u8 padding[3];   // align to 32 bit boundary
 };
 
 struct gpib_eos_ioctl {
@@ -79,6 +80,7 @@ struct gpib_board_info_ioctl {
 	__u32 t1_delay;
 	unsigned ist : 1;
 	unsigned no_7_bit_eos : 1;
+	unsigned padding :30; // align to 32 bit boundary
 };
 
 struct gpib_select_pci_ioctl {
@@ -90,6 +92,7 @@ struct gpib_ppoll_config_ioctl {
 	__u8 config;
 	unsigned set_ist : 1;
 	unsigned clear_ist : 1;
+	unsigned padding :22; // align to 32 bit boundary
 };
 
 struct gpib_pad_ioctl {
@@ -110,6 +113,7 @@ struct gpib_select_device_path_ioctl {
 // update status byte and request service
 struct gpib_request_service2 {
 	__u8 status_byte;
+	__u8 padding[3]; // align to 32 bit boundary
 	__s32 new_reason_for_service;
 };
 
-- 
2.49.0

