Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20DB61F560D
	for <linux-staging@lists.linux.dev>; Wed,  9 Apr 2025 05:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744178367; cv=none; b=Zjv25FJyfo9ZfHfV/CNku3FFGdkU9wml3gWrYdjAM/aXVfxtyJp3uS40MsTtwBE7shmhEfntlJwdePvH1dnj9O6eC6vyoj/4GJXgGbKwEysDik8P/EGDvMSwZ0VMOZjcyzOwOD5Rf8rl7DaunHFEdRt0WH5lbyq2CEfaEP/iOXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744178367; c=relaxed/simple;
	bh=7fDnNZyWVelA2uVBKDQ3RFhfWQv6oGCEmBupTouNOMg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kyjx0l9zbWV3BEqa+TXfNhD79h4MWdiY1qlciEhkjTrJHjqVBZuEd86fwT6M44BM/otLru3ccP/vFs8S/Gv6OPHcDNLFhkiCnES70fJ0u5+J80vlxbC3y4b6VRqpXk0qb+8+jpKSrLNrjQx2SjV6QnZjzJevn5V23oO98ajhf0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=Pb5jAYPU; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="Pb5jAYPU"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-22928d629faso64923735ad.3
        for <linux-staging@lists.linux.dev>; Tue, 08 Apr 2025 22:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744178365; x=1744783165; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qxE4gWwYLPsvJrRpHDQz1czRhA/+OUvd2xG6gTlogF0=;
        b=Pb5jAYPUBD0cRyMQQ+ckCmFnFBkXieoBWrBm0lJcaR6EVRP7De+bYZK6Rm0Sdw3TU0
         wsJf8ZgOr3vaD55lrVrLm9BmMShMDME10yqXNZqNOJ7kF0EVOlOgr+VIvIe/3ClGZ3uk
         4r2H6/zykIw2FHT2qox9ONjvsfmgYkD8vzXvSfz9C/NOfYOoHXe17LlhvGWMgrkGu1zz
         mCsW0hA+YXCScxLc40eF1jBCVt1/jkbAP5u3AVW3z3BhZtD1aYmRT4qHGUiY4AQoYAy3
         ELOArBeOcBT2uNjgwQ+ysLgZdxMmf1r11Cm6Sg9dWjncPj0iilvzPZr3YhPll/Gyoz5j
         4VUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744178365; x=1744783165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qxE4gWwYLPsvJrRpHDQz1czRhA/+OUvd2xG6gTlogF0=;
        b=ufa79X4meMyOUdNlmlTeGXmoKKwsjXy7xcpJ6VNV9jEXFhWWQcTrQ5+1nG6Lb2OADF
         zhxucQKHTKZsmZj9+pfpCxsVjZBapKQHKYIjaD0J13yoQvpccsFmum/1LcsOdkZvAYJu
         HXfm82JVKGLmNWTZaVy3gvc1QS3SYjAOSvuiWESVF/Fv9EboCFXerLZ7S16Th0NvvFWl
         5pWPWy92iWhy7KGhrM2kPfLMNSR3Xi6jVJX+UykWYCe15XKr3hLo/Rmn7i+lJ9iVrcs8
         IdAPtTXUTTSYMlT1Ewe9SwRKV7MF1e335ZerTWEECY5cQ9+3+n65v84QdlLXTtreyMuY
         c5ow==
X-Gm-Message-State: AOJu0YwDbPm6hAaHbA3LWY8GUHG89S+B1ajaoeDeTM6DAvXIUnNEvQtL
	dRX/tkIjftV+jBA7XbGnw0CTV6fZXD8FPfINLRO5yjHoN/yonApBPW7L0pDhph0NvO+Ea+mWaao
	=
X-Gm-Gg: ASbGncs0sjX5yhMZUaqjV0srBeygVckQGfJfNP1MfiPjOUmSde3FC+xwkpHdblFsOEm
	DxL7XDdgmS07FvpHefigON8ABrhZ6ZLEExQb4AckUvjbpKGXzVyuWIKLtW+MIIZScnLKCF4UTwc
	ElctX2W5GNmIcXFvcW4B/oTV483Z//iYSI5nGkLjvIcrra/srD4vcE0QBzqunEAW5irCry939Ht
	46z3nvnokcYgW7dY8qJ3P4mNes3LvMUmEabRNI8lyhFrjUfeNZR+gUNPTtYfZfICcWG/fddQ0YB
	+tws/wbCmCCAbH6xsWP68yA3OQdjoNIF8O56C4iKmJ8ElQpR2iTzQSfNYLJ+Q6jMg1cMSUHAc2G
	P4w22zA==
X-Google-Smtp-Source: AGHT+IEaAD7oH8MI6x/a+Fqozx/FFggtmkkKHuw2dYqZ2L3Em4TjIRajw7UDOLoU6kxqquxnH2IbkQ==
X-Received: by 2002:a17:902:c40e:b0:220:c34c:5760 with SMTP id d9443c01a7336-22ac2c36606mr22391615ad.51.1744178365469;
        Tue, 08 Apr 2025 22:59:25 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b8b158sm3476475ad.84.2025.04.08.22.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 22:59:25 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [Patch v1 16/21] staging: gpib: Using struct gpib_request_service2
Date: Wed,  9 Apr 2025 05:58:58 +0000
Message-ID: <20250409055903.321438-17-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250409055903.321438-1-matchstick@neverthere.org>
References: <20250409055903.321438-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style for 'struct gpib_request_service2' to remove typedef.

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/common/gpib_os.c  | 4 ++--
 drivers/staging/gpib/uapi/gpib_ioctl.h | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/gpib/common/gpib_os.c b/drivers/staging/gpib/common/gpib_os.c
index 71c379c22be0..446827701399 100644
--- a/drivers/staging/gpib/common/gpib_os.c
+++ b/drivers/staging/gpib/common/gpib_os.c
@@ -1532,11 +1532,11 @@ static int request_service_ioctl(struct gpib_board *board, unsigned long arg)
 
 static int request_service2_ioctl(struct gpib_board *board, unsigned long arg)
 {
-	request_service2_t request_service2_cmd;
+	struct gpib_request_service2 request_service2_cmd;
 	int retval;
 
 	retval = copy_from_user(&request_service2_cmd, (void __user *)arg,
-				sizeof(request_service2_t));
+				sizeof(struct gpib_request_service2));
 	if (retval)
 		return -EFAULT;
 
diff --git a/drivers/staging/gpib/uapi/gpib_ioctl.h b/drivers/staging/gpib/uapi/gpib_ioctl.h
index 473b09d4efaa..eea169a0ba40 100644
--- a/drivers/staging/gpib/uapi/gpib_ioctl.h
+++ b/drivers/staging/gpib/uapi/gpib_ioctl.h
@@ -114,10 +114,10 @@ typedef short autospoll_ioctl_t;
 typedef short local_ppoll_mode_ioctl_t;
 
 // update status byte and request service
-typedef struct {
+struct gpib_request_service2 {
 	uint8_t status_byte;
 	int new_reason_for_service;
-} request_service2_t;
+};
 
 /* Standard functions. */
 enum gpib_ioctl {
@@ -163,7 +163,7 @@ enum gpib_ioctl {
 	IBPP2_GET = _IOR(GPIB_CODE, 41, local_ppoll_mode_ioctl_t),
 	IBSELECT_DEVICE_PATH = _IOW(GPIB_CODE, 43, struct gpib_select_device_path_ioctl),
 	// 44 was IBSELECT_SERIAL_NUMBER
-	IBRSV2 = _IOW(GPIB_CODE, 45, request_service2_t)
+	IBRSV2 = _IOW(GPIB_CODE, 45, struct gpib_request_service2)
 };
 
 #endif	/* _GPIB_IOCTL_H */
-- 
2.43.0

