Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994AC17AE11
	for <linux-staging@lists.linux.dev>; Mon, 27 Jul 2026 05:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785129187; cv=pass; b=DI6/ID0XXVpdEjWYDWRrihqbB5ZtlW6EfpHqE+v+gssfvSz15LpoUH5C9Z5iK5lDKwTYlkmoAby0K8UJsCXs1DLvjY22WKRrFKfXDsXDzmOF+YUOH2sf5SgsQwavLQxOmAduUP2jhnr88fEwLp0tF2vipzu/HymAYTDq9b9nE+E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785129187; c=relaxed/simple;
	bh=nMDtUbsewx7pxFtY5KZtB7ePV1kvxLm+yJ7yNRZqDxY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lSg855o74AQavZjZD/md5OGdYXXRl+ra0QbTgSVnBTo4pzywKXfSb8QBjx6ycIciJjTnMd6lt9Pv7Vp7r12lqBCVRydvxi99TZKp64fM8XR0ZY5T5yh/JbGAF2QJKIOIRqt/yj6Hw3DW6mapxueyLZ+FQ+ODnaAakJT8lj5HXlI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mS18nDmJ; arc=pass smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mS18nDmJ"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-66899c7b57bso2384588d50.1
        for <linux-staging@lists.linux.dev>; Sun, 26 Jul 2026 22:13:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785129185; cv=none;
        d=google.com; s=arc-20260327;
        b=Bk3864AOoZ1dpnRaanHOtk5R2cytbFAPvmmJex2goP6DjAWT4Ae96xQAhmrs9By9iK
         XjkYYc6EFbVwDyJyNqe03WnPn13oddfB+OL88ThTGGx+YB1ZvZ+vyoanp6AvR1B5c0FF
         PHl34YGws4QGv+1TR7yd7slbFNtc+/Y9RaTaIcakIbp7NsI0z88Kyuog33l4tO1enhAT
         mzL51j3dYnVLZ54MvDC6UOGgQBPlxQF7W2JmMQmvgPEKqsW62MenM28fZXg+ir0L1JF6
         TMfhcPLbrWkenotU+DWKAy2oXfO+8mshm7GHkIGddN9VIdcmX691WKuMmppKdrV+T9Gs
         2SVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=nMDtUbsewx7pxFtY5KZtB7ePV1kvxLm+yJ7yNRZqDxY=;
        fh=aiRgke59QYld/DSa/j8l1wlchb1kvrkKH6Buc13EUOw=;
        b=gn4oYcBLFjmCDA+nxJ5h2urW74Vg10I0CJq/iKyaM8TXZ7S3Y3OezBH/WzOILt3tiY
         UM5fM5I+xHrClpgPid/CD+Wmv5qdKMM0/XAz5Oq9qWEfZAKQOr6C8C4mbfjZgkSi2yiT
         f8MxvfuobTlFN/iENuMqGfCekvBeflCGK2u3tpfECnov/2hIYke+Tv2A1dV00NF9LPeH
         KqT0H1mLios3/BCRFRKx8I54epzpjSzerTR6GRieGrf63LY6UbQ9Jaht5XVr/9A8r8jA
         9983cgi17lWdaWDDl6Zjb37jHRDYE12TYknhpZt15Spp2BW6ppz+2rGzHlYBVOiss1p2
         v1WA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785129185; x=1785733985; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nMDtUbsewx7pxFtY5KZtB7ePV1kvxLm+yJ7yNRZqDxY=;
        b=mS18nDmJYv1nCPc9S6QN5HkDE0AF7yzG7RtPCTYAzreXJ3lmdJtRzru4AqUtZ3bCg0
         GTGPxcIhihi5YECowKUIzBOX0gPHsuIkeBOnboE9tdzPJl04izoSbR1EMnoQ643olk9K
         IMk3ZZ+E9lxqffeaUayvf/2Dt+uUeLoGX2LmdqmItL+bp2fDraAITUX3ya7hGcwLvnHA
         u91f0oU/BS0VK3a3xk7WUAi6/Ou2JoYZbjwWp5yDTHRWJydFFFNye/wD9NZl0BoMDAh1
         JI+SnLE33IoKnn1KPjqYRnHwagEvhOt9TI6W4+C6kI0u5T2qqqBOTdXpm83pV1LUPyzT
         gM5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785129185; x=1785733985;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nMDtUbsewx7pxFtY5KZtB7ePV1kvxLm+yJ7yNRZqDxY=;
        b=R51zjWpvWHPYBUq+aSEUrlo4yGCirsOB470ENQZmln+oPEt6XMF5uEz4xA6++xJcH3
         v0R9dPQMyl0AIp89HielF9QZnHBQgGM3CBQHOjLu+UIZgxfxW7i2WD+VlQ1jhBkffBoG
         6fzzK1efCKOcrfEe1qYLXYr5R2O2ZNUcH13TGLtXr5r2D/AusZ5CB3rUCWwgFjAn8pVZ
         SL75nhPUbC60h3R0HIp1B/rNdF/7rihDv3VGoO5yvwAuhkp65uDtEqqZui/TDCOqBE2B
         y83jiXbArA2BVIaVCIk8Fy5b8TDxqLkQXxp1OHvIcgUJfd/NS5HxT180SA9/VxP3Dbnz
         8mxw==
X-Gm-Message-State: AOJu0Ywgz5wRa1csuS4xDm1tsVNgJmwBlPfr4UJxCGLzclmI1biRszGZ
	wnArbYZRcIdF2t6YPyA2l/dYwnZ0XTMmrkozVeW2Ryl1miIN39Nwug9wu21wD8dItcb6pwrUo1e
	I8k3iTaVrYw5Vn6C25RTki47nDAlPaiDW4y3X6HqI4g==
X-Gm-Gg: AR+sD11QZqFdOgOvVhcW87tTB2umNx+yqkI0lnd2dEM5Uj5AnAbZjaqcAw55b53JLDl
	fcQ5qS2Sat4fIJGVmDMTq3Z81yph4TEJr5/ZUcPKgK5HKp6gTCD9HF14O41xiM9AXqqW+GjOJsV
	0ryxRjJh2zXynTyo96IfsuCGDWUO7kPql7i6MFafb3QWqOezJCZCwZLftXZvURE9Ugbs600ZUVO
	/n2B39ZU4Kr3A+sCakWchS04NEmnd7KMTESV42/JERQ6pDQh5ojpp6snmqH2Zp6OgWj6ztV4SeU
	7pbtc/DoTv9CREue
X-Received: by 2002:a05:690e:169b:b0:667:b84f:e40c with SMTP id
 956f58d0204a3-668c79d1f93mr1881632d50.11.1785129185192; Sun, 26 Jul 2026
 22:13:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260727040649.54338-1-aryankrishnan4b@gmail.com> <2026072754-finishing-utilize-558c@gregkh>
In-Reply-To: <2026072754-finishing-utilize-558c@gregkh>
From: Aryan Krishnan <aryankrishnan4b@gmail.com>
Date: Mon, 27 Jul 2026 10:42:28 +0530
X-Gm-Features: AUfX_myOmnuCFC_yRVDQN3zGVeEtrCoeD1rhxRy9vOgcYLlY8EDIiZh8chwaF3c
Message-ID: <CAMb3FL=tOHNCW50n4=Jv6sByBko3=Q7macyVh5sUxPMoF-NaHg@mail.gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: apply clang-format cleanup
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hey Greg,

Thanks for the quick reply and for explaining the main goal in staging.

Initially, I just made this patch as a way for me to better understand
git email,
alongside, of course, fixing some of the CHECKS.

I do agree with the point that automated tooling can sometimes reduce
learning, and
that the patch was too large. Maybe instead of one big patch, I could
format this as
we modify other files in the process.

That being said, I do have quite a few other patches that I could
share that do work on
fixing some of the errors generated.

Thanks once again, and I will share some of these other patches in
separate threads soon.
 - Aryan
