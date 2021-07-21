Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C4870
	for <linux-staging@lists.linux.dev>; Wed, 21 Jul 2021 08:18:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 652C96120A;
	Wed, 21 Jul 2021 08:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1626855517;
	bh=z2equphG3PLJALWqpeve2io1ixFxOq5eYXLDsLQ3NQg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dEwCFAB0b+qQUtcpNrTg0XsEuz1hN0R/qeTkzjZ8OLU6bbGjoSKbHA2kvFVb94XIZ
	 ZY+n7tAxVjLnsFd7xOgy5OFqqfR/0bzJTcU2En/6ReE9Fh4JMUmkwBxJytTob75cVR
	 33TDPWUzPMD7XWSNWDGMl7OMgmugzbgiJr2tRMFk=
Date: Wed, 21 Jul 2021 10:18:34 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8188eu: core: Remove set but unused variable
Message-ID: <YPfYWk5afrgGecDR@kroah.com>
References: <20210701154647.18975-1-fmdefrancesco@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210701154647.18975-1-fmdefrancesco@gmail.com>

On Thu, Jul 01, 2021 at 05:46:47PM +0200, Fabio M. De Francesco wrote:
> Remove variable sec_idx because is set but unused. Issue detected by
> GCC with -Wunused-variable.
> 
> Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> ---
>  drivers/staging/rtl8188eu/core/rtw_ieee80211.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

Does not apply to my tree :(
