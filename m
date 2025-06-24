Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1866F221FD2;
	Tue, 24 Jun 2025 17:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750787390; cv=none; b=hgIaVpJbblcwBXQnsXEeaf0yHXEjwoEp2tWwPYUHZPWIkaROhKAD6nSOcBtNfIds73LFoz0QsKO1hvdVwc0iB1KFWyruJkBqi5g6U2KJNqHGkVQM4AaAv0yI2w9u7YKh9tf0/u+VX30VuBO/AJwf3F9UyD/7FgYgrMQtDXcuYIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750787390; c=relaxed/simple;
	bh=8niqH5fusWQPHqYJrJO/JVSi3IX9VpCP8k4+ksxMVbE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dKBbSp9/ngY0jXKg09X3boZdrCjizbB1fBazQkem5ZNOxA60NMb0gIbsdme1LRBjdNuUh/Qwf/d/cjxZBXAQR/x5ub2a1XphMbamBrNqvY3fw8AIMox4mVCFZ3f2vkNi3JxICcMFl5cSZNI87itUXTVOFfL9wI2SDA3NG9E2yko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IMGhxFZT; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IMGhxFZT"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-706e7babc4eso2501137b3.2;
        Tue, 24 Jun 2025 10:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750787388; x=1751392188; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FLsroaxh6H23HmTdr1hU2iPbjZDZO6XpHfKvVskaNvc=;
        b=IMGhxFZTXXmeA/SvKE8LhGZfqzVtKlJE5eswmkosS2X92/rFpy+ucsf+G45SsZ6zKj
         n4GQxZEYdEq682WQROcTHIxD+RQ+58I0yfouTH7HDWB/sys/TiOaaXVaXKezcolbbniO
         RnxxmlhGznoBivAbQI0S3vXSK9EQtBAW+3LdPwUpjUCbZGFL6uA1hyPiKkkH2gM6I+oO
         gVTX/Y7MWT2PG1CJqvYffM9ehuBOanty5YDqPfpkDXVQy0+Fhiyl+dDXArfeQ4jTQnOG
         jChhIUUE3EbmjAGbG5jwa8E5OkLYPUXlD1+Vc9CM/u7XpFG4LSIfOmbfkNFg9XNcku64
         CD+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750787388; x=1751392188;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FLsroaxh6H23HmTdr1hU2iPbjZDZO6XpHfKvVskaNvc=;
        b=Sc18Z3nHR4B1rTMuQMHIkQmIjw6J7a3hC33A1UvhYpKO4gFTsNAUw1dOjXR11xlDIJ
         dGSkg32zMWS1TS+qvL0iky5FABO9emI5JKVpRmoLDv/ZbVKdenfPeywrtvADMGPOVEW0
         JtFHFHHtmYdE9RlS3nBI4Kp+qICmCYLCNlqqwm26dY0HLx0WHIuFb0tUChKKZrfethTH
         M9UDuOFYvgXEfORNuXNBJTiau5jdtYtBqUbEutfZJYVZp8SE5EHxpGhLwWy8oTDj84x4
         iecKlF2wTwMB+53/E9S3Nw8GLPxXeYLkkaFkEXOg3uIhhl7sBJMEMiIah3YOQ8V7wHd4
         eitQ==
X-Forwarded-Encrypted: i=1; AJvYcCVm7Egxta4a+R/gXtW7bdB+WZIWE4hnpeOB6RgY41GXXhzB2EL8O25NDHDfJ9AAFNM4dCLoYzz7H8S9+WXxVlJ9p1cSow==@lists.linux.dev, AJvYcCW4OpAjCVUs5ysDjSOxNm2nthnCIBgwL7c1lmikGwsuiDrE36UpYNq339lhLL3cpTTc9NyvezR6KYi/8VtN4A==@lists.linux.dev
X-Gm-Message-State: AOJu0YyKaWaR4uG2oD3JnrZIpykojJNo8ZYqsMfyDTJmq1tmtAi6jOTj
	D43HF+7tkeaZCcnGIuZd5Zi9iNyK4iCtGTrHox9lSdKj0SY4aAJLI0YCry6sv1Ulw0CbTFc7MJD
	bKtWNUV5XWNdj5aYgLKp53EA1fwsuzlHxe7+SgcjM8Q==
X-Gm-Gg: ASbGncvPyEabbJJQPKHfO744YDf5xNqWP9FOB/nJeZkD79gA3EjnhP22zQXEc3K9H4D
	dUEeeuj8FFL9+McmJdXZSDWd2EcgpMlDx1QO6iUsLFWmr/+LFjiYlpaePRJe1tVQYXwcfNVkNtR
	lz0h6s76LZ9eAYjZlho2pu7TO+TeeDyzdhKYxejx0Lieg0
X-Google-Smtp-Source: AGHT+IHssEQUuu01VUDAu3vxZsftAv+2vtYum0imCop2U200xncw4P31YPiG+rjvnGExrz8CdV9P1MuuH2EjpUS796g=
X-Received: by 2002:a05:690c:8311:10b0:714:305:7c74 with SMTP id
 00721157ae682-7140305800dmr6986487b3.3.1750787387601; Tue, 24 Jun 2025
 10:49:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250624144943.39297-1-abdelrahmanfekry375@gmail.com>
 <cef03d37-715c-47a8-81d4-0872d505c39b@suswa.mountain> <CAGn2d8ML8eTcN2G18B7FYkapROnOeAKJir5fJvOXDdXTLY43aQ@mail.gmail.com>
 <5ce9dac3-0b7a-45d1-8313-2f65165b50e7@suswa.mountain>
In-Reply-To: <5ce9dac3-0b7a-45d1-8313-2f65165b50e7@suswa.mountain>
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Date: Tue, 24 Jun 2025 20:49:36 +0300
X-Gm-Features: AX0GCFsdhv7HQVaajzKljLDAqd4l2c2MitEjFuxVm2eTzN8YoTlF9MTss_Chq_0
Message-ID: <CAGn2d8N8GrRR0FnaB7S2BsPs0HXHhwHfg+q55HbfkMqy1kMGTw@mail.gmail.com>
Subject: Re: [PATCH v2] staging: media: atomisp: remove debug sysfs attributes
 active_bo and free_bo
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: andy@kernel.org, hdegoede@redhat.com, mchehab@kernel.org, 
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2025 at 8:32=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> On Tue, Jun 24, 2025 at 07:51:10PM +0300, Abdelrahman Fekry wrote:
> > On Tue, Jun 24, 2025 at 7:31=E2=80=AFPM Dan Carpenter <dan.carpenter@li=
naro.org> wrote:
> > >
> > > On Tue, Jun 24, 2025 at 05:49:43PM +0300, Abdelrahman Fekry wrote:
> > > >  int hmm_init(void)
> > > >  {
> > > >       int ret;
> > > > @@ -130,14 +48,6 @@ int hmm_init(void)
> > > >        */
> > > >       dummy_ptr =3D hmm_alloc(1);
> > > >
> > > > -     if (!ret) {
> > > > -             ret =3D sysfs_create_group(&atomisp_dev->kobj,
> > > > -                                      atomisp_attribute_group);
> > > > -             if (ret)
> > > > -                     dev_err(atomisp_dev,
> > > > -                             "%s Failed to create sysfs\n", __func=
__);
> > > > -     }
> > > > -
> > > >       return ret;
> > >
> > >
> > > It's really unclear how this "return ret;" is supposed to work.  Was
> > > that part of the sysfs_create_group()?
> > >
> > yes , but still it can be set by hmm_bo_device_init so even after remov=
ing
> > sysfs_create_group , ret value depends on another function.
> >
>
> You're in too big of a hurry.  Wait for a day between resending patches.
> I have looked at this some more and it turns out that nothing checks the
> error code so the "return ret;" doesn't work.  What do you think we
> should do?
>
sorry , will keep the time issue in mind.
regarding the "return ret", its now basically returning the error code of
hmm_bo_device_init () inside the function , but outside the function
scope like you mentioned, no function call to the hmm_init() checks
the error code. Thats what you mean right ?

> regards,
> dan carpenter
>
