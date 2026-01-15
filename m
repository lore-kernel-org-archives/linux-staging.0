Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4893A3793CD;
	Thu, 15 Jan 2026 11:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768476605; cv=none; b=KBs5mobK9ZZHgyeEQyzsS7MnvbIQBajS1BcX/6EbBKpJ/+HbumlYWOJjfmbSGA8SBRYP+YlgBsuA35Fnm6B8jkFtiww/l9ZYK9cT9p6+XHWfBbMuUrgja97E+pwg3x+3k4dK9RXZItEpEvzkpWsdtTiFb6fP8jsx4oC/wDuq+dE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768476605; c=relaxed/simple;
	bh=DP4m8JQzxS33s9DNPKro90MeaSKK3uAn/Rt/UlksLNk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I6AGUb1pJ7ELjDWYM23kqKscpxPw9nj4zKYMmO5SyXO5ObvIz0l8/Az/9JatfeTwIxxk0QCUrZr3bPmL8a/+mujcbFlq/mu83bNdZpuzg/Pg5ckQATOxkc2o3PukUSsL4lY3/lIWbhBhXBbWXpn1PoX3WiCpTjDsHTq9FqUWk5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=aDzmOhDZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="aDzmOhDZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87228C19422;
	Thu, 15 Jan 2026 11:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768476604;
	bh=DP4m8JQzxS33s9DNPKro90MeaSKK3uAn/Rt/UlksLNk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aDzmOhDZaXLCW/8hpJVZMryhV9fimUQIuyXAXNaVEykCko0DEuCWEbGqNKyQ8bW2i
	 6soB9X/N7JlMqMxUAp0RUqH7mOMfCMLQqTE2hxjoppHzIszknH0r+88LVM1GE8vkku
	 hb+pW8rH0sz3CDXJd6mo1BcoeyrKGtwklGmoHpSk=
Date: Thu, 15 Jan 2026 12:30:02 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Minu Jin <s9430939@naver.com>
Cc: ovidiu.panait.oss@gmail.com, gshahrouzi@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	lkp@intel.com
Subject: Re: [PATCH v2 2/2] staging: axis-fifo: Use bulk I/O accessors for
 data transfers
Message-ID: <2026011527-poking-comrade-2e43@gregkh>
References: <20260115022509.3038062-1-s9430939@naver.com>
 <20260115022509.3038062-2-s9430939@naver.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115022509.3038062-2-s9430939@naver.com>

On Thu, Jan 15, 2026 at 11:25:09AM +0900, Minu Jin wrote:
> Replace manual for loops with ioread32_rep/iowrite32_rep.
> Add axis_fifo_read_data() and axis_fifo_write_data() wrappers to
> encapsulate these block-transfer operations.
> 
> No functional changes intended
> 
> Reported-by: kernel test robot <lkp@intel.com>

The test robot reported that this needs to be replaced?  Or did it just
report a problem in your previous submission?  If the latter, then
there's no need to add that here as that really doesn't make sense.

thanks,

greg k-h
