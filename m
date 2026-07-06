Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4014338B7A2
	for <linux-staging@lists.linux.dev>; Mon,  6 Jul 2026 07:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783322793; cv=pass; b=fFylTjMJrki9kiPrIciDIOC3Jit8KKYClp+99ToP/MZjpLYIyB0bu4g/xXIJDhzVSs4u0N9/6fscHafjp/chlWknUhCwwm7npdF0CoJH7gYtePrRzWvYsNASNRH54hSUgT7Z1jLDHCAR47cpFL4jI97/xz2YFpA2JXxjeWJrElA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783322793; c=relaxed/simple;
	bh=TmZMr7qnoZfFBBjlwZYFSwhsf0IkymxQgjlivHAMXkk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=juSr+mY4M0TUXYc2bjhaAMp3tXqRAHIm6pHP4Ygruk92rLLIW+rP6I50AkdKPkXjbzF3NDx/UiMH9wBhOJ9mfp2NcGlPtr/3B6azRhnDW5eyvighbGkbfxlCzFwrNb9KWHzNYndm1ql+R76kyCe9tZotPrygs2/zO0UU3Ha15wU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SOFEM9tl; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SOFEM9tl"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-698aa8d4dafso2649422a12.0
        for <linux-staging@lists.linux.dev>; Mon, 06 Jul 2026 00:26:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783322785; cv=none;
        d=google.com; s=arc-20260327;
        b=UaPCEChu0jf4XmJ9jAudO0EIeAKO6QK5aZXNIwNWgSMoZkjDqdjOrOwjVUU7XmMXb/
         eZyYbEobqa1mqKYE7/3IWgpk/C0zBUYupkszMF277pDo5vD935oBYMNbiXTMReHq0wkJ
         b7xij/4zIa6bAL5OHFAJN+FCtRiuvwxWrYxeVcqLtsqrgCMO7J7li2ar0AwiIZlt5LCM
         FbQRqIofZeS6H5Cyig6L+b8P3ybIWz5mvtSzh7bOVoXSm4YhMg96/97wATytG88XmDn0
         IrHBcHRcndUNFmy14EE5UzXnin7ahZN9IH5cnAeXJlVmoZAyoZAMfNoz6RvhI4oKk9c3
         bXcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TmZMr7qnoZfFBBjlwZYFSwhsf0IkymxQgjlivHAMXkk=;
        fh=dLlyaTxOUKSaaUJvSoR/oIryIQ+SdGc6olcSvVrwyxw=;
        b=JNvm8jmUSelcTWTgacGzX61gl0BBIR8cd5Vhxynze+Z/uBdwOUkvYipOnXWgDZrX8/
         gbTRHjb6sLH6iHlgotf13z1crlri9FM5GjLeBTPCxnelzHGL5bUUaYdviOrA0oxWWK8a
         W511AsCqpet/tuc8fInRB8M39mXzRijRzfG4YeXIm/nYm0l6rxMynLUACNPaDgANVWs/
         bWF9cVowerAeMmgV/yhNfRXddtoZ/+vGvd/9jd/LErxsGBPaQ9jhyRlmw+sRs0Ca+4Dh
         URe3Au98B2LWR70VbpM6Jp3UPk06XqYUi8oMnS+JH7mwSdIKNaVkaS2C6HRTxFBRr3za
         NZcA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783322785; x=1783927585; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TmZMr7qnoZfFBBjlwZYFSwhsf0IkymxQgjlivHAMXkk=;
        b=SOFEM9tlRuxN5bgHKu5Nd8IiBLxz6n14z+cO832wDATKPCImbkzLryL1m0Ue4ur41b
         FNTpweF+AujUGWxHasNV8tXRKg4V3Ax7wnRhwcFCuIsy8DtS3OYIXasZoxomk2GBCtyl
         sMiaUq0X8SVxOeUOnL9rMwLGsia2DMoXRTR8XgEbbSz30kjVkV7Y9Kvhnrbmmr4sROpw
         A1YSgNG710F1RLg+4l68bLoakfG7sklMXdAQJGSp/tSnqrpgrmSkUwRoHPV+OzAyGy0p
         f4XyBJ9oQpY3hoSDcpVwobjYbtV9oQDRgmFDlgQVprmhU1NfERqABdFTUO/Co+W/wMit
         O8Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783322785; x=1783927585;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TmZMr7qnoZfFBBjlwZYFSwhsf0IkymxQgjlivHAMXkk=;
        b=qBBFSjVLarI9KBo8iVoDrQqSggF/SmLekBThHd0pzZutrNRvKtZzr/w1T8tU578a7D
         Crm9+V9QuoxQNJ9jX6SZY6nv++A8CUgkHGTkZ6mmL2Y4n9FLa8+lW+JbPWv6lmj/kwOS
         4JHQv/S3hVimi/64FQijkz+3RoAc0dwGtLUqOA7tJVajE0BZCs0FP8GBPXZOP/gXq+CL
         QZ6bp+OAYgIZ51cKkpwq7cXDUrLDpHvYFNaA4uC2cTVT6BDHGuukUENAomYL9oZlGlxv
         otWOczD3/EF1zjyWJznvb+BCu3FS41oQuv22vTC29NGYYuuhtYCMm/2S/K2Zu0Au6QxF
         aaiQ==
X-Forwarded-Encrypted: i=1; AHgh+RoNDTKMwibj7/HodOm5GTIzIjGrMXx5Gcr7JPNc+Pghlo0T6Zt4QF65rxotK/jRva/98SrVOqAzR9nBUzvf@lists.linux.dev
X-Gm-Message-State: AOJu0YyhT7kLZKO//pfibYeD9AIORpnq6GyYCqApnOzKj5c3szHZi7uS
	J0Ys/m05dTP4cVx/EgCidq4N/wgGrzQvk3jfV4RPzXbJWlcjf5rIbzzpILvWzPsRXwpk5IlqwSf
	XEGEquHYg4MVq0nhy7cFa+YxyISpdvqg=
X-Gm-Gg: AfdE7clXRx499J0RFBmwil8kxSmSM61mhLzQosp6njKlzUdLMVxCacP9544aAJionIr
	LTjAsW0Ov0CQJ2Sj7/j3G1pfl6NdtZ34k5WBWDIJcIc/jw+BN7kBcFuQ7pP1Sjoov7eFWTUDm71
	2HN0I31la1zph5swfto+dYbmarZux5DDy5kpTTKoybaCL57JW2DRGvkSmGnZ4mbYY8NP6wvvNET
	lqQB36gXgrthI0En99t453BMOTHyo6agy3l3DT08RFPeKo7zIOcQfTen8SyN7p6V1JTIxnOdS2D
	/vFfUwonhZYxtew8AgZQlqOG/blSSS0b91v/gxhAm8HM9Qjh24iBzfIisP6uMQ==
X-Received: by 2002:a05:6402:43c9:b0:698:3b7c:7e5a with SMTP id
 4fb4d7f45d1cf-69a1a4b82admr2848463a12.38.1783322784554; Mon, 06 Jul 2026
 00:26:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260704120113.201099-1-dileepsankhla.ds@gmail.com>
 <akkOdQ1oT0hIc0tz@ashevche-desk.local> <CAHxc4buoGJJ4ZUbvCz7EtcosH3mZWXp0NqFMfDBH1QV__0qDpA@mail.gmail.com>
 <CAHp75VfHKcW4BfgWht5wN=SY1u8=Jw4zAo=Sx0Fm_n0=D3pNWg@mail.gmail.com>
In-Reply-To: <CAHp75VfHKcW4BfgWht5wN=SY1u8=Jw4zAo=Sx0Fm_n0=D3pNWg@mail.gmail.com>
From: Dileep Sankhla <dileepsankhla.ds@gmail.com>
Date: Mon, 6 Jul 2026 13:04:11 +0530
X-Gm-Features: AVVi8Cdm1RuMXPdrRdKOsGqpaEOLhwnxaIzT4a5wX3sh-usB8LZMdtuLndCreJ4
Message-ID: <CAHxc4bt4ix2O_T6m4c9y+k8hqmx-C+iRd23mqVS-8Zns0DFa4A@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: Remove unnecessary else after return
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, andy@kernel.org, hansg@kernel.org, 
	mchehab@kernel.org, sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, 
	abdelrahmanfekry375@gmail.com, error27@gmail.com, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 6, 2026 at 10:58=E2=80=AFAM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> This is a huge driver and doing half-baked work doesn't make sense.

I will try to send a patch addressing all the "else is not generally
useful after a break or return" warnings.

> Also if you want to continue working on this driver, get the hardware.
> Almost any cheap second-hand Bay Trail and Cherry Trail tablet should
> suffice (of course one needs to check the specifications beforehand to
> be sure it uses AtomISP camera).

Sorry I cannot get the hardware right now.

--
Best Regards,
Dileep Sankhla
