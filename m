Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325DF2C11DB;
	Mon, 24 Nov 2025 17:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764004047; cv=none; b=Pjsggoj2/JBJIH0UZo/9016RLeWtfPSqcrlxWMkGy9/HVro+g2U/Tm5tiUprK/3vEa9fDZ4zFLIosnHmRiFpzy/JUX+chAOzuvgrRhFGkomF2LflmJSqu1KWW8T5Y/Hx47FSDmI48es4h9fjhfRsNqFuQSKY3P17U2Gl6vlfYIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764004047; c=relaxed/simple;
	bh=UhqAc+Xv6rdvpc9y3/GdZminGInmxx3M4BXvo0rlnhk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=smdf7t2NJ24aKMEkxf6+rv0QapudWX+iyk2eYLG+EIpYTXw35MniYd8QvedWQDWWb0b00NQCfMaMZ/UZd5N6M2Ruoh1lCIRxgfFTmREoGQqWQBgvzNc8rYMZ4qX3PdW/uGuIUDDk3QcSGOnMK2Piiv+mnmatbJxDGXi6OnEm1YI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=h9Ckgcag; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="h9Ckgcag"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F956C4CEF1;
	Mon, 24 Nov 2025 17:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1764004046;
	bh=UhqAc+Xv6rdvpc9y3/GdZminGInmxx3M4BXvo0rlnhk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h9CkgcagO3gfw3Fe8mmYv5CdEXk1SCuGvquW3LRQKD1hwtmkYOCu97Zs4W4j6Us2Q
	 ovfFWcer+cJtbFTWaefkj/Ir+uDOCoMp02HdRDC9g/lAsmcxgXKqP0SNrPH4AmwKdE
	 MKuKn3zkej6lBu9SW8SKKUmlc5Zzr2PQQgeto8S0=
Date: Mon, 24 Nov 2025 18:07:24 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Adam <adam.quandour@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	niharchaithanya@gmail.com, dan.carpenter@linaro.org,
	matchstick@neverthere.org, dpenkler@gmail.com
Subject: Re: [PATCH] staging: gpib: Clean-up commented-out code
Message-ID: <2025112411-flip-throat-50a3@gregkh>
References: <20251117092020.8473-1-adam.quandour@gmail.com>
 <2025112415-suitcase-console-5b2d@gregkh>
 <CA+jnL0PugpSN3XNnUe+4aShshT6J-HScGeTuVn28xv+=+7NQYA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+jnL0PugpSN3XNnUe+4aShshT6J-HScGeTuVn28xv+=+7NQYA@mail.gmail.com>

On Mon, Nov 24, 2025 at 08:00:20PM +0300, Adam wrote:
> Oh, I will make a new patch then. It is in the same place in the
> master branch. I should make the patch from another branch, right?

Look at the staging-testing branch now.

thanks,

greg k-h
