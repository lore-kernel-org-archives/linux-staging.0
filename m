Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB49370D72
	for <linux-staging@lists.linux.dev>; Wed,  6 May 2026 07:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778051673; cv=pass; b=ZQfv1unIhO4I3DWYsAahFrMbPQB38sW/eQ8beYnaM5KMydDxIwMIPQDzmwrCzaGEqcUAOQdYFNqH/MlXOct5HeSOkba995NwC7wzdz8/hrPsx5ZbN687gW3/h066wrec9QKZH+GA/z4ncU2cr4s4OjKZ1Pv35sisbiMAunF2/RY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778051673; c=relaxed/simple;
	bh=nrTVzwqcUX1ETTzxzJwbehjLh4y/BraAV+VE4EHDEWM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GjZZ3R/8xbyrJha71qTIi/msjFdymlaVqvAWlIemOmEfNV+jG++6P9x3QP9qGEh3Yut8shewIZcYLfDdeWSacaGQVNU3TU3kjyJ2649zkFUh8MlXSNq8GjiGdZk4beN0f0FVi5I9aah21smJBe6zFjB8rJJJIA+2mQOmq8StLNE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NnaXfPr9; arc=pass smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NnaXfPr9"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-6530287803cso6261503d50.1
        for <linux-staging@lists.linux.dev>; Wed, 06 May 2026 00:14:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778051671; cv=none;
        d=google.com; s=arc-20240605;
        b=gb/X+2RMjkWBVBIiFthd1A6PDYRIHvRzOm8pnbnzsSMRE/2M2pep79aZoqCe2dX+s4
         fdxxryCSGlMAMtfICF7qV0kTzgqyiOyQGUbmzjsNKCM1aTrAvUA2gefdwsxc6SOwiSRC
         qtCUSaQNyVWF7DmyaHMtuq5rtPekpxWfkr9rEI3Gb1JtdglWRDJaBUaqaAsXmMGQQuZ9
         mf0s0VKT2UurkHzxjVWYw+HKZeaSvpHG+1p16MeMcwQaYviIAbFN0ckTDQhAOJsnk10Z
         uwSzShhkP99/kivsjQIK+mUxRQncBBDiF+Ji6U0whKFiGBXfoTkVPBaOQ/TWNHvFv1ck
         ua9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nrTVzwqcUX1ETTzxzJwbehjLh4y/BraAV+VE4EHDEWM=;
        fh=o4OUFN9P0ZdcoJlcIzzAGeANF0tKtaksawzwN1a0uEk=;
        b=Obfd/8u+I7BZnkYvGtLYscci5Y3C73fLoETBSseGe0ao7sOKMgXuYXX71PfXB2XWo4
         CT3gqrotFBVq0jwu/Jl9KoFX2FztI2wdpeRXL5+wNG2iPqh8AL/k2/JEkasbOqpgbuwR
         aeKOZz1XJxU/VjL6VUgoBSQ2dxAA7DaHl5QlrBkv9fLcFPaUSKLIU7Lp6hrv5QOboDBQ
         RWDLrqidIa93Tv1hhkhQnLIb7GbihVRcPk6eZTztfZBWPBuF6Q7Z4tpT2RofIN7b6b1X
         qSLcemHPHySydciSFk8cZPJdkSH2BXEyudpkBrU0Y55iUVgM4d1TLLL4+TFpjnVaJeNx
         OMyw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778051671; x=1778656471; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nrTVzwqcUX1ETTzxzJwbehjLh4y/BraAV+VE4EHDEWM=;
        b=NnaXfPr9/fjFP7P31vfksOyDgC7f025QQBSkjTaGHrh1zGIwEVMjERs4mfXirrOCRl
         lzoYvalXVRqgUQhvzhOKGfloTWDjQoAA3ZCGfETtPYs4SfzCebbJJJ19r35NiHjIZHQ/
         /KjlcxE99m32i88z85YpkkOYfsJGCvFGCsJTBXEQSDuS7aaNyAFHbOZsnmiWDyscLDgV
         qEJDrorUV4k93ewNxCoyLbqVCY6SLPCQvu+Bbp9oEezB0EdIebVPrWAwVi6xLNi31dcQ
         SjkCgCv9QSRdLa+1/POVVOFjqD7HD4KgxGt62GMnvI3Uu+35FJWbokBwPaD9yGLW+Qss
         OIkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778051671; x=1778656471;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nrTVzwqcUX1ETTzxzJwbehjLh4y/BraAV+VE4EHDEWM=;
        b=C/l2ZoyGMZ0OheGBe4F8+qBafsSY4zFaFYtLR5MGrR47qIBpaFcSr7cD1rCCRmb/4f
         b9op1vsN33a/PBO7KWlzyRi9BPQDtgr0BXRuJxq2sSI+WYB8/f/yJwE2LOb8eh6E40yD
         wR3mogJxFhNDhOQLTdhywx1lTwcnlYg0e/FQL51QCHDx/kYj55rfD59k+kSGLgBAdqwI
         CXXLWSolMn5PC8cCxScWl4u4cT2861yCdFJihgqonSBwntratMphbGKKcL1py+o7nVGN
         e3+NTJpvyVWVwnSyqOvNivc/Qf9xEcuezRZuX9orji6Eq6CkKDx8CYT+QQIYK0Zi5l2G
         nJOw==
X-Forwarded-Encrypted: i=1; AFNElJ8DBS+NWpRDgTvaxkE5GQu0fH3ptEKnTwPfhN0vQpesWlQFgz1VxD5LKlrQ7o7Zg7nhutYJYVU3LFIDnn7w@lists.linux.dev
X-Gm-Message-State: AOJu0YycqvjEFDCHic/A4hfF4nvVvLKE+Q3haMxlK3A5TUPY6aSr1F+x
	xW9lW4v5RGjhPUdx071f/8jX+JL/2w72fZrHUJF06mS599D/NUlNQEC7Xgbw1DM7fAZKwUKnPVz
	WJ/X69GCtBiJtYX+HZ3dIxp1vEvwTkzY=
X-Gm-Gg: AeBDietR4o2JfbLYtiqcuvtLuEsb6cSDz5/V0m/2qq1pvHK0gIhcOcStkuSEMqZJSBQ
	G7iT2WaSrdq7YPcqvDz/mQwu9W4/gpAy2/UBkNE6jyKjSY7GTUEsdtS9KF748E5OMnXILjVMeuW
	shNl/erfdinbggMh1ExWxTSWqFm4cvn6Qxg3vRTIwoLpUByOOmfqacHMszkT8RmuAhy1yMogNpK
	e5zTe8PvoiU025OoHnKg2fTLoMjhki4x75ShOFfNomYGf/ZZ3Ht1/Kl8+iYTKyN6Iej6zanjIfs
	2SmIak0lWx2lVXLJ7RT+84FUPjbNkg==
X-Received: by 2002:a05:690e:590:b0:651:d6a2:f766 with SMTP id
 956f58d0204a3-65c7999cc38mr1970922d50.35.1778051670788; Wed, 06 May 2026
 00:14:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260506035641.5060-1-chaitanya.msabnis@gmail.com> <fcfbdb1a-188a-4ab1-b7cc-b2c430d2cca4@sezginduran.net>
In-Reply-To: <fcfbdb1a-188a-4ab1-b7cc-b2c430d2cca4@sezginduran.net>
From: Chaitanya Sabnis <chaitanya.msabnis@gmail.com>
Date: Wed, 6 May 2026 12:44:22 +0530
X-Gm-Features: AVHnY4JS8UipDKQTuKzY_iGmgL_vrVTq2ax3_OE91C3Hg5E2OxDxa1oOzXSXKkE
Message-ID: <CABjkosGtM-bju-gn9QtBfOMKMUsoYFb22noWjELnNi6B_ZBQ3Q@mail.gmail.com>
Subject: Re: [PATCH] staging: sm750fb: add const to g_fbmode array
To: Ahmet Sezgin Duran <ahmet@sezginduran.net>
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com, 
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 6, 2026 at 11:57=E2=80=AFAM Ahmet Sezgin Duran ahmet@sezgindura=
n.net wrote:

Did you compile these changes?

Yes, I have verified the changes by compiling the driver with: make
M=3Ddrivers/staging/sm750fb/

The build completed successfully without errors.

Regards,
Chaitanya
