Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83D32750ED
	for <linux-staging@lists.linux.dev>; Thu, 16 Apr 2026 14:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776350809; cv=none; b=aAoRRWlU3d8VHwl/3cy3LM08H3FZLpJPW8zkRgJ1TF+OygHsJObWOpmOOSCYnbEkCLnESCIaVaYqg9o5H8KzdxzjuMpu5CzVv1j04RZnrc/PcjvATjmg4TDtxtQIlO0t/a1/RAbyRRHJfjn2cKwQycSNnTTY9VSduVqYNBuPiV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776350809; c=relaxed/simple;
	bh=DZCLn5MJ4r3soQbNgHCA3buradW5el48yuJ9ZXDcTfY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jJmZPOdByOMAnsyEsuTelAopcjSyiiq8y5L9ZN5AJ20gT2klqb81JWJlF8ZFmGaMNH+5gYnO7eCF8FYk83+laWGmdwoYub4CNMLYRxRRU2nPOBI+TEsKn9oRaDyARWI6f1iy1G9jjRO7e4mmOmMAb8mQrGAUjYM0OckrFmnFUmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=geiMWKBZ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="geiMWKBZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776350807;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QdVxqyAXKoeqrj2cGnO5r3z+/z3A0QdARs5q1LcXUQY=;
	b=geiMWKBZUUMg2kqBLn1yVu52h3jiTFoNjKl3Og4vMLk+zwj8JGOBzyoXw8oqgvE55zL0jn
	EU7xZxTHDTzDF4c8Egj6RbzL79Th/Pu2uogaPPqay3GJhUSp6v3KHFeb+FnEI0cKB0PS9J
	XnC+SXm2rUQJawQD7r3QDdNL/roFNz4=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-155-3I-WawIrNECHl7ydDJDhGw-1; Thu, 16 Apr 2026 10:46:44 -0400
X-MC-Unique: 3I-WawIrNECHl7ydDJDhGw-1
X-Mimecast-MFC-AGG-ID: 3I-WawIrNECHl7ydDJDhGw_1776350804
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c795e0001ffso943273a12.2
        for <linux-staging@lists.linux.dev>; Thu, 16 Apr 2026 07:46:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776350804; x=1776955604;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QdVxqyAXKoeqrj2cGnO5r3z+/z3A0QdARs5q1LcXUQY=;
        b=HNpWiTfJ55Jvx/HyAUdxuaK4MMbL/g4YQiXdOwzUnVJFYSwmMSGyenpScxzvLedH1W
         9vmCAP8/uopmO9PtDo4VnCwBk8AbZVkZjZQOhTfs6bFz6PRmAAZzFkw1Pi1qsaFSIRn0
         lVm6zENpMmZjbuPR88tr4HbO1bwKymSpueExf4H2gTnayowo4OFpM7IBu2tb4ACnEIM7
         UOj9VPEuf20MvStQFTms5pyR8MBD9Wy5aYnE+VLtJK036hb3z4lWyNDvwXZSPc3KtDBt
         maz5srn0iq4kUXFSm7c2W4m8Xwe/oBpaN6qzyv2yYzkJVeOjbQMsKL6eC12LpVP1z3xZ
         n0/g==
X-Forwarded-Encrypted: i=1; AFNElJ+jPkArOYrkhpiGtsTZbFg42u+xWHdC/VjSPGPPFvbonvpshDXehZF3De4PovTmvn0QARsstF+Qlo6iZFtl@lists.linux.dev
X-Gm-Message-State: AOJu0YxU8YSr0I7IVSA0GSZuJhtrW/tcnvGGqYcnrR1IsHXjagM0twbT
	vJ15Vk4IJD4G5CUPFRnvg7MDgwBDK0pC4j1pC7bsvCQnh7oASPgG6YOUshIKHHXbeaZ3mQYpMSy
	EARcO957L5/UzVv9I28dQ5cb5oir01EFRuEUxZbyxmpxnIbqp9LB6SqMrcKf0uk9AD8skdHGzRK
	5oX1rKArvq08WMLfRFEuqZARvCsYYI/6vy/ncw7z67VQ==
X-Gm-Gg: AeBDietc/QFyPONJCa37GQL39uG1OvNp/Ed+6hfp2NNGYfI4BAB7Gl63RkuFWqrIw1n
	1QuhDEMBRA1y35Xno9a15J+FCJa3Y6bzheEUIZlgt0oa8vby523XpofcbdiGVqAcXxPbOxQ0L+G
	3APg6oK4ng2HWXx7EHpiwwcI8u5GvWuK2sEQTi2JjOHejGEzY5g5aAmqKCvw3rCwjvCDBVoOBrP
	4U=
X-Received: by 2002:a05:6a20:4312:b0:398:8d38:c60c with SMTP id adf61e73a8af0-39fe40aac53mr28231782637.55.1776350803574;
        Thu, 16 Apr 2026 07:46:43 -0700 (PDT)
X-Received: by 2002:a05:6a20:4312:b0:398:8d38:c60c with SMTP id
 adf61e73a8af0-39fe40aac53mr28231742637.55.1776350803080; Thu, 16 Apr 2026
 07:46:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260415-wip-fix-core-v1-0-ed3c4c823175@kernel.org>
 <20260415-wip-fix-core-v1-2-ed3c4c823175@kernel.org> <8fedad8e9caecd379f2296562cd6abd37f7cee46.camel@hadess.net>
In-Reply-To: <8fedad8e9caecd379f2296562cd6abd37f7cee46.camel@hadess.net>
From: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date: Thu, 16 Apr 2026 16:46:28 +0200
X-Gm-Features: AQROBzD-vVFl_065x6nZIK1IjlDiUy9P4QSkjgjIaaL4c8szdqTSf21JUcEoXr8
Message-ID: <CAO-hwJ+EgC0pM6L6vGFEaRFt2Nwj5b-CCf_5e5VkvrXgdHrjNg@mail.gmail.com>
Subject: Re: [PATCH 2/4] HID: core: introduce hid_safe_input_report()
To: Bastien Nocera <hadess@hadess.net>
Cc: Benjamin Tissoires <bentiss@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
	=?UTF-8?Q?Filipe_La=C3=ADns?= <lains@riseup.net>, 
	Ping Cheng <ping.cheng@wacom.com>, Jason Gerecke <jason.gerecke@wacom.com>, 
	Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lee Jones <lee@kernel.org>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org, 
	linux-staging@lists.linux.dev, linux-usb@vger.kernel.org, 
	stable@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: CmuZ3oheNnNQvQPvi4lz_JdXknGqPp70XnKfFc4KC5k_1776350804
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 16, 2026 at 11:41=E2=80=AFAM Bastien Nocera <hadess@hadess.net>=
 wrote:
>
> On Wed, 2026-04-15 at 11:38 +0200, Benjamin Tissoires wrote:
> > hid_input_report() is used in too many places to have a commit that
> > doesn't cross subsystem borders. Instead of changing the API,
> > introduce
> > a new one when things matters in the transport layers:
> > - usbhid
> > - i2chid
> >
> > This effectively revert to the old behavior for those two transport
> > layers.
> >
> > Fixes: 0a3fe972a7cb ("HID: core: Mitigate potential OOB by removing
> > bogus memset()")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Benjamin Tissoires <bentiss@kernel.org>
> > ---
> >  drivers/hid/hid-core.c             | 21 +++++++++++++++++++++
> >  drivers/hid/i2c-hid/i2c-hid-core.c |  7 ++++---
> >  drivers/hid/usbhid/hid-core.c      | 11 ++++++-----
> >  include/linux/hid.h                |  2 ++
> >  4 files changed, 33 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
> > index a806820df7e5..cb0ad99e7a0a 100644
> > --- a/drivers/hid/hid-core.c
> > +++ b/drivers/hid/hid-core.c
> > @@ -2191,6 +2191,27 @@ int hid_input_report(struct hid_device *hid,
> > enum hid_report_type type, u8 *data
> >  }
> >  EXPORT_SYMBOL_GPL(hid_input_report);
> >
> > +/**
> > + * hid_safe_input_report - report data from lower layer (usb, bt...)
> > + *
> > + * @hid: hid device
> > + * @type: HID report type (HID_*_REPORT)
> > + * @data: report contents
> > + * @bufsize: allocated size of the data buffer
> > + * @size: useful size of data parameter
> > + * @interrupt: distinguish between interrupt and control transfers
> > + *
> > + * This is data entry for lower layers.
>
> You probably want to explain why it should be used instead of
> hid_input_report() in this doc blurb, and modify the hid_input_report()
> docs to mention that this should be used.

Good point. Sending v2 ASAP.

>
> Maybe hid_input_report() should also be marked as deprecated somehow,
> to avoid new users?

Well, it's not entirely deprecated because, for instance, in uhid we
only have the buffer with the provided size around. So we can't be
less restrictive in that precise case, and then switching to _safe
will not change a bit.

Cheers,
Benjamin

>
> Cheers
>
> > + */
> > +int hid_safe_input_report(struct hid_device *hid, enum
> > hid_report_type type, u8 *data,
> > +                       size_t bufsize, u32 size, int interrupt)
> > +{
> > +     return __hid_input_report(hid, type, data, bufsize, size,
> > interrupt, 0,
> > +                               false, /* from_bpf */
> > +                               false /* lock_already_taken */);
> > +}
> > +EXPORT_SYMBOL_GPL(hid_safe_input_report);
> > +
> >  bool hid_match_one_id(const struct hid_device *hdev,
> >                     const struct hid_device_id *id)
> >  {
> > diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-
> > hid/i2c-hid-core.c
> > index 5a183af3d5c6..e0a302544cef 100644
> > --- a/drivers/hid/i2c-hid/i2c-hid-core.c
> > +++ b/drivers/hid/i2c-hid/i2c-hid-core.c
> > @@ -574,9 +574,10 @@ static void i2c_hid_get_input(struct i2c_hid
> > *ihid)
> >               if (ihid->hid->group !=3D HID_GROUP_RMI)
> >                       pm_wakeup_event(&ihid->client->dev, 0);
> >
> > -             hid_input_report(ihid->hid, HID_INPUT_REPORT,
> > -                             ihid->inbuf + sizeof(__le16),
> > -                             ret_size - sizeof(__le16), 1);
> > +             hid_safe_input_report(ihid->hid, HID_INPUT_REPORT,
> > +                                   ihid->inbuf + sizeof(__le16),
> > +                                   ihid->bufsize -
> > sizeof(__le16),
> > +                                   ret_size - sizeof(__le16), 1);
> >       }
> >
> >       return;
> > diff --git a/drivers/hid/usbhid/hid-core.c b/drivers/hid/usbhid/hid-
> > core.c
> > index fbbfc0f60829..5af93b9b1fb5 100644
> > --- a/drivers/hid/usbhid/hid-core.c
> > +++ b/drivers/hid/usbhid/hid-core.c
> > @@ -283,9 +283,9 @@ static void hid_irq_in(struct urb *urb)
> >                       break;
> >               usbhid_mark_busy(usbhid);
> >               if (!test_bit(HID_RESUME_RUNNING, &usbhid->iofl)) {
> > -                     hid_input_report(urb->context,
> > HID_INPUT_REPORT,
> > -                                      urb->transfer_buffer,
> > -                                      urb->actual_length, 1);
> > +                     hid_safe_input_report(urb->context,
> > HID_INPUT_REPORT,
> > +                                           urb->transfer_buffer,
> > urb->transfer_buffer_length,
> > +                                           urb->actual_length,
> > 1);
> >                       /*
> >                        * autosuspend refused while keys are
> > pressed
> >                        * because most keyboards don't wake up when
> > @@ -482,9 +482,10 @@ static void hid_ctrl(struct urb *urb)
> >       switch (status) {
> >       case 0:                 /* success */
> >               if (usbhid->ctrl[usbhid->ctrltail].dir =3D=3D
> > USB_DIR_IN)
> > -                     hid_input_report(urb->context,
> > +                     hid_safe_input_report(urb->context,
> >                               usbhid->ctrl[usbhid-
> > >ctrltail].report->type,
> > -                             urb->transfer_buffer, urb-
> > >actual_length, 0);
> > +                             urb->transfer_buffer, urb-
> > >transfer_buffer_length,
> > +                             urb->actual_length, 0);
> >               break;
> >       case -ESHUTDOWN:        /* unplug */
> >               unplug =3D 1;
> > diff --git a/include/linux/hid.h b/include/linux/hid.h
> > index ac432a2ef415..bfb9859f391e 100644
> > --- a/include/linux/hid.h
> > +++ b/include/linux/hid.h
> > @@ -1030,6 +1030,8 @@ struct hid_field *hid_find_field(struct
> > hid_device *hdev, unsigned int report_ty
> >  int hid_set_field(struct hid_field *, unsigned, __s32);
> >  int hid_input_report(struct hid_device *hid, enum hid_report_type
> > type, u8 *data, u32 size,
> >                    int interrupt);
> > +int hid_safe_input_report(struct hid_device *hid, enum
> > hid_report_type type, u8 *data,
> > +                       size_t bufsize, u32 size, int interrupt);
> >  struct hid_field *hidinput_get_led_field(struct hid_device *hid);
> >  unsigned int hidinput_count_leds(struct hid_device *hid);
> >  __s32 hidinput_calc_abs_res(const struct hid_field *field, __u16
> > code);
>

