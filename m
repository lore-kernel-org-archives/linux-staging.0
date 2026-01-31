Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC4534E765
	for <linux-staging@lists.linux.dev>; Sat, 31 Jan 2026 17:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769881410; cv=none; b=Vb789/DMOl6aE/SB4pzUhu9SAJPl7ecWqpRh+WXwbYB3lb4RykOuEunlnjTZkGW9oFO4Tt7/5XowXI8cs8aG3FUbuND+ET/dIQfVjsYnurUorsCD6KTfKUf6NLqi0Wtk3Er0Cd5+MbrmoNhoyUJUrxzFhJE84uLeMgbCvwcGnT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769881410; c=relaxed/simple;
	bh=Qp9lgbzeMmzKFpd5d0jfBjWBed4dwzjiTimRX3bZUzI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EZoebAJQFBmuZXlz3znhhM+IU5+JLyUHEuA5hV2+MfO7FCKgWshEYCTnTEhBG5qrmmEOoLQ9PjvwOfMcrtK8cV5FrXOEROw7bCE8CkA5WwA14a9FRweDM2qM0mafjODKjqOz0UtfAvvx7J9p+9oT1Xl1fHWGb2BO1MFNhM9a9OM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SKBDWpMk; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SKBDWpMk"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43596062728so2658454f8f.1
        for <linux-staging@lists.linux.dev>; Sat, 31 Jan 2026 09:43:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769881404; x=1770486204; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ySdU5sZVl8Msg4gjFZMswcE7SEwSdq5wkdQqJ+Wvrrc=;
        b=SKBDWpMkz4BQotGVW90d90DTe1cGj4uv6TfzYIuStjPOVVu+fCVwdWnbs60az4XBw1
         9a4gkVUGQwa27pKUM71nCqwBsksQfsKfTWBiMtoRloJx2GxjNaoE9vOBAr3LwR53KwdC
         yledygCCnobo11CKXIehOojjlPl582mPOMOtS9oc21PF88wyKe4VKsl+V2uiYJ6Isk6R
         u1Yt4PKK7BbnR1GOtTNTuu/Wg3/17u1B/lscQ6UsdBiGWO8DrhBLKgvFfw1+PAFNsngX
         /LeGP5jI4LXCi4d0gnL3K/5AFcuc4cXyZi0T+FhT/EB+Pl09iq0CapIgvNvqtRNpUZ0c
         WOqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769881404; x=1770486204;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ySdU5sZVl8Msg4gjFZMswcE7SEwSdq5wkdQqJ+Wvrrc=;
        b=uAaBFGAPGBAjK9hDhdCP+vFghaZfbtxK5a6v46208gNaH4OftWNvI1tcq5WHPqbAw2
         yeBIFDqvz7oz7JXEtzsOBA3ETQyEP8yeUp6vNwesTfCTsW7DAYrDLQof+s9/DltmlMeV
         0WLZ0266CzsCPLTszCpSyHevVLJJxrYC7Z/wtwosF6Xz6L1aAMwzxKphV098oyPTJp2s
         7gM8c2ZTU7cnbZw5VIEzeU+f7anG5QKj9vGNIkh8apfcFQHFpnPhIftGlzWCzJkfCkeq
         yBQNB5D6nIaVqGIRLoWwPD03dnwHUWE93muaTYdp1/mumJ2L+rp3k2CQxVdy0PY82ptb
         bJ+g==
X-Forwarded-Encrypted: i=1; AJvYcCV9UrGmFMN9T+gtNLfPxuT/KHDxzkH9NCnEMPEZcu1i1V2qKoAy7aOAb27UhvzU/gdnXqPYjOhwo5X6PI6+@lists.linux.dev
X-Gm-Message-State: AOJu0YxtwLO6Qv3oHu1vs6A1TMmE+mkKR42W8mr6fh7rUitlxUTiRILW
	vNDwe9w7uZO86KADu3z37QwcJ5bEVeNFmu6A9TM2zYltGYsUsxs+zBhrmOrwQTcDufM=
X-Gm-Gg: AZuq6aLuq3L2bAoR5cnRJRKoyTP1ytW/e2aUjy32o29JUUMwaad129T4olHTxY5WCF1
	e/IkTT6XM1/NliX9/2QQ44fWMatjDsRZIsh6PP3/Cnj/Be/hiL5EsMIGZ7RJ48MBSGQrv6yKWDU
	S3Qex6kgkMarMMeiJQETl0VjtQOvxvgs0gdeWhKSncsrXRgqksHLpTJKulA4q9nZOiZM96z6EbE
	aQCpFYIv+OFkoxJ6p8lkBPnoIPCLJrhj7ZYq4GxA9OsKKWRy9A/XoxyshndCAvZ6JuFv5Omd3H7
	gRJJOm9tmI1Q1k0YC66WwrxDx/oogzjsG48Zy/C17+tNuJ07TugqqxIzSnk9w+KrQM43+XTI3w7
	bwjw5Nj5iVMkeqImmBMwGTLff5JX+1LMn+fxJMfdxh4aEDYGtAvmgCnG+P53vf9gVsohomQcqNb
	oblFWXLkLtAy2JB4Zi5hNSgqy8sSg=
X-Received: by 2002:a05:6000:288e:b0:435:953e:5897 with SMTP id ffacd0b85a97d-435ea2104a8mr14803605f8f.25.1769881404249;
        Sat, 31 Jan 2026 09:43:24 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e132356dsm32969294f8f.33.2026.01.31.09.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jan 2026 09:43:23 -0800 (PST)
Date: Sat, 31 Jan 2026 20:43:20 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Minu Jin <s9430939@naver.com>
Cc: gregkh@linuxfoundation.org, bqn9090@gmail.com,
	abrahamadekunle50@gmail.com, straube.linux@gmail.com,
	bryant.boatright@proton.me, davidzalman.101@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] staging: rtl8723bs: fix potential race in
 expire_timeout_chk
Message-ID: <aX4_OGOZ3OZqN_PF@stanley.mountain>
References: <20260131171153.3729458-1-s9430939@naver.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260131171153.3729458-1-s9430939@naver.com>

On Sun, Feb 01, 2026 at 02:11:53AM +0900, Minu Jin wrote:
> The expire_timeout_chk function currently do lock and unlock inside the
> loop before calling rtw_free_stainfo().
> 
> This can be risky as the list might be changed
> when the lock is briefly released.
> 
> To fix this, move expired sta_info entries into a local free_list while
> holding the lock, and then perform the actual freeing after the lock is
> released.
> 
> Signed-off-by: Minu Jin <s9430939@naver.com>
> Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
> Changes in v4:
>     - Add Reviewed-by tag from Dan Carpenter

No, you don't need to do that.  Greg's scripts adds the tags.  Only add
tags if you need to send another version for a different reason.

Not a big deal, but now you know for next time.

regards,
dan carpenter

