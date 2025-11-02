Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE63934D396
	for <linux-staging@lists.linux.dev>; Sun,  2 Nov 2025 23:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762124510; cv=none; b=IXt1dYGSr4BprXQvmsauqNRCX5QHmaUfnWqrKKCKIU2fkLj2oQD7PRbl05vldQxpKOLG+gwSKRdwEjIbdDiu1Wbmu7Y17o3DeOG14tqihY8bC0yfao75joPCrb4dmOjIShmlPWt446Y2s1yIUoIyWGOQfjw+/tAP8Y7IIVsaujk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762124510; c=relaxed/simple;
	bh=TLZKZNnITQFcd97o8fyws0ES3nNzbLGkdPJtuqGz5sQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aB8Yl+NVrtJp3MWfWsxcbUXl4e447GlcMOTihTSSMy8v6pEFWPG0mVg0crrHA3bKwu2rgddgKxaYGO1rcrb8AttjRx5iBhOnbyNrEJ1dGKthtRxTICQ3Jp6ncBcV/a4KVZpOteGJEtFEwnKzX+xEnMOaBfdCoo8sZBSIi7Djcnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gmZosV/I; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gmZosV/I"
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-3d3e9a34eeaso1474357fac.3
        for <linux-staging@lists.linux.dev>; Sun, 02 Nov 2025 15:01:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762124508; x=1762729308; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=suckYxpxhS8tpm2524qw9Mw5oQrBRRr9u/yRv9LVIaI=;
        b=gmZosV/I0whceoCcf5+NaTL8cs2YT+JWo3cvAje1hbgdnH8ft/SMQxH1dNfCSAdoMj
         wsPZTAH4m8cYVHyBCdzBIx/0MNAfouWntAlejr+y8jxZinrvDj7Vm2vb6HmmZghTVBBU
         tJQtdTH4nOBIkpOr4SHkgFujSoir/2cWtb09CE/EBFpzUzdc77zrD0/lujb+KZ8uIwl0
         boUbx2IjcaUXn0jgFPX1EzRr2CWBOkmg4KCM7LI30dDpbjTq6WxaaoMg90SVwUF2Qhk/
         rFJH/NKe5rwabJ9W8cgLx2iPLDVUsLZrt1iG3lIZLIcbwqZnFaReYa4qqJRn/hyNRRVK
         D2hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762124508; x=1762729308;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=suckYxpxhS8tpm2524qw9Mw5oQrBRRr9u/yRv9LVIaI=;
        b=c2aS7lSYwdXOKxtlOOcrsRJihYwvdhs4UH5en4PAJGEBess9n9wxGIUfQO1MSEQyPT
         BaWBBezHmcw/YWTL7KXN55GUIs8P4NygdbYCifiRaW6RTKkkvHPHI2NvhYzw0N0hUej6
         7XL073MqOePTt7ky3sKgUgeV137oI6K5MgZZU0T73j2iR1NHrwSoP10wVNRzXiGVM6M1
         fml2N7dNH4mqQFCYoUSL6EqpSHrPukIdbK/eRI2UWz9LDObgmY/xcQoXQwn9u0dlCIV/
         igQYzeVhNKs/UeRYkp8JZ7RtrjIvRTY7eKprIYi949Qqyi6WRgzk3bhzbUOuqRHWY0SN
         bQhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcKPR+Q7q0i7KT27Yu21lBL+Q3+YevyEb0px5Kcp1tDkheHcZu9Qj1aH8+9GTJkFmoZ/PXhty4SFACFggo@lists.linux.dev
X-Gm-Message-State: AOJu0YxaziE45992cwBazKQhRQS4lJMAv4Ec0T2J7fnaRC/Gby0qFJEv
	0buG0GcnUGprLNMp6v9AiHlOJHOqfoZfxx3RL4J8Ls5ubCB47HdmTU+/
X-Gm-Gg: ASbGncuDps8JoZmbaGrX4N5zHNozo5IeIJB6tKxJ9NN0wToJsueeCg/sNtfPoe5HwiX
	y42ZlGbVmcbTsuxy2CTY6gSFMJg7DgZTbZFIGLyMeYCWT+b+rTrml8zoWdfIL4v4g/d6SNv0maO
	qA+7Yi6228rfRmw9YVVYcukP0VViRBca1KLF6r+EpLdrLnTHDUoa5WVk0oxCnkZvpl3jo22rkR1
	zL6ZZ21Q74rkPId1s3bGHY+zvgpi1sgfo0JzHKhr6Q/884BkUaZD54QvuIoBglWCI18bCxtO/ZN
	k2XUlBa1O1gG7HWZaYSmWZ46eNfANXYFp+KMQ85zdBaSjWoaT9M6F+pim6zqDTwsjLgnIhXQeVU
	3Z9T6eTgaX098V2o60RG1D/jfKupoE9/+XTLEEGTXIeWbqBp0rd7ExQv3bXp19chcpHVQiUqi+z
	+F/vzILrmQNfyHFQpl0NeYif/Vu/Ihr9w=
X-Google-Smtp-Source: AGHT+IHwr7jt3DaVtnfLsqGmmW7FFdKpHCSeTikP3CPRe2wVho/p0Ad6nhxEqMqv/Lasjs4QOtMNdQ==
X-Received: by 2002:a05:6808:3c4c:b0:441:8f74:f2f with SMTP id 5614622812f47-44f96029336mr4760053b6e.57.1762124507728;
        Sun, 02 Nov 2025 15:01:47 -0800 (PST)
Received: from localhost.localdomain ([104.247.98.2])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3dd9a924727sm1210628fac.15.2025.11.02.15.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Nov 2025 15:01:47 -0800 (PST)
From: Cristian Del Gobbo <cristiandelgobbo87@gmail.com>
To: sudip.mukherjee@gmail.com
Cc: teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Cristian Del Gobbo <cristiandelgobbo87@gmail.com>
Subject: [PATCH 1/2] staging: sm750fb: align sm750_hw_cursor_set_size() arguments
Date: Mon,  3 Nov 2025 00:01:38 +0100
Message-Id: <20251102230139.1720-1-cristiandelgobbo87@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Align the continued arguments with the opening parenthesis to satisfy
CodingStyle and checkpatch.

No functional change intended.

Signed-off-by: Cristian Del Gobbo <cristiandelgobbo87@gmail.com>
---
 drivers/staging/sm750fb/sm750.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 3659af7e519d..9740f2705679 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -121,8 +121,8 @@ static int lynxfb_ops_cursor(struct fb_info *info, struct fb_cursor *fbcursor)
 	sm750_hw_cursor_disable(cursor);
 	if (fbcursor->set & FB_CUR_SETSIZE)
 		sm750_hw_cursor_set_size(cursor,
-					fbcursor->image.width,
-					fbcursor->image.height);
+					 fbcursor->image.width,
+					 fbcursor->image.height);
 
 	if (fbcursor->set & FB_CUR_SETPOS)
 		sm750_hw_cursor_set_pos(cursor,
-- 
2.34.1

