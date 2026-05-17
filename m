Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E0910F1
	for <linux-staging@lists.linux.dev>; Sun, 17 May 2026 14:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779028892; cv=pass; b=gisRfheKG5aIlSnjUvjBUkMQcp5ItTghizOE8pVoeC2B3cgZDPB0e5u/yY8v47sBlXwdACdkuf2OnkLzl/QPhwZPYbLGFnNGYd5SYqNvzBqk07ExGKe/8JZOpmU00MpNND9sIoaRzSAuzxmL4dLl0vuokuYKXD5i1MliI9h67JA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779028892; c=relaxed/simple;
	bh=CewdzmGvVkTkwa38M8Fm4zBKNtT8hcFn9yI3P4FQ8II=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ucwMPd8372aoGKJ5ydHSWPuHCPmAzRs1JgbVJmdF3tXWwWT5VEalOQvYOZVPT8kSF/y4bZIwq22mvWz/S9uJbb66B/HUrmMd+jcRn+4OEKTui055Z4adNK9xlNQZKaXJOhKUVNxMkOQzSgKq2QXldBP/IVDyYU4EbK2xitGjvCg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jQBlkrAB; arc=pass smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jQBlkrAB"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b8f97c626aaso302816066b.2
        for <linux-staging@lists.linux.dev>; Sun, 17 May 2026 07:41:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779028889; cv=none;
        d=google.com; s=arc-20240605;
        b=iuCNDM1vfDpOSRwqn5aI3rhYPEKhJKghSiDCpnEFoNIhskE+I3XgSoLlCU5AK1OUty
         4cNfjKyAyIEzEsP8QoNhD+hmf+/dugfCtBaCjzvJjH55FmvFlYMPOAnumfDcOEESamVG
         NIxgKzZVfOZPMWgODXBfa83qfswYKXyjnbHfsS2u4eCob/zboLqeR2la/lGvTPixiV7o
         YhF3Ygk6WpYeOFK3v0Me0j/FsoEUtyNyIHrrE+TnWVvr+yO5VUbbZyPvrsREHxMLprVw
         PIgtj97Rjn7UnycYT2JymLmvCA7Fndx9r+nffB+dSISJVWYrkTIoYYyMZ2G/UtzuffDZ
         jfSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NBb7v6+WUpuIHUsSRqmJT/9+JXAADCKfmhTm4niWq/Q=;
        fh=aiRgke59QYld/DSa/j8l1wlchb1kvrkKH6Buc13EUOw=;
        b=e4HWkLUgHPOUbTsFJcAVxTBWLB3NfN3DWnP9GRrlk55TLtpJjKpTOl6MB+f4UxVark
         70Qb6EPqJQINyaevWaOkO6ua0rBd9TBX7LPf0kkBNn75QY+6WQiRixJAnDDW0jYyHbhU
         d3dtxcFIZTSOvBBRQE86xcSbfYPww0XhRMYoEJzNGErjREPGJ4BJXiAddSkB5mjifxdB
         33RzljqTkRqCeqm35k4w69yt2VSY1Q5nmH3NA9xAZKMWCWrY22Bp7TXhtFMAsj2ja7oe
         SnHoLy+tMfB/98zNMBMeuWIkwwWoGaPpZ3IjLfu2n1Db8KvJv8yYunvHVjVhfSQTL+03
         3WyA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779028889; x=1779633689; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NBb7v6+WUpuIHUsSRqmJT/9+JXAADCKfmhTm4niWq/Q=;
        b=jQBlkrABLGDF/QhrExE1p6OHIFMl/SqW62qz6shnAwZhaM78LCjUuVG74Z3k2XbP48
         hD7jVXQJaUTfC3fScTZFgCozbh/ptPRhHj7b3jD25P3sg5ftvMHyaE0hgugsMZH7dVcz
         gb/D6s7FFFZ7AG8bdkpniMNt69z+DonkEg4NP/7arJRD8znO1I7TPrC9HaF4fsuO5MkB
         l6moIYzMRmuG6rqBqktZTHMZW76KUlo4XoSapEvsGLNeAff0OWQNrnwdljWoBLduD1SA
         aPuopyC5Aui3oj3lDHSW8pIBOs44mjXkZkLr3CyKtKQCJAtjoQjMelwQC2sOahP2+Tv+
         nv8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779028889; x=1779633689;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NBb7v6+WUpuIHUsSRqmJT/9+JXAADCKfmhTm4niWq/Q=;
        b=jucXCv87LWOsZ7yoeIiORsqgGm61E8fRWIc9JLAx5zIDIHZC/IJlHKjX1QUa8pGwR3
         Z0WSMckK5UbJAPnf2AnwecTKV+j91eNDTiExm80uv3vIX+SRHAUBd84JPY3gN/2y2jSW
         uVwlTXkZwXSldfbVsaC9EFsOyignM7XJraqd+Cyi9DKpkV5Z0wyjX0QLFFBaYVTleqix
         /tVtgqwBd1zIhBluc3MXYJlcZLaFWWvfYu0r0qUXJBvjwE2GrnJmaXM10NRvgaSuZQ+U
         KPvjBMqp3IyFjTub+eeY3fNqbuykJEwk3pwXi7z63HPCaOyWLJNPXRdxFfpcqBsRqQeZ
         y44Q==
X-Gm-Message-State: AOJu0YzcBu3zomLrqRqrzn5bqCZ0cN3x9bKdRYYZL0FKVX1oH7RcOs4e
	npHJA+aAFztENQWVLskR/fXYDAu165upAeZ8otvTW5/HsTm9CIKnlcmJI3AZxqJ9h2DANIlMd3D
	+6UGyZ3j0t23C7368qOrwRAi5BmUX74I=
X-Gm-Gg: Acq92OGz7Jy67qmJHzIUQVLCxtgZLw3jPzIEF4Ti5RW3IYND03Ez1imCVJeNZt6ioMP
	o/yod1iDhZysCo53No63BOO5eQAtujttAkIpUE74zRDRkC1WEZucyuuS05rpatqQ7mXZcD9MH7r
	1aExH8V5qGfvo32+dnwHDftNOW4+VWV6b7BB+1s7PmwdW6qL/fOgYVY1opTMdkoO0IfbypmFPVp
	myk7Hd4Sd0HbvmdZjGx25jUoZ6+LZVs7Btts/nKyl8hghs7/iDUlxkwM+Hooq8tGGQIaF6lbnQs
	h4JxkyHMS2GZJwshhtqAj0dhFJsWC4gadUiPsgpLXw==
X-Received: by 2002:a17:907:c986:b0:bd4:4593:33b9 with SMTP id
 a640c23a62f3a-bd517906724mr485767966b.29.1779028889123; Sun, 17 May 2026
 07:41:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260516155025.230865-1-mokshpanicker.7@gmail.com>
 <20260516155025.230865-5-mokshpanicker.7@gmail.com> <2026051608-snowcap-shield-56f3@gregkh>
 <CAK0z5OnJOZ66ZH=h+4H1uCRF6HmL0zUM5emLvgcPULVWQ9whww@mail.gmail.com> <CAK0z5OkGu-UEks9GtaO=Owo760wMcwyvUbG7UonK5J+xVYNuJw@mail.gmail.com>
In-Reply-To: <CAK0z5OkGu-UEks9GtaO=Owo760wMcwyvUbG7UonK5J+xVYNuJw@mail.gmail.com>
From: Moksh Panicker <mokshpanicker.7@gmail.com>
Date: Sun, 17 May 2026 14:41:17 +0000
X-Gm-Features: AVHnY4LstjVMD81ojuiwTXBU7hYJ6gl9JJMyxtlKBN6MvowTw7zLufdlY-a1K3U
Message-ID: <CAK0z5Omm1iq3czuvzauOL+VxxoFAz6mMAMvEUifAPrtBh9OtPQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] staging: rtl8723bs: fix missing brace in rtw_efuse_read_1_byte
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

HI Greg,

I re-checked the series, sent it to myself first, and compile-tested
it as well. The patches now look consistent to me and should be
correct.

Thanks,
Moksh

On Sat, May 16, 2026 at 5:04=E2=80=AFPM Moksh Panicker
<mokshpanicker.7@gmail.com> wrote:
>
> I ran checkpatch and found the remaining issues in the cover letter
> and patch 4. I=E2=80=99ll fix the formatting, add the missing
> description/sign-off, and resend the cleaned series.
>
> On Sat, May 16, 2026 at 4:58=E2=80=AFPM Moksh Panicker
> <mokshpanicker.7@gmail.com> wrote:
> >
> > Thanks, Greg. I=E2=80=99ll re-check the series carefully, run checkpatc=
h on
> > each patch, and resend only after confirming the patches make sense.
> >
> > On Sat, May 16, 2026 at 4:02=E2=80=AFPM Greg KH <gregkh@linuxfoundation=
.org> wrote:
> > >
> > > On Sat, May 16, 2026 at 03:50:25PM +0000, Moksh Panicker wrote:
> > > > ---
> > > >  drivers/staging/rtl8723bs/core/rtw_efuse.c | 4 ++--
> > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/s=
taging/rtl8723bs/core/rtw_efuse.c
> > > > index ef0cec40d388..a9bbfe2d6fb2 100644
> > > > --- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
> > > > +++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
> > > > @@ -75,8 +75,8 @@ u8 rtw_efuse_read_1_byte(struct adapter *Adapter,=
 u16 Address)
> > > >               return rtw_read8(Adapter, EFUSE_CTRL);
> > > >       } else {
> > > >               return 0xFF;
> > > > -
> > > > -} /* rtw_efuse_read_1_byte */
> > > > +     }
> > > > +}/* rtw_efuse_read_1_byte */
> > > >
> > > >  /*  11/16/2008 MH Read one byte from real Efuse. */
> > > >  u8 rtw_efuse_one_byte_read(struct adapter *padapter, u16 addr, u8 =
*data)
> > > > --
> > > > 2.34.1
> > > >
> > > >
> > >
> > > This really does not look correct at all...
> > >
> > > Take some time, work on this again, and resend the series to yourself=
 to
> > > see what they look like and if they make any sense or not.
> > >
> > > (hint, checkpatch should have complained about this one...)
> > >
> > > thanks,
> > >
> > > greg k-h
