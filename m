Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5AE342527;
	Wed, 17 Dec 2025 13:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765976465; cv=none; b=eJRYxMVjwOl7ULssJpfwU4GbF/sV180nlVhrIl3+Q0fdLj9T5IJAo9L0B1mHUfbnRrhSYFILA0Zr3/b9MrLxxlfJ0oElomVv5XpzOjPY2wvGxzXyuVhO9rCZb/w+u7ItdmdYeu3rrM7cOVJiXRd+NQNi/bSj5aq/YFZvKzYaeXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765976465; c=relaxed/simple;
	bh=JkyGt0LbaR5Qb8EH1JoU37cduEcWc4ieIxYhQM8jGFc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EUWsugcyjVcM7Fo/0DYQynG/Cf23PNfrJjnoNAHEi9dIY1GXT9CgWm706aVpcWNgnM1dLcb60j2fwQwdLan943IHHATq8QB3svbQnSYQ8LuBGXsW9wnNEjhs9ikDRKqZv1Ats4DUt3uQVQJP/h176Ze8dOaKJA3RTrViLxThPJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=MCul9lNn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="MCul9lNn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF2F2C4CEF5;
	Wed, 17 Dec 2025 13:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1765976465;
	bh=JkyGt0LbaR5Qb8EH1JoU37cduEcWc4ieIxYhQM8jGFc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MCul9lNnceEcR3zbBklqWo91Zzz9+csAR0DrzKtyD39TGrlXKey8wb/g00UnQFnw7
	 DLykFzeur7L730Xmm5vzJcn4nQ1Nd9MJnlLtUOanTfcuq6ym/gwQaLgh50ZYhg3F6l
	 wCwDCRRo3cKUeL/+0KeBJXUQXRrzdQmJI9GVsrNI=
Date: Wed, 17 Dec 2025 14:00:59 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Rutansh Suthar <rutanshsuthar@gmail.com>
Cc: dan.carpenter@linaro.org, zhaochenguang@kylinos.cn,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] staging: rtl8723bs: fix block comment coding style in
 rtw_io.c
Message-ID: <2025121750-smartness-ship-b187@gregkh>
References: <20251202234318.75104-1-rutanshsuthar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251202234318.75104-1-rutanshsuthar@gmail.com>

On Tue, Dec 02, 2025 at 03:43:18PM -0800, Rutansh Suthar wrote:
> Fix block comment alignment and style in rtw_io.c to match kernel
> coding style standards.
> 
> No functional changes intended.
> 
> Signed-off-by: Rutansh Suthar <rutanshsuthar@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_io.c | 51 +++++++++++++------------
>  1 file changed, 26 insertions(+), 25 deletions(-)

Does not apply at all to the latest kernel tree :(
