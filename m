Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88329134CF;
	Thu,  3 Apr 2025 07:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743664158; cv=none; b=R2IGUWDVsiJFoYvhj+L4zndG1YF76R6rP2MHJyufhFniS9417hWpotanv/kDGgnyh04rxP9ClPnICvfKBEwx2qhDpvpmgP645UwDnvdLFaZSgfUZH9LqKgJKzybW9+Vqe6uG652MF7zGLvEAiRlu34dGxIOIVJIoBrqA7miENEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743664158; c=relaxed/simple;
	bh=DHnHqc7xTPXIbcMBbnMmP6LtCGcfSw0B37npJ6vzXxQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qdkzAXC5IJsg1T5skIXk4QgZnzzzvnWr0LaSokBsoR0QxZiLM7idtfLMIvA5QBtuHHUs5yTZHqP3swvsHb8ovojKaE9C4ept5OA6wFR/AksHxXKSV1gpkp9umfbOvFRMjzOPMlqCqx9PgUoG4mIZLMZQFLvKYLSzqdRsOhvhLik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ByQw9QzY; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ByQw9QzY"
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-523d8c024dfso296556e0c.3;
        Thu, 03 Apr 2025 00:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743664155; x=1744268955; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RFoq87g3RUpItgd7yRqH4elpvnagnn7yUoA5hke1FAM=;
        b=ByQw9QzY9TPiUzHB/JovepC84eXa+Sw+cGyiej5dz1f/JnKMbB6caRlpO8R3DaEEJa
         9//uQd7Vzu39GeAQgusWN0r3+Cj5GtcephbMLODFbRz20mW9IZTLu6lhX6UmT396bLvQ
         9GVV9d0aNYs30L17bCJNs5Rz6ZnQFhnusEIlMye8ip4vSeYRoZ4/hht55Fz00NC9GR+A
         yJmlwx5VyTNGDUSJtXn1hrp7NG5gNde9hiCt6yJR/csayln8y49Hyr7HVeJsglek4mq9
         u7n/NfqWn8XcnsLgKvvuUbZeuZxHrC+Mn/l+dZEYa2eqllx2YItV36/cJoqNI3t88NDC
         1vZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743664155; x=1744268955;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RFoq87g3RUpItgd7yRqH4elpvnagnn7yUoA5hke1FAM=;
        b=xS0mRoZmWR63XbpUu6ZeyiI5bir3KCGw3tmzcfOXQJEsyKQ6WveazBToq0BXR2rQSr
         Q9O06QbqdQlXcfAy2tUbZ2XUvQLYypm4BMSoR++WUZnyFr4rgsqAs/dvXPIlOeOHV78y
         tlTn+kb3urO4HH2Yw2fr95N01rh+YeYkDo21l54TfVfQdxEjkMYfMszJySpZCNkwTwY+
         urg8MSUdKlyg1rIPL/35sNIDufIDEKIv/4Djdd2KhWTBeuFOME0ZpsJ2ugaekjlWdkP4
         wAwaqVs0I++6KbsDyVq9Fj4u9v/Ag4vd6Xq+oXQv0KaTTReOYrGXXYuW7+QXdtN0b1zS
         0yhg==
X-Forwarded-Encrypted: i=1; AJvYcCVAIyZ0r86t6mc4a/0IP3+EEEhr0JYWx5GkXH5a0xr05FWzymg36QknuwJHT9h2aDpDpU7buf2/Tzp9L7Jc@lists.linux.dev, AJvYcCW/XScKYPIyN3rOWLNZW2LFr0T59ksq51D9V6AaKkRbc+pr8ek2C/rPe2hpzJzT9N8yS0t0aI37H6WJ@lists.linux.dev
X-Gm-Message-State: AOJu0YzFn1Ro0Ho+AXOxjX10PUviq2Fs/qLqCQ70fqbLys3kqEEOpsjZ
	qMH5htibqX3Wfg324PbH1fQWknQRn/jETTtIB9bEPkuax0FxPXS5p08nnAdk6E6x7dAp6iK4Fpg
	KTrnVTOLMZXFLzXnJdUgsk5b/MGw=
X-Gm-Gg: ASbGncvkvB75JhPCZDZThe2xUIYULu7eIhrRVbYkfYpuoFVB+9eu7HRFx6odVX3wumQ
	vG0QguyI3UcPICaBfJtc8D388WexjAQZpicqxOvF6AhhCi4TV34dluH8oskSlzLFidJy08UJtFy
	CKEdk0AvXXfPsLuMxwuMZ5KeA7Q1nih7arxKWRZZ0=
X-Google-Smtp-Source: AGHT+IFOYY8o5OXC7BNOpL314Y2KkesOlD1Thnx9JW0TD8ulbkyEzlFqBnntu4H/6eYSqGX7s/EYQq9bM8bUmRQAYio=
X-Received: by 2002:a05:6122:8295:b0:525:aeb7:f22e with SMTP id
 71dfb90a1353d-52758da72d9mr1008296e0c.7.1743664155396; Thu, 03 Apr 2025
 00:09:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Z+05IEjV3pczMLNQ@HP-650> <4c35ae41-c834-e25a-ccab-5cdd34aa4680@inria.fr>
In-Reply-To: <4c35ae41-c834-e25a-ccab-5cdd34aa4680@inria.fr>
From: Samuel Abraham <abrahamadekunle50@gmail.com>
Date: Thu, 3 Apr 2025 08:09:07 +0100
X-Gm-Features: AQ5f1JpGQqeJrBUB-VvSXTgpFhMBgMWSpDUjQtsyK6vTde3Vr4caK-xmt4hx0DE
Message-ID: <CADYq+fb04joR=8b3zERT-K41y-+Czo=U0_M8GsQWPZbpAov=0Q@mail.gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: modify struct field to use standard
 bool type
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, outreachy@lists.linux.dev, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 3, 2025 at 6:06=E2=80=AFAM Julia Lawall <julia.lawall@inria.fr>=
 wrote:
>
>
>
> On Wed, 2 Apr 2025, Abraham Samuel Adekunle wrote:
>
> > The struct field uses the uint values 0 and 1 to represent false and
> > true values respectively.
> >
> > Convert cases to use the bool type instead to conform to Linux
> > coding styles and ensure consistency.
>
> This is vague.  Ensure consistency with what?  You can point out that tru=
e
> or false was already being used elsewhere in the code.

Okay Noted.
>
> >
> > reported by Coccinelle:
> >
> > Signed-off-by: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
> > ---
> >  drivers/staging/rtl8723bs/core/rtw_ap.c      | 2 +-
> >  drivers/staging/rtl8723bs/include/sta_info.h | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/=
rtl8723bs/core/rtw_ap.c
> > index ed6942e289a5..82f54f769ed1 100644
> > --- a/drivers/staging/rtl8723bs/core/rtw_ap.c
> > +++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
> > @@ -389,7 +389,7 @@ void update_bmc_sta(struct adapter *padapter)
> >               psta->qos_option =3D 0;
> >               psta->htpriv.ht_option =3D false;
> >
> > -             psta->ieee8021x_blocked =3D 0;
> > +             psta->ieee8021x_blocked =3D false;
> >
> >               memset((void *)&psta->sta_stats, 0, sizeof(struct stainfo=
_stats));
> >
> > diff --git a/drivers/staging/rtl8723bs/include/sta_info.h b/drivers/sta=
ging/rtl8723bs/include/sta_info.h
> > index b3535fed3de7..63343998266a 100644
> > --- a/drivers/staging/rtl8723bs/include/sta_info.h
> > +++ b/drivers/staging/rtl8723bs/include/sta_info.h
> > @@ -86,7 +86,7 @@ struct sta_info {
> >       uint qos_option;
> >       u8 hwaddr[ETH_ALEN];
> >
> > -     uint    ieee8021x_blocked;      /* 0: allowed, 1:blocked */
> > +     bool ieee8021x_blocked;
>
> This declaration doesn't have the same alignment as the others.
>
> You should also check whether this is a structure that is read from the
> hardware.  In that case, it would be a concern if the bool field does not
> have the same size as the uint one.
>
> julia

Thank you very much. I will confirm and effect the changes

Adekunle
