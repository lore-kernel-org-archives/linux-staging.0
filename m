Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A23F1405F7
	for <linux-staging@lists.linux.dev>; Wed, 29 Apr 2026 05:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777441761; cv=pass; b=rVDHnrzq2XNvrhgxrJCpe7GinOWJKJqzXNpNj73GfE/hVKMrg8CE+StDAfUlN31rt2j4NGGWUTbPgL2rKAlNY8oQd/hHuCLM+Zzm2S4folEVdOyzj38YcqsTVMLkezAP5jPnogd5Fs4UPa/SUBZivj6hsktBfmLIVSZsNlOkVFs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777441761; c=relaxed/simple;
	bh=NwRV2kYrYdb7V4qwDjoqIgMCdFIe/qodIEPhLrCQ0dE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DdYsxwxWCUHkgwx86iOeK6r6D3Ubjf5kdq+5v1HsBFk1wCuOOqB63dwAjOt+RHbQ1xHO/4gLOcAIinyYSJwnAwEtGycVTJE237QAiSZbz9Wxb2n0igOtJPvBnO92Uk7/Sx5Q8R3GMkOQvb/5WIafH10KFQwP1uof8+7HYSx9Dio=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TVAvm9VV; arc=pass smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TVAvm9VV"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ba6838e76f2so1278921566b.2
        for <linux-staging@lists.linux.dev>; Tue, 28 Apr 2026 22:49:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777441759; cv=none;
        d=google.com; s=arc-20240605;
        b=ByNsA0XUbhnLQ3Rlw20eAFFGDGhK4Ix+TaQfHpYxlbuN0cs1yeR2re5+tQwAShe0FX
         B1bwZebny0QpFzFcWrdANlkwWLy6pusZf9rueK0CW3ZYfYvvlMS8Y5hr89VawEBQxbzG
         pSNantqZ9ZCRu1EyzKjGgxc1Q7GAJ1OisEIRtH+fNIs+vUhW1E2O6t6bqy6KtoneL5yt
         1UzwkvrOVhEsEmCn2AhW1AqYYNPPfc8cLDzlqWCRyOwZIjlmWuN8WOlAMPPlT1EG9Xgw
         IFcMKZ1jfXIaPHNLAMyvgDiZ1G+EePCtmvkDwikJd2zrOnjbLw/uhNikTrH4MtzNugEE
         vedQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NwRV2kYrYdb7V4qwDjoqIgMCdFIe/qodIEPhLrCQ0dE=;
        fh=5f2c0DNl18SLGe8JnikoZfhis08uAMc21NldNbILIsY=;
        b=l21QzymTYEAZNAWC5AIZsUSjnTE4K1PFoC3l+ywZJGpF9Dmhm2ga8YonnyJH+WTjAh
         u7NyReCMrmMIcAMii7KC4wB465hT5QnqC34Pb+f1WVa03iPJorLerD8Xk6hSyxmCoYxf
         nJBeZDLHCO4DGxN49U3/pDBHzSqvGAtGY1AymPrWdmwTyL6KXfuVzNxFTizpSu1Ju7fm
         k5SiWmexBTdsVbXFUbqqysGY2cQkHFU9HRPE8h1V5uiDsEnoVE9i68kIjthzPYQ8Tm8k
         4w5Eq9WCr+Xs7M6utGmadFbznbdeXdNRb3TnMzcqIcMBcZ+vFemSg0wIlVQg/OtVtEoQ
         Xscw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777441759; x=1778046559; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NwRV2kYrYdb7V4qwDjoqIgMCdFIe/qodIEPhLrCQ0dE=;
        b=TVAvm9VVe10DBuqguAHUc7CnW5NBV8ZDA2Sty8G13PI3r5hDNfVQPzxSyylBMpQ4e1
         Ayti1vR6sTTjBn4UHI+91YXLeuJgzFyq2lkeG1BH7NYdQxeq/3uIrSt5XpeY+OD7M9JR
         wblTu2sJyCOd0yMhs5EBGZh0Q/w2UmNLiGncib/tVCen89jevJ0dZGpnKgSpJu59dN7F
         ECzLW/S21JND6/Lx4y0hcv1egL/wgyLQOLO76O4yhccVCzRFV28Oybk08/DRPbNhms/H
         seJFCIjoqIJyIc2PRs4pCMgLRLcFcuboEx+Fv+0Rbna5Wq5LDkJLa5XRWA1HPt/GlY2z
         iIGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777441759; x=1778046559;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NwRV2kYrYdb7V4qwDjoqIgMCdFIe/qodIEPhLrCQ0dE=;
        b=Vk3ja7S9mZiJNOyc8afnYAu7B9DHC0X8fb/jI9eYhwbbNLblrU/ykiI2B5XG69PldI
         H6Zc2tGV43GLEWQieL0D8OwvHGZawpXj1q2RlMTZMCa6sCdtRNryNIoKrM4HBB3y8ZwS
         3bE6cp+GKbF0YjDqL2C6d9s6R6KJngtXno3z4vMowYF48kcPoxosQddzxut+wNo5UAe0
         GW7Wzxbqk+192SVsTpg0ZQQBm5O0wt0BKa/lZJshfL9ELwQ1eFle3ZNVgQ1O6xNBMan/
         QUDG4wmi2WIB53LkRkRX5b6oCYy9Mtpf/9P4wCzGvgU+JZhaZPkgAcSfbCi5KztHYYu+
         LtsA==
X-Forwarded-Encrypted: i=1; AFNElJ+K7aIYQaFxyLMcwpOod23JTdP4Rnk2XkdpMtJwaL109M+jxQN71Ih882aJlqM25FZY3+IzsBMBoEpJt883@lists.linux.dev
X-Gm-Message-State: AOJu0Yw7ZzhPscpmHbY4JHIsIibrIxrsKGGjyyRKB6fuQ21Cm3XStb/9
	hUyrjjj36QogaG5XEiMs6istSdvMikl2T9nJ2+LWGuhS9XqxCLvpsfhd+3sGsTfMqmKRlWzNeDS
	hzpzcVEqTvh5Pc31BQJCTJLXPH8P36CI=
X-Gm-Gg: AeBDieslxQL5kzuipK+fPmWGZXCoGzZRSdU2DxXBH7awc5iJ+qh1FisihcfuS5gDT2a
	S5N0Fb8GsV+rK7AF2qSMGNxDpNoiffzRDnMIAWhMir3z9FoFpJDp0rfztzBVPgHqpg07wg3yTGm
	zNGwVnLs/09C+TtQ/OFubCMpldxw/pBuBuZEiIxtjE8hT/rgxyFoAeviu5Yk+uy7lV2YPBNd2CY
	R9NARtyXayXIKjsOy5PqZ1yC7lATNX59H/adINabw7ikBCUsZbCbMvBIx5QHLxmDq70LBvDTavZ
	o6haSdONawCKhLsGZTWs4IOXLK6fZapdX7kvH7OZ6Am8Wnys291gveLTK7zzvPIZIhwCDNruqRS
	Le4YDxHrkutullOquaKGxkkFRRRCf1g==
X-Received: by 2002:a17:906:8d8d:b0:b9c:b682:83bd with SMTP id
 a640c23a62f3a-bb93c5a04e7mr141132366b.4.1777441758853; Tue, 28 Apr 2026
 22:49:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260429020335.83143-1-skunkolee@gmail.com>
In-Reply-To: <20260429020335.83143-1-skunkolee@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 29 Apr 2026 08:48:42 +0300
X-Gm-Features: AVHnY4JLhSADkEpO7gqOKY11kHU9CSlehpegdwa7RODHETaXl32kSTomXjSuQnY
Message-ID: <CAHp75Vcf2gOf_UK6x2=ZttqLE6ErGVO5tK3Cc5HszGfAVTUksw@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: ov2722: clean up ov2722_startup()
To: auth <skunkolee@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kees Cook <kees@kernel.org>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Ingo Molnar <mingo@kernel.org>, 
	"open list:INTEL MID (Mobile Internet Device) PLATFORM" <linux-kernel@vger.kernel.org>, 
	"open list:STAGING - ATOMISP DRIVER" <linux-media@vger.kernel.org>, 
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 29, 2026 at 5:04=E2=80=AFAM auth <skunkolee@gmail.com> wrote:
>
> Replace misleading comment with description of the function's purpose. Al=
so replace return ret with return 0 since ret is guaranteed to be zero at t=
hat point.

First of all, wrap the commit message to the ~72 characters per line.
Second, Why do you think the comment is misleading? It's a TODO item.
Perhaps the better change is to address that?

> Signed-off-by: auth <skunkolee@gmail.com>

Last but not least, use your real name.

--=20
With Best Regards,
Andy Shevchenko
