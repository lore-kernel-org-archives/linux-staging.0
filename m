Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 245C22F5C4C;
	Wed, 16 Jul 2025 17:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752686864; cv=none; b=bd7cxyltEiNoh3xzj4nlTU3hgHoofhYldsVrobmF9BziAXRXAsRZjoN5nGic4LY7ErxJ4GVBh4Q4drEsj13l583xWeuPB1SlgVkPCaF7MzX+zfQV65zGHSbqZJieLSEjOAXMyw0SSdy7m7Cwycst53pc27c8q7kVfxSFk+auXdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752686864; c=relaxed/simple;
	bh=vGllGUCGiDgHJ1wVGKD70Ly2L0DljA2b3eYLzfs3SOk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T/XoqA00gMHmtY6fOI3gBjb9PnRQvco4wU4xyIrSkoMF8xwXTzEwizZ2gUjZt4i5NPUQLLVEw58xpBTwa5EBAWcaQHNToC3C7A7Jb9SkWBsaz0wcPUzWY5KzONp36eQPWGmjGRVmD04MG2ZmzEbw4uE9L9RK2gC9y3LpgpRmaos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RKplPYRw; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RKplPYRw"
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e8b802286efso19177276.3;
        Wed, 16 Jul 2025 10:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752686862; x=1753291662; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NvloVeMtiDsDLEZd6NogCW6v2SRhUa+PTaZTZmI7UkU=;
        b=RKplPYRwQjLx7UiPlhf5TSMTom0afZuiCIcDGOiE202OZJmAHH9MK30ySA5rdYeGQm
         GaSdu+aZntiJ+3RoHEksCO6AvxNHruFgxxF0qVrpsknTBrapQtUNpCb6x1UIocHfIHtR
         7c6XLYNLvGqlzK3YuBVYLKczNr6Kn6mikVpcbu39DzSdQOQW4gn/Vc8Z8l9vFAqPgXv2
         LHOTjCpm9W4Lltcaa2cFFRUHUyjC3/XMXCLT2DJ03u9t6+GM0Ho4sM9U9FtQLK+UpvWA
         koniTB1zrx7duRNZnDVB1+zxvRKhbmUDl8DmZ89YSX2ErHaNTPLLsL1wcX+7CNJ/omh5
         HXlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752686862; x=1753291662;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NvloVeMtiDsDLEZd6NogCW6v2SRhUa+PTaZTZmI7UkU=;
        b=q6vDNzdgYaQjlmQfCUryJBt+YHqoVx943gwsNOX1RwCLVbs9be2GHdUYXkBJnczZE/
         4vsT0jipCMuiDqmwnbKeis+iJEXsCdlISblp2v3U+IhFgU1GUc8vZSM3sw/W7H7rDi5w
         a2ZMDIDHMBd/BXpkcSoHHq5/EEeVfouVTzMHFDTxXdp3tvHTEIsmSEGXKEvIpso2KOY/
         qu7i/jDvJNq8icWGWV+Vd7wb/tPzbt4idiCS+UKF77t+HqoLslaXANwq4MMtcfNjuSfN
         j+KLHZq+h0Wv25uZEOnvNgX4VZ1lFVVxSd0e0hu6i/W3KuIimFnSu6PjGutNXyEjt+6c
         yn8g==
X-Forwarded-Encrypted: i=1; AJvYcCVbih7W8iCOvqR2Fh06qrcJBSKgrqhZKrPex4uLtoYKHGRMfd96OaLZulmHVRpS2wte9rIgEw1gVS3mcdAD/78EMoY6dQ==@lists.linux.dev, AJvYcCWH+hBkv6VKUIMVXLbR2gJs7i3KEOyZ+zX5oClrAopT2ra58m2i4h4PtGIBalONbU2N0poDgMsFrhHsLJm6OA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy99TeOlVQ9rpAclXQF+pQAKhf8O9/dRn89TYaBsG3KF+iwpDAF
	RmM5mK1JGg/9uQbQi8E+aSThzKoTSdmHJSyHxKudFIbXvV1cydi7IGVRfog+/y3tog1P1nj4qCs
	MW369mnJOTTQHcJiqlSwZY6TcGtv3Kn4=
X-Gm-Gg: ASbGnct4yTH2ppWndrLF2D55k2XzCCB1bP7Sf8uQI3wkih+p37F40GajsFyQ+OuLnbm
	RYhR1k/ok4WxDi5s+Z4qjvDUNJkTDuaSjbUTY9q8c1UBYysxR9iDpfBGvBnOXIpap3Y3gq80VN9
	HJyIiT6oPqDQUbaIzVWuVW23x+HKG8zWxTZwbu2Ctf8Uzhq4bOrCCP3XbZOKzi0X4lBXoxNSNBy
	k518aNClg==
X-Google-Smtp-Source: AGHT+IFcZRB9tZAKWFUgshmLoFJAFSdkhYD1bM0wT/BrW7MpFemhgFBwLKraWqKGpig35iTB8Sh1V6QrJffqXy/oSu0=
X-Received: by 2002:a05:690c:3:b0:714:49b:d58f with SMTP id
 00721157ae682-71835187107mr27550687b3.8.1752686861665; Wed, 16 Jul 2025
 10:27:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250716014225.15279-1-abdelrahmanfekry375@gmail.com> <CAHp75Ve6rE22crmt5mUioWtkWm_-ODV+Dk2gcTQ8ickhMMkvAQ@mail.gmail.com>
In-Reply-To: <CAHp75Ve6rE22crmt5mUioWtkWm_-ODV+Dk2gcTQ8ickhMMkvAQ@mail.gmail.com>
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Date: Wed, 16 Jul 2025 20:27:30 +0300
X-Gm-Features: Ac12FXw688dtJae5mhU7UFhqJ-ZLDHJXMPWRh_b7-LKwxRnzxxdPYQexaIOmM0k
Message-ID: <CAGn2d8NpjYse9k04Efy8cZtgs9sWwGD6s7LQqDyTcQ0+U3bMrg@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: add missing mutex lock in atomisp_s_fmt_cap
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com, 
	andy@kernel.org, gregkh@linuxfoundation.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org, 
	dan.carpenter@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy,

On Wed, Jul 16, 2025 at 11:11=E2=80=AFAM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Wed, Jul 16, 2025 at 4:42=E2=80=AFAM Abdelrahman Fekry
> <abdelrahmanfekry375@gmail.com> wrote:
> >
> > The function atomisp_set_fmt() modifies shared device state and expects
> > callers to hold the isp->mutex for synchronization. While most internal
> > callers correctly lock the mutex before invoking atomisp_set_fmt(), the
> > V4L2 ioctl handler atomisp_s_fmt_cap() does not.
> >
> > This results in an unsafe execution path for VIDIOC_S_FMT ioctls
> > (e.g. via v4l2-ctl), where shared structures such as pipe->pix and
> > pipe->frame_info may be modified concurrently without proper protection=
.
> >
> > - Fix this by explicitly locking isp->mutex in atomisp_s_fmt_cap().
>
> If it's a fix, please add the Fixes tag.
>
will do , thanks.
> ...
>
> > -       return atomisp_set_fmt(vdev, f);
> > +       mutex_lock(&isp->mutex);
> > +       ret =3D atomisp_set_fmt(vdev, f);
> > +       mutex_unlock(&isp->mutex);
>
> Side note: Can you consider switching the driver to use cleanup.h
> (guard()(), scoped_guard(), __free(), etc)?
will look at it .

Would you please look at this patch series [1] , it hasn't got any feedback
and i have more work that builds on it.

> --
> With Best Regards,
> Andy Shevchenko

Link: https://lore.kernel.org/all/20250712191325.132666-1-abdelrahmanfekry3=
75@gmail.com/
[1]
Best Regards,
Abdelrahman Fekry
