Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3424B138A
	for <linux-staging@lists.linux.dev>; Thu, 15 Jun 2023 10:36:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41EA7C433C8;
	Thu, 15 Jun 2023 10:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1686825407;
	bh=Z+/UrCjTJEwpHXg3x8sSXwJU8DdqLCVAEYPIixBuOtA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PZGxKh4VSWuKh0Akzvn/bxzu2m5nWNoOUISwhW7vwMbmuzrY2WYdHt4/coyQ+u/kL
	 YJWxftFfg2jLGg7iNNv6IX9NP3BcvYPJCi38/5RGziCQnN4arAd/y+k3Y6ySManhN0
	 WYbKbexeCv7AttSlWeNY2+O0uMrFha5/IZh0dTgQ=
Date: Thu, 15 Jun 2023 12:36:45 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Yogesh Hegde <yogi.kernel@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] Trivial code cleanup patches
Message-ID: <2023061532-fall-earthy-c429@gregkh>
References: <cover.1686149467.git.yogi.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1686149467.git.yogi.kernel@gmail.com>

On Wed, Jun 07, 2023 at 08:31:19PM +0530, Yogesh Hegde wrote:
> These patches remove variables in the struct rtllib_device that were 
> set only once throughout the driver. Instead of using these variables, 
> the patches modify the relevant code to directly call the corresponding 
> functions, eliminating unnecessary indirection and removing CamelCase.
> The patches are required to be applied in sequence.
> 
> Yogesh Hegde (5):
>   staging: rtl8192e: Remove variable SetWirelessMode
>   staging: rtl8192e: Remove variable SetBWModeHandler
>   staging: rtl8192e: Remove variable LeisurePSLeave
>   staging: rtl8192e: Remove variable InitialGainHandler
>   staging: rtl8192e: Remove DRV_NAME definition in rtllib_debug.h
> 
>  drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c |  4 ++--
>  drivers/staging/rtl8192e/rtl8192e/rtl_core.c   |  4 ----
>  drivers/staging/rtl8192e/rtl819x_HTProc.c      |  8 ++++----
>  drivers/staging/rtl8192e/rtllib.h              |  6 ------
>  drivers/staging/rtl8192e/rtllib_debug.h        |  5 -----
>  drivers/staging/rtl8192e/rtllib_rx.c           |  3 ++-
>  drivers/staging/rtl8192e/rtllib_softmac.c      | 16 +++++++---------
>  drivers/staging/rtl8192e/rtllib_softmac_wx.c   |  9 +++++----
>  8 files changed, 20 insertions(+), 35 deletions(-)
> 
> -- 
> 2.25.1
> 
> 

These break the build, as reported by the test robot, please fix up.

thanks,

greg k-h
