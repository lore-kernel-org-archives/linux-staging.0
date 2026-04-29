Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CCCD3806C9
	for <linux-staging@lists.linux.dev>; Wed, 29 Apr 2026 17:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777484629; cv=none; b=BiiCH74Y8UM6mk3Lc5cCB/Xtq92k5aTslfb/Zs4F2mbleWOCa1MAkLfpG8//1HCKPNQUaDJ1uXzCYSD+taRxMfYuA7epoD/Z5hLHx4OSSvlwWvGPqnYwlmKRth8pHXUDWKaW8mCOXZjFdM8CyLxSbKTbs9/nsuVoDJEh/GutQ9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777484629; c=relaxed/simple;
	bh=FWv8xAVhjOsHG/r8SYz7rgNmdbPMPP6ouQo9uLyMjRw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LwAFoPf8pybbAmB3e1HkYU//iWBMwa1vEhIhATzloC8ToLXgb4qvfn1TkYnOs65lmpAhaY2cqGK6TwT26NZUyoiJD4/XAFiHAjok+DvLT2CcSSs3cKmrpcWui3UX+OHEdIhmfQFRTfRrcCgQSEHtLhCh3yvPv2DqrZp1w7nrrxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sIVMvZlQ; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sIVMvZlQ"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-8f83efb5729so4153185a.1
        for <linux-staging@lists.linux.dev>; Wed, 29 Apr 2026 10:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777484627; x=1778089427; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Tb+HxubCflTrwQdSnLZzamOr2XwbU81ZyZirOM/E8EU=;
        b=sIVMvZlQbknqVcIuvdNTQC9THGDh6JSqZkGlmm+fVQzmOfkcXPLNaRDNFwZhwbqKey
         wOXC/H8HxlngJgRLbBoUk2N/BrOPjVuRj1t7AP159p9yelpSx4l11uXOpuYBYd11XXRy
         eH2oedD3VZQ3jA3QqQuafvm1p/ZwLosx/eiZUyYOWNw+bMxyhHsBHnKKK9EjX46XUhmZ
         xTltrpqEoofcK04ksAZVEk2tI2+fQjtt2VmDkmGKmEIKicy7Z99YVDZ69Z63ZxVFI0Xm
         MSheitGxjNkk4aCsvdZmriby1NtCUpYkucZcWIV8n5wjd72rnkP5oycfxrBDu1KzO9s6
         /TLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777484627; x=1778089427;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tb+HxubCflTrwQdSnLZzamOr2XwbU81ZyZirOM/E8EU=;
        b=Rz+UTZMc85TCKzKdX9ro2Bhlpyla1S6jf0yWsBgkD7bKYOsLt97X3vS1fcg/3Q9D4a
         Y5D03VeFtrvN8cBWv7jJQZ/8NXKi1y4jNaXJt5uMb36s1+plqWk7fVtjtgeEOcgScmZL
         a6nX4vRXRrUDyvCF+HkW+pOeW3GhP7dYNeAQ2/YMeCaANVheuMv8sRx5oJUTOEh64UhW
         EWaSxndY1WnKcKXwB5SGX6A4YMokNjF4miyeLyEI+mv0oh/T9q62LVPtRBCJt20Mz/WT
         UboYijPwxFdpl3UpnemDAgPB4VKRbJardBY5LL5LhRZsWS3Xea5KWZLUc72PMtWWrOK3
         2tAg==
X-Forwarded-Encrypted: i=1; AFNElJ8by0wor5uSc6CkBYshHICVjUqNeh0hBjQRLCupIN3pa1zFkcQBeHUZbZkaezdb618sJ3LCigNyKDFHZPgz@lists.linux.dev
X-Gm-Message-State: AOJu0Yydl69INMtY5WpWNOFXGZYqQNLvL1EvV7kA1lf/HRGFK+b6PPwl
	dhuMy8/wMiRqvwUuQM/bBvHF+U4iRSEBYqGqdbsjhZToJcDEZu4ZJKFF
X-Gm-Gg: AeBDievpIYQcrZhZs4n0kM3kXrMfJkQHmR9SClXDCuHibKKgVO5g7svfd2TZsVYQebb
	M7JvTgC42Y+11/49j5OWQ7JykDHr9ABydaZ/J9rX9N9r0VAq9PH8I8ULcaaOAcJXflNlTMFM7l9
	0IhWFBnyl0JbiFgwZCZiit0U/n0scVqS5o8C/rRzAs5nkaoo2Tb2Ts2zVn0IKD18HbwNC2dYtcX
	K5DvlLi5cyiyL/QBTANI5FoWk+5ljsOD9tngz68EFMlGP3WgI9dsY/XbtqFq71a6HBTZR+EVOvK
	Q/BE3+S0ErdHpxFyx/WE5RpsTaia8Cgsi5H/cNHplADPA3A1osrAKGS5H8wDEYwNDW5rMgO/B/U
	ejdVK2I3JlQBIc2VNnllX5gkhf7kfrNPawYiVfWP3OeSy/+C5jnUbA6NYObTZaaZXJR40/yixQ7
	R42jdYiy5BG+QjvBTAh/J+F+6lAR6cR8GC5iCXde5J7u34EhBI2LPh1ZO2KPJy/cLIwEhb
X-Received: by 2002:a05:620a:258d:b0:8f2:4470:4796 with SMTP id af79cd13be357-8f7d783482fmr1098536685a.20.1777484627502;
        Wed, 29 Apr 2026 10:43:47 -0700 (PDT)
Received: from House.mynetworksettings.com ([2600:4040:2afb:6400:cdc9:3f29:858c:a856])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b3ef7ea76esm25330926d6.26.2026.04.29.10.43.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 10:43:47 -0700 (PDT)
From: Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org
Cc: sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
Subject: [PATCH] staging: media: ia_css_stream_public: fix typo in ia_css_stream_public.h
Date: Wed, 29 Apr 2026 13:42:41 -0400
Message-Id: <20260429174241.5836-1-mahamaryamjavaid@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix spelling mistake: previosly -> previously

Signed-off-by: Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
---
 drivers/staging/media/atomisp/pci/ia_css_stream_public.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/ia_css_stream_public.h b/drivers/staging/media/atomisp/pci/ia_css_stream_public.h
index a505f3797962..ad5c697350e7 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_stream_public.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_stream_public.h
@@ -225,7 +225,7 @@ ia_css_stream_stop(struct ia_css_stream *stream);
 bool
 ia_css_stream_has_stopped(struct ia_css_stream *stream);
 
-/* @brief	destroy a stream according to the stream seed previosly saved in the seed array.
+/* @brief	destroy a stream according to the stream seed previously saved in the seed array.
  * @param[in]	stream The stream.
  * @return	0 (no other errors are generated now)
  *
-- 
2.34.1

