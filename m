Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B876A391846
	for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 06:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776060567; cv=pass; b=H/l+9DdnOz1/SXoojLsNDjegsk39EBERG7wO17kLXD98Qh5/yc3Z84zDw8uYshVT26vG2PpcB452xgOjumMulqMDL00LfIIzij/y2ImImqrxGd4+iZRZ7gsFw3jUtAUCup3LpeWTnBy7Q7Daq1ubCTO288/GEkhCjEnu+UKcve0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776060567; c=relaxed/simple;
	bh=OiV2w1gDFSOFwIi9IbkYMeKe/6rdSHAAIj+UVdB7T+Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DzkS249DwoqelO2NJfVuY0/ZAtTMY4FD9Q3ETRFFGMx9zctZhNyiKTlcTJZgshi5FQ7KyhpA/BeL+zHU8twcd5SxEPcjK12kFJWDdkWBZ2UsmIWW6kCzfg8DdwYidr6qJcUooc4XngHFWWr/YA6Tb/gI8UC/bGO5GUx9xfpMVJA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g4QtEhY2; arc=pass smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g4QtEhY2"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b9d6c8871c7so558754866b.1
        for <linux-staging@lists.linux.dev>; Sun, 12 Apr 2026 23:09:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776060564; cv=none;
        d=google.com; s=arc-20240605;
        b=PTIzjzKWVlP7SgprUtaf7ZNBDxlL5OSPTX2pgGcvaAt6EifxdJ1b0SpDdbv1wxkIhp
         sdsRZ7FEhu7DQwzQS7AR2WwfiNlo/FpdrfhD2SaW+MH6KqlB94qxYYTNf0AbI/kiaRY1
         GqN6IlteTSr7Nogm1KsTVt4Az1FyHIkq8IQE+2JL7mc/2omVEQ3dBJtqBho4M1cBfNsg
         bqzz8Kc/s8bt+LCwLjKO60F+jKwHyVrf1TL4fOq2AUdS4wGSmAsRVskZ9kpGIFj6qnAz
         27Db7+nEQFq0enhFEzlW6Y2bfV9xOX8eH3CMVPJuD7CNTzv+2ca8VdF2SNrjABXLxMxB
         GPRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OiV2w1gDFSOFwIi9IbkYMeKe/6rdSHAAIj+UVdB7T+Y=;
        fh=1ZHhFjZuzhuUEEI9kOZU8G6yeaIttdVqqBq1W9+AHTw=;
        b=JkHY5dpq5Cy3Hh+/I8KE9FgjApOXVp4m+u6lU42tzdxJcs6AuIkYpQsNDC7Zno/cGq
         MYoqHB4CLGUd4CAlHJsNjJwzlsmswa4Av1ycmPzoEmygIbVLM5VBa3aJBLtN8Pziam1i
         Onc6juO/tsR8rHubBUWV2/7yhz5el+L51FDy131HoVdNyPwqsuzmivKegGwxJLfsFGm1
         qYYwvGseKF74f7NIzVNcIgHOzeJNno+bbv3vM0lp8Vtl2/Eg3/ucPynGDaLYua+kvofo
         IREsXGkoDYAD2BXjZrjxjpc8ZmyQJflJN5hyiAXWVOJLDYTKJzRunqESjgripu7Sf60r
         6n6A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776060564; x=1776665364; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OiV2w1gDFSOFwIi9IbkYMeKe/6rdSHAAIj+UVdB7T+Y=;
        b=g4QtEhY2IuTpHruGOVG5xhMyJN/5ghnu4JT277HaSDj+Vre4F3lDrC9jNmC80FuIB/
         lEI4JH1cPmin3EYfoymjzIijYKEtsyJzibyE9oz35dYuXv9ta0uthBZJpIny9pag0IQQ
         VehCsSQGHqEp/vs45SanaBEjnIqP3sTSg90SegUfZmxI7rwu2k/S6uzVObfNC7AfZ2+J
         wND6KmtdoBqAdueb8zD0wc6g9JEahUKG0as9vkLaKEpeD3+pdZSY2mK6W+C1wdKaizgE
         VbFO5YlpUojcZUe1Jqm8soAr9CoV933lNwW+hEgVx8sii2Nue4QNjoCbpGSFFeiLcpzd
         fVCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776060564; x=1776665364;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OiV2w1gDFSOFwIi9IbkYMeKe/6rdSHAAIj+UVdB7T+Y=;
        b=sbAsIEuxcZ1B7D6mf4T/NbksNmPd/ZmNfqrBeelbrJUCohB8Cq1M1AJ+4YI7sIuwEN
         WHTCYnqMxz4mjhqJ1pKsErLCcEXQJ6Pqf4Udq3xgO25sqwOkguC1538aAbPUNe6fUR4Y
         1MzxYJ3oOuZbopSpgCzl5LaFidHEY6bNWRvP6ndKsMNq41PEFtyxN8WmUJM0VkZP8Sgt
         kmFcgAZv20+a8gBc06Ribf8FXr2ZMYFzwhtqnyOrVMDx70vl9CsOIR54LNmjNvMsonfo
         LGQVZQ1/kQWGp+bNwIqIYBFVh3EzChHc+csybfaNUmY+C9n53kvy7g2sDu2VNtaQTenl
         Zsew==
X-Forwarded-Encrypted: i=1; AJvYcCWFVjxhsTLJZEBJW5sJRrUW+YEXs1F36jB1//p7rrjy1EQEaZ3bw1/vacaD4myMjF4cUwhsyCdAXGwXl/n1@lists.linux.dev
X-Gm-Message-State: AOJu0YyBi0Rrm1yf9LZ7yNO4+kZyvg1HSQ+WYBWSUhLWoUzfDt4nzZRx
	TqsGCohj5BK5yE2YNrc1SXgfq+3+CKLvPigFSKthhYyvRHWp5jH3/cDHk+x9nMQjoRgPLvHsW7b
	NpROMFB6KRqoSppeqEVhrV1ZdfKXArM+GqrFk
X-Gm-Gg: AeBDietepUIU0prQWQ3V+NyI1fDAhMWmjmVMX5PUVBNjx0hl9Kc7lCTscQo4tzlCCO2
	O6+AQM4XFflIUJQwy86cd+HnQMGy+5GItDa6PzIFBa1Yz6o6Gs7T/eF6K6/s+NuvgSYqDuCYVu/
	kEjIvp0/BEKbeSlR7HTVINaJqhksXsxk76e3QeyLSb8VkNk2DkDVnBzKWRo2PehAutbX+ys+lhK
	VGjeWWcXvdeIGf656QY66qprCgTIsef3vJ0dZDbUwV7sn01/oQYyYgK1m+75ReWhvHRxifFAZWa
	rioH5hXsnd4cMtKimSAZlHUPg4mF+PTuS18xn3294nOvC832ytq1CRsIw+/7xL/qdU56cqc+Q67
	S3vmgBC0=
X-Received: by 2002:a17:907:1c97:b0:b98:6984:6630 with SMTP id
 a640c23a62f3a-b9d724362a7mr613445466b.8.1776060563823; Sun, 12 Apr 2026
 23:09:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260412173317.3329-1-mzndmzn@gmail.com> <20260412173317.3329-2-mzndmzn@gmail.com>
 <CAHp75VcdWMvvM-oKTqRACSXSUiVsEh1Ep_82MsJxfbrG4thUdA@mail.gmail.com> <2026041338-guiding-concur-3831@gregkh>
In-Reply-To: <2026041338-guiding-concur-3831@gregkh>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 13 Apr 2026 09:08:47 +0300
X-Gm-Features: AQROBzBRxOFTl4Y0hRK_IfrGAfpqN1gBxS94tU4qKCixCJahw8eu990-6JlRl2s
Message-ID: <CAHp75VeME9eDOZ5KosN_sXTP5CAcOGqPfh4Ld=mamaO=jOJ37w@mail.gmail.com>
Subject: Re: [PATCH v3] staging: fbtft: replace empty macro args with identity converter
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Baker <mzndmzn@gmail.com>, andy@kernel.org, dri-devel@lists.freedesktop.org, 
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 13, 2026 at 9:03=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org=
> wrote:
> On Mon, Apr 13, 2026 at 08:58:50AM +0300, Andy Shevchenko wrote:
> > On Sun, Apr 12, 2026 at 8:33=E2=80=AFPM Baker <mzndmzn@gmail.com> wrote=
:
> > >
> > > The define_fbtft_write_reg macro calls 'modifier' as a function.
> > > Passing an empty token as modifier is undefined behavior in C for
> > > fixed-arity macros. Introduce fbtft_no_conv() as an identity
> > > function to replace the empty args in the no-conversion cases.
> >
> > This trick is used in the kernel (usually for u8). If you really want
> > to improve, use _Generic() instead.
>
> No, sorry, this code is fine as-is.

Works for me. I suggested they explore the possibilities, it might be
helpful somewhere else in case of the similar requirements (like in a
new code).

--=20
With Best Regards,
Andy Shevchenko
