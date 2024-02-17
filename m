Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF6D25772
	for <linux-staging@lists.linux.dev>; Sat, 17 Feb 2024 18:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708196061; cv=none; b=GQ0vtUjuqt8KUMDA9H7U5Sv7sMYy4Jiu/oD8WJcIQwy/FLiiYy/Ic+MZuc1rl1s7I6nMIY4ZvQ6KBAkSBH7HTfnfbXXWnAqcorDrwqM7/tuzzJS/s1bcPp7092pChOuPvnkdvwsw9hJlXn/2GojWJWqZ4Xsnb1fs314eeb5LQQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708196061; c=relaxed/simple;
	bh=lpaGIxGljZ9znL0araD7NAX2BM7V27dZcwCtMBjP1cA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z3/nDuwcxKbYTX+Nw87KHYN0wl6Fnr9XXAPk1kjXmQXltMWis0p8SFBY01hfZDODcf0yfaImaLNPJFHRSvNInqX09++E1CiUi2fMhtdxbvp4u+/6O6dkZR987bZP3C9X1utdfqq/IUICpCSP4a4oNqDW5y9zR4aGQJbdOJnUmWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m6wSvf2u; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m6wSvf2u"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-563cf3087cfso2942769a12.3
        for <linux-staging@lists.linux.dev>; Sat, 17 Feb 2024 10:54:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708196058; x=1708800858; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lpaGIxGljZ9znL0araD7NAX2BM7V27dZcwCtMBjP1cA=;
        b=m6wSvf2uz6CEP1gkmkHxmZNNZWeCiL6VG8KXIJ9ovMyYVfQ9hJ4NVzY6Zwp6Sxodv8
         Z926QujssW+9HREThiXAq+nTUOscvkTRQzA1vyLskO6vG91O8+wQSqPCphdgZ3O13PMb
         +7jWYyIbMI54+hMfpuCiJZJCRWHq8nFCubX6bLngf/JkOMuB7fGLYuL0gkeK7ZgxwSNi
         UAtfEDuLe+IKMgdlGIdKf/8Lg3wfRYuzeTeEHHA5Z7ZdX/SlXUfcL2t/wgWoHbLpIa0r
         gZBPK6JdWBa+ch6C4fl30Dmp5tB5+qeaGwBixX+i/voJ+woVb+pCYco/dIyHG017bPgr
         vIYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708196058; x=1708800858;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lpaGIxGljZ9znL0araD7NAX2BM7V27dZcwCtMBjP1cA=;
        b=abjKzWNfuQvctlHTKWa4h2rffLswPEvjpCQaYdrifsLk79g2OBR4fYWY0aQjT157Ma
         qZpvW+lk7HeTAlJh1EvzW2FWisWIl/tWM511V1r5TD8/ZOvGqmuXjeAAMQba+PTYhPcT
         cOMaiRAV2iWON9kYP+dyPMJMqKp6SBhxXvnqVzxt+c/RcCzSVsKR/VyVx5BLX66t/iRp
         IdiQIROrE5sENM9QfHm+gtm3vvY+6W4ypDPT5ArvKGsFkfDm8ZIcAN+uPY2W/bN9aiMz
         XQudtasbmAnlOu3Dt3qi/1vqIZvIZ4bh4fge5taGTrdetPMNY8Y2tAWOtHkKh+d2tQgE
         hPEw==
X-Forwarded-Encrypted: i=1; AJvYcCV4VsgTNGd4b5Id5WDz07E2GUcm/HtjNTht7qp2XsyBv1rppqdoj6m2+HQF5HF/wJIcPDtUG6oSk7mD8TZLCIuv59wMijp2de1VaQZ7bg==
X-Gm-Message-State: AOJu0Yy3Fuj8/wd2DoRF6fCcFAWXZGAuLue3YXI/v/gv1vsHr0JEnGzi
	/skKIdXTu4btxDL1SSkQB23unZJP2Iiobui7Ov73cnGTcQvFRcibXZI6uw/ilXGaFcfvP10GEsy
	uiT13CXhnl9OE6NYbT3tOXRzQmZA=
X-Google-Smtp-Source: AGHT+IGsjeyZrIoWAn9g6o/y9G+R76PNVZSpqeNW3+DnVvNuYsVJMGra8Du7czjq+3/s/4+PPzdOVzCEAGZcYOiIL0k=
X-Received: by 2002:a17:906:75a:b0:a3d:205d:1d97 with SMTP id
 z26-20020a170906075a00b00a3d205d1d97mr5535088ejb.58.1708196057654; Sat, 17
 Feb 2024 10:54:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240217112438.15240-1-hdegoede@redhat.com>
In-Reply-To: <20240217112438.15240-1-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 17 Feb 2024 20:53:41 +0200
Message-ID: <CAHp75Vf0Jm4CXig9GOu=WvqyRFj5W4U6gQsNHy48dFJrD3zb2w@mail.gmail.com>
Subject: Re: [PATCH 0/9] media: atomisp: Changes for libcamera support
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto <kitakar@gmail.com>, 
	Yury Luneff <yury.lunev@gmail.com>, Nable <nable.maininbox@googlemail.com>, 
	andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 17, 2024 at 1:24=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> Hi All,
>
> Here is a series of cleanups (prep work) + some small(ish)
> changes to make the atomisp driver work with libcamera.
>
> This has been tested with libcamera's simple pipelinehandler
> together with an ov2680 sensor.

With some minor comments,
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>


> p.s.
>
> Andy, I known I still need to do some small cleanups from my last
> pull-requests. I have this on my TODO list :)

Hope you will find time to address. Thanks for maintaining this driver!

--=20
With Best Regards,
Andy Shevchenko
