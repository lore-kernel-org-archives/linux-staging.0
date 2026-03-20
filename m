Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86214371893
	for <linux-staging@lists.linux.dev>; Fri, 20 Mar 2026 08:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773995358; cv=none; b=ZBfTlItmBYBhPhbqGUcBkd8g2AFxKJBHFq6NXfAWArFNcJIUS4g42+8MFJd3gonFoG/6HYga4HBJK4KMcyWLcygspFYtnc6lt83q4+B56u61jNzJP9opPQsA7VlZpo9ShBBlDY41wCsFkSUtiUzRbkrtQGAhtzRhI7NxkVmIKTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773995358; c=relaxed/simple;
	bh=SEx4lyvi/eOHrpVqLdiKesdACMhBb/GHogPdO6mnEds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FBmk6osUvk0o990I2gIOCLQ3ABv4juy+DDrOs1EuVLV2DdLzGxny1lIzorx/m95ZWgQGdkRKuGYJgZUdQre5BGA9hKf8Gr0vCi6BolGx6yXe5jfBq2t0RBVw2MTn5eYJrZtW7bIOCf+8CU5V043T4RYpgPIznKErUryitQxGi8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=faVRv7Lt; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="faVRv7Lt"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48628ce9ab5so4036755e9.2
        for <linux-staging@lists.linux.dev>; Fri, 20 Mar 2026 01:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773995354; x=1774600154; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U9yuP5I9+Z4GLNb1XV6GtNUUDpta/L1s+WH94C7rXg8=;
        b=faVRv7LtCiPC6mGshCK3oohF/7w2B4egsGQjdCba5C2ifoZNopYSisZmnWJcQO3aUi
         8tk2VmwzzAOh/rF0RiBa6R8t3bigqY8833ufm2tpcmEBxnBAG9S1npLEG9lR28S/DsyU
         oIKiTEEG1FBi1fcATDZEFf+wnOMM76Fv2SWrWHxTpq33dGSSbGVAKrthI89XHws/lByi
         5j/dHNCLDfirmViuh/Ta0UzVTp0ac4jwKxMPYFczDnQ5XdXafcUowitRGDuG2f+equeZ
         vHqlaGaMwxSKurM9w+zcCkcaDka1IpKw3i3s4HFyv3+god8iJv0XXtdixmZYQStB3dNL
         xkrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773995354; x=1774600154;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U9yuP5I9+Z4GLNb1XV6GtNUUDpta/L1s+WH94C7rXg8=;
        b=hvLUkcEgXHxs/FHY/32dphCaYDo1sIZAnDz5vjIDowIP+7d6zL6DvsegbFnc++FHz1
         OFz9HYUeKi4vXnCryRuxKv1Pcsg3wP8VZLDPOk5kW5rCsFeBe4eQIHwokQ4rvr0YmwmX
         ZHv62kAy31H1lv9gOa0bNZFbUgVWgL+lg+t9iGGLv9K36jsgoGgUJRDvvGf92kJqJVQy
         g91cPfoKyfzWU4wzn7RzOqY7NRiFrdJ4TuxqiKz1xIFxwBTLTpTeDG33E5p4sK+i3bsj
         9F22kvwYjeXRSF0gAM+Ea/FtwWwddQZNJYDPf+b2LwJsuVwQpyiPYhKZtcOx855vj9ZP
         +4yA==
X-Forwarded-Encrypted: i=1; AJvYcCXSfrzwwbh7LPSdTkk2X+AmfNdHWjesuZ/9IiYk5uAXOwPLIv9PffzX/NaDIiW567BGj2hqX4RkxWwiWBoH@lists.linux.dev
X-Gm-Message-State: AOJu0YwPGTySLzB6JAzgX9dYdxV+ZH3ceylPD149+xUk7HNz8H7q7re4
	lRB50kniBfW3cWUGKAuMSG3bfbTDlmkIkMZqyqft6aNyoyL2HKWGrFLLwqQ11xqs/Jk=
X-Gm-Gg: ATEYQzxsagEI0IKUP2eUAlPwud5PhFEIKbBLxegTUUyAuWGVK9xs3bnnKTjYXuf+weX
	U+AnnhRzK166x6vHPKebKot07nNnbh3yqMLHP9DJAyZ8PqQqU2U7nG9vZuDbwjz3mU5LJrEry2z
	SB2yjZqaqFVBHpgWHrWabme7MXhpPnit17z0K2AR8XIl6aDeHXKf0zJtp3AXeLxOv3UamRuHano
	qQZHQEDni6hQP1tPhx1Qa/e0dce5tzzbco3Z4l7Gtak9rw7AKw2uQsk2Wo/ojTJEXNY8wHaO7Vv
	/MVI97NDDWtgdbibon1APiYGfCKebPHQX534lfsLoyRmWLBdEsqnousCHZPuB2ZkD9Mmuc5BLOp
	0i25wC0apgar0bGbpIlp4MMVeTiaI+kw3W/dfXMUyFFYiRYPXopagoznfxiunjerRs6S0NRyzyL
	p7JZ8CNh0xrWI0DS6ltBpjtp7TvlWz
X-Received: by 2002:a05:600c:8119:b0:485:54cc:2e7c with SMTP id 5b1f17b1804b1-486ff034137mr25205295e9.24.1773995353693;
        Fri, 20 Mar 2026 01:29:13 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64703343sm4243982f8f.19.2026.03.20.01.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 01:29:13 -0700 (PDT)
Date: Fri, 20 Mar 2026 11:29:10 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Lin YuChen <starpt.official@gmail.com>
Cc: gregkh@linuxfoundation.org, straube.linux@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: initialize le_tmp64 in
 rtw_BIP_verify()
Message-ID: <ab0FVmaHo2N_mRXa@stanley.mountain>
References: <20260319170312.71408-1-starpt.official@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260319170312.71408-1-starpt.official@gmail.com>

On Fri, Mar 20, 2026 at 01:03:12AM +0800, Lin YuChen wrote:
> Initialize le_tmp64 to zero in rtw_BIP_verify() to prevent using
> uninitialized data.
> 
> Smatch warns that only 6 bytes are copied to this 8-byte (u64)
> variable, leaving the last two bytes uninitialized:
> 
> drivers/staging/rtl8723bs/core/rtw_security.c:1308 rtw_BIP_verify()
> warn: not copying enough bytes for '&le_tmp64' (8 vs 6 bytes)
> 
> Initializing the variable at the start of the function fixes this
> warning and ensures predictable behavior.
> 
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/linux-staging/abvwIQh0CHTp4wNJ@stanley.mountain/
> Signed-off-by: Lin YuChen <starpt.official@gmail.com>
> ---

Add a Fixes tag?  Otherwise, it looks good.

regards,
dan carpenter

