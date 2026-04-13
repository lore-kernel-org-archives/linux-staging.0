Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7263932D1
	for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 07:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776064898; cv=pass; b=cfSn76mpNu170uqqud5AfIdjx5ufxY+EhZupHv3n1dkBhkv9xwYGj+1EfiUwV8GqEIzQzv/TZcmT+ecqLFEFIL78nsoPtIj+q4LotjfexcGj/AILgP6fDYEmdhKivYjE7CAGsma4veIyI4TDyi2XIx5kTruan0gs6bfF/0vF+MA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776064898; c=relaxed/simple;
	bh=BNT/yCTRSGXv333icB68ybeYVQGghggSusimWfvxYeQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pz1jDWdJg0ZmGUo1D3AOuyjvAbSIqz8JON8v7bydnrSo2Mhbe9tMxV7ik7Edvv5bieE6vulsQrMtssdQMIgLc9Pbf5uIENfeADw2Oc9m/838Yzw9fLBcz78H9v83u+mzKXuWR4hooszHyxu8s0VhAzzMOJ/SHWyWQudT55xZLjg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OngRWPam; arc=pass smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OngRWPam"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b9d6c8871c7so567824166b.1
        for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 00:21:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776064895; cv=none;
        d=google.com; s=arc-20240605;
        b=ROfquiEBgLB+/M6RH093iCCKD11AEWn3YqDVW/lj8agV74OoWtSvg3/AxdT97UDt6C
         U2EWSGfU3drACixGWncXt5he38azCHHU45jOb0oK2QRH7zZ3yPyNYwVoagrVLADAmBop
         jm4b2CoQtdxiy5PtMU5WkpybrB/jLX+NoTqTinNcfu7QwP6+ysZtdy5OBNXPxPIdTBZq
         vbYV6MvIo8vduHkW3QpOm/SBA/uLAfpdK6Yax8n/4gHpDHyLauG9s3fv+cFxRR8HfnHt
         60Q3GVbMs9LVOgekX3YemaRfaC0Sy1rgCb63HlJitDrcc6wplJQH535YpjmEB2EAx5Ej
         B3Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nA2Xl+mnzaaZV8sYdVczI2AyzUchiW35XMXQbowZEH0=;
        fh=qlcb7KsiIWROSChRVhMRY7FEbXmipKN60Em9ncRYE6Q=;
        b=gX5vwSjnVpSaUpszQt4QbFKUO/wIOTko9xkzi4X/cyB6ccs1dAnbuaqgELcDsMd9p7
         RXw7xPiz+/s20b9Jb9NXc4X/i8YJ3x+aPZHS+ajnhtLx1cOqC7qC4GmJjTB2Wo/D8vmh
         /AFVSBHgABV4/jGvAqlfAVwVFoIHcRWEK574d856wirYeEbZGO994VlBogPJ6bM0reWs
         TOKOAVo7bJdlSS0eJnp+uhhtvzrZK+WACHNzxhPVQEFQ20nQYZfqEZFdJGSVWkXtqE2v
         UlzSUDFrfHjTvsxHFg6v95rKf2NMcoB8VsXia7G0NK4nYAWAl8MpOmHvVY7otvLYjMvv
         ANlg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776064895; x=1776669695; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nA2Xl+mnzaaZV8sYdVczI2AyzUchiW35XMXQbowZEH0=;
        b=OngRWPamJaK1Z5YPi34uOg/BXq2UJf7QfTrSiNaucVKIZhzh1yXJkXYdr+uoQTl4ee
         auQM6Q+bpg1SCqfNFWNhFGV0epEDIgYmTRMwNH4B4JU0b+AO4cishYAzywtWqJdz7VCv
         B2REIV10oHOlnG38ht0ihCIZob0T95J1N1BX0kbTe59FkEMZvCoiac05fL1fnE5hKZ2d
         MzIpk0qSS5FvqSG8aYkZyvfVWIWFzYt8pcSJ4dse5f39sU/xNgQy2LaKpR9npunCSsPF
         xU5G4blRovRqh8rlkrkE6dLCMssxQoqSxRcSfoBw2T6jyF6lMHhAgb//EwKS/aPSrAig
         Lvvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776064895; x=1776669695;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nA2Xl+mnzaaZV8sYdVczI2AyzUchiW35XMXQbowZEH0=;
        b=DzJH/xnoyeER6dqC5CJueVUI4EZ3I9Ng12mdzj6OVKfbdtkFDrAVhxqRfO2iVa6iip
         cU4Fon/OQjoT5kmIzHhuiwsQlMDMl4gvbK8/X8tlGlnVBKE7SvuGiu/eZYJCFKtGZHpl
         dMfmunz9/IBrvzahmTkS8Ojh1RVpgEzA7K6ata/IkZKCZ0O2wi+GwBpBfVzZv8NuCsQo
         cKGBLFdqdJSrCHupC9JwSSMt4SevnuKSvv36xVNMmdoFknEdhUPZlBy9TDJgpa8w41R1
         tIA/82No5ya9UV6o5wvEb1wrTUrv2SuK5TqIPDOHDKKsv4BdSZ6g2MJ9ie+b4jAejnXU
         X3Xg==
X-Forwarded-Encrypted: i=1; AFNElJ9HFv780yeH6GypplpDlgHPCZYC2PR15fCG1Ve5tBVyOoDQQ9x51DS6cJppDcboyjO48PevUv8DL4zJ+tRW@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3kXy19bvg84tjB7Nf8ku9lsDYOLeIoCTYHuPPLJlHF4XAaLhd
	9QuR41yM3IdepUrTj7a0H6EywM7/a7mb3iuXU5rgahTUwhTeBAsK+MH/rT+Vn/Kecp3F05/YYek
	9m3l9vubj67iaBrTMzbwFz9gNy+QHsUU=
X-Gm-Gg: AeBDies1Srq1Zmt5EHsaoBoTy77i6L2bGdmcn0cufSWHz/SaaI9OA5ZG07YEF3n/JN1
	E4N2tdoE9N9JKa2zvNOL3ePzP4DkO8COIwUqEkN2zW8JBOXFARWqzd6lT6pzvgbYuycuC5UdxOy
	WUM8GGCzH5zQYngtg0YDV/9cawV1BZa4iLbTeYg/3sSc83Dq/tq81NetI1lkHLqcYTmCNU4o77H
	T1G/9o+OXPkDB6fCF+tvlymH5bs1uIKBYTcVxguJqj13NhDNnyW9mIkazWuj/GxVU6ayFm2KhjA
	ag5InDqZ26xxOIG9GAvoW4D20R4KA9/o7sXqJwkei2w07Jw9mw4i/OctX5BxY99aqkGP3wsEQ0F
	IW64DwWY=
X-Received: by 2002:a17:906:2099:b0:b97:a39d:ae3d with SMTP id
 a640c23a62f3a-b9d7267c173mr460427866b.44.1776064895372; Mon, 13 Apr 2026
 00:21:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260412140542.41911-1-shyamsunderreddypadira@gmail.com>
In-Reply-To: <20260412140542.41911-1-shyamsunderreddypadira@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 13 Apr 2026 10:20:59 +0300
X-Gm-Features: AQROBzBm_g27xyMunMobvpvlpkr6_woqrWvgrjAFRf30kqIxozdE3KlPajaLtUU
Message-ID: <CAHp75VdTqr5XRJY5wgLQzxiBMBss4JCe1i8C_k4Yh2sat=irSA@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: remove outdated TODO comment
To: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
Cc: andy@kernel.org, hansg@kernel.org, mchehab@kernel.org, 
	gregkh@linuxfoundation.org, sakari.ailus@linux.intel.com, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 12, 2026 at 5:06=E2=80=AFPM Shyam Sunder Reddy Padira
<shyamsunderreddypadira@gmail.com> wrote:
>
> Remove a TODO comment suggesting a filename change for
> sw_event_global.h. The header is already consistently
> used across the driver, making the comment obsolete.
>
> No functional changes.

Unneeded churn.

...

>  #include <type_support.h>
> -#include "sw_event_global.h"    /*event macros.TODO : Change File Name..=
???*/
> +#include "sw_event_global.h"    /*event macros.*/

And still the comment has style issues...

--=20
With Best Regards,
Andy Shevchenko
