Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B25164AA4
	for <linux-staging@lists.linux.dev>; Sun,  5 Jul 2026 07:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783235966; cv=pass; b=Itgkb0AyXWe+LWEGeb++D6JGG3cEaXUma5ZhV4dbSayBYeW8zhEK4wP/e34BMofi3GHclD8Kq7xcKyTx+9lCss3gP2WHAYaNb7mKm8AjSRXv3IX0GxnZV2p8ND1wmCkGzf30AywDnJDBnjLHdlVea/GQ8JiDZ7UcsUNlhuNxdmM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783235966; c=relaxed/simple;
	bh=CSmO9dED5MukBr1OCdiFjkn9M5dIv/f678IztuUO3xo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W7I5rU5vk68xgUfT0D0bbkX88UNVSQUY7iwjfKAWjzI+MWmXwqb1ukOSe3UHq1plBw0gwxcqNoWKsMzabI7f+HJgximp6mqxm1QjnSyruhIHLNc5MwQbcyBshja/SCx31X5WAH13K3/50udZnUMWsduVJI0T+oJ9HYIizEjj390=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pHnVeoM8; arc=pass smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pHnVeoM8"
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-49cb5f51b01so53290b6e.0
        for <linux-staging@lists.linux.dev>; Sun, 05 Jul 2026 00:19:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783235964; cv=none;
        d=google.com; s=arc-20260327;
        b=a8P+lEVb3HnBx/0ISdrDtadY6uM0Pyb3Z4V40TCoQbHIa17L/+/jADeK/6oFIeBkMw
         JoYXuBjT/ixRz9CtgO5Ar5UsUVvs3SgIp5Tp9QNjeHdGWqjPO5dbjupAemcqCkvu5fyN
         Z+dlNuy1G3+JAb1NB4zy/8HHWMWEqJF5RbQD4cAo9GW4IUmyNna2F1CETruBtuJTLUsP
         qaBu6nR7YAJ3tNxd9of6JmHtzqCPyQTbEXxKTKjcs8jHRaoF81KXls8c9OZYQhmEiRZi
         U4ooPShfG1y6n+ash3eMiZaXqF1txlodW5MvWj2Uc3AoAbeCU5I08+iWS+md9T1WU16z
         I3Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WvbZLkZ0Tncr5wiImdqWfYK+VnSA7b07oguAxoTRlH4=;
        fh=IDSMQVb6Djatx791morf76rb6bHZcnK7L5Pmzj5QNRo=;
        b=kcLue45TSkAHItzYZ/6bmVm7KJjWRbxFRff6Jrs0zS+o/8EKVNklTe9N8Rp1CjUJiL
         fooEPOq24RQK23p7bgCsNX/D6lQbqtJkhmzYitmuW+xtasRxtyLlt5s2oLKlw/FuuzXs
         S0ZCdb+luqZ5UiCVkBHqyglV6s+fjWwN8oMVeHD4QqCTtUNnCkjj9o5T2uYDMbHzxXwo
         zan9Q9b5ZFsjgrSo+lO0TbUNlZgrKFM8F354T/QzuboQP6ABYa2nP+RQHn58Lc/SaZrL
         AwOwB8OAjkB9TA7ySHVj/DHlK7u2XI0CmSik3+vcQOOsuxWeCCgPD3qUy0GTsVGIS+Q+
         W5eA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783235964; x=1783840764; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WvbZLkZ0Tncr5wiImdqWfYK+VnSA7b07oguAxoTRlH4=;
        b=pHnVeoM8InUCj8aEWNwyhsOdKVSyU4MWb2EeyTdXDI6qUucPnfidSPeUUOfKaor6g4
         Y+gTMM8zaEt40OFQUw5bXczdjRxK6GfZtnruwVNQXJ9mMJToK9Eivson991Vin+MPV5x
         Abq0JtRbN4as9HNInDz5VDaKolZRPD00xS2Hlc1DFUvUp4dZEYnggsuQx/4hkzr4Hbcg
         RYxhJRhfBe5Iw3bu4R1zQvu4vUF9+M9u1UEHjNYIvE/4OWsVL/ZWe3ODOaZP+4pCtj//
         3y90i7NV3Zvc/rK6SVYLwrVuk36tYGDzBRwW7HtFbRlqPh6u2RXRMDbdrnXNHW85Ucvn
         o1bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783235964; x=1783840764;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WvbZLkZ0Tncr5wiImdqWfYK+VnSA7b07oguAxoTRlH4=;
        b=fyt8+TEyzDg6+GFBdKTVDDnimLD82absovV6qWTF+M3WW53rYmDD8QY/Wzej9PmlC/
         snIAMBp67Xc1klwhzuo5JimgpfjyzthHkFoplY4o/3zMLz7HWXIecaIovMlBBzKkVykk
         VMg+qP8hBUJeZfzgd4DChizuAaM6VZaBYbXSyuAlnBimqIuYp8tCH0521zqjZApbsioC
         1qIKkye4gRHUD3H2fWU2GEq8SSUW8OlNdn39dyFXtZkp490qLgNTGl0wrzZFM80bE8R7
         6lPlN36GsE7Wuuk0+8r+L9xqTPt69WH8zkxwA+tjk0DO6RAs2insqmnkLoABs1GJ+8X8
         Ol8w==
X-Forwarded-Encrypted: i=1; AFNElJ+hsGHAi9R99E5QkoWJTqeKylbluVtr/+DYNc64iRZrcpDBVSGM/J3wixhvmBrqFIGT5nVUL19z8KOX0ntj@lists.linux.dev
X-Gm-Message-State: AOJu0YxOiS5bp/U5njhxLYO1mAFGcPek2bQ1rFrN5yhoQvsMe0tIokyk
	q68wgAybThYNyG2Z0fnOgNXx1XQGl0hcvjlt07rIrkTXTqfoOOSR+Fu6B6pvgkqqwkpCggvb/xE
	YqmJdn8TWzTotxrVbUJZHV+GedmgJvAM=
X-Gm-Gg: AfdE7cnZOisFv4v8pPlG0vMIBfy89gG2P6NDlKafg3xflY0Y8l82QFuzh+7CRhdSAZi
	FOwMq5QNmRpqEShraSjUUVvX1Wl+Tvy0JDV0w/ZmGl+s4yZQisB7WIPlRyuRBMMLI8IbcR1sDmb
	nsBHisGVxOq2u1VvnTvuqNvhsF3jEX0MA/yFh2/6d9CJW5AdsvbpfdIv9VAqLdFeyMRgP4Ey+S4
	vaa4QiVj41bn4SA9iyRW7dxWlyYOjoIQ42K/znLZfMIxQSao+Lz1bc34jMHnE1+Rb17lJBICvY5
	l37Ua9uuMPP0xobejrA=
X-Received: by 2002:a05:6808:159f:b0:497:e695:3423 with SMTP id
 5614622812f47-499affe5af5mr3144698b6e.0.1783235964556; Sun, 05 Jul 2026
 00:19:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260705043920.105252-1-nealpatalay0@gmail.com> <akn7rISgJJeFbOWS@ashevche-desk.local>
In-Reply-To: <akn7rISgJJeFbOWS@ashevche-desk.local>
From: Neal Patalay <nealpatalay0@gmail.com>
Date: Sun, 5 Jul 2026 00:19:13 -0700
X-Gm-Features: AVVi8CeUIhv6_orfrYyWSfGNCaj_IggWg-fAys9xpbnlt8Xc7YBzlYwM2jVODKI
Message-ID: <CAGjuiT9+Gi5=dbtgMsxSu1jG4Uz8uqVSoFL+jFHLra+w+hxf2A@mail.gmail.com>
Subject: Re: [PATCH v2] staging: media: atomisp: refactor pipe graph dump
 stage formatting
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: andy@kernel.org, hansg@kernel.org, mchehab@kernel.org, 
	gregkh@linuxfoundation.org, sakari.ailus@linux.intel.com, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, mugrinphoto@gmail.com, matt@mattwardle.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 4, 2026 at 11:37=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
> The definition should go to the top of the function, there are only a few
> exceptions and none is for this case.
>
> Also for the sake of better layering, introduce local variables to track =
values
> of offset and line_len and only assign them at the end.

Thank you, I'll implement this.

> There is no need to have do {} while (0) as there is conditional already =
and the
> macro doesn't return anything. Also it's wrongly indented.
>
> The below should work.
>
> #define ADD_INFO(flag, flag_str)                                         =
       \
>         if (bi->enable.flag)                                             =
       \
>                 ia_css_debug_build_info(enable_info, sizeof(enable_info),=
       \
>                                         &offset,                         =
       \
>                                         flag_str, sizeof(flag_str),      =
       \
>                                         &line_len);                      =
       \
>

Great, I'll fix the indentation and remove the loop. However, please be
aware that the loop's purpose was silencing a spurious checkpatch error,
so that will reappear. Also, I'll take the final "\" off the end of
the macro you
provided and also remove the ";" since that raises a checkpatch warning.

--=20
Thank you,
Neal Patalay
