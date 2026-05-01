Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE9E3F23AF
	for <linux-staging@lists.linux.dev>; Fri,  1 May 2026 16:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777654409; cv=none; b=nq0OgU66yJXR33LKUErxHyBSxxzY9/pq50GMlJzahFZm4JQ2C7tIvoCk88yM2YmBnfV2LFEH3pJPOR/GYA8Cwk1OitVuSCF3q5tDqe6pPZz2ctTfN0mJdzqVi2EnjRKTAy/oq2Xada+b6HiWG3zu+3abSwpEfCiLMngHs7OA/8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777654409; c=relaxed/simple;
	bh=AG3HTci99ueTkSi7UJgy6fxos653LyFyBJNbYtXNsEs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=niKeMeNBVI320MbKS09UR9w3zzgF5v/gzin6IWR3UxRwjLounOKS8lllu76wL54bAmnCWej6oBQWwdk5fm1Nhzcmb2UAQodpg3is1cixctcMAbo87PFE5SOCUkbXw0nYltlRd7nFdnvX6DfHPCkXMKv9Mx2cGmBEjCZ76i0cdlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kDmJAHyf; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kDmJAHyf"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4896c22fcbaso14576505e9.0
        for <linux-staging@lists.linux.dev>; Fri, 01 May 2026 09:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777654404; x=1778259204; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2y27sRo5ue8JWE2ijAh+vOWVcIL4DT+bsyPNoqe/DwM=;
        b=kDmJAHyfWIZIQj1SSVl73s2lWL3mFRnsGDm67cBvjJ82xQbYKY3nFAhS9LyI/GaH53
         BLU4nWNSdawdzuKgIZQWejJSJP4nEpLxi81AhEJFI3l7TuDZ5TpjpcQLynedkgE7eT7W
         ZMrcNzN8gws5tKxQPVKXjsfV9y+ukU8rsbXFq4hlcUSlq86PfnqX1n+TeRK/Aze22TVy
         PxCS4LEPO5nDjrYOoU1e//dn6oG0zsBd04NbaQPifHXCG5dK1PD+KBvrQQXqTCjdosYU
         +74x0NzTp9baSZb21o5MyRTVnnY0Sa8Gp5y/5atUok7R/qGVtxXRhU+xA/tlXJDWSjd/
         QswQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777654404; x=1778259204;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2y27sRo5ue8JWE2ijAh+vOWVcIL4DT+bsyPNoqe/DwM=;
        b=HzKbJVrrRnmizA7luEmTd3Qn1TiFjJm7HAERstnUPS5Lr8iPvHczrLnfc3jVBB+irX
         BgaHTE8JhFzJ+uGG623Wy/iVYXJEP8aV50r8n2JcpARWhbb8cg43XAx8dFu9dR730OkO
         Zy6AIuJvdBhZeq7hw3bnfCbf1wn2QlA08hkL295UXR4GXgQnK6DwvFdtGZu48y56nq0J
         s4NfM0NQq51Ux4FpZ4KOUKTYmv4hXG6AIM2KiGIGXvFWGu7/BM+PvhxnyYA7P3jKZPIN
         cDkM7+3r9srliXDOu7GiO3bMyla003aZzYQTXPniMBwooBHXjTSO4idBR05ehX7efeOD
         bAmw==
X-Forwarded-Encrypted: i=1; AFNElJ87Xc739LIq4E6gzt+/FiUCyifDcvDQXEt7mHwkd2d6FYBYDhMCVF3TX1vbuUu4kqH1MaL5IbF8pY3RvYD7@lists.linux.dev
X-Gm-Message-State: AOJu0YyEQR7K19SFtDZQP5AgHYmyrDHANtUbNbn4vAR22NgUXKBQIunT
	O8U2VY2uMsoGiqTTNn82B43akgVgcrz2e1/hNMA++rUEdHz+AKhlO9PV
X-Gm-Gg: AeBDiesrb7XEfm38z+/R4PUm0radq8YnCqvzuffqmHZUmyQ5zW02+uiPX/j/rPDvYXe
	t0Wi2tnCgoXC5ZcYIo/ISq9VnOUx1Wtp5QbB+FmL1kOSUhUIWZzyTy8yJLJAkMTzlY1ibqkA0Xg
	09H3u1O14M0NoFcuiFqXFRi4EiXhx0LdlNNrZqyWGjy80X7dtw62uYzVEDA5zA6FGNtyA5Mp/jK
	Qu/CPdrHeWziNGTUrp7Sac3FWsSkPMu00IfJB3WDTnMVfBpFOGx+TrfGIEESbn360x/VZRxHz38
	1GYA7PR7q04CBC1yVd9oCQd7vA8+liBYUhKzcx5JdfSnithmhoVHP/oXr3CmAyNaaP6GUwYMYC0
	l+/j7qFQt5AhMnTvC5vy7R9eaEMl0ZG8g6uipksp3Jw51ycwf6MLfpOP72wEr66qXVhZvhFIRak
	yrLN3ABjSDBKCcKWCVwOS7EHobT2KQmQ==
X-Received: by 2002:a05:600c:4e55:b0:48a:554d:b9a2 with SMTP id 5b1f17b1804b1-48a8eb616a7mr64863775e9.6.1777654404110;
        Fri, 01 May 2026 09:53:24 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a82301ad1sm228316225e9.9.2026.05.01.09.53.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 09:53:23 -0700 (PDT)
Date: Fri, 1 May 2026 19:53:18 +0300
From: Dan Carpenter <error27@gmail.com>
To: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
Cc: Vaibhav Agarwal <vaibhav.sr@gmail.com>, mgreer@animalcreek.com,
	johan@kernel.org, elder@kernel.org,
	Greg KH <gregkh@linuxfoundation.org>, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: greybus:add missing newline in sysfs show()
 output
Message-ID: <afTafvSmlqsVjUjn@stanley.mountain>
References: <20260501144207.25211-2-shyamsunderreddypadira@gmail.com>
 <afTQZHlmMkTZDP2H@stanley.mountain>
 <CALx+fbZ=WyQxinsX+rggvg=rAK32LQuYTFc9c0w7U92e8Uiiww@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALx+fbZ=WyQxinsX+rggvg=rAK32LQuYTFc9c0w7U92e8Uiiww@mail.gmail.com>

On Fri, May 01, 2026 at 10:15:57PM +0530, Shyam Sunder Reddy Padira wrote:
> Hi Dan Carpenter
> 
> I have not been able to test this on hardware. I based this change on
> the standard sysfs formatting requirement as documented in
> Documentation/filesystems/sysfs.rst.
> If there is a concern that specific Greybus userspace tools are
> sensitive to the trailing newline, I can withdraw the patch. However,
> this change aligns the driver with the standard sysfs formatting used
> across the kernel.

You need to test it with the Greybus userspace tools, yes.

regards,
dan carpenter

