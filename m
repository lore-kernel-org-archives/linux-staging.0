Received: from mail-qv2-f1.google.com (mail-qv2-f1.google.com [74.125.230.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D773EF0A4
	for <linux-staging@lists.linux.dev>; Wed,  1 Jul 2026 08:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.129
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782895917; cv=pass; b=fxzdqWi8Qe4fcMcI7ItCro1b/m5Tz6nqDz2+mrsfgisjVCZ3eoT4tr83OrKRxzSU2MkDmTn8YKpZK3XHygbLxtmxjAD4ATU8IbLxAVdBkVoxGfwraxLrG9FfUnRDLXFy3CsnaVg6XnKXjyuZopxUM4VOsGZ1xtA6lVFhujMY+tA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782895917; c=relaxed/simple;
	bh=pFH6cNuSmlixytcQni2TC/N4wflLe2KEpz6FoIXOnHo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fo+clyT74y7bcnhPNyy4aTQOgBTMsy2YOM/2ru/JmtpfxKiRtKgyhN+nryoAo9Xi2sJlI3IXKLYezjJGviI0k+vFcKX98HgkpSXqMCLH749Uegc8VQvy/lqd8z+ft34jCrD3DuMPy/XqexbKXkvDGRosLcGNCWwDEGanTmyGlg8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g31uoBv9; arc=pass smtp.client-ip=74.125.230.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g31uoBv9"
Received: by mail-qv2-f1.google.com with SMTP id 6a1803df08f44-8ed50e588d8so522146d6.0
        for <linux-staging@lists.linux.dev>; Wed, 01 Jul 2026 01:51:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782895915; cv=none;
        d=google.com; s=arc-20260327;
        b=cNNWHz8MOl+ACK1e4t+2yNmnwPKlnVeEvCWYQDCCKMMLEruvtnRPhO4uJgr9uXgUXk
         5GYmc2deyk0GLvrxT1vUBAnjzLNvE6AgvXU//nRUdtVvSEBRPYyaUPVkPdYeWu46iFgf
         2aDAphOZPU6M/1Vs7uC8Fv1LXL5EGnV4PsEbVy78X8x0ALH4+0C0byMi7cxekxYdLe/9
         7itkto/1BZ84AXBhmxDdnF1AEIVDxtkTMYyW9AoBZTGKQX4QkVpZ/BNbUeLVe6o2O/He
         +BciDDQTvJkTOTp0uZEVjgqkliotJqgAuACx1AkIf5T25EPK9MK0WOVi7uVgBl+4tZD8
         pmJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pFH6cNuSmlixytcQni2TC/N4wflLe2KEpz6FoIXOnHo=;
        fh=E7uBbsUAiOu+jrYBc9xkyh0pLKpX+5+2cj2UpV1tpvM=;
        b=OTeWgzU55VfiDhqg/XUHxeKyS4s2gz/3ciYViznVttX2RZyCsMtcsFbmIWeSFzHHJC
         PQHSB399AzcYP5fpp7PsUVutBTt2axUfNpl0c7pYBP1mLwc2CJM1cNu1gRLjT9vkI8Ua
         jh/gO+IXg0E9WX9OH58n3LfReDk3Smq3ClDpySld8xevakgcIN5936n3x2bbD+MeSeLB
         ORuTi9D/t/lXjFjIS3uTy0n4L0Rbh0f9RX3KEmWeXcE5a/T15RW+7O+mNNC83v8qcDO7
         ZM9rzG6UXkeOgxMSdhFw6BztiDPYctnhE0y5u/9ATzlz5qXa06lnstb13JbIbfPq1sUY
         QXfA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782895915; x=1783500715; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pFH6cNuSmlixytcQni2TC/N4wflLe2KEpz6FoIXOnHo=;
        b=g31uoBv9n8QuybKv10dQcnBd1UNsF7qvtAXuOQAKAzyJRh/FNNPlmX+hVWaxOJoQBz
         E2pW7wU17/aSe2xDMXzLbd+EpOtted/JEQd7kzPyS2dK4M9YLoMKyD1OYcOn4rUq1VEQ
         ctMkpFfsEzLeuBiBLCtHnWzN7l8qoODL9CkV1sHK32rbLlNNPdB7ZAIC5M+rJgx0Gt+n
         5ZdDh4vPU5et0iBSJiEauDYK0swLB1kVCXGuHLVRDh9yKZhfOKFoRkpt6gFXHiL4VmLT
         +LfNvu6qxB2R93laAOZ14DM1RIS/3pypdJp65bX8wQuj6giuG+Cdeml1IBTwwKY3aZkT
         SBsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782895915; x=1783500715;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pFH6cNuSmlixytcQni2TC/N4wflLe2KEpz6FoIXOnHo=;
        b=f6G1gDU2gmOHOJxx37bl7AhO/Z8icn2MBk5aIuEhvPSOHs+tem72m0Bwoy9HBMNoKZ
         6B4q5yVXGaKFht3rKZ7azMOE0TFMyKQ/nv9AvI4Gek6V/BPdWQcpjCXNyXV3IZ4PJiqE
         UL1hhY50TbOBXn+vTYAVdBudVQuq+mORCxG8SOAEfwr6tnKypTJKy8v55swX/GyYe+AA
         KH803jjmW8GhyusqMaWH4VoyIGnSbAOeWysUURKpX+bAGWUqXTYJOiimQtDfXdJhS8iu
         VPYrJG8VfVCjmaQw2pOaaH5naw/6osTeBbACPAyIxWA+0qQSz9xmWCRZyO4wOElo5csH
         B8pQ==
X-Forwarded-Encrypted: i=1; AHgh+RqgG5UuYTn2CQKvwKfb2mxVfa/HTaz7mCX+1mL8hnmTww8tjgT1GNOCv7aUtq0jirEAi0mMAeA9Qo6fA5tO@lists.linux.dev
X-Gm-Message-State: AOJu0Yz2TzrszX49vI613PA85vzgya9iCuw9hb1YomystcqZWQQzVGur
	HVc5Vq91yeeoH8KFnv6dyWDeSwPc2S/hIErLHyGYBlxSv970Pxx8KIklT2QEqH+7L1wMRw7rmLx
	y3S1hmiwpIKxZsxZgjmnu7o8aZfOCWds=
X-Gm-Gg: AfdE7cmy//qSGxHFL2p1+p1tHdqdmB7e3mTevSdW+Y2I1PmoIpb3SKUbdKnQVJkKsHo
	ap3a8Ro9LHM8q35R4qer61E5HOhAprvcuoyoanRTcihdUhmhc/z9yAbqXJwYvX5zi+jpbN77NTS
	NVmaL+slvuQISwo2tCkhbRrIsywlGjlnhwtfuJvmwt0D6ZTRd1swZB+W2Yca+7YWrVJMSedLe36
	sZ4G2ic8j5ipuBA9xtrsL+jJ20osUury14k6rnrG3H5HqQZ7zKWwkgOHQQ=
X-Received: by 2002:a05:6214:540f:b0:8db:4069:6e6e with SMTP id
 6a1803df08f44-8f3c64d59bamr8214296d6.6.1782895915154; Wed, 01 Jul 2026
 01:51:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260630160435.3293-1-bohdandmarcus@gmail.com>
 <CAHp75VdX_DmiWXc_pYCgZd88cO3=yB7vFsgHx_8HLAJtaJOHow@mail.gmail.com> <CANqab03_SQFDb38wkXBMUiJ1Xk-g9_ZpqvOUo+nQyR+SsVnsFQ@mail.gmail.com>
In-Reply-To: <CANqab03_SQFDb38wkXBMUiJ1Xk-g9_ZpqvOUo+nQyR+SsVnsFQ@mail.gmail.com>
From: Bohdan Derkach <bohdandmarcus@gmail.com>
Date: Wed, 1 Jul 2026 11:51:43 +0300
X-Gm-Features: AVVi8CcHUGs-vT-SAPnhCzFIV74Ay11IKjwWBKd4L9H8eKNQ4HL746SlI2bC5AI
Message-ID: <CANqab0096R4gKrwfKF78iyQt2aM0qQJoSwrBKBqMiZxna60rsg@mail.gmail.com>
Subject: Re: [PATCH v3] media: atomisp: fix block comment formatting style
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org, 
	andy@kernel.org, sakari.ailus@linux.intel.com, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy,

Thank you for the review.

You are completely right about the indentation and line wraps. Dan
Carpenter also pointed this out to me yesterday, and I have already
prepared a v4 that fixes all of these issues perfectly. I am strictly
following the rule to wait a full 24 hours between sending versions,
so I will send v4 later today.

Regarding your question about whether this is the only issue in the driver:
I understand that sending a patch for a single block comment in a 100k
LoC driver is a very small contribution. Since this is my very first
patch to the Linux kernel, my main goal was to learn the correct
workflow (git send-email, formatting versions, acting on feedback)
before sending larger patch series.

Once this v4 is accepted and I am confident that my setup is correct,
my next step is to grep through the rest of atomisp to fix similar
block comments and submit them as a proper patch series.

Thank you for your patience and for guiding a newcomer!

Regards,
Bohdan


On Wed, Jul 1, 2026 at 11:42=E2=80=AFAM Bohdan Derkach <bohdandmarcus@gmail=
.com> wrote:
>
> Hi Andy,
>
> Thank you for the review.
>
> You are completely right about the indentation and line wraps. Dan Carpen=
ter also pointed this out to me yesterday, and I have already prepared a v4=
 that fixes all of these issues perfectly. I am strictly following the rule=
 to wait a full 24 hours between sending versions, so I will send v4 later =
today.
>
> Regarding your question about whether this is the only issue in the drive=
r:
> I understand that sending a patch for a single block comment in a 100k Lo=
C driver is a very small contribution. Since this is my very first patch to=
 the Linux kernel, my main goal was to learn the correct workflow (git send=
-email, formatting versions, acting on feedback) before sending larger patc=
h series.
>
> Once this v4 is accepted and I am confident that my setup is correct, my =
next step is to grep through the rest of atomisp to fix similar block comme=
nts and submit them as a proper patch series.
>
> Thank you for your patience and for guiding a newcomer!
>
> Regards,
> Bohdan
>
> On Wed, Jul 1, 2026 at 11:31=E2=80=AFAM Andy Shevchenko <andy.shevchenko@=
gmail.com> wrote:
>>
>> On Tue, Jun 30, 2026 at 7:06=E2=80=AFPM Bohdan D. Marcus
>> <bohdandmarcus@gmail.com> wrote:
>> >
>> > Fix a block comment formatting warning reported by
>> > checkpatch.pl in atomisp_cmd.c to conform to the
>> > Linux kernel coding style.
>>
>> Almost the same comments as per v2. Please, slow down, read other
>> comments and act accordingly.
>>
>> --
>> With Best Regards,
>> Andy Shevchenko
