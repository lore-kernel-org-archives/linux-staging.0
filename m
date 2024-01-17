Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3FA250E6
	for <linux-staging@lists.linux.dev>; Wed, 17 Jan 2024 20:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705524664; cv=none; b=U+DWKSazAZmeXYP6F+19lIlZUrek1Hmlpthzg+DJs5vB/VxVi4xMgjEqmYGHv/C+46LBdpT3A7ISNo/Od9zBwmf/ZxxsG7suFPTjgXrMOvZUL+6tFWZrDKcILBTDFimpct22a4D2TvWavx+7jdIPF84gerCBrYrOzk6fHDyTVZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705524664; c=relaxed/simple;
	bh=UnN6fT/sF7UnOxJfenZCORuYw2Y5HuwKRk5v/J97M/M=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding; b=ZxxnCNND2kVpQPGSyDpAv0MWKk98LhRGaR3VhECTgjylVzbZSBkCYx3IrFvO4swejZUKn4gHloabT/jnTNLLr6eWDsAcbVd1rTDswJ3zMWwkQ6pKyOP5m6EE6eJqUSZOUZXdOeVLiPjNJnpMzEnRdPfUZXhwZ1N5kEu1oobKxIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M2lOPsed; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M2lOPsed"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a2c179aa5c4so824301166b.0
        for <linux-staging@lists.linux.dev>; Wed, 17 Jan 2024 12:51:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705524661; x=1706129461; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UnN6fT/sF7UnOxJfenZCORuYw2Y5HuwKRk5v/J97M/M=;
        b=M2lOPsedf23ve0MNMh5UwOxggwykmMiux3d9qat5wfjQJWcfKTVqlMBSt3aNvp+hRE
         N+IxfZxNGhpJB8jq5ApR815I7v/P6H2GMA3zz549kevNxIiP3cpuHKLlI6HBSyiZDLmu
         FoHSjFJ5EUKo1BsKt80zW3k6geNAYVAIHItrIPjaL4JbTi60p2Qs2Nqn6fxsU68aHBG7
         aWEDIidFRPgzo2VSlZtRSSuhNtW+xj9J0cKH1leJybnRTANHjEQ3Fk+yeaIb8D07YEMg
         ksnbXCxCkhw5okMy5ZAv9YvuYkRzOyqnofk8QmGs8MxdhJTHz+N0JP19vBm5Hgrk/lzl
         tKCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705524661; x=1706129461;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UnN6fT/sF7UnOxJfenZCORuYw2Y5HuwKRk5v/J97M/M=;
        b=Y/SLuOEci96JoWI9MFRXJFHG+l+CDNznacdM8DVgv5BUbsgAy0ftTJs1zZB9aUcMu3
         a9Ll+Mv5Gzty71oXs/UOGfY8pCACUGh78aIvhMin7avPW5h59t1BF808UW8knELBqmFu
         fPNTwD6DzxpJVmm0DzlJ6cxcOJwYRe3VwGH+gkljaZZ6l5Ts43mca7vyPoGmJmxv0zcY
         az4g1PGF1nKXDkXmWVibeFohzSgXp55WwMbtpk37hC1Hk/bwSMYupxNKNjYntwoZPmAC
         OczmkmiAqvrX0abkgRQa6YSNXHM+Td0cZ+slTqYMW1OUSXyIEFi/OEfGuo45lutx6V8m
         idAA==
X-Gm-Message-State: AOJu0Yyf77Yq2BbhVlUxB9GBAB/OQ2swgzkNxtOZAw0wM+3mOrn9jbrt
	+C3BwhnTgOD8enC6D3MbOHcinHbCBw/l8pZTpF8=
X-Google-Smtp-Source: AGHT+IHSUAXoOgfS+P0HmohOdzNc1b0RVZ58gA4Ucu3b5BABurbFkH9EcEFs/V94k3XB03dbbR2kXsdFk2BtDbTNTyw=
X-Received: by 2002:a17:907:1a56:b0:a27:f6aa:c7b0 with SMTP id
 mf22-20020a1709071a5600b00a27f6aac7b0mr3546463ejc.11.1705524661024; Wed, 17
 Jan 2024 12:51:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240112083421.3728017-1-alexious@zju.edu.cn> <5dd12651-232d-41f2-afa4-2a3e5c127969@redhat.com>
 <CAHp75VfKj7sQ3HkNaqNe0CjVrRb0J=X3gPJf-rSLeU8RQ2hjFg@mail.gmail.com> <17d22c9e.4900.18d162090d8.Coremail.alexious@zju.edu.cn>
In-Reply-To: <17d22c9e.4900.18d162090d8.Coremail.alexious@zju.edu.cn>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 17 Jan 2024 22:50:24 +0200
Message-ID: <CAHp75Vdz4FRF5=zFiKarOkA6ezOTP=CbwU2-_fpSCpuaZgb+VA@mail.gmail.com>
Subject: Re: [PATCH] media: atomisp: ssh_css: Fix a null-pointer dereference
 in load_video_binaries
To: alexious@zju.edu.cn
Cc: Hans de Goede <hdegoede@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kate Hsuan <hpa@redhat.com>, 
	Dan Carpenter <error27@gmail.com>, Brent Pappas <bpappas@pappasbrent.com>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 17, 2024 at 8:34=E2=80=AFAM <alexious@zju.edu.cn> wrote:
> > On Fri, Jan 12, 2024 at 10:49=E2=80=AFAM Hans de Goede <hdegoede@redhat=
.com> wrote:
> > > On 1/12/24 09:34, Zhipeng Lu wrote:

> > > > Fixes: ad85094b293e ("Revert "media: staging: atomisp: Remove drive=
r"")
> > Besides that, are you sure the Fixes refers to the correct commit?
>
> Well, I think I referred to the correct commit, which introduce the whole=
 module and leave this bug.
>
> If I did miss something please let me know.

Yes, the driver was before that commit in the kernel. Was it without
the bug? No, because you are referring to a clear revert. So, find the
real commit that had brought that into the kernel.

--=20
With Best Regards,
Andy Shevchenko
