Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA771D79B4
	for <linux-staging@lists.linux.dev>; Tue, 29 Oct 2024 06:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730183954; cv=none; b=R8auq5kXF3axQjCUgMBSq29TMggj6ifkog9fEI5C8DQPIryIsPpOPW/ucS95nhkzNZwOVYol5uAYMkavzwz8zvcXLr9iSHTSSUaYSpFQ0kTOtBY2FMlsY4fF0USU8vDbr5MfNHtgArsb9q4YK6E/Qxz4RUcx3LU1NPmYXDtx4RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730183954; c=relaxed/simple;
	bh=e9APVLVM0O9XL0qjKgr8gnAp9m7xUzTv4X256LpfKtE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FwIruYx0+yGFQaLARlLYAMYzLyYWM2alUtEAjvEydDWGJJ1N+XN/8QXXY6CJMdYknwHY8Uqv8u9KzjrkazqHBKflmUYAjiyK8tVwNsMIBiKG3LraTCfZossVK4O+/KJjzqAZBn+ziplqvK/nM2nyCxDH55Caj+rf6CinWIXAzC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l7nOzaMk; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l7nOzaMk"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-20cdb889222so47987065ad.3
        for <linux-staging@lists.linux.dev>; Mon, 28 Oct 2024 23:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730183952; x=1730788752; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NoTHtDAF6ws44F47OVjGKPN9wXynxJNwGjXwFS8SeTg=;
        b=l7nOzaMk4Gz9tvC/8fK1j+WeutY3GQsKkdl7IT1cdy/ad0R+J7gnQQrjhCB+p+YSgn
         xjbx4OX7drBYNaqHQSkgxfclBtM+6zNHKk0I+8rJRDkOgpE5QPn2RHFile16/buZoV2s
         m5FrsnzZrlOjgPHx2q9VP5yU0JItZI9Rp8tBGM7e5WCEuRERXEC2v8YsIRhwpSmTXf20
         25TfWSUmje5+i7V+Fv65gP9HR1ftAEl7Jmi4KqBys14Dj93z596k7hHClU3pgH4ThvGI
         mp9ECN3octEd9yAwuYVMBiiJAHRryXsPypq0+iWVHocRnNhJ5AZn5F6ASeIobhczc90P
         esiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730183952; x=1730788752;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NoTHtDAF6ws44F47OVjGKPN9wXynxJNwGjXwFS8SeTg=;
        b=MZl4VCN/4qFlPq3V9KKjxCwhdch5IoFSUQP/bkAEWqzqiyg7t5RMstnasRp46wR9an
         SCTTwEntMtRtqix/narHIMdc9sF5WuJUhvKWJUW14uPfPOlKkNGTNQd3hOi0umAgIsmA
         mCC0Lg5CKb4IlA5qdUROiKHYnYxAAcapbN0bsOHXWqCZdpYFV1dCIO0P1jX/Ow1eTue4
         pz3w0hnWQetTYd8MqQevo7NvQtxGSAClBwKAnVqfBrZAf9MBV2ZvX+TpBcV3XbUOuhP1
         xRh/RgSUZ0Ph4RpoSMJO/AZqEocAMxuxev3rB83FBkzV54mYRPM63FGlqohCTKupIOI9
         FtZg==
X-Forwarded-Encrypted: i=1; AJvYcCU1v0pjbnppPN38v3UBlKBDlyFk8U3k+lsPWul9KyzQ+PPCwA75jWmWuvyTreXhF8lLIWeFrfc4z6aOOyLx@lists.linux.dev
X-Gm-Message-State: AOJu0YwTNRGrywOQUS45/Y8/RFmR+6yrtU3me80Ub8+R3TVPNmtKF9V0
	dGC2I2FkJqP1rvjUDa4UCVQEiaHVlFpBmCFgMoqhWXadOqYG0iBI
X-Google-Smtp-Source: AGHT+IGgiP7oIWXuGp9Me5fkVVdBioimX2YIYTbB7y0RxwXTtVz3gXwarihKlTlWpugpq7ix+Xj/5g==
X-Received: by 2002:a17:902:d48b:b0:20c:bff7:2e5f with SMTP id d9443c01a7336-210c6893180mr145648635ad.13.1730183951697;
        Mon, 28 Oct 2024 23:39:11 -0700 (PDT)
Received: from dev.. ([129.41.59.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bc02f16csm60340365ad.209.2024.10.28.23.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 23:39:11 -0700 (PDT)
From: Rohit Chavan <roheetchavan@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Rohit Chavan <roheetchavan@gmail.com>
Subject: [PATCH] staging: vchiq_core: Remove unnecessary blank lines
Date: Tue, 29 Oct 2024 12:09:01 +0530
Message-Id: <20241029063901.1857067-1-roheetchavan@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit cleans up the formatting in by removing extraneous
blank lines, improving code readability without changing functionality.

Signed-off-by: Rohit Chavan <roheetchavan@gmail.com>
---
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 9e56e34ca4d9..da18c77f3cab 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -3486,7 +3486,6 @@ vchiq_bulk_xfer_blocking(struct vchiq_instance *instance, unsigned int handle,
 	if (vchiq_check_service(service))
 		goto error_exit;
 
-
 	status = vchiq_bulk_xfer_queue_msg_killable(service, bulk_params);
 
 error_exit:
@@ -3624,7 +3623,6 @@ vchiq_queue_message(struct vchiq_instance *instance, unsigned int handle,
 int vchiq_queue_kernel_message(struct vchiq_instance *instance, unsigned int handle, void *data,
 			       unsigned int size)
 {
-
 	return vchiq_queue_message(instance, handle, memcpy_copy_callback,
 				   data, size);
 }
-- 
2.34.1

