Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F42C3446CC
	for <linux-staging@lists.linux.dev>; Sun,  5 Apr 2026 11:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775389481; cv=none; b=uio1WMoePxiC6qeEtBEcPjPfQ007AtCRtGvJwHHTBvI93QM20zQU6mhY5bT/xsffi8+wHGdmsqhLamMG8PZmYJaKdKudFjFUHr8MkE/CcHVgf5Bl1PlBzEVeGvqulDFcl7HQT9AVCWCIJa/ea0VrYb/NhNUR/nI92hDhdrQDqKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775389481; c=relaxed/simple;
	bh=QhFZfZE65gbnl9h8vQU90kaMUl0AlHiQu80nDsgeAKo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gKJmqACJtzonXnt/m7jPN4ecxbUkoIh8hiSevRZneYbdfuKLR80z+k3IOb5FNRIaOfeidvVqUCkAxquj4TDI7fdzZh2WrhsSQ4NppQ9F7hPRLUFPwOqv9xGQk3c5oRsuiXzpmTjmBdP8Z4ptzeqx7MyP1VAJ5jETCjmhpFTrbPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ciBnxgdO; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ciBnxgdO"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-82ce09b4197so1277514b3a.2
        for <linux-staging@lists.linux.dev>; Sun, 05 Apr 2026 04:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775389478; x=1775994278; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O20kcq5bcuV9eQLusJE7YAYwYicT0IX29PK1z9JHR94=;
        b=ciBnxgdOJgn2pB4JUn2GwctvyzzlVeiuw5h/6yrbljGlMrdnPfBz5SCB24Dpd+t4Ky
         gz5k2bZqzWIlm/X97rEQQ4TMRBDKNLqBqELDX0oWZDBSPdPnXloepupFMYrO5726AuP0
         wTZcSlP3SaYyMIGiJX2b1Bf0CrgEBpJaYUTfscDY+r2eZFtnT+h8X+SvDFCajCAp9nnk
         vDS47qTWPjxokhWdkbEIrhKN1YMZ+8K9VhLI97hyPn3pTu9Z9Ntu38/RwKNxhko8R5Fx
         JjkMQ1uQfVRaBtTnjwYSkVFrmB1QGbBlQvbB1ybyBKeMg8MyHWcdPgMF9n0ij98HACyJ
         Goyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775389478; x=1775994278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O20kcq5bcuV9eQLusJE7YAYwYicT0IX29PK1z9JHR94=;
        b=Twm++GjpK2TyVeuLVn9UzDiL8NeBRJE8NAJqZFPqCok20KjCXM6mx8klL8lyzMSmN5
         NiUUD2uPym6MheuhnuxD86DgsJ4+ZL/0GZOeaRXInj8oOieGDV+a1UL5WKu+PYrEBbjC
         PJRYPPvrss2I1GZfiWSJpyrs7sL9lFRLf5k3bx9tl5bLHYVn/Cg+Ym1CkzZer6GAHuun
         k6Y+RhrZzpF4aJAmpj0ZuE3t2sik3EGQYjZea0uLhnmomnfBjdK4G2cp+Hu3ER+t8Yg5
         K0TvzH7RpS57jn3gDSb779FEi688S+3R+QiUptFqGkXN3CQJuC4e/GlFGDCfbSnACtjM
         v6eQ==
X-Gm-Message-State: AOJu0YwrhZl+6tbKaC/YM1jwNWimXUXt9RgsgnRCxkqOuomk9jZAR4D3
	BTcN3ZxCWSzPeI/qsEaCDcS0mzkinxhNkD2yrixJdhvApwL88cm2Mgn1
X-Gm-Gg: AeBDietMPgSGqjxQOmyrW1KIV48Lj9q8Wf4KzdYzFKVbQLZ+dFpnZ6CGl4EGMb9WknT
	lrPoSpUat4OehOAch0fZVoM+/Lahrl1Sjx44Lwg9ZrQVbJktHRbv/Qz1x4NAKLo6S0vuhZXtx9G
	hDOu2bKhZBWVmjzxDVH8VXhFzS/9LUJeYUCpd6QM89CQtgHed9v6lhhaSdwYsba86aEzvpqtx8c
	FjE3ojgN/qS9lxXsKuW/tYoAoQiSFZaPuMWc8rjY22tU9xr1CUwPeq2RvKjh9I9K4aqbcitGhvq
	jl+VNKqtEf0HzU04IeH3OTEnlSgSqynprk9KP0BWhxtpB4bLetbDegnPs6HHICdjSLWu+OuuIlF
	hJoHTGaMHqtZshRb9sNiJLz1V3kvbKpz+Fl21gfkNfHx5BD6MhCe7rBZsV3KljKqwliKzwFXjT5
	9/VC2xpzj6Vhz+u//NUcRqMw1v7PKPYAAoWQ4+kWw=
X-Received: by 2002:a05:6a00:e05:b0:82a:8030:f574 with SMTP id d2e1a72fcca58-82d0db40023mr8714468b3a.33.1775389478590;
        Sun, 05 Apr 2026 04:44:38 -0700 (PDT)
Received: from localhost.localdomain ([111.125.237.11])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b3ccc8sm13938205b3a.19.2026.04.05.04.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 04:44:37 -0700 (PDT)
From: Prithvi Tambewagh <activprithvi@gmail.com>
To: gregkh@linuxfoundation.org,
	abrahamadekunle50@gmail.com,
	b9788213@gmail.com,
	straube.linux@gmail.com,
	ethantidmore06@gmail.com,
	andriy.shevchenko@linux.intel.com,
	dan.carpenter@linaro.org,
	weibu@redadmin.org,
	knavaneeth786@gmail.com,
	ignacio.pena87@gmail.com,
	dharanitharan725@gmail.com,
	samasth.norway.ananda@oracle.com,
	lukagejak5@gmail.com,
	karanja99erick@gmail.com,
	s9430939@naver.com,
	suunj1331@gmail.com,
	ysinghcin@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	Prithvi Tambewagh <activprithvi@gmail.com>
Subject: [RFT PATCH v3 4/5] staging: rtl8723bs: use read_poll_timeout_atomic in _is_fw_read_cmd_down
Date: Sun,  5 Apr 2026 17:11:31 +0530
Message-Id: <20260405114132.310774-5-activprithvi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260405114132.310774-1-activprithvi@gmail.com>
References: <20260405114132.310774-1-activprithvi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the existing rtw_read8() and do-while loop mechanism with
read_poll_timeout_atomic() from <linux/iopoll.h>, in _is_fw_read_cmd_down()
which is a standard Linux macro, ensuring polling REG_HMETFR efficiently.

Signed-off-by: Prithvi Tambewagh <activprithvi@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
index af6cdda8238d..17e135cd3e0e 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
@@ -8,6 +8,7 @@
 #include <drv_types.h>
 #include <rtl8723b_hal.h>
 #include <linux/etherdevice.h>
+#include <linux/iopoll.h>
 #include "hal_com_h2c.h"
 
 #define MAX_H2C_BOX_NUMS	4
@@ -18,20 +19,15 @@
 
 static u8 _is_fw_read_cmd_down(struct adapter *padapter, u8 msgbox_num)
 {
-	u8 read_down = false;
-	int retry_cnts = 100;
-
 	u8 valid;
+	int ret;
 
-	do {
-		valid = rtw_read8(padapter, REG_HMETFR) & BIT(msgbox_num);
-		if (0 == valid) {
-			read_down = true;
-		}
-	} while ((!read_down) && (retry_cnts--));
-
-	return read_down;
+	ret = read_poll_timeout_atomic(rtw_read8,
+				       valid, !(valid & BIT(msgbox_num)),
+				       0, 500, false,
+				       padapter, REG_HMETFR);
 
+	return !ret;
 }
 
 
-- 
2.34.1

