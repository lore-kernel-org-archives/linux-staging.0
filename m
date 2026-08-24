Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A7EF3839A9
	for <linux-staging@lists.linux.dev>; Mon, 24 Aug 2026 23:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787613052; cv=pass; b=EZNEv3I6QkDUYtd8PrLWA2yaUdMS/EHfPTQ5dqZ3LcuRpKopCbXbz+qxtwm57NrVvnyu+5aOAa5nEP+ive96zfguboGPVSbJmKboLZeSCoPJq+GMHwcV9I89BaqZJ2ctbRMXgATT11BX1uO/ywm8BJa19DaILgA3UI1ylVMw6O0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787613052; c=relaxed/simple;
	bh=1AKZmIXPV27rOkD4RR6k5prDAk6supclxkDPEsQRfj4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FcDKLtHKfC2rAE/ZvAhDAQ+bKA0dzyt3b5GRiF2MwBbFQ4rfDzkC+r7CpoWf9kN6lvL6XArQSbk0k5UIu5Wkn2UrWLMT/CW6Z+E7t9WavSC6HA62nFMRybTjrCsSP1tTY71nZtWS0nf8oS77/HvoN0F2siRAY7niogpNk1aEYyw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TW0kfk2a; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TW0kfk2a"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6a18e24ad25so5561903a12.1
        for <linux-staging@lists.linux.dev>; Mon, 24 Aug 2026 16:10:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787613049; cv=none;
        d=google.com; s=arc-20260327;
        b=llgXjQ3Jt4Om5H+TsVTAem+GYesNu+civL+vhSOWEoqfqfGk3f1K3d8W9R5dRhFF7E
         6Ufi8BEIZ/In6azDKVaA7orvq+ummws1bnzfLIIWKhDquIaMsSbW24/Tdeuvla7P7J7k
         aPTp7WA2SHBqnsFztG7WdO9P7/1lo3Nq+5SnYPC7XT+AbAoqYJbtij8BdmfU3QHQwJLX
         mqjgUjghrqvkWh+xgRgc/F5z+WV4x8vQwqbgljZ1RVg0hdEWlX+ycey0mf6QoLNIXecz
         nUGJbZsU2gB3v2qjew5XVhQe8CsYCiH5thH0gSoy1N6SHoS03XLjc5852CCP1NWB24D5
         vSUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7ciun1s7gJbj8kr+GJGzvFPSKEFSRpsUeoIvHsQ/oBM=;
        fh=vFomMCunF/etRs/VErFQ5hI3xcVedbN6xQXwfIFeKZU=;
        b=ENTWJJkvWLBnena2B266WnPLK3973YIkIQaKfcM9hRHUvKH4NSuh2a9ZimD4TURZKw
         aKUES/xlC8GKDDcWDqpBz/9nS8Lb0g0OGLrJRSX0eZ2C4Xy1EOx/mcJouNHq1yaUOItr
         aw800ZBXbwD12CgKmJinsznSdrxVuXfjL5XjZq1t6F537eiZT8R/ozePp7P5KrJLH/t9
         /2iB4pkzO73myvj0iYAUlpW6Zy9Vhy80etuCZPLrgHdc3eUOy2Y1sFvEp2RXvdknAN6s
         WMmHg6tHWsR7+QVENPaht7+byuXeuznkbs2WbImPCtib4eHAb82JiBI0IE+CKvZi+IZo
         QkZA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787613049; x=1788217849; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7ciun1s7gJbj8kr+GJGzvFPSKEFSRpsUeoIvHsQ/oBM=;
        b=TW0kfk2aG5hFL4oVhLmxXcu3I43P2ayweqKIETDNH7JOBmiYYEVGn4BXuSnK/OwM2E
         nlWzEY0ai5kaAPU9xKmghnlHySueFIE3HoBqj8/Dvw+ZOPrDqjrQGCHoBqtZTetiz5v+
         z47NYVNfkCt5HUt1zr/ob64QrfxUoYny0JcavSXEOn45Oln5N4XHdoYl/0fysSQMt0m+
         DHvUtIZfHvUmde9IT8hfJK8PrzI6NoCLtoc84OlVkAyOdQ1HD73qC1avhtcrp+ZaICYx
         o2KLG6DuU0FsLa664m6LJkRynJ5cbVpkwUF0eeMnNEr2DXvQKVAnxC0x9xFLQ8zqB5g+
         cnkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787613049; x=1788217849;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7ciun1s7gJbj8kr+GJGzvFPSKEFSRpsUeoIvHsQ/oBM=;
        b=ashb4aIejBBc2AUxDMjpNfbdjCbE/gcYaoJpcv1hL3fmgk11w/oGv6ELBcn3ep1HEb
         OM1i6nclErhSIFNFZiazODvrOmFNJTxPSDh8xl870llMqawBQMh72+7PYV2bU/cGXobu
         Ri5lFZtl8U3KXc4ch1ZBrxwrECDbUAMfAv9JKVMSUi5PKoJUP8LZMvdxQBVRJW26pTlH
         wh3cIWRo2rZO5019f6f4853M5uJIfhOgzUE5wvZUxGFgv0bVzJibAGvHkY4skpfupsCX
         YeB2uKPbRxq+3EgAq5kxBLNvIW+8wGlp9w7hLI1k2OJR9J3+2JS9pm44DSEMFsWqbRaY
         ksug==
X-Gm-Message-State: AFuF++nnRLo/Mzu9e6XHY/Z1zoeB2Kw0bIWc+STUFElHCehGuSU/3KPV
	7PbI90HrDWnldKOUVtHg239iamATzQZqAoPRXZNQWi+l4Q7h0Yj5XkXoYhGqXriazmd8p66G9K9
	tM4h21fKtwnljrgAgStuhU7yTCliKT27htP1EKw4=
X-Gm-Gg: AR+sD10Z65qJapg51x1Mm36phQq2TTHdA2SrUZpV/Hwqnx8A6CU9HC4yiVts3E+IYBy
	W6M3y6my357nWA8pj1WCujnbJNUiKTDZeQ3X+aXK1ZLVneSIyK2DZvSrI7CZc97iZqsaWiLQ+pb
	ltgC9OPPDdZ5RhwBe+6T0Yw6xw2kqigMizs9zRVXlG8tToq5EVM9IRPy3RVEGX+EhzKWpq/7Uqr
	qi9pLaUThq1SY/lvsVK550JWJU81dphI8CiZKvv+QZNNGS5oPPMMH3syW0UT1oB/O88wJCgMF+p
	Rwd0S58T2kMkOOsrSIiaWMf9mx5MNGtWtqO+e2sp56wxLMStEcr5k0vxPCFAUlfUa8d+ph76eo9
	8aniwDpvCXJ1VR/OrPZkWPlbtH7bq
X-Received: by 2002:a05:6402:414e:b0:698:3469:fa99 with SMTP id
 4fb4d7f45d1cf-6a582979538mr25815513a12.0.1787613049239; Mon, 24 Aug 2026
 16:10:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260728125456.32359-1-meatuni001@gmail.com>
In-Reply-To: <20260728125456.32359-1-meatuni001@gmail.com>
From: Muhammad Bilal <meatuni001@gmail.com>
Date: Tue, 25 Aug 2026 04:10:36 +0500
X-Gm-Features: AcwNN1XFC4yYq0ENqCoieHotSGlfytchG6KGUunZeKEe3ss8OuZzkSdaTs4Wzz8
Message-ID: <CADqcGB=j8cSE-CW8dLC8My0rk70RC-Qidmvr-dZvzCUFE5wadA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] staging: rtl8723bs: fix multiple OOB reads in IE
 and frame parsing
To: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: gregkh@linuxfoundation.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

ping.

On Tue, Jul 28, 2026 at 5:55=E2=80=AFPM Muhammad Bilal <meatuni001@gmail.co=
m> wrote:
>
> v2 of the series fixing out-of-bounds read and buffer overflow bugs in
> the rtl8723bs staging driver where length or offset fields from
> untrusted wireless frames are used without validating that enough
> bytes remain in the buffer.
>
> Changes since v1:
>
>  - Dropped patch 1/5 ("fix OOB read in rtw_get_wps_ie()") - did not
>    apply.
>  - Dropped patch 5/5 ("fix skb->len underflow in monitor TX path").
>
> Muhammad Bilal (3):
>   staging: rtl8723bs: fix OOB read / stack overflow in
>     rtw_get_wps_attr()
>   staging: rtl8723bs: fix OOB read in rtw_action_frame_parse()
>   staging: rtl8723bs: fix OOB read in rtw_restruct_wmm_ie()
>
>  drivers/staging/rtl8723bs/core/rtw_ieee80211.c | 7 +++++++
>  drivers/staging/rtl8723bs/core/rtw_mlme.c      | 3 +++
>  2 files changed, 10 insertions(+)
>
> --
> 2.55.0
>
