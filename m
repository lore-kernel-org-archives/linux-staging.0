Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E0E3F44D0;
	Tue,  7 Jul 2026 11:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783423277; cv=none; b=mvC9DF03w+JM9VVBBQ9gLFSwpUsYdLI9xHulpkoUJtaEHqsHxNxw2U4EJ9NFpgUZxAkwvSWJfp12u50eev99LXpCiojlC2A8tRcXm1DsMSV9cu3LLhndBOoGIgUC4b6P8TZgLp+R/20BvXP/jtwULaVZyXwYfTwF66rM8k/YHZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783423277; c=relaxed/simple;
	bh=OTyZ1Q9R7sWinmGqBcfxxSCHypzeH2UEvzYNAkdQN2w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y2QoMrnOvwb5aTNmb4cKFGGupGPOUKJEnDS9BJbRuEZPdpMuCn6l4r0c0p35ki7oufKyvwQU2qooR/fjfWN3TOTJqmEDSa+tlxiPecEaHwRxhSDuGHRTl50R4GUQLy/5oMqUYu4+YKu0+pa7B3AEZZhYJj2RrSRo/0mrDRRN7Zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=qjZpXOU/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="qjZpXOU/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF31F1F00A3A;
	Tue,  7 Jul 2026 11:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783423276;
	bh=kXxbJSeWgLQBooFobNbkFvWYJcdVyZLjV4vOVJCEC+A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=qjZpXOU/GmViIOxGv80l+jpgQ3eh+k9PD5XanEYF0WQSydfg2zk5N5O2YTkAJm9Wg
	 up8Dd2mOVaZVprEH/S5gBct3D067LuNlAkaMD1aG9Bqmpcu99AoDAjvy+/2B10vrv3
	 hZqrmcbX1Ly7bxpRYZk/gQQXu9UfcZb7WbQArIrg=
Date: Tue, 7 Jul 2026 13:21:13 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: fix spaces preferred fix
Message-ID: <2026070706-flatly-scoop-1868@gregkh>
References: <ajUOSj9A8AUxNZQC@koolguy>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ajUOSj9A8AUxNZQC@koolguy>

On Fri, Jun 19, 2026 at 09:39:22AM +0000, Dalvin-Ehinoma Noah Aiguobas wrote:
> Adding spaces around operators to match kernel coding style.
> 
> Signed-off-by: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 196 +++++++++---------
>  1 file changed, 98 insertions(+), 98 deletions(-)

DOes not apply to the latest tree :(
