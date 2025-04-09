Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E6001DF979
	for <linux-staging@lists.linux.dev>; Wed,  9 Apr 2025 06:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744180753; cv=none; b=CgD+wqjLec74Lh1LpmzsGmyeQrmqpDqTuW152r3RAqpmrMms6kQkPj70usKf+Vju/ISGodbi/xXcTCyioTVxbnRPnFogWQ62Iup7+FWsnDKdOQwgz707e2qe4ru4HR28VSweUEhYcSZ5ympMiayt0qa7fbXS6DH56RHXsTK444w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744180753; c=relaxed/simple;
	bh=hzUv9CvRtYxTMecAdOzfBzp0m0bU7qGvZIGDWUdgWkE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cfMAs83pXsxoDayp4RkEc+KTCHF4b2wW9iXlLrQYaQXW1nDfFWN1qPL/DEERAmCfkZ7sgbAMBkxVSSOHgQ64GITZ6fa39wGI55F55IshTHJD6dLQ02bdyF+zXpvGsi8NlYyoSQ24jmJv8K9ByhmbqxvBMBLZxfrStwezs3DVsdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=P19nB9wy; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="P19nB9wy"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-223fb0f619dso64528955ad.1
        for <linux-staging@lists.linux.dev>; Tue, 08 Apr 2025 23:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744180751; x=1744785551; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=embjg21lH98kIjqnvxhQpytstvOIiTckggBWpHLncy8=;
        b=P19nB9wyE5UhkDHhwJJWfXaowpRv5BwSlUInWI8by1VG+XgNH/Cr+PonPC2Ymy7vDT
         9HFbyvwwNKU4Eav78Q9foQQ0vAZtZckc9ggJaGnwi6zz90TAmVvS7xlYe6zrzc+IiZRN
         7Hjy2kOqQObTz87usWCTfHLA052uXgGfQ/yAo0SjpvTzg+i/l5MHGgPgiTKz/eJtiatJ
         5PNeRAMVO28c48ZVkgxxhDQmRxERbxbVxLEU6zNEauO4zh3bbOdoXB5D5f8y+4jMRyc3
         lfSnzkrVKQqqo/sdeszVR69HC7IKvKWVFBNw8prx5RFI2vLh9X0eeI6cCfXN4ZClFC82
         PlMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744180751; x=1744785551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=embjg21lH98kIjqnvxhQpytstvOIiTckggBWpHLncy8=;
        b=nHvK4m3WbHkeUbCH/hRGYdVGCGBurfbBu9FSIHWL0PtCyOQ03o4h1JZ4O638pHRJY1
         UWBTcCervyQT29+Xq6HK3PzdugVcDtYOQi6iZri1/QRdhMgCwElFRsJB5w+Ei2rWdIo4
         aRXSf4HnejfFfto+VEDgz+xh8T1DI4V7i4Ai2hGrdyr/7dWfvZ0nqNjBZ7neeOV3PgKU
         GbOyP4Ti8zAVdyM3nI69w7mQe6tdvrR0YcHagemn2D2gSzeP9xp04hbxNDYHaQwP/rVt
         HpJtUAoFYmVPgyQskyIxkbdEy9fwqdBrJrVjy4OfwJ63Xw11Vq3NVbX4Ii+KsuWXlytl
         RpYw==
X-Gm-Message-State: AOJu0YxPbJoeq/YEYVLETWqafNK8Qn5gRa4B7sfFEH/2H1f7Iv3rsvoJ
	cA8lmS1A0ub4j7kynt3FMjF9UtFf45nTmzUwOpx6tKDI5PBtKYzPwRLxorTDwNJXkt92Z2G2Vy8
	=
X-Gm-Gg: ASbGncs5EpgtkfDz+5N8UchzwmDVahUvKXITylc3/T1UqTrWWgwMjETQCqLKMEYtDxn
	OgudGvb33dd9kQTonoPmDRLCO4YcXAkXBPMPkW4/sWpFXpq8CrfEygIjy3lCSyZNrpSZvcksEqm
	aRYJjOXVnqAaku0BzpVQ+Z14qrOkq/VGoHyu19iKScH3MpAWYBnQ3OooEPWSCczW2QqH+A5q1IL
	vXvG2PEYTCxbMkqH0Ou8ODABeh6OzxKtW/hy7SvYLEYyvYbCCp/9VUpMrFyB8axUQGwcG+CD5Al
	pzLH5mBkrKpIx4sdlqbZNqkQeO8mZbY0hNR8K9RzKepLLX91ACkk3Fb2cptu48xeRwM9Ux6R2E9
	fLlr+pw==
X-Google-Smtp-Source: AGHT+IHs8GdM2MQI8MSzuPqpyJVfub/Cys00WX1AG8COabFMdADIA/94/QJsBLsfGym0k69IiVND3g==
X-Received: by 2002:a17:902:e84b:b0:224:de2:7fd0 with SMTP id d9443c01a7336-22ac29adc6amr30022235ad.25.1744180751339;
        Tue, 08 Apr 2025 23:39:11 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b62ba5sm4213785ad.14.2025.04.08.23.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 23:39:11 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [Patch v1 3/6] staging: gpib: Removing function osSendEOI
Date: Wed,  9 Apr 2025 06:39:01 +0000
Message-ID: <20250409063904.342292-4-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250409063904.342292-1-matchstick@neverthere.org>
References: <20250409063904.342292-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reported by checkpatch.pl as CamelCase where function is undefined.

CHECK: Avoid CamelCase: <osSendEOI>

Removing undefined function which appears twice.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/include/gpib_proto.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/gpib/include/gpib_proto.h b/drivers/staging/gpib/include/gpib_proto.h
index 0b32404d699c..247a73846cfc 100644
--- a/drivers/staging/gpib/include/gpib_proto.h
+++ b/drivers/staging/gpib/include/gpib_proto.h
@@ -10,8 +10,6 @@ int ibclose(struct inode *inode, struct file *file);
 long ibioctl(struct file *filep, unsigned int cmd, unsigned long arg);
 void os_start_timer(struct gpib_board *board, unsigned int usec_timeout);
 void os_remove_timer(struct gpib_board *board);
-void osSendEOI(void);
-void osSendEOI(void);
 void init_gpib_board(struct gpib_board *board);
 static inline unsigned long usec_to_jiffies(unsigned int usec)
 {
-- 
2.43.0

