Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486142110
	for <linux-staging@lists.linux.dev>; Fri,  8 Aug 2025 12:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754657264; cv=none; b=Js6uwEtAk9cz2KCXdVJZUXr92XpZsXGlEm0OvkOFuZG3/QD1v5Z/MB1D7Mr0nVy5sa10+3JxmdXNsBgKcJYAyNriEdAjdqe13XzWQ6NhMC3BW9zSQFP2glRKRqClGeBduDHb39sFk3Yd+PlEVz5JYr8GY+9RYWYVcpyjSAADQiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754657264; c=relaxed/simple;
	bh=DMRmtI5vfjflBWV5IYbOF8or8OWG8tHzfN0UjAlhblo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jto6mJMr0XKj1cb/GUXQ6YrKowpJJinGKq9zu25XLgoY0ffNipyKPCuvLB+0GMSQHpy8i1ATiI8Dowm5NZfbA6YoEN0+LK3jtqwStfogbOJ6e6sz5m4wOjbLOtU9+3JzEkIA7swZXThVW7ZLt33Lpr4ISB80YkwemxoZ7o9uVG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QLemmYzN; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QLemmYzN"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-617f89a3dccso74385a12.0
        for <linux-staging@lists.linux.dev>; Fri, 08 Aug 2025 05:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754657260; x=1755262060; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kL5wSCSzPKKT2qv06rDW308qSqj4y5bPXidLbR3fQVI=;
        b=QLemmYzNPiSaPu2oldxgWj/izn2mMj45KfddG3Of45C9GlXfSSacRAxzZoQHDxVghR
         9C9h7/s3OryXLAxprqUMERiYe6A/gM31Y1EmSAmzsOwQFtWyTzfMa/Aadb4pli+LOOqy
         w0QWTqoKeG6CnAjcncgFsndMpcmuzMP30pWBGbi4lY1+V4GqA2cEEkL72/nAL7o4hEPz
         6PhMDg7Fh2Qt+tMZy9aJ6Ac5NIoO9Fer+ex/FwaSVpNC2NYtJ3Hq4c8ywBq2mnOBt8nD
         9n1MTgBN1PfESik0Zl/Yy23hUU5W/9eirhnv0PH5bWpodl1viT16LdXgVkre5xiWHme1
         JOaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754657260; x=1755262060;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kL5wSCSzPKKT2qv06rDW308qSqj4y5bPXidLbR3fQVI=;
        b=voKVOerRGL/9gUVzBbKvh8/3h5XtiYcpboLOxWCR/PnHBpQ5azeolaQOnFzvrzoRcU
         GlQKgXJ3Tv2FouTWiSP1wWpdViRYW+d4wzuAxuf5kQuLNnvBq9wmITXXBpyMBxsTvb/V
         Xjg4PgDqrLS51+KLrw01pqw3f/G8lTuAaLBhxr55yG5ifdiFBVXZmDfxHn6TZjVJSvfP
         2dWAWUuSRBBvbAs4gqzRMIXR/Aux8SbyWa41AF5jj66WZvCfhM3OJByMC3cWhEHAG2vn
         F9Et/Jb/H9BUNyIlNElbQ2M7Y4Kqjze4DF8DxYZdaxCcc0P1nPsa3s5iO8a03V/ZO7eE
         P2ew==
X-Forwarded-Encrypted: i=1; AJvYcCXvL6aDalhFr8vqFyOqpNKkL4PU5tkPMlO8ZG5hsFax8MMPT4ccqgUR0G2m4ZsT8lLETKu+5NHRwaIVWDx4@lists.linux.dev
X-Gm-Message-State: AOJu0YxZVxDMawWqr56CFQy2lp700pLEjHd0+EiKgDig6nBuS0NTrlax
	4sVH+oVvhBEZatIPp2aqetuaqkvIrLLoQwCbpLS1j6MEJp9l4f2vk3rZ8x1cJlq7N36fdlsh4TQ
	F3kL4ETtxMveZwZKYk0oyUsC4edDDPYM=
X-Gm-Gg: ASbGnctadNtMRDgG6L1ZDqrnIfp3kzS3A8E93GJx0CGuBuGscJ8xZ9YV+k2s/KzPT9e
	avp6g+CbRT7No5pyDFtDvr8qRgj6sfbbKtAtV+RHWrQCWKxepabqEko+sRiIeVbw3eEn1h3z04y
	dvWFHlK7w+v03mDewFAhHmqPwiwVi6nAE9kvLOQWwC8jmxO+Al3GFQtlX1KGLSJdi3rzbfDKrxO
	57s29zn2w==
X-Google-Smtp-Source: AGHT+IECPrqeObsCZqT5CRIX+XrgsQBeCQf5z8IXv4JXjm/KlN5U526iDKVtr4z5se/rcTQp3/WjAn386p3AX0WvqZE=
X-Received: by 2002:a17:907:94ca:b0:af9:b4e9:8638 with SMTP id
 a640c23a62f3a-af9c60797b4mr245311166b.0.1754657260294; Fri, 08 Aug 2025
 05:47:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <aIdKAJVnskdAVUMi@bhairav-test.ee.iitb.ac.in> <2025072835-singer-penny-a421@gregkh>
 <aIeDDsRurrgXqRQn@bhairav-test.ee.iitb.ac.in> <2025072808-evict-snorkel-8998@gregkh>
 <aJJ0npFx1mwJ-MoV@smile.fi.intel.com> <aJXJ8PRPNT+kgozU@bhairav-test.ee.iitb.ac.in>
In-Reply-To: <aJXJ8PRPNT+kgozU@bhairav-test.ee.iitb.ac.in>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 8 Aug 2025 14:47:03 +0200
X-Gm-Features: Ac12FXwaJ5Nfwg8ibclwjckIALyJVF9dUrO_kA13KenCYeCfF5jOTtu67n0BDMs
Message-ID: <CAHp75VeUbi0Y7DgdAcw+bwSoB4w89Z0A_muery-aCAVwaiBbVA@mail.gmail.com>
Subject: Re: [PATCH] staging: iio: ad5933: Fix implicit fall-through in switch()
To: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, gregkh@linuxfoundation.org, 
	lars@metafoo.de, Michael.Hennerich@analog.com, jic23@kernel.org, 
	dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org, 
	marcelo.schmitt1@gmail.com, gshahrouzi@gmail.com, hridesh699@gmail.com, 
	linux-iio@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, akhileshpatilvnit@gmail.com, 
	skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 8, 2025 at 11:57=E2=80=AFAM Akhilesh Patil <akhilesh@ee.iitb.ac=
.in> wrote:
> On Wed, Aug 06, 2025 at 12:16:14AM +0300, Andy Shevchenko wrote:
> > On Mon, Jul 28, 2025 at 04:23:49PM +0200, Greg KH wrote:
> > > On Mon, Jul 28, 2025 at 07:32:54PM +0530, Akhilesh Patil wrote:
> > > > On Mon, Jul 28, 2025 at 12:39:21PM +0200, Greg KH wrote:
> > > > > On Mon, Jul 28, 2025 at 03:29:28PM +0530, Akhilesh Patil wrote:

...

> > > > > > +     default:
> > > > > > +             return -EINVAL;
> > > > >
> > > > > What tool is requiring this to be added?  It's totally redundant =
and
> > > > > needs to have the tool fixed instead.
> > > >
> > > > This patch is not inspired by any tool as such.
> > > > I observed this code pattern while manually reading the staging are=
a iio
> > > > code. From my eyes, there is implicit intention to return from swit=
ch block if
> > > > no match is found which can be improved in readibility by explicit
> > > > default block returning error.
> > > > I agree this is redundant and will not have any functional impact.
> > > > However, imo - this can help support kernel wide efforts to
> > > > clarify switch() blocks.
> > > >
> > > > The motivation for this patch is from a035d552 which talks about
> > > > eleminating ambiguity by clearly defining swich() case blocks.
> > >
> > > Yes, but the code right after this does the "default return", so that=
 is
> > > now dead code.
> >
> > Hmm... If I read the code correctly it is either already was a dead cod=
e before
> > that patch, or it's still accessible via goto label.
> >
> > > I'd recommend the "pattern" that the current code is in, it's simpler=
.
> >
> > The pattern to return from all switch cases, including default is commo=
nly used
> > in IIO drivers.

> Thanks Andy for your view here. Yes, this pattern is seen in iio drivers
> including dead code as we discussed here.
> For example, v6.16: drivers/iio/chemical/sgp30.c:406-411 shows same
> pattern as this patch will introduce.
>
> hence, IMO this patch can help this staging code align with coding
> pattern of iio drivers. However even without this patch there is no
> functional impact and it can be skipped also, I am okay either ways :)

Still, this leaves a goto label and makes code not really easy to
read. What I recommend for all to be satisfied is to refactor the
function so that it won't have a goto label after the switch. In this
case it will be okay to use the above pattern and also for people not
questioning the correctness of the code. Without that done I would
tend to agree with Greg on the basis of unneeded churn.

--=20
With Best Regards,
Andy Shevchenko
