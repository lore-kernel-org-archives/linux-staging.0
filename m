Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B6FA1487D3
	for <linux-staging@lists.linux.dev>; Tue, 27 Feb 2024 16:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709051141; cv=none; b=HTZMY7lSmjevfi8bOB3R5QKSMWw5Uerc20bDTSMmn2EOJiCBLNV3y2fNbv19ay8SjE7ROtG6z/u7dt0v0rK025tFuQjjz7ETswWAVgBdkcjj4DlSugDZkgU4g6zTYxqCaEBGO+/HLhhKWWlhJFkhJdDmLaVVEBGLrUNSWvugrZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709051141; c=relaxed/simple;
	bh=pkZ/Ma+F35kpsJXp5Oo5SAPDn31tbUEPaH0ALeTfOao=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=diNEU3CywZUdsyn5ZsxyVPoiUlF3nF7xd3lOngB/Oa/SjWEFX+mJ60cS/YWvan5YC3x6DQHaYqxOy4nJd8NpDJQkJG/a9D3JkQh+uFGQZFbZxEuXdboPlGz4ZCXf49Cj4K1BXjkZ265JnFr8fE5XiMQx50j0KYzF1/k4rMGK3Xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aqbfzfBP; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aqbfzfBP"
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-7d130979108so2401976241.1
        for <linux-staging@lists.linux.dev>; Tue, 27 Feb 2024 08:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709051137; x=1709655937; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pkZ/Ma+F35kpsJXp5Oo5SAPDn31tbUEPaH0ALeTfOao=;
        b=aqbfzfBPqXWSeLTiQ2ualkrdcc6q4Cq48RXmz4L7rcR0ahLgDcAMIHryXm5TN3dUZ9
         IcDkNuFhbyGZz1BBASEnl69m3xKV8ao3oLd/47jve8vnyfAuZy71DpufacIbUB1vRKIX
         Ltp4uFEr2yvX7RMGn9fpJ23A8PgMUg6vwzGkdWRxfsHA+RcoX72g/hs2KCV0KU3gLjAz
         qRnBLL5gQhQUxvzi14zYA0YyXjQSDlRAQTxPXJDy9vBuJjjsQY2jJlRRbdqYr2LUMG/1
         PvTorzgL1Bkw6nvu324+SXd44ssrqpwENvRnGUqWkvs83CENM4m6C+frJZx0D1AZ0JHY
         DLAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709051137; x=1709655937;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pkZ/Ma+F35kpsJXp5Oo5SAPDn31tbUEPaH0ALeTfOao=;
        b=cjCTVLDfvyZ20+ALVjTiuEH5DcmR0/bK3m7SKROdiG4AGbUV7IxYZvqZKzm8JZcuD7
         zvKbmp8gYAApnE2BGIGIsvihviU5iWF7LRQW3j4KyDgb8+XNZis6iuXw9aIA5YprZscs
         qvIudGUJdkNJaDLIV4D3HOWwpC/TDUfw7JezpjeNB2nhnl+F00zuV29dx7pLLaiV+GQx
         2aLOymk5M9Nc20VdEQlfN771fakp8gcXSsMuzr1O5pdiNJYAGzeDY1NwiIdudj6nm7h4
         3XmwQ3n0lcl59FQDF+YYu5wXrAIY7H6tprNWDcixzQpZ8fPb//avBnH1oHjKwMCtFapP
         5pCQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/XnOf76H/lElaUMuUARSdYU/HsOptBDogmpRpB5xk/yOqbpzyYBuDPSL4Lb95QpD/VGLAN1jiMYv5EY0woy1SRubF0GyVijewQDKA+A==
X-Gm-Message-State: AOJu0YzG1Q3HYwqobkFeWYZLtaih3hBci11yQpFMTdbcZSvBQWaTtySv
	AEQTLPDU1zg30lQ4lH5nB99D+KGQm9JrDd9guD59DI7Bfrh/McyKs5rznpoPWEa8MeJKg3GrUrx
	A3sC0bzU9mOubPGutiSUBtHgJMww=
X-Google-Smtp-Source: AGHT+IHIiOUa0KuY6detsdQWZ3j3zaeaOiBoMcz4YliWAIChJzD7EWH2q+D4ztPSG1obNLA6ao+7kAFn0lpTjtkv/xE=
X-Received: by 2002:a05:6102:1158:b0:470:7af5:7973 with SMTP id
 j24-20020a056102115800b004707af57973mr6655661vsg.29.1709051137000; Tue, 27
 Feb 2024 08:25:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240227080943.13032-1-michaelharriscode@gmail.com> <da4ff70d-6c64-40b6-aae4-3aab87da2a1c@moroto.mountain>
In-Reply-To: <da4ff70d-6c64-40b6-aae4-3aab87da2a1c@moroto.mountain>
From: Michael Harris <michaelharriscode@gmail.com>
Date: Tue, 27 Feb 2024 08:25:25 -0800
Message-ID: <CAHXWO3Rm+Vn=Jzb6=mcCbUhE36KveaNfusBBGz6bWVcu3WturA@mail.gmail.com>
Subject: Re: [PATCH] Staging: rtl8723bs: hal_btcoex: fixed styling issues
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: gregkh@linuxfoundation.org, hdegoede@redhat.com, Larry.Finger@lwfinger.net, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 27, 2024 at 12:55=E2=80=AFAM Dan Carpenter <dan.carpenter@linar=
o.org> wrote:
>
> On Tue, Feb 27, 2024 at 12:09:43AM -0800, Michael Harris wrote:
> > Fixed various checkpatch.pl styling issues: spaces before tabs, constan=
ts being on left side of comparisons, unnecessary braces, etc.
> >
> > Signed-off-by: Michael Harris <michaelharriscode@gmail.com>
>
> Please run checkpatch.pl on your patches.
>
> WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit de=
scription?)
> #12:
> Fixed various checkpatch.pl styling issues: spaces before tabs, constants=
 being on left side of comparisons, unnecessary braces, etc.
>
> regards,
> dan carpenter
>

Thank you for letting me know.

I will break down my patch into a sequence of patches and run checkpatch.pl
on it before resubmitting.

Thanks,
Michael Harris
