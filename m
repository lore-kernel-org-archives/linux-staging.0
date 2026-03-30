Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C099626B098
	for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 08:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774860486; cv=pass; b=o5FX7VfOirQ8buyq8gYsFMWEW4iiyeFDjvRmYaRz+OtgfZ3XN0YN+gEnCNWNDzC18DkQ/xc+BFQzWvsx6xqfInM9bt5VGH7c87YTRkY0ggTFuK6jLVutnt3HD1ug6lYZCs0q5UKSf2ep8R8gSQ0v8OV2OsDSks7ZSH/xSNQhXwM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774860486; c=relaxed/simple;
	bh=nhnejJMNj5iwHuKtRuWzGRWrxq38E1WZuzk9fa1bNE4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sEmsLgtBoF758Tf36YXNlwk09BPkIcZNdzJlkFrLt3AS+EOXEANAmciFzmzog/DzphYRP2yGTqS5RhndSoPtCaPdarCcD3Ek6F2c+5kIAzijhcsdX3BQVyTMdEHkmITbuXPncVDU7aCbigysL43ym9AmVofznBn9Pg1LT2EU+yE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kagAkIZ/; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kagAkIZ/"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-661b16ac011so7827740a12.2
        for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 01:48:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774860483; cv=none;
        d=google.com; s=arc-20240605;
        b=leWKP+J7meCOdJLXFVn855qazA77RNpHHo61W5+9Fr+4r8rD8956lB1PimuKtN2+EA
         xyABOnUM8jgwl1PbmbX8e9vgmN7JzrnMwgeXH7mTS8nc8rdZUW292irf6aP0IxclhA5a
         IWxCF4Hi4buRMB04WntxxCW7usxEo8gP+T8BvBs6xNspWWPubayquQKH5xVH0K9DLVmR
         rvEixGO1QxykYgdKOUztJRYIPu9kXjP+mPgTTmy3yIxY1cXElBH87i9VE9HxBH33f97q
         CExMZKgGF3qq9YqKcxwWgI+ln/DRUHTvsG02Xa9XJ8b5Sd/yrLAAxCvTWbaDcBoIbk8P
         JE0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nhnejJMNj5iwHuKtRuWzGRWrxq38E1WZuzk9fa1bNE4=;
        fh=9jyaPx49io7N9VKV3CZs0CAfhKGtbOr6EoKzIjLMoEA=;
        b=NIK+CXVNX/SK38OlYAMmV1Q/crcmVhs5T7Wxn0RxEGOyVXj8RQEV9JqlmAMP/qXdVs
         CqRmEVRKZIO/Jjl/Vdvlc7N4FJKiQFxZ+s8VlQcX2ezokTquVLtZHwLKSJTSevOmjCDE
         YMFP7sraKtaEzIbvOwsiQ5UCSA5cX2JKkCrGCiM8pBLz9t4/63D1ezJHxjKrocAIr6Un
         rVN9elQMwWefMz9xgBUJ3gTZfzEJrY4qQKvjAc1RJsQ4Q/I7JR9HLQQKAJDogPF1tIMb
         fYphAGmubJQjpKJUoevW9weVRlcl+T+fFvdLu4PY4qoShZVZaKTIg+l6E+MhsP+5dyBE
         5FVg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774860483; x=1775465283; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nhnejJMNj5iwHuKtRuWzGRWrxq38E1WZuzk9fa1bNE4=;
        b=kagAkIZ/dLwoXA+KQ49CadflV1YrMJGq2KBwSYn2vn4AHBKGzAeeFHx/L4naxMvKBC
         t8STYM+mq5lvz1DlEtvOAQERerQGFMkocUcnUdBwImb6OVw93aErRprgWy89j/33B8jc
         ezoMe5aaoXJXTYYXnQRwCDACzgmNgqFSmqTPfmJ1odcPwEm5ld8NXrbAgCA7ZqSyUs8b
         FjS9wGAwi+qkI9Z8GgTXlg9TTccsb4987X/GlH0v8EzdhW8yDBZNHkAdCe+MZvD9ksWf
         AE7neMZnNUgb+29y7R1bJID/ZlDJLRYGE3YzO4BegZbkRgeeImwIXYAoLY5NrxMdgoGY
         liQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774860483; x=1775465283;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nhnejJMNj5iwHuKtRuWzGRWrxq38E1WZuzk9fa1bNE4=;
        b=KZHexHlVZPMYrOg5PZNyt6JditkNX8M7stZlFWe4pT3NZto4Kx/v6wwOzQMFYVMx4g
         tSJ1GqxPhOTUAH2njRpKAgg8gso4zZqLUH9eNHIV3Aen/Ic1RJFsEIZ9PfuMAaRRabuK
         TTekSGl/7t39Gf/9I9bDNPxl/vK9GSTPdZdBFXNYW/lbzSG7/I8Rm7gxupeCWtugFDI0
         57+eoWrrGGJGAVfF1eOyuB4jpouGKlvEQQ8/G56T6xtd7WjmXZ0O8cnREmuE7DSva18Z
         rznbfU/FNFY7cffnBFsAQ3auPa5ao613OkBxwy1F33iEpgP2CfgrtxFQUlStXjHwcKtd
         8giw==
X-Forwarded-Encrypted: i=1; AJvYcCXCzm7ex/GMiWrVUZWlvw4eoLiwc9kT8kBSdBFt5EkaMDpRPRL7o1Je35ZK+cAOUV/GtT34LeVCUFKIKQCK@lists.linux.dev
X-Gm-Message-State: AOJu0YzOPiUGizkI8eS54YlxIl4urbsx77Qgs6hcETlucsxmAjmZ40yx
	GgipTybkld7YDqNtPPxQEPFGIWAYamFAzdWeqz20n0an9hZ/G+l5dzYbN0fBLLD3RMcmGddPc4n
	6a9ntIDVdQnU76QE94Qm1r9OzKXS0Pas=
X-Gm-Gg: ATEYQzxZxMFQsj7nuKHLv40/Km6HrJwetQ03zJR9Kg5gKRKY62mbthEZWKeytS221fr
	hXeDVXizDhTjnuxHq4mYESZ5MVGgWp+ZRBr6k73+GhNwDA2lRfUfXDnKOrHAYWtusDipy5Ww4fk
	HJ01LCRdNGEMpaRABgXqHSvZvz/Ujuby43IJ9U9TXLNu1Cr0f3VglzA3vtT3OlDj4WXiJ67yOV5
	TKJ4En76aGZE93kZ1Cbk66BZeFEXeGavFMtwSqfyYvzOxrRxPrV25+Xu7ObrM4j18VSB4ocgJn8
	CwSXOP/6up6SninFMaPGkO2OGfTgtcHHU/yATdyvtMZClVxeK13UJpzOqAdYkG0KVQMk6A2MnBH
	3xO8nvTa9Qn+hwhm1Jw==
X-Received: by 2002:a17:907:7b97:b0:b98:32c1:249d with SMTP id
 a640c23a62f3a-b9b502bea95mr648871266b.5.1774860482968; Mon, 30 Mar 2026
 01:48:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260327031106.10386-1-anushkabadhe@gmail.com>
 <acZRRXXBoflHV0rt@ashevche-desk.local> <CAAfE=nMVP9zJKPendwusvVwjesVgKOTaSBHd0S219X-RNTMDzg@mail.gmail.com>
In-Reply-To: <CAAfE=nMVP9zJKPendwusvVwjesVgKOTaSBHd0S219X-RNTMDzg@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 30 Mar 2026 11:47:26 +0300
X-Gm-Features: AQROBzBvcAtkpxMXswfE8-CalscNGYDIDSDf1slA4HdTmZr8BpHC0VrUxyvRZ-E
Message-ID: <CAHp75Vf0uGUgSW=pOWKQcfpGcJPNFXDvkwcK0gTPQ14t4z72Nw@mail.gmail.com>
Subject: Re: [PATCH v6] staging: media: atomisp: fix GP_TIMER_BASE scope in gp_timer.c
To: Anushka B <anushkabadhe@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, andy@kernel.org, 
	gregkh@linuxfoundation.org, hansg@kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	mchehab@kernel.org, sakari.ailus@linux.intel.com, 
	Daniel Baluta <daniel.baluta@nxp.com>, Dhruva gole <goledhruva@gmail.com>, 
	Simona Toaca <simona.toaca@nxp.com>, m-chawdhry@ti.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 30, 2026 at 4:19=E2=80=AFAM Anushka B <anushkabadhe@gmail.com> =
wrote:
> On Fri, Mar 27, 2026 at 3:13=E2=80=AFPM Andy Shevchenko
> <andriy.shevchenko@intel.com> wrote:
> > On Fri, Mar 27, 2026 at 08:41:06AM +0530, Anushka Badhe wrote:

...

> > > ---
> > > Changes in v6:
> > > - Mark scope of GP_TIMER_BASE static
> >
> > Good catch, but read my comment against v5. And slow down with new vers=
ions,
> > no new version within 24h, please!

> I saw your comment on v5 regarding the GP TIMER comment style, thank
> you for the example.
> I also received feedback from Sakari on this file:
> > Please don't move the defition here. There's a reason for keeping it in=
 the
> > same location with the rest of the offsets.
> Would it be acceptable to go back to the simpler in-place merge in
> system_local.c, joining the split
> declaration of GP_TIMER_BASE? I can follow up with the comment
> formatting as a separate patch.

Sakari is the maintainer, follow what he says.

--=20
With Best Regards,
Andy Shevchenko
