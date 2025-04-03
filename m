Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F722250C02;
	Thu,  3 Apr 2025 16:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743696500; cv=none; b=ByUGSaXDDRWHEjIz6fPAt73hHpxEC/CmolD2YjUvU7Su2sySDx5q1pt5gOKReFakmu2B4B5vP0tV5EHw94UA41B3sYuxYwROs8vigcQG7MiehshbUSOPQmOv29cE4K/kU0RyvCmz/NAvWPFXkKC6RifKi7vL97r2rLmMhkr2Kp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743696500; c=relaxed/simple;
	bh=DN7U8mBQ3KxCx2LUgVoVH4NWHDyRYu1mUUrwADcH0k0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VZbLwldXasC/xTzjnOT1v10fy5Ono+fffNLqsw5O8fn3jo6+iLS7Jl1tCx/cIJeeA9LY6KGTUGox9Upgp4bxlJ4Zkyg4cv/LfZRK3STTdrX8K876Nr4xTVNieDiYOMKMqqcH/bO9wKZxURzY4K9X0HWXu9Z9TdEvdpeiJpd14PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eCtZh3qs; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eCtZh3qs"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-476af5479feso10347711cf.2;
        Thu, 03 Apr 2025 09:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743696497; x=1744301297; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v/MgfBE7o+Sm47E+9o3UDDhTB4eKhyMw3wWOZcmEcjg=;
        b=eCtZh3qsdMC1jAKHW+eXRYrJyHCwD7FJjbMoGB5mHRPG9jhrnHVokuZRicVoeQiNNh
         +jcTTYIo7Jy2TM3BHZojaZrR92IN6lF9hCE4lo25/KG8G+PzAflnagrOiZW6w7am6/2W
         iYigVHeikG0JpABNJmqZqtuk89yflrh+viNWBA/zq6yxsF+dXwINVFS3KsY85hplpIg2
         M3bcC2o0EwPNoORuD1hm+Gyva69u1kWnsOPKOiQLp7+9VVS3NoVOoicsNuNhw9LSwEjf
         hH2VQoMOE6+rfoQz+pOWBkn22nJArKmCtEOUPyRD+jE33WVCFOWWW2y8LcdpMsppeLDK
         Uemw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743696497; x=1744301297;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v/MgfBE7o+Sm47E+9o3UDDhTB4eKhyMw3wWOZcmEcjg=;
        b=Xwv28o0C6RuKGUtLUyUUl4rrfC4GqbjhCEiJvEx24VknTB6Ut4KQFDbktYFTLBUd6L
         lqgLsqfaiFQ8LEbVRFbmUrio3O7EPqQMpx3NxwmaEhuOuce4qqRzV/LM2hhb0OZKaxq3
         yJkSBDrB9i0I2nhLgA9Tv5d8O+2UMdFm/f+r8tUSsqNaU1JzDZAZmpW9fY/I48Leb1c7
         HhFnE/RsZgN+qsF3SFcG0/5UmbvFJ9oDqonn3nTPVEG97EdOKITrKi5+PssqYozA2mmI
         r1AqoEuZQ3vN112JAaTbKlsegiS55VSK/GpNaE7CF9noR3Hlt72Y1e2YHI/rYL1dGx5D
         e52Q==
X-Forwarded-Encrypted: i=1; AJvYcCX7bn2jADi1mfc3JyFH9gprnFsnArZbHhDdjFghyXHvxyI5izqE3x12/HDd9G6e/UIVMJiwKVj96PnDunMQforDnj58RQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzLIpdSFyvsKvfLN3mK1JMcFiUJKv6Sano4Wrnj1Dju/fK++xPj
	uH7ACuRJqJUxTyXBs3+lJuovxA+LnMQKCaHy4doyvwNXz5eC8kdXj9Vo7b77pF8=
X-Gm-Gg: ASbGncsGGp5nbhSD1//FQoPk5IOETa5f9YQCsp4TVUSMjbMH/f+v/GPxEsTelFG1XTi
	bYPPJlJnT0l8JaGrEWuQayoBCt0vr0Sxd9NiD2tN1pJb3o5vvNT9D3+/tVMha35YNQOeIZvvt8t
	aRHDGQ50rf+zry45OUbZY1Ux/t98mB1hdh8wjtrN8ccvJr+b4FI17lmBcTesuHax4kM1ifXTRMV
	PStL8wzlNMfszkvCAK3XCpiebIp5JCnSAyLZ0NbjNKbawivKIj6ZKkYhz8xlGweJ/LhSlsBBrCO
	CVo7tFyRPP5mF/TVBcYV0M6TxGtiupxOyReol0FlSgnO1BYHxTbzyUFJVnZO+9fUblNrzg==
X-Google-Smtp-Source: AGHT+IFZ+IuzJ8BGX7R59Il5tW3rZYJY6Ng+w7G7b9crbrU4kvgRRuGEj5Z5nWl5cweVAYlksPC8pg==
X-Received: by 2002:a05:622a:24a:b0:476:79d2:af57 with SMTP id d75a77b69052e-479192d1ed1mr39606881cf.22.1743696496976;
        Thu, 03 Apr 2025 09:08:16 -0700 (PDT)
Received: from theriatric.mshome.net ([73.123.232.110])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c76e738063sm94289385a.9.2025.04.03.09.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 09:08:16 -0700 (PDT)
From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
To: linux-staging@lists.linux.dev
Cc: philipp.g.hortmann@gmail.com,
	eamanu@riseup.net,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	gregkh@linuxfoundation.org,
	Gabriel Shahrouzi <gshahrouzi@gmail.com>
Subject: [PATCH v3] staging: rtl8723bs: Remove trailing whitespace
Date: Thu,  3 Apr 2025 12:08:07 -0400
Message-ID: <20250403160807.100057-1-gshahrouzi@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove trailing whitespace to comply with kernel coding style.

Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
---
Changes in v2:
	- Resend using git send-email to fix formatting issues in email body.
Changes in v3:
	- Fix indent level of diff.
---
 drivers/staging/rtl8723bs/include/hal_pwr_seq.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/include/hal_pwr_seq.h b/drivers/staging/rtl8723bs/include/hal_pwr_seq.h
index b93d74a5b9a5..48bf7f66a06e 100644
--- a/drivers/staging/rtl8723bs/include/hal_pwr_seq.h
+++ b/drivers/staging/rtl8723bs/include/hal_pwr_seq.h
@@ -209,7 +209,7 @@
 #define RTL8723B_TRANS_END															\
 	/* format */																\
 	/* { offset, cut_msk, fab_msk|interface_msk, base|cmd, msk, value }, comments here*/								\
-	{0xFFFF, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, 0, PWR_CMD_END, 0, 0}, 
+	{0xFFFF, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, 0, PWR_CMD_END, 0, 0},
 
 
 extern struct wlan_pwr_cfg rtl8723B_power_on_flow[RTL8723B_TRANS_CARDEMU_TO_ACT_STEPS+RTL8723B_TRANS_END_STEPS];
-- 
2.43.0

