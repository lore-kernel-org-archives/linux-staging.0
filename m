Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA691514F8
	for <linux-staging@lists.linux.dev>; Sat,  6 Dec 2025 06:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765003010; cv=none; b=JSL+/PUzN1d5EYbbIeaDZacsC9JY18nqOf2lMagXVPEbfvjH83S7y6WGhBmAs7HSqUYGkbG0FfOfKeDSnNbtNtIoIEXtXeyxVDZLqOTv7uAgGIoejw4L0ice1GVFEdmW38kI10bi0WKd7CNZjAKYc+BuDUStywDhN8GfC+V0190=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765003010; c=relaxed/simple;
	bh=PDkAkYytGt4UIxlzB2P4gA/k9isEAnvLJciKAPd3uuM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JwkkRI6PnPX0pJ0l5nCHmjytIJ2ntS5kzSFuB95O4R+phTrZF0c18hBXwhbDGAsi6q8Yk9+KWJzYDemHTtALOU83FUEutIpIzGiqninhiFPsdqyvMjEv+VO4JWFYpeKUTEtP8JcXBCede1Je12QB/VabXLoUDGJdhGR5nUYi1EU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P2/yOF9m; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P2/yOF9m"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-297dc3e299bso25349465ad.1
        for <linux-staging@lists.linux.dev>; Fri, 05 Dec 2025 22:36:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765003008; x=1765607808; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qWDmKLtXLmkQKl381HmoL463EHjNp/FxihB5pKjVutk=;
        b=P2/yOF9m4AOdLpsOOamJmuPyAkN1qFlg6zF5XVof9epT+T4SxFZLMi6FG6PByXF9Xi
         cnpHOT/K528y/SXmiXeSR/pJWfPvW6CjlZtjxgE6hk+QXZdaS3D8FoDUbhaqChAXmbch
         CUuQycwpF3+ltxv1FvdB5SA9heZygTCWSoqk58DJpXT4mvW+ckRIchqa67tdPvvf4EMR
         slZkl/AJuyAd8mXGlN7j1OGTD8GU5yKVQtEzikKs5kqV+qOlsAUYbU4bmGjMN4VLjTnO
         sav5SS1wq+UvHYw1HWUDp7vcbgxizEU83TfdanpI4ykG+/A+fTujM1j9a3yNEWw4jxFv
         IFkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765003008; x=1765607808;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qWDmKLtXLmkQKl381HmoL463EHjNp/FxihB5pKjVutk=;
        b=LYGm/UnV+Jc32/1V21+iVjq3fShwXRnJjCCGuRTaKHXMIUTJHXRilUwmJMa0m9WU+a
         4wWV8kbmj8N620MFo7eUrtHnD0/6POGNBTC3gPls75IAHgZ3/B+pEqIFGA4dw91xpvet
         kbnKAT9q6MhvW83WfFZDxybKsCNexVTAA2yIxS4RGbNbrnH4mCfEPU3l5lmG7D0ZMYQ0
         vbSHZqHUtVsszGiUKqlF4mthc6WI5vUAij22NtDYbl3NkDXDK94br1UAE4FwUi2qOlxi
         XdGV0l54ebHfkKJgQAETjnqc5itXQv40pCt6gosGaTIi3oLktyLS0OIwi+xwyOriemyh
         qeow==
X-Gm-Message-State: AOJu0Yy7MjJrdeCv0u9sYCCJX1ybscl6aG2tXShmYNEFqGKKuFjeMhM1
	kRq8sJiXy6jftaq6joJa5ciXo8x1iWpD73lLlQtr4fmplDRb2UJ4ig1F
X-Gm-Gg: ASbGncv5fQ0O7nUIvQ5fo4KLI/T55/2hhxo0WcVLMsyZCzZTMFSnUNodjBnVuXDEvtm
	S/10sGRF+Odnq0HUMHMcekmoB0qSyrsP2Nm9iDXBTyjFnr4IfPSRgqeqK8h9S6LqnizJ5Eeo5Zl
	9ei9JL7w4LxnxhgW3UzMB5WNzIC1DyuQ86Z7y89smUb0UHg8/CT3SNh1qfq+8C2wMrtV9HJNGNn
	2gibB+Yfc875MoH71Df83Pw/56qtbdHcAIjOhCMU5HfjbuTtpS7gJ1XKaX7ud8FG0XdglJEgipb
	F2Jex63/rVaWq7FQ/htkxYJjmPe0QW2plPe0QoyXG70RW6tPq77AlC/qIl7v3m/0e45mcu9qOlr
	/zHOxEcF6XIzif9MndEtxPHNRFSppI8eUCegEAhP2IdlMWShOc+wceBHTdd0hC2Yyv8hacPCAGg
	bKGLRk6wc/sgtvLk/e7b5VQ8TyZ4mFaRoc9lpWCr2csg==
X-Google-Smtp-Source: AGHT+IHTyu6bg2uFV9jvWAfpssw0uruATG2Ku0t2azemW5p2/F1MOMpPbbUvwqMmjSLEmX9Cx48sng==
X-Received: by 2002:a17:903:40cb:b0:298:485d:5571 with SMTP id d9443c01a7336-29df631038cmr13003055ad.54.1765003008114;
        Fri, 05 Dec 2025 22:36:48 -0800 (PST)
Received: from localhost.localdomain ([103.98.63.195])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29dae99fa59sm66718525ad.58.2025.12.05.22.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 22:36:47 -0800 (PST)
From: Dharanitharan R <dharanitharan725@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dharanitharan R <dharanitharan725@gmail.com>
Subject: [PATCH v1] staging: vme_user: replace (1 << n) with BIT(n)
Date: Sat,  6 Dec 2025 06:36:19 +0000
Message-ID: <20251206063619.30372-1-dharanitharan725@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In drivers/staging/vme_user/vme.c, the functions vme_register_bridge()
and vme_unregister_bridge() use bit shifts like (1 << i) and
(1 << bridge->num) to manipulate vme_bus_numbers.

Replace these shifts with the BIT(n) macro for readability,
consistency, and kernel coding style.

Changes:
- vme_register_bridge(): (1 << i) → BIT(i)
- vme_unregister_bridge(): (1 << bridge->num) → BIT(bridge->num)

Signed-off-by: Dharanitharan R <dharanitharan725@gmail.com>
---
 drivers/staging/vme_user/vme.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/vme_user/vme.c b/drivers/staging/vme_user/vme.c
index 2095de72596a..f62a94ef35fc 100644
--- a/drivers/staging/vme_user/vme.c
+++ b/drivers/staging/vme_user/vme.c
@@ -1766,8 +1766,8 @@ int vme_register_bridge(struct vme_bridge *bridge)
 
 	mutex_lock(&vme_buses_lock);
 	for (i = 0; i < sizeof(vme_bus_numbers) * 8; i++) {
-		if ((vme_bus_numbers & (1 << i)) == 0) {
-			vme_bus_numbers |= (1 << i);
+		if ((vme_bus_numbers & BIT(i)) == 0) {
+			vme_bus_numbers |= BIT(i);
 			bridge->num = i;
 			INIT_LIST_HEAD(&bridge->devices);
 			list_add_tail(&bridge->bus_list, &vme_bus_list);
@@ -1787,7 +1787,7 @@ void vme_unregister_bridge(struct vme_bridge *bridge)
 	struct vme_dev *tmp;
 
 	mutex_lock(&vme_buses_lock);
-	vme_bus_numbers &= ~(1 << bridge->num);
+	vme_bus_numbers &= ~BIT(bridge->num);
 	list_for_each_entry_safe(vdev, tmp, &bridge->devices, bridge_list) {
 		list_del(&vdev->drv_list);
 		list_del(&vdev->bridge_list);
-- 
2.43.0

