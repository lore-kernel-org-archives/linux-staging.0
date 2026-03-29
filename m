Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C1B274B39
	for <linux-staging@lists.linux.dev>; Sun, 29 Mar 2026 07:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774768000; cv=pass; b=mEDnmUgAzGY/M/w5YS4iOvgBcEhwmnfoO9DTtzvGlk0iclvxBy1lsJwcNWPsLGV2Ez6TqAPw0clAuoPqP5sTPcG3x8RT0ymMcllitsq5zbz0B4vkOi2JsGmt8tDIA/2WUCBak/B/XwxfEoNmejOauGitsCbj1qDCJpjLrx63ZME=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774768000; c=relaxed/simple;
	bh=NNGBmtQAgY+BxkCF0EV6ObLRWDh5SxBHx6Zh3deyXDY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pJ7tmpySkGxwDMPS9UV2Ph2qzXo5+OF/8JNXX0jnhgKH65qcaiOb0HN7PUY9thVQPGKWl/te//gM+50NJUGiTlRCTb1dXWC2DP5/Ux+/3b1+3K921nAEW3it2/rcbjCQJfOwksusvPtAo8I6Y9GIWcxs7UYuAVNhlbAysbFADU0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ffoDZ58O; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ffoDZ58O"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b97f9587e6eso530402066b.3
        for <linux-staging@lists.linux.dev>; Sun, 29 Mar 2026 00:06:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774767998; cv=none;
        d=google.com; s=arc-20240605;
        b=PDTOSzmFVgTH1A+yAFyyYH1UtqZKs7Is5/eg73OPFYWOaE7aZa+sFJYuyPQqFuHAI1
         +UsIaSTTm3WUauLq3arMbzu4Tzm6k77CEuzDQCgTisDWqJpGnZm9rg7ExDldYsFXJKZF
         NaVWKHm8fRs0UzFI9RFtgo8l4O1kd2gqGSdwl4SU9dYZkB+D/YPnXFzcgKKLbXoX5xdy
         uYlEAadrIg0/ia96YE0c6pMtTFdo/GAzQ7RQUJ3ouxGKUV1eZbjUIApxjVjZXQJ6wHfV
         vekfpLgfmwt6jncxGGo9qrVhUkVw7RUcdStH6tBREW4s3cosQf9yCxgoDELfE2m9cR9Y
         IW8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QPoAbaOTDaZRILn48jSD9a5Te7NEEJaguvhFNEZ/iuU=;
        fh=fw/GEAIj1Wfu0VTXsErVWDqtTshercY4n3SedVLgAe4=;
        b=jJMKvzXlALbNDzFkdE2WOMstJXm5axg7n8HQ7D0JzvZpEIsqm7TJfxctliBfeSpoV6
         o9ycLQrZQkB+EQ5kQVcKZWNXiNAZeN1rIASpg6sjyffhFgolCwOGElNKW1uyRxDqw8YG
         nvX7Tx6FElT6Zjb8BXVuO+6C5ES81RgSDjEy5j38SgMoagilVqM7q7hDa0Bc4XXZJTJ/
         Y991Ld9RHZqOfEAudH+QGwohis2EUBy6Mv7qpvhz1mIR5ETaA/178rV8ruykH9T3+u/6
         m+fI/Iz3hACRS5rd+vSNVJGkYOS7yGqOGHk3BK7TnW/XKKUyIeR1CVWOlusZAtuR0OqZ
         JAEQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774767998; x=1775372798; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QPoAbaOTDaZRILn48jSD9a5Te7NEEJaguvhFNEZ/iuU=;
        b=ffoDZ58OZ1lAtuh07rc0CmmqEzbizA+yIqiH8FwdRZGyAaAPeNcas/dig5tNbrTfm7
         /mYSKHcLP+eG0MUGNRO0NBjSPdo+NbKVUzxoS4ykpD40bqe442Rdqu4SiAVTD11RTzYi
         hsoKMNGM3wTy+ARHZ6Uvo5ZhiLqd76okwfMJ/NmIfq0AdbcHhVkrAADtsjw1ag3poBi7
         Tr/Y2e5beAtK8GD6uPURwcjdMBboCg59yQO81E/CeGKctxrLY7nh2W94+4sDsNqA5Ens
         Ru7MRjIY0TFpXaziKHiW43OZEJsL8iEZsrQG3D3/DtEmBkRB+iNJwohlr0e9l/eaYIvN
         PLpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774767998; x=1775372798;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QPoAbaOTDaZRILn48jSD9a5Te7NEEJaguvhFNEZ/iuU=;
        b=mi0Lrg373m8oTSa/bpM6DaUlh9Luh6AwgOLQqP9wsnohS334uuiuYjqEO3ToRp3csn
         RN/d4nNFgkrAVXAElrquHA4Y9/yweREmnjc2iD+dscsjppLw7J0DY706uefRbNbIaNBL
         8N35mcLLjP7r69jjnDsLIn/3Z8TjIUOa4AZgRk9a/YZ7TIcTybMjDKOUGnZhDRlxYzYh
         2gZDwqLap3UilBM+EN8TWHE27FRta2bJshJSJrZajpr2sEdxV0EM6iaMaMQnlMKJf5zP
         XW+PFndTMqI/xcn7AW53pYLhBbal6TqShWXTE3Z6seDKR8Gx9hGuc7aMGKhBSc7LxNvJ
         BeHw==
X-Forwarded-Encrypted: i=1; AJvYcCVTo01517kv/YA5lJ6hoO7+5MNTwhvddkVnsfrr3PbA8pyK5lugFqwydbX225uMzDysQ1zY6K1i5+9L1qZk@lists.linux.dev
X-Gm-Message-State: AOJu0Yw4QG8BCoxCgcYZ6fKPnf28XA87U0LVMu60X9G8eGZ8Gn0uAqdI
	GYAuCLz34bVIOckaxD08apxycIlkcKlDl4VV6zKkrLKwT7X9xEq7NEy26XBs+VCvIW0RTr6yH2K
	/fGXkQ8Va2cJdjdROXEblxdI/v4NeWVI=
X-Gm-Gg: ATEYQzzTwOJ6Mh88z6TaY9RNY8zRVQDLImhHX244zl6NUwp/c2I/6bKy/7aOsppJcSx
	AWexrvYvOPgDaBy5SHCUSkCUreq5nVb4Sbe3CXn7afrg2NLSST2YAjPAeZFvG6rAABCX1+E7S87
	oGbV7EQCya2Qk8IXh1QMvDuxEWhpqpBKc6nsj6mT+c5jR+3yqPl+bQdtqrn9SPzWKlQN1wDr30g
	0pQCLtSLN8cMBLLgCn2liviBiQKQJxMiNe3HziXJouE0Tz0ed0+L2+7p7UoaOIGDtpn1ULFK16n
	ffbRuj13
X-Received: by 2002:a17:907:1b17:b0:b93:9ac0:7913 with SMTP id
 a640c23a62f3a-b9b50569823mr591319666b.35.1774767997433; Sun, 29 Mar 2026
 00:06:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260329062229.493430-1-sebasjosue84@gmail.com>
 <20260329062229.493430-2-sebasjosue84@gmail.com> <2026032936-deniable-visa-2459@gregkh>
In-Reply-To: <2026032936-deniable-visa-2459@gregkh>
From: =?UTF-8?Q?Sebasti=C3=A1n_Alba?= <sebasjosue84@gmail.com>
Date: Sun, 29 Mar 2026 01:06:24 -0600
X-Gm-Features: AQROBzAihjIwpcTjap3p5TjClCHzZ37PiL7DJ6OWobwHSfMj9QJhipEKcBxE3f0
Message-ID: <CAJD=UNcZXXV+iQrGCeUUBdq-NzKOy8ZTGT=72mgkCVEyCrkiHQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] staging: vc04_services: vchiq-mmal: fix OOB array
 access in event_to_host_cb()
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, 
	linux-staging@lists.linux.dev, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, kernel-list@raspberrypi.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg,

> The kernel trusts the hardware the driver is bound to, so this
> shouldn't be happening ever, right?

You're right that the kernel generally trusts hardware it's bound to.
This is a defensive hardening patch - a malformed index from buggy
firmware would currently cause an uncontrolled OOB access, while with
the check we get a clean error return. Happy to reframe the commit
message as hardening rather than a security fix if you prefer.

> No cc: stable?

Will add Cc: stable@vger.kernel.org in v2.

> dev_err() is best, right?

Agreed, will switch to dev_err() in v2. I'll need to thread the
struct device through - will check how other functions in this
file handle it.

> And are you going to allow a malicious hardware device to spam
> the kernel log?  :)

Good point, will switch to dev_err_ratelimited() in v2.

I'll send a v2 addressing all of these. Thanks for the review.

Sebasti=C3=A1n


El dom, 29 mar 2026 a las 0:35, Greg Kroah-Hartman
(<gregkh@linuxfoundation.org>) escribi=C3=B3:
>
> On Sun, Mar 29, 2026 at 12:21:11AM -0600, Sebastian Josue Alba Vives wrot=
e:
> > From: Sebasti=C3=A1n Alba Vives <sebasjosue84@gmail.com>
> >
> > event_to_host_cb() uses msg->u.event_to_host.client_component as an
> > index into the instance->component[] array (size VCHIQ_MMAL_MAX_COMPONE=
NTS
> > =3D 64) without any bounds validation. The client_component value comes
> > from the VideoCore GPU firmware via VCHIQ message passing.
> >
> > A malicious or buggy GPU firmware could send a crafted
> > MMAL_MSG_TYPE_EVENT_TO_HOST message with client_component >=3D 64 (or
> > negative), causing an out-of-bounds array access in kernel memory. This
> > results in reading/dereferencing a bogus vchiq_mmal_component structure
> > from memory beyond the array, which can lead to kernel crashes or
> > potentially arbitrary kernel memory access.
>
> The kernel trusts the hardware the driver is bound to, so this shouldn't
> be happening ever, right?
>
> >
> > Add a bounds check on comp_idx before using it as an array index.
> > Move the component pointer assignment after the validation.
> >
> > Fixes: b18ee53ad297 ("staging: bcm2835: Break MMAL support out from cam=
era")
> > Signed-off-by: Sebasti=C3=A1n Alba Vives <sebasjosue84@gmail.com>
>
> No cc: stable?
>
> > ---
> >  drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c | 11 +++++++++--
> >  1 file changed, 9 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c b/dr=
ivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
> > index d36ad71cc..4772126d7 100644
> > --- a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
> > +++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
> > @@ -477,12 +477,19 @@ static void event_to_host_cb(struct vchiq_mmal_in=
stance *instance,
> >                            struct mmal_msg *msg, u32 msg_len)
> >  {
> >       int comp_idx =3D msg->u.event_to_host.client_component;
> > -     struct vchiq_mmal_component *component =3D
> > -                                     &instance->component[comp_idx];
> > +     struct vchiq_mmal_component *component;
> >       struct vchiq_mmal_port *port =3D NULL;
> >       struct mmal_msg_context *msg_context;
> >       u32 port_num =3D msg->u.event_to_host.port_num;
> >
> > +     if (comp_idx < 0 || comp_idx >=3D VCHIQ_MMAL_MAX_COMPONENTS) {
> > +             pr_err("%s: component index %d out of range\n",
> > +                    __func__, comp_idx);
>
> dev_err() is best, right?
>
> And are you going to allow a malicious hardware device to spam the
> kernel log?  :)
>
> thanks,
>
> greg k-h



--=20
Sebasti=C3=A1n Alba
