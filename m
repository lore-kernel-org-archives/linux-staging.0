Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5011478F3A
	for <linux-staging@lists.linux.dev>; Mon, 28 Apr 2025 05:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745818562; cv=none; b=l7DKDcVKrMZZl7ldRzyU2iKXjJLrtcqW27Ygm+ZVYk0AQPUUv4ZylPRLRm3C406pRUQmmhNF4ll+STu4ZBn0rFiXarF1DHzj0MH7xl2QuTx8SIa6TcVJzMcOqgDqCajp3sNCw1kPuTjmImnm9qNJAPkva1A/Ktle22rF1N+eOLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745818562; c=relaxed/simple;
	bh=r5SnptIAVywpfucvTbP/7W4oUyHQ5FhX7Q7NJyeaIek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j8B/GPMadFAMoJzStm72+wvCdENu5DZP54wiHr/Fd6+CbWZBoDQ+PrkgSP+jALrUaITx0PMXjHx8MMwqaKjMgjrM81plrNW7dCc0wWv3PiH52ASgaSZ+O+Lp14wKmJb6IWurxGt/ckCIZ7a0hL5hzL+R2i/0ggwq3tGMlyAE1T0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rTGomWek; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rTGomWek"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43cf848528aso30759675e9.2
        for <linux-staging@lists.linux.dev>; Sun, 27 Apr 2025 22:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745818558; x=1746423358; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jRhSTAhIhJUxG2IYSr9xqa5KsMX7Idz8w3xmMGK2klo=;
        b=rTGomWekVTBdS0yOUDJ1JnNUhKsUPwINQbBUNeNDIIyqkgr+lIbDfAVvS3YWHZ9JLC
         oZro5ugwpz6hhoxdRJ0zoDx82hE3MeLEGbMo7mf4nzcdLMw++vVcKBhuriHWeyFP3jNE
         1iME2ZXd+kdiw0rmcWeKMg/K1Wo5KVpzQJfq/5w0kQd9tjs6xYjai5gxc4gWe1XxBh5a
         R8chhNVXB7l+rpRRv87tXYPOkyxtzhQYu2N93qsnhdg2J43oOWpW/sikHKw/38PjhAI2
         w4z9wHpZmP4UdYu5drs3VZ3W6Fjc4EqbMVYx71NQO96Cd36UM9GGdCQqqsCPGBEWdtAP
         YLoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745818558; x=1746423358;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jRhSTAhIhJUxG2IYSr9xqa5KsMX7Idz8w3xmMGK2klo=;
        b=kpzIyPb2zU6/DxRMlgPlVBUDtFatQ0K5OiMzAhDsQ5C/NHebD7ttiibtElykfxHV5z
         mHXrecxbSCbG1qXHL5FwKcq5ayrkekl6EQLiToyi6gctcepdnWAxFh+9RP1+bfoIqJIR
         vICT3RNCNpkjgE8U0ZDDCNV7G8jQv8hNLbeFd5AnpzjhYoELhwZtX2f1pSvwpW4EgK/I
         N4siw3efr5PhYhCuXKdXEIWVtsmsgXGZkLDYPAoe/ALbAzKuRtUKa/yn8yIz5m7QX2Qq
         oXmlBJxG7dkE7jmf0SXOOF3aYQCUTdGpf9Y4olJkZO97c0V3GHrlgJUPyCVsvZgLxtYz
         ffBg==
X-Forwarded-Encrypted: i=1; AJvYcCUEc4ge+FQm0vzZwfb3wRhK2Da1hYA/pTByAPuUESwfXrCey2akMFvBvOFkr22CRAtFF3DsC1Tw3pKmRLei@lists.linux.dev
X-Gm-Message-State: AOJu0Yzsn0oTpQHUt1QPnbADtjNA3wKGpUkMpftEfQazmVufuUya25XG
	P9S8dejwBoH7HaBxopIlV5cqHJB+SCzU6gO2qriTUAknS/mKPOI/Y8Zq5jOfHio=
X-Gm-Gg: ASbGncvpnEGUL54Gj4jnBRNUD3vt7STsZg0tf7ySW4TdDzJD4RnwPQNKdXewTBikPbY
	s4nP4Y0C1yXzKxMiCA0UP1yG4gch1s7Efp4QLskr3L9Sh4ausziv2qSIrrGMkeEzCyEwTo0Ag2W
	ZhHXaNFc3CWdUt9D2SiTHSokbfJ6vDiRarL2FMZdLHttL683yTDySGLf1aZdBnPPyHuB1MDuFH9
	H+CyljxDoAjFNKwPV6h9jDf7Hn0tbcM94tFZqZIPB175KL+nxyuoV97z5a1Ip0f0lLFjJUvU+Cb
	maCtL3oLqgMQcr3U5Om6CdmraVb77rZaynpz4Lq0S8fwJlp5CIG3Bbic
X-Google-Smtp-Source: AGHT+IF1k216EZNsBGTmdju6CAJoZ+K+NFTttBSZJ8/wDMK8c9nqKANzs8CN4pL4YN+3Yqzmvv+weg==
X-Received: by 2002:a05:600c:3d87:b0:43d:745a:5a50 with SMTP id 5b1f17b1804b1-440aa428c9cmr59743105e9.19.1745818557711;
        Sun, 27 Apr 2025 22:35:57 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-440a5310ad2sm111378905e9.21.2025.04.27.22.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 22:35:57 -0700 (PDT)
Date: Mon, 28 Apr 2025 08:35:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dave Penkler <dpenkler@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3 V2] staging: gpib: Avoid unused variable warning
Message-ID: <74272412-93e3-41df-be70-93df01c5c653@stanley.mountain>
References: <20250427091902.16301-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250427091902.16301-1-dpenkler@gmail.com>

On Sun, Apr 27, 2025 at 11:19:02AM +0200, Dave Penkler wrote:
> This addresses a warning produced by make W=1 with the configuration
> parameter CONFIG_GPIB_PCMCIA=y
> 
> ines/ines_gpib.c:1115:28: warning: variable 'dev' set but not used [-Wunused-but-set-variable]
> 
> Remove the declaration and assignment of the unused variable.
> 
> Signed-off-by: Dave Penkler <dpenkler@gmail.com>
> ---
> V1 -> V2
>   Remove the setting of the unused variable and say so in
>   the commit message

You'll need to resend the whole patchset.

regards,
dan carpenter


