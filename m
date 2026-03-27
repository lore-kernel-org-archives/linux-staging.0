Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE193D3331;
	Fri, 27 Mar 2026 09:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774602687; cv=none; b=bawjvEhG4f+dO4LU/yEkoy170FeAgd8xHi2c/QLtmXOCeiVgGLY58PYLYuyl6eThqpI6DkKN1wW1HeN6OdVArC7D5eqHLWGPc554zt+RwiYYoDReylSNR9mzAPETktlkD/Y+25zmmvUYd5zSr45lkSdW63aCrq13QhOrFyrMwSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774602687; c=relaxed/simple;
	bh=1a3tOVskWktC4WrE5yuYJ2dBJ/IR+ys+lG2iquRqk1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MRr5y0iTWbHNFibzFNjKD86cmh/QCHArFZjzHTJVXkBNrqHHYpbaNbcXt0LXCjJju+E1yLKRgL1FFa1Go05KZyvJuv5eyFlDIpEGvjmggozrYr1uHSy4nwn3AlhEDRGPneKuHGWoJWpccUGghLb0cGp5IowH/s4LTuvatfU64oA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=KElM66lw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="KElM66lw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67991C19423;
	Fri, 27 Mar 2026 09:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774602686;
	bh=1a3tOVskWktC4WrE5yuYJ2dBJ/IR+ys+lG2iquRqk1Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KElM66lwRn6Tqwmo5o76FZczKxh/mMQ5sRlf8xSkkE3J1nXes1sfKC74XrrGSnGuP
	 5lMqnZIqSVM/i9CIHRzLPQK7TcvO/JSSKbh/FZC0CWPj+PYoa9Q91ftgx/ew4lOGF6
	 SBuCMh3HAWtf0XmHA1QjcqdIEhHqc2aVQYR/lpVw=
Date: Fri, 27 Mar 2026 10:11:03 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Haoyu Lu <hechushiguitu666@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: fix spelling in comment
Message-ID: <2026032736-freckled-chair-5253@gregkh>
References: <20260327082434.2529-1-hechushiguitu666@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327082434.2529-1-hechushiguitu666@gmail.com>

On Fri, Mar 27, 2026 at 04:24:25PM +0800, Haoyu Lu wrote:
> From: "haoyu.lu" <hechushiguitu666@gmail.com>

Please use your name, not your email alias, your "From:" line in your
email client was correct.

> 
> Change "co-existance" to "co-existence" in comment.
> 
> Signed-off-by: haoyu.lu <hechushiguitu666@gmail.com>

Same here.

thanks,

greg k-h
