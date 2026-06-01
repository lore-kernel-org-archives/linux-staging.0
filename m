Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170E4298CC4
	for <linux-staging@lists.linux.dev>; Mon,  1 Jun 2026 16:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780330509; cv=pass; b=PEvQ3mqNV854LaXteG0rMGdzF/hzRXydKjoaRAprl17JhB6UYEYp7+nPEzPrbYk0nnuI0syxHvqpejGZp0Po/rMPaEqSfjW2ag35+9qNrE14AsqsLyfdU/S4PAQD29pnLF6ihY5pUVN+VG1nwba1Mx11uzcdjM1sPB4nxvpv6G0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780330509; c=relaxed/simple;
	bh=S7m4BngvTlTj0+tpvgLqh4QpR/6Euk3lgUzpTubScuE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qVKO9fPJtBpUnZ0+lHdMV9MMDa7G52KMWClR1pngeMbFzolMiohyjMUnhnQAijaJi5TXRbTZbsD9X4OHAbwDm/FmyWwPkcWDHQUapZbMtMXPPHBZPTUQSZ0dVB5ggfXN7P4Gmg340lfLhXtF4XuHQKFSH9yKtetECpDmY0I1dI8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mn/1fjK7; arc=pass smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mn/1fjK7"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-7dccb5f4b1cso44773717b3.3
        for <linux-staging@lists.linux.dev>; Mon, 01 Jun 2026 09:15:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780330507; cv=none;
        d=google.com; s=arc-20240605;
        b=YrKkauR3urlp3wLR3B5NLatS376KQWzq0ucfyfr8+3eZvmvRMpbOTfA6OG8iR8P5DN
         zkprvAnKiLq7t4MDqbqHOCkZaR53M3qz53v2+HNpxjnPn+56XpS2nVZh0UUuNovr/1i0
         PDDAvTGbZOSWp2bD1I+wnET/FWWD30oA+hAlxiFdXJYPwCX8COh6NQc31MCFt/5RzB8k
         Cdy/MhOr2BFax1FmEbSFDsyS2bLQMY76p89BYIqTTCVv/s0tqXslEmjcbDq64oQqgjnP
         SH1fvoUHI61EANMqN9pt/SVMuOcBjyOgpBB8osv74RhP+n0o8TjNItXelJYM0utS9Ffy
         cGmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8DD8IFm3wkiv/lO89U6JLGiihkXoPSFIGCSDSHMVdmg=;
        fh=2CVTIkVPhg0KPB0MXJsQlUHJYqJp0iJnPh+zOrgPQrI=;
        b=ALwa6oYvIt2OZtP2+fgek3HH38RAqpcFzRN0zOAHt9h2i466VSjWAfeHotx4YRp5Y5
         8JWaEiWBmmSFLqTai9nnNv4ojG7YNboGjzXdEZH2sclk/NGBGO3lJPYjDqizUNmjwbN4
         4mjFc/wd1qONoU7cWUpBrBuzRnk/uH6TT/WAQe0+90/G//lY6tt5LqX0j2WmLG6GsdBw
         CFYKEfJAKrFHFOnrE5CXudZXdig/7B7k1uSiqI4Q5j+CCwEuUN9dGSu3a6BdL7cd6+Rc
         GF+VNHrimOIo46o2mPIRd0//7d4f47tz//RktrpbT9aEKkE2YknzyTSffzKFuzJWkBa0
         4Lhg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780330507; x=1780935307; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8DD8IFm3wkiv/lO89U6JLGiihkXoPSFIGCSDSHMVdmg=;
        b=Mn/1fjK7KeG+xopDw9/l2FB2pujk7U4QWeGzIhgjiIKxDwpb7x2O2EAraqwYpKmMV2
         eK7lcFo1Hy45HTUq2Fd9+v92Q2BYNuc2skSz6BUdu70eiQnWKEnWRQ59QBMIOZiQlZgn
         VgNNP4G4YKnqzpPbbkW1nygR4sjc5MX5MJJTs4APZwHayOONABeAzXCKRWu+W2JIplYo
         +qdvuuAnz5InWB7J5N6K5/Pa+ZrcXuUogU4TKi6RKWI5KVedoEYXtjhywdo94MsCGcbb
         cizC3OXZoH4MZG3Ba/d/TaGtlM//vURdaZ0553qLnonTk5YpDhTfNUlCFfYDONJTRAjG
         ZOjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780330507; x=1780935307;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8DD8IFm3wkiv/lO89U6JLGiihkXoPSFIGCSDSHMVdmg=;
        b=R0H/EaaNXZ6YcNMngERtFIC0yfv3DojoqCdwXsFE92DEmKmHYuSpcisvQK8RV5sP8M
         ssjgac9Mn7ZY5MFHLG+EkBuZEEeSMhDVAx8+BOx0UpfKPC6HfVuXPGplJpOWj3xEaSq6
         WuoRdVE8QhOyghKr0/1pfbeVwJl/YvNYR7iHNoEA0bbFcG10wH/MohTqlWuoe1JJejDO
         knRziA/gPvx4TK1pHd/uYnSfbQ8r6ZpvOipQpiQ71RTItK50X6DLCQeZBF2wYRaNc8fC
         pjT/xPUaazbScIRV0ITfHxjlpmIjqNy4J4NFq/iI1FO3D27zL+U1jpP74ZwyX5kC8NLN
         CR9w==
X-Gm-Message-State: AOJu0YxA4kM6RcZ1Wnjvkz2xRGcs0PdyYts4NfPjUQDcyWe32TBcmHDR
	VjodspZctPfRxd8dyi9mFLFHNSGZ1pLlb7nLtBTkBGoAANJ7JKM4Ml0vC3a2rcky+VgBL2sfSVv
	Uy46xfU1MnTj4z2louUo12cej/Ls+CTM=
X-Gm-Gg: Acq92OFMOvtoAFOgFgTs8PbAvbU4ERSKsZ1fDXb9CR8+z4WEalaq5jRg3t6l3MiOED9
	tahV2A3V+lUeEpIOFX/u1vp4ugaUgNX7IEzX2zjAegH/RGGWBXQzmHoadZnpRU5Syf8+L+4rF5P
	wXlQTOEReO8EQwx8pH+GCwg6uHgySjwvVzcRdJdNgpLdxfhxZpjLfUWd7gcQt7JEtgQ6BzKZMDg
	bUXYhhqPg8Sl0+pt2sUe5NPmwiMXl8qH+wBvFzMmNXTA3dyzzQJMXSnc1+d6lia+YoKcA4QLOAc
	N310ylaT8JrroKjPJw==
X-Received: by 2002:a05:690c:7088:b0:7d2:6b8:6e6f with SMTP id
 00721157ae682-7e058f23f25mr103464837b3.12.1780330506960; Mon, 01 Jun 2026
 09:15:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260511134930.4086521-1-congnt264@gmail.com> <2026052117-snore-bladder-110d@gregkh>
In-Reply-To: <2026052117-snore-bladder-110d@gregkh>
From: =?UTF-8?B?Tmd1eeG7hW4gQ8O0bmc=?= <congnt264@gmail.com>
Date: Mon, 1 Jun 2026 23:14:55 +0700
X-Gm-Features: AVHnY4KmXb_m6xBa9qN2zepLtj2co-vg77I_6S4ASghp0cXm0uOL8ESVgORWsUQ
Message-ID: <CAJpJ=GsgOP9Cc+YfiPJOh5Ot-rzAzDbe4ZtsjTV1LUwaED7wjg@mail.gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: rename ndis_802_11_network_infrastructure
 enum values to uppercase
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

You're right, the kernel already provides the enum nl80211_iftype.
I've reworked the patch to use it directly and drop the translation
layer.

v2: https://lore.kernel.org/linux-staging/20260601161051.1832080-1-congnt26=
4@gmail.com/


On Thu, May 21, 2026 at 4:10=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Mon, May 11, 2026 at 08:49:30PM +0700, Cong Nguyen wrote:
> > --- a/drivers/staging/rtl8723bs/include/wlan_bssdef.h
> > +++ b/drivers/staging/rtl8723bs/include/wlan_bssdef.h
> > @@ -43,11 +43,11 @@ struct ndis_802_11_conf {
> >  };
> >
> >  enum ndis_802_11_network_infrastructure {
> > -     Ndis802_11IBSS,
> > -     Ndis802_11Infrastructure,
> > -     Ndis802_11AutoUnknown,
> > -     Ndis802_11InfrastructureMax,     /*  Not a real value, defined as=
 upper bound */
> > -     Ndis802_11APMode,
> > +     NDIS_802_11_IBSS,
> > +     NDIS_802_11_INFRASTRUCTURE,
> > +     NDIS_802_11_AUTO_UNKNOWN,
> > +     NDIS_802_11_INFRASTRUCTURE_MAX,     /*  Not a real value, defined=
 as upper bound */
> > +     NDIS_802_11_AP_MODE,
> >  };
>
> Why aren't you just using the NDIS values that the kernel already
> provides for these?  Don't re-invent the wheel.
>
> thanks,
>
> greg k-h
