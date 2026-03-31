Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A76028FC;
	Tue, 31 Mar 2026 06:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774940004; cv=none; b=jiGfuaYM77OeRg9/RUwjfT1SP4eBLGj2CxB9qwnRknQgLs5E/qjKzXEnHPHG9qTYZ1/IbCarEQ1j9J7QFqGIjkBnnu3n3ROHe5DIOYdzPpKGIbtG7AjM64s5NW4SL28kvtSUcSSdOFgJ7ZIvzVmxGEn4UY4QFCsj2/KyUpygYBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774940004; c=relaxed/simple;
	bh=ipTUOwKdFDqiBHLJA+43NtE3hsLJWR+Z7Sbi65dDdgU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KPH+fFEVn+Q6YkSyOSlJEb7MdU6KBZN1/t0WJHPm7O2+9gdAZKkHl6FXnqGnvrseECKYQ8xtNbGdsYDBu+QTJKjkxl7ha4yJrXv6f6WvlWFUOEeK6emFB+DmJGx74OY/d2CiHe1+5yf5mK+Fefgv9B31aq1rE3GslSk9/BuHpgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=heCgzaix; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="heCgzaix"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47715C19423;
	Tue, 31 Mar 2026 06:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774940003;
	bh=ipTUOwKdFDqiBHLJA+43NtE3hsLJWR+Z7Sbi65dDdgU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=heCgzaixBBLEV+9q6OUAfRmL6y63swLkhy+fAU7744MINHfb9sOF3RBgxnXqI8UJ9
	 4pAw10COg/GTlR4UGaYEsN10PRuLu+gjyj88iYWOJofX5fAoK+1irXFVlc4NGkfc4Q
	 Gy8VQDxbOh9M5uUF+rXzjbYdMPSjRjBhMY1QD6iE=
Date: Tue, 31 Mar 2026 08:53:20 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ethan Tidmore <ethantidmore06@gmail.com>
Cc: dan.carpenter@linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: Add myself as reviewer
Message-ID: <2026033158-pounce-okay-01f8@gregkh>
References: <20260323055427.1181112-1-ethantidmore06@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323055427.1181112-1-ethantidmore06@gmail.com>

On Mon, Mar 23, 2026 at 12:54:27AM -0500, Ethan Tidmore wrote:
> Create rtl8723bs entry in MAINTAINERS and add myself as the reviewer.
> 
> Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
> ---
> v2: Remove Greg as M:
> 
> I've been active reviewing patches in rtl8723bs and would like to become
> the official dedicated reviewer. I've noticed (and Greg mentioned it
> himself) just how many patches have been coming into this driver so
> would be very happy to help with the load.
> 
> Also, recently ordered the hardware itself, it should be in by the end
> of the month.

Let's wait until you have the hardware and you can actually test the
changes, before agreeing to be a reviewer of patches :)

thanks,

greg k-h
