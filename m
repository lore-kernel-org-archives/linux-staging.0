Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F17E3FC0
	for <linux-staging@lists.linux.dev>; Mon, 20 Sep 2021 11:50:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 420396108E;
	Mon, 20 Sep 2021 11:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1632138606;
	bh=zQq36pq7rleFs1uOyXpcFPcOgIjdP8YvsOsmALTdTO4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kwYW6QpczncnC5kf5OXZd9f3gcR78KXq+V3Xw6P+yZKveujNc7FMHGU6m2NiOXJge
	 j2WleNdzPVFHvzLkOS2qE1Pw9/OfJcpd0QPUoLYs4NQHee0D0kgcTIMjHSVt0UdG/F
	 xcAaKRp/GBIXRL2ai6WMB3A0xwe0SlZ+MS6nJiyA=
Date: Mon, 20 Sep 2021 13:50:04 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	David Laight <david.Laight@aculab.com>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Martin Kaiser <martin@kaiser.cx>
Subject: Re: [PATCH v8 10/19] staging: r8188eu: rename symbols in rtw_read*()
 and rtw_write*()
Message-ID: <YUh1bBCu644R895r@kroah.com>
References: <20210919235356.4151-1-fmdefrancesco@gmail.com>
 <20210919235356.4151-11-fmdefrancesco@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210919235356.4151-11-fmdefrancesco@gmail.com>

On Mon, Sep 20, 2021 at 01:53:47AM +0200, Fabio M. De Francesco wrote:
> Rename names of variables in rtw_read{8.16.32}() and in
> rtw_write{8,16,32,N}() because of unnecessary 'p' (that probably stand
> for "pointer to") and 'w' (that probably stands for "word"):
> 
>         pio_priv => io_priv;
>         pintfhdl => intfhdl;
>         wvalue => value.

All spaces, nice :)

Anyway, same 'intfhdl' issue here.

thanks,

greg k-h
