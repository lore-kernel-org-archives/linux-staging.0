Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3254C4A49AD
	for <linux-staging@lists.linux.dev>; Wed,  2 Sep 2026 15:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788362236; cv=pass; b=k0t2ZawFTpbc9tuv3j4G85Ri9ICmB7Xy0E5pFxC/BX2ZIJGm9N3xP1zeU97zCD6fs2PSPTlMXkWN8OYNlxDmgZgqMyTw7YLLI4OvMvAgUJ91CjNS7kfgdwa9TR+F2tVZd9mbbfhE/WAtwEYp8MiRi/1cpNdx/IaCYoDaXLyWabk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788362236; c=relaxed/simple;
	bh=HCC/6KFEAMm4V1Cz9W4xpNmgiWKlwwdYoylYCLylISI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oFTp+OIseHGg9ydYl/QKQQ7Hu6Nbwidw9rv6yDPTnBOxkNH5ElNgzVhmCgMc+OFbcM111++HOBrvts0CfwFbBzO9WoNsqNn8Gih3D1HzKptKCzN2r08YZGEl4O9uT+ovHrrSYavI8/pd6z+4L9G2cNAvoemlTEIC1sNuCaK2ynw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UpfdBm41; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UpfdBm41"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6a38098734bso2329225a12.1
        for <linux-staging@lists.linux.dev>; Wed, 02 Sep 2026 08:17:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788362232; cv=none;
        d=google.com; s=arc-20260327;
        b=Kh9bHW6I23RUYXALGL/0MJzBmS7F111DHg6ftNYulOrVExrCPyWSHudRGd4eqNRugr
         MDemmcHA5uBYldUccZbW1EfCvAprTfQZZrDC2T8IL6hZWaJ2JPCE7F4UGlIVvuhl1CCU
         8ESmrG2+B2YEKZnpkij1HPqgXa/JAtQJ6DiAwBN3crfP15UunCfDzN2EOPSsLWJ6APpu
         8eO4vC8/MeJpe14AwL4T+S1DmuflFXKqbwAsikKh9wLTFod/COcIqo0TW3puF9i/ZKtx
         9WKQp1scrR5LvyycL4UeRRfwJ0L30XUl956PIB7ARHMMYaFKicWPbqpQtQevsgX9duhG
         ihSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tTGWO4BQiMMCPhl0MvJ6+ZmQ9g+J0+MwZKIZjv1m17c=;
        fh=8Zw8MYFMp9RwXAbbvQykthDIeWJ4Rm2FqIl9cFG4XAs=;
        b=l1lILdvUcJmzM+oxCkg/IO7qlAbs2lFJQQi3pbAs5mGu/303khzxK5CEbdU5mc+B6/
         8pdPfsT3UaSeAASErMArlnKUBymtCjmbupBjXYTdUsX2av4tP/gxmGie3C8SqGvAFj1I
         QWh6H4iDN8hOttlKyzr9qWBvO8DZYG6fzJWX6aIIdBHO8hJlqMUwUQw+wuqS4S+uMbfN
         rgBX9xj94Tain3Ob5mJZYoA3JKVoJlAJ9bMiLcLLjEojHj64jV+U4Tk8TIfBLSx3kU4h
         K2eRSYQCwtk9SkswrotVRQThUnkm5r53ePSeXdVv2M19TMwozWU45t3BOR8vAZF2rMiF
         fbeg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788362232; x=1788967032; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tTGWO4BQiMMCPhl0MvJ6+ZmQ9g+J0+MwZKIZjv1m17c=;
        b=UpfdBm411komqFk+pC2z7DUlR6Gph4LqCq20tpMDa04adjFo/wTpBqVZ5pzFRDFDXg
         Isd8DE3k8iWjxcGYfZZWFJPeNAc/+HeDTlECJTdwLjrTkEOSkwyeyog1b+n5d6ogbKdG
         mtzaZXGYFrlzuE3SQ7lWcPQBw7P0yamo9qHczN5fFcve1YMLnTIqvTCtuNGpPh3EGcLP
         4tSQ0HV3dUf2RnQULp2bTwMUXN5doxVYZEzwFO9FJfDw7+bA9JRZmaK4dpB6RIGBu4z7
         i9L3zp55JdSSL3MZ+lYU3iGyohPQIBHCV2PuzjdpCx6tolEFsMqDknJmur0+olrHPHeo
         HIVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788362232; x=1788967032;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tTGWO4BQiMMCPhl0MvJ6+ZmQ9g+J0+MwZKIZjv1m17c=;
        b=hHZYOV/cb5Nm8KyWDyLdjJWfKcXGWFdSRjmjJ03/amW6mdOzSrdlleDZElZck1yZ0w
         8HJY1iOXMaGgAyPqM5lDkGSMe5QJRUF/EjRJU8qEsP8ckKNFIngQTH7S/Wfu11EVWmBf
         cUCCoWU/e0IfWhjNqr3SVPmLBeNjFaOH6Sm9IYuT6OFDmRicQzIJlkQl04/zfkJ5ikzz
         FSPtsbGD1FOPn2o4T45ewPMQx99n53FiLxGk2sUJmwGqXBBhsiQL79Rjr2LnZDYqiiay
         I95ApzabZZYU4+mXmYurpf3wDYcioP2H0gR3QMF+Kuy2DrWzwSG+neWvOUJ2V3WEA8mL
         CyJw==
X-Forwarded-Encrypted: i=1; AKwUvBzcOJWxNyPjVqRA3fMRnKj3aI1ye2cyn4oKCU9UPisd9+rZKRAfx/P5/Yk0E12TliIKIwOnTIg0i+mqHFL2@lists.linux.dev
X-Gm-Message-State: AFuF++nLpqf6YiExtqtJyVVTz8zYOSBJM9Gcy01Otiyzmwu7fhLBoCqF
	BClAlW507UwVVpFCA79IDF8aHjzw6tUH/XhFRpu03KOYAoEJDMnrUk67rmq0nX0iSrbXCWKyS92
	J1fKqa3XgbUXBvvplsIdKZzzcnDCWQ3M=
X-Gm-Gg: AYBFou1fL72s3WNms2L/4P0DO7h7Z2Lge5LLvOO2MLoH4/HgWnfyZLQ2dLOBI/702Yv
	syfjtmprnzeUOkwbzXpz7SvNvmt72nqb3anV64N6vuQQ38p3J5euvE+R+QP7fOeIEATHd+jucMJ
	WIEdoim+BllTIdDx9gTvJxZ9dVGUNYbSsDtXaNYk7//VTrt45qHBIJ6yjuC+ojfClArgMKeA0yd
	L66cqdol2I+XbPeRsGu4lI9ShiGQvzH8WdaRBfAiJXbOEL2760ojnqfxFqttpsbsz/hxP2vMFme
	vflwbq5VP4UZHvKW7M+4IEt/AKFUIOHHWUAoS6tBfs1s/u36PEjab2Q9p4VblXNxFkUC+RI73id
	vcQ==
X-Received: by 2002:a05:6402:3216:b0:6a4:ae1:333a with SMTP id
 4fb4d7f45d1cf-6a682799fb3mr4537168a12.12.1788362232011; Wed, 02 Sep 2026
 08:17:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260901185600.2725678-1-2000jedi@gmail.com> <2026090219-democracy-chip-87fd@gregkh>
In-Reply-To: <2026090219-democracy-chip-87fd@gregkh>
From: Yudi Yang <2000jedi@gmail.com>
Date: Wed, 2 Sep 2026 10:17:00 -0500
X-Gm-Features: AcwNN1VqxlHP_AWnjy_mt0418fNXAxgUYvArTOP4_3ID-w8R8wzD-318rfyEZwc
Message-ID: <CAN3V2YU0a7Mj_Sdv5VLLO6AOCbTYXJZkRwfKKyZtB-yPb5COOw@mail.gmail.com>
Subject: Re: [PATCH] staging: greybus: audio_codec: fix stack overflow in
 stream name parsing
To: Greg KH <gregkh@linuxfoundation.org>
Cc: vaibhav.sr@gmail.com, mgreer@animalcreek.com, johan@kernel.org, 
	elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I found this with an internal program-analysis tool that I cannot disclose
yet, then manually verified the finding. intf_name and dir are 32-byte
arrays, while the unbounded %s conversions allow tokens from w->sname
longer than 31 characters to overflow them. Using %31s limits each
conversion to 31 characters.

I do not have Greybus hardware, so testing was limited to building the
affected object and running checkpatch.pl

Yudi

On Wed, Sep 2, 2026 at 12:55=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Tue, Sep 01, 2026 at 01:56:00PM -0500, Yudi Yang wrote:
> > intf_name and dir are 32-byte buffers. Parsing a module-provided AIF
> > stream name with unbounded %s conversions can cause buffer-overwrites.
> > Limit each conversion to 31 characters.
> >
> > Fixes: 60e7327d54b2 ("greybus: audio: Find data connection based on id"=
)
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Yudi Yang <2000jedi@gmail.com>
> > ---
> >  drivers/staging/greybus/audio_codec.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
>
> How was this found and tested?
>
> thanks,
>
> greg k-h
