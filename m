Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D4B278169
	for <linux-staging@lists.linux.dev>; Thu,  8 May 2025 14:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746715941; cv=none; b=RAH0H7q72+RJFslqNYOJJnxQH5qEI3uoMxX/aWyk8y7SNPo7TjL5HFTdFsMTOu8+1jrgnIZwlMu5lPk9bQ9k87BH6OsFQLbEs98oX1Rnm21Q1g8Hz+larW8JVqKCRum0bB/tJACxo1ixi7yu6V85zZvBLBdYoGRCII/K45oa/3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746715941; c=relaxed/simple;
	bh=zEFQKGgwI3EuuNl71JKybObkFkPSlGU5AwxHNXv2Yqo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R2MMwV2CroNoVd9emp/U3MiftBGoMNtl91EtyL4hc15VrFeczM/MfNbKpPCO85USjXS6jy2jQvMl6qHZMFYl6HB+cz6SwjC4jdcrVuQh2NyJnyKcDW0iX7+/MlxaSzsBAl6jzxa6Gjp8F64AYoI8J4AMc9MZoSCPmTzTGu9RZQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CUOlPSXg; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CUOlPSXg"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ac2bdea5a38so154860166b.0
        for <linux-staging@lists.linux.dev>; Thu, 08 May 2025 07:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746715936; x=1747320736; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zEFQKGgwI3EuuNl71JKybObkFkPSlGU5AwxHNXv2Yqo=;
        b=CUOlPSXggHPYieGarZaU/tcbqxco7JgNTghy7XqGcH7/5WKJVnuCXgrlGukbaTD4oL
         pebWqXuq0xFZqyBJhibseVfFDz+rB25kmMvH3+nGI/cDjwHcNSktf6yRzuEMonwcC9Sq
         vaw34dmwgHmT+kmjih96EYhCyYOxHJiJSQsdftwj/Rx33MAFE05HaypTCrVh+Q200Rib
         Wctouf9gZS4xFgnD5ccXDq3t0hg4VzJlBTbgWT+/EFjyARaqtPUI4BuA7yHNxycGiF/C
         w5E70z+MUSDqUvIJ3h3dmYATci8vOevfbV3yKG+1gP+xRtwv/FizTfLBmADigMAOr5RN
         p/mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746715936; x=1747320736;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zEFQKGgwI3EuuNl71JKybObkFkPSlGU5AwxHNXv2Yqo=;
        b=rj7YhM1aFngC6YwtdEZht9ZpIIAevmh+4Um2PLBn/UPTVr86OQw+vaxk6reizGwloT
         MQx42DlpJKIVOeqEC+Ovid0AzkMtdb4iTtipoWKGwaLWaffmsBO+jy20kwBtje6VmgJd
         k/3HoKezhKFQpF4tT1XCfJCq30ViY9QY/lSXVbXk0NiFWdu9V80KXe1smVVMNZHMu3Zu
         MIQuwC2FJN7vVOPCIItmvmgVybJ6a66369EVtQ4YAT/mDxcKWSYj/tPX2Ez3Mx4X453R
         WUZ7OmMTSaxtbxmzPTVEN6JkSafR6rFDjD2Da8cxYZ7yWa3UwrfbffLDvABdZckRE8zn
         jvuA==
X-Forwarded-Encrypted: i=1; AJvYcCUEQKGCmwCUjf6oNV8SKAugDPGI/uUSgEp5e/DzlgSwzOf3+KBBpLXsGNAWkbJq3vBWrQT5mYcAwqkEGnTx@lists.linux.dev
X-Gm-Message-State: AOJu0Yxf4Xyw7LaebT0kLNXA+rQruZEeEyM9Sg+3RtVudI5CbjzDd/oP
	C/cALxjaxaIIsQaSJfp5rCWSxpXInKy22B+6vH6z6quKPpe0ZrJDnjiqDIGwgCm6ZHs5WVhS3PA
	nhXJMa+7ofP3RFP2iCRa37uieDEI=
X-Gm-Gg: ASbGncuNQUwt9/vtV+SS0R4gVBsb29iygwwdajMKqBk8Wza7JGk/4AQDeZoFL8Znsb2
	sVvkmZVrFkDxI1wBKnlWQ3btgwCdqZqaM89H5OkWu57Xc74wE92V6G9D8Ds5HRfKYlDA2NhPFPQ
	dRO6FsNo4+OQJAJ+ALYvJJLlynCunfB4tgDxI=
X-Google-Smtp-Source: AGHT+IEsBSgz01pN0cO0LMyNdDhLRDOkfYDqhopudgY64WYs/wE/MG9dZJytCNFvXTnZfnCJSptlrpMURSb7NIV+ZPA=
X-Received: by 2002:a17:907:7ea3:b0:aca:cb18:9ad0 with SMTP id
 a640c23a62f3a-ad1fe9a0a38mr368434666b.45.1746715935518; Thu, 08 May 2025
 07:52:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250507184737.154747-1-hdegoede@redhat.com> <CAHp75Vcb-fcQHWqVDh=KUwhwvSP6KqUN8FsAMvDuwF2iD7=J1A@mail.gmail.com>
 <dc3b07a9-cb0f-4f84-9e4b-c6e62ffc73df@redhat.com>
In-Reply-To: <dc3b07a9-cb0f-4f84-9e4b-c6e62ffc73df@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 8 May 2025 17:51:38 +0300
X-Gm-Features: ATxdqUFyJujkSMlNxfUR3sdhq60BrkQnbnimnNRw0lOBs81u2F_A0KBZ58L_uxM
Message-ID: <CAHp75VfDoR6wP00e=3YiYSLwXV0f6jygJaxQY2gyUE2aPKNxvg@mail.gmail.com>
Subject: Re: [PATCH 0/6] platform/x86: int3472: Allow re-using sensor GPIO
 mapping in atomisp
To: Hans de Goede <hdegoede@redhat.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	platform-driver-x86@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 8, 2025 at 5:00=E2=80=AFPM Hans de Goede <hdegoede@redhat.com> =
wrote:
> On 8-May-25 10:36 AM, Andy Shevchenko wrote:
> > On Wed, May 7, 2025 at 9:52=E2=80=AFPM Hans de Goede <hdegoede@redhat.c=
om> wrote:

...

> > Can you isolate GPIO
> > mapping code in a separate file, please? This will help to generalise
> > this code outside of two mentioned drivers (I might need it in the
> > future for something else, not related to cameras at all).
>
> If you want to re-use this elsewhere then splitting it out
> further sounds like a good plan.
>
> But which bits do you need? Do you actually need the full code calling
> the special DSM and then adding either GPIO-lookups, or gpio controlled
> regulators / clks / LEDs ?
>
> Because atm the int3472/discrete.c + other c files linked into the .ko
> does all of that and for the atomisp2 case we actually want all of
> that (although for now GPIO -> clk and LED is unused there).

I basically want to have remap\ing quirk part to be isolated.

> Anyway I think it would be best for you (Andy) to come up with
> a proposal / RFC patch series to split out what you need. I'm certainly
> open to that and happy to review such a series.

Fine, but can you do this in the discrete.c internally, like an
embedded C file so it doesn't require headers to be used, but being an
interface-ready solution?

--=20
With Best Regards,
Andy Shevchenko
