Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51C62FB2
	for <linux-staging@lists.linux.dev>; Mon, 14 Jun 2021 15:27:15 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id w21so46980199edv.3
        for <linux-staging@lists.linux.dev>; Mon, 14 Jun 2021 08:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3gxmspcFXVYNdg43UgbRcnO/nztmp2eLs2CqpNuQDGU=;
        b=i4fb1dHHUacw0281OjEv+VIUAcW95gLdmwOF7w0UUK0UX74r26tUalCAiUUpMFYl62
         IU6j1zbLGmSS6pJoDpwlR72yTw1HrVqqOGV8IzCB5+O+7z+dwCYQGAXtdxMB6Mwyto/b
         hjdz4rwem+kfP/1mzGJoySiK2vk5Va+uV2IdnMe80pQX4IqSFxgHpZRF9/L9j3zEVzHW
         La9ebLgD6diM3keeqh6Ot5z4I72XMuWGk41DX5dbuASn8rwJodIs37+FPx8TeiokcxVk
         EFeJxesgoHRcHSrdqugZa0gaJkK1B1uJyX2PunBAGMt91gEZZVZGjA+fYg3fN/m8yCzU
         0miw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3gxmspcFXVYNdg43UgbRcnO/nztmp2eLs2CqpNuQDGU=;
        b=Ujrd3zI8X1nOqfSaryO78GjucQkY4UpqDQw1V/cB/rDp+QTm4Ly6EOFMmI4fIaAgDD
         qI5pbWMEPXW7Chjktvwf8+OkrlrvmVx7w2X+1qh5sUn2qd+mzdTpG8raUErjpgEkNjxW
         zGH3EIddAn7CdMTgfQz9zvTV+zcehaSrIUXTizSSz3ipUBeUapZZOqtt8eLhGvkk7Tin
         2b0e+qV3PlSsZ9MBnsGnUqAXwAU9m7viF+jJ6ZsdQjhJ2Qr1p/lgZgRTjp7j3U2TP0tk
         6Gi9g8fZ6044BxyzGWdpgaKt0hoRVJeRffnFiwRy1QHmLBBfcsHj77bIM6LD2EU5NNef
         d48g==
X-Gm-Message-State: AOAM532qthi7+IsHfNMM7ANv2cCigq0HfBDc7aEHK4JVx5LL9mOuDTi/
	7p0HmOuvBppGn7eXcLD5ynIw+9U6vDUgjMzjufY=
X-Google-Smtp-Source: ABdhPJwVxdtsF6hl0TLkjQz3LU/GAabMcnEYsuAraHw7Dp6Kn1av63GeXeed+oOA0hkexGpOP2/hjvp5RajlDDpCzm4=
X-Received: by 2002:a50:cc0b:: with SMTP id m11mr17546019edi.297.1623684434279;
 Mon, 14 Jun 2021 08:27:14 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210613122858.1433252-1-fbihjmeric@gmail.com>
 <YMX7SRSPgvMA/Pw1@kroah.com> <CAKgboZ8QUQpiinL0xCxUmcp6nEVU20jXkDXbrK_QisUMiLEo1A@mail.gmail.com>
 <YMdkN9cft6KHcFn3@zeniv-ca.linux.org.uk>
In-Reply-To: <YMdkN9cft6KHcFn3@zeniv-ca.linux.org.uk>
From: Jhih Ming Huang <fbihjmeric@gmail.com>
Date: Mon, 14 Jun 2021 23:27:03 +0800
Message-ID: <CAKgboZ9P2afm7-eOE3COrKVDkFZ_g288KfJAyQiwzC6fN75VmA@mail.gmail.com>
Subject: Re: [PATCH v2] rtw_security: fix cast to restricted __le32
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Greg KH <gregkh@linuxfoundation.org>, fabioaiuto83@gmail.com, 
	ross.schm.dev@gmail.com, maqianga@uniontech.com, marcocesati@gmail.com, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 14, 2021 at 10:14 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> On Mon, Jun 14, 2021 at 12:40:27AM +0800, Jhih Ming Huang wrote:
> > On Sun, Jun 13, 2021 at 8:34 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Sun, Jun 13, 2021 at 08:28:58PM +0800, Jhih-Ming Huang wrote:
> > > > This patch fixes the sparse warning of fix cast to restricted __le32.
> > > >
> > > > Last month, there was a change for replacing private CRC-32 routines with
> > > > in-kernel ones.
> > > > In that patch, we replaced getcrc32 with crc32_le in calling le32_to_cpu.
> > > > le32_to_cpu accepts __le32 type as arg, but crc32_le returns unsigned int.
> > > > That how it introduced the sparse warning.
> > >
> > > As crc32_le returns a u32 which is in native-endian format, how can you
> > > cast it to le32?  Why do you cast it to le32?  Isn't that going to be
> > > incorrect for big endian systems?
> > >
> > > thanks,
> > >
> > > greg k-h
> >
> > Thanks for the fast reply.
> > Yes, you are right. I did not notice that le32_to_cpu already handles
> > both of the cases.
> >
> > So it seems the warning from sparse is false positives, am I right?
>
> In a sense that on all architectures we would be ever likely to support
> le32_to_cpu and cpu_to_le32 do the same bit-shuffling - yes.  In a sense
> of having those used correctly it's not a false positive, though - it's
> much easier to follow "this variable always hold native-endian, this -
> little-endian" and watch for conversions done correctly than to count
> the byteswaps and try to prove that it's either even for all execution
> histories or odd for all execution histories.
>
> IOW, there's a good reason for keeping separate cpu_to_le32 and le32_to_cpu
> and not mixing them with each other - it's easier to prove correctness that
> way *and* easier to look for endianness bugs.

Thanks for your explanation.

To clarify, even though it might be false positives in some senses,
following "hold the variable native-endian and check the conversion
done correctly"
is much easier than the other way. And it's exactly the current implementation.

So it's better to keep the current implementation and ignore the
warnings, right?

Thanks. Regards

--jmhuang
