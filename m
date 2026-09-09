Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3511A37AA86
	for <linux-staging@lists.linux.dev>; Wed,  9 Sep 2026 18:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788978661; cv=none; b=kcU+eZ2lJyhoc/sQn+dkotIV5BLjhJVNEnPL5A2NQ9oAMN+2BUqpgkLnWCur9OZcQkZFG6VkH7Dn7H+QcAXsgNNETKsh262MXS+Kx0QWHJbJiBy0NtBHtBTcvEvJ9oNw+r7vylN0Fpv0yHjDRl/I3MeRdq9NR0yzMOmBRfHGdKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788978661; c=relaxed/simple;
	bh=tYk8UUa/ZgTqD0CT9vVm0TZ2uXiT2KxkmRqOOXowsYQ=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=FOH/4afMtLebXHbknvAyYvM6kUHdCAnQBvYllZsdXatHGFtiCQMtsy/lt0NGzovoaiBXhsA/w4F68UG5/KnqPsXnonegiHFwXEpjzX8fRBdXwR/yymz4bTce80sw8oY2fFgFbPwSrL2dkefbVjxYZumxsAWyY7uHZ9Ra+hF7ztY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PzHxuuIQ; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PzHxuuIQ"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-4b1fcd3b1a9so2629395b6e.0
        for <linux-staging@lists.linux.dev>; Wed, 09 Sep 2026 11:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788978659; x=1789583459; darn=lists.linux.dev;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2ZORYc3+x0OjlYW5Oa+mInYkoWpL4Uoxgu6dqAXL3dY=;
        b=PzHxuuIQR7ISz04VKd399lCJ8NqNyvtfAhSWN4/Jvju6RP6BZ30K5Rh7gp6QeL9rlD
         6iLANbJ3jFydoqzAhC1XTM/VQLj7e0ck4QILSBfRAd/e91+vhHt4cgVCQYdmB2v5ciTS
         2Nci8yvcqBZt28m9LImlz7k/rN5So/r1voPIg/SvxGINhUgClKZrK+wIk9ZgosWt9XHY
         QYnuLSO2ngxTEsc2Po0Wkx1hHphsqKGOptBHP6NudpZuH+2HJhcHHhUjDuxdMTGU8KhB
         nDOVXQ8uOQEjk41Vi4h4yBhvf/saEjIHBjkOQNMFQGFmWeYzcs+C7tgBZ7BhHRR2iW6h
         S2cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788978659; x=1789583459;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2ZORYc3+x0OjlYW5Oa+mInYkoWpL4Uoxgu6dqAXL3dY=;
        b=l33uijBHErmxOnihg+vXCwIfdtxIlFZSnI8Ka0RuKVi4qJwoT4kNW4VAhgrFamMFlp
         YmN7Fey6MAp9wAsfWP3dSicZ+lLewS55q2WkBDfrZuOcAlDhlL+whdJJX6iZBKCsY4vv
         c3BWejsUQ9jdRuBo2dSL+3KtOZCvejs8wdDQPkL5myEOECm2X7SjBg4CMI1wuvPLD6Cc
         BByzg1gx0Q5tXAkQ8sVWQ5EArHp8t3dDR4DIfuh+ecvFbLMSA0z/3FvPQaQWHxIwbiJp
         mje88/A6v59M301+3NboPI66Qejvz0gEza/nvJ9rXT2U1TpxmbMQS+HS9EWpbSD3OTE/
         5b3w==
X-Forwarded-Encrypted: i=1; AKwUvBzb+QQZi87oD2bOLeYxXDriRE0Cfva7GXkY89YUMrCtVAc4mDYwE4wVlK9K84CX97xqHX3vQS211VP3DD++@lists.linux.dev
X-Gm-Message-State: AFuF++mAzkHhGZ3mXjLjHBEYgPpVSjocGlUt/v3sGwgDQUBI+vFNnD1l
	iN/dLDdbUHlN9ga/VLx9uqMck9v6ni4kmGQYSsTO/Kz3wPqsoQvajj0m
X-Gm-Gg: AYBFou1Ek/0CpqmunM0i1/qoY1r45RgO65uNpYdnn4BHh0OKpnK8wL7BJmlkavPuoqb
	dqFlpT66aH/aLDbRdxmzGKkghatZ3JI65p1wYO7eHMp2YpofXtpsnzoIiHs4BWt17HzxDLuWmga
	C/5L7xAxEeHvmHIOvgjos3VJsuH6t4lVapmMGLl7L/6N9UfWfw+MoPoj1yeKSVnODAIkNfwC1On
	ILSb2gzUATZuZ/ioJT0vJoF8glK2Wdk3pq19B8FM2ZWxHBrcHns98knI56icn9Gwm+rsw4ZWwSP
	QQhxqh2JNncSzAkdhxEu8jMIT3g452ek9QC6IkxL9M+e4AY0HVD2i6oNFTNlEJuA1bVe3u2qvyA
	MKpvt/RvTzUwBYqo1DzKDppja15EcIMe+qN5rku57RRKtgjmfJxPigg9JAqH0vuI7AXtsUqmTO6
	qLP+e2y12nXKLfIO+8aZXnOy+jx0zyoNysQasUSAw5ov+/nKGP00b9q87Cx/ScIuMQiryaQuzxq
	YFMVuW1xA/pjautOg8LMzTA
X-Received: by 2002:a05:6808:23c4:b0:49b:33c8:4b75 with SMTP id 5614622812f47-4b95f22f676mr27469940b6e.5.1788978658886;
        Wed, 09 Sep 2026 11:30:58 -0700 (PDT)
Received: from smtpclient.apple ([69.162.230.54])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b96eaa508asm17622378b6e.1.2026.09.09.11.30.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 09 Sep 2026 11:30:58 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.11\))
Subject: Re: [PATCH] staging: rtl8723bs: fix coding style in HalBtc8723b2Ant.c
From: Fahmy Hassan <fahmymohammed@gmail.com>
In-Reply-To: <CAChV6vw0-6ZjfPCgjQ46mfEpnnJd51EGW-Dt1Wc8SWMkh+AwAg@mail.gmail.com>
Date: Wed, 9 Sep 2026 12:30:45 -0600
Cc: gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev
Content-Transfer-Encoding: quoted-printable
Message-Id: <51BC5B0F-E643-44ED-A44E-DE275DBFBE63@gmail.com>
References: <20260908025910.155625-1-fahmymohammed@gmail.com>
 <20260909123648.174428-1-b9788213@gmail.com>
 <CAChV6vw0-6ZjfPCgjQ46mfEpnnJd51EGW-Dt1Wc8SWMkh+AwAg@mail.gmail.com>
To: b9788213@gmail.com
X-Mailer: Apple Mail (2.3901.100.1.1.11)

Hi Bera,

Thanks for the suggestion, that makes sense. I will include that change =
in the next version of the patch.
Apologies for any garbled emails; I=E2=80=99m still learning this =
format.=20

Best,
Fahmy




Fahmy Hassan | C# Backend Engineer


Sent from MacOS
Please consider the environment before printing this e-mail



> On Sep 9, 2026, at 9:17=E2=80=AFAM, Fahmy Hassan =
<fahmymohammed@gmail.com> wrote:
>=20
> Hi Bera,
>=20
> Thanks for the suggestion, that makes sense. I will include that =
change in the next version of the patch.
>=20
> Best,
> Fahmy
>=20
>=20
>=20
> On Wed, Sep 9, 2026 at 6:36=E2=80=AFAM <b9788213@gmail.com> wrote:
> On Mon 7 Sep 2026 20:57:57 -0600, Fahmy Hassan wrote:
> > Address checkpatch.pl warnings listed in the driver's TODO file:
> > remove braces around single-statement if/else arms, wrap function
> > calls that exceed the 100 column limit, and move trailing comments
> > that pushed lines over the limit onto their own line above the
> > statement they document.
>=20
> ...
>=20
> > -                             if (bBtHsOn) {
> > -                             } else {
> > +                             if (bBtHsOn)
> > +                                     ;
> > +                             else
> >                                       algorithm =3D =
BT_8723B_2ANT_COEX_ALGO_PANEDR_HID;
> > -                             }
>=20
> You can use something like
>=20
> if (!bBtHsOn)
>         algorithm =3D BT_8723B_2ANT_COEX_ALGO_PANEDR_HID;
>=20
> Thanks,
> Bera

