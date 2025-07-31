Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 274D7198E81;
	Thu, 31 Jul 2025 05:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753941589; cv=none; b=vCGstd6L22rRdRQfMZVZKA2+P5YDZsKU9gpBjLGcowzNAD6k1XGcop+SAvfStf4fO8eBAfzH64PWMCd86rtWX9yIgt27/aC46l8Hi5jvLg8+sCnGxmndgRboqJpPkXOG/7maYRFfs6Q+lTOzbKGIiumkUDdIlNhFOKBzPJSmrr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753941589; c=relaxed/simple;
	bh=J8rLlA5rFoSxe/LBQNtFHx8yM/xQnHQuZGw9cloIMwg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HJaLiuD+KW8JOH9KMyK95KzaXyIoFi2nNhl5QEIerf0WSbScmrQoIP7H4A5JKlQ6VU1R6C5zTztUGCLdbboyAc2ZIa6EPIPdfPkOnDPUceQUa7j0B/diK/NOu47U3S6KK/+uTSYqOtVUHiEnoDJx2FVz67gZdW6LzZrsd3+Q1j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nR7Fv6bo; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nR7Fv6bo"
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e8e077e9704so20092276.2;
        Wed, 30 Jul 2025 22:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753941587; x=1754546387; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9dQ53H+TOKm58J6xbivZa5XJg+//Guq+YDIyJd62miY=;
        b=nR7Fv6boWV9wilBUkMPkiGlu4nBkAswOqZJQLtKPDQiXYILbAERzak+16jpkt1QoCo
         Xi43eUF1L6PxuqPEz+b/ruo5xfF0H8DKy27oXaHWkrovhpm/6KyRWxuBS01tG77dhw31
         gOE9mFuIDo1NZ45Tp+grQNcR2FObbQgrNBo2h/zKBwgYCp8Oam9B9/1ZNQQnOptfAm7o
         /n2exBMrVNcCf+w7/ItELQ/G77IGtmF+W92esClYJDgQJlXu+jroETSAc521TWri55NO
         trC601FLGSHiqPQvu4O8H0cXhv5d4amCXx4t6NC3bYjxIkXZoL+9KWbIc5vRrWhiqzKD
         WB+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753941587; x=1754546387;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9dQ53H+TOKm58J6xbivZa5XJg+//Guq+YDIyJd62miY=;
        b=gmNejuBl5klaf+gyj+MissOKMKgKUrjoXwW5dQYHavwdsyWN59vi0j15F7GiMJHV96
         KGtEThrPsWuyxYfo6P8EO+RbzAjqXsFpAj/Hb/N90bKjkwzlvd97SdDzJCvVHZGzBkgB
         /lYvRjr+seTl0knEp0xaR+AvJDSfWN+Qa8gKsJbYsoVAIVqsNDuZtEaOyS8R6z/WS3Tb
         uhwPlWil/cMFihIwQ9JRnVVigjTXtnQKRXQYgEJdgIM1juZcBI8S372R2os4pvBKdh3Q
         h5gKl5Y05HPUySjqs+Joe5IrO4ii/6KD1cKYvsHjNwVsZL/FayWwgjjS2qfDOFLJB4ON
         A4ig==
X-Forwarded-Encrypted: i=1; AJvYcCUAekIqz1A9X6txPd+UxMlWQnbikJNczi2qlbtMUWJbBY0bU6bEe/Fmprqce9LNhdhtJMs1lrh1LDOHA2dxlw==@lists.linux.dev, AJvYcCWcrnSPhrj6nXHGiJdyJBO7Zo2RvAYddR0/9PGbZSEdjEws4aVcD1kXqkRgwl5glRkD7gwHA/JoVkznlE7p4b9KuXbaSA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy2hGypno/F1fs5LcccwgCLkfA2vPIYxbsOXR7jgMt+guDLRckQ
	t6tXelAOa17jie6fIGg8ZD8hRAyJ/IU/IAqgHlV5SFFkG/qS9RWcG7HarCOta195iGjSTux/f5d
	ugI/GIBJ9BpF8rWCyYx9nz6MhhEDfAd0=
X-Gm-Gg: ASbGncvAf9bvZBlmPaVjJiQlLzLMumqk6NhSUaiX3rIdD0FsWxCS6aD7PAygXEYoFM2
	X+JRkgGlC2kY7X9xPVGZMC7He4aEi8uAwJBG0CxC3LBqCKTO8dLlbm0+cFE0eKCgNeeFsUGtEBT
	Ls/OGQGmGjXsS2wnBohNnJo9TZ9gF6fPEoWtqFm6ezriFk/r3pPfVNsmrHTN4837R8CLQMGnsoW
	CtrIbRkFA==
X-Google-Smtp-Source: AGHT+IHV1FOZO6uXbkwgGN6sg7ti/JeFYC05gD1OlE+HgiaqFCp2b8NgXZyaJzEa/fHMB5YZYgcVeHujYfx9w6/LZRM=
X-Received: by 2002:a05:6902:128b:b0:e8e:e44:36f0 with SMTP id
 3f1490d57ef6-e8e3147a230mr4186168276.2.1753941586965; Wed, 30 Jul 2025
 22:59:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250712191325.132666-1-abdelrahmanfekry375@gmail.com>
 <eb7fd8f3-1d6e-421f-b5d9-f9e2d2992da5@suswa.mountain> <CAGn2d8Mkfdmd3Td3aKQwaa539nMfL0rmJ5d6tLr9A12HSkCUzg@mail.gmail.com>
 <CAGn2d8O0TMqBR0wvBVbWzKKKqQyLWzn9Rn-8bhYTC6wR7-HwcA@mail.gmail.com> <2025073142-unwarlike-shining-c534@gregkh>
In-Reply-To: <2025073142-unwarlike-shining-c534@gregkh>
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Date: Thu, 31 Jul 2025 08:59:35 +0300
X-Gm-Features: Ac12FXyj7e58j5vXnodDMSrmXuhb3ICXzfvYlPPqgKf27RAemXdLC8KbtxQ5lnA
Message-ID: <CAGn2d8O_OpgKP1_JO4Ha1jFx8_Yx_w1P-5_dyWwLYHD9mVD5dw@mail.gmail.com>
Subject: Re: [PATCH 0/3] staging: media: atomisp: More Cleanup on driver AtomIsp
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, hansg@kernel.org, mchehab@kernel.org, 
	sakari.ailus@linux.intel.com, andy@kernel.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 31, 2025 at 7:35=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Thu, Jul 31, 2025 at 06:24:09AM +0300, Abdelrahman Fekry wrote:
> > Hi Maintainers,
> > I'm just bringing attention to this patch series as I have a lot of
> > other patches that build on it .
>
> It is the middle of the merge window.  Please wait for -rc1 to be
> released, there is no rush.
noted, thank you!
>
> thanks,
>
> greg k-h
