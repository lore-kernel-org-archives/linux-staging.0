Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6ED0266B46
	for <linux-staging@lists.linux.dev>; Sat, 27 Dec 2025 10:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766832975; cv=none; b=EuoyvOLCR/KB/l7iICJwwWk5acWxjeIoYY75HRnwJ4HDZxjZe+fErTSgMaUDEnYFaOyIIqJUbdZsGRSypK1yfpXyUif5qycjSPS5LYDNrEPnv2/Y948/2fL2PKCjCFRSEl2NNMSinxFXiyd9nISwUchHwJq8hAKhpim8mYi2MeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766832975; c=relaxed/simple;
	bh=rwK8Yb8lMppqkdA0k3CGzENNnh2QljvEb2uEw3c5S/0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F8PPtMpq4flqCWCICaPbOgPON7iUxay8DicyNZDYH14kMqErcAlAvJILeW/nuIBUpa0p/JLgCAuNNDjVduiSJdVedp2Eza8Ar1V+QKwnxWSKGuRL5tvuLPvumTIoZlkDVQ6UH4yLQ3I/CzqKJWPb9gJW9iVtDM8+tC3tmgNb+K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c/cIX3wJ; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c/cIX3wJ"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7b8eff36e3bso12414683b3a.2
        for <linux-staging@lists.linux.dev>; Sat, 27 Dec 2025 02:56:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766832972; x=1767437772; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LVirW5At3YCuRHq9p7Wco6R/vGAcg0AwQjMQ8Fn6NiU=;
        b=c/cIX3wJl7FudHG7lWEY6Yw6Cbgeqnm12qcnIiBUBgPjpSbTq+f/QdS4hnkMpVAxcS
         uPmK6iAxzlwRatELeKRKLiH/+4ajtJsuT4ksREe44aNlA0jmNctoQR/fwg3h7yW7P25l
         VkPF7INI20zl4jC618tyVYU7eBVk+vhEAgZ9UxbA5J1O62BXg72BTAtw0TrifcI4RynK
         djFRUrKkMukzJYmfuNvi4ZjSXpF5FlBRHIXuJIBt7fVRfjEALnu1pS6Ora9V/f3Esiqt
         sNeIGkZ4dhEZrQ7qoTe+WEeoOr4yz0qI9b8qOrvjX0G79jT3ffT4tp4NH/tML+jVeXcz
         p2pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766832972; x=1767437772;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LVirW5At3YCuRHq9p7Wco6R/vGAcg0AwQjMQ8Fn6NiU=;
        b=l0qQfo+S7jDWqJZ433PkLQlkh5TmXguZ+i9fW/gDx4/0lxKaKeBwDuatQ54pBXlPin
         h4fB2+72eOrvh5Y8oQYhUd65OBcb2DyQFOfsZCIMO232XVWQdK0AE6qephgCwswRiyeR
         TIz6Smd581A4fFl3hFK46ZkB6XKwdqOORJz0a24PPs8Y6iLHGQTdExu1sZ9Up5os7125
         YheP4yYVhCpX5t4VRkKrmYGiCVvB4zLwUSuDxQERMys50na8nhSucTAsfXO/HQYn5AvQ
         p+Zq+84f7eDdbQ946H27ldPBBQC9pwzqby/sR9Jb6w6h+p+XRM4zEC+FvVvSpQZVcRcs
         gYlQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKhrd2xNbvoWHYbN26C61jfwJI4HCuF7WTwlLatq9F4nkRnZt5SY3yXzZk6A3GJYT+1b+Botfo8wvU9yO2@lists.linux.dev
X-Gm-Message-State: AOJu0YyoKPYpbHvKIZ17eKQ6zRgHx0plC/vmAhQRerIsbOQmz6MEMY2C
	kkCpcjHhF8vZ1kaYysGhsLGLjSC57N23IHxYcAEwMqglG1jXLmdzTIcZ
X-Gm-Gg: AY/fxX74wMBhVT8bwjfEBSwSv2fmXtQLsZdU+xQszSYjnGMiI7FQ87F8Fcw+5fTbmve
	SCkOcd5EcGCbKguKdm1Dr57/DCIIdvJlhoYw/UpCl1EKFsQgN0EJpTxuGdqY5uMapjldO8hdwWs
	NBtwMUdSsONX6C5sl+6V67pJ3EXYz2KUloyyJlYujb/rC1NNuo+MolQJMFL4+j57zBYKodQDx9d
	AaPiHTCQnZ06mGbqUvZTK7xZAROBL7Qv43FtH+V+D7eh26MxyJ4nTX1UtTEoop7FkMvOMU0KNdM
	scrCpDNPHIH+9TNB65nVKOFEGTa589doVrJ9xAJYe8LgqS2mLuLFctvFQyHQpoYhdROiH6ncIWy
	otVQY64isHvDNVaan2ODeLK7PSm8Yr4J7pHTGLqswOVFBMoRqJuxqa+yoibMbowLbdB4DZ0yrJk
	oIl+6xaRsue8o=
X-Google-Smtp-Source: AGHT+IG8WBFof84aUXLTwKlxQlmnuR5dooYmbUKjfMbjmU/pNywcIPii27EqnSFFQ7LuiEuPTwLpKw==
X-Received: by 2002:a05:6a00:4190:b0:7e8:450c:61a5 with SMTP id d2e1a72fcca58-7ff6705c572mr23370792b3a.60.1766832971979;
        Sat, 27 Dec 2025 02:56:11 -0800 (PST)
Received: from karthik.. ([43.247.159.43])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e589b0csm24762552b3a.56.2025.12.27.02.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 02:56:11 -0800 (PST)
From: Karthikey D Kadati <karthikey3608@gmail.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Karthikey D Kadati <karthikey3608@gmail.com>
Subject: [PATCH] staging: media: atomisp: fix block comment coding style
Date: Sat, 27 Dec 2025 16:25:20 +0530
Message-ID: <20251227105520.23086-1-karthikey3608@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the checkpatch.pl warning:
WARNING: Block comments use a trailing */ on a separate line

This change aligns the block comment at line 1384 with the standard
Linux kernel coding style for better readability.

Signed-off-by: Karthikey D Kadati <karthikey3608@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 3a4eb4f6d..327836372 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -1380,8 +1380,10 @@ static void atomisp_update_grid_info(struct atomisp_sub_device *asd,
 	if (atomisp_css_get_grid_info(asd, pipe_id))
 		return;
 
-	/* We must free all buffers because they no longer match
-	   the grid size. */
+	/*
+	 * We must free all buffers because they no longer match
+	 * the grid size.
+	 */
 	atomisp_css_free_stat_buffers(asd);
 
 	err = atomisp_alloc_css_stat_bufs(asd, ATOMISP_INPUT_STREAM_GENERAL);
-- 
2.43.0

