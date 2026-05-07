Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D9C221FBB
	for <linux-staging@lists.linux.dev>; Thu,  7 May 2026 05:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778130018; cv=none; b=tG5jx7919VoxZw7cdsVgiZggBtguEq3z7PVu19Zv+7TUfcULOfdgkJbF5gjlPHh40ump6WYhzRXkvwjuFzf/XxQIVgSFbs6xWLbgqGSWgpaR6TXeAqI+QyAk70c+DSMdVh2CZ9yxqQ/CeooKA0N4XRdOjM9CIxtJ5GsmUHZ01YU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778130018; c=relaxed/simple;
	bh=XsoQHXkU9NDSWMp2bqq4OAR+OCbCMqv4GFmaCLU64v4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kNGgcBB4OSyD+oXjUm4tVdxm70USToUltbAz0JoF9UfrYZdqgUcgtMMeMlS+MQiBI9YptxyfSYjJYArJ4V/MPIw0PjD+rHqe3k/71LDJCzXuWG1kefyVH/BsB1pvaoKFGo+Il9kcfMMWr9mcOjI/CpVkTsPjgJPkLIrUjTYoRG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I1fKOKhP; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I1fKOKhP"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-12c8ccc7755so800344c88.0
        for <linux-staging@lists.linux.dev>; Wed, 06 May 2026 22:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778130016; x=1778734816; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MA7mseLF1Qx9JUz190OvSLyV9rAZ2YKMjm6tU4A9bjc=;
        b=I1fKOKhPjTQgYva5YW9/NClrBzLuaZsVpxkqiU8AoXdLjCuGYHAXKE0eX4TmHwIkMn
         O5DLB97fG2tQlGTW8nYI+9tkn0S7zegOkqEoOdnw2cOmGf3p3dwL2FneEAVo1ejWtGuk
         qbEKqnYlharN03w1F5qijDcmOLH9v+XxMLbG7mE/rbEkfD7DyBenrKm/KBUOrhw5UhXv
         CKggz4CkfMXVUObeCopn8ifQW+oxpxh+R8Ubi+IYtELby+YcrskKgiQ5VcGKxVCJsOQU
         eZWKTIp+ORynVVVIB7BfUcD70fe332OtadAUHWENKdxhhp8h3mqXZUFpD3G0mbw2QF3R
         jUeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778130016; x=1778734816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MA7mseLF1Qx9JUz190OvSLyV9rAZ2YKMjm6tU4A9bjc=;
        b=jZG2UF7qvkQPnfega8fW3qkS1HvcBsqatAM3GPb2B3F3kfrVYa9j6l1vjSn8lo+kxm
         3ebRcNRZIIzZvR2OZsNIJ457lilMdiOdMHWB7JqzSqCZ8+7KEpxkSndzGlyGzW2Pc2H7
         eelQ33NGB9OttUE5hC+Vg+62Q7I48S33+2mi3POOD6FJkhCsb/XRAW64ujqZrqC7U9Em
         u5MSDRkUeGfp2e2aMWsFUr58Y8zFOpIw7fHcfnOhQ+2ba11wlhL3ZnmdHM8QcoxXzU7U
         yzGypHmmaHXDhymCU+iu9zLR7EQAxoq/KB1BUzAR8uoJ54u5MpNfASd4QmJLw1kTWTfO
         uWIg==
X-Gm-Message-State: AOJu0YwtNoiumYzccoPN5wp3a9P6UrfxPTq52P7NcIMid4F7cWSleLAJ
	8WaTEj/SnGoShWYK0nqyOewf4xLNgwL2j8MfPhw6DFGcij3Ci6vS0BjoTYjJyw==
X-Gm-Gg: AeBDietoCQlgjr4CTxl3P/voFYdXYKhs6yoKmwIaoMGH1S9K9NH9jwuJ1YCVBIIieYH
	J2tfn0zkQm0F5IbXn1I+c+ev4l8k9wJ/O7272Ja9jxgZInknZDlGjqKXQJJqDl2VgVqfrAurqx3
	6dXKMuWLk0dPdtsDRzR219n0R1T1howtSRwWjGlTyX74bQwHiOP7v5YkHU3L1wp/ELFUEK8LbxW
	x4qDhvW4iFpISb1EOWT5WXEkg2QMHMovNwRr6IwZPpPa9HPowOWYQP+rTNDi2RuUK/E0jHoD6F9
	YVN5fBJ1DL6gDJWD9tch8Xv0b4Cj1BJe80DBlD0LyRB99J0ztQEopnT5Ba7qTHCvMJCn9mSLrWy
	Ef3xdnV9udDP5KpSEzhJpvMZ4Az6rOl+8qPjbc0DMwiyc14ES/xhAp8pK5GoB+PbZgukT8xUgBs
	M2TSrIAy+SakjXfqSe9JpHwBQtqV06RcPNfo7mItFCnlg0+qL8TVlfvg==
X-Received: by 2002:a05:7022:fa07:b0:130:9bce:ba26 with SMTP id a92af1059eb24-1318ea2324amr2892928c88.35.1778130016194;
        Wed, 06 May 2026 22:00:16 -0700 (PDT)
Received: from TestUbuntu22.. ([73.15.108.84])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-13202fbf850sm7928087c88.14.2026.05.06.22.00.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 22:00:15 -0700 (PDT)
From: Jennifer Guo <guojy.bj@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	Jennifer Guo <guojy.bj@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove commented out enum values from odm_types.h
Date: Wed,  6 May 2026 22:00:11 -0700
Message-Id: <20260507050011.17066-1-guojy.bj@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Found these commented out enum values, while checking for block comment
issues with checkpatch.pl. These seem to be ok to remove for cleanup.

I verified via:
git grep 'RT_STATUS_' drivers/staging/rtl8723bs/
to check there are no other occurrences.

Signed-off-by: Jennifer Guo <guojy.bj@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm_types.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm_types.h b/drivers/staging/rtl8723bs/hal/odm_types.h
index 0da662e1493a..bc0c4d027492 100644
--- a/drivers/staging/rtl8723bs/hal/odm_types.h
+++ b/drivers/staging/rtl8723bs/hal/odm_types.h
@@ -18,12 +18,6 @@
 enum hal_status {
 	HAL_STATUS_SUCCESS,
 	HAL_STATUS_FAILURE,
-	/*RT_STATUS_PENDING,
-	RT_STATUS_RESOURCE,
-	RT_STATUS_INVALID_CONTEXT,
-	RT_STATUS_INVALID_PARAMETER,
-	RT_STATUS_NOT_SUPPORT,
-	RT_STATUS_OS_API_FAILED,*/
 };
 
 
-- 
2.34.1

