Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com [209.85.167.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE7E36AB61
	for <linux-staging@lists.linux.dev>; Sun, 10 May 2026 09:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778404939; cv=pass; b=WFg4pvVQMr/FUlYESaRoMtdwYtnGiPW0lLzBtpJVsLEjfumhtsXhe03u8F1XCKm5zvyI5F3ANgdwchKKkUH85DSPkMRex6Rk1cGX5wyiSxol1V2dG0ruKqEcmEWa2tFlMfRX9D1r9ecwdApPL3ZzC4atkDaITZsrUT1/fMdpKBM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778404939; c=relaxed/simple;
	bh=kFLwjP1TIMQ4ZwyBaJRta17CrS1ym9WycnflmwHVa5Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dFXQkpf79BT4JGFSEGEk72fEI9O3+RVQN8wSajq4GW7y+7OB7ufwa1dhhw4pKarrFSltFx3jKlYISwd/39IbE0aRA0tP3uVsb1YADRguxNTQ+KrLtGyK32SNe8m8RyE6HpEpfZEzybfaeKn43MsYjlj9sf2ksqQj1FYlvU5qri4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NHkLzlyo; arc=pass smtp.client-ip=209.85.167.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NHkLzlyo"
Received: by mail-lf1-f65.google.com with SMTP id 2adb3069b0e04-5a858881ad2so3438832e87.3
        for <linux-staging@lists.linux.dev>; Sun, 10 May 2026 02:22:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778404936; cv=none;
        d=google.com; s=arc-20240605;
        b=hldJX9pEh40XCC+FECxLcjY1pe1NwkNI3oA6wR7iKBZ12UZqWAdEQtrq51yVTpVHBj
         uDK1REiHs3x3sJeItUbXLjAUY7e722r9fY+ljjFQLi1W6UJlWJ/F8+5LiDkD1IcR/px1
         YIQ3BDxW/XLtRmeTVOhDnXc3y/gJA5Yf6PSaSXbddb9yxLh6sb5DumyYUKru6ajQQ8oW
         wk12uOt1BWcueHwsvqq4XwE++XfEsYHyAZe/x0x5wQ6aW0v/vZLXVa/NEDy8mzXCC0dX
         gUTxKv4MOK81vpN81oAGoDRfkdQzJj7BldVEYDnjYKW7uIgYHzp+4UJ0Ltrd7c92Bj7H
         1/PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=kFLwjP1TIMQ4ZwyBaJRta17CrS1ym9WycnflmwHVa5Y=;
        fh=ERVhX4LYgRLmhaOk5cJJKF64lY4pE5Gjicpdvxn6TBI=;
        b=c3aVdO8P6GV1SZpgBqEj8zIujhozM/JlxNBV+xGOygaW0zG4cIgRgrY1x5x9s0zI8F
         /F26XKf9WtdiBwxEoiF8V532/SbBqml8uA2GtCnCNo5OIR4QpsArXR6dPX7TivjXHl67
         nFhZs2iwvgqGgYL2yWvNy4lzFluIY7jRR0bSydwVENyLFaC25yHxwUi5YeSke2T23aAK
         g5FqYd8Gf1yKND3nZuCbHYMVRHOBm020WCcq+1AsJdmBQa9E03mzLdl94yvhyJ6iTeWc
         IFa6/utmHsEwOALRiDuGhH9iE7czJNTUzOAkpaMO/Rz/RyC+RqeguiZdjAA1lUoLKqyX
         GlMw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778404936; x=1779009736; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kFLwjP1TIMQ4ZwyBaJRta17CrS1ym9WycnflmwHVa5Y=;
        b=NHkLzlyofdP/5BNCbRPs0FqYYUBKayFwJytEzWMzwQH7CSwmuP19F+T6AjnAF0AoSX
         TbwR78ggSV352K/7higFoZbrRsOdMU3qMA/TBQHzKjzQbOur+1i8eXzCKJiOX9Ilm28t
         37FVgmAMHyQuAsBySBKfWxF7OeEeX1IHriNk4GfVMI7spYoih/ZWI5QBVQvHcGjHNimz
         aOUuA+8zHxgjw0sVpc9hYhPR32/8HXEGoR07UqN3jR2L6q+P8C32FwofTCgdNCtBBrkC
         1S7RI8JPycDpMeBA0MhB+m+LCb8GYeUF8nFBTAHh8xMOafnpu4YFTszoOguziso8W/xm
         Djsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778404936; x=1779009736;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kFLwjP1TIMQ4ZwyBaJRta17CrS1ym9WycnflmwHVa5Y=;
        b=YYYlpefirycOqZTQIg5xYx5NJxuSp/LifFfcE3afBuIohFNdZks48uXxPuUlRpQEWF
         FcHbyZsgNLvZkMoh3lSCs/ABaEgRcUlY3xiF/iM35Zu+krWDZM3AGjN9LZvYigPSpJK9
         qN1Cwbgvf9UfZFlacgrPxqsbgGfWQV3J/c6LwVMyxelPcvaICW9/QRsyrJTHWyhf2u9L
         zMnXAjJ8eW9h9bsUAMInGEVXxLGxra7cLzpzf+GVaidPWSOVWGmc+D/nIf5dKokfTwwP
         0/hyOhZIbmyAeOOExkdMlYOYEi+S73GA/5+Woq9eFKuVnLYEkhvv28GpR++/Ca7Xevbj
         EohQ==
X-Forwarded-Encrypted: i=1; AFNElJ/QfCTz/XZkZreqFDeJmKulzyeGi9PAF2Ldhir6x6r9FVL4cwz10Okm1Q5Xj/YZRBcIYF8D8F6XSS+01SRg@lists.linux.dev
X-Gm-Message-State: AOJu0Yzf9vU4tJSIk1/tdR0NjKX10xnn04vNWg8mf/rpJ/FecOgPj88c
	AZEsUhALfOhJBQDSv8xLi9qWXBwSgFJHprXaf2ffPfFh11TevjF5saVvDuEnWE7fEGrRf6FwL2m
	RZkoXKpjnQH24TnTZ8XUyuFFUyL5M3dk=
X-Gm-Gg: Acq92OGQ+iKIt0hfWmUQzPVkBao2aQV615RGXVw1ZxyOmghxClRiyR+AXy0hcWcYD7E
	MeBI5+Scian48XXchRT5ouIyOu/O4oLLuZIQV21wVc4amGSuzb0MTMPeO7JLP8a/2HKc0wGR8cb
	4sj34hF0Jbp7vd1iHBI0EMsbCX2LeA73EEzmoOc2Kq9+Qs0fp/KAEAAYplxpBPh4+dKw9E8ydpz
	+r17ekrsDPF0Ps/5L1vNo+oqdlnZCeUBBObtFWCLygJOnOP4zjOGNjvqLcy2wkOnLZeSwPCVymy
	xAZj2urGvsKVLzv0okOwFncM5G/xTlKENPrmRSnEGA==
X-Received: by 2002:a05:6512:1093:b0:5a8:918d:5925 with SMTP id
 2adb3069b0e04-5a8918d5ddfmr5405295e87.26.1778404935666; Sun, 10 May 2026
 02:22:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260510081041.85880-1-dennylin0707@gmail.com> <agBH9QqHW-cJN0iQ@ashevche-desk.local>
In-Reply-To: <agBH9QqHW-cJN0iQ@ashevche-desk.local>
From: Denny Lin <dennylin0707@gmail.com>
Date: Sun, 10 May 2026 02:22:02 -0700
X-Gm-Features: AVHnY4IBY-wtNtpdEn-Etp9fDvwplpcUOdSf20wINDew5vGSv0M8n-zlGaTe8pE
Message-ID: <CAGEkeHf_wueMkwqQmQ0m2drXQ_m9UsvcFwqu5RVvg0WsjAJW1w@mail.gmail.com>
Subject: Re: [PATCH v2] staging: iio: addac: adt7316: document SPI interface
 switching sequence
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: jic23@kernel.org, lars@metafoo.de, Michael.Hennerich@analog.com, 
	gregkh@linuxfoundation.org, dlechner@baylibre.com, nuno.sa@analog.com, 
	andy@kernel.org, linux-iio@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> This is still odd. Please, put in a format
>
> $SNUM "$STITLE"
>
> where $SNUM is the section number (like 2.1.4) and "$STITLE" as currently done
> in this version, Ideally the datasheet also needs a versioning.

The ADT7316 datasheet does not seem to provide explicit section
numbering for the "Serial Interface Selection" section, only the
section title.

Would it be acceptable to reference it using just the section
title, or would you prefer using the page number instead?

Thanks,
Hungyu
