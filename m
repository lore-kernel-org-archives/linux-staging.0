Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B524A1A6829
	for <linux-staging@lists.linux.dev>; Tue, 31 Mar 2026 07:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774940931; cv=pass; b=GFLagn0/kFuNIACzBr6w8Rw7JZpkshm/8fulP5nHem4RvL6VIvhtOYENqbmCZSdiwQq/tZiPynEvU68fgfOp+084VDGPO+0l9iVzmk1fLWHt/P9YHq+tIvdN/g//gMS9rVYqM08psYSa6WcEnJhvPi4Q5xcIIE78SwMtnLGW1Q8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774940931; c=relaxed/simple;
	bh=dUmt8meN/c5qzy5lFr0nV8aXowqm32XSpnxoMdBrVgY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UFvzaqaKnODrFudPh60CLp3NwSvGcWDQC7KFFW4c+12wTZ6mce6m4f58fOJNtKenWCbKnnnktg4xmcdNeLYYoOlx6up4S65Wh3s0HzKOdnwQcwADqGE1j4m/h8LATgkA9dUiDxr0vFko3jV8y4/x7B+LJL33OIS2oVkVIcfNAVI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M0P1xTPZ; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M0P1xTPZ"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-66b2d49ffb0so4831957a12.3
        for <linux-staging@lists.linux.dev>; Tue, 31 Mar 2026 00:08:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774940928; cv=none;
        d=google.com; s=arc-20240605;
        b=Clxxwp2WnhnKdbfHty2B1nWeAVaf1v9xMVnnw5xEauriwlZiocdkumAHNos2ZwbBEO
         FNkUvV63OfKdzCRrXYh293hUSeyMWcerSUmielHmCqQbm99xvNQAffv2OoFtOzC7rfE6
         8eKtO2KneWM79qio0+J7Z49g55S3gTqZ06gVj7jDERXw7ZMdl2TdyCAVJY3zyGdbioVJ
         bPyun9uTxZ0Xhch7jM2LwDf8+CrqNXvNuIlP83/B722/X9yFCG7g9mruJ/mBG7nv9/VW
         9ZzS2hCu2lv2nnWU/qBkH9OIsmXJJf/SsL4hA40MdEIi07wnncvIVtfRixIZuIyXoHbj
         nJoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dUmt8meN/c5qzy5lFr0nV8aXowqm32XSpnxoMdBrVgY=;
        fh=2PWPHiW1IJGkAvxCJcOqgCJQZtNgl3bkV3+FRGIqwiU=;
        b=KkCyYC1JYY0DZ0HJuTgHFbFiEtABGGzWhjOpwD5a4pGzXIfuqEHnPBymH0lv2uk0Hn
         UoSJzMkmQbTCzNrmN0JQArDMmGkzkuo86sUDwxAF5c4+THP9tNK9+au5OTOexJG+SkJK
         ONcVkAotgtwTpTj5OPJLJ9HePBRtFpuijuPGvQmPBdfBS8P6uFlG7mzUobCLid7jcV4D
         9thbRV9lo/vA6pYDfB7uyS7/SnbFEu7N+67eHiO4+A8gDzspn/7PB50oyLLWA0uIAltJ
         gZ6gFCv3rAAVYYlaasKJ/qIOV4/++iMP0A2LJg8k7plsEWHyO3X93yV49aum9ufS/RWI
         kqDQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774940928; x=1775545728; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dUmt8meN/c5qzy5lFr0nV8aXowqm32XSpnxoMdBrVgY=;
        b=M0P1xTPZKAdztRoZIr5d3yGowOlDW+l7wShPzS+gb6sDTC7eMt8tVjMqHnNn1H+CSe
         t32L+sv0J1ZWQndx0CODghDmqGdxxE0IQMK14ef+qP8U9GOP0BZBDntiGXphoGzElKgN
         C4DKtD4LwRfVAQ7ZUQ7ZwCHbuaFP0/dP11mZbmoPekkKn4GqOXG67w9faiGIN2a7wznG
         zY3qNcvyU7W8fADvO9JOB0vwbZWUuHSWOnZ2pVmkWWqg2xJS4uoZCU2eAJLsN5yJf++/
         XrYv9stTgK/2+n2WtItKgxcai2Ric6jw6WMZsrmBM5K0kU4R6qTGF33sTUq7Qy+wDfKh
         nstg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774940928; x=1775545728;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dUmt8meN/c5qzy5lFr0nV8aXowqm32XSpnxoMdBrVgY=;
        b=JtciSeWC61XY6/dMW823lRSCJIKO2PtWgcxvsTp3zA5wErKeZ9gounX+3V/QbmdnNd
         Kv3rvVM8miB+nKEeIgGzh5+fb7jvA4tv0iD+wD8GulaGp9MP8LT2kpHVJrcOC3062Kus
         WHMXP9dzCNy1xzpRoNvJBsT3KhNDnJvDujT27mzc20LcnnaflomeQPSd0e/RLYSUafUK
         2jR5Xl0HEoo42lhBbweDSwrvj9rRDdtox+Z85n7W8gMaBkf79GpB9vysyAKzbYdBJLnd
         Rv3LvD3ilmMkW57woNB9QzLe9Fnrg1/H0JQSi1FH9cll8/l62Z6qgDW14PI6060rJ/Dm
         GQnw==
X-Gm-Message-State: AOJu0Yxzhw8RbUPM4rYcYn2SmUcDsvFS08GmNZWN6Gcv7hR9FRcmg4Xl
	pWShdmMbVfutrXSfdD6dFlW+Ski0Ry+TBcI/inbl5VraXWAiBCIkjDJT4aayav7NLTgUg0JuyAD
	nQy6tN3mC3Cj9l5MvLeANxdTO7Cj0adA=
X-Gm-Gg: ATEYQzwiI8eNAyzqDXqv9c1U+gpwt6im44j/HUKJBiSiAwdU6DJC4GGRISdAjI5IhxF
	FabqcjVk00uLj5VUpigfCmsBRemodsiD9i+HhF5wkP6hk9JtqyNxYmphhfxbblUCcTmmbWSNNpI
	hWSw9thUEm1PnrbFjVCjEu0oWP/FSQNS2+VpHeTSdTjcTaP0gE1kQy4ZEXa83FA2WasAoaGKF1D
	pvgw0BfgK6Rx+zlzZy8yxcpHspJyWOgqUSqEiWjb+KBK4U+HoXxKrRf3xcJk85RC1AzA9rVF0UD
	RZmB2heCSWHy8UMXWs90A0g3g+sE+tehokRq5WP/GMRAjCazOW52DsMW2VJZjI0zUx3F+4eOUQy
	a9GFsJPM=
X-Received: by 2002:a17:907:1c9e:b0:b98:40f3:47fc with SMTP id
 a640c23a62f3a-b9b50169017mr952031366b.1.1774940927909; Tue, 31 Mar 2026
 00:08:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260328192721.255493-1-azpijr@gmail.com> <20260328192721.255493-3-azpijr@gmail.com>
 <CAHp75VcOi_fhSGnYn0KzsRMdSFmFhzc1kzesW52XEQVJY06ndg@mail.gmail.com> <actitevm6DKddeWS@gmail.com>
In-Reply-To: <actitevm6DKddeWS@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 31 Mar 2026 10:08:11 +0300
X-Gm-Features: AQROBzBhgO6AYPbDodnfx8O76GNHhrFGbfX-axWRKmTMIZ6MM0GoHJ3Gt0op-MU
Message-ID: <CAHp75VfPir-=vS-UMJNp09cR5xk-6cx9RhWkmG=06K--87TWcg@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] media: atomisp: remove redundant call to ia_css_output0_configure()
To: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Cc: linux-staging@lists.linux.dev, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 31, 2026 at 9:03=E2=80=AFAM Jose A. Perez de Azpillaga
<azpijr@gmail.com> wrote:
> On Mon, Mar 30, 2026 at 12:01:21PM +0300, Andy Shevchenko wrote:
> > On Sat, Mar 28, 2026 at 9:27=E2=80=AFPM Jose A. Perez de Azpillaga
> > <azpijr@gmail.com> wrote:
> > >
> > > The function configure_isp_from_args() contained a duplicate call to
> > > ia_css_output0_configure() using the same output frame index. Remove
> > > the redundant call to simplify the configuration path.
> >
> > This requires more information, in particular to explain if the order
> > has no side effects. It might be that double configuration has side
> > effects and removal (wrong) one may lead to other currently hidden
> > issues.
>
> mhm... my bad for that,
>
> the ia_css_output0_configure() function acts as a configuration setter.
> it populates a struct ia_css_output0_configuration from the frame info
> and caches it in the binary parameters. calling it twice with the same
> out_frame[0] pointer merely overwrites the exact same state with
> identical values. it has no cumulative state, either does its order
> matter relative to ia_css_copy_output_configure().

So, no call in between accesses that parameter or relies on its state?
With this analysis in the commit message the change looks good.
Please, amend it in v2.

--=20
With Best Regards,
Andy Shevchenko
