Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57DC12F28FB;
	Tue,  3 Feb 2026 08:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770106746; cv=none; b=YQCuOAeqLBIlgCG1nd30+vQOzJ/w0I2PvVKquQGNUCoEAiC0S+D/PSwrhE926jNR66HzVMhRHeat6Mwu0YMk3kKcV2vQdb7V7XOTYELZl9/17qdAfK+KLd/G2ee3AqrFLH9/zww7kTKtmdwxS+wvl+xBAOP2AgRZPWEH3Asmrwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770106746; c=relaxed/simple;
	bh=RA4rtqcKx/o4Cu2K/1Kx30/URhlgeVomWVXlVQmUWV0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z8hoJm6SIzg4dE6WAmtB/byx7dqtR+atwwvjYo45Mnqi2o40yWGw75A4FAPwBDfajUwDipLfUJabBhUgLPdqAlggwdgYNIbogVT5KheVFcWeMy/3dEnoKe+2zB+exc7srap9H8tJgA6x4giyv87dvZlVDeiAaprxtBJKN7uMtbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=wa9ggy4z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="wa9ggy4z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42A0BC116D0;
	Tue,  3 Feb 2026 08:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770106745;
	bh=RA4rtqcKx/o4Cu2K/1Kx30/URhlgeVomWVXlVQmUWV0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wa9ggy4zjjfMog7FtFKvzpubw5BknQcYNZsVbIKXMHl77mQlRWs/FEq+SkAxd7ZOL
	 UHI8hKtqVwgWoSd74wRV4H4ddEBXAwOWxblFDd3z6w0MJ/AzSO4TFiwp/ZMMhcogfF
	 zoz4MXsO1C9OAuSs7y1Z1r4XHelUnpNYakDyNGQg=
Date: Tue, 3 Feb 2026 09:19:02 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Gustavo Piaz da Silva <gustavopiazdasilva2102@gmail.com>
Cc: dan.carpenter@linaro.org, ovidiu.panait.oss@gmail.com,
	gshahrouzi@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/2] staging: axis-fifo: refactor and cleanup
Message-ID: <2026020349-laxative-thinness-e64c@gregkh>
References: <20260202142047.30704-1-gustavopiazdasilva2102@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202142047.30704-1-gustavopiazdasilva2102@gmail.com>

On Mon, Feb 02, 2026 at 11:20:45AM -0300, Gustavo Piaz da Silva wrote:
> This series cleans up the axis-fifo driver probe function logic.
> 
> Patch 1 aligns the struct types with the OF API.
> Patch 2 refactors the parsing logic to be simpler and less verbose.

Please slow down.  One patch series every few days at the most,
otherwise you are not allowing yourself to actually get review comments
from people, and you just move your changes further down the queue.

There's no rush here, relax, take a few days off, and think about what
you are wanting to do here before sending a new version.

thanks,

greg k-h
