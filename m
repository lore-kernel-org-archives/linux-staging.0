Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E49B525D;
	Wed, 15 Mar 2023 13:13:55 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id p16so12527464wmq.5;
        Wed, 15 Mar 2023 06:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678886033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O04QzEh+AoyaOW4lRyESQj/4AhG4V6CK43IcU9VDJ9U=;
        b=k7hnGmMzZEEpac+HK4LrymXdre0VwYWwWQ1yd0/tQ4pj17iYVtl0/t+cMFRSqcyylC
         AiMENGjvTEXLszJ5OcJOYFrpBeHNh9Rkk/l7kc76q4DNdK5A5PC3I44POUEqZ7nvgyzo
         94hs67N10LwLQAuSgTGh0VzCrM/kXtfTCbI7klMAkxYcZBWGD+99ESE/lBqS6lz6obV/
         vXpsNT4K7JstWRY7IJBV6y33+refP7y+stRtY+Rt5xMeGvQ1XP8dcXkGWbQhQXhZJwnT
         Obbswwwu6g4xgEKvxz+PCPtLul2D8JxdzKRDJA9aC4VSm3tzHIxB6MLJhpEfxjYkiuMx
         dvaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678886033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O04QzEh+AoyaOW4lRyESQj/4AhG4V6CK43IcU9VDJ9U=;
        b=aJdhsKF8jvUFVN091qxwyQp612FAu1uwmVgqJ8rPjLERPZEoQmIyfWRVlEUYdVw7Sr
         sbojKC6hy+s5KC9yYT8fWwLuLQfSt5s3fWpuqJab0wa+cHzglPVZeRpHlf82oReAWUkW
         TrcT2xXeCOoYj6+7wvaNMf1HHV4Pxv1YdZyDx+SNTs37yCvOhG14tfpR/2qUcQ15oo9N
         LT2cE/Vh0amQljDjmIhIIMOLoJDr4Gd5LVrFfsX6lv4H+G4hNFa1VhteGRBHibeU6uwK
         I/myAudJQs4S+Zs+6A6+tfv3uaSyrGBPXwMLQfFRf64fBAgOsbIjJ0KEbUSvQEbBG0wL
         cE6A==
X-Gm-Message-State: AO0yUKXzJeWPQJ65FRTvp5DKPcAz8MqC5fIQRxdJfbOyv9HCf5Jnce1T
	Wxixw3YF5T4+6cgf2zeqzlPAuYgUQFPIJw==
X-Google-Smtp-Source: AK7set8F8rLltvSEZq9EtAXBFGFaLzUiOZ+bV3YAK0DAn4F9fshyVn7YYDlCA8wtyMTuX3L39+AoWg==
X-Received: by 2002:a05:600c:1c0a:b0:3ed:22b3:6263 with SMTP id j10-20020a05600c1c0a00b003ed22b36263mr11789810wms.12.1678886033216;
        Wed, 15 Mar 2023 06:13:53 -0700 (PDT)
Received: from suse.localnet (host-79-35-102-94.retail.telecomitalia.it. [79.35.102.94])
        by smtp.gmail.com with ESMTPSA id q7-20020a7bce87000000b003e8dc7a03basm1757400wmj.41.2023.03.15.06.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 06:13:52 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Alison Schofield <alison.schofield@intel.com>,
 Khadija Kamran <kamrankhadijadj@gmail.com>
Cc: outreachy@lists.linux.dev,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH] staging: axis-fifo: initialize timeouts in probe only
Date: Wed, 15 Mar 2023 14:13:51 +0100
Message-ID: <2168386.Az4OtozEo7@suse>
In-Reply-To: <ZBG699SriXWy1I2K@khadija-virtual-machine>
References:
 <ZA9mThZ7NyRrQAMX@khadija-virtual-machine> <ZBEJ+8DbhADSBTLr@aschofie-mobl2>
 <ZBG699SriXWy1I2K@khadija-virtual-machine>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On mercoled=EC 15 marzo 2023 13:32:55 CET Khadija Kamran wrote:
> On Tue, Mar 14, 2023 at 04:57:47PM -0700, Alison Schofield wrote:
> > On Tue, Mar 14, 2023 at 10:31:21PM +0100, Fabio wrote:
> > > On marted=EC 14 marzo 2023 21:43:40 CET Alison Schofield wrote:
> > > > On Mon, Mar 13, 2023 at 11:07:10PM +0500, Khadija Kamran wrote:
> > > > > Module parameter, read_timeout, can only be set at the loading ti=
me.
> > > > > As
> > > > > it can only be modified once, initialize read_timeout once in the
> > > > > probe
> > > > > function.
> > > > > As a result, only use read_timeout as the last argument in
> > > > > wait_event_interruptible_timeout() call.
> > > > >=20
> > > > > Same goes for write_timeout.
> > > > >=20
> > > > > Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > > > Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
> > > > > ---
> > > >=20
> > > > Looks like this is [PATCH v5] and needs a changelog.
> > >=20
> > > Alison,
> > >=20
> > > In fact, this is only the second patch that addresses Greg's suggested
> > > refactoring.
> > >=20
> > > Khadija moved from v3 of "staging: axis-fifo: remove tabs to align
> > > arguments"
> > > to v4 of this completely independent patch. And then back to v1, beca=
use
> > > (at
> > > the time of v4) I pointed out to her that she had started working on a
> > > project that has a completely different purpose than the previous one.
> > >=20
> > > The best course of action would have been to ask Greg to drop the=20
previous
> > > patches and then reset the numbering of the new job to v1. Unfortunat=
ely=20
I
> > > did not pay attention to how she then managed the numbering following=
 my
> > > observation.
> > >=20
> > > What would be the best course of action at this point?
> >=20
> > My guess is that this patch gets ignored because it has a lower version
> > number than a previous patch.
> >=20
> > Take the feedback given here, and rev to
> > [PATCH v5] staging: axis-fifo: initialize timeouts in probe only
> >=20
> > Be sure the Changelog, below the --- explains the journey.
> >=20
> > Changes in v5:
> >=20
> > Changes in v4:
> >=20
> > Changes in v3:
>=20
> > Changes in v2:
> Hey Alison!

Hi Khadija,

Please put one or two blank lines between the last message you are replying=
=20
and the new you are writing (exactly as I'm doing here between "Hey Alison!=
"=20
and "Hi Khadija").

> Based on Nathan's feedback I am trying to recompile and send a patch
> without any warnings.

Great!

> As suggested by Fabio, I am running "make w=3D1 -jX" command to see if I
> get any warnings.

I suppose that "w=3D1" is a typo. The option is enabled with "W=3D1" (capit=
al=20
case, Linux and all UNIX-like are case-sensitive).=20

> But it is taking a lot of time, is there any way of
> speeding it up?

What is you choice for 'X' in "-jX"?
Did you try with the exact number of logical cores?
Are you building into a VM with enough logical cores?=20
If you are building into a VM, did you reserve enough RAM?

Please read carefully my questions above and try to understand your=20
environment and reply, so that I can help you more effectively.

> If this doesn't work then I have to follow the steps to reproduce in lkp
> mail as you said before.

The steps to reproduce will take your precious time and use more resources.=
=20
Again, try to respond my questions.

> After dealing with these warnings I will send a [PATCH v5], following
> your instructions above.

Sorry for inadvertently overlooking to warn you about to send a message to=
=20
Greg and ask him to drop your first 3 + 1 patches. Now you are doing good b=
y=20
following what Alison suggested: send v5 and write the log of revisions und=
er=20
the three dashes (exactly how Alison explained).

> Kindly, let me know if I am on the wrong track.
> Thank you!
>=20

I think you are in the right track.
Let's try to speed up your builds because you'll need to build again your=20
kernel many, many times for future works. =20

Thanks,

=46abio


