Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32AD068
	for <linux-staging@lists.linux.dev>; Wed, 24 Nov 2021 10:00:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CDC4D60FDA;
	Wed, 24 Nov 2021 10:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1637748049;
	bh=tyGWagdxSjAUpuZKgMwcoDlBrFsjxt1/LSWCau1pYkk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y2DyOvSMgLbXInhTzfa997izKe6tFXhBCFpgTAHlojISeHZNDva2zgoULjlcJtNmg
	 ThcI65dj6+zrb9sJUtpry5pyRExUOrEoRi/X3+euhqnmhLrXgo0TN3U8L0IoVhnDET
	 W/359WxRRP/PuraExZSUT98W8B+hGbroKU7M9RGk=
Date: Wed, 24 Nov 2021 11:00:45 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Zoeb Mithaiwala <zoebm@google.com>
Cc: trivial@kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 2/2] Staging: rtl8712: rtl871x_security: fixed a camel
 case variable name coding style issue
Message-ID: <YZ4NTZBtLoizblt/@kroah.com>
References: <YZixPDg8kKHZrGJB@kroah.com>
 <20211120111151.1086970-1-zoebm@google.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211120111151.1086970-1-zoebm@google.com>

On Sat, Nov 20, 2021 at 11:11:51AM +0000, Zoeb Mithaiwala wrote:
> Changed additional 'n' from variable name. Corrected comment indentation.
> 
> Signed-off-by: Zoeb Mithaiwala <zoebm@google.com>
> ---
>  drivers/staging/rtl8712/rtl871x_security.c | 12 ++++++------
>  drivers/staging/rtl8712/rtl871x_security.h |  6 +++---
>  2 files changed, 9 insertions(+), 9 deletions(-)

Where is patch 1/2 of this series?  I only received patch 2/2

thanks,

greg k-h
