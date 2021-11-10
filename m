Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F56A2C81
	for <linux-staging@lists.linux.dev>; Wed, 10 Nov 2021 08:15:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4C57D61076;
	Wed, 10 Nov 2021 08:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1636532120;
	bh=qI7P6LTFX/PIzJyqkpmIJDTbDtNLNqaURf0IuYYimj8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RBsQsjcljl/2u7hM1qx752Y1bN8cpRLugElYh5vBZEkTrFv0ALKmswT1bTPUitkTw
	 0hpDPVLRxi8b6FVoXGycYNDVfEha99T/vCJGF12G4IYPD4dk1CukeeToLI6Kf1+6rV
	 wsrGUncwDpm1IGkUsY1Lw9vMHfQET0Dz00TqgyyI=
Date: Wed, 10 Nov 2021 09:15:18 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Martin Kaiser <martin@kaiser.cx>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Martin Kaiser <martin.kaiser@paytec.ch>
Subject: Re: [PATCH 0/4] staging: r8188eu: clean up the calibration code
Message-ID: <YYt/lkcYBN80g4tU@kroah.com>
References: <20211107143100.9047-1-martin@kaiser.cx>
 <20211107144324.xqoab3imqxawymfz@viti.kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211107144324.xqoab3imqxawymfz@viti.kaiser.cx>

On Sun, Nov 07, 2021 at 03:43:24PM +0100, Martin Kaiser wrote:
> Hello Greg,
> 
> Thus wrote Martin Kaiser (martin@kaiser.cx):
> 
> > From: Martin Kaiser <martin.kaiser@paytec.ch>
> 
> Sorry, the cover letter uses the wrong address.
> The actual patches are ok.
> 
> Could you take the patches anyway or should I resend the series?

No worries, I took these as-is.

thanks,

greg k-h
