Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4310F1EDA02
	for <linux-staging@lists.linux.dev>; Mon, 24 Nov 2025 16:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764002459; cv=none; b=I5RE+wJYZCaBOPW0ze1AcsoYwtLtnmz04cvtc9Md6RQE/QRFFat2UujXia7jJm/Owt0JX67f5u+jaUMAqwXe3iNrdo6E0IJ2/D4+F+JZaXpJ/SJQoneWDMQXfqzL3RbCQysySyaLBhj7UMDNgidxYA9v2ZgeD2REoePe8QJXGTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764002459; c=relaxed/simple;
	bh=qefi9BsdDe9Opc6G9C1LOPWhk7b4sbJ271ZVCb/Q6JE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S2ZYnqhP3pkEs/a8jp0zdb2e+8lE9JurAXbGULoA6wjUO9KB+Eh4cBG5XUE9uFhC83gWGkQHbnplTqpheeFhobgcyV+tsEJmS3i12q/kNL5sValqOJY5XVFNUAmWgz5VvwYKtd13sKvRVivT2gU7j8Wrw1GBsBbarOHIKFFuwCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=JheqMrFb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="JheqMrFb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68185C116C6;
	Mon, 24 Nov 2025 16:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1764002458;
	bh=qefi9BsdDe9Opc6G9C1LOPWhk7b4sbJ271ZVCb/Q6JE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JheqMrFbUAa2AO2tEuQm9OZDDoSao/obDyjy+BfIAWMA0emuzlFoDiDfT0vxeKG/g
	 gLHRWbTtAzDzaCFqnl0ncG2Fxhd7jJ8KAXxZn6M1wbJVaK1IPY+LP1qO2ViDHF0+jZ
	 bbv81nWprCnqOx6RtZpDRrHYhOHlml/IvlyvU+/U=
Date: Mon, 24 Nov 2025 17:38:43 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
Cc: johan@kernel.org, elder@kernel.org, linux-staging@lists.linux.dev,
	greybus-dev@lists.linaro.org
Subject: Re: [PATCH 01/13] staging: greybus: Remove completed GPIO conversion
 TODO item
Message-ID: <2025112425-jeeringly-squeezing-afaa@gregkh>
References: <20251117181818.118139-1-ayaanmirzabaig85@gmail.com>
 <20251117181818.118139-2-ayaanmirzabaig85@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251117181818.118139-2-ayaanmirzabaig85@gmail.com>

On Mon, Nov 17, 2025 at 11:48:06PM +0530, Ayaan Mirza Baig wrote:
> Signed-off-by: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
> ---
>  drivers/staging/greybus/TODO | 3 ---
>  1 file changed, 3 deletions(-)

For obvious reasons I can't take a patch without any changelog text
(hint, you don't want me to do that either...)

thanks,

greg k-h
