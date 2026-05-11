Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACAE53B3886;
	Mon, 11 May 2026 08:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778486547; cv=none; b=lNKPI77Ye6cjeKXx3N3uBog2ga0AhGPM0im4tabONpkFsRms0MoYCu3zpraA3fUMk7JSwZ8v1dH3SJl4p1CJeePbg9Af616IwIMPZyQ0KBneEKT79sfwGg0ATbImpJ13ZjZIWj3K5oFoclnbj2ZM+wiuTRjTbvvL12OvYDYBfLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778486547; c=relaxed/simple;
	bh=iSK+RU9cCXIE0OoFrgl9eJ2/wSegpvjl0fTf45/Sonc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oJN0/MJ7OAogoDckTxUzjMEc47hxIx2mncWt2STKVoTT9s+ymQiUX3pVsy6KkRa6eG0hEti/Ukp5VEOewMSBchMHzz/JGUEe+7GkXU/f9P4ILdNM/F/v7bRSkwVzAdpBZzzW/nh7ivyvApVvd+2pK6PYQ5aDNC7wePUr7LJ8sD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=FzjkJrKJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="FzjkJrKJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79219C2BCB0;
	Mon, 11 May 2026 08:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778486545;
	bh=iSK+RU9cCXIE0OoFrgl9eJ2/wSegpvjl0fTf45/Sonc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FzjkJrKJGb4qucNrytN+P0re/inbzCs4fgvX25L2KuqD+YtL7vpvAaFElT3uh9858
	 DsaedGlMI8wBYDkE6XU+XYzvL66kIklmCq+zLXLH/ynB0dsZ44qtxdlBG3PZxSFMSY
	 6yW45IoznKnXJkiyTvbWGltOPxtttyjzK12Q3b9g=
Date: Mon, 11 May 2026 10:02:23 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Pramod Maurya <pramod.nexgen@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
Subject: Re: [PATCH 2/2] staging: rtl8723bs: Fix coding style in include
 headers
Message-ID: <2026051101-peddling-debug-adc1@gregkh>
References: <20260510151735.520685-1-pramod.nexgen@gmail.com>
 <20260510151735.520685-2-pramod.nexgen@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260510151735.520685-2-pramod.nexgen@gmail.com>

On Sun, May 10, 2026 at 11:17:21AM -0400, Pramod Maurya wrote:
> Remove multiple blank lines and extern keywords from function
> prototypes in header files as flagged by checkpatch.pl.
> 
> Files changed:
> - rtw_wifi_regd.h: remove multiple blank lines
> - sdio_ops_linux.h: remove multiple blank lines
> - cmd_osdep.h: remove multiple blank lines and extern prototypes

That is 2 different logical things in the same change, just do the
extern one in a different patch.

thanks,

greg k-h
