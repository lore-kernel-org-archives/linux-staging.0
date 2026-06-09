Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF60D2C15BB
	for <linux-staging@lists.linux.dev>; Tue,  9 Jun 2026 10:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781001766; cv=pass; b=CXDH5x+zXChHUXEHeYSMUFHu2c0eltdm4th6ykut8AKbMwwXrjb3ZYhhPDPdTAgqU19v5rlIeMJGkcREpBG8r+Tqhvkqw1craXWzs9QONSDXJa0PTPQrXPoAiH8/TTNQyw3apf5juS2QpZzCTEFGBStT6y7haAfmGFS0PhgnG28=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781001766; c=relaxed/simple;
	bh=8Npnda7vylBuqhopj0ud5BgSPx1uHH6U/z/Q1ikLsAw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jjs2OU4S26c4eHUWz2x+tWSyGazMlolPHDescxjQUxHn5tmi4l6mnOYv3SRNsB9BJt7xs0MR3y2ZM7xa5zgOhG09mzBbwz8wTPAxJEcC4FWLUWuZIx39V37zRqGDkpZVL1B2BhmsAzGreBQx8Y+svAHiQNjNECv0as7sKhM6GJI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JO7yLTyf; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JO7yLTyf"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6924a68e3f3so531188a12.1
        for <linux-staging@lists.linux.dev>; Tue, 09 Jun 2026 03:42:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781001763; cv=none;
        d=google.com; s=arc-20240605;
        b=B26mFBSUNd1ooeEgzG7ksWJGiNuoI1Le79IbscGAipPsoN9kVaBKjvJ8uW82hE2mW+
         DQUYPbULWQB66Z3mul4jysHlUPIE3Rq9mHwEwhRlHBVIe4IBoqThPRk+bL08QQbA5NPC
         Yc1A+pnPaHcV08fTo9mMovSyN7O96qVCgviZkq3JIBxrfJcwDChxAVKc2hunHCLzCq3a
         OFi2K4bfSYFprkcZf7gE+wyHbJJRueQDIamz/RxEPHazL/WTX6dI1/IxUE9dR2V+E91y
         b8bIte7sYTea9xp22XciDtszu0pzPd63SqvA9E8/XsSyaH7gbks7GKndilyDFis2oknm
         jzZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8Npnda7vylBuqhopj0ud5BgSPx1uHH6U/z/Q1ikLsAw=;
        fh=u0vmZIGLtLzRI61wa42y+DyNbilS/dYy868Z/mnCe1E=;
        b=EYQr6x6YHKETT4Nn4pyxDAgDRK/yu61dgOTgX4qpwrLBC9xZzhVUpQ1C8VewYqHHF7
         tgHdlBOKOtcMaWEXkKoYbq0RfsIx5WH3Ybs5s/xM6dCG9xHHm7IES+j9qXAFuJKcR89e
         Rj/XLNTmlh0wZ6i+L9w/ySPCSM4pTR7R59C4bZeyhFeQUKO2pnfmCkxIAWfnzfZ1sev6
         NchtXp/cj85ZdNIa2t0rXbM+5NcEWP0J0KXtEEFDXrHDbcfvqC0KEr8hRvWFdAgKe7bH
         VyTbL5BtsSLkViWCA017ApanLWiyJzZYftBadhWNZ0pOdz9hP2MR+5kMOEsuNXA/Z5RA
         cVGg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781001763; x=1781606563; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Npnda7vylBuqhopj0ud5BgSPx1uHH6U/z/Q1ikLsAw=;
        b=JO7yLTyfttl2/SxXMQYrTVqTzFgzhSV9yC+ufGFqLyDAfoAQI/vLJb8xlATEV62idM
         MuvWoV5nrwKPg402crqXuCtDYVWoNpVRJgKJFK+20I89uaNpANTfhlN7+26JD4Xj6esn
         uvrjmuEyBBBhnjUwtZdl45XXiiHctOsrdQ155R6kWXOw2uPrUj//S2ilIo1ve2x/mA3v
         0i8ZClMmgY0rZAsq797xfXAdk3Er2153dTTkURNSir4YstdaLK26uzyXk/XEvXmJhTcV
         aaRmU99yHPNgBoFdWGBwp3Y2fSdj0WjBWdnhMF+xcJEiOau+Qvvu1+DIoepvjR7M5LJH
         j1xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781001763; x=1781606563;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8Npnda7vylBuqhopj0ud5BgSPx1uHH6U/z/Q1ikLsAw=;
        b=j4tfzU+O1gOblUuVeFGWthoCGB1EMMM4JIpuqykPNWQ7Z3meM6rRGi4LaBErCXcdx+
         qPsazNRnQ3DURJ6w//swhaEvDMwEG0djdhq3mtaUqNfF77jO2QItb5W32REQH/Uuwpxu
         SHwlbTjjxktdkMlKe/XZhOqezzsOxJqsKdcrEnidECeAvaKSvSVFttVSmWKSKJ/zU4te
         fAusu9AfdaKnkMPfhPuF8r/u4a97g39OMdK9Sj+DgSDoqVMdnOZFNBc+1X1C3PXLP+T4
         dMga1E8hfzuCbfvGJ3GaffJKKXF6TKwtBE/2hOqbfabYGNGpJ9oWyRVSastLMq+Net2z
         WF6Q==
X-Forwarded-Encrypted: i=1; AFNElJ+lPVnCNAWi8jmBwCEn+Q7NsPDMhE+ONbSzzXVC9ciAduIqrgbMAJAUYec4DhaaEB2vUsRsIaJm0fK0RX2/@lists.linux.dev
X-Gm-Message-State: AOJu0YyQokt3XBc1b8mNacqNlcarM3O23GYt1eAoIdR7bmLawmwXQmqP
	ZAFfdUNMcDo1rnijBPjbK96wtZzDfwprGv8DoLdqMBzapxfqgBhquAFXgwUXP6bI8ebNmsY/0W8
	92dq6Ixugp3PRjwf+Iqcg20Lcqcv6dw0=
X-Gm-Gg: Acq92OFuzUOApp/fmkoYzhbcyf3QMXbIONp5vysAb+j61FsqwqCul3ykB4RzC9RvDKe
	aV5xMlbcr0EcCOfhoG8MolXiVst8eN3Z7gjUMnbpXsAr6W+lqlx3LfJHgmRsK+anBgXQkh3PPmp
	OtxCBLUSiz5TxTJXlirRkcZmULQBfuF/+yGV7WPFOvWdylc8iStlJUk0GMxpSmNvIlUHq5v1uOn
	s/IBklxDv8T0Sibv5FcdRGyawa+MI04VFKmEpYfKEbXgHoZFz45uT5BZfDBANB/4J5jbKA1OQSk
	hGABoSnR/J2j80UNpGSn2APrXVstJ/TUjYa517J27/eEAgOSdapSfWWFGbfmUoZ1vO5Dp8PWVVy
	vS0oyyQKojg+23SSMW48npihgVFPq7CU7bPkjzfj0DNQDxlp7XIhemimXr1EE5LEIp3MJQ1FBjU
	+42FM=
X-Received: by 2002:a17:907:7425:b0:bf5:dfd2:4ea8 with SMTP id
 a640c23a62f3a-bf5dfd259d0mr413829966b.41.1781001763037; Tue, 09 Jun 2026
 03:42:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260608151617.3393471-1-rhys@tumelty.co.uk>
In-Reply-To: <20260608151617.3393471-1-rhys@tumelty.co.uk>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 9 Jun 2026 13:42:06 +0300
X-Gm-Features: AVVi8Ce0UHL4o4s3y2b5093fUndEoCXTxSIRIaaI1mp2XkTHwCZNcHoAQhmWuBM
Message-ID: <CAHp75Ve3Cs95e4CLHDfO0_T=gSDa2tDBS+eZTAJoHxWd_zWMAA@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: fix variable shadowing warnings
To: Rhys Tumelty <rhys@tumelty.co.uk>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Shevchenko <andy@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Dan Carpenter <dan.carpenter@linaro.org>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 8, 2026 at 6:16=E2=80=AFPM Rhys Tumelty <rhys@tumelty.co.uk> wr=
ote:
>
> Fix local variable shadowing warnings, flagged by a W=3D2
> kernel build, due to -Werror=3Dshadow.
>
> In atomisp_css_stop(), an inner loop 'i' index shadows
> an outer unsigned int i. Rename the inner loop index to 'k'
>
> In ia_css_stream_create(), the block-local 'effective_res'
> struct shadows an outer local declaration. Rename the
> block scoped instance in the loop over pipes to
> 'pipe_effective_res' to clearly show context.

Before even looking towards (some of) the W=3D2 warnings, please pay
attention to the real issues the driver has.

--=20
With Best Regards,
Andy Shevchenko
