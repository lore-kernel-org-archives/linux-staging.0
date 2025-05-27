Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF77B1D5160
	for <linux-staging@lists.linux.dev>; Tue, 27 May 2025 05:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748325058; cv=none; b=hrVelA87qioO93qisbMZPKFGXPEEyDfsz+jrzs1VfP0PE9wJCMZ1BvRloMKcGAj15Ubiz51j8UPd3MFoKD5LkM1eZxxjZo3j6TD1WqPRu/A8WcGjeD8F1Y60pA4580zodKI7DsUdTdYX2zlrmaUL092lyDOygGi3x390NIRy4uI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748325058; c=relaxed/simple;
	bh=RwU/+QDQe8yqwBrSgSL3XAw4FaJHpNRGEU6zoX8Gg/w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i8d8SByvzdyaz43z/rcy6/00wcYm4iOANNFpQs+5lq8n7MlzR8FJPi9HLe0HUtUlFO9ak5aL7E9jkCMUX0UMHP8R406Jr+vfKtElNRO/JCbIMy6m5n37e07HgKOJRLYbiE6mpwuELJjhZho7Xv3/mcmsVhHqlBcDWJKAJfLjDGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=npiX5z2X; arc=none smtp.client-ip=209.85.208.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="npiX5z2X"
Received: by mail-ed1-f68.google.com with SMTP id 4fb4d7f45d1cf-604f48c6e94so23812a12.3
        for <linux-staging@lists.linux.dev>; Mon, 26 May 2025 22:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748325055; x=1748929855; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mu9iSZ9Th/47Nb0jS9axxAY4+IRtONHz/7iK+0n6mDs=;
        b=npiX5z2XEYch1ZSPU6KNsi+wPQ1aNFjT48c1xZgSzguTOHmfE7mlRINW64xriLlqmK
         VgeUeNss9CnU0CUwAh7M6u3eLfZIbyY6T0MJhHD+909yY/jkuqp5LzmNEfK83MoKSmIU
         IuXClwaZJd7KV45t/zzwZJHxgm9M/P220kanFiRwR4+XPqqMsesP9H3s3ejJw9fAwCKD
         YAfiWXVaCIaDMckRVH8LoOr8CNwFns6hcA7zuHZllYWC0ykb1u8y5X2BCVmaQxDUiAty
         nZrlPchLzZELXJz4YuVxQ5WLUaz3pYjGa7cfQB+pLQcFM4FMVBCW7A8CmTYm2zaDqxHW
         ILtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748325055; x=1748929855;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mu9iSZ9Th/47Nb0jS9axxAY4+IRtONHz/7iK+0n6mDs=;
        b=ByWECz9hqrrAGnTkEQ1CXv9sY13v+40G/hQW+KbyuwEmYxbV3XhJcEeBssc/J+JDFh
         UzLMVJdpieZ0ot2tQiSoa7A7eiPOT2Gbu8adS6l1OMXPpfAmgKGD7/h9j6AZQzSzTRUR
         zvji1vRpzmrYzdrcfrIDj0WNO2RS4f8Pc9nAJu8KumMJ8ghwaX6MeS0fWpBTtQe5kNLy
         6XH+/c6QUiOHUSut7s78aNSnyLiHM49riZsFgJGaBNEzeo0oGMWfkn7Wd2VMXNJCwZg+
         nzOmCW9ke+KsyBTTc0Y4i+qsx45hP1snVOC8ajlOiiW8hVX9Gxqq2HjY5AARUFnk4okE
         LfaA==
X-Forwarded-Encrypted: i=1; AJvYcCUjczXe7BXjPl2ia72L8qzwMlbXSvq5n76Ch99VlvT+uzr8xNzgPekHi9aKsK0P+UDpoEn7EDFd0AKZCbHj@lists.linux.dev
X-Gm-Message-State: AOJu0YxmUI+INy6cqVyWN+B/jALSkr6gDoB/BMgBllEE2dgQxFFfHtfb
	AHZgHuTKpE3ujCHVSEcgu4Gbz0EAKTu0nb0XW+vdeMdLg93Nh0x+sV5FRoh+OXfbB40rcS1XXvP
	n3kLLmY/1Bi+sqzDCo4XRT5yABF9NQrs=
X-Gm-Gg: ASbGncsm45VDDDkESxF2mEtXqbw9vvhTBKJrXYsP3wW/TPWaXNqEP4CBc5WV5JjT3gT
	1QFcORfNFGefVMIEsa1wGM+dfxqqCy0V5h8fw2GndTWuP1Ry/R2ex6Op/wVMZGe+CKkU5PeydWu
	0L9Q6QVFxwpHiXVXJrvpwpuIp9WbO9FF1oBAHQXVUUvFNMMzWz/EVb3bI=
X-Google-Smtp-Source: AGHT+IF8oa3AYXfzFTrpxVaADoFu1eHHdn+1kSB5T16SwRD0pCGON9/yLRxNAAoUhNTp1RU1EfrPnYVf3KNvEcLuhv4=
X-Received: by 2002:aa7:cd16:0:b0:602:e002:f037 with SMTP id
 4fb4d7f45d1cf-602e0033b9bmr3024855a12.5.1748325054655; Mon, 26 May 2025
 22:50:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250527050635.946553-1-clf700383@gmail.com> <2025052700-ungodly-vitality-d86d@gregkh>
In-Reply-To: <2025052700-ungodly-vitality-d86d@gregkh>
From: clingfei <clf700383@gmail.com>
Date: Tue, 27 May 2025 13:50:42 +0800
X-Gm-Features: AX0GCFvpY5pnbxrQ0do9awtnlP68ukFWbQpuKDLKiPXl2ghGljKA7usDYV2uW5w
Message-ID: <CADPKJ-64_fod0ObZsg_prtB4u+ZA6shZ6AnXqn4vxK1NGxHgkQ@mail.gmail.com>
Subject: Re: [PATCH v2] greybus: Avoid fake flexible array for response data
To: Greg KH <gregkh@linuxfoundation.org>
Cc: elder@kernel.org, keescook@chromium.org, johan@kernel.org, 
	vireshk@kernel.org, greybus-dev@lists.linaro.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Greg KH <gregkh@linuxfoundation.org> =E4=BA=8E2025=E5=B9=B45=E6=9C=8827=E6=
=97=A5=E5=91=A8=E4=BA=8C 13:15=E5=86=99=E9=81=93=EF=BC=9A
>
> On Tue, May 27, 2025 at 01:06:35PM +0800, clingfei wrote:
> > We want to get rid of zero size arrays and use flexible arrays instead.
> > However, in this case the struct is just one flexible array of u8 which
> > adds no value. Just use a pointer instead.
>
> Not true at all, sorry, it does "add value".  Please read the greybus
> specification if you have questions about this.
>
> >
> > v1: https://lore.kernel.org/all/202505262032.507AD8E0DC@keescook/
>
> Please read our documentation for how to properly version kernel patches

Sorry, I will read it.
>
> >
> > Signed-off-by: clingfei <clf700383@gmail.com>
>
> Also, we need a "full"name, not an email alias.
>
> > ---
> >  drivers/staging/greybus/i2c.c             | 12 ++++--------
> >  include/linux/greybus/greybus_protocols.h |  3 ---
> >  2 files changed, 4 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/staging/greybus/i2c.c b/drivers/staging/greybus/i2=
c.c
> > index 14f1ff6d448c..b248d6717b71 100644
> > --- a/drivers/staging/greybus/i2c.c
> > +++ b/drivers/staging/greybus/i2c.c
> > @@ -144,15 +144,14 @@ gb_i2c_operation_create(struct gb_connection *con=
nection,
> >  }
> >
> >  static void gb_i2c_decode_response(struct i2c_msg *msgs, u32 msg_count=
,
> > -                                struct gb_i2c_transfer_response *respo=
nse)
> > +                                u8 *data)
> >  {
> >       struct i2c_msg *msg =3D msgs;
> > -     u8 *data;
> >       u32 i;
> >
> > -     if (!response)
> > +     if (!data)
> >               return;
> > -     data =3D response->data;
> > +
> >       for (i =3D 0; i < msg_count; i++) {
> >               if (msg->flags & I2C_M_RD) {
> >                       memcpy(msg->buf, data, msg->len);
> > @@ -188,10 +187,7 @@ static int gb_i2c_transfer_operation(struct gb_i2c=
_device *gb_i2c_dev,
> >
> >       ret =3D gb_operation_request_send_sync(operation);
> >       if (!ret) {
> > -             struct gb_i2c_transfer_response *response;
> > -
> > -             response =3D operation->response->payload;
> > -             gb_i2c_decode_response(msgs, msg_count, response);
> > +             gb_i2c_decode_response(msgs, msg_count, operation->respon=
se->payload);
> >               ret =3D msg_count;
> >       } else if (!gb_i2c_expected_transfer_error(ret)) {
> >               dev_err(dev, "transfer operation failed (%d)\n", ret);
> > diff --git a/include/linux/greybus/greybus_protocols.h b/include/linux/=
greybus/greybus_protocols.h
> > index 820134b0105c..6a35c78b967b 100644
> > --- a/include/linux/greybus/greybus_protocols.h
> > +++ b/include/linux/greybus/greybus_protocols.h
> > @@ -678,9 +678,6 @@ struct gb_i2c_transfer_request {
> >       __le16                          op_count;
> >       struct gb_i2c_transfer_op       ops[];          /* op_count of th=
ese */
> >  } __packed;
> > -struct gb_i2c_transfer_response {
> > -     __u8                            data[0];        /* inbound data *=
/
> > -} __packed;
>
> As I said before, you can't just delete structures that are exported to
> userspace without breaking things.  Why is this change acceptable to do
> that?
>
> And how was any of this tested?
>
> greg k-h

Could you please give some examples that will be broken by this change?
And I am not sure how this should be tested. It seems that it will not
have any negative impact on functionality.
