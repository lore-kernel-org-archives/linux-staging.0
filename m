Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5701A44D693
	for <linux-staging@lists.linux.dev>; Wed,  1 Apr 2026 16:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775059388; cv=pass; b=ax9924aFMvD6gjyhFWHtZXFBs77omh9A2EZlz0cVcOa92NDnpeRROMIvUiNhwFIAC3mCp/YYtQfqlkmmYvzkTsqF7oBXBa7dC9jO65sT9pDSpx90VwZrBzTMTM2ccrabG5U9+fbfcn19TeYiXi70K3QaRaWpDyoXGqdptHiWr08=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775059388; c=relaxed/simple;
	bh=BlFbgD83On9yJwJTCrqpyDsa7llGSgZ8ZbMiF17c/SY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=knhugCXn5Bz/4iTZUWlsCebE3zGtOx9ThQZ84Tu3uzjcoALI8NV3SUIX46WuEnVSva4nCev7rN+igYKp3WSDD+h5V90zE4n5QCpWap88/rE4TC9Lax1Dk2F5G8rUP79TB7LYhl7toaiGo06Is3BW7Pbs4oDHnPh2eklCDJ+XgbE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AE8Xg5Y3; arc=pass smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AE8Xg5Y3"
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-604f834349cso2030120137.0
        for <linux-staging@lists.linux.dev>; Wed, 01 Apr 2026 09:03:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775059386; cv=none;
        d=google.com; s=arc-20240605;
        b=YbcMzWUcHpkr1m0OkMpLa6eg1agHg/JLICspwrkmcXMYHvzIC6r7ztwEua2UBYHlKu
         ShNH5d3xp0DVYKKrvldgRretqiaqhuAPJdzHK5ss0sDUZROrKKGRK7/LL6d5OxpYYcNf
         vsn9/uycODYd3is5C6qT4vwk6Fev8drQ5suVY4F2KnAppBuOqhOPtLCSxSSIDiRvfShy
         qEOh3nv26KN9okfccGz4SvxCUT1yhl65448ky1fkc1pFusDNbSVw0xCiliohQ75yceXy
         enFH4RJ1e+BysTRxUTOcY83kYShc8ma/iN9TOGRGx4ECP+oJy57IZVcWb/28hvKDtQwg
         ZkZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EWBm097o/NmYsuE5hv1aBoOkjyXB23DVWkezN42y2/A=;
        fh=fr26/m5/NvWpssWaPFQMhvXgcL/uxDQP+AWlnEdEUPQ=;
        b=HSGq6z7BRPBCbBQ5OaTbVqWNIz2k2aYHHzHkP5JNyTgZFxZiX/EAww8WBBB/G7xvfE
         RQNIGUskCZayLIdzdEDi54Iz6jYUvMh/h2d4qBJRKpLirjvGcdTSSF8gqINRC1LXcEB4
         QWkDWXeMbWlAhDkgOEj210AJS1XNBlF7mbPMlkhzE8nD5ZCzJQ5zQ4oGjREnDo/wj9CD
         BDjytbvc7i2gZFsk5O+Seasa7UPjAz6uP2jaxcUlL3ngCIN+ikcuEoB2XrnYIx1Seo0H
         8vN8CLxnMkCPR0EaC2ngikRop2bPdx/xnsCBktbXPUf0JT39V8iXz4+DfFtCiLT/LJIh
         /wOQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775059386; x=1775664186; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EWBm097o/NmYsuE5hv1aBoOkjyXB23DVWkezN42y2/A=;
        b=AE8Xg5Y35V7b1mAwZWsX7WZXisVzCejAYNO8wDJ+ixre3O3fwjQAgVDPHeJP21fILU
         X6A++VXVBNFqbPLxj6EiwRMGXOaChFacsWWh+TXjMU/aD8Y78vEqh7jm17dqz/Z5TX8Y
         peA4RagZqFaE6GZ/AjzJzn9nNA+YsiqPNv5BayHS3CnUxKApCEHKnIwgSpu9dV3hHgDM
         +kBRpfeIxjQ4c/A05hC5wbJVD+bSqo02FMiRP7oLHD1OuVTn+fehyXsZIbczWWEXpuS8
         4zMi/P2AUkfQDXtbx/YS7BBW3oF2y97VUVFIsHnzc4Czh8k6wnx8q+hnkLK0BITBOCU/
         TuuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775059386; x=1775664186;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EWBm097o/NmYsuE5hv1aBoOkjyXB23DVWkezN42y2/A=;
        b=kY7d4MHiSNwKGk/qTUWoUeb4pQE8EF1r4egRyFIEy1yHGUMxsWGeMj/ZmznESSjb+6
         i+dczBjwth5am1lpAycLgcWm0b9Jh2kL3gyKnw6HxpJx0JCcR6FF4u6LA6wYz+gxSfAH
         ploWlBCpPfcdNK2Jw7QHtkDqn2egT4ZoZRMHLnHgH3MjH8QqM+s2lM+356TENsfOKMYl
         yu2cr9VBDN8yqiUc9FLKHQk1lurbf8nNIh+lnldCgUB0I6ZG0IRd+SzD7lXbN5Zydh6K
         xMaz1jO2ifNjBk5bcXoHbv6xxGGfDalntfpvz8NcCuNV10UYaPMu6ip3c7ElAGt6UFA0
         1Q2g==
X-Forwarded-Encrypted: i=1; AJvYcCWUsMsvmRA0pB868LFmpcmOZhqbfNn41qzlumrupi4ElfmpUjcSzBlht3tCHRSsg7fxV9xeG4F8cp0IOwZ/@lists.linux.dev
X-Gm-Message-State: AOJu0Yxao8ZL7WBRnBXNrKIILw9wIp7f5b/nXl0dtzHdOoWAICstKQqv
	WwW7f3gMyTMv4f8n8rLhowEsGdmnMW7mg1Xq2A+nkCRvNPOpWbrvBXsED4iyV4ic+CASE/ksOPL
	+qGAMHP/FDjf6ue7Xw5OiXbuq4RvNEuQ=
X-Gm-Gg: ATEYQzxyzkUag+Hsy38ly1mUan0SsaGbIi3BlFiuVgF2WgEh1uyaAFQ6ywT2bX8vRql
	lN1r8S9iv2O4m2h4tnZmyzzBcB7rAFfZXOMguo5kWrc/EwJx5dI6NaJ5qrzNwcH9p3r5AgI2Vnw
	HIekMT+bsAlgb00xF1vdgIrx8WCXXBcd9aqsxzHE5qhp1NwL7yskl2NVM4VTOfwQscoP1lYP3zR
	BsXAHtN1IcE77YVdn62qRiGzT3PZmpCo9fWUz+5zavu2b9eFpPcGZ1NHplkRJyMP6E0G1F7ilzz
	Kw1Z5uSw
X-Received: by 2002:a05:6102:1612:b0:5f5:4055:4558 with SMTP id
 ada2fe7eead31-60567d381a0mr1586750137.2.1775059386272; Wed, 01 Apr 2026
 09:03:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260327031106.10386-1-anushkabadhe@gmail.com>
 <acZo5LUXH70-UKUi@kekkonen.localdomain> <CAAfE=nNNxCKv0JoRcib7YVQfQ9MxqE34WyYu2GHNYaroxzpw1w@mail.gmail.com>
 <aczBS_KJQa_j97RP@kekkonen.localdomain>
In-Reply-To: <aczBS_KJQa_j97RP@kekkonen.localdomain>
From: Anushka B <anushkabadhe@gmail.com>
Date: Wed, 1 Apr 2026 21:32:29 +0530
X-Gm-Features: AQROBzCynCEgVXuUpyeXfY2mLkrtfTBAwk9eRsCwaRHI32FliuaMQyv840YyuW8
Message-ID: <CAAfE=nOs9YfpnFGY+bPg1WPxuCHOzkR9oHD9DizNxxse25A0hw@mail.gmail.com>
Subject: Re: [PATCH v6] staging: media: atomisp: fix GP_TIMER_BASE scope in gp_timer.c
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: andriy.shevchenko@intel.com, andy@kernel.org, gregkh@linuxfoundation.org, 
	hansg@kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, mchehab@kernel.org, 
	Daniel Baluta <daniel.baluta@nxp.com>, Dhruva gole <goledhruva@gmail.com>, m-chawdhry@ti.com, 
	Simona Toaca <simona.toaca@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sakari,

On Wed, Apr 1, 2026 at 12:25=E2=80=AFPM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> On Mon, Mar 30, 2026 at 07:02:21AM +0530, Anushka B wrote:
> > > There's a lot to cleanup here, but what should be done is roughly:
> > >
> > > - Make these constants macros (with IPU2_ or ATOMISP2_ prefix?) and m=
ove
> > >   them into a separate header (perhaps with register definitions?).
> > >
> > > - Remove my_env and make struct device (or maybe struct atomisp_devic=
e?) as
> > >   a parameter for register access functions.
> > >
> > > This may get a bit complicated due to the amount of cleanup needed so
> > > having the hardware for testing would be rather essential.
> > As a student, I don't currently have access to the hardware needed to
> > do the bigger refactor safely. However I'm happy to fix the comment
> > formatting and language.
> > In earlier versions, I had merged the split declaration of
> > GP_TIMER_BASE in place in system_local.c before later moving it to
> > gp_timer.c.
> > Link: https://lore.kernel.org/linux-media/20260325132434.55775-1-anushk=
abadhe@gmail.com/
> > Would it be okay to proceed with the simpler in-place fix for
> > GP_TIMER_BASE declaration instead?
>
> I'm fine with v4.

Should I send a v7 similar to v4, where I merged the split declaration
of GP_TIMER_BASE, and a separate patch for the comment fixes?

Thanks,
Anushka
