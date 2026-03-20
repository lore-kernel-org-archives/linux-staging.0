Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 635881A0728
	for <linux-staging@lists.linux.dev>; Fri, 20 Mar 2026 08:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773996483; cv=pass; b=LwxZIhu/H+NtJNsplNQCmBVBMgPbbflsVRLMgwaSmJeQgsq7yl64a2hCq0oi178rlvApDoCVClvqJiSGWXmcCxfHAXgBGbWO2f5se2lHvnKOvkdLNHlXhEuOWHZ1FAzkjYV0vckToUIwJ25DH/TLGILuaN70DrKqRh8b1aDZdfI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773996483; c=relaxed/simple;
	bh=k/D4PES1v2a27jZo5DbC/dvozvedHyFR8AFQcekM1fM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I2wbyNmlJvrlB3W7pOJ9YQpfyBk6EAxZuNLCOLze7wmvDFSVw9QcAGvaw+nps/thKbRZBKbV5Qyv9xUKdjn+XPObRkk9qZS42QkSCn9OVw+1w+SzRmaID/oh+VHhe+ATZSOQiTxIWpKWtBHSFHJ90PqG3QCK/OSjlLHLJy6ZExU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VlOdaLuM; arc=pass smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VlOdaLuM"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-38bd60d7a2cso2628021fa.1
        for <linux-staging@lists.linux.dev>; Fri, 20 Mar 2026 01:48:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773996479; cv=none;
        d=google.com; s=arc-20240605;
        b=fvjU5S6NILzGcC9AHnKUFGix0zVvUGqC5WW3/oIddvt/x57lKjiJTxD5bh3CzMYec7
         LRvJM2g76Vyy5DFIVxzQx3m4Zi70IhGLHHBR44dppzyzh7MXVA50PFtQY5LbNSYgCh2P
         zOI1AdQt31IFaFS/AXNywfJ62GCLYjLV2pIV/G+0jYXmzt5kpvGhnmARH0+we+9t30zi
         fsZDbsthz4gD2EdBBLLeCNhunUUEB1lqquivqs/RRnw3RiBzfuiqsQGwo8mKKpM+KtYD
         P7J228njrCb7Dj8r8YdusLQDrstcJqtFd5RVSZjjtfdJ0HIfb/ug0YYLEB19eOafq6FJ
         fbSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JcaLbkBw6Kxip5Rzq5X1ZY+Gv62TDDb08Gb5AVMVTHU=;
        fh=2CVTIkVPhg0KPB0MXJsQlUHJYqJp0iJnPh+zOrgPQrI=;
        b=Kcrh6epkf/nj/DjmL5Rc5+UPjm/htPH6PL/l2ezYc1lSo1eRpF2PVVEnyrNYJdFp/8
         uydNWbNBPEQPI+A7SK39P1ruuglLmqbDlIt6jd2RiMsy4G9GDEZVUSDSp8yrRnpzlStS
         JjPTLMsuHLS7Vl+GOSBx9VKVtBzZ6F+XvRIzdt8+FzECIitRa1i/XFsKW0LsNVu57qL+
         E4SNRkQ5U9R0ylZWYwKTkgpmOp66zCYs8cESU7E0SB7fOXWqijm0qAchOQWDta5Bv9P0
         Eptpn50cAv+5Xj/pqhznQsT5RwDcdCj9oY9NhTOtr25LuEseBi3bSAS1VjWNLmoATcJN
         ob+Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773996479; x=1774601279; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JcaLbkBw6Kxip5Rzq5X1ZY+Gv62TDDb08Gb5AVMVTHU=;
        b=VlOdaLuMzaEoQ15QC2j2CDxDkAmAmaM+Mmi9Xi/sCag9WN4bTYV8ae+YHHnUKLWbMV
         LuGJAvlc6IGAC67nP0gDkcFI03wEv5YZuwVoGS0UP0G27w1CqGAIOnCub/6KMCUr+Fm9
         C0wCb1k3TkxMMQYMXJ8T+rRekbEBauOijHw8yyLlyxOw7J8Zsi7kNV6XEaFLmbuSFQrg
         g8K8tYMg8tI+rg49I7mKq9pkHhOH0rllxMH6PX/tUfGGZJXFsztLoJ83IgPlSa09noKp
         BgrCKRCT8fbQy8N8nIVsnqYbXDLdT91jDD+iAfc9Kv3VG1hCHRCqY4RXLbRQBf6tk1Bc
         rzDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773996479; x=1774601279;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JcaLbkBw6Kxip5Rzq5X1ZY+Gv62TDDb08Gb5AVMVTHU=;
        b=W+9IR9Mtwo+Ifvi424U9jf7YwkMqW74Ij9tejtY346XCG9TEZh8MsVLHxryD3yXA2G
         cQ9G+RZbgCXbXwjtM1Ib33fcq+Gd/Cy4dMzAHrauf/T/P3qqNhns9GdwdNApnm0ddz3z
         T43y5ixG9GWQ8M9mg+FmuEJbic53BXz5hlfWUoQybWhl7MFBucTcuo+goLhBFrUnajnL
         SvgWPiTGlknJmjqAI7uDGNlO3Ep34ipW7AVatMDEDPuw9588YIQrDgFSLGNWx2EY5b4k
         jVrk0KlVPGWscCjgJjQ/Bc0sb8jth4Urz8Ui0Hu4LpNMJrVcvABTTTunKBjdN0ZHtfLo
         LziA==
X-Gm-Message-State: AOJu0YzsYYu54b+WX5FJoHDENnqinWq4z/WFlLJ3Dpztv1WazKPaorWf
	G0gW1lJ0RCHFgViqUT0zUZC9LptpojeR7q+HNigTfCboq6K68W/XzzF0UuZkRxFQP5JfrGpAUQE
	F4qJhGzQxvPCY5DPhsLNTBalTY2AXsI4=
X-Gm-Gg: ATEYQzxeanmUtkd/QravT0LcyNs1EmZJl5BfX3n6hSoUIk+VSTLSaSSOT4IopvoQ0bm
	lO7x1alOFrite+7uHgTiV5w5boEMM4+YoW+aodSWalUEEBU+1tgnE6Cq2DPfF+So2T5uVgl1rke
	EpeOrdiI51v6owDrErF3W76tEiK4CuNSDCAsM1+7BbeiXM/bcrG/Y6h2y+oqFHNjZrc7slubtk5
	8qSnoSTp840rhcwaf4vRLZ6DPbSDha8ZTIZnTS90mLj2k6zNks7dwz+GWDzr4uMGLBIKGs1vQgJ
	ZxLLcZn68uJoJj04i6Y=
X-Received: by 2002:a05:651c:41c6:b0:38a:523a:7fb0 with SMTP id
 38308e7fff4ca-38bf96455d3mr8701871fa.1.1773996479199; Fri, 20 Mar 2026
 01:47:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260320072951.54045-1-omer.e.idrissi@gmail.com>
 <2026032009-dares-scavenger-3d52@gregkh> <CACx49NfzUuHWdvME+850gJXLL==6x8Yw3_0yzZgJmAk089a7Aw@mail.gmail.com>
In-Reply-To: <CACx49NfzUuHWdvME+850gJXLL==6x8Yw3_0yzZgJmAk089a7Aw@mail.gmail.com>
From: Omer <omer.e.idrissi@gmail.com>
Date: Fri, 20 Mar 2026 09:47:47 +0100
X-Gm-Features: AaiRm52tj7yrupcjxImI-xL5lfYGESmMWdFYetzp0ZFkrlL86tWCFLZB8zbfwt0
Message-ID: <CACx49NdF41ALtJ=FVkOVXe5EwKMFXJ5PYbOZAehF5=vgALHT4A@mail.gmail.com>
Subject: Re: [PATCH] [PATCH] staging: rtl8723bs: change error handling to use
 standard errno
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

thank you for replying.

I've now read the sdio_dvobj_init source code and realized it also returns =
NULL
after non-malloc related problems so i'm going to change it from -ENOMEM to
-ENODEV.

Apologies for the double [PATCH] prefix, it was unintentionally put there.

best,

Omer El Idrissi


On Fri, Mar 20, 2026 at 9:43=E2=80=AFAM Omer <omer.e.idrissi@gmail.com> wro=
te:
>
> thank you for replying.
>
> On Fri, Mar 20, 2026 at 8:36=E2=80=AFAM Greg KH <gregkh@linuxfoundation.o=
rg> wrote:
>>
>> On Fri, Mar 20, 2026 at 08:29:50AM +0100, Omer El Idrissi wrote:
>> > Replace non-standard return values with descriptive
>> > linux kernel error codes in probe path.
>> > Also replace the variable name 'status' with 'ret'
>> > to be more consistent with other kernel code
>> >
>> > Signed-off-by: Omer El Idrissi <omer.e.idrissi@gmail.com>
>> > ---
>> >  drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 30 +++++++++++++------=
-
>> >  1 file changed, 19 insertions(+), 11 deletions(-)
>> >
>> > diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/st=
aging/rtl8723bs/os_dep/sdio_intf.c
>> > index d664e254912c..ff0ebcb59c68 100644
>> > --- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
>> > +++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
>> > @@ -345,38 +345,46 @@ static int rtw_drv_init(
>> >       struct sdio_func *func,
>> >       const struct sdio_device_id *id)
>> >  {
>> > -     int status =3D _FAIL;
>> > +     int ret;
>> >       struct adapter *if1 =3D NULL;
>> >       struct dvobj_priv *dvobj;
>> >
>> >       dvobj =3D sdio_dvobj_init(func);
>> > -     if (!dvobj)
>> > +     if (!dvobj) {
>> > +             ret =3D -ENOMEM;
>>
>> why is this an "out of memory" error?
>>
>> thanks,
>>
>> greg k-h
>
>
> I've now read the sdio_dvobj_init source code and realized it also return=
s NULL
> after non-malloc related problems so i'm going to change it from -ENOMEM =
to
> -ENODEV.
>
> Apologies for the double [PATCH] prefix, I unintentionally put it there.
>
> best,
>
> Omer El Idrissi
