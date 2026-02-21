Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3121DB34C
	for <linux-staging@lists.linux.dev>; Sat, 21 Feb 2026 13:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771681240; cv=none; b=O5tbjkAUzKh9MoOrQLi1icPMYfjPpKbmPT0Etzv5mj8MgFDVbzK5X7Gs/IR+8thryUe1v+OyJyWQxuT/zByitPxZBMwpBrF/eitDSlQQ6r4S1NvzYPcVzlILgaW44TE6xaaR1+boMxETy+uaajSeStuJDlFMXsgppOGjQFx/eWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771681240; c=relaxed/simple;
	bh=j1k20YRaUJMKY2vKuch3Knk1WgubbFC0HYKdZ/jJBpw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OEI9YWQEHZKPigBt8ySJVdPwAOV0GLC8eKQSMLw6POB4/TO2vH1d0remoy3ih1siDDPCwa+hxvfK7C/C2lPYAwicny2QluI/C40ho3jfAazzo9eewjADz4vTKqHL8BUBtyEquqK/9dBEIkBOVqd5Bgxo8VqIV9SqcepF6CDqHCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eElSCQ71; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eElSCQ71"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48378e60742so3306805e9.1
        for <linux-staging@lists.linux.dev>; Sat, 21 Feb 2026 05:40:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771681238; x=1772286038; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1vC9hFpndJcjfgRx+/IpQQEsfPzvOZ7wfch1dFIqqRU=;
        b=eElSCQ71UBSgMZo1YssO3rV28ou+VTcxvt+IrkzB+87z7DbL2pG/GqQj/eHPFM5hAV
         9RAaSWGOiRy5bZxCRKnAYng/o7X5Gp2cSGz1FcoHMFLtS5VG19lsNpgBywEV+RNSgBod
         kmyslabIIvQZPYfdsr6EYfjA1VFVSNArh171IglspD+YFb/0uGDeikVOMSwBijrJRlvb
         QE/hOXevRQZgh2D8h1oMVEExzCHVh72E/gQG8b2RBHj70vzv8oozentMm5v1w80Rgcge
         Muky6OgriKk3eoY1yS/6zedTQsTW77blQc3ne/lVXJrZglCOwM+ct/+dn+UsbB2r1Z8C
         hunQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771681238; x=1772286038;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1vC9hFpndJcjfgRx+/IpQQEsfPzvOZ7wfch1dFIqqRU=;
        b=DTe8urT8gxPtjoDfGkQoJFr2V+ty6Dfb3OE/vfgFr0eNpJaTXcreDjbzLaVMgjRDWu
         JZ1Op1NHHMXbs9Y0nu+N4Xj7kooiaVmRzdWPcjSMyPXq1iMRFdChdWGIybwY+sKrsI5y
         iuLkU/KiQyC6EnHqs/AAHUO+YT2gPjo2DNNdOLNu79Om5g4LT+knis41FeE3jcvmC5kz
         dsXUrMvPSnYTwbRQSgeOxqmQAwBUEA+3wz0bKCqYzwpqBIeego6HeczgDDDLse3WOokM
         r9emAnImPFJ6UBBjw/kQtzQLAkFq41YneoTRAyiRh+2qSBn6bi/JjWeYnDNxUF/u9Fjl
         8UDQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5yBhIk4qErMRlR0DpTOOoL1PEtvnAFKWVTgYKRqBeWdm6XhwlOS2SfJ05DRBSsZ9qKo3zRVy/zmX2t5mu@lists.linux.dev
X-Gm-Message-State: AOJu0YyCmdelC91PrQVzCBXWozd3Y3uc9fVS35mM9EgZ5aZhS5l8lcic
	QiCgKeQCucqzoZu5RE0a8X1KhgSdmyPLUUJoPAtpJq+K2pzr4/1KJdP3vgwu+15366w=
X-Gm-Gg: AZuq6aIpqDiPOJ1nEi8Y7ug86sZz6yGsY9a2tuehqIl7hUHwyqSqOhF4yfm0qjTD4Eq
	dXr2f+juXhJoYQJA7bZmqyYpIynlmDQUyhkGsUxmxeLNXer1gy9KaF0MOfWEGmTZbwiRlJPEN7c
	Yvq6DyTfERP4H+D6cZaXIprDX8eYOeQiiUOReEmBfoLhYdjJgZ82LV6cIqnTv0G0bSQA//odn0V
	NXG3fv1n62myicA18AVlt80n1mjTzFJiywY6B3Vh3q7GtkZEuk6NJCymUp3Ut7GGJP8IjfKO4Va
	ERUi0vrk4FnNx7VE6Ls4W9NukiLBLCfra+QGdr/o5sl84wqQ529yFRuE8qUEVlisyBJvhinWY2t
	V4wl19GlpD26tXE+urruhamp8cvSqXN7yT9qmbGo2YJCVDxrbx3EaPyYRTrQ7RO7MAyHDHQaCC+
	2zZ3jq40Hevt6M3RwzOg3JCMhBDaB9pOJ76eHeiPfef3+CvIzdT6WBTPcY2kNdlFako37LTKFv4
	tLm4pDY4LZ9z9gZ6X8CwysH3uf/WMwNxe5XYyq3Bo3cHq+CvNjm
X-Received: by 2002:a05:600c:34cb:b0:477:a16e:fec5 with SMTP id 5b1f17b1804b1-483a9555ad9mr30391035e9.0.1771681237820;
        Sat, 21 Feb 2026 05:40:37 -0800 (PST)
Received: from fedora ([149.3.87.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d40004sm5283993f8f.21.2026.02.21.05.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Feb 2026 05:40:37 -0800 (PST)
From: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: Use kmemdup in sdio_ops.c
Date: Sat, 21 Feb 2026 17:39:34 +0400
Message-ID: <20260221133933.336909-2-giorgitchankvetadze1997@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace kmalloc() + memcpy() with kmemdup() to simplify the code.
No functional change.

Signed-off-by: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
---
Changes in v2: Remove leftover blank line (suggested by Dan Carpenter)

 drivers/staging/rtl8723bs/hal/sdio_ops.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/sdio_ops.c b/drivers/staging/rtl8723bs/hal/sdio_ops.c
index c9cb20c61a2b..514c857a998e 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_ops.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_ops.c
@@ -583,12 +583,10 @@ s32 sdio_local_write(
 	)
 		return sd_cmd52_write(intfhdl, addr, cnt, buf);
 
-	tmpbuf = kmalloc(cnt, GFP_ATOMIC);
+	tmpbuf = kmemdup(buf, cnt, GFP_ATOMIC);
 	if (!tmpbuf)
 		return -ENOMEM;
 
-	memcpy(tmpbuf, buf, cnt);
-
 	err = sd_write(intfhdl, addr, cnt, tmpbuf);
 
 	kfree(tmpbuf);
-- 
2.52.0

