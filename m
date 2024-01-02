Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D718377
	for <linux-staging@lists.linux.dev>; Tue,  2 Jan 2024 00:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kX8gyU4L"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3bbd1e9c5f7so3196809b6e.3
        for <linux-staging@lists.linux.dev>; Mon, 01 Jan 2024 16:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704155397; x=1704760197; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ph6TDL3JYb6QU+ylfDz9PufoDKnGEKXnDpwEDgPhJMc=;
        b=kX8gyU4LA8Gp9nDsBIkaJZgYIak/WDJdNW2xnoSaaKDqvTWNJLmiu5drSZn59tZfr/
         wCFfK7FPuuon75wMZrV+YYoiFiGVaOr+6TPybBj1z72PFe3letNpQ3vujmZ+gg3nAPnZ
         kSnI+22w1+hZrWYwe77gmnd6iVwl14Kg/u1wFxmmqEFjIoq/Hcpkfw3k4Xv2bocPd0HH
         SRsBJuotUGxOSsWQN+4o1L0GXbXcIH4PMHkiGX3c9jRkb/YcQoXSh/IXbtaW3Cool2Jx
         QOKlR+F7+QuJ3iWQQDfe7VXy11wtuZHysTNgJ/ibbrOCrir0/D2tWFs42L4/j3+Zh56L
         FI8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704155397; x=1704760197;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ph6TDL3JYb6QU+ylfDz9PufoDKnGEKXnDpwEDgPhJMc=;
        b=rgkeeY51Y5k2CtZKoWPeVVW0V14PLqiaCDN/aWal6zgI5lA/MVEUWBJ12XCHUOXDyn
         KJX+5xwYI4eGK2ITIjvJt1ZcfnxldU9fgP/ywxM0FwcFQinphW4az5CfOVMA+uENuKAE
         FkiAd2LkmAclPEYnb0PfeQY8VlHzKrcrGVSTLid3HBqAAnSuM8JrXckb+KzJlNppGxuH
         Fsl9iLszm+BUUyrU9VO9+4BScVHlD4hF/+BY3kAUpRsfDiBBrprkdXA5KHJvnWVMMf2O
         N++cPgrir44hvq4XfGdzoGCkwTQoXN+yPPauPxSljrA40oCb96+6FBXGyNeIc9aWd7Nc
         4LNg==
X-Gm-Message-State: AOJu0YwGkyi40LIDvQ98YfeKJ673cqegfi11Y3i9BKfHELDQ2QnFJKVb
	IfnyK/SjpqHigq6G8XOLGraWYxthsvyUK/voAiE=
X-Google-Smtp-Source: AGHT+IHrwOvyHtB9syDbyARAjWpBYE0MoRi5r7DQed0Kdx28vHGvdLRwDvKzM9ZVp5buUu32iaJdpzESJuATkKqmCak=
X-Received: by 2002:a05:6808:384d:b0:3bb:be52:49fc with SMTP id
 ej13-20020a056808384d00b003bbbe5249fcmr14602556oib.84.1704155397327; Mon, 01
 Jan 2024 16:29:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231231103057.35837-1-hdegoede@redhat.com> <20231231103057.35837-11-hdegoede@redhat.com>
In-Reply-To: <20231231103057.35837-11-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 2 Jan 2024 02:29:21 +0200
Message-ID: <CAHp75VdtJ2WhZKNH-HhsTfSUQykxVcqDqsW5aX-dbwuQeLG+PQ@mail.gmail.com>
Subject: Re: [PATCH 10/15] media: atomisp: Fix probe()/remove() power-management
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto <kitakar@gmail.com>, 
	Yury Luneff <yury.lunev@gmail.com>, Nable <nable.maininbox@googlemail.com>, 
	andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 31, 2023 at 12:31=E2=80=AFPM Hans de Goede <hdegoede@redhat.com=
> wrote:

...

> -Note this also swaps the order of put()/allow() and forbid()/get()
>  so that the sync versions actually work by calling allow() before put()
>  and forbid() after get()

Missing period at the end.

--=20
With Best Regards,
Andy Shevchenko
