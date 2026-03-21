Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889BD23ED6A
	for <linux-staging@lists.linux.dev>; Sat, 21 Mar 2026 07:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774079341; cv=none; b=ZH9NVvNellqybLBH75hsyUH1dqzORaElPjfnRTis65NOeMQnv/39aA5ckGuHuLZKOxoMftYAjNyFojRneW0L0h8MI5SF/tHyzuSeIbrR/TsEqwb/FAFGyedK9RH8CfMmnAPPGHj1+VDtsFfbRtor3149s4uShE30ODHqs71GPh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774079341; c=relaxed/simple;
	bh=BxDWW2LjJoKTs4lYmbValHKuQvjsGTWftMpDcB7UMy0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LKWQDoFey/verNdi2RaOeOgZCxg296R4lDOpFwmO2/WCHVh1IumyDHAMfa55ZI3WT2ayQanohsnP8OqizPN8rKH+3cHXIwaMRTM+AEdeNEglP54PWMQpKtomxnYBjFRJ5KQ4TYF1Ov2Jj3LFabXSTZAVFGkt76+CfnAU9VFiuoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iVlolzyH; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iVlolzyH"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4853c1ca73aso23550315e9.2
        for <linux-staging@lists.linux.dev>; Sat, 21 Mar 2026 00:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774079339; x=1774684139; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Fo8jQCnWVOp5Mp7yfQ+5Hl/xgbWT4Hf5m1bOCKXA/8g=;
        b=iVlolzyHpJ/Ui76EQfQCsvjAQavhrLYuxhwG5YOw+K8dkfUZO9NGFaCBIkgwPOd0Qy
         S9XAJskaYAB2UY/ysBcWn3eEQNRMArF8AnLpWcDCvw443+NtISVwc3kw2nk4lYmbuxxR
         qjOZXVaQqy9KjN/IY44aE7wjly3VzQnsW5OYTZ5zjDWCXceTnhSTwtEidtYMYWeOQcve
         59LIyPT6RWvXHR0p5AA7W2+WmITMkQrbiDJXPDMB0/hGNSuoryQzPvzG30JjHRY3yo0d
         OdEm/JIFj9bT1wRqzsYrrBcryQya0kFk9dtHO7QC1SSVYk0W0zw/3KUVX5gmSyCOk1Ft
         bZbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774079339; x=1774684139;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fo8jQCnWVOp5Mp7yfQ+5Hl/xgbWT4Hf5m1bOCKXA/8g=;
        b=mbISdPC/OKjdsQL95Xbk/bwlPK4CTMoAIy2N5BKxyw9iZU4McSE6EAO7bcdxCV/U+3
         eUudADbbryoTEzESbCqsvhFVRKkEob777FvZ8EbRnPX8IgVB4PVWRBGvaMzqNQJ/0PX/
         BvNjmfxPFTQJhOiX2z64H07w67pL14mMHyWpA25TXW5QsB0MPwsss1ztbwvGOwOLcKXg
         LTB7ZXqmWwq7fjJtobxCyCk4yLLLex4aJy11fFOEbPKaxZPFYVAKlE+SVD60g5mC+61Z
         evNy2vUyT43q/WE1YmZJGOXOp/2CwPjBEy7dqe/oTXa41j0LYy+klzz7nWu1C5yef8Pu
         YspQ==
X-Gm-Message-State: AOJu0YwC5/2+6Z8vvhF8Xzab7ZpSxJTh9qspjccRLfTOukVKQrBb7EW2
	Jm7shzVwb9YGipJw/lwh6zsgzBfccDtU/2OMH15/WzJXmItcD6t+VTHM6FWAjoenIyY=
X-Gm-Gg: ATEYQzwM20dMoujGSTa6dMJmb/ypjMAO6eSaGj7+zeeeWkj6BrbspA6xahwL4YCrwbh
	rkH8dfYqNowkKAjqx82KrImqlskbgkLbUoXXef8sDkP9/7NQDWbfjKR74ToxRPAHriQKK/U+kaB
	RIYdcf/qq+JoujpGipGrUwtqhinOjxhCqU5jELhUug26aRWxN1lbCoHarB68KdbCJEKJptk+QaJ
	htY9NZIBKusbrQ4ZwkifZ6O2c1ye41AZiK4u5ntdfGeOZR93r0UKKEfJb9FXmeRga1WZvlKurb1
	1COsgpQmGuqSPE7jmsEFM17+oVM3jiLh2dqZYxKbGxx1BDkYlY93uThlxtsbrFdwiIP9RyQ/9KP
	/RXTt+9KsP/HhwDYXsCAC48wVLuG1E8HOvNvkdltInFeLGbMHwhJ+wixdPgq2NK2fp/lDay6/0e
	oA8zf8mrMRmi/XVlMzhLkU77/1mugX
X-Received: by 2002:a05:600c:3495:b0:485:3b00:f939 with SMTP id 5b1f17b1804b1-486fedf6b7amr83708215e9.8.1774079338901;
        Sat, 21 Mar 2026 00:48:58 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe8367d8sm147894975e9.14.2026.03.21.00.48.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 00:48:58 -0700 (PDT)
Date: Sat, 21 Mar 2026 10:48:55 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Cc: linux-staging@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Khushal Chitturi <khushalchitturi@gmail.com>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	Luka Gejak <luka.gejak@linux.dev>,
	Vivek BalachandharTN <vivek.balachandhar@gmail.com>,
	Artur Stupa <arthur.stupa@gmail.com>,
	Zhuoheng Li <lizhuoheng@kylinos.cn>,
	Nino Zhang <ninozhang001@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] staging: rtl8723bs: refactor
 rtw_joinbss_event_prehandle to reduce indentation
Message-ID: <ab5NZ62gfdVe7ItN@stanley.mountain>
References: <20260320154724.603847-1-azpijr@gmail.com>
 <20260320154724.603847-3-azpijr@gmail.com>
 <ab5M6Hvs1_8noick@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ab5M6Hvs1_8noick@stanley.mountain>

On Sat, Mar 21, 2026 at 10:46:48AM +0300, Dan Carpenter wrote:
> KTODO: Fix checkpatch to catch extra void statements
> 
> Checkpatch will catch an unnecessary return statement like this when
> people use the -f option, but why can't it catch it for normal patches?
> Surely, if there is a line which is just "}" then we could just print
> a warning if the previous line is "return;"?
> 
> Test this on commits in the git log to find if there is a non-obvious
> reason why it only works for -f.

(This was not intended for you Jose, I'm trying to create a TODO list
for kernel janitors to work on so I put KTODO in the email so people
looking for things to do can find it on lore).

regards,
dan carpenter

