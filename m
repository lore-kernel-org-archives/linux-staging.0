Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B69389118
	for <linux-staging@lists.linux.dev>; Tue, 16 Jun 2026 10:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781605472; cv=none; b=i3Dbcr/F8las5wVosZzUQBwapyR9679ktIhiZYHeCq3ArQCvLz8kKW0Vdg9ZOtaDAhPoJwtYAu3S1i48GV/fs7TGWcduRloMeQUShL4u+eZtZMp773U9nbJIWSvm4AO6CtOLfzf8CSc4J2Z37+m9zjtE8JQ42mbZlmGt8t9pzO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781605472; c=relaxed/simple;
	bh=oMSc/HyuwSyaSBImWkmaV6pIEYGoISjzQ2xzLyOo5pI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oVbTmvwHAokAQdt6uGFvW157uFD5Efb48y1/sPCRTxvrWWZBQQP3Cm5C+t6ymzIjwrWlebeTQuCEyYM+tZzzPIycIcmfOozz842YroQdvj+5myq5/Wjljrt1wlpCVcvklHuMUATEzppqOl8JAsaxJoSyOPZMjf9HPETuOrVXky8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rN405pj/; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rN405pj/"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8423f626a65so2078366b3a.2
        for <linux-staging@lists.linux.dev>; Tue, 16 Jun 2026 03:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781605470; x=1782210270; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=23OiMMB4pQKDKr8GR49qhu2OtHIc+/lyNM5A33KYx4w=;
        b=rN405pj/4XVmLUYzn+5YIjN/TU33sfYdfQhNLsYRq5JdewOlpVYqxTF//qz19aM6jp
         o0p/NMA2VDIXLRVpmeX6QWjlEOgACr7XZ25izdGh/jkY2DSDLew/BgqLWXQUlMA78OkU
         JBgDGy0Xm90K0sgPkDEEFyCg/bGbvYWTQ1N2CKRcKB6d2YLAjygKjIfifFWOYFlzlZrQ
         4pIo0iL2yjzxS3OffwUHb61+i4zcgugphUCGsHqz1KPJUC0AINcucwSfo+T1WR0emZgq
         vV0QXFKV9OMjaui6S2SegDQyEMr0GXK10H8FBnfkuB1DHb/pVqWWmAu13U3WLa+4BWt8
         VtGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781605470; x=1782210270;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=23OiMMB4pQKDKr8GR49qhu2OtHIc+/lyNM5A33KYx4w=;
        b=ELp4dZ7UPFWeBJDpxvN1WtYoqB7gxCskZCQr9v7X/RjJReTu72YStiK355Ab6srRt5
         qZ6LysHQg2q/yrGdmwIr9AJRaibDVIrLos57rb/VqXfCy43ottQ++9Dv+vYDalnj5mSL
         UxF6Xnm7z1JUxC9Iyp8NtoJDu9bD7vA9JOmvXcBpZfWCI1xDvxtKPw1EIN5+uLW50NeE
         ktmhTzZ9OzniDqCBUs4ojnbS6/PQMnlcgq6H+7vHReya3i+lVsyvMHmApEZ2C4WfnlJs
         tKu8dgH4zcskvmL7qikSyaKQwFkQVxpxOgOGtS9+j5r0Bt/Mzeo8hcGY67DKciY7TOtA
         UfJQ==
X-Gm-Message-State: AOJu0YycbAxtM3+cnYIrPsIuXLd7K/DzQD0OTfnknneTdnspn3CbpfKw
	OHHQ35e/vBvtlSjIPqKeC1Q5OyDKFuE0W5bX7mUvFKvNfVBVKGEJFkGg
X-Gm-Gg: Acq92OEtISPjOjQgs4CmzSeBrBBkDxmHUYebyagmZ6jkOOH3ybltP9jGbJKbRdgxlf2
	3lu7N24XwArD1YVkk7lAj6KMFv4Wc9vXpsip+6OTsJZh+ow8kw10xagnWyTX4vXRIWLDrCA262B
	vsmhgDitfmBdIYrHsIuhpfF5QipSdSWsySqWW72BR+KBaijmVnpC0vfRloOK+hT/jTmOlQtmVDD
	D4SKbH5PSfD8xTAdiPVVL9mC/13+DS6lCluhwRTBeSrNssovYUefy7vmBVVoa2QQbUxR9o6u0jU
	tVWXfpT2EaGPhdtRTaH+Cwm5wIcOXDkZLx3UN++Z5mtMNBsNHmRJCT75L/yIXloul+4spKfrgNl
	8llUML2q5bXngGqKGQIWMEz6RNGVpmDU3F+isYjoDCE7uCcgxi+nhkdRI/gUyrttjby4kDpgjyz
	R7fzZplrdEg3joGvNCDCj7uWw=
X-Received: by 2002:a05:6a00:4b10:b0:842:4bf8:cfdb with SMTP id d2e1a72fcca58-8451552329fmr3036091b3a.32.1781605469809;
        Tue, 16 Jun 2026 03:24:29 -0700 (PDT)
Received: from fedora ([103.51.149.90])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434afd17f5sm11562665b3a.39.2026.06.16.03.24.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 03:24:28 -0700 (PDT)
From: Subhrojyoti Bala <subhrojyoti0609@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Subhrojyoti Bala <subhrojyoti0609@gmail.com>
Subject: [PATCH] staging: rtl8723bs: Fix whitespace in comments in rtw_mlme.h
Date: Tue, 16 Jun 2026 15:53:48 +0530
Message-ID: <20260616102348.41973-1-subhrojyoti0609@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove extra spaces after /* in single-line comments to comply
with kernel coding style.

No functional change.

Signed-off-by: Subhrojyoti Bala <subhrojyoti0609@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_mlme.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme.h b/drivers/staging/rtl8723bs/include/rtw_mlme.h
index 59b12d9daa71..1b862ec24d36 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme.h
@@ -13,8 +13,8 @@
 /* define   MAX_JOIN_TIMEOUT	2500 */
 #define   MAX_JOIN_TIMEOUT	6500
 
-/* 	Commented by Albert 20101105 */
-/* 	Increase the scanning timeout because of increasing the SURVEY_TO value. */
+/* Commented by Albert 20101105 */
+/* Increase the scanning timeout because of increasing the SURVEY_TO value. */
 
 #define		SCANNING_TIMEOUT	8000
 
-- 
2.54.0

