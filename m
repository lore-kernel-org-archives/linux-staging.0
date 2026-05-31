Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7114B2DCC08
	for <linux-staging@lists.linux.dev>; Sun, 31 May 2026 17:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780246825; cv=none; b=ctKgXEERXyqXRoUvofJGjVlT/hRQUVHBdH58RZwllbrfG29LRqp+YYbnzsWgTltNZUEnT2+uLSW/gCymKxMzjTT4DUZcWI7NEuoyhIfgOfXYj09CzNtP83OOhLFMvse/GdOWd8S77qabKEI7Ml/YeBQbFIz6BZGjgJSywLHxW7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780246825; c=relaxed/simple;
	bh=vQp31OjdXbhyheIG2RY7IcmFfCgogy0MXIdLqjyo/Bg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OR6AGG5sIPCnXgfYGgJaFmeXrBzCu8aC+IwCq5LusfwVb8qc4OLq9yiKqj4ny0I68a7Qr4b5ss0JNw2PiVy8bg0MfaQIsmmFCQfGP87p3dzZ4Nm+DUJ8K1Ml16n9Fkyx/q+Gat3Ui4Ls0aZvLKvzGecOWhP41Nwgl51gAOrl5Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cEoEthp5; arc=none smtp.client-ip=209.85.208.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cEoEthp5"
Received: by mail-ed1-f68.google.com with SMTP id 4fb4d7f45d1cf-68be16c61d1so4355493a12.2
        for <linux-staging@lists.linux.dev>; Sun, 31 May 2026 10:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780246823; x=1780851623; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QLiZ5XVEeuk/bfAcQjazdsjlfqK+2o8YEArglAs8A9M=;
        b=cEoEthp5k0Op7UJwmhLXXr9AI3cDR8YHFYt0D2qBtJAxxBX+PUaXi2ZNaD2PDCk1mN
         4qZM9Z/Pe7jvUppTUVrljymoNccH0jKIzXKWUWDV+6hvTk1E8A5263otvEDYBXLP5vuH
         tx87GS0YnQEy4KFglr+aCHbrMb2gy3iJalOLJ6IO/6GTcdQd57+D4L38Gmwm66lKz9JF
         6z7dacJPUJ5V7IB513p+tZStsfPpGvUwQKkTO45cGdIUg1bzGMOIQMttfN8CS4Fd9Kjk
         /UcS/th4zSjlvkQlHERIteGnSjztA8WY/yR7YEmeEHoNiwkaJKHGw+VttBXXHXmRl9v/
         DilA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780246823; x=1780851623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QLiZ5XVEeuk/bfAcQjazdsjlfqK+2o8YEArglAs8A9M=;
        b=FpiUiDW5mkVkfkSdRR2oKvSnbpUntDBZpomno67cgdXuMRUB/U7GA7eb4C29vN8OR6
         tN9KINhOB3k9NZQpzgoUfxA+haVdyj7JS2QmHDk8X5iLBDDyp9hy7U127+XN1t86zsBg
         DtkKGdP59m9Xm6WX+AuN0m8IStckkyxjT0SvP+0BMQrweBWZ5iKKsR5IuLrOXyTKSbYc
         7R1O0DbCwvIu0DFsJbAbcV/Hk2lVQGkV2AWMyp/7FqFWakFAK15nVmfsYHB/03jDxFu1
         fX6f+K6hVfW7s7a42XkEV3GqjRWSIAOglrLyPKCL051UunJQPgBVJRgYJKIrSb3NW4FG
         aY+g==
X-Gm-Message-State: AOJu0YwODaRXDBkA/Artg45oOs8QsH++2n6JyrI0IawQqB/yfLtPv0sO
	Ty5QT7JOV8bLvxwqoAJxfu4j1xfQh7Dtf0VVF+axOpxVONqAqdQri0lq0UzaJll3VDgN
X-Gm-Gg: Acq92OEk5QPGl0a7VzB99++UfUxHBOhnm6d91xi6vIsdxJ2TujHG8wZd0I9JQZrDmYd
	zhnWzTkwyFkNhUYhPqrJi+n7XwfF9TBTslhu8+2gLnGx5DLz0bpZpFoALxtYUx/RFLjvmNJW9rW
	ffEI3AV/zwTEzMmQmwm4PZVhun/baQIcS+c0x/4miXNE8e2ZTvMWXqCdVXa0pnCyi8NGbDCacR1
	QJnt5NzwVziuPgDPh13fLWkCUYPZQN76BwK9agzRATjZ/ufXmHca3DIPnWwmLUBHjwh28hG1guE
	gYedV/Wo1bIWHuNTEuNiCUJhtbcS217769xy7H7/e+71l6bSmPMUWv21+RTYmaU1NxPYG6ITlQD
	xXo2+2fAj/znlmZYRhtAV4KC6oKBXl0rKfeb1zsnlwPbRt4+yZGm2r25cZYCBU5lBZqcj+cAS8W
	Mc66wLfqItFAZQ+KcZ9NX1/OVvv9Y+1sr37ULf2SyNknEhW5yxSgvQq7QvTic=
X-Received: by 2002:a50:8d8a:0:b0:67b:4e46:f12f with SMTP id 4fb4d7f45d1cf-68c8b3deb91mr2757432a12.25.1780246823044;
        Sun, 31 May 2026 10:00:23 -0700 (PDT)
Received: from archlinux.itotolink.net ([217.196.163.117])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68ceb869dfdsm1184310a12.29.2026.05.31.10.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 10:00:22 -0700 (PDT)
From: Vitaliy Slivinskiy <phant0m.mail2023@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	dan.carpenter@linaro.org,
	Vitaliy Slivinskiy <phant0m.mail2023@gmail.com>
Subject: [PATCH v3 1/3] staging: rtl8723bs: remove unnecessary braces and comments
Date: Sun, 31 May 2026 19:58:47 +0300
Message-ID: <20260531165849.283264-2-phant0m.mail2023@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260531165849.283264-1-phant0m.mail2023@gmail.com>
References: <20260531165849.283264-1-phant0m.mail2023@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch.pl warning about unnecessary braces for single statement blocks. Also clean up the sentinel entry in the sdio_ids array as suggested by reviewers.

Signed-off-by: Vitaliy Slivinskiy <phant0m.mail2023@gmail.com>
---
Changes in v3:
- Split changes into multiple patches.
- Fixed sentinel entry formatting.

 drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
index c43a0391a5ca..f0aa5bc8a38b 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -20,7 +20,7 @@ static const struct sdio_device_id sdio_ids[] = {
 	{ SDIO_DEVICE(0x024c, 0x0626), },
 	{ SDIO_DEVICE(0x024c, 0x0627), },
 	{ SDIO_DEVICE(0x024c, 0xb723), },
-	{ /* end: all zeroes */				},
+	{ }
 };
 MODULE_DEVICE_TABLE(sdio, sdio_ids);
 
-- 
2.53.0

