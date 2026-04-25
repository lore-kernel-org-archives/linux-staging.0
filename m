Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECAA3E56A
	for <linux-staging@lists.linux.dev>; Sat, 25 Apr 2026 04:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777090297; cv=none; b=ERsvgjx71b7eJL1I+l5B8JL2EiLVcKu3gwsYga9G3Z50cfgdzFBbUNsus17Jzx+CZePlHwKLU7sLIDgar+Y3IBYJ45MfKITafDRnDF4qlIuwNvN1yVmCtxoliOOs4OK+/P18lIW6fejjnvyz0bqKObpepZj3pPz4uN93h72mbkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777090297; c=relaxed/simple;
	bh=GW4l/R38TjNz3L8O5Art7qT+FhN1yKPsNIVdCQ5t2QU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s08muSoiZphdQvvej69J3fV327ZDiSgvAxhKly01k8rCdJuMAOUJHXfY4uZ7unwDmNd29qGaOhJwwx0Uka2ZEOULJZ7IxrAhHcLh+pTu/UQs11KRD2PMu6Ny4IfGR6Hwe3zn7h5549bGE38A18bQVHq2zwPnZA8MrzFv6JDwaVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G32fpdZq; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G32fpdZq"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-35d99bae2ebso7604176a91.3
        for <linux-staging@lists.linux.dev>; Fri, 24 Apr 2026 21:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777090294; x=1777695094; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GW4l/R38TjNz3L8O5Art7qT+FhN1yKPsNIVdCQ5t2QU=;
        b=G32fpdZqLUK3YRND/8e3ESJorJG6346dmQ9pjF3hyWPxEYHqfk0CMrMeaB2gDAiPFa
         ci4iEQcj898jkUGaNtCcetqet6jkfFRWZc5SqcnwyI8LGssI8DWeHnMIpbKKfDkwVcAr
         d58/HNrSfIhFV412uXM2HKnwLkEL1+AXAdbTNllzwCNGwWFcb4WgaboaH2QSCFXnW9EE
         4iRWZs4tUdqHIlXLyWRKOagiKFFEi68cTuJLj+wky6Ptcw5WUVhfpEyIfCjqfDUxtWlm
         TKrBn41QezKF656srWVMygPr25Q3q0/bJRqWxvMk3Oop6FfzFYmwbdQCbOjhDZg06y2n
         9d1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777090294; x=1777695094;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GW4l/R38TjNz3L8O5Art7qT+FhN1yKPsNIVdCQ5t2QU=;
        b=KQhVaU1JL8Vs4l5H+ozX09URKlkO3E3ZHIYw4ZV37jSKvg73W9xjMkgAyQbhAHQrrv
         u0SuO2hcUP87BksNMNHwMdErl50f+QFaOMkdFKSNONwxtuJX34Dz3rVkNRwK1tio5VUE
         WwkvX+0OUETgwCXxx47r7b+xD3xG3xesR7RUQs9KtUFlD0rYEUTwoyXbtat0l4VQLEGc
         ni/ytBMAdM3GxBVSAzcGmJoCVE3rNn7dESGBncL9+G/Ojis4AZQR+pye+F6hRNHxJEmV
         uTsCRMvddqzBHyLRmKHwf/NCKpn4qDpLFXM8EywbJ9xRMJCEbqD1Qw5qiLyzPk+wcaFB
         UxvA==
X-Forwarded-Encrypted: i=1; AFNElJ+FMpdedqmrkqexFL+e1vkNmQs6zxqe2WlVVGn+u1vuSG1dBTVkLOK+L/Qb9E0tgBlxmQGYYiyRCY1WY+eH@lists.linux.dev
X-Gm-Message-State: AOJu0YzpW/e6LEKWNclepKq2ZST/SnkcJ6NvNoL8IWEFJco0+4KPVJLq
	CkrV75EOQSVhluHvYg6U5K30hgm/egYPgqFTkD2kskjMHGp1FR4dWS08
X-Gm-Gg: AeBDiesc81jvKLxwGCoCk20TKwsltn27GoFxb7IZBen7Tspfqt1ZbHEUv19eSoOwRr0
	BEH2aQuiIL9dfRjdvj416RXAb9CTHUkBe4xmvv88+RaRPDdg3RW+pSG6wfVjX1S+uMDF9SqiysX
	qt9jEYZ0y3d4NXrPbBYVZQ+B/4AiNyp1FzMu1Z/2eH1NsLd+lD8opQmMfEbjc86wxpGxjEb86ys
	Tc4sC1wxMhXoCUqfpVnEOqMLjJhncoCOOfBf6g7QdTG5Xjnot2vQTuLyEJ1QxSHMh9t2A5y1RLT
	CdQ6XdBgmQIJYPMg/5QKteh8ysd1gh3aprNl2DfeOM6AEdcb0yFoIhfoKH5xkD+v/YBuvBHljLc
	O4hgJ2iqnH49FQosYbJ4+6cc5xfwyhfs1TERy7fyJnAmAt8VFuD/OuqFKFK8b5ODLk3C6eZYort
	HtwbnRZfNrCzf0QPRQTYt8FdZ4DzKjLyQALg==
X-Received: by 2002:a17:90b:3504:b0:35f:b6a1:8d27 with SMTP id 98e67ed59e1d1-3614046f76amr38398081a91.18.1777090294301;
        Fri, 24 Apr 2026 21:11:34 -0700 (PDT)
Received: from soyboi ([158.140.167.74])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-361417748aesm24262122a91.0.2026.04.24.21.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 21:11:33 -0700 (PDT)
Date: Sat, 25 Apr 2026 11:11:25 +0700
From: Robertus Diawan Chris <robertusdchris@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com,
	andy@kernel.org, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org, me@brighamcampbell.com
Subject: Re: [PATCH RFT v2] media: atomisp: Add error check in
 create_host_regular_capture_pipeline()
Message-ID: <aew-7ecz_4MCfu4t@soyboi>
References: <20260424081538.459564-1-robertusdchris@gmail.com>
 <aesudPcQ8Fec0_VU@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aesudPcQ8Fec0_VU@ashevche-desk.local>

Hello Andy,

On Fri, Apr 24, 2026 at 11:48:52AM +0300, Andy Shevchenko wrote:
> On Fri, Apr 24, 2026 at 03:15:38PM +0700, Robertus Diawan Chris wrote:
> > When calling ia_css_pipeline_create_and_add_stage() function, there's no
> > condition to check whether ia_css_pipeline_create_and_add_stage() throw
> > an error or not. So add conditional check for the return value of
> > ia_css_pipeline_create_and_add_stage() function.
>
> > This is reported by Coverity Scan with CID 1408952 as UNUSED_VALUE.
>
> Unneeded detail in the commit message. Use the comment block for that (as there
> changelog right now and other stuff you explained).

Alright, I will keep that in mind for future patches.

> > Fixes: a49d25364dfb ("staging/atomisp: Add support for the Intel IPU v2")
> > Signed-off-by: Robertus Diawan Chris <robertusdchris@gmail.com>
> > ---
> > v1 -> v2: Add Fixes tag (suggested by Dan Carpenter).
> >
> > v1:
> > https://lore.kernel.org/all/20260423060246.296986-1-robertusdchris@gmail.com/
> >
> > I am not sure if omitting the error check is intentional or not, but from
> > what I see from another ia_css_pipeline_create_and_add_stage() usage
> > in the same function, we check the return value after the call and return
> > the error code if it's non-zero.
>
> Okay, while this observation sounds like a +1 to the suggested change,
> you still need to dive into the code and try to get if
> ia_css_pipeline_create_and_add_stage() failure is fatal or not for
> create_host_regular_capture_pipeline().

After diving further into the code, I am not confident enough to
continue this patch. I lack the context and not sure if this _seemingly_
small change can have a big side effect for the overall driver.

With that in mind, I will not continue with this patch. I will try to take a
look at another driver.

> > I also don't have the device to test this change.
>
> It's a pity as this driver is quite complicated thing...

Yeah... Let's just say it is _a sight to behold_ for newcomer like
myself :)

Thank you for taking the time to check this patch.

Best regards,
Robertus Diawan Chris
