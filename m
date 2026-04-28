Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E92637CD4A
	for <linux-staging@lists.linux.dev>; Tue, 28 Apr 2026 14:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777386731; cv=pass; b=gVe7KTsg2aKYvlLc5YJ9hOH9UL1WQbB4ZDp0lGBqx9XzQ871kOMHgRdViYyTsvvMEQ+EPYh/Oe72CCxMOP2PT3D889IEiwlM7ikwUvnZk99zNsDNYL+QWjRUye/OT4RuWsTBqzu9AnVCRZp7R9QbzylGFmNzw7tRQouTj5mPhjc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777386731; c=relaxed/simple;
	bh=Njhm4gAMjvXMvfeDSS0ZJ8A5PT7pQ5zSnvqqe8yzsS0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Uo7NxkFtt8u1d4Kk5WGxf/N/ioD4qPl6jgre7/MTQjms6MICO1+V1MCwYv9XS9GtJgkBhYd8QcnQt67nEPLsOPeVZQbDCuPJTTjHm8qH8DDBsIpWlvSPu4akyBfPFlZ89Yx2dKrFNdUP44r8wFUNNrC54f+bnkHHDjPGlu/aTss=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pr1eHhX/; arc=pass smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pr1eHhX/"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-12714f01940so823848c88.0
        for <linux-staging@lists.linux.dev>; Tue, 28 Apr 2026 07:32:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777386725; cv=none;
        d=google.com; s=arc-20240605;
        b=KoMX8I9Z99XoeKSg8Ah9vF7tmNGWB098q5iUDADUW9QWQsaT2IVrP9xlG2GZpfon0V
         JUcJqN8O7jvqyN3x0qy5Ep7sExEVRp/rlm8BTj3wxzaSmoVFHZJH6tgy3ISqtC5dQ+Bc
         iKpLiXseqpKStlS8lXNImM0y6FbEFt4JYaFN9YpsUGaCvFPtpQq8XOq5nBD9D8oZA+Sq
         KO7+oeD/gJGl0+xVj4hPkw5yH076j+xXUVKSvu/mmWNJ2/7S4Wh35jY98pnDq8DIOmJ6
         PSHt+TciBZuuWTzVPfo5tpFW/vuhiG5I3DrM27IyrRczVZsKa8Iwi20pRR9eyWzp1/pw
         +DaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Dn+YzpzB4BaLD2GgdFenCva20VhYKGBmVOjqbpavyoA=;
        fh=dXNOXv1nH+p77Tj7nc+8EFhQdvESl+T/Ec3Zd95sBs0=;
        b=Kxsf7l1T7rusYpnbOD6jfUOCNnjKZwRDcNgTn5hVvpXGxzzsQ6mSVOVkn4yLBhBAjk
         U/h6U1ru2R+P63jBozZijKEP8M0nx2o4edvdOVwdDfP/x84KadIAKlGKDB/kSW8lX9z5
         fMkoQMlsTsBzvR4dKOxBtj9IsILCBr6mIJm4zb7jSHV9pjx1i27U7+z5BhQGUJ+cORO/
         paBlRFhOUnBCYsJSzPw7YTYFCh2vHmCt8RQGuHf/Eo9Awsr1ESwjlDySs7cIY6ZR62Yy
         QMm8mi4WU6aoS77cxUWyvWoeP+1xTrot7nHkfpRCNZzxBqv2BkraV8vjPwOXesL1P/RV
         hzgg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777386725; x=1777991525; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dn+YzpzB4BaLD2GgdFenCva20VhYKGBmVOjqbpavyoA=;
        b=Pr1eHhX/2PoGWl3XYJM+uXNhpkvd9Y2RJ4mFhWQsG/QhCLGeVM9/AKUOevpvsF/iog
         pHy7DgBI7ac/rI7SE6qV31ZP/ResvPvDBEKp8cin8ML47j+QDBkhPk4RZxDHVxxjP0fk
         ZPXHzK3ZTw1AqX5GxqExi4HyzL+a+u/sv1J0DaDWnfvhVsLcPZHzgOXSKyKjQ9NmpnPX
         rlnjOdX0G/g7dV6hzW2jig8gTd/TbvBrHpt+c1lIYYqb39qOOGQdxKZM3oLpr9pSuZ3o
         jp/pUvFbu0K2WvJtHYC+41MtbioYZWlBYhzW4wfESIDnuHHPpetTsWbjeGVe8tmVcK6D
         K0oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777386725; x=1777991525;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Dn+YzpzB4BaLD2GgdFenCva20VhYKGBmVOjqbpavyoA=;
        b=d0Z5+tnuadF0cNx3XQeNLUpE2efQ2c1NBR/OT+LNJeQ/aPOjsRUVevzMWtFxsJE81Q
         BvbBA+sJDYzmCSZ6snVxPWUoTLPvGyi08iEjQbslF6cG5eGv5lDApYnsE5NsUbqrq3ew
         7tQEkhLSXMr9GgOPHSix2edcwyp7KiSUi7mqzOy2httbSIYxwF4I4xApzqMxb9SC8zjU
         tYb9kLOfK549ie5AwkXN79FMyIZIz7bEosqtl/GyrkHvEKB8QLi+7l6BRdWH4gBi1378
         yXq7c3SAF5Ar3O5hTcHkGxJXtbq/O8fbTn9hfjeWwmXCanhZyx/XZjPw0eCBG4cuwi0g
         ayAA==
X-Forwarded-Encrypted: i=1; AFNElJ8oo5ki0wdcSy/fTI9YOs4Bog5u2rHMsktCFHvbzG+5zBPBilMd4zYXNBn3PqFGZXQCCyRjZ6UKajIs2HJl@lists.linux.dev
X-Gm-Message-State: AOJu0YwEtZHhMrxxYNMNOvrE8CRVC2/CzaDKlKikchDytMHwuQL+ooI0
	98S9Wtp0gVZeEXueN0XzaWNyPDPL+pgLdE5R1dMAprIWURlt4Wi9nfhYsULG2IGVGGS5phAgzL/
	CIRn3McBBIgKmk6KGYbiMgYu9aNVsrdE=
X-Gm-Gg: AeBDieviNlWuoEgheiGaStQwnIzNJqJ0MuoIJX9zoOui6sWCJyU9RkA5k72wecoIV32
	c8VdUiX/iaWy0JzB078rEW/Dz2H28nr+BpG0uVn4wnXZ4V+0JbnBic79BdYdrgo8unlgfulXSKl
	Ld9oP9a9s/6yBe8nLmgsInh5leNGhwCbIyGvLwitkjDAng97d2UJE/OaV+591VsYqz79am7CoZ3
	Nz3qb7DCyudgWvThq1v65n13Vz+e+KVRT28GFItj3I/xpb4YvGJaOllfGQ8dJdt/v2eqPnQhYwR
	HHhX9yRGGXskg+ZZ4BRnRXwVchSwoFTp5GNHAhwR9+o0ewHzP9Ew7X00IxAuwxQZPmRmvAcXeC2
	rmt/+tgYPVrDOvg2X5Pufm877gN6jyUFe+gvOIA==
X-Received: by 2002:a05:7022:618c:b0:12d:c389:ae54 with SMTP id
 a92af1059eb24-12ddd4e12admr894171c88.2.1777386724829; Tue, 28 Apr 2026
 07:32:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260427151556.91153-1-ayushmukkanwar@gmail.com>
 <20260427151556.91153-5-ayushmukkanwar@gmail.com> <afCCbbPAcwtY3IS-@stanley.mountain>
In-Reply-To: <afCCbbPAcwtY3IS-@stanley.mountain>
From: Ayush Mukkanwar <ayushmukkanwar@gmail.com>
Date: Tue, 28 Apr 2026 20:01:52 +0530
X-Gm-Features: AVHnY4Kxyv52BBP7vzmNWPN0AWHk-N6T0CiMC4Q_XsZvNeAIyl8HYdoSUNr3Ivs
Message-ID: <CABJ81bhY3f5rGmfC4Amyf8SDbvqeQiTbFu+kBKVqFEPSBOmgow@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] staging: octeon: refactor to per-device state and
 pass platform_device
To: Dan Carpenter <error27@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 28, 2026 at 3:18=E2=80=AFPM Dan Carpenter <error27@gmail.com> w=
rote:
>
> On Mon, Apr 27, 2026 at 08:45:55PM +0530, Ayush Mukkanwar wrote:
> > Move the static oct_rx_group array from ethernet-rx.c into the
> > octeon_ethernet_platform structure to associate receive group state
> > with the platform device.
>
> How is this related to logging?
>
> > Pass struct platform_device instead of
> > struct device through the ethernet-mem and ethernet-rx call chains,
> > extracting &pdev->dev only at the point of use in dev_warn() calls.
>
> You're undoing something that you did in patch 1.  Just do it
> correctly the first time instead of doing it and the fixing it
> in the same patchset.
>
> >
> > Move struct oct_rx_group and struct octeon_ethernet_platform
> > definitions into octeon-ethernet.h so they are shared across
> > compilation units.
> >
>
> Btw, here:
>
> > +     struct octeon_ethernet_platform *plt =3D platform_get_drvdata(pde=
v);
>
> Could you name it "plat" instead of "plt"?  Generally "plt" is an
> acronym for something else.  Procedure Linkage Table or
> Phy LED Trigger.  There are a couple other meanings.
>
> regards,
> dan carpenter
>

Thanks for the review, Dan.

The rx_group refactoring was requested by Greg in his v4 review. The
logging conversion required storing a device pointer in the static
oct_rx_group array to pass it through the rx poll path. Greg asked to
eliminate that global state by moving it into the platform device
local structure.

You're right that I should fold the platform_device change into the
earlier patches to avoid the undo. I'll also rename plt to plat. Will
send v6 with these fixes.
