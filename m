Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C908F49
	for <linux-staging@lists.linux.dev>; Tue, 12 Sep 2023 13:58:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF466C433C7;
	Tue, 12 Sep 2023 13:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1694527115;
	bh=Qxb5OeTFeZ+ZsKrEJy9GrxtMSRsKIsYqXQ1sY/E0zrQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m3S/9wa8C+0PNOA2/qZ6y8P62t+7OJkIGaIYJTx/KDIE/HMy2QtLW+baUXfgnub2b
	 ImFP3M+BWIIIX7eWi9GAN4MSBszKVnBd0Fg8pGqBpG+xPdY+BBEuMc3i6wq22rRD2s
	 fFrLHdI9vY79hnUIkbZyNxBbbN0twCDo/STjX8Dg=
Date: Tue, 12 Sep 2023 15:58:32 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Pavan Bobba <opensource206@gmail.com>
Cc: Forest Bond <forest@alittletooquiet.net>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] staging: vt6655: Type encoding info dropped from
 array name "byVT3253B0_"
Message-ID: <2023091210-wok-laziness-b64e@gregkh>
References: <ZP8Iu+Hh8YD+VhYH@ubuntu.myguest.virtualbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZP8Iu+Hh8YD+VhYH@ubuntu.myguest.virtualbox.org>

On Mon, Sep 11, 2023 at 06:01:55PM +0530, Pavan Bobba wrote:
> Array names starting with "byVT3253B0_" updated like below:
> 
> a.type encoding info dropped from names
> b.camelcase names replaced by snakecase
> 
> Issue found by checkpatch
> 
> Signed-off-by: Pavan Bobba <opensource206@gmail.com>
> ---
> 
>  v1 -> v2: Name of the tool added in the body of explanation,
>            which found this issue
> 
>  v2 -> v3: subject modified to more specific detail
> 
>  v3 -> v4: changelog modified as per patch submission guidelines
> 

I see 2 v4 patches on the mailing list, sent on different days.  Which
one is correct?

I'll drop both and wait for a v5.

thanks,

greg k-h
