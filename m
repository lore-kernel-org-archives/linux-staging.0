Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F4E390219
	for <linux-staging@lists.linux.dev>; Wed,  4 Mar 2026 11:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772622563; cv=pass; b=WKUSxjM6SL2bi/YsSfYE3mbskfACTt0483YqNg0s5NnyqqTpwfTBoYI2jZBcxlpJYK4Homg92T5306QRVhwETcnQH3rjE9dPQbjZqe+IHAg8s2Ii/dxtj2mXO8GumNvZ2OEF5Y9VmFs/ZLnij+rvaToAiU1mmL/TNClHRX2Ql9U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772622563; c=relaxed/simple;
	bh=y4NQJAZynNNf0JBYelVG2U1QpNmcWPfMySRNjhmFsNo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UdPh1SzolFdmkBSP1RTv2gwDnoVB+SMjf4eqqtA7TbqX1ITIWQGk2OHwjPNEBbXqczmhgz7l8HaqiI2Ze0ZoeJ8HtSNhM2aCIyXc+8yKVdb6hLXtXhRD921szgSZw+IZ2L7xd5Jcu8HTIULzlCREZgvNMFo1yWd0a1N2uTgyY7c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KR67t+/Z; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KR67t+/Z"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b935ff845c8so864610266b.2
        for <linux-staging@lists.linux.dev>; Wed, 04 Mar 2026 03:09:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772622561; cv=none;
        d=google.com; s=arc-20240605;
        b=ZghZW2CO4dkU3fLBOXPiWkyEIyRojzDv/sk+sJdeucjNNAbxoIpwjXQxQg/P5vTHd6
         5zYA0osu3rt65jyHmPMYd4T982W4t9UhLyw104wYTz46mvGWyG/O9GsvLViCOGf3EYX0
         K7PXhu26Seg9HR/GM2jsNJE6FhYPbPshZ7HywtovE86y9wB3GzE9xN7CIxDMC17mxoC5
         V7CkjODm+l3fRWpdKVEXX72DUcsVio2wSimdyiehm52lVA5htotgjAfYMvZhSoC+8pn+
         Qb83Q93geIeSxb4UVfEh5Qcf9bMMEkAYL/nfzMYHk6r0KhFVComD2HoaoGbjWomN7GPK
         aqtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qDo+rusOHseiN3CWJfYPtdU0M1v1VMbfGCkkCjhmH8g=;
        fh=h/9gAxsTYqTJRn/Q9bIdeJ5uWvPeMSe1ACqH4ol+/5c=;
        b=UIukDg8Mdc/JRCYltUtVrKPswdNOsNE4Hacso7GshcYa8lOt1SBInsRlbDSVAjgqVe
         3r++QPie11pH0+N8UMVc9ddWlsDLsT0XU9csqCwnCo+LE78LtYRqN61i81eoMXnp0cNv
         1NfPE8I/pldx8ZTgHdD8A//8r3BjgAKLfR20OEFBZ7BTXxqhyoHxTDn8CCrkg7tY1NZX
         3Eof140czm3Y4pIiXdMy+VD8CvY+x8N0ptpBwZ83HQ6pjOTtvZBfZ7RR76jpZdL8ZUUe
         /3tUC/rYvmHtbusM4dTnBzzBEo7qeBnVTzE+uYEUOypmII2fVV7cPV7Hzv+mAf5LYVG1
         G4/Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772622561; x=1773227361; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qDo+rusOHseiN3CWJfYPtdU0M1v1VMbfGCkkCjhmH8g=;
        b=KR67t+/ZSLMPPyCj+RsuvyvzdjUTNzDgIAcWweMbugbGwRxpZ0xiZva1zZkff+uOt8
         kTqqo3lJ+Dsag4vOz+AEPPCQOJyfXNgn7XSDXhFQ8Fhi3KeYFdr4MaYv1tN7gvsg/tUA
         R3II8UIZGffWWfGXfMDGRIBhrFbZs/crV4KjJE4w++cWR7LQXjvMRsGUJcqwXO54Rz2p
         NbSMoOmP9eesl1g84ZQAmFhdnK3jkddP0XJiVA71GJdr5vrQDp+lfKW4nDIqo2Q5n2ys
         92TG41VECilu/p0IWMMNJa8jf3ux710xOMRBTiH3I4GdczoZ+OEan2Sge1IXj38GMOx4
         D6TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772622561; x=1773227361;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qDo+rusOHseiN3CWJfYPtdU0M1v1VMbfGCkkCjhmH8g=;
        b=df6M0LEdbuCrg2JAxFSprqVRjx2QnN9RLn5tQTiDgVQn34wgHj8eacmSzq3l3iPO/u
         gmAMXjTrojjR2i5wgFM+WL+8Mez7oYx/DyJ1Gj+TTZCgz5EiSVA6RCAaaId9XNcFCdrl
         aoPkY0Qgctx78r9igovsXXsMC/QSatPN3GEl5JTyKSKzBXHXuNBdffJGfArAL80zHsot
         mFW93D2f8XlETadfDBQRrtjphDDiuqayA/sx/blCNQQDVFGdB3NS50qoDsv4yjrKVEHb
         IMXr9EgjdIxktOIsMgMInLoRGOSya8I42/XI/BzfgBlcg6P04mCXs5iET1bWl/1BH2tn
         sGbA==
X-Forwarded-Encrypted: i=1; AJvYcCWKf4EkabnQl5vqpxb/Zgnx5kaBmCLXuH5++34S0ppcj6Ko5F70VVD3bNjV2uUHCpQg10AwNEvj5sNXriPs@lists.linux.dev
X-Gm-Message-State: AOJu0Yzq8SiP8wpRfbzkZvpxyLopVQh5vQ0VB+gQ3qw69KE25TJ0i3Wd
	vQnv9fmk/4EW4OxJTfxAT1VLnVLcZRlfEooA/FKvIDOTSsjc3SFGHHxUqFo0OWCuCR6EI2/1/TV
	uwfNe0WeU9w2RB/AiWXvQOf3Yyr/jtm4=
X-Gm-Gg: ATEYQzwCJlCCQhtuWN3GO5VV80bULlKueceSj01H4/oMPVNyvacHjLo0stEfhvzp1Bb
	s+6Q7ed5aeDTE8ZMhCLUO1rT2gCvqi5qWnVEm/yCFlEsjWAz4pPGqj4s0zKOi+d0zbYE8GTnjSx
	vBm38FUMDwpTP1bs8a8gRKop17/iUFH7KDzN9++Apb64smS+fVJl4CDr9MpvKDnLLenS9Jogu7p
	8orZCQ9JX1fND+XZC5XmIkms84yvi3Vipj36g4XvKngG+7i1yZm+9q03eyho+gr6ddV5fVY5m0D
	ScM/zpjgr2LUSeFKchyPNqtX7+gErLgW5fYv+isI+sap05vacodbfi9CdHKVw18i7FRYJR8Hva3
	axvCy07s=
X-Received: by 2002:a17:907:9611:b0:b93:8995:8f3a with SMTP id
 a640c23a62f3a-b93f10f83a8mr106274566b.3.1772622560728; Wed, 04 Mar 2026
 03:09:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260303083501.3886922-1-sakari.ailus@linux.intel.com>
 <CAHp75VdaYxvQ+tx51WDPFYSzFOSWqHqFKB4xaNTOt-rx4O9CPw@mail.gmail.com>
 <aabfJEGDJGGP49bS@kekkonen.localdomain> <aabnORpRlVBN5_aj@ashevche-desk.local>
 <aaflMrn55oP0_3JJ@kekkonen.localdomain>
In-Reply-To: <aaflMrn55oP0_3JJ@kekkonen.localdomain>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 4 Mar 2026 13:08:42 +0200
X-Gm-Features: AaiRm52XTxnjTKPIb1ZKzzRRCWvSNzvGCpnrIZFqF8dYHbmYnHOF8kZ200l94nM
Message-ID: <CAHp75Ve+ntMquDiG12Qoz5HwQPVceXQHzo3ef4nJT8ep22Q=iA@mail.gmail.com>
Subject: Re: [PATCH 1/1] staging: media: atomisp: Disallow all private IOCTLs
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, linux-media@vger.kernel.org, 
	andy@kernel.org, hansg@kernel.org, mchehab@kernel.org, 
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
	Soufiane Dani <soufianeda@tutanota.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 4, 2026 at 9:54=E2=80=AFAM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
> On Tue, Mar 03, 2026 at 03:50:49PM +0200, Andy Shevchenko wrote:
> > On Tue, Mar 03, 2026 at 03:16:20PM +0200, Sakari Ailus wrote:
> > > On Tue, Mar 03, 2026 at 11:21:02AM +0200, Andy Shevchenko wrote:
> > > > On Tue, Mar 3, 2026 at 10:34=E2=80=AFAM Sakari Ailus
> > > > <sakari.ailus@linux.intel.com> wrote:

...

> > > > > Fixes: ad85094b293e ("Revert "media: staging: atomisp: Remove dri=
ver"")
> > > >
> > > > Is it the correct one? Driver was before that, so I believe this ne=
eds
> > > > to go deeper.
> > >
> > > Technically yes, but even this one is from 2020 and the patch removin=
g it
> > > was merged in 2018, for v4.18. These aren't supported anymore.
> >
> > It doesn't matter, the Fixes should be correct one, the Revert patch is=
 not
> > the initial one where the code appeared.
>
> Both patches actually separately introduce the bug. I'll use both Fixes:
> tags then.

WFM, thanks!

...

> > > > > +       /* Disable all private IOCTLs for now! */
> > > > > +       if (cmd)
> > > > > +               return -EINVAL;
> > > >
> > > > Maybe even a warning?
> > >
> > > That'd be just filling the logs, wouldn't it?
> >
> > dev_warn_once()
>
> Would that warning be useful? We don't warn about other unsupported IOCTL=
s
> either...

The question here: will it be helpful to speedup / motivate moving
users to the standard IOCTLs? If not, no need.

--=20
With Best Regards,
Andy Shevchenko
