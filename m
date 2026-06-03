Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A78639EF33
	for <linux-staging@lists.linux.dev>; Wed,  3 Jun 2026 20:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780518790; cv=pass; b=nNhXeFu942MLks/mGi5/0fsFZ1/ZZ8LGvK+oz4LrG3TxOlGgAnNRyROV1ZdDsjsNgKG7Hj1ciYwthdywGUOCAsRdJlHwCWGmb4dmUzXgDrf05Zo3/z9Iy4PiXjx4AvLdttSoTuqrmgEhfLrw2HshzKN0auTQ1WkteBDoLCKWwDo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780518790; c=relaxed/simple;
	bh=cfklGxv+xr/9wIU1WjqaTibJt980qjKF68ybQarMsy0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hJ0KOsUwc7SPhBKpIyH8x2FLU8S4znNhWXOFF0oF0O2jK1MxwTVBo8VdgcVre9MPvcBlwKpRytrwUIO+aPA05/vyExuqp0p3s3We1h3iuIUaPhTy6EZcztSabm5x6NxKDH+XuZIzRNBEd1aNJFeDlFr4a2y7U4obWbyypHitdOI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EiFaWylp; arc=pass smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EiFaWylp"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-517583cb07aso36454611cf.2
        for <linux-staging@lists.linux.dev>; Wed, 03 Jun 2026 13:33:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780518788; cv=none;
        d=google.com; s=arc-20240605;
        b=lnPqry0Yyk33Xju/v96vzBQsCU3kffCFfc43M8/mFRhGi9UdGLeXf3ttTwpDCOI2iP
         IEc1UQ9nvK38ffskU8nUoaWPcCvjUdzRmwwwV1rvZk+v2tumvTokOoqzUT7+9maYTqu4
         hvu2RWKZvMgTCy2DPJB/AGXIzXxDxS7P+FJbCCyGE9oliVlWK//AY0yfGYwJMyUE2uf3
         f/gtewhz2+LhbP7ORfYfzzpllu7VbiIw4eIagpt0WZkv5Ory1X1oQy6+yiGkFys4H7vC
         Z9+kKdCjuIdBhz/p5//hSonfECRIUxfkdelaqMrWvdZyaAwVA5MF4iJLiBKtKK9URRHT
         Oszg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iWDKvC2KBDKKn67tTc7DvnDMEhdHE8FXwlVZDxzGBW8=;
        fh=r44HrKjNK48gx/wjk67xY6nsf6oUfzWcOlW24DR9zIM=;
        b=WXesP+EZc+Ydibp1g1D5IbHGFXY6AjmiRjn5UwfWPUBNm4B+uDoHGQglAKu1/iUgsW
         n5CV42S/2aBqBvSd54zqHwM7lzIUEv1JGCxHzxKrdKCuKr7yACDIXvadUOPpalc9i2gH
         z6+bDEhJxc3DZCKZDh9Eb9rvTlOgiFjw2kRI78tgRXRlqsMrggz9gaJmspjZ8SZL+g4v
         0GN9bipZJDg0lt2y9Hrx6T4kMI7cTHh6QJw4+XlHQYBnc5rDGtZQp8Ny0MO/k+X/x3+N
         ilTMP3PfPWJnCLd6CtZpaUiVI1NuznUL9t4IwOx5R+wZlZSY9ZzOeFyl9sJN4VYDm7Cy
         APxA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780518788; x=1781123588; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iWDKvC2KBDKKn67tTc7DvnDMEhdHE8FXwlVZDxzGBW8=;
        b=EiFaWylpqeMCLNqmRMBt+c9OYo6NZXhPsCG+p7FDU2/1OgOSpBm3+yo9rJRWjh1E4u
         qQQGc/6kbdDkiN4ST0PNLrjVBhMQ2DhqOtDftg6dIIqMZTcQMWduosALO3jQhojUhrv6
         7ioy6nJWqo0FbVdcW36/d+GFfFpkyMCDRuZYyG4IdfRvclcGFbiYjM3zRLKh3n1wcfqi
         PCa7eKBN45KzwhF+YBkPusrGRBhkfOhGehRWQ3LoFOZSW1xDD62G6ZCQcMl1C0nP5e4p
         Vd5/yySUbCnVJdqAugJRgMrgo24CUWrE1ZxCICSgi1/dODTvsD3PEpIWS1wN+rgMqwTR
         dOCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780518788; x=1781123588;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iWDKvC2KBDKKn67tTc7DvnDMEhdHE8FXwlVZDxzGBW8=;
        b=g8W5q+lpVZkmzhhWmKnK397vG7GCblq0n3Z5yMJfacmPbhTM+r4G2TWRwGuFpfhvgC
         UbiULHcnTWB1hkgKQpa9/uFxhY2seBPpJM0SYXCf6iiOljOMe3orgapOwH7yUPDzs6cl
         tMEZcXJGLcCvU8dn/2EJ1o1JpvwUkaIk5HqNHPJJyGJXfEaUxtNFJAzSvD6T9E/7cOt5
         hpFYeAqRTsMOKVGqZ9baVnss5aQ0nljK8dxka3Cm2k8KGhRH6o496nAgWqzMDnG56gFB
         q5kSGxTOpg9psQfnUQ4FHneu+L/m2ieelcC41QeFLjUUNceb5sI01008Y2/yi88DTefU
         88fw==
X-Forwarded-Encrypted: i=1; AFNElJ+sfffb8FTH3aoEDhGGtAEidbJcnuze7Ei0By7hnobbMJduO76kG/u6k5d/SttwBS9U8/1P+33ptSTM4wuK@lists.linux.dev
X-Gm-Message-State: AOJu0Yyrd7wVWgBk6G1RL1NLlxLa3/avRqHieNsnfGNEQh8tUAB7ZL+X
	/37gxBAVw5slS4YaK2s54WiXSLAELlkBfanSZILguUkBQ2NV9ZKt09kmxazi8mdiIiCGavGN+Nq
	7qjbnv/5KaYUxrD3moiNonod25TFuCPNuY6Vs5DQ=
X-Gm-Gg: Acq92OFuePx/BfhfzaKHMPlgN9Md+WV33Iwxr03jc6RUhsbpXmhg3SPzau+E08Xnq6I
	xjmSOPC5YuQvyq6CZIjg9uL8ntZP34Mn+pxDCfCcI8EtNKfYSsd1J6/HHxOzJpL0uzpp46pYFcz
	nA5JpYX5T1XTq6ag5Pk6nnZ2mtf2MlAxSxS535+hH1nFq6LJzRWL+7Lm6uD3ebm6ws3Xx3mvNJD
	vxOoXsLc85/7F0mC1q1/nunzv4idx4+qcZfOtn8aOdh+lh2GEk/JJPn9wDQ5/FzXRadLSvm1Nlf
	j1etP0gy+vo5zBCt5cXFLBNU9vwZs+XUS1xmyjOPk0mQC582XS3OmwWlpsDAQY/ANUtOaNhg/xR
	uOqB6jTE=
X-Received: by 2002:a05:622a:178e:b0:516:e249:e30f with SMTP id
 d75a77b69052e-51778784622mr76184571cf.42.1780518788589; Wed, 03 Jun 2026
 13:33:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260603195239.200775-1-williamxelder@gmail.com> <4abc61e2-e5f3-4c92-a751-c8397c1ec8df@sezginduran.net>
In-Reply-To: <4abc61e2-e5f3-4c92-a751-c8397c1ec8df@sezginduran.net>
From: William Elder <williamxelder@gmail.com>
Date: Wed, 3 Jun 2026 14:32:57 -0600
X-Gm-Features: AVHnY4JWkEWPccG6ApQwqoeRSCFUChzMnzn_cZ7XrpZEcXaSloUhFP2Ja8dzfNI
Message-ID: <CAPoYzh+o_FqrcyitBcLSV1RY=-ySHGPL30HCxg+EuFxn6sLuuQ@mail.gmail.com>
Subject: Re: [PATCH v2] staging: rtl8723bs: remove comparisons to boolean literals
To: Ahmet Sezgin Duran <ahmet@sezginduran.net>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Still same buggy code, V2 didn't change anything.
> Please work on it properly and wait a day to send a new revision, not
right away.
> Also, send your replies using `Reply All`.

Apologies, I fixed the code, I'll wait until tomorrow to send the new revis=
ion.

Best,
William Elder


On Wed, Jun 3, 2026 at 2:07=E2=80=AFPM Ahmet Sezgin Duran <ahmet@sezgindura=
n.net> wrote:
>
> On 6/3/26 10:52 PM, William Elder wrote:
>
> > -     if (phtpriv->ht_option =3D=3D false)
> > +     if (phtpriv->ht_option)
> >               return;
>
> Still same buggy code, V2 didn't change anything.
>
> Please work on it properly and wait a day to send a new revision, not
> right away.
>
> Also, send your replies using `Reply All`.
>
> Regards,
> Ahmet Sezgin Duran
