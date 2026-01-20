Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0521043D4F2;
	Tue, 20 Jan 2026 14:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768919670; cv=none; b=KLmoCt02xJQx1aOJT6zXghUOF93NybKDLnHNvnB1BuTMCQESoYHSeNyS3el+WvSe+oERSpOTbHLyxM2YvUTMokjL4AG1rZdaTQnq4nEaxcuMjk8HWWlIAyWv9aHKuuUo0KCkltRzmO1tfYwISTeP/wZqChNqI6qAr765e1uZ1TA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768919670; c=relaxed/simple;
	bh=rUd9Y8ALy0BrHVbr0rmzynJKiUfuqbKINB9lyn2vRDA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RNRE4g5C2HxLgttqy0zK4VsF3Wf7UI8gtzauR1OFhFy36mifABZvDlqz0Lanz98ahP1drJ5sda4D9JUOvwdymGlLhv6V8QBgbUs/qxXdS+AePng18rEVX/nsbNeIbHrpjxtiV5GUFqIO2Vf7+AC+DO5J/zUr2TIIDO+A+jOrMpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=F1SVBeZ6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="F1SVBeZ6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FF45C16AAE;
	Tue, 20 Jan 2026 14:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768919669;
	bh=rUd9Y8ALy0BrHVbr0rmzynJKiUfuqbKINB9lyn2vRDA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F1SVBeZ6og6SwznkocwWnIhRpixhoOvtRUdZ5rJqTzQ6izcQiaewnViZxNw4XBrKM
	 AKZMjPI927q8XBZLffNswjbzaiQbyYkjw/etiikW6zhIdma2GQa3tywMZfTWGxKExL
	 d/j4Y5w/bGxhmGwK5HrcKrsuQwQFouWKj/Qn+08Y=
Date: Tue, 20 Jan 2026 15:34:26 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: 2023060904@ycu.edu.cn
Cc: linux-staging@lists.linux.dev, dan.carpenter@linaro.org,
	guagua210311@qq.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] rtl8723bs: Refactor continual_io_error check
Message-ID: <2026012020-cut-versus-a50b@gregkh>
References: <2026011937-snugness-movie-9e32@gregkh>
 <5A122A378F3E53A7+20260120141129.8262-1-2023060904@ycu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5A122A378F3E53A7+20260120141129.8262-1-2023060904@ycu.edu.cn>

On Tue, Jan 20, 2026 at 10:11:25PM +0800, 2023060904@ycu.edu.cn wrote:
> From: Changjun Zheng <guagua210311@qq.com>
> 
> Refactor the error count check logic to follow kernel 'single responsibility' principle:
> 1. Move the increment logic (atomic_inc) from rtw_inc_and_chk_continual_io_error() to its callers in sdio_ops_linux.c (line 226/302)
> 2. Keep only the check logic in rtw_inc_and_chk_continual_io_error() (use atomic_read to get current count)
> 
> This change addresses Greg KH's feedback to move increment to callers, while keeping atomic operations to ensure no compilation/run-time errors.

Please wait, relax, and take a few days to think about this code and the
patch series that I hope you read.

Then start over and create a brand new patch series based on what you
think should be done, NOT what AI is telling you should be done (hint,
it is wrong...)

thanks,

greg k-h
