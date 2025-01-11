Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F78156960
	for <linux-staging@lists.linux.dev>; Sat, 11 Jan 2025 08:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736584520; cv=none; b=i+3NFXGex34t3TG9RDtwrGZ73YuFSxfE1OZjyOLgTZiGgecdVUR+Be/tu0fOySQ7KAzihUA7TVWsQgmN+ScjESlxd8u+5jLZLCc5jugrzu6QJ2muZZlMZUUL6Bo3PNH/s+PMbnPmJ/aciLu/uyPQjV9sO/QY4JRMRRw23aGWjis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736584520; c=relaxed/simple;
	bh=JjM08DZlU6DAEBqZtUX70/H1AmSvstMyZsnZlFXtFTI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r330jhh0Jrf3FVW08EnbvV6gqpOfzbIXP3EXqyMMr/MnsCuaYKJBBpk2AZPIUJHA2Eoh1Iwu8emqbou2QQyEuv+WTzQ2vw4XXHt1mXL8Yv+FWCC1CaeqrtutZ5QglTp14aF7vbNfwx5tXJsOvEPtk7cI5HXdsh25JtlE4H5YqKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MOKa94XQ; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MOKa94XQ"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4362f61757fso27019905e9.2
        for <linux-staging@lists.linux.dev>; Sat, 11 Jan 2025 00:35:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736584516; x=1737189316; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+HTvEqXrMKVEtg4SM6iO/w5pC82mOoVDj1NHejGGinc=;
        b=MOKa94XQDytiHVwbGe+2ELMK/JP2gPUI3QysnKaKWFPnJilsab3ciE2dejpgyVlNS+
         vAW5YuiA6/Ma9MyX5qrCqFjHp9M5x8AQ7208qQPCLaYhsVvxIO0zLoW6qZV2rwtd6K6j
         app1DbM7fdTGoA2itYRzbxPVLX2C98jyYN69h18/UNaRHDILF62tbuA5+VIa3zeODd/p
         dAnEhZt69+T72rcHqC/WzoDhUsZg0ClGPqsegDi5yO366K6via0Nc3X6+qt8/LY/V0Q+
         jJVoRPBHj4Rra+Ix7l4VfLkn4G1A+2PGvtN4szKhZNapBJVinBn53aabApxj+WcluFqB
         Xy/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736584516; x=1737189316;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+HTvEqXrMKVEtg4SM6iO/w5pC82mOoVDj1NHejGGinc=;
        b=Xhs9lV02UP8lF6Uo0cPPBen7Hw7mcbn9SYwju6d/x/3GO+YkwZAF329GOcHC9jO0kM
         1TRTny3TCAviwT8wJWhYBfNSaXCplSfG7vLCBYhlF3mAcPCjyJtwdrlXIknPBeqgn5wk
         keOQNcy7dQ1s1Ab43cYSfXJqRvbnHLojhxqbtjzCVUdbZUJIZx9TN/ClpZIubU9gSPV3
         uhQmBbhSMmyZM+/oDf94v0i3J00FDIaQFzJIv3EBEgJoCEaksTvXpISzyeWXU+tABxaz
         ucX+Y+Esa9JTNbyV7ZW5SidZifKL0Dxeim8BEDX6HYFRvQKKDt+j7m6ZVQF8gYR2nt8/
         0lGg==
X-Forwarded-Encrypted: i=1; AJvYcCXfENgWJq2ddLwJr3IsOL08zvLeqrgKoGZ+EoTGp1tEPmMSIbQ7NwiMs/WsUjMfMDbzNWHdmFslWYkGJLkE@lists.linux.dev
X-Gm-Message-State: AOJu0YweF5rCYrf44GITT8oDdzs0rFkV3gKXs+aO1EOwgXiiX/wvfL8O
	etWXeGtjI/89wbili1KMO9TAS6/q8RnLmUdjScDEIEHaxEAC6QDaGyVU/468/MY=
X-Gm-Gg: ASbGncvYhDrsZMv/fbXbnvtT2EK2mEh9v9IJhyJj1n1GHi/vUKSKqVdubzCkgYKHjcC
	uzHaeW8C+8QcNRc1CK59RETM/8IVM2t3WtuRaB7p16VQDsPgK5gsTWFN4UHDRigVkaPvqXLS2Qz
	hT9eSJA27g0fSFWlzlX/QeDvele/H+ZTW5gpN+8NXFNukoLwhG6LNYoUgUa/Sllc1UF/BFjwxVa
	vsk+ZvC9nUlmvmynL4lMrx0oivfGrIeX75wjbkC8aBjYYi0Oxwv0kgr6HTB4w==
X-Google-Smtp-Source: AGHT+IEAsJG7DGGc6m73gWpeA8mtq9HvPjOcPsKF78vLjOEPDwI6pToWy+rTOkITXCSIrxkKfXB31Q==
X-Received: by 2002:a5d:6d09:0:b0:38a:418e:f3f with SMTP id ffacd0b85a97d-38a872cff32mr11965755f8f.3.1736584515843;
        Sat, 11 Jan 2025 00:35:15 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2c27008sm111721195e9.0.2025.01.11.00.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jan 2025 00:35:15 -0800 (PST)
Date: Sat, 11 Jan 2025 11:35:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sandeep Salwan <salwansandeep5@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] staging: gpib: Remove commented-out debug code
Message-ID: <3ccf9f10-2ef1-4502-a40b-1e6e30e1fcff@stanley.mountain>
References: <20250110233834.64147-1-salwansandeep5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250110233834.64147-1-salwansandeep5@gmail.com>

On Fri, Jan 10, 2025 at 06:38:34PM -0500, Sandeep Salwan wrote:
> Code cleanup. This code has some debug code which is commented out.
> Delete it.
> 
> Signed-off-by: Sandeep Salwan <salwansandeep5@gmail.com>
> ---

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

