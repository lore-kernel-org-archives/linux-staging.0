Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD91836E47A
	for <linux-staging@lists.linux.dev>; Thu, 15 Jan 2026 11:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768476111; cv=none; b=c6NjUZFTJLLCTwJnYN4AWFG2CX2vCmaI56OodrM+9MSWDOf+2cajDWHcmItWPuX4XeYnyqGYq5VObdvfvNNyzeusf8tOfT3ulsaNrWEp3vrbySEulCXYgdqvU3KJcsQhqAwEj03+9DA1alvNOT8HY5xFJXAE0IulZvg96pBu2EU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768476111; c=relaxed/simple;
	bh=4NvuGmk50EFnZOLSVMGrxbJmSZaQbd15DKNhogByLCI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ftLC1vWPAhKsORIIKasW4dB2SZ5x00UDwr8mdGcFNVOJ9UANpNb+QoX8K8hKRigBCd4OBrAMNF8kjLez4fjTMGoCk3Npy2pWQCznSLEOjHONwkSGMVYL89NiLctHXu/EOKcFmV5xTmHsj1ikOXxOl32Jrpu6pts/eIOcNnO6VzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B5U6L3Bh; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B5U6L3Bh"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-59b6f59c4f5so1025688e87.3
        for <linux-staging@lists.linux.dev>; Thu, 15 Jan 2026 03:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768476108; x=1769080908; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4NvuGmk50EFnZOLSVMGrxbJmSZaQbd15DKNhogByLCI=;
        b=B5U6L3BhDOibJiwYkSpTCyrS8HPMX7xE5g7PVC361hkvoTQ8rknFlukwe5FgJBeLuW
         N4sLJdSMkLoQhiYhAmcncsPRUrc38CvamH84ce4v39dBLuy+TgVTnW7oFiL8NZ4NSAmX
         kggIxhjnOCb/aanzlV6hz6tJeWkBYQdCoeSh+PynfIoL7UqwcB1qn0KpGqChTDKjrGOH
         n3CsItx3HB854dzolUgGGxXu8clEw4TG94xOdaX+izt5ZJ1AfVC9vSlr9JPK78Fpsb72
         CjCzOUl546be6y+3sl1MtA6vKMCrVTUqbzumWcTTBkPMuSRF9pNFFtVikXp5vPtK2spe
         fNQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768476108; x=1769080908;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4NvuGmk50EFnZOLSVMGrxbJmSZaQbd15DKNhogByLCI=;
        b=PCWxo2luBUPB+EyISgv48YON0AWjc/sHnTxQkfeHVY/I0rjJr3bcR9DbC4gHxhHLxf
         mgpYs8EzMmZ+lkBSj9TRBcr14FSC0jNkL12AelW4tpRvHYLt+eUCq+A6xQzntWf7/F77
         DsoQgJZQlgXlA0hKdf+4KTelsrAmfiNy8B+V0pOgOBiyUG85n+eXg6qYddDW5scEajtM
         B4+TY8n17OGFyWFdZWWjpcQaNojNfOIQMIVg2g9ZZsnD3b6aW8hJPVakGIVx1HA/1/7V
         klCVJ6P0CH5dkivSfYhWJ8yA1vjHOo7ZB/BD5remE3JlQysiScRSsc31KTKhuBqbtwgS
         c/qg==
X-Forwarded-Encrypted: i=1; AJvYcCWy+bzi7nr2WQ+iheBQpDTp4zdtUNz02417tJX45t1ZVk+S5C8hEVgMsu974sAuAi4gN80yuoGac9iMCGAV@lists.linux.dev
X-Gm-Message-State: AOJu0YxDBDX5A3cUOZWKiRhFBntAoI5XvAE++CFpjy6oQ+otdF1RZtnf
	QLg14hXk1B/IX+BH+QSWB+VVs/QNBXj912EUupbeU+w77B2+BkKqT70qZYekRyQ9zhkA4ONzmtg
	IRt6Xw+VfOxpBEdA2vsM/Q0HT/PYP6Os=
X-Gm-Gg: AY/fxX5q+fE+HHeJuMiiPFNVSgtaEueczaOv8zKZAyhJfDYe7CrmIeBfaRcio4jtZn1
	rS6QQbSD3ocSAt9q6DohjR5ySTHnFCi5fm2Oorqj1SJvFKDwfiJDSPp7aSrlVXHCEs4u6cgOOOo
	xHiE8JMY21dviHq+MbN99VoeG1fq3W5yPAhgjrLFpQQhIC/xdtohf234sL9anFPJa/kta+JjpuS
	4oXwUDf04aPo9pIjHeCuV9+ZpgvZJI7htCJ2mNKkJv+L78GmgT3obhv2OmYG0fPY/ur5AzM
X-Received: by 2002:a05:6512:ba9:b0:59b:7888:62ba with SMTP id
 2adb3069b0e04-59ba1741dadmr1750913e87.37.1768476107600; Thu, 15 Jan 2026
 03:21:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260112190054.9828-1-dev.anubhavk@gmail.com> <aWVIF_rkHzxs3k-r@smile.fi.intel.com>
 <CAF6CsJwg8EFtCT+zyKWex=RbWu4TyZanbXnqip=J7=sCZDab5Q@mail.gmail.com>
 <CAHp75VcuO2qNeWLcrDqVfE_aQs=2ZiRB0CDxJpFquXJ6jd5eSg@mail.gmail.com> <CAF6CsJxKZ2FvRWVR0SjyfYR=Nj+4uCMgaJgO4BVBtbMvakXhVQ@mail.gmail.com>
In-Reply-To: <CAF6CsJxKZ2FvRWVR0SjyfYR=Nj+4uCMgaJgO4BVBtbMvakXhVQ@mail.gmail.com>
From: Anubhav Kokane <dev.anubhavk@gmail.com>
Date: Thu, 15 Jan 2026 16:51:35 +0530
X-Gm-Features: AZwV_QhCgKgy8vS-PBhxDm6FPyFnuBhpvI1l1dggEfVmfafZZZLjnbW2r_KGLRs
Message-ID: <CAF6CsJzAzieEumnunohi9VrBZ8D+1rqG0wLO9EW2vLKUZS4keg@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: refactor sizeof(struct type) to sizeof(*ptr)
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, hansg@kernel.org, mchehab@kernel.org, 
	andy@kernel.org, sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Andy,

I appreciate you taking time to explain to me the refactor using kcalloc.

After reviewing the requirements of the task, I realized that this is
beyond my current understanding of the kernel. As this is my first
contribution, I would prefer to build up more foundational knowledge
before tackling a refactor of this scope.

I am stepping back from this patch for now and working on simpler
contributions while I learn more about kernel development. If this issue
is still open after I have gained more experience, I would be interested
in revisiting it.

Thank you for your time and the learning opportunity.

Best regards,
Anubhav

On Tue, Jan 13, 2026 at 9:38=E2=80=AFPM Anubhav Kokane <dev.anubhavk@gmail.=
com> wrote:
>
> On Tue, Jan 13, 2026 at 4:16=E2=80=AFPM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > > I looked into implementing kcalloc() as suggested. But the issue is s=
truct
> > > atomisp_s3a_buf (and the other buffers) are defined as list nodes wit=
h
> > > struct list_head list embedded in them.
> >
> > Yes, and how does it affect the allocation?
> >
> > > The driver relies on adding these
> > > individually to asd->s3a_stats and freeing them individually using kf=
ree()
> > > in multiple cleanup paths (including error path here).
> >
> > Is it the issue? Instead of incrementing by a pointer size, you will
> > increment an address by a structure size, this is how + operator works
> > in C from the beginning (or close enough to that time).
> >
> > > Switching to kcalloc() would mean the s3a_buf is no longer a standalo=
ne
> > > object but a slice of an array. This would lead to invalid or double =
frees
> > > if the existing code tries kfree() on this array element.
> >
> > How? As I showed above you need to carefully move and replace
> > individual handling by a common one. So, instead of allocation per
> > item it will be an allocation per bucket.
> >
> > > Addressing this requires a larger refactor of the buffer management l=
ogic
> > > across the driver,
> >
> > Exactly! And that's what I think is the best way moving forward. You
> > will kill two birds with one stone: fixing the issue at hand and
> > improving the memory allocations in the driver in this area a lot.
> >
> > > would you prefer I stick to the sizeof(*ptr) hardening for
> > > now to fix the checkpatch warning?
> >
> > See above. As now I think this is unneeded churn as the idea would
> > still be the same =E2=80=94 moving towards kcalloc().
>
> Hi Andy,
>
> Thanks for the explanation regarding the pointer arithmetic and bucket
> allocation.
>
> I understand the approach now, will work on refactoring the allocation
> to use kcalloc() and updating the cleanup paths to handle the array
> correctly.
>
> I'll send a v2 once I have verified the changes, though it might take me
> a little time to ensure the cleanup logic is robust.
>
> Regards,
> Anubhav
