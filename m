Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 524873FC0
	for <linux-staging@lists.linux.dev>; Mon, 20 Sep 2021 11:50:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7E3126108C;
	Mon, 20 Sep 2021 11:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1632138651;
	bh=FC5/WvnXHQZxQUWEHUOw2WKBwIjE1qR8g7D2LZN8p4o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lPooQ1l3E+774gGGqDlfUSof//0AMIaqga2/H24UISk/TOzH0BpXLHhcnDgbF959F
	 q58BhWJ0YpcqAc7uzph+LAvCaol8JnbepOom9sQ8xBx/HiPfdp0GouRev9VysoSjdN
	 kEeEa7/juNIUhpRFpzdmbl6hQpIaIIxUgzjk3zz4=
Date: Mon, 20 Sep 2021 13:50:48 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	David Laight <david.Laight@aculab.com>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Martin Kaiser <martin@kaiser.cx>
Subject: Re: [PATCH v8 12/19] staging: r8188eu: change the type of a variable
 in rtw_write16()
Message-ID: <YUh1mCpdcncATAkC@kroah.com>
References: <20210919235356.4151-1-fmdefrancesco@gmail.com>
 <20210919235356.4151-13-fmdefrancesco@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210919235356.4151-13-fmdefrancesco@gmail.com>

On Mon, Sep 20, 2021 at 01:53:49AM +0200, Fabio M. De Francesco wrote:
> Change the type of "data" from __le32 to __le16.

You are saying _what_ you are doing here, but it is not obvious at all
_why_ you need to do this.

Please explain the why here when you redo this series.

thanks,

greg k-h
