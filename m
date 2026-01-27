Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB791D9346
	for <linux-staging@lists.linux.dev>; Tue, 27 Jan 2026 07:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769499863; cv=pass; b=Jej7qCbroHjfIfBPI4SffNERM1sv81CiGkaVK1Vc8+Rz+TfG1ptR6KZM8DdHhVVTtIGlz+I+yUB5Q9RSvuLnTIf0zjW0aysZB4ndUx/7fyFK7QhVKkUDGqonDIPBkZvQtEs7f4szRT8eh49MePVAZ1QRVbKmTFK9CHsZbLxJRDE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769499863; c=relaxed/simple;
	bh=bMgs3B/TV3U9Jv9S29Vn+NXOk9oxbHZ2iyIB2fJqdY8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DM7g8RF2w7K3XHWbMfMphxwmhOwG0QtznIkdRH4lWEMQt8yRunGsFT+MjMVEAmljsgMEDpQULiB9l+tDYOVPM0ajYVbhsD1CD1dRuzBEIMgSL1O6udM3X1WmhLJCYR8EZBrxFIe3CWC/qiK/bbJd0zYkOisItI6G2XDjaTYD/+0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U7YvfQqm; arc=pass smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U7YvfQqm"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-88a35a00506so99864196d6.2
        for <linux-staging@lists.linux.dev>; Mon, 26 Jan 2026 23:44:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769499861; cv=none;
        d=google.com; s=arc-20240605;
        b=MixbDWUCEh8Z++fR14RHkdKcGa1/u3UFAjPl75S1ea5fKHSyXGA5YETu8xldwuAs9W
         ud5lCCs5DsFqZpGF0JTXuq8phGZMqZVebWPYWWyTkbYqNi/2lJYuNEXiVdEuA6BmwdGm
         oOVImfKYF2kS12s5S/TD8mYJDpWs8OKOSbvYBe1se+xDyyBqRZKYtwLoTLGpAAqVlevt
         G8DGDXgMeWs0UZTC5OILFRpVam5s/y8wc4S3I/2oQBG0R8YdNO800kIuo1S+tI5DhzH2
         fXO9VuBusNR+B75LMZZH0CJWKtXIff/8kYid7PbmhmMHq/ZRINTAkmgfTVODhLA03d1u
         k0JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LBY6bdBVCYJbQ19M7A/A+J0aQKFZviVRePJoL0JH2nI=;
        fh=XqDRlir436x0NKiQXKu101X8s1KXGxyhrRO/kBuE4V4=;
        b=W1z6CqnpQoay/uXeF9D9FG5iYSsZHMyaULvYTaaqtzxpdBc4biEUo8xUgkSC0TSJU5
         sTUoBeDN4vNgjRlRr+8bV7a7bVY4GKN7ye+EgWotcPS56PUMBxmkNGPoZQ8V1Jdspot8
         nG2w/9PwJnJKoHQTtJMBV8tYXdWUYVJS3Gs9777Oav/rb4+vgkvlFwPGhcwzXXFHggBB
         PO+J/MCO0v5D6SkkuwRKGejvDCCg5mXxRut7yqsq+Hv3SODMq9fz3zTyG9w4gVit/q21
         a7CRLX4ZZqGx8Ekp0t/Xl3ZTQaNq7vTzFXIS63qIqumk/uKwRTkL1NhzIW+Jfm3OrNkR
         TjKA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769499861; x=1770104661; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LBY6bdBVCYJbQ19M7A/A+J0aQKFZviVRePJoL0JH2nI=;
        b=U7YvfQqmFc1I+MjSZUQZUfiyvHVTdkrtX0EkdKy6m70/Jy/GwX1R6RFGX0wRXpXp+x
         FgiY+WWIhbFUbOb03Nly9KdtqfLHs2EHhphf2qQH0sU7K4QIJQLaVd3oCvqRVGFjm6f9
         q1MNHa8HMlBgfNmXrPDITyEHx/L207Rga0rVCgit6CesiFcWr5vX4CrzqPareuFX1YwL
         ZNKEcRH1x+Z6hyEkFC7tQczEKxpHvteTOi88X06YORC+Q5NeUfzaWil7/AjsCGjLPYox
         tjFUz/rs1aqIP66wo43HURonvUKx+RhKf9EVBJDj7MRLWOiJpWmQz9U7gJBqCJ1k37KP
         TZEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769499861; x=1770104661;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LBY6bdBVCYJbQ19M7A/A+J0aQKFZviVRePJoL0JH2nI=;
        b=BE7vPIaiCRYpOASYPkcYIPpD9Qs42eb7ZKQ7S6B8U5hfDTaH33wJdqegZYXcpyohJj
         gJN9BOw5zsMDw1mea6ygQJNTTVMD+yTShsvb35l6VvyG+fX8JGYm7pWFQlSQkPvHhy/4
         aF4w6m8xwbQoSI0yo6LsQH5d9udUK5mTkZXkuxzkkkHM7KkL13SAQxWZN/MRVjA/CZeK
         SLPdh/+KiIG4qL/3XBu2m/k7NWBebwyUG+yPix+d932eq696o/w4o30/ip4nJOhPagyi
         kHdG7Vp10x6wwBQrRtsrQOIe8thrn0ow4p8A43zhMB5tOeiBw13Prh0k8cqcHXK44Sns
         1lEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEjbZTHoA3/xRGMjK11rmt9jNuraxiMhkZEywvOargOf3rDHQRz0uqIstupS9GAb9tXVRdxkdzWYe+wLLX@lists.linux.dev
X-Gm-Message-State: AOJu0YxR92Y9o5xHySOH1y0Hh/ns+94+r7E+ra1Mwp0ieNXFACtJvCvh
	wykgTBR+DKJJ+AbwH1/+SklxEKzQ3J3tXNryvzgrqaRX6Kd9eNgidYSUeOvImOgcfimhW17snQ+
	Dacfvm+bFWeRrtfcFvO//ggv7PLV21q4=
X-Gm-Gg: AZuq6aIfuXHsdZmIw+sd0DuanM0cZN9QPGhb7iLqrFraxD/Za4XSGXEGCaU+I0sliJS
	WU5ULZgv8dk9Icz2u9/84Hqgmfbcu2um8MPRRCRN6Wk2Kuz5V9I2RRxVyd0KTAtLk/vTEQEf6zs
	mGI7OIUkUTnBU3VA1ybiQJ1RZmbMCnJu+nxumWO3d53SibxMWJpJViTOzvpF8JihS8QG4OdyB92
	BPFrZV0yQbQ1bwDQQ6EcGelzwydBCQfcBJbBolBU5C1hod0mAtqoGniezfmkxKCHyXS3WdXEqzI
	oPiyv2h+/A==
X-Received: by 2002:a05:6214:2588:b0:88a:2ebd:1e39 with SMTP id
 6a1803df08f44-894cc8b6b91mr11091236d6.38.1769499861425; Mon, 26 Jan 2026
 23:44:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260126141543.2527-1-ethantidmore06@gmail.com> <aXhaoRMIlbRVgZui@stanley.mountain>
In-Reply-To: <aXhaoRMIlbRVgZui@stanley.mountain>
From: Ethan Tidmore <ethantidmore06@gmail.com>
Date: Tue, 27 Jan 2026 01:43:57 -0600
X-Gm-Features: AZwV_Qg4qmDqSzv5mF8M3CjbKARX3Hp2Ra-hG_5WOUp6cX1dN_RTA6ZUT__HYeM
Message-ID: <CAMBTqh3doFnj2MVf=DP2upm-QZEjCyeu47pBchRBNFSs0eD83g@mail.gmail.com>
Subject: Re: [PATCH v1] staging: rtl8723bs: rename members of struct registry_priv
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Michael Straube <straube.linux@gmail.com>, 
	Hans de Goede <hansg@kernel.org>, Akiyoshi Kurita <weibu@redadmin.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 26, 2026 at 08:15:43AM -0600, Dan Carpenter wrote:
> This is an unrelated white-space change.  Don't make unrelated changes.
>
> > +      struct registry_priv *r =3D &Adapter->registrypriv;
>
> I feel like you did this to avoid going over the 100 character limit,
> but please do that in a separate patch.  I use a script to review these
> changes and I want it to be a straight s/old/new/ change.  Plus, "r"
> is a bad name.

Hi Dan,

Thanks for the review. I actually sent a v2 patchset earlier today which
should fix the whitespace issues you mentioned here.

However, I realized v2 still uses a local struct registry_priv *r shortcut
in one of the patches which is inconsistent with the rest of the series.
I will fix that in v3.

I'll wait a bit longer to see if there are any other comments on v2 before
sending the v3 series.

Thanks,
Ethan


On Tue, Jan 27, 2026 at 12:26=E2=80=AFAM Dan Carpenter <dan.carpenter@linar=
o.org> wrote:
>
> On Mon, Jan 26, 2026 at 08:15:43AM -0600, Ethan Tidmore wrote:
> > @@ -750,7 +751,8 @@ s8 phy_get_tx_pwr_lmt(struct adapter *adapter, u32 =
reg_pwr_tbl_sel,
> >
> >  void PHY_ConvertTxPowerLimitToPowerIndex(struct adapter *Adapter)
> >  {
> > -     struct hal_com_data     *pHalData =3D GET_HAL_DATA(Adapter);
> > +     struct hal_com_data *pHalData =3D GET_HAL_DATA(Adapter);
>
> This is an unrelated white-space change.  Don't make unrelated changes.
>
> > +     struct registry_priv *r =3D &Adapter->registrypriv;
>
> I feel like you did this to avoid going over the 100 character limit,
> but please do that in a separate patch.  I use a script to review these
> changes and I want it to be a straight s/old/new/ change.  Plus, "r"
> is a bad name.
>
> regards,
> dan carpenter
>
