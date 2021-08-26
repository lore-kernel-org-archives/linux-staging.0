Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA21672
	for <linux-staging@lists.linux.dev>; Thu, 26 Aug 2021 10:04:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 621F9610E6;
	Thu, 26 Aug 2021 10:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1629972290;
	bh=uqKb6h0Wiejse2anuZ4qCYAvlJ79825SKg+gZQGrYog=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aQVsZ9JAF3ZrBhI0vq+RuHkxjmM7SrqHupJKh/w5ZsIseHYkATITGV+m1/lJQ6NgW
	 fw+oiW41cYa6pDNP0iU6/MP1CXzDrfginSU2OH6/7rv3Y9yOVJhedvJu/pVpN/qmRa
	 FKTfcNViwfRSWTHkSgWiyKCjPwWLwYtc2Hcgn4LI=
Date: Thu, 26 Aug 2021 12:04:45 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Bryan Brattlof <hello@bryanbrattlof.com>
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] staging: rtl8723bs: remove unused functions
Message-ID: <YSdnPavatnKCVmqy@kroah.com>
References: <20210822204212.2832397-1-hello@bryanbrattlof.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210822204212.2832397-1-hello@bryanbrattlof.com>

On Sun, Aug 22, 2021 at 08:42:58PM +0000, Bryan Brattlof wrote:
> Changes in v2:
>  - Remove build warnings I introduced in the previous version.
> 
> ***
> 
> There is a lot of un-used code and un-needed abstractions leftover
> in this driver from when (I assume) it could be compiled on more than
> one kernel.
> 
> This series removes dead code and is one small step toward
> refactoring how this driver interacts with the SDIO subsystem.
> 

Better, but these are still not threaded properly (some were, patches 1
and 2, but not the rest.)

Please fix up and resend a v3.

thanks,

greg k-h
