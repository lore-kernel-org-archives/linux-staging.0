Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB34A263F3A;
	Mon, 21 Apr 2025 12:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745239345; cv=none; b=akN9etaHBPSp82BsGrW7qKFkKtfO1uKd4rCw0ARIe6ihj7JxDJ7vPxLvc0Q7makfveQHOZZW19bDs09O0dn1R0ZAfeupNrFynGIwz80FqFmT/BUW31lNuPQA/hRPWipeujgGQRwxtdJ/mWmfAi0SC2GmGq0nLYprpIKU9t8LPfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745239345; c=relaxed/simple;
	bh=ySaU0zfcByRkaTwII81wn1XRoHdzTb73+Y3DGUNQiWA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PG+jI8f6yTS2sQEecB2+nNAK3x5Rpdc6O+9qbhRb6JKhhG0Aj9Mn5lWYn/CWpD1z5n3+dQRXUGKtG92/6jwSGIKpmVlyBcuwTJq49AhhsLwbOLt7/yQEFlKcrqtvbucojI8rrGfc7gYxesrML2n6pKsNlG2VT559i/1XB+Aphdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Adp/3FUi; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Adp/3FUi"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-476af5479feso43257261cf.2;
        Mon, 21 Apr 2025 05:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745239343; x=1745844143; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7PTLCflwUHpQ/HL4KjpSfyOHQhDYwwUWvDGsEADJNO8=;
        b=Adp/3FUiQaGgaJVz5Ou9Lyu7AvfP7bDpUV/4dnEeHQUwm9UmRfwikgYJqH2ib5NYL4
         pOt0aZYje/drRkqyavqM9+F0J5K1nQ0mMtqCTIo2eMwzhx+X27c6KSLdtYXwYJq3K9UD
         F/vJFVcEr4aHrQodnurTJMefPYBErMAxu2IMueUb+IhIaK0a3ZYpXWu5c1LCgkvvzCsu
         d59/of6BZV5dSrfz7E1a2UT87jwB1ngcnzppaUAMV+8+NybzAh9DxdSBOV2uCIllFmRw
         1fSRXyoyWGi41M1kXeO4+SBqc0ek+oUYqt4nuoCnjBGHb6Xo/6mg9jGbI4E45N+COcix
         ah7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745239343; x=1745844143;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7PTLCflwUHpQ/HL4KjpSfyOHQhDYwwUWvDGsEADJNO8=;
        b=OA9RAU1iuOL+3v2KjINSo/WcTJ3E2XDcq9rruGKUJ/Xx2OHs3CvtqLdlM6hFWnVIwZ
         E/cUptr5UMwjYc8H+fgFreXqUyBCxptTPOuGDSoyPX/46LQT8yd9q9441JGWLRA0fVKh
         ZKJdCVRNyT/qxHtHgVgXpz/9m92ux98RVGVTzoc5QuTi45c3fBv4I9y3Gyr9p7uQRTLa
         KvyZeSTsQGrH68xouWj6wVu5hQGtRs2yQL40Txp/RktR80SAq9jBgLC5lJqimHb8QLzI
         TqdG7COs3ZBSIi8J3jY6hJz8K9O2HejBju7vvyz22ZLX/T23lpiA/mzhP6xfci7EELHg
         /Cwg==
X-Forwarded-Encrypted: i=1; AJvYcCVnNA24DbWCiNa74IggCbQqp9n8+SXKngSqHABM6doI8Xfw//f/wF3vwLOf0pyiNq0rUyPkUERoA7613bR8Kg==@lists.linux.dev, AJvYcCXGNgPtqJDe+WifIlxymJ3z7jmDPzikAOoH9+5DG3lXPPog3EG4JRFoW84zj4VcZmFH72fKxFzW7LkcLto/xjZLAUHTQA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzhRbEQqJjYV1EBltsThFYIRmLZx5xGdMFYPyR55HnDizgB7lTd
	Rrum3vPdsYATiEAjEmGoulHCzQcfsAJfKsW0t8FN9sfzgBWSrT0qvjDiD9gpwtmYryqaLgSJVtO
	9+rnVrLHezmNFWq9gyV3sWqSH4PA=
X-Gm-Gg: ASbGncv6eG873K7ATvaJBVwXReoCiW1oaGg8BSY+zDAlr108Ja+5ow0rgF7PCx5xPYN
	4jLdRc0yWNzIgoqh/xbi3nyiLXYWlQ7QwP9gj73aco4HQkIxatwVC/gS8xxwnPfAHm78rnaYMlC
	5UWN+bjzSShmDXZ7FcUCUeU5d91M95uZcmTD/GtMP72drs8rg6mAIu+w==
X-Google-Smtp-Source: AGHT+IFGRI6w4PZTzPqR/wy6WxWpUIfMgCPO/lf/RGWDPHDkzKldCNpcwF092qguuCIgto3Q9ayDtKHGpNvNYtXoYHE=
X-Received: by 2002:ac8:5796:0:b0:476:875e:516d with SMTP id
 d75a77b69052e-47aec4c44e9mr191962431cf.36.1745239342859; Mon, 21 Apr 2025
 05:42:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250420013009.847851-1-gshahrouzi@gmail.com> <20250421124401.0daa6a2e@jic23-huawei>
In-Reply-To: <20250421124401.0daa6a2e@jic23-huawei>
From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
Date: Mon, 21 Apr 2025 08:42:11 -0400
X-Gm-Features: ATxdqUG2HbCo2jVQA1NMcR6DOLpddrMYAY_8SU4fLCk3lus5iMrFHCUuPeKi4mQ
Message-ID: <CAKUZ0zLTjXPm7qGLsV==fJZZEFMEiEM78-qgZ__DYhqL7Te5BQ@mail.gmail.com>
Subject: Re: [PATCH v4] staging: iio: ad5933: Correct settling cycles encoding
 per datasheet
To: Jonathan Cameron <jic23@kernel.org>
Cc: gregkh@linuxfoundation.org, lars@metafoo.de, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
	Michael.Hennerich@analog.com, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 21, 2025 at 7:44=E2=80=AFAM Jonathan Cameron <jic23@kernel.org>=
 wrote:
>
> On Sat, 19 Apr 2025 21:30:09 -0400
> Gabriel Shahrouzi <gshahrouzi@gmail.com> wrote:
>
> > The AD5933 datasheet (Table 13) lists the maximum cycles to be 0x7FC
> > (2044).
> >
> > Clamp the user input to the maximum effective value of 0x7FC cycles.
> >
> > Fixes: f94aa354d676 ("iio: impedance-analyzer: New driver for AD5933/4 =
Impedance Converter, Network Analyzer")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
> I'm taking this the slow path as it has been wrong a very long time
> and there is a lot of churn on IIO staging drivers right now so we may
> have other stuff that I don't want to delay building on top of this.
Got it, thanks.
>
> Applied to the togreg branch of iio.git and pushed out as testing.
>
> Jonathan
>
> > ---
> > Changes in v4:
> >       - Provide clear git body description.
> > Changes in v3:
> >       - Only include fix (remove refactoring which will be its own
> >         separate patch).
> > Changes in v2:
> >         - Fix spacing in comment around '+'.
> >         - Define mask and values for settling cycle multipliers.
> > ---
> >  drivers/staging/iio/impedance-analyzer/ad5933.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/staging/iio/impedance-analyzer/ad5933.c b/drivers/=
staging/iio/impedance-analyzer/ad5933.c
> > index d5544fc2fe989..f8fcc10ea8150 100644
> > --- a/drivers/staging/iio/impedance-analyzer/ad5933.c
> > +++ b/drivers/staging/iio/impedance-analyzer/ad5933.c
> > @@ -411,7 +411,7 @@ static ssize_t ad5933_store(struct device *dev,
> >               ret =3D ad5933_cmd(st, 0);
> >               break;
> >       case AD5933_OUT_SETTLING_CYCLES:
> > -             val =3D clamp(val, (u16)0, (u16)0x7FF);
> > +             val =3D clamp(val, (u16)0, (u16)0x7FC);
> >               st->settling_cycles =3D val;
> >
> >               /* 2x, 4x handling, see datasheet */
>
