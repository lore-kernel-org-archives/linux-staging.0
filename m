Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A190377004
	for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 07:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776150962; cv=none; b=H2JSqLvui+po8KHZBjUS2uDmJnY6two3YVWUtok8cZ8R/OgX6iyxc9K3NjOZlfCgrRpH4aKl9t2bxFaqsMRRzJKCiNamnNbvOF6omNiZuwewQfXM+jNAH9mrbMPdRP22No7o4e/xsZvWy9tjht5O/vsHPKwfZtBHnx3lg3iaZ9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776150962; c=relaxed/simple;
	bh=qFwsjCRrtTYd0GU5DWUfNnt76kyBmYFPLCN06AmYJ88=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RentEQomoWT0AmOkIsn1biM/I/PsynKmtuOwovZKu9p5IO6++W9kRIhEclP4Magczvypdy/KY+qQPFygiaDxwc9bWoDiVYminhqgIKVF+zfxZxA/mEhFEx0wf+sVgHjkYYDK3LDPq/k21Qq2woyk4KS26txrzniK0J3y6taeq/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hkcafzt5; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hkcafzt5"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-82f344e880bso1385918b3a.3
        for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 00:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776150961; x=1776755761; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SvRM8PLxKjdW4f9eCSeiOBrLICFjHgClb1f/sadWYR0=;
        b=Hkcafzt5F0+7AXEwqPbkYpMpgTw7N3zCR8c8WRTo3pXUg8b+3cJwNRoZ3lQifSNsGV
         0PmOIMXZeRG/Cu/vQP5t+HhQGUbwIsuu5PpQgmhFPNBH72yko87knTbm3KP65oifsbDX
         SLXYr+BEYkjQuSLfYGZtlyvCC2y7G9Ch+pjwJmgjNSvTbY85rx1TI796EtOMqelJ46pn
         MpYHvp1wMeQ4aGweJaWPOiio94pBcQBBPNdwTc7ioHY0zKiXoUXp184pdyyKDzLcvuP+
         kIU202F9ttlZw5dxdxzkpj1IsMNxrOj+kPKaxN2vxvuuFlUDaRlEiX7WCe/doLxhTNlS
         Y3dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776150961; x=1776755761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SvRM8PLxKjdW4f9eCSeiOBrLICFjHgClb1f/sadWYR0=;
        b=OiEw7+2IvQ5WUyUoCk/Ut/aeldsgAPPJ6S+N2aTL7gV3Mq94X3wYUrwVKKeXqKSlLc
         W0c5TJugnxb2UT6jI6i47RXkaErOcBrRglpLK2FMdo2quOSdMnQbY+eM2pq73eHQFzNL
         8eF5wsDlBJrEeJl1y1vp6wry7qFUaK7mhrxhYR8KHi0BEfK8c3mRNMOdQfjz9c8A5PBZ
         rVfSVc6S17qd46VWdSK48zBO8yFTvwR4n5D+8jwk301Bli8c41yBQH1qSeu+rdluVvG9
         AtgSs7pC2au6LEpdZTm4ZT2xlQNFkF/+b1C5H+APxxNsYC/xHKnEJM386XHd31qjxB9q
         Yt/w==
X-Forwarded-Encrypted: i=1; AFNElJ8J0G1YeSYA2kf6fU8611A+TjLNy51kmwzDkYakZGuaQ7GpoEq82WtVydvt13mLeNLhC/O2HZTnZgc66yKJ@lists.linux.dev
X-Gm-Message-State: AOJu0YwaNOXwqJZhJPHvFfWABAI+n2YhGCaPSQySG1um06NIUa+OzshI
	Hyms6RzMQPMY1AiEg8vaeVQXFE+chsNaqIYQWieqzflVw7HBFcV/KOy8
X-Gm-Gg: AeBDievQ7/IE1Z7EjywPUKNhbtPqrXW/pkvS+EtvQim8GsaInsWnVIlL1+OKiD9uWr3
	EIOXQ3GvwTUh67xQiA8+kYJKoz+lM8R2a/DSXgtCsUtufmSv2IcRp0Pd05JlYqhsA+bW3jJjxsx
	HU/L5Qx7hekFL5jSJUEuJ74QuamRsDpPiZXjtjI3uJXCH7TB35+wOv53H6zPlFlNuD4D0isHJhI
	gx0sAnW1epKofSXtumRhmC5m0WVEoH4vaadm147A/o6WdF1zRe0kDralEj2OJWj/MJpQpV30yrC
	jkeQvCyxDOPAYl65Jw3VtCdXfXCbE1Z6xoWB3OI7vfgyS48BTBt82MSTWh6xYVKLSJSmQdVo7V7
	d/BLwi9PHAJZMO8DTHI452RpuW332GD6AEXftDwtMYLIAiCrTu/CawL+WL8Z2ZOlXkg8otlkzRa
	ykExut/v08fDQTREd0777SHiztQUmzhz1Fyjdigb0cS/rCecManD1kbqVvhBQ+hVOxYYJZK7Q0T
	lFFZDPZYjMgpjFK7WIM67E=
X-Received: by 2002:a05:6a00:2d89:b0:82c:20ba:1570 with SMTP id d2e1a72fcca58-82f0c2a00abmr16683140b3a.29.1776150960723;
        Tue, 14 Apr 2026 00:16:00 -0700 (PDT)
Received: from shyam-VMware-Virtual-Platform.localdomain ([223.181.118.203])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c50cd34sm14062030b3a.54.2026.04.14.00.15.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 00:16:00 -0700 (PDT)
From: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
To: gregkh@linuxfoundation.org,
	ethantidmore06@gmail.com,
	error27@gmail.com
Cc: nayana.mariyappa@gmail.com,
	s9430939@naver.com,
	andriy.shevchenko@intel.com,
	kees@kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
Subject: [PATCH v3] staging: rtl8723bs: os_dep: avoid NULL pointer dereference in rtw_cbuf_alloc
Date: Tue, 14 Apr 2026 12:43:06 +0530
Message-ID: <20260414071308.4781-2-shyamsunderreddypadira@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260413224417.5674-2-shyamsunderreddypadira@gmail.com>
References: <20260413224417.5674-2-shyamsunderreddypadira@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The return value of kzalloc_flex() is used without
ensuring that the allocation succeeded, and the
pointer is dereferenced unconditionally.

Guard the access to the allocated structure to
avoid a potential NULL pointer dereference if the
allocation fails.

Fixes: 980cd426a257 ("staging: rtl8723bs: replace rtw_zmalloc() with kzalloc()")
Signed-off-by: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
---
changes in v3:
-Shortened commit hash in Fixes tag to 12 characters
-Removed blank line between Signed-off-by and Fixes tag

changes in v2:
-Fixed spelling mistakes(dereference, potential)
-Added Fixes tag
---
 drivers/staging/rtl8723bs/os_dep/osdep_service.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/osdep_service.c b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
index 7959daeabc6f..4cfdf7c62344 100644
--- a/drivers/staging/rtl8723bs/os_dep/osdep_service.c
+++ b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
@@ -194,7 +194,8 @@ struct rtw_cbuf *rtw_cbuf_alloc(u32 size)
 	struct rtw_cbuf *cbuf;
 
 	cbuf = kzalloc_flex(*cbuf, bufs, size);
-	cbuf->size = size;
+	if (cbuf)
+		cbuf->size = size;
 
 	return cbuf;
 }
-- 
2.43.0

