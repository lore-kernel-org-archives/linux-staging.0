Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 604B02DB79F
	for <linux-staging@lists.linux.dev>; Tue,  3 Mar 2026 07:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772521347; cv=none; b=VS3xy3bzgv+UFkgeZUFfxdHsp5OhXySnKcXIxB+j96LXBABC+9NB9dNh5290p+HB1Md3UaMTmwDJI0rwiZdeateto3PINMKljBaLM7WXbhYAyjTGywhgDurxuKi72Z2OpuVXBMGuHsV/fikSS33k7FpYfjCbotsu2/BrcpjEkbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772521347; c=relaxed/simple;
	bh=zXWwEcF1v33xG1KMy07wLyyPGmeN87goQXiWtzMkLOg=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=VGKhNWmQl0DbBrml9i0WtlRE0tlG9EFosURY33MejgZB/cQ4stB1xCrcPKDn8zp5XOcJOgk1GiWTfcFiRyUbMP86T4HhMfItYs4k28ZHpbvajK6S/SoMLwEqGpoVk/Ajhg+ZL8YDyYsejV/c+jfxMZEyVKEecYxv4UwXEbgfh1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iVVbwdZD; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iVVbwdZD"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-439b9b190easo1039433f8f.2
        for <linux-staging@lists.linux.dev>; Mon, 02 Mar 2026 23:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772521345; x=1773126145; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zXWwEcF1v33xG1KMy07wLyyPGmeN87goQXiWtzMkLOg=;
        b=iVVbwdZDOE7D9XRH3M1O0NaM1dL0me40QCKAbvi9Z/LW7gQGyL7DSpcW/altNGaKE/
         EH+hUAbaxmQE0l73hWLN02BY7rjgQOg5xuU/Jw5meX76f+DInS72SnJGBB+iqFaN/kpl
         ZjJGi123HlKEcR3/RAPedd7meU9OoVW1cXr7u5S7vjrmyVMRVhOfCP+fdgB3Yu1LWp+r
         It65uwSuEewee1OtFB3muQ8BT8Aq0HeuwFNiUM0F4sr+IJgv3U24QIxDV8ZgU152hpPX
         Su9TxSACWK3t5QqCM5yLg4LHQgk4TtEh9gv+QbMlCAdjz4OcX1VAo7hwqgfyg/2OawA5
         iQTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772521345; x=1773126145;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zXWwEcF1v33xG1KMy07wLyyPGmeN87goQXiWtzMkLOg=;
        b=IBtBmltkiQceIeZvt3B5ldb0aMYt3dwhcFwIQzDBET9/QlaURI+UJ6dQd5z02llmtV
         VbMOETBE1H1nQaoVuW50DAB7bckGikcwLzIg+Qq1bvwOjBCcba4Bc6B9TfPHYvpWRjzr
         OIy61U0KtLFxNuCm3xnJTS7t2jF+EPYl/ol67Dc8Vuo9A+bNe97y2oMkHFi5SfawKQPx
         lgt+ho0x0dn4CVuiOVUWL5UW9OvFjX9dftEH/J7HBRreqi6Nm46VVdszicL+yNQduED5
         zNTmE+KTMzrLIo8JPihFh+di/s3zJxIv3aUmiFnj8RI3GAAAs1dZ9luZ3UwdTDqPtoC9
         wx+A==
X-Forwarded-Encrypted: i=1; AJvYcCV37eBWQ4gijCynJGlZvTZL7MV0fB8R/LfpgXjRz1su0s4G8D0s2zXun06xudSRPNv4F1d2jicvyO2WtITz@lists.linux.dev
X-Gm-Message-State: AOJu0Yxefv0J5+dBxprZMaHgsYYh14HZQ2X0DIPvnLSc3w807SFIwOw0
	UPUfDv1dYFNGb3ueiird0+FaBcMQ1WRXqdXznCkokcgCxraM71FoWa9a
X-Gm-Gg: ATEYQzyecjBohUrcCnfLfsBs6rd71QINnucpEJEPbBm4Cn5tV/lNEd+2drStTDVJSvv
	2U+Ij1RYvLWUeoVdSDX/cya2SX0KC9sjK76uWVhqN3GSAoCG/2RZ13Rc6aP5Q5BZF0m5XTFXoBC
	TDShmuso5i/rLwSjYwtlIpUIsbfYL65QCKxZLC9ikwHCFDiL8aPJHOqQVz/+kQMsDMnSirRRZkR
	dlvOQptVrPukDVaZNMYVe0RD29OQ83JfWKDX2DA0/K5X2tJsNCVHWwDCh4KgjJIeLb4j7FRPfiy
	60HKTHyADi9ErJHoCdi2RdJCpHM/Nu7n8Z+taBxLr3OcCK9VV0Ij6KZpUyPs7Rf2B6SIcbFyyxj
	fj/Av2oNVsZae9jz2lD+qTpXvq679GeqnCddwKezgptkwweDZ3habjPabDO14YKk/zx4Eiryr6s
	kiWwgX5dP4yPftX6c74QtjGfPFW/g=
X-Received: by 2002:a5d:5f93:0:b0:439:be4b:6874 with SMTP id ffacd0b85a97d-439be4b6937mr5611994f8f.49.1772521344477;
        Mon, 02 Mar 2026 23:02:24 -0800 (PST)
Received: from [127.0.0.1] ([86.1.69.5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b130abfasm17500405f8f.34.2026.03.02.23.02.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 23:02:24 -0800 (PST)
Date: Tue, 3 Mar 2026 07:02:19 +0000
From: Josh Law <hlcj1234567@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ovidiu Panait <ovidiu.panait.oss@gmail.com>,
	Gabriel Shahrouzi <gshahrouzi@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Josh Law <objecting@objecting.org>
Message-ID: <239a788f-7ed4-4bd2-8ad7-8d0783bcdaf1@gmail.com>
In-Reply-To: <aaZ7QfW7cFAJ4m0R@stanley.mountain>
References: <20260301214815.2628942-1-objecting@objecting.org> <20260301214815.2628942-5-objecting@objecting.org> <aaVEsCIacXl-kuxa@stanley.mountain> <f8772114-a495-409b-a590-a9b1d8ed1d41@gmail.com> <aaZ7QfW7cFAJ4m0R@stanley.mountain>
Subject: Re: [PATCH v2 05/10] staging: axis-fifo: improve IRQ handler
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Correlation-ID: <239a788f-7ed4-4bd2-8ad7-8d0783bcdaf1@gmail.com>

3 Mar 2026 06:10:13 Dan Carpenter <dan.carpenter@linaro.org>:

> On Mon, Mar 02, 2026 at 03:55:36PM +0000, Josh Law wrote:
>> 2 Mar 2026 08:14:53 Dan Carpenter <dan.carpenter@linaro.org>:
>>
>>> On Sun, Mar 01, 2026 at 09:48:10PM +0000, Josh Law wrote:
>>>> From: Josh Law <objecting@objecting.org>
>>>>
>>>> Return IRQ_NONE when no interrupts were triggered to avoid spurious
>>>> interrupt storms, and only clear the active interrupts instead of
>>>> blindly clearing all interrupts by writing 'intr' to the ISR instead o=
f
>>>> XLLF_INT_CLEAR_ALL.
>>>>
>>>
>>> Is this something you actually experienced in real life?=C2=A0 The comm=
it
>>> message needs to be clearer about that.
>>>
>>> regards,
>>> dan carpenter
>>
>> Hello Dan, It's just code optimizations, making it cleaner, etc, I
>> also ran all of these latest V2 commits through check patch, to make
>> sure they are compliant, I own this device so I hope I can be the
>> maintainer of it one day, I'm learning this Linux system day by day,
>> so I am sorry I have to annoy a professional linaro dev like you haha
>>
>
> I don't mind reviewing patches.=C2=A0 The cleanups are easy to review.=C2=
=A0 In
> this case it's a behavior change and so I would want a clearer picture
> the motivation and of how well these have been tested for that.
>
> regards,
> dan carpenter

Lol, are you gonna approve ANY of my patches haha

V/R
