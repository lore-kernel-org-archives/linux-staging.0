Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC571A00F2
	for <linux-staging@lists.linux.dev>; Tue, 30 Jul 2024 13:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722347110; cv=none; b=fsyIzs5GTaPMCGspmPUfEvo4zXzpGmkD+t/NxS2XIkA2fP8pV0VkMipJ4M1blgSf50Q4EXcxds6TYe1f1Dw2sEY/0p3EvOwOHUuF7OEMHaDkl9m0xDM0trjOgHuXiAn/tBXyDbPuOFyKO9hWamyPBioAN57cLSHoB1/Iw2FDPZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722347110; c=relaxed/simple;
	bh=rGZxJV8N7UDb8uXrxEdJxFpdLfelxB7zVMBElNCu8PU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ljculc+yeVayK69VvSWA0f6fRZgYAcOA9ChKeIMpm3NCHo0M0y23c5xSfEHyJPrvwznRwUDSs147klED9REu4CCM92dE0jM8BmIkzv56xkdaAYl/EIEzIYRhhvFj2BcnWrogSuRqjP4qBSo9oMtk2CgCWzMbT2pOBSWsozqX2Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YHdCmr1u; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YHdCmr1u"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2ef2fccca2cso56965681fa.1
        for <linux-staging@lists.linux.dev>; Tue, 30 Jul 2024 06:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722347107; x=1722951907; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rGZxJV8N7UDb8uXrxEdJxFpdLfelxB7zVMBElNCu8PU=;
        b=YHdCmr1u/on0Z3y1rHYYId3NWiNIlZQ7XyT8seTlfT0GBzAq5MiPvGqRkgvMm0kxEP
         70r/kaPvTOdMHV6Ax9AkXuDySOcJXYYYUEy9faIgWtMDJfCnXff45venDP6dPf18FES6
         q4sl41l/x+lKuXhC8Us2YVKwBoxq+9kMqdKT7muFRTH0G8hE3c+vxr1bc590aee3eD9u
         4lxAMss/pvmn3Ag7iLh5J4rhG/2Da+JMFail+5X3u9QTzKriPvhByEhuvTFvqrH/4DJw
         ijTNHg8nyaDbV5xXfjQTwpa0EwpcTkqXpdDYo1UQnEysZ2bndHnVuU2wJApS0PqDxydF
         mNqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722347107; x=1722951907;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rGZxJV8N7UDb8uXrxEdJxFpdLfelxB7zVMBElNCu8PU=;
        b=mEfrACeWgElPu8zhAvYBkH9lnpdVB+MJ8idAwsc+2BtkRZy+TArA5tej3zJ+o6gjI5
         pEhcdZ1YMgDSiuB1LUFLgdAyyo5+qQ8na9Bcp8yAoGTYtEsd0RED7guCvc5cOfI1oahF
         R2JjusuePTDheAQqyeycRZjNleEy/0HgE4dZIliYu02sTFJdZ1OrukamPl9r4hske0ST
         WzkBgRqxCWlWYabTYhdeNbV1qGMpFjBkKWYFm6k2kOoRhJDOZgGUw3iI+Y2rceUVvqKD
         XOV1gGBAkS0r06rexwSbDqlS9PO/qxrW9sl/U+GyX4y5hA1rAQXK1OUMpN0sZC5975th
         uRmw==
X-Forwarded-Encrypted: i=1; AJvYcCVVvSaAC/t/DY8g+SQVxrBc55Z6lQbwFO6b/xyo8vD3EAHNt3mMCzzGmM7c8vi0B7RVozyJ5nSKRl+HydTBBwC4jbX6KmChRXXu906XMA==
X-Gm-Message-State: AOJu0YwXnZ4kx8Pz8BXpTTRyhEyyak96QI6a1yv2Oa8zDnTKw2gfgOpv
	vo+dPW2UgrGVLOBLdLIU2+bu9jql4mEJ92Io2JaoD8HYKzYA9hm6J7yV4BdJFSu1UmZQjXunD4m
	n6/DvT8blSoic2Bj86Tpg7DmUgeI=
X-Google-Smtp-Source: AGHT+IFCX/LxtMpqtReAf7UVBICDr4Q9bXNR/7TPsM9kBP3ebicgem2/Y58lXkUp8xv3nRE2E2qXuUd34eCEpLh/Kjo=
X-Received: by 2002:a05:651c:105b:b0:2ee:8453:5164 with SMTP id
 38308e7fff4ca-2f12ea9a1b1mr71573151fa.0.1722347106429; Tue, 30 Jul 2024
 06:45:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240730123427.37339-1-kartik.koolks@gmail.com> <2024073033-recede-scrubbed-2911@gregkh>
In-Reply-To: <2024073033-recede-scrubbed-2911@gregkh>
From: Kartik Kulkarni <kartik.koolks@gmail.com>
Date: Tue, 30 Jul 2024 22:44:54 +0900
Message-ID: <CAMz8oh2r0WjeQmrvZOoKXy1XkeVYrV6h1yMwuUEqBUBusZYLaw@mail.gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: remove space after pointer
To: Greg KH <gregkh@linuxfoundation.org>
Cc: hdegoede@redhat.com, mchehab@kernel.org, akari.ailus@linux.intel.com, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, ~lkcamp/patches@lists.sr.ht, 
	helen.koike@collabora.com
Content-Type: text/plain; charset="UTF-8"

> > Newbie to contributing to kernel code
>
> This line is not needed :)
>
Removed :)
> You sent 2 copies, which one is correct?
>
> Please resend a v2 version so we know which to review.
Thank you, I have just sent a v2 patch

Regards,
Kartik
