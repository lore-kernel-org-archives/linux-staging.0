Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 656271D3625
	for <linux-staging@lists.linux.dev>; Fri,  8 Nov 2024 10:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731060890; cv=none; b=PeucZfdLg5jkCPlLTEm3XWDpMkTrdqZqQgkvrYd0PEPf7uXPrOTAodHwnuWjY8tjKFbl8RXO2NKqmAsp/ttQrZpRdD+rQQYVglFM0dMtJy4cMTmjz52Of4zPxpO6kzkXAvRHTXiWoEZ9MtyLQQCWIe5RsJjbm/ql/mx+/Jmv6tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731060890; c=relaxed/simple;
	bh=Q+C1b72oL+tBYPJlQszSjctoLRZ1tb9jhGxKJ43HmGg=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XIsLIPdQpSoNM/6/UyfNr2yFKBx1SdDrQs5ekAamSt1IUjy0Onx4AzrvTvt2hlBeaqotZ+100xX0kiaEW9NNePKqnTBVGGOJeFhK5MVA4HRSlMcT4ZfA3faNs/oNydffM4m5sLsXMvvgH9d+1iABPq1w2kapf2k2mokaI48y7YM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=iZdSO5DV; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="iZdSO5DV"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2fb49510250so19242671fa.0
        for <linux-staging@lists.linux.dev>; Fri, 08 Nov 2024 02:14:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1731060886; x=1731665686; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q+C1b72oL+tBYPJlQszSjctoLRZ1tb9jhGxKJ43HmGg=;
        b=iZdSO5DVW0t87BBMdMxoB8ytpRFnnvozvKBFZljl1bE7zlKIvnnSHlDvCGB7AX8cK6
         8pNG+XjyaxF82dDRwfv8sl/tMMCiN3x08fVT1yaFkVxR+SL5P5wW5H4ikm29/N6Bw+Gu
         LzXMAlnYGqh7xIfjRnuVCbi7TGIWty618zS32kG2tOelNOE+OSEOufACMcrWCbTv41sG
         5b7oht+kfmc9P0RqFb3z5E/pFF10QEaL/BC2lsgRmSopQK3bqii7enMz57Ak72XUNmzn
         UU7BwZcU4rF3sGd5N5L0B00j11nVMuUUYtbzgKQ+kqyNskTy+Lb40WffTD1u2mMOHsNF
         mm7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731060886; x=1731665686;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q+C1b72oL+tBYPJlQszSjctoLRZ1tb9jhGxKJ43HmGg=;
        b=IWlwiZnEdw8OfCtcqjdNC8667AGNyceYGqhWYD5rZvQ6Fu/qtMILmpiA2w87dIZ/+7
         48B+IJFatdcPCTzYuxvg9Qhg8340/bCLPC8ARZAaiTH55qd+jG50eoRjB3FRJUkVriTr
         J/l6GR4rT4tWDF1tOW40TSXoDc6bOcNV/0kEqidi5spEEubBMghqtTzlvmfKlvxrYABA
         gAx18G8ur/buHYvGJjaaNWVVNNekUpcoMKH9FDeOg6dsAPpwp1cmqCUMGGqhIY3UqeB9
         IG8aRSwTw7vsl8LtDEB9fs808ofCMRpGxBClFUUC1EWuzYYQHpwamD6XINUS1s1uQkUf
         su4g==
X-Forwarded-Encrypted: i=1; AJvYcCVFL3gVKxYUFhjC3CYo6vEN+d0LQ9azFJxtOP6WvvDGMmsnaXfJgh3xJgf5ACUKuL5oZ7jC3xgLZPWQTYrM@lists.linux.dev
X-Gm-Message-State: AOJu0Ywn7Us+2uT3NS19Zkn/TAbNP9890Ur0B3jIYMuZGO1QI0gPxD97
	d2ph21OsNBN5IHAilOaraAiSG3JcdD8zrgwYmEZvIpCmmmQg1CbPseFTJct72JefDphI+x+85Ot
	bhmc4fJhZdgoVdJzZL67StP83I6Tr/OoDzaaRbw==
X-Google-Smtp-Source: AGHT+IGf11c0mBsFLalzMr0/3WBxjNo7Hjzw+hkuKmKbXSSlEL+wUoo0hV3td8xnf9M6+bT1iZrRJWgEB35Fv7hzAuE=
X-Received: by 2002:a2e:a5cb:0:b0:2fb:c6e:9a36 with SMTP id
 38308e7fff4ca-2ff2028c50amr10097141fa.24.1731060886296; Fri, 08 Nov 2024
 02:14:46 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 8 Nov 2024 02:14:45 -0800
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <20241107221134.596149-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241107221134.596149-1-hdegoede@redhat.com>
Date: Fri, 8 Nov 2024 02:14:45 -0800
Message-ID: <CAMRc=Mf85fN1tjkf74Ozm9NS9soMPOzz_1LNxSUrt=14tJ-r=g@mail.gmail.com>
Subject: Re: [PATCH] media: atomisp: gmin: Remove GPIO driven regulator support
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Andy Shevchenko <andy@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 7 Nov 2024 23:11:34 +0100, Hans de Goede <hdegoede@redhat.com> said:
> The GMIN code has support for sensors using external regulators enabled
> by GPIOS, rather then using regulators build into the PMIC.
>
> With the exception of the Trekstor ST70408-4 (1) tablet there are no known
> devices which actually use external regulators for the sensors and the code
> for this is using deprecated old style GPIO numbers support for which is
> going away.
>
> Remove the GPIO driven regulator support so that the gmin code no longer
> depends on deprecated GPIO APIs.
>
> 1) The GMIN support itself is also deprecated and all sensor drivers still
> using it are being moved over to use ACPI + runtime-pm and the ST70408-4
> shipped with Android as factory OS and thus will have broken ACPI tables
> for the sensors, so like other Android factory OS tablets it will need
> a bespoke solution anyways.
>
> Reported-by: Bartosz Golaszewski <brgl@bgdev.pl>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>

Thank you for taking the time to do this and removing an instance of using the
legacy API!

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
