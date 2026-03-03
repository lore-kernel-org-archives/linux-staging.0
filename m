Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1084938642D
	for <linux-staging@lists.linux.dev>; Tue,  3 Mar 2026 08:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772527376; cv=none; b=TC5rsvN3S9T5exzrtTkAMQOXIQChmQ5efYJEmbNQfCiySkD2anqGt3smzOsV+9R3Mz9OX26dM65+uGtPovmPLN+4UbeMwb4nWJ6Jikm+ClKK97N11tCC2cL8YZVsoexjm6LHreENZjHU2Gpis22jbIdBLsU21WcS0bbMKeR731U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772527376; c=relaxed/simple;
	bh=IzB8EsMSPw3QzBXaG2KwfOAPPaeXySttkLghuqSdNAs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RH0QwKmMdQ8UeZfHL72MhX8AAgwpahuQQR61nv1fxgFWLYW6JZ5QbA8SCwW8x4iGOQdsBuVBrTcGW/aOYMIHSflTNlElZKZKU3XkF9m/8d6XmXTyBkx0c2F1SIG9FkZijTQkHKYn2HCvjglWkf8GKVwMGDZ2mX5jdtFwcAkMzm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NR/5KT8L; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NR/5KT8L"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3870902760cso88665851fa.3
        for <linux-staging@lists.linux.dev>; Tue, 03 Mar 2026 00:42:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772527373; x=1773132173; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pid8l3oxr/AZHZz4pdBIzX1rDMW/6jLdB7pjgw7arVo=;
        b=NR/5KT8LeVQlpz/cLEiHbqS1PdpJaIAr3g5cEiApiWHbO29IjdskGjWL22TnJc6PUs
         HcMcPUsMBvet5+o4hFwkEtZpSiLhEK5SHHyMdfMLIOTetssDJM4UrDoOZ0LBmmSaheDS
         7EW1xtZhDBInbsIqmAT32mCsrjP1uOFsMLUk2iqExSr0tWaA/vHiBLi7lr+vUGp6sS3D
         SKITSBuSuiwRuLQZVz+0a5uZ5VzhQLwV3QdK9ApzMmIa8iYnSC32XK4QoFTb/Rg0zDUK
         hE4CmxncYaPDoDJ0Gjfk3488qsXzN1L7W8LcR84c2JRH28pFSsTVj7wEbqOmshXPIxi1
         Hxjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772527373; x=1773132173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Pid8l3oxr/AZHZz4pdBIzX1rDMW/6jLdB7pjgw7arVo=;
        b=cNvdqajwvqSWvdEkIgk2+YWqQSulmfNM6YJ4TNYdMvwG1THJPj2suzkEn7yLWzoJ1q
         xP5LuqnuEd+zcrfYH7yki+UUGR+wU5pYn0MZJc07cVdCQEpb3dGe1UXCeZFuGZW7vTKr
         hCVzB7HBXM0Tq6r8mjOq7DZ8v0H+/uJ6VhgsuqulthEaaKEjkmN1wNlL9PEmJWzOD5Oy
         Wt+nPGVJq56E7zJOyO0s5WHhQeD+1N0tmpdfhvU7Fonh4i8P5R+J3FiOcFCiI/6MMY5x
         aa8IFMQkHbUh4tbZD4skIH5UZ2jLTzl9XSXv18Y4XQ6Aaj7tzt7o4xSCHaCdkqEyncfU
         7Qng==
X-Forwarded-Encrypted: i=1; AJvYcCVoKrrjxr6a29DUEXak7r1rCNJTUxnsvuPBoF8pfePSXMgIye25D3JGsJPTj7sKTu2jMmTknZlhT/IeWBjm@lists.linux.dev
X-Gm-Message-State: AOJu0YxljXnAC3M5SvgfFzjtHQhu1aVh8oRYCFtUYm8ppOKK9pnnfWua
	MQ7RhxYJFxA2PE89zLhFRnsPne57LQG1TijpCBCzBKONSJdX4EUz62D0
X-Gm-Gg: ATEYQzz2UuhWwDcF3HQZmT4eSM0u38JrsdZj1VrVG4wHH/nHC2+b1vGGvqtv0NbgtTq
	HLnqYV+wQSoSowkskZWOcmHwDRGl3xed7iw7RB5n6Wz/YzHkM71n9ZTHT7OkIIcwlv7WaO4ioot
	JZUzDIQePlv52T/FuQy2Z+UUlFitYXv4RMWO0bln9+JpvTUBsBVuiVqqydYftBOdPaWuAONz7rF
	2D1flEaefZbp5IRIsFR3ero1EK4fEKTuf23u3jwb95wGrWvZherAJ/5idx1n8c+d7AdBJvzxknz
	iloumBZkJV9WEAZavppCRRn7Kme8/TD/IGJvohWZP5iIcNtFgkC3wlF59l3YejkSy72J9DwHgMx
	5YM2gI8eGSbYhDQ5JqVdOetNTMoqesP+mSZW475zYPQfQCYshZxvFdEkIvjiAfo3ls8jw6zD9i7
	Wn0kcJmSaI11nk
X-Received: by 2002:a2e:bc1d:0:b0:38a:957:a125 with SMTP id 38308e7fff4ca-38a0957a856mr72649181fa.18.1772527373025;
        Tue, 03 Mar 2026 00:42:53 -0800 (PST)
Received: from xeon ([188.163.112.72])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389f30227a9sm32599471fa.42.2026.03.03.00.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 00:42:52 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v7 02/15] staging: media: tegra-video: vi: adjust get_selection operation check
Date: Tue,  3 Mar 2026 10:42:25 +0200
Message-ID: <20260303084239.15007-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260303084239.15007-1-clamor95@gmail.com>
References: <20260303084239.15007-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

During __tegra_channel_try_format, the VI (Video Input) checks if the
camera sensor driver provides a get_selection operation. If this operation
is unavailable, the crop is set to 0. However, if the operation is
available but returns an error, the VI currently fails.

While this works for simple cameras with a single pad, it creates a corner
case for sensors like the mt9m114. This sensor provides the same operation
set for both IFP pads, but returns an error when get_selection is called
on an unsupported pad (such as the source pad), causing the aforementioned
behavior.

To resolve this, if get_selection is implemented but returns an error,
try_crop is now set to 0 — treating it as if the operation was not
implemented — instead of returning a failure.

Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # tegra20, parallel camera
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/vi.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index a7892036f29e..e0961bc0a017 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -476,17 +476,11 @@ static int __tegra_channel_try_format(struct tegra_vi_channel *chan,
 	fse.code = fmtinfo->code;
 	ret = v4l2_subdev_call(subdev, pad, enum_frame_size, sd_state, &fse);
 	if (ret) {
-		if (!v4l2_subdev_has_op(subdev, pad, get_selection)) {
+		if (!v4l2_subdev_has_op(subdev, pad, get_selection) ||
+		    v4l2_subdev_call(subdev, pad, get_selection, NULL, &sdsel)) {
 			try_crop->width = 0;
 			try_crop->height = 0;
 		} else {
-			ret = v4l2_subdev_call(subdev, pad, get_selection,
-					       NULL, &sdsel);
-			if (ret) {
-				ret = -EINVAL;
-				goto out_free;
-			}
-
 			try_crop->width = sdsel.r.width;
 			try_crop->height = sdsel.r.height;
 		}
-- 
2.51.0

