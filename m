Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF8C2D97BA
	for <linux-staging@lists.linux.dev>; Sat, 16 May 2026 17:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778951113; cv=pass; b=lnWRaTeHS6Lu5ANlgw1694CCiTMbOvw70683U1KcwihLu5XVnlMcK2oCNt+kWNCJEb71ACjwYKDMwd9p2UarSpD3bebw9JY4imQw8EvLN82L8kamoUYIJw6gxxZLr9jjv4lsDQJ9km241TwQyWuz6TVw8WaVuV9wiHvmAEG7spE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778951113; c=relaxed/simple;
	bh=0DzpTR6hUw2HzOJ5TzcytQLlFd7fDn9YCgn73GksbQM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jad4jLTduvQEpBNO12Jqwqd3TJIZnMy6s2X0eJd3itOKKG2iN6pK0izE/V/iGFcD9QruMjpfKvYM7ksynlzHz1lLViHZElpaeq1RIRNhlxJj9aY+2jlAJvaKoV4XzxY6e+xBvh72EEELQkAltqmsQ+R1PDLfcogezmW3fkGxf5s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TzQqs3Is; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TzQqs3Is"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-67c1e0229acso1565932a12.1
        for <linux-staging@lists.linux.dev>; Sat, 16 May 2026 10:05:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778951110; cv=none;
        d=google.com; s=arc-20240605;
        b=OQeE/aVIQ4bUkrPySfbu03jxNOOWeAZQLD5UgKxRS3h2J5X2NwSWl6vycv4PjOIgi0
         jS6patTsmD/g5rhtow5RLnbrpCoumspd9V8makYjgfBEbRf8IskYzmcMXueNUU6w2wBD
         Fp/rAUexGpk0de6TTRgO7TWbkMo2MUvhcLADq+CS/IxAgy8prZv/z1kW+dHepxZHbqGQ
         0U6PiKLDq9qIn/Hc4KbdtFB9TuJr7CqbqkcAgluyCNm8jt9ULGVFImB7Mbei8TkFMMoE
         /pReSey9KJvqfvrrK3bSQzxotFq1T0F59p4Em+O7v9h7ECQ6ePgEH0k2TkDCxmoKDuOI
         gSeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7nWFlrzaRwvyUHh0jxeA7fwBJT/GeQLj+5iFUIXKh0g=;
        fh=aiRgke59QYld/DSa/j8l1wlchb1kvrkKH6Buc13EUOw=;
        b=kd4FzMBXjCoqjeDZCFFaYLATMYyM75sID0yaz38FI8/M+2KpsIFtu2qaJQSyPi93ZP
         JpaF3E1mvma6nFvv64dgIr4aRSHHf9/bBDNPvTTh4e0LMxdYNr7k9WGFbN0XPu2Lb5df
         idBO9fgEl948rLoezLeAiMVClXVI/RZse+U+HzPShshdcKMgEqoJoPzcJzCCDySwmO0r
         CqtqMyqmZVryWZpNgsaO+lX3Y9H9Q9VqQVvBNbTh2pwlamqpKgOGNhrIuKIxyPCN8m+S
         qoKZwA/hSitudYhO6gedHxXQj7qXBqflEazhsmMzFq1yC/06S9JcdGxyKAW2QdY3BKlS
         rOhw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778951110; x=1779555910; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7nWFlrzaRwvyUHh0jxeA7fwBJT/GeQLj+5iFUIXKh0g=;
        b=TzQqs3IsxjNvP+JZ7Dm2/K8ywJT5e/YIJOPwPZa8gISOAlPhTmIQ/4c5YEmbS8pPFN
         BS56jHZKOduCRjntPXygexwiDGvCsF3M2rLGPkyD/JwggpR+Z5+iLW48QW3zN/xTv0zF
         acxueHvTUv1ac/XWGf7hf7k5M62zzRNIyan5Ut6fczMKEBYJmuim4DSQkF8iDBsslE04
         aYPT4omTTFpiXTBnqsKRAF2bgjnnP0b+isf4Jd9rryHFaWgUIv8G7QAKzdrjcgq6YgjE
         xGbjo1jUicUVBOdEvSk9fo+A5rN1vrWCyvBOFo0G1MAMRoVx1VpDdgZ/3XuKdHzib1KU
         Bwew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778951110; x=1779555910;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7nWFlrzaRwvyUHh0jxeA7fwBJT/GeQLj+5iFUIXKh0g=;
        b=Svfky6nPnGR8DpJG50554cqmkKGlA4/hQUBJKvYsubQDGXkUM6piscJSjmsAZiZHT4
         d9a/JeGszWKKGoCYHCJYemb9FmFDLugV3QCjuXCj0/4nav6NGDtSGKF2fqU1LcKtWSSV
         I3Al1kP4PNVdIKmJejIo2S0xCjyf2yORolzXo2+wlVA8q99RdmBx1dxhX4YeEAN7qH0O
         a8VS3gNUBh+QsgU+B9WcleZLvd0S6BO7PrQPk5EWsHLC4D2hiueuTNil/0THDvHoDFJq
         Dh2iJKuOSdcQ5SdUOssgnjHGXqQxs4pq2aS+JTtbzcWtmBzkWd9K1a80qltR0nP0gMuy
         oUQg==
X-Gm-Message-State: AOJu0Yyfgl1A4E8OI0BpWRlMBFFcFubA/v6eYo1yPel7e7wKMLGkeX6u
	szMKfbxcBNvbykJ1k9N8cbwAGMg4tBWYC9bsJmUPgWQiz3dzuQA2zpdXiiUmEwCs39PNGSDqu5R
	yiDB8aGOnICTcp8aJfEsRS4eDyC6J5ek=
X-Gm-Gg: Acq92OHmw6oaWCxwvqYn2tdEn9Xe2PaobRiODv8CIFCDZFHDnKubePyFa9ZLNrDMLvt
	2UOgrF6GVnA1kJFKHF/9RKvUt1TlU5uW008y0d27bXg0/A/MaieqM4PyvqXBPMU4x0AMEhjRMjr
	3+pjEIStqU9BbpEVIXMJa1Rg9MGIy8PRQwhwPr/XZ9li1Ro9VasfohMdZVXjHV1TreJxc1iNxtk
	irGTcWWoUnlsiRRmy7ndQfV5YOxHTh9j4fRl/5rtGrhPUarEi3JiFkttGXClV7DMWRp7uD8tEDZ
	5BUWvL34ziPg9ip/S5qF5LzxUdXpLwG1eOYmmTQjTKGyYKoQrtzHhRYfSS4cUzZaeUfiq7G/xw=
	=
X-Received: by 2002:a05:6402:a553:20b0:671:ab62:765b with SMTP id
 4fb4d7f45d1cf-683bd78c127mr3210246a12.20.1778951109928; Sat, 16 May 2026
 10:05:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260516155025.230865-1-mokshpanicker.7@gmail.com>
 <20260516155025.230865-5-mokshpanicker.7@gmail.com> <2026051608-snowcap-shield-56f3@gregkh>
 <CAK0z5OnJOZ66ZH=h+4H1uCRF6HmL0zUM5emLvgcPULVWQ9whww@mail.gmail.com>
In-Reply-To: <CAK0z5OnJOZ66ZH=h+4H1uCRF6HmL0zUM5emLvgcPULVWQ9whww@mail.gmail.com>
From: Moksh Panicker <mokshpanicker.7@gmail.com>
Date: Sat, 16 May 2026 17:04:58 +0000
X-Gm-Features: AVHnY4K9IwSrxs-vNA6VXdjReq74Kkml-lTDdcKPLxI0WI2YzVMwtM78jr9ZFXA
Message-ID: <CAK0z5OkGu-UEks9GtaO=Owo760wMcwyvUbG7UonK5J+xVYNuJw@mail.gmail.com>
Subject: Re: [PATCH 4/4] staging: rtl8723bs: fix missing brace in rtw_efuse_read_1_byte
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I ran checkpatch and found the remaining issues in the cover letter
and patch 4. I=E2=80=99ll fix the formatting, add the missing
description/sign-off, and resend the cleaned series.

On Sat, May 16, 2026 at 4:58=E2=80=AFPM Moksh Panicker
<mokshpanicker.7@gmail.com> wrote:
>
> Thanks, Greg. I=E2=80=99ll re-check the series carefully, run checkpatch =
on
> each patch, and resend only after confirming the patches make sense.
>
> On Sat, May 16, 2026 at 4:02=E2=80=AFPM Greg KH <gregkh@linuxfoundation.o=
rg> wrote:
> >
> > On Sat, May 16, 2026 at 03:50:25PM +0000, Moksh Panicker wrote:
> > > ---
> > >  drivers/staging/rtl8723bs/core/rtw_efuse.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/sta=
ging/rtl8723bs/core/rtw_efuse.c
> > > index ef0cec40d388..a9bbfe2d6fb2 100644
> > > --- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
> > > +++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
> > > @@ -75,8 +75,8 @@ u8 rtw_efuse_read_1_byte(struct adapter *Adapter, u=
16 Address)
> > >               return rtw_read8(Adapter, EFUSE_CTRL);
> > >       } else {
> > >               return 0xFF;
> > > -
> > > -} /* rtw_efuse_read_1_byte */
> > > +     }
> > > +}/* rtw_efuse_read_1_byte */
> > >
> > >  /*  11/16/2008 MH Read one byte from real Efuse. */
> > >  u8 rtw_efuse_one_byte_read(struct adapter *padapter, u16 addr, u8 *d=
ata)
> > > --
> > > 2.34.1
> > >
> > >
> >
> > This really does not look correct at all...
> >
> > Take some time, work on this again, and resend the series to yourself t=
o
> > see what they look like and if they make any sense or not.
> >
> > (hint, checkpatch should have complained about this one...)
> >
> > thanks,
> >
> > greg k-h
