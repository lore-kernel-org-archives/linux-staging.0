Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583A3271464
	for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 05:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776146141; cv=none; b=MZSAf1TrkmPIaNJykQtcD+cJjIouf6am064Jv2f/lbBUIH4tk3+nsL5jr2lmPBuf0iUk6zy8yJ62bmQ2NkCjOZCs+iyudOgfh0BdCiJXOTUmd/ngk3rOMW1EVbDZn/DrlOXufTA463s3uQBhi//YSV1497jxmICkc9NQ+OoMfQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776146141; c=relaxed/simple;
	bh=eFgpG5XXrLGfjWK4+59o6UJCdvu13kGkewQ9THtuuBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lnejgUIgQ9kr1xHI2Bok5OQ5h/G0W90ab9AMdGGYKouISXg0roP1+yMKwodm4qRvp6A2Ea64XuI9hEvPurxNbqFZ71yJshoyDvtLLJkhDO/REB6sHslIqxj6HifMDOi7BT7rV+jTLtA8FoBJ1UoJrOaKUVdwBikldCvFrlZWCDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mAPykJ0w; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mAPykJ0w"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43d73352cf2so1624314f8f.1
        for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 22:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776146139; x=1776750939; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Nm5Ol5Uu+OCWExdsarfSE4sd8AD9UYzFlJf1BTFal2k=;
        b=mAPykJ0wGJIqclQHMSRdTnXuLTU6NEBis/nDE9mUNmgF8RxF0qBDUnWpiLZTMU2PGu
         fJU8Gqd1GSBUPhE6MQL3DR++6ycsOUm6R1GtsTWsvCpD53Vj2svjmbZ6aXCq0yQyqhk6
         V/zZXAmDUaP753IsPC+JvGJ6xltJNlE9XXzHNuaU8m8yQbO31x1DD2c71jwgrVrtvHTi
         aDDtJ/n6pOyEaKPB+XyIAAufXt4OcNDpA8CVuK1vBjRZJXEeNGc3IgCGu4LkVxX8Itdt
         mmapeUi9nd8wTxyH0uo/5Z9ItEu/RUH3w+9Lw5Bto2Ja/j13hgUs2L4ac5DAVlqTHnj1
         09Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776146139; x=1776750939;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nm5Ol5Uu+OCWExdsarfSE4sd8AD9UYzFlJf1BTFal2k=;
        b=m02nIGIuRbTFHM/BFFZRYNVgWgtqmDnzt0toU+2qFa3+poHBkz1VBFLvJUrdOC3PuE
         Dr4KXw2zkgDsK9KAVC+2erzIXdMPz2eKFDChBuO9JNAOkFWKsKIpJldPxEyXzn6D7/40
         jHPN4if4cnVMS+ZWJoaHQjju+sShAqV+woZ7IfM4x7GGSa7QW1IT/JXLYPIwZyxe36dU
         A7X+kDwOtgWrydLUcL3oCIqqnEQP/852C14KeYFzQ8oj80kOBsmYlpUlGJ1zzaPb51dp
         /4kLaa5UJ1n2ukd/c26fx++9oI4zxLd5+IfcZVuGZeg3xzySStI9zKYKRdB8IbG7k/zi
         2tkA==
X-Forwarded-Encrypted: i=1; AFNElJ8AQj+nivUPGm6DL5Y7RGMVPrEx4Gq4oJT7j+QUgx7YycS5ABt+bhTBCHGTspDXFSDJvh5BYv0rSydSvYYh@lists.linux.dev
X-Gm-Message-State: AOJu0YzF2WCxDhpsTug71dmF3csJidS0uZZwjSO496nL8mUbB36WRI0b
	T9B4w/oh7GSwWG4BStCr236o+itTFiy/rP7RkeNCCLnxcNqrKclLi17f
X-Gm-Gg: AeBDietcbVw6xaJhTff7y+hojB5POPE8fsTm7QtDIUE2XIU2iQiniyqQzJdLWTepqpw
	QG+K/uIbqvsXMcWmA+ca3ommjoqaqjJn64PcxXKp+cV9IgDFiF0W+UDEqucWRoes6niEMdVpZVB
	pN6COEMlo5RG79/tVim5Mfh8Pb20AjzUNrq88nLVtsNhZvkJBGKRAt0n3r/XyCBYl6hW0foD73Y
	lvtNH5EZUZAnR27kZ6AFpPKxQUCTeKmRuz37zYeE8MpPmvWf5t4p6Es+vHoheMOkeigVHgroDH/
	geQrEl1n7hyzhqMilC4e+GUk1TtQTJ4n7DT/ue6fnzOJCUyn3UsmIJJ77Iv9uaXweR3kZLPEeIf
	AgBTE114raEP5v5ilrBAVPOOrOo0NdXLArcivzvz8gPiq1zWylmQJ7OHMYXs7/oTl3RIzWJfT55
	wRUMQ1knGd1P5u/gUn
X-Received: by 2002:a05:6000:2c0c:b0:43d:2ffc:2f6c with SMTP id ffacd0b85a97d-43d6427b958mr24093181f8f.5.1776146138720;
        Mon, 13 Apr 2026 22:55:38 -0700 (PDT)
Received: from localhost ([41.210.143.51])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e46a85sm39084865f8f.24.2026.04.13.22.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 22:55:38 -0700 (PDT)
Date: Mon, 13 Apr 2026 20:51:33 +0300
From: Dan Carpenter <error27@gmail.com>
To: Alexandru Hossu <hossu.alexandru@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] staging: nvec: fix unconditional pm_power_off
 teardown
Message-ID: <ad0tJefABBGz0LQc@stanley.mountain>
References: <20260413151229.612301-1-hossu.alexandru@gmail.com>
 <20260413151236.612404-1-hossu.alexandru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260413151236.612404-1-hossu.alexandru@gmail.com>

On Mon, Apr 13, 2026 at 05:12:36PM +0200, Alexandru Hossu wrote:
> tegra_nvec_remove() unconditionally sets pm_power_off = NULL, even if
> nvec was not the one that registered it. This breaks any other driver
> that may have set pm_power_off to its own handler.
> 
> Replace the unconditional assignment with a guarded check so that
> pm_power_off is only cleared if nvec was the one that set it.
> 
> Also remove the stale FIXME comment, as the guard addresses exactly
> what it was asking for.
> 
> Fixes: 3f8d52ba1c49 ("staging: nvec: Remove nvec_power module")
> Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
> ---
> v2:
>  - Drop nvec_power_handle = NULL; after pm_power_off = NULL is set,
>    nvec_power_off() is unreachable via pm_power_off, so there is no
>    dangling-pointer risk there (Dan Carpenter)

Thanks!

Reviewed-by: Dan Carpenter <error27@gmail.com>

regards,
dan carpenter

