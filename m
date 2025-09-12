Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8456C2D47F2
	for <linux-staging@lists.linux.dev>; Fri, 12 Sep 2025 08:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757665612; cv=none; b=X6OfN+wEGYipp2NO5rfHJfpxNqbVfDKgXp+9//3/VTFenOSqcRjdI7/cMPxUOewMtlECDVCEu2uHIogkhsR/iLRYU7rHb1RIriOJeO0jOaGocf79Ml7/0VEhH7Ko+LqK7K0cdwUfhBwtHwlzW1BVSm2k+j1HAnafdpiCpNkQ8bI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757665612; c=relaxed/simple;
	bh=RWd3nD6IlVsTPiAyoMEgevjM2cyQPqlGMG47UCwaudY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Afnb0/XE8BB/2M6S+aTICcIVO8IIvX9nhV1vW7pt60/Jn67yYRppGQntuPp6fGpINeFjCAP/JvtPiu0hi8pw9gGtliGr5XZveNwdPpjrqRoKD2PbZxO9gUEbnlkvVW53yYclifsp1e7F/FmkfnlcIKufuutopdcqT/Oi7feesqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UXVaOimt; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UXVaOimt"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45dcfecdc0fso15800505e9.1
        for <linux-staging@lists.linux.dev>; Fri, 12 Sep 2025 01:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757665609; x=1758270409; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EyiUzp1OmILWl0JeAa0ePX/K+fXA2HLh+NIs2I/6z+0=;
        b=UXVaOimt2fYp7gLblY8pTLSPKZcf6HTW/S/UB7yzS8r4RW3VRFXPCYEc3h9u1TAvmt
         HGhPkbP36dATvEQzeK9qTQZ1/0xapohnBVg34LzDsgkoXWcgfa10voHG27Aznk+oAVaK
         uJOV1Ojpmi/fQvXxcQbzP9BE1q6SgmJNIxOq8igJRfbZdZzcB7d5xfifYcBEI/V7fNRu
         CqoR1pu+T6rCyqXl8tTMd/6xXZFDNd83KQiKq4igxvfjy8pyzNc1bNZ00/Lrl9blonjz
         zWmx6nT6Y6h4jtT5rT4nB4rCxAyUysVrqbLtXPalNzvNy98a7kk8meAwO2RUo1dah6qF
         wwrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757665609; x=1758270409;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EyiUzp1OmILWl0JeAa0ePX/K+fXA2HLh+NIs2I/6z+0=;
        b=l8JGb78ZpItXQI9UYYm7YHLFcK5nNlrdvcaEzH4KMkNoR4RaDcWl3nDPkw4EoN8zq0
         atJj7/3LCzry6ZtzGnzUpA4lbsbOyAElGo/rRcuir7hvKlpBgwidjbKOdtsE0MPSiwfe
         omtrki1SAnLKaCsdR6WygpmcJNw3nrgXpdfd9dxUVwf6jpz5UCehhoVLUga5Yfehdt7+
         mmBQI7TNTymCXCNEnrc1/QW+DIj72gHlUdG1DaRdarhNhNDohv7mnQrtMnLEPbnMn6qD
         zUMFNvGB6jU7182E7A0/Xl5oQtt+ygNjBEoB1K579kVIBFPfYLvp/19LtQ3H/WFXTdcE
         y4RQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqTBN4K2Yy7D0nzORjdZyX4NIhdHmELyPH+KO/VpiOeWLGBZs0ZgJ+7Kv5W+JkHc997dSgbAYPe5k4A/KO@lists.linux.dev
X-Gm-Message-State: AOJu0YyjQ2C7WN350T84DD4ZgWD+VDuYXrEwvgWccHRM6eqh9hPbB0SZ
	RTV/Vwyz8MCnE+wum4Di2S6LK8ABRUX3wtL2yNpSgyis2oV58mnivpXAEg+42nkpaZjKPxldotr
	+wgiD
X-Gm-Gg: ASbGncscp/i2OhZwZMC5TeLqApEPlG4CqAShJIEAk66p5unsS9vrqw+ZuInNmLsLeDq
	j5xg+ZgZMBhqt8WJj829T13J6WKEplPXrE/RWDGjPRT9I3jqjBTpbpbek45yMnLP1ZNQw9i+x+H
	Hy8EzLfp6N0cmLVn3f++/LaVZLjRcPeLpshdzKunyRjsLnNHpOPxCb7WUt3suraqLOg04V14dgM
	r3zl0x1WMCavNMgf4EvgEPZ+Czh0vou7cidWXZ+SQnN0HYNQCj2l4oq6hK6dMLB1Hq1DF59D7fV
	GriOqE9ewQAyx6Stxl40dFdAItiR8oCQ79rSuqQGcPRFsxuNYrWoYfIR2EOCUk0S4t8mTjOxiOl
	xZ+x5ikJQ6td4ajYEXOqmQNqgCEw=
X-Google-Smtp-Source: AGHT+IGrF5vNadKXMANIOo7pbMCDAPw95Sm2Mv8SUuKbdQleRVw3/g3veQG79ZZmUxPjs879nJczEg==
X-Received: by 2002:a05:600c:1c96:b0:45b:4282:7b60 with SMTP id 5b1f17b1804b1-45f211fb7c4mr18570905e9.34.1757665608854;
        Fri, 12 Sep 2025 01:26:48 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45e037186e5sm53450965e9.5.2025.09.12.01.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 01:26:48 -0700 (PDT)
Date: Fri, 12 Sep 2025 11:26:45 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Akiyoshi Kurita <weibu@redadmin.org>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] staging: rtl8723bs: fix typo in comment
Message-ID: <aMPZRUm9vHWQ0_pe@stanley.mountain>
References: <2025091223-dispatch-angriness-7516@gregkh>
 <20250912064406.707039-1-weibu@redadmin.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250912064406.707039-1-weibu@redadmin.org>

On Fri, Sep 12, 2025 at 03:44:06PM +0900, Akiyoshi Kurita wrote:
> Fix a misspelling in a header comment: "configurtions" -> "configurations".
> 
> Signed-off-by: Akiyoshi Kurita <weibu@redadmin.org>
> ---
> v4:
>   - Correct reversed diff.
>   - Drop "No functional change." per review.
> 

There you go.  :)

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

