Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C72272819
	for <linux-staging@lists.linux.dev>; Mon, 14 Jul 2025 15:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752506908; cv=none; b=KIpJ3luifuhmxssOu9tVNT3QPLAnTQ/C1iybKmnAPN62ZHLyn23w2EaWqEQw/tjseBI6JfJ9nQw41smMuDZrdW23sFYD66Wnt2KsUEligMuCiKP7NoNTO6xJuC62yD7dvLVC2jZZxlP3fZFX9jdUXvx5RSveMIJdp6vto3mFhkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752506908; c=relaxed/simple;
	bh=GpNVpLtiuXVvXcRnJj4M7X2+HMOzdAyNBGdu0XkOiMY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YDSRqpIpgx1jn9IiE2b+yXfn22X1RcX3mH/b5XgIQdMSQGcKUXg1ACYNsUL/ANkA6YtaB9HQwgePDwS/AbhI49mI9XyiRdcGoojWXqP19sDFeCYC1OcBdvqbzai4Y1fgUOAffzZuMq/8w978ALTctNzWKdbzzmdBr36S8Qjq4jU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VKO9T3kZ; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VKO9T3kZ"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ae36dc91dc7so774679866b.2
        for <linux-staging@lists.linux.dev>; Mon, 14 Jul 2025 08:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752506904; x=1753111704; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=abx0kJw5IyovETeaZowTfsHvd3TwzzvCoQExojDzwyQ=;
        b=VKO9T3kZS7CGIP2ZwIjv1Gu5RFHsghTxgC9V4/b0paLaaTK4XnkRp8OIxhwDsTLU2E
         7UxTmaVL21ngBeEt06Y4hpPzedt0t7aPN/s+npz3Lo1O5p6HRdz4o4/Zm7fqP6HEDvic
         MUQB1+HJK+or3hYH/jE01AeVFwo5fvO69XoD/xVpssa7TmXp1eNxGQsNKvuCZikj9geK
         a+6p7AzYoY8nBG8j7n6pdmwhDndjd+zdOBpuBtxjNdkxYiHpdSo0UqSCt0OeHF2iVy4Y
         keHSuhcnGctYCeSBNOy4p89NBZWDNy4iwab8VztOVj6JvxiynZ4NbQw/rjdsCko16VgJ
         HdAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752506904; x=1753111704;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=abx0kJw5IyovETeaZowTfsHvd3TwzzvCoQExojDzwyQ=;
        b=UXrKek7GOboT5bpm5z3HCZmaFY7NYn13073tQ6dH+X+5kGCy046A49V9qBhfScfEYw
         U5upLxCogqcCltVfK1/AhGLVpCofwW5LiE41sdOJdoA3iLAnZWmlzvN/6/k2SSb9+drH
         374KJ6CQFT2EtcIwpDlNAywX+honkBM2dXnIuGLXSHJ4wKezkrtl8d/t+qr0syZmkEYS
         CZdK5U0AV5OCt+lXyrotWCj8Ox1XKGYZ4JIOxxGyO1xrtH21HaxSlR9BE8QLCq8FV3wk
         Bw7fkJnhv1RgyZb3U+JPtHRmDA2uykOt6405F5YUjvHePB3Tu/bRk9nx7ABmzcL2pODN
         lybA==
X-Forwarded-Encrypted: i=1; AJvYcCV61tRG9b9/qmlQbOIlMl5ts+5hQDEt4c8RvyVdlNdkvJIdWz7aRcrbU1G/o1GJacOFE9aUXxUnFvloj8Bj@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8Xk8kxGMwi2xJOAgg2ntemmxE4jFmOz+b7mwgAZ6L/0k2In7w
	Rx6p80BSzh6biMrTeglHhqJmmfMoeF4P0H0YQrUghPwQGM9R1hgsJRUhyPtOBlPu8QvDJaZIiTz
	HpmHvOxC+5Fz911Tzd777a9BIay3IWAU=
X-Gm-Gg: ASbGncu8MXqTRgqOfUmXpktDxzBjw/odzuOAeMtYXfmI4ftruDvKCwaaAfqZK3OwZJg
	l3ytqOrdA5istn0Makb2r2HPEdSE8wRETj+AG19FICCfwMJwwFqdxPhga/eU/WsOKdV2lQQEWxY
	rBs7l/kS9UgOk6zP3cO4iu1F535RPmJVkW7RjJPUVaLfVJJx4kDFqUWdwoG7zIpMbcHXcXB1WL0
	WZJsY7tQw==
X-Google-Smtp-Source: AGHT+IECYIlD/hEK8u8iOntSYtGp4dfP/Z8nc8UEPsUAazBM2NO5fHNtHTM4nfllR7C44GwIpgQyDmPSBvkjEQL7hUQ=
X-Received: by 2002:a17:906:6a26:b0:ae0:67b4:991d with SMTP id
 a640c23a62f3a-ae6fca6e1ffmr1200009066b.35.1752506904102; Mon, 14 Jul 2025
 08:28:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250714131953.45947-1-martin@weidenauer.cc> <2025071444-overeater-washday-405c@gregkh>
 <9F1430C9-1AC7-4955-8785-1E321BCD6E88@weidenauer.cc>
In-Reply-To: <9F1430C9-1AC7-4955-8785-1E321BCD6E88@weidenauer.cc>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 14 Jul 2025 18:27:47 +0300
X-Gm-Features: Ac12FXyabYhg6XG1ixZFFe3ti4iXaFFwwp6KPG4udmHxQ0DqNuJw9Blxzg_AXGo
Message-ID: <CAHp75Ves2jc7gPoH6zxNGuoo4ubRe0dBqSR5Y70NtJ8fMxfaRw@mail.gmail.com>
Subject: Re: [PATCH] staging: atomisp: isp: fix open brace on new line
To: Martin Weidenauer <martin@weidenauer.cc>
Cc: Greg KH <gregkh@linuxfoundation.org>, hansg@kernel.org, mchehab@kernel.org, 
	sakari.ailus@linux.intel.com, andy@kernel.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
	~lkcamp/patches@lists.sr.ht, koike@igalia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 14, 2025 at 4:51=E2=80=AFPM Martin Weidenauer <martin@weidenaue=
r.cc> wrote:
>
> If you mean the indentation in the file, I think it's unfortunately just =
a messy driver in general.
> I mean I could fix it in another commit in general if you want.

Do not top-post!

The question was about the patch that may not be applied due to wrong
indentation.

> On 14 July 2025 15:24:57 CEST, Greg KH <gregkh@linuxfoundation.org> wrote=
:
> >On Mon, Jul 14, 2025 at 03:19:53PM +0200, Martin Weidenauer wrote:
> >>      Fix checkpatch error "ERROR: that open brace { should be on the p=
revious line"
> >>      in ia_css_dvs.host.c:277.
> >>
> >>      Signed-off-by: Martin Weidenauer <martin@weidenauer.cc>
> >>
> >>      ---
> >>
> >>      Hey, this is my first patch, I appreciate any feedback. Greetings=
 from DebConf25!
> >
> >Odd indentation, how did that happen?



--=20
With Best Regards,
Andy Shevchenko
