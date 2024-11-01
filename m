Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC7FB168DA
	for <linux-staging@lists.linux.dev>; Fri,  1 Nov 2024 20:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730491416; cv=none; b=sIlJSUZdIYIxJOEW5cqyMCr1VHnl9HDFE8QjQ6ExuXWHSrw2aYVFe4dtbQvuX1py5DzsFrypSyw6j6WQJYtgZZmfAVl8ZvMYxqyxa6VwSVR7kyyCYpqZLyJezyJ7FUfppmRU8whlXKUePiCKZaIYb3tri/dKL5rwmgJpOwzNNFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730491416; c=relaxed/simple;
	bh=7g9We0eqUUXCq1dSP9cANthL3PcqEPNeijHoAQFcdeA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dNlshMWEj05XJ0p8zmTbhOTP4WR6hUJ8EDtSWXV8+lX30Q7+7tj9RA3pgmJQAEhoI98BR4UkIK+2N04zAg5PFMciRZCN52Rh6qWnh2xr5dIrbsw6RDE6ZLq+AaIWKhAe0EqWs7HysTkRfb/qMa5hrjkHdLcFIUIdBjKN+EP05gA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GleaYD9Z; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GleaYD9Z"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43168d9c6c9so18477335e9.3
        for <linux-staging@lists.linux.dev>; Fri, 01 Nov 2024 13:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730491413; x=1731096213; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZTwdGSzq+YwPJ1wyOfDmkaz+xCRodSguu/W6kdVGHDY=;
        b=GleaYD9ZeZ45XIcvN22Bb3zymT3TnJWReuZXaIkkRD1cu+Gt1nCQVpxleSo06zhag2
         9QTYs7GXc0ACtV8kCc3jtsqjMyskAe8+NHzYCRpXwHNv9sWRqCDZam0vj20NKSro5HI/
         noFOmfbUEfbBeW8d8/Q+Aq9T9djch9tJWN+wQK0r1cRtvjnB3otC+xc/YFn5nm87uvFE
         seJLd9nV6jHsEASVU8i/qnMskc+dhqEfAWi7q27ZxQoPZbM7jnWZDbEVNzMBUAKFWg/P
         Gubb5tpCWAkVcgAzCrWnDHR1rD/jkLb3qfmR+6YJ6y08nImEVBNAXr4cB5zPp53sK3u1
         h5Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730491413; x=1731096213;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZTwdGSzq+YwPJ1wyOfDmkaz+xCRodSguu/W6kdVGHDY=;
        b=HWSLaORfJtb5taGH0AyPho2CTOhX1mQ6YxBQ62PAR4vo2DV66kqG1hFNYtBLZAw5wN
         rvj17o3qml2uZkR+5sEr7XMnb/ZuGSQehtXE3j0rKJkPbB4QodmISdX0Fl79VR8QjKT4
         S7gIl5WTasTQkT8EyTISH5WdbyDIzLlx4apRywPuRxtQv8XrmSiIYfijTr4gGZgA14d4
         Vlw64XUbjsDbfY9y40eygPGog4OgFYGoDEXn6v3rLTieMR2p5fyL2oIjd4G8mUir0N/B
         qZzViBGr46DtE9Nagxz9bFFTcMgvN5t68FTt26d+0wyDyDHGZ/NN/1l/iE0MiXLh+7uQ
         LpjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWntKraVjZkYm7K5wf9fyfUR+gIhkzzOdtPam4IY3usymibvzuV3LQjp+Q5f2g6kELfHoPs/JLzXlNuOBpJ@lists.linux.dev
X-Gm-Message-State: AOJu0Yxi22dHXL+E3QmdZM9DgIWGdvwu7Nu+gm4UCPXsYyCE2MuBrKeR
	mkaXd5JtkQ7GK4gL5qrz7nv09dpZNZI940WVBClzDHd/Yw0KehJPAyWexpxfm1s=
X-Google-Smtp-Source: AGHT+IH56j6i9DW7fWQlDcdl8QaW+GasYdpjnjmrM7SdtYAGoiqdGQA2eBZs7NIru/zegqA6HHkZ4A==
X-Received: by 2002:a05:600c:4fc5:b0:42f:75cd:2566 with SMTP id 5b1f17b1804b1-4319ac77208mr215911435e9.2.1730491413203;
        Fri, 01 Nov 2024 13:03:33 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4327d6848b5sm71791775e9.32.2024.11.01.13.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 13:03:32 -0700 (PDT)
Date: Fri, 1 Nov 2024 23:03:29 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dave Penkler <dpenkler@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
	arnd@arndb.de
Subject: Re: [PATCH 7/9] Fix Kconfig
Message-ID: <350940b1-b497-4890-9892-0e9281a7ab2d@stanley.mountain>
References: <20241101174705.12682-1-dpenkler@gmail.com>
 <20241101174705.12682-8-dpenkler@gmail.com>
 <4c5d1b45-a3eb-447b-8269-8828dcdd2088@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4c5d1b45-a3eb-447b-8269-8828dcdd2088@stanley.mountain>

On Fri, Nov 01, 2024 at 10:51:10PM +0300, Dan Carpenter wrote:
> On Fri, Nov 01, 2024 at 06:47:03PM +0100, Dave Penkler wrote:
> >    The NI_PCI_ISA driver also supports PCI and PCMCIA
> >    Correct spelling error COMPIlE_TEST
> > 
> > Fixes: 2c9f5d8c6ece91ecd33350749230494d224550f1
> 
> The Fixes tag format looks like this:
> 
> Fixes: 2c9f5d8c6ece ("staging: gpib: add bus specific Kconfig dependencies")
> 

I use a little script to generate Fixes tags.  You have to have "abbrev = 12"
set in your .gitconfig as well, I guess.

#!/bin/bash

git log -1 --format='Fixes: %h ("%s")' $*

regards,
dan carpenter

