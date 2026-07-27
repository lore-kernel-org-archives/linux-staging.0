Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98AB1388386;
	Mon, 27 Jul 2026 14:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785163993; cv=none; b=KS26ab69y7XuI7WQGDS28leQI9K5PUYH1UrW+B34dXpcLRdYSGXYWvcM4g0pnLrR7JbL7SbvratLwcVWBgeq79a5kesp8EPzAlbJC/qDp8LxoD6z0Ga7URAWKgbflkLskyLqC4Un1gShqjblIjIclT977rAR3gpRgk90kUFJ2yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785163993; c=relaxed/simple;
	bh=hAQL1Zf8hASV1azzVQOamlU6GIIrd0Xt3B3GgyAbh8w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r1zvcC1UY6640DwPhw+Tv61fEBstKWvu0s9H+zZUe7j1GHGKwf1NaAouGcVklL234mBFXhVGUaU/4KcFOph7wh3bd+fxIHHRsh9J1wIvs5fkQN+eUS+YxX82bqq5nXj3k9BcIQ2Lsttx2PBzVu0iUMusczX6ZFYsYurAIrRtVIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=TnVHpwUb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="TnVHpwUb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A82531F00A3A;
	Mon, 27 Jul 2026 14:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785163992;
	bh=nSnXfvBu98NMccNGwN6FlBB4/hY7KTTbT5R46RVvHPY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TnVHpwUbRPEJMvs3rdBBrKiol0hEcXoRUymNmLXEzfsJNPH5pUW/wQhc8M1bVcrf/
	 E9SA9bHYyalmYMrJkV3FWNCD+e3ADYXz03/OoyjBClTNmN3XU+YbhhxHNnvxH/3CqE
	 vcLcQRjYLgzyc7m7mIxGYFXOqzygeMGM5sOgb/Eo=
Date: Mon, 27 Jul 2026 16:53:00 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Olivier Tanoh <olivier.tanoh19@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: sm750fb: rename pvReg to avoid CamelCase
Message-ID: <2026072720-suffering-slit-a9cd@gregkh>
References: <20260720074804.29657-1-olivier.tanoh19@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720074804.29657-1-olivier.tanoh19@gmail.com>

On Mon, Jul 20, 2026 at 09:48:04AM +0200, Olivier Tanoh wrote:
> -	void __iomem *pvReg;
> +	void __iomem *pvreg;

No, you do not need the "pv" anymore, as that's the hungarian notation
speaking, right?  It should just be "reg", right?

thanks,

greg k-h
