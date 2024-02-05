Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEAE0BA5F
	for <linux-staging@lists.linux.dev>; Mon,  5 Feb 2024 06:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707113335; cv=none; b=rNbHRHv8xrJezBNRsxOCdVayQP/1Bz6Br85BbhgKRHZuxZ2ECggiPrdwWujUnsJXJyJ2SylMcNGZI8JXyHVmC52CW/IGHWqwr2pJVwbImidMVaYwHVvPOuUcgJByNJROqKSA8x2coMpYuiF4/BmTx0DJZXK6TAG64RQx8lpgORg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707113335; c=relaxed/simple;
	bh=euGWotuVuS8Wlf46tGlUby7+LmXb1x7ChtYBqcMvf4o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q0Xrlpo2G8B0b/Up4X56mOSpG8hhD2swx1bSZKGmV+LUt+x6Ou8pA+bZEj8Suomm6WY5ZmJEuY8Yar/f6uznFDlybguw+yElN1Rw8SSTgz0T/q5FNl/MExZspWVzrBlRPWaNfoAjcOrni5wwWm+vbFwZ39G7uO4sHqStnH/Qr+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zceM+nKf; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zceM+nKf"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-557dcb0f870so5180591a12.2
        for <linux-staging@lists.linux.dev>; Sun, 04 Feb 2024 22:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707113332; x=1707718132; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T1K2hhd5XKdxqTr1V8OgArx6oGJVUK1IYtbVBeZd92o=;
        b=zceM+nKf2+qTl6tGt0l8gTm+GrHid2dBEotAKMwZ87kKiA+0/GWelKTnMbyxnzgTp+
         erNQhkWjjkYyqhbrSc+SLzU6hKtMU3pSs6OoEcrn7/OFS9K6/FbWsogEED4b7wU6vO5o
         zEBUidhN5Bj8T55OWtzol8lqrMrjuOKgV9Q6yD21gTkQaWn55AA0h8b/JWWDEEeJUmz/
         FnHzBjzVkhwrzMQkXVxwMDvlToxnKg8Vhm0WAwf7TlqVBc0QRrqI4Iu/AapoWJAAt67N
         f3TdvuMewz/zQ1LqSnsWNcqVo+Rtgkl4EDleQmmytqAmUJ5nHgC0ahIsACZ8cbvdOnJb
         dPjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707113332; x=1707718132;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T1K2hhd5XKdxqTr1V8OgArx6oGJVUK1IYtbVBeZd92o=;
        b=CwNsKA63/V9C004DtEvMjfJokMVcbGi29T6bbCxr36tvPdsSn+eqInP5yxnvwAH54I
         jc0O/Y2c19jAUMnUVEbyW3/6lTguES5SeOu+DRULvuye4eQ2bzind7P6N4eMwX7zS3I5
         BltFxCk/4n+xCd3UwVY2VFeCcuczEcait3dYBsnKAz1xveYfHa0zAIZexXZFObcMAMCx
         BSQIGEY7KYQUda+ZwIOfy+ewt0x3JcdFE8PfDIhTNrbfkz9gVtPMsRt9iFV+KCOoXwGY
         TSpFshIu0UVb50UvFmHmO8YkThNPRfIrkqX+DzllY9EPY05+ggooTgwVn0wEjZ4qMKZF
         assg==
X-Gm-Message-State: AOJu0YxIEdzaG9MM5f55ydzFAa6IwmDKj1aVicFoDnycmPQc98V2IiOT
	LvzwIHl1YzWxm2CY9EgZhYXu8V/fJdF2U4/MEHuaCmGe0sWutKNElXoxT/sN3L4=
X-Google-Smtp-Source: AGHT+IG++NpE5nVpBwvC+n8aeiDgxT0MbJ14KRG2TL/xu5E8hBQLrX9CI0xGtSX/GS5saSVBFMDKNQ==
X-Received: by 2002:a17:906:394c:b0:a35:783c:edfd with SMTP id g12-20020a170906394c00b00a35783cedfdmr10794692eje.68.1707113331936;
        Sun, 04 Feb 2024 22:08:51 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVenP0DTqoL+uY7YvWvVPD7DTLBqvMexDE7ASUaNh43PlApb5yvbtjgDWw1A6gfA26u2TNfQCxn1Jv1hGO6yXEY6pzeyg9T4WZRyeadjzHXbe5I/7ob8aufLl8f0j8MkUGO6vQJKUoR+rj8ABVAuGycaOEHC+4+9qmFFx9AFuoTbfxBzHDYQjGCHzdL9Swbgp17jFVRC/f3RDC08etRNbZkjT10G5zCYcHzHyGYPnRy8vRxIhA=
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id u5-20020a1709064ac500b00a372d4e04absm3062598ejt.181.2024.02.04.22.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Feb 2024 22:08:51 -0800 (PST)
Date: Mon, 5 Feb 2024 09:08:48 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ettore Forgiarini <ettorenigma@gmail.com>
Cc: gregkh@linuxfoundation.org, richardcochran@gmail.com,
	ozlinux@hotmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] Staging: octeon: octeon-stubs: remove all typedef
Message-ID: <9066fb52-66dc-4ff1-8014-11aff7d2d0ec@moroto.mountain>
References: <20240204092134.1265312-1-ettorenigma@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240204092134.1265312-1-ettorenigma@gmail.com>

On Sun, Feb 04, 2024 at 10:21:34AM +0100, Ettore Forgiarini wrote:
> Removed all typedef so the code conform with code style
> ---
>  drivers/staging/octeon/octeon-stubs.h | 48 +++++++++++++--------------

These octeon stubs are just so that the driver can be compile tested
without installing a cross compiler.  They aren't used in real life.
You need to cross compile with MIPS and the appropriate .config to
ensure that you don't break the actual driver build.

regards,
dan carpenter

