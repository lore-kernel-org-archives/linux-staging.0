Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC593B3C19;
	Tue, 28 Jul 2026 07:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785223500; cv=none; b=b/Q3gJ6r8Vh+MsIn+b6IjKxewshWVc2HCV5/kgiwoT5IhgJBP4hrMQZquO+M/ObUOw8JAUeZWr+iX0TVspTpY40NyL8ZPRTJNr51Gl3QTxj1MwodkEq/oPk2r+QvezkDmg0Yz35FFbeLlaQrPtULSWNgs7Z7xdnykQwzpwKLWZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785223500; c=relaxed/simple;
	bh=YrrfgFNseQfXJTprztXcWjgxQsJWJH31O1z3sfD9dR8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z8rvFVj70uxkbMDVbact7dV6GfWNH76JLv5NREsCrGw9M7xYYuU08N4TUI4WJW0WwNC8KcWzB/SC8OskJgzj+nXDiv/sg8VkQf3JpZ1G0DuuMnqQ38XvJVKJhBYcjMerkC7Jw8P9KZO2yiJf3KPJZf6aOVDwjemFe6R9Wudc6aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=eE0oLDiq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="eE0oLDiq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41EB91F000E9;
	Tue, 28 Jul 2026 07:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785223498;
	bh=RpdkTOu+5VUXGEoz4QT4XYsDv7t09149uA1miDWwPAM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eE0oLDiq39+khZYTVSxlyhwRXOGTthsEW2/f0PJoIzSyLyCRg07rWlB8yusyx+b+F
	 n0HLNe2Tm7h1zPKonghqX3piSKAipVXq2d1jOhtJqg+Zn1/8NoBMRmGbuiUUj/Ty4Q
	 n/75Qy38gpZdhH2TuIdqCW2oq9asq385gou30r9c=
Date: Tue, 28 Jul 2026 09:24:46 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Amina Shamraze <amnashamraze1@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: axis-fifo: align continuation lines with
 opening parenthesis
Message-ID: <2026072841-overjoyed-unvalued-ff8b@gregkh>
References: <20260721030618.27784-1-amnashamraze1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721030618.27784-1-amnashamraze1@gmail.com>

On Mon, Jul 20, 2026 at 11:06:18PM -0400, Amina Shamraze wrote:
> Fix checkpatch.pl warning regarding line alignment. Align continuation
> lines with the opening parenthesis for better readability.
> 
> Signed-off-by: Amina Shamraze <amnashamraze1@gmail.com>
> ---
>  drivers/staging/axis-fifo/axis-fifo.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
> index 3aa2aa870ea9..13a4f329a2e3 100644
> --- a/drivers/staging/axis-fifo/axis-fifo.c
> +++ b/drivers/staging/axis-fifo/axis-fifo.c
> @@ -246,7 +246,8 @@ static ssize_t axis_fifo_write(struct file *f, const char __user *buf,
>  		mutex_lock(&fifo->write_lock);
>  
>  		ret = wait_event_interruptible(fifo->write_queue,
> -			ioread32(fifo->base_addr + XLLF_TDFV_OFFSET) >= words_to_write);
> +					       ioread32(fifo->base_addr +
> +							XLLF_TDFV_OFFSET) >= words_to_write);
>  		if (ret)
>  			goto end_unlock;
>  	}
> -- 
> 2.39.2 (Apple Git-143)
> 
> 

Does not apply to the latest tree :(
