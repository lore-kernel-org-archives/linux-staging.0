Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A7423E49EE
	for <linux-staging@lists.linux.dev>; Tue, 21 Jul 2026 16:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784650711; cv=pass; b=lA3LsQhuqEheC1LX/GvL7qBWYEWTpI2QHkedN9luAJ9JiJSV4+gNgbOztKyMMJ1KSTOKxK52K08hVSuR0mbfNeADGqGcDiO+JfaffPYunuxUakUDdPEKdwBmpuyPzMFpvvff6yDwDFFZrFuyijrOzxaBcEm1ENd3MAryBPYtI0M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784650711; c=relaxed/simple;
	bh=tW/bvmIthu5iw1xO27HdrMfBcPKUpuAZTA3RijYgFJs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t5Wsc6bnufFQcK9/w1X8j9ji4DWNAW5ZzTmUscJr/OUS7vsOLKT3UwYiNc7Ear1CEbfybpIV20K/vKuH7WqB9wPByqIdi3OF/3qbyFUkGkbqU8etjs1VHzK0Pin5I1c43k1UL0rpzAI4bEAnmNjuhQfEXsISUKsmxH5oJss3XSI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y5mrJ6T3; arc=pass smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y5mrJ6T3"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c15c42a45adso794971666b.0
        for <linux-staging@lists.linux.dev>; Tue, 21 Jul 2026 09:18:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784650708; cv=none;
        d=google.com; s=arc-20260327;
        b=Q03NPaTmUa1oLH3RfC4uoYIleaes4gDeBciAUJHWk0gxn7qegS00t6oCPyDJYjyisL
         wsfaxDh6FE+xZBbk6q7MCGWSZYztCe69NdTWLFnzaJasuRaJ5/1ERmtQye9hlz3WXQqX
         CX/Zv7ypWSrLsVSzGsdwZeNkelXj24RLyl/9Pi1ynewOuXboA/7cjy8png4h1yW3PxX6
         geupekRGGYxvqMJ74QXNStM7naS6We3umuJe+lYzZJS4ZD5EOs6AK5o92tZTMVJ9HBNj
         XWv6yK1SuhPUs2TjDXNwp9GxcUHgjfn0Ys06SjSKErmnT5RgmBGcUb7KbU0waO3E1acV
         9GtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3trdIziI5/gyVIc3rJqmCPk10SAyyIIqOQc8bwQpyY0=;
        fh=2CVTIkVPhg0KPB0MXJsQlUHJYqJp0iJnPh+zOrgPQrI=;
        b=JRBBjFsTS/bQai5okecdyoJcLYTSVb+Whf0QRgA7ICwGkLj+4Hx76O7ALJwlh2KIbd
         8DMx+ACoI0QGkKRM4+bxoIKlk/D7wmQ9uQuMBSmYEtP1JghdgS4Ix2rzF4S22/lSMo7A
         BQPXfzl6xTvsggshjDtjMtd7GiHRF0dJlc+/rTnwAJ9ZgzUh+rCbslO2KgCpDmXsD5i7
         xsW8ZKB93w0hWvr3qwa4kkjeGrU/Cfw7LQnJd/taRjZVbV+PpQwWueFtuazdB5dplXQv
         kVPcPv+j1Q/hYv9jP1Zu6z2cmmSTfEL0br6YSY9PU2JFrHCD9EW3BZ5b893C4Tti3l7I
         XXvA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784650708; x=1785255508; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3trdIziI5/gyVIc3rJqmCPk10SAyyIIqOQc8bwQpyY0=;
        b=Y5mrJ6T3z7Zs/AeCGJlSM2l8fIUogOzuYhy6cdbZ9cwiA2HrTwCF97jsAMDJkz1HHp
         cphI0qBlTCy02TaO/c0fCuoiueCAfMpCWktfEOM5VCB8b3JKLx30NHX10QSVxxQ2TdNi
         Rx0mxsA4elzX6FWId3yV/SzUYx0Ily+wnkPhHg8K54yvV583/sRfUdeXJqAZm63WPPEj
         UukXKlO5NhBvGo3km1AKZBHmtqyuFBIckxt4bJC3UKP/Cz1GK2wxgZQdxavmBas3+XCJ
         /Yc8TuGFpeKbazFBDw3yx072QJ7XxvsVXJIcVPGP+bmNTiqSNTnW+t8R+goHiAPYKpr3
         3v6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784650708; x=1785255508;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3trdIziI5/gyVIc3rJqmCPk10SAyyIIqOQc8bwQpyY0=;
        b=h+8vbw8iQUFUHvIqUuT6xR9UXGC2D3G6s6Y5IlFYgR+B/Ne/6GgViF9FppIIR5KXe1
         AMRvuA+IH5EOvhTNGkKv5HC6u7e2LxDtuHNejJcGdIGTsvYE4QdFS6gogdbyVyhhDBvv
         8KWIjt1+aqtOI4qzZ9ZQITnuwf5K3C6Z+Ywd5BHYEk6SsB5YYTHK3Qz2f8D/Aw+lnYB9
         w6d7bcMTXwWpNm47iQXKmzRfJriDJ0J2DeMO1o04gN1mSX+kzsWmLh13fr1nethQavNB
         tkTYA90ToK8g6X+Q98/Qh6q7cd8DAYvkxXAre3mA9V3PSZfdpBSCldRJdBef9gP9+bfi
         blVA==
X-Gm-Message-State: AOJu0YxcWsYLUNlMyYsg1iW+2Lgn073EwK/rfH40Xt13DlU1mjQr35hd
	EIAAIfH4y56LcsScGMS0gmdTuzkaAlUP+02k9A0DAb9qFJy3DvUeKRdbSDGUBTiZZtmltP7mPBU
	kwDlvzfBvuZE99l+rf07LDV5f/qmBFTY=
X-Gm-Gg: AR+sD12EfwS+6U+mP7QEJUjpZt5vwRvKYYjk2elc/FiBxLO9OOP8EPuiweNxrXkRT8j
	w4qYdDwNzSgyuBMUnWpzbkOQgWYaPcKMnK62TzkLc+9wOeQ+pFS7Wbdh/kCe99pMZ9IS4p3nx9g
	kDoOS2xf4u4FBX/mcJV9zPRXnnnnoYq/7qDEpPsC077c3Bjx5YnifmSOaUxbJLABwZkwc4phpxg
	SCHdU4Ss7r5F5/WIpZL3qPmVT016pKPGvlxzHjH2Re9HRsZMs+ajxWjHoXXL+Kr
X-Received: by 2002:a17:907:94c5:b0:c12:49d6:3c5b with SMTP id
 a640c23a62f3a-c1c30bae893mr14279366b.8.1784650708002; Tue, 21 Jul 2026
 09:18:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260713162020.2478175-1-pratapyashkulshrestha@gmail.com>
 <2026071727-jingling-bacteria-51ca@gregkh> <CAKCYvoMf+-fPo1yj7VEYfgwHpOxRCYAGELwW7V8ODOwy+9OviA@mail.gmail.com>
In-Reply-To: <CAKCYvoMf+-fPo1yj7VEYfgwHpOxRCYAGELwW7V8ODOwy+9OviA@mail.gmail.com>
From: =?UTF-8?B?4KSv4KS2IOCkquCljeCksOCkpOCkvuCkqiDgpJXgpYHgpLLgpLbgpY3gpLDgpYfgpLfgpY0=?=
	=?UTF-8?B?4KSg?= <pratapyashkulshrestha@gmail.com>
Date: Tue, 21 Jul 2026 21:48:16 +0530
X-Gm-Features: AUfX_myRamKZs9Pz1Uafy6HqUB4KF-W3TjtfBxB6Gk-6zfv5-WT0ViJClPMK6qE
Message-ID: <CAKCYvoN=vM5gsGofBh_+CivXKqBJgV=4PqUkOwXB5SAkoMjJiA@mail.gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: fix space before tab in HalPhyRf_8723B.c
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey Greg,

Looking closer, these are commented-out function calls, not explanatory com=
ments
that look like leftover debug code rather than documentation.
Would you like me to send a v2 that removes these dead lines
entirely, rather than just fixing their whitespace?

Thanks,
Yash

On Mon, 20 Jul 2026 at 22:06, =E0=A4=AF=E0=A4=B6 =E0=A4=AA=E0=A5=8D=E0=A4=
=B0=E0=A4=A4=E0=A4=BE=E0=A4=AA =E0=A4=95=E0=A5=81=E0=A4=B2=E0=A4=B6=E0=A5=
=8D=E0=A4=B0=E0=A5=87=E0=A4=B7=E0=A5=8D=E0=A4=A0
<pratapyashkulshrestha@gmail.com> wrote:
>
> Hey Greg,
>
> Looking closer, those are commented-out function calls, not explanatory c=
omments.
> Looks like leftover debug messages rather than documentation.
>
> Would you like me to send a v2 that removes these dead lines
> entirely, rather than just fixing their whitespace?
>
> Thanks,
> Yash
>
> On Fri, 17 Jul 2026 at 17:45, Greg KH <gregkh@linuxfoundation.org> wrote:
>>
>> On Mon, Jul 13, 2026 at 09:50:20PM +0530, Yash Pratap Kulshrestha wrote:
>> > Remove stray spaces before tabs throughout HalPhyRf_8723B.c,
>> > fixing checkpatch.pl warnings. Most of them were comments but
>> > some of them were variable declarations with unusual indents
>> > having mixed space/tab alignments.
>> >
>> > Signed-off-by: Yash Pratap Kulshrestha <pratapyashkulshrestha@gmail.co=
m>
>> > ---
>> >  .../staging/rtl8723bs/hal/HalPhyRf_8723B.c    | 116 +++++++++--------=
-
>> >  1 file changed, 58 insertions(+), 58 deletions(-)
>> >
>> > diff --git a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c b/drivers/=
staging/rtl8723bs/hal/HalPhyRf_8723B.c
>> > index 70b68f473d58..ebebc202971c 100644
>> > --- a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
>> > +++ b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
>> > @@ -354,14 +354,14 @@ static u8 phy_PathA_IQK_8723B(
>> >       /* leave IQK mode */
>> >       PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x00000=
0);
>> >
>> > -     /*      enable path A PA in TXIQK mode */
>> > +     /* enable path A PA in TXIQK mode */
>> >       PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_WE_LUT, 0x80000, 0x=
1);
>> >       PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_RCK_OS, bRFRegOffse=
tMask, 0x18000);
>> >       PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_TXPA_G1, bRFRegOffs=
etMask, 0x0003f);
>> >       PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_TXPA_G2, bRFRegOffs=
etMask, 0xc7f87);
>> > -     /*      disable path B PA in TXIQK mode */
>> > -/*   PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xed, bRFRegOffsetMask=
, 0x00020); */
>> > -/*   PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0x43, bRFRegOffsetMask=
, 0x40ec1); */
>> > +     /* disable path B PA in TXIQK mode */
>> > +/* PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xed, bRFRegOffsetMask, =
0x00020); */
>> > +/* PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0x43, bRFRegOffsetMask, =
0x40ec1); */
>>
>> That doesn't look correct anymore, right?
>>
>> Why keep these lines at all?
>>
>> thanks,
>>
>> greg k-h
