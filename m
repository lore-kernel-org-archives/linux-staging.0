Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44CC62F49F0;
	Sat,  7 Feb 2026 12:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770467384; cv=none; b=SVsGt6aB1mjzzZU34iscaPrk5uG/AYYBHAPbhJulgO3PPn7MQFS3f+MqH7+GIisZOMyyI2FJAE983TDbtIJVypt8gOybtMeu7n3bqCp2thjfcgaL7IOivgFm1tdoxaN+v0Q6pzlQqZzphkbPwANGVMj1nbZPP7JmbAMlUOV8QVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770467384; c=relaxed/simple;
	bh=oo+uaRgwN1G62kXhMwHLYyOW2K+U/7YgfsKRQlMbAug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aG240CEfTJZX7gXcBPPdoLlXi9CvcWXauJs0+nAmqxp5Pwp0RtAGbkhOdSyXaEL7pOaqk7ZQcJ+CB2CYwtLU+oq1pk1tTHC1t1mQmhxeA9oNcCSBfR+l9Ihqt8uWU2YkvMc626SDVSA8HhpqRbqJw+eoP4zvzWkKefxYjvdRLms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=CalLTQOY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="CalLTQOY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54165C116D0;
	Sat,  7 Feb 2026 12:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770467383;
	bh=oo+uaRgwN1G62kXhMwHLYyOW2K+U/7YgfsKRQlMbAug=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CalLTQOYCrfeloq/vdOBCJ/lfW1XtAF1Yheg4TLn6AeQHomTqHhksTvOQ/irePzOx
	 L11bgKWfFQ96v7d4LYFDyinSU4n+37nWN1gM/bjiUCNYJ2HffdiOYAjtiDwxjIxDpK
	 bFRgjMWLbttvsOI9Fi+6zineVrAeweqKaDGBYvbI=
Date: Sat, 7 Feb 2026 13:29:40 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/5] staging: rtl8723bs: standardize comment style in
 HAL
Message-ID: <2026020713-decrease-illusive-ab4f@gregkh>
References: <20260129160426.13737-1-mahad.ibrahim.dev@gmail.com>
 <20260129160426.13737-6-mahad.ibrahim.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129160426.13737-6-mahad.ibrahim.dev@gmail.com>

On Thu, Jan 29, 2026 at 09:04:26PM +0500, Mahad Ibrahim wrote:
> @@ -39,16 +39,16 @@ static bool CheckPositive(struct dm_odm_t *pDM_Odm, const u32 Condition1, const
>  	if (((cond1 & 0x0F000000) != 0) && ((cond1 & 0x0F000000) != (driver1 & 0x0F000000)))
>  		return false;
>  
> -	/*  Bit Defined Check ================ */
> -	/*  We don't care [31:28] and [23:20] */
> -	/*  */
> +	/* Bit Defined Check ================ */
> +	/* We don't care [31:28] and [23:20] */
> +	/* */

In the future, this "blank" comment line can also be removed.

thanks,

greg k-h
