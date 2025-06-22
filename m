Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308627262C;
	Sun, 22 Jun 2025 21:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750626381; cv=none; b=NULt7aRKVNft3XcllQzLydL60ymtzHcXoHOJS1cG6retubbZbbVLGOWvjSWg6RQp/IZZ0hFENH1rdTHeXk9aKvQHlcX/Op2Y2T30JHMjVlX8EoEX9HTqnb3rYw1a2+CAwFaEOItbRY1/2Ms0HNGRGwx45pBPIXI47vyIYsEogoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750626381; c=relaxed/simple;
	bh=NWzDGpNRKAx5LTZPPv+zsQaAeKN6TjUwwcjut2zfsDs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lKdpInf+OmRwyMyV40hNeY/GYUHol2BPlxrfqCCbVNJnEzgJD6Nk82rQKNkl9NFIABpYpC6YN3+Y2QF8JHTDjQtVZ6NRwbYKeASMdZw5wzr2YmZvnOlycZYws61Hdtkt3AZC1iYKZlDUZoCX6IzXLCzamg0xWIrMzFdGapHJLOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pxvn51aY; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pxvn51aY"
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e81e8321f11so436662276.0;
        Sun, 22 Jun 2025 14:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750626379; x=1751231179; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NWzDGpNRKAx5LTZPPv+zsQaAeKN6TjUwwcjut2zfsDs=;
        b=Pxvn51aYqbx/wLH6EJp4cG2ceUPD3h0vWzfdBv1vR3MyNPsYgXs9guiGcph2+FXv9L
         qQFbSRcHnt1NJmjWejwKm1cubHSKAzb+Py8zbu9zOd1sqIBA01Z3P3a+nlVb/LZ5Noo1
         QuJQQLKdRMUKyTpQ4DB+uo6N/NNbEfDBeqPHGcaCsobspEeB2hkdIlw414xUrgwgHm/5
         zgfufpDRUpamtrBXIPRSQU+tH4dsu2ZuaHDRzTun0JIkT9alPd2wrVy7+WY1ypoqstwz
         O+KGZVTTCrynG7JGYqSJmk3FnjyFEyCvExHkqMrXvPXevVoeOixqDO6Xs1BoCD2Uv43A
         0AmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750626379; x=1751231179;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NWzDGpNRKAx5LTZPPv+zsQaAeKN6TjUwwcjut2zfsDs=;
        b=K+dxh4mYehWozRrNovggOfApypd95SQTVz/bqFLBd8zAS2SuOgpioMz9nfK8Bn1goz
         uyK+IK2YNOXcijqv9mazt51YmUKcmbotSSgOhn4FJMkOIP9j2JKFPbqaejrBspUvu/CP
         POMUZuLedsQhM5/kJkOkRcA1erxhzL/zoOxh1l7arhHWm0a+QGziiY5tfi0QA8u5+Nga
         w24U45JgIC7xo1Rxa0ctWZ7Fits/Jy2Y4fi7MFkq8u9GYU+CdfPYFkiiQLTha+N6uHgW
         3Cp6bfRcZjoi1XGRl2jjXgASG2yR+1RnFVD0KhY1T+xYPQTXPJnOztbVfKAFcUEaBzSS
         O1fQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrSbbYt2eZC7YR3G4aFYzz4DbaX8sLVCOj8SXrivNqzkpfO3/2dBj8SKJrDGeA7s9Ol0+/cQOMR0f7NeiFLA==@lists.linux.dev, AJvYcCXPANX1cFOR818A4614yWYlalCbzCm4lSEIsneLHfm0CFXK9SBaZR1ScJmHfvuY7PuHEibkBKXbcFZYLU4isefHiPVx3Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YyFXoBq9w1EwjDb/bx/ld+eaWt15y0SU3qwlmEZ1XdjZnKur4Kg
	1xhLKXf6sPk7KmEOX1kypeN6/rqrYost/Josp1zGFs54Uamx4ISQbpv/Lq/LrF1nvvxcwzoMZ7G
	Ode/dkPTlmTlQGBO7RZx12RyTNgGINhc=
X-Gm-Gg: ASbGncvFdsHCL9sdAjQpAMnYQF3u0irNWIqKU/QUDdAwd2yzjWxbAr8o1xai0Qf5CqS
	MkrZ7rcHxTZB65qcpRvim/x/75vR+emvLooZlFCcIHQeFrlw06mtsYuqNCVah3H/LzOZwhMUsZy
	2uk9VGEWsZ1CLTgncUr3ycIgDjqya0tStSnF82GHwyqQRI
X-Google-Smtp-Source: AGHT+IFGrqBN/2R6ntMvJfxc6o4I97fmHwiONrNJOzkLPDItxQYsP9dIxzwq0CFddIgNcyu3n3mT8YG03yCt0yae9ts=
X-Received: by 2002:a05:690c:4d42:b0:70e:6261:f7f1 with SMTP id
 00721157ae682-712c64f59e2mr71429197b3.7.1750626379016; Sun, 22 Jun 2025
 14:06:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250622065340.184048-1-abdelrahmanfekry375@gmail.com>
 <CAHp75VcKQGvcgv+72=9CY9yvvmzTDUaiP8xZZzQCyd553_tqYw@mail.gmail.com>
 <CAHp75Vc7=WYeay0xsvVd5NZ-mm+WdU1LrzzFAE1GrdpzH2JjEQ@mail.gmail.com>
 <CAGn2d8M9_NG5f1gpksdrMkUs_0Q2LBS=qAZeAciF9-j38Nq6Nw@mail.gmail.com> <CAHp75VeTbMORBBd0N65w3m4nZ8s6GUKaK8u40P_+Ki8yPPyCxA@mail.gmail.com>
In-Reply-To: <CAHp75VeTbMORBBd0N65w3m4nZ8s6GUKaK8u40P_+Ki8yPPyCxA@mail.gmail.com>
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Date: Mon, 23 Jun 2025 00:06:08 +0300
X-Gm-Features: AX0GCFun8UdhqvDtHP3vM1IGjNHE-0ZTSOfl74h7mVd0WUwZRJgKG90DamOkZvk
Message-ID: <CAGn2d8OrqEqZnkENHau6b75WqpN9V_pG1kJChMEQvwQOa40cmA@mail.gmail.com>
Subject: Re: [PATCH v2] staging: media: atomisp: Replace scnprintf with
 sysfs_emit in bo_show
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: andy@kernel.org, hansg@kernel.org, mchehab@kernel.org, 
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 22, 2025 at 11:52=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Sun, Jun 22, 2025 at 11:42=E2=80=AFPM Abdelrahman Fekry
> <abdelrahmanfekry375@gmail.com> wrote:
> > On Sun, Jun 22, 2025 at 23:39 Andy Shevchenko <andy.shevchenko@gmail.co=
m> wrote:
> >> On Sun, Jun 22, 2025 at 11:37=E2=80=AFPM Andy Shevchenko
> >> <andy.shevchenko@gmail.com> wrote:
> >> > On Sun, Jun 22, 2025 at 9:54=E2=80=AFAM Abdelrahman Fekry
> >> > <abdelrahmanfekry375@gmail.com> wrote:


> First of all, it's a bare minimum, which means that you should go
> deeper into the code to understand the issue to begin with. Second,
> the comment should be put in the proper place. In the code it's
> useless as it describes something that is absent in the code for odd
> reasons. Talk to your mentors and ask them for help because explaining
> more is basically doing your job for you. And IIUC the purpose of
> mentoring is to make sure you learn something and have acknowledged
> this in practice.
>
Thanks , i will come back with v3 with more explanation and details.
> --
> With Best Regards,
> Andy Shevchenko
