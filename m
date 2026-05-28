Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DECE3AF656
	for <linux-staging@lists.linux.dev>; Thu, 28 May 2026 10:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779963726; cv=pass; b=Etzpo+HWmMPz25zmQP3pOe0/xVlW8TKGpslJCmWqfBgDjDoCId6eomjkJAMr/pe+OkYc6ib6v4vy8O1hmQhZSUJAnR0hvuo50jLX8xkgSO2vGXE74PBDwJWLAu5i3nkq9s1UHXmNiYCUpVRvUZRuU8BtZCkOWCqb5atVaUZVbI8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779963726; c=relaxed/simple;
	bh=MXe6/m1adBwYTlEORw/Q2sCRsFwWpRWFlxkD3XmtGUY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=diKqwSahmuIpd9BD/kYzUuVN7PCJwhkvGcgYwl/BxQPH+LoYjxbAHCbeFVn57id61/x9am6t7pNsWLEuEzlKRdX9x7kKqRfjFf2SDRjrtyo3OZLNB3NwNSjoodyIKJZmYtg8ubN3Rbss898gy7Az4cledJmwCngD5xtMtE5t41U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=gRkWS5Mv; arc=pass smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="gRkWS5Mv"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-7cb343d343fso119342797b3.2
        for <linux-staging@lists.linux.dev>; Thu, 28 May 2026 03:22:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779963723; cv=none;
        d=google.com; s=arc-20240605;
        b=jXLLuat0NRRXMPoJsYQdsNB5CBnfjw5jTFwmdzelgC/DDOhVSoDF7ReM9T3DbpuGZi
         eZrES8WnHzmYXuwdX7f22bjNNMFQ6xKldP3B3WyVpkApcsAgEAeTev1+jqnL3vDp5KfV
         IYA+9WclrhLdEJe5Q4Hj58Ia9DMqn+qElkw/y8FneR+Gs6E64lB07Crqm/Ppc6GSwHjm
         4Cb25dBeWVderwRuqE7A27HhocY2wm7bxqaPiu//u5fdCsML1zu7z2YVntz9wcM9B2rJ
         DI+pYKnzn4YhBMpEVgnwMNSHh3zTOYpE4h5L3i9LF7ykVwSMtjyPysbEjpjQAv1eMhyv
         7t1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Wd/GrZ3dwCewj0fDH+YsTtXc7Etu1moxohRG7C189RI=;
        fh=RT4JfCUc0FBxBYglaCLVkYtOeUcsZ4H/3Gsh/NdfXS4=;
        b=U1NP/1NfJa9NZ4IRUevt8UyMat7/xhzPqbS2CyNE4iYmP5rSQsmwV6Wl/RUkANdGk/
         jjUAPoBLzMYn3HI2bXcJutu6Qqx3vk3unwEegmrylQ9e3d5WtWOWHUxBmJjyYRsNMZmz
         zg4HQBGy+tZVChm9N5l0ABsnPu2jCEb2MiPR194iIYqqMghhWNXLUKb24JKvn4aBFHSV
         yA4XPy1prLm/BwSLkcTbRY+6mvQNyNGDgjLuGVFC5ZfBythy7PWAaN5vRYG0e7ED7c5r
         GFdoa2QOr5D6+4cs4ymf1/KBwMjE5zaFl+G6wixqZTxdLNo9Dsym6kCorIWOVqIgFjgg
         3hIQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1779963723; x=1780568523; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Wd/GrZ3dwCewj0fDH+YsTtXc7Etu1moxohRG7C189RI=;
        b=gRkWS5Mvo4VlNQrGj/9hjkYOGqpMj9zD2F32wCQHkulUTdYHA02kGM58P+h2aNOLLi
         r+7HDT+7hbUjuWUz7BRirNkzPfr2v4rL5Xvv5y2hmkOyps2PFioGYtTIA1CdMnrawFOI
         fh6us7AL4YJNC7AUSmF7e+enQHMsJAlJ3eNfZbenw20lP7xWWD4m6m1Taf4BaCsE3Bmo
         M9FYoIvPBFesCUR+l7z8x5nawzvhqLhYLp3mO6IA/2H9EsYuB2eW3N/iRWjSe+3ba7rJ
         QjbaO/0u4SRWKAvD8OIljiEk71dohk8kss2hEXaDb2CsDb2H05OvxUIlAD54Nt9uOeFs
         uCUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779963723; x=1780568523;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wd/GrZ3dwCewj0fDH+YsTtXc7Etu1moxohRG7C189RI=;
        b=eDosHaatbhPdnaSAbjbaA0/EuT9GCC2r3DujlnBC3z6ZmOXf1HCNJ2UZ535zENLtBS
         wg27JG1Jrkaw8T99AARr3+Wg9pHbHhrVHu/GsHfa4CFS5lWSUNOfNg2E9nKmhawbjWqp
         Cs2NiWkEeaNpKELamCQKZYGQFwQ9DoO4VLxdMah/xIANxG//1gVLcWoc24Em+w+vBaWz
         g7ZaNnr3WR2KMdBIMVcZwMC7hqt5TOwnPJabGIWNa0yR9tIUuD/CXmUxybnjPes4PSl5
         t5s8kz/ba/KXzrBKIm55P33e2agnbUc8UAw92QoVCVWLpZ3CHRdV39qRwrhCLJ1UqBbB
         mCbA==
X-Forwarded-Encrypted: i=1; AFNElJ+eF2Pb8PgJrqsnXZxZdoZN9jlHbVWECG1FfY9MJgh/2UaVd5yP7J9BTt5ko02f1lTOLXEluJves/bZV1Jf@lists.linux.dev
X-Gm-Message-State: AOJu0YzfoMakw+Q2kP4wRbwKQU/EiaZvG7TaBfTpxt37Ilk1voaZP2CN
	7bkHpOWltdARggmS7D7VwMFygGYamA2X/ps7Ye5nWDj29LUmCm4eEjzgbaG4OAuqInCcOe5fr9z
	m/HbOhi6GwPZw62TH3moisY3hY3ccRUA0NpOJ3adcJw==
X-Gm-Gg: Acq92OEFdYORLwSC1LZiQfsvjQl/bWMbOuPiPAv0aPqKJXoENwVL6SJ7GVyDt4GwDiV
	VHkswsqoAq33iCcBiDVUOLYDhwM4VXfg7wm89k4NNVnmdbmuxrTPJ9R2024gMdz2WljUUWv890U
	wT24IH2t490O/c4btgZx6UJPMiEldsUfrsSngzEjp7FIBJSzNzewXjfefzEv1Az+yVfVQkodifm
	zS63YmPNWcelFBdXNA7Tkhf6WGDhAEVxKblENAk5F4aVVt+lHW4w2C60Vo9LMwpljRc4pOOsNmj
	9J+BjMqS6vUkVZokMOeTY467fsR7/ag3rFxsKG8NgnygyvQqlCBYI8xFAGFHgPIdrc2lN+NHMVK
	qs7CglmdgZxGGyzjRAab1teeirxcvr6jymWs=
X-Received: by 2002:a05:690c:e04d:20b0:7d9:222a:d7ac with SMTP id
 00721157ae682-7d9222ae1c3mr113086107b3.25.1779963723419; Thu, 28 May 2026
 03:22:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260526214131.51118-1-dave.hansen@linux.intel.com> <aham35tbJEbDc1Ee@kekkonen.localdomain>
In-Reply-To: <aham35tbJEbDc1Ee@kekkonen.localdomain>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 28 May 2026 11:21:47 +0100
X-Gm-Features: AVHnY4K4usxCpRpBe2NVLGn_gRHFzwAbSJtJA5zV9bklOiMG0ROEVp_bFM-szT0
Message-ID: <CAPY8ntBFG=FzJdWjU+jnjx9k5H=pSyb9AVGiYwH+Kqu2kLMLTw@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Remove bouncing Intel media maintainers
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org, 
	Yong Zhi <yong.zhi@intel.com>, Dan Scally <dan.scally@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Lixu Zhang <lixu.zhang@intel.com>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, David Heidelberg <david@ixit.cz>
Content-Type: text/plain; charset="UTF-8"

Hi Sakari & Dave

On Wed, 27 May 2026 at 09:10, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
>
> Hi Dave,
>
> On Tue, May 26, 2026 at 02:41:31PM -0700, Dave Hansen wrote:
> > Tianshu Qiu and Bingbu Cao are maintainers and reviewers of a bunch of
> > media drivers (7 and 9 respectively). Both of their emails are
> > bouncing.
> >
> > Remove the bouncing entries and update driver status in cases where
> > there are no M:'s left.
>
> I can pick at least some of these. I'll send v2.

If Intel have no/limited interest in IMX355 any more, then I'm happy
to step up as the maintainer as we have a customer looking to use it.
I was going to add that as an extra patch to v2 of my recent patchset
for it, but haven't sent it out yet.

Based on recent commits I had pinged David Heidelberg (added to cc)
and Richard Acayan too as other potential folk with an interest. David
has agreed to be a reviewer, but Richard hasn't the spare capacity at
present.

I don't mind if you add that to your V2 of this set, or I'll try and
get my v2 imx355 set out in the next week.

  Dave

> --
> Kind regards,
>
> Sakari Ailus
>
