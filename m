Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB2C5125C0
	for <linux-staging@lists.linux.dev>; Wed, 13 Mar 2024 05:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710308358; cv=none; b=Du/3QmfxFtKL/kAsBCuj/oV5EZAhPjM9ZO5Abt6U6iPIt8GG0jy/5gepXAoXEQMr7NZA+Qhe4UCpEnvjaEPRL916udbG56fUEkuUXRnhAds4K5pdKcUEItN7EXqOZUF3223OqRixKvx9cXB+AxHFn2ld5TfdCdTwlpBHTkE828M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710308358; c=relaxed/simple;
	bh=qv9E0ryVzOnQqUuvfK/MZ3ePXhFc9C6pWJ33POv+pnE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TVPT6rP0L6n3yUrxISE4rDd0wn6ev1bt242BXsD0nc7i+ndEcUkKu71HHD4FOdUO8QGu1pmLXEajGUDWhMmGqkG6OYOC/+etJhFjY9HHxlpR2hVxqVwvFpsDD8lpCQdHYvi1voHbbJd0bMGyfpktvZ+TgQoXUAQa+d7+ovwsBAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=neqdYVRD; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="neqdYVRD"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a36126ee41eso827122866b.2
        for <linux-staging@lists.linux.dev>; Tue, 12 Mar 2024 22:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710308355; x=1710913155; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NSWceIUzISd19ErGqmK4nWkvRpe4eyaho/RKTDtrGmc=;
        b=neqdYVRDEECDNUICuspR1ytBGRrmAnZpEApyc9JpNKBpAJ9CwB69tw/PLI4lvArDAZ
         pqsSGju0tag2hVS6L/7DKvcDKLYgc4MtSQ+dp9DxNUXp3DKXC4B1IXiaC/1Wy4KHKaJh
         +zMBI5MuEG/PF2WVOiv78OOM5Tcs94K6WgOgpOfcLuuooolmOHf7eZWy0Lr4huz6qxJu
         uxEumyiMEwRoUF3h5Loycx0tHeijOvbRDUv1vYnwFC0Bm4Q/SJvWrFluaWLDoAbtaQ21
         josDladaLYGzJFwDeOlask1cwa+8KlMwIsbTrSwf2yST7gQV7/sOtUO6/KJ6FVU6KBbi
         Xe0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710308355; x=1710913155;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NSWceIUzISd19ErGqmK4nWkvRpe4eyaho/RKTDtrGmc=;
        b=uW5+Oyykw7sZolDPO+YWoS2BpXamyaqyRRfNG24xht5hPxlcLnGPuua+PwcSyeas78
         lQMmfigyl//n0WKRf/Lgk+9RDkQVVy2XBTijo/IpFqXQZRFH4jFERd4DSmQr2luu20cF
         JrWMqtV23dHEn9q2MdWCFYYnhsZKNWX04/5f6cj+mPnZ726rKitT0ZsvVNvUR32maOJ3
         eqH7sGAEZhRh1XNAQCq4Hl5WQHNAQUZL/1crihg8/iA+CzZ8EkGMAsXeMpFDpRBt4QV3
         +cuW7GNn0n203mVoGV4t18SQbNxrozwIq9cEiBHqhxCl+eBaeUzqseTlN6Ifl+xYg6z1
         sJ/A==
X-Forwarded-Encrypted: i=1; AJvYcCXFP5WpWJ0YspAEA7RTzEaSvZi1uS581CGk8IXaWXbjVhxUJqAgXI7F5u+slwSIiFdn82s9nuOBDP4alOmjjegBf/4h9m/Q9g2ME8sX5g==
X-Gm-Message-State: AOJu0YxPE3yOEBoxXH7+bJbp97UuDBhIB9faOmErxD03PSpMKxLmX1dj
	llzIuqDEVPXrmbib3pfaX5pea4XtqnNpHP5ln1Rren5UWett61G6GGnpjNE6Iio=
X-Google-Smtp-Source: AGHT+IHIl2MZeMkBVrLJIRHhVpuSEJV9aPJOnnzBZz3010xMAZ4WjFN325JjVYWACAPKVHCN6Hpa3Q==
X-Received: by 2002:a17:906:bf47:b0:a46:22a3:4798 with SMTP id ps7-20020a170906bf4700b00a4622a34798mr5890684ejb.46.1710308354976;
        Tue, 12 Mar 2024 22:39:14 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id zh16-20020a170906881000b00a44d01aff81sm4525776ejb.97.2024.03.12.22.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 22:39:14 -0700 (PDT)
Date: Wed, 13 Mar 2024 08:39:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Felix N. Kimbu" <felixkimbu1@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: Re: [PATCH v4] staging: wlan-ng: Rename 'foo' to 'rc' in p80211conv.c
Message-ID: <f6f5e779-4881-4fcd-b162-8a8dde514b2c@moroto.mountain>
References: <ZfEvTF7qwYZORGsY@MOLeToid>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZfEvTF7qwYZORGsY@MOLeToid>

On Wed, Mar 13, 2024 at 05:45:00AM +0100, Felix N. Kimbu wrote:
> Rename identifier 'foo' to 'rc' in skb_p80211_to_ether() and
> skb_ether_to_p80211() to match the common kernel coding style.
> 
> Signed-off-by: Felix N. Kimbu <felixkimbu1@gmail.com>
> ---

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

