Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 056AE321B
	for <linux-staging@lists.linux.dev>; Fri, 18 Feb 2022 04:52:41 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id i11so11721187eda.9
        for <linux-staging@lists.linux.dev>; Thu, 17 Feb 2022 20:52:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Oq0pHI88XRcgmRgUmJQw3hpIZLFUj9jjieH+c9ZOuP0=;
        b=RzCo/jKO4PKJ1Xk8wAmQuvTbeXLkca1zPO6952Z2oOxjLha+Vm8zCp38s1hRCiq5uX
         OyeP7XEoQ3yiNpXR2Y6m5VCWzzZhGh7eK/uaKX7/uTgATffvAXjsEQnAOxR2q0pq8wmH
         xPVFaHAA2gM3IANGWSHLPxZz7t/C0o7aTC1gVOMrDwKpsGQ1Y/ulI4QOpfFb9xc4ALB6
         Vv5vpgQxmxZnj78+drvX2+X0VR6Yf59zJUAQ+SI/+2NEiZ1tWTS0EoCXaUe7nhqG4oO1
         XVnkApELTIkiV6YNg42P3X+n20i37YTBjfsgabu7HpiRSoX4TmOE0ckn9daVlTjYGbTA
         pgHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Oq0pHI88XRcgmRgUmJQw3hpIZLFUj9jjieH+c9ZOuP0=;
        b=ycW4VA5QR2fPMMMAIboDHGu51HRBv5Bf95bj73ISn7kiBYNloxPiulBovX5Bmcu/SV
         OwCyU9WkuJsWHkZ31dhsKW+aBpbJrbZSxQqya/mElP3yf+Raj9afjQIlv+uBwUey06+B
         f9UBD9CWCXev7eugNZQ+i9KWFnx6WNcGjXxNS6HzJVGVSH5vslgEWpaGRqXfZACm+87p
         ADl8LicXSopc0VMvgXzcAOoimsq2+rQ5Ae0zod5SFiCseD068IgH8ADX8umFFsWkcu/d
         r2r18mpbQ7NVVKc3kRz5Vg9JUN81eg5ugi9yIXgCqvGuDFfCLKN3QhdRtpWxF8oP5494
         ByYQ==
X-Gm-Message-State: AOAM5328mr35x6pj9I8RpT4uESSSiyP0r7mZrz4N1QA/2zLLhNTwyhUE
	K/TOPTIZgedcBy8O1m6Su5gYXWa+1eVYMGSdle8=
X-Google-Smtp-Source: ABdhPJxxyobdGRxK8+05/itVXLz+PQK+3ZCQRM16d0rQt8CTvvdfF2KGK3dPDZJHlWi6RGCoUS5i4pwRQ/xShj/pqUc=
X-Received: by 2002:a05:6402:34d4:b0:412:b228:868b with SMTP id
 w20-20020a05640234d400b00412b228868bmr4372649edc.444.1645159960189; Thu, 17
 Feb 2022 20:52:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220217190722.44894-1-ahamedhusni73@gmail.com> <Yg6hcX6XK4Eu0KOR@kroah.com>
In-Reply-To: <Yg6hcX6XK4Eu0KOR@kroah.com>
From: Ahamed Husni <ahamedhusni73@gmail.com>
Date: Fri, 18 Feb 2022 10:22:28 +0530
Message-ID: <CAFjpAKqy908scQTRJPkMhEz8OyNiR3-N8XD2hiGa+VBLhUf0VA@mail.gmail.com>
Subject: Re: [PATCH] staging: greybus: loopback: Fix Coding Style Error
To: Greg KH <gregkh@linuxfoundation.org>
Cc: "Bryan O'Donoghue" <pure.logic@nexus-software.ie>, elder@kernel.org, 
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg,

On Fri, Feb 18, 2022 at 12:56 AM Greg KH <gregkh@linuxfoundation.org> wrote=
:
> Did you try to build this change?

I am a newbie kernel dev and trying to understand how things work.
I did not build this change by the time I sent you this, thinking this
is just a style change.
I should have tested the build. I am sorry.

Now I built the changes by setting the following configurations.
CONFIG_GREYBUS
CONFIG_STAGING
CONFIG_GREYBUS_LOOPBACK

My change introduces the following error.
''''
drivers/staging/greybus/loopback.c:166:2: error: expected identifier
or =E2=80=98(=E2=80=99 before =E2=80=98do=E2=80=99
  166 |  do {            \
      |  ^~
''''
I could not fix or find the reason for this error. Please guide me in
this regard.

Thanks,
Husni.
