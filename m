Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E647F
	for <linux-staging@lists.linux.dev>; Thu,  5 Oct 2023 07:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="OMIWqYo7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 291BEC43142;
	Thu,  5 Oct 2023 07:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1696492616;
	bh=p3oq5Wv249cq7oz6AShBD6LFkP/SyYsL+Ta6uUFwOtY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OMIWqYo780prfbTmpFj0IZfbX1x4554PW1FxDS9TWU5UPfUbc3p5+45qUO0e6kmqz
	 5ot+32dfYd6+kOvfNWX4EomGgW3fLLPbWFnP7v9c4kLYp5xcxTgUfpyFVKm9pEMCEn
	 kO6sqdAaIz1XwxNHekBi2729kSaekevAHqiwuiIo=
Date: Thu, 5 Oct 2023 09:56:53 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>,
	Pavan Bobba <opensource206@gmail.com>,
	Forest Bond <forest@alittletooquiet.net>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] staging: vt6655: Type encoding info dropped from
 array name "abyBBVGA"
Message-ID: <2023100513-handball-landed-d7ff@gregkh>
References: <ZRWWcGiySdLbCM3z@ubuntu.myguest.virtualbox.org>
 <29dc3df5-f313-f194-7f73-3207215e0864@gmail.com>
 <76e75a6a-b3f5-4f96-a9c6-b01f8f491140@kadam.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <76e75a6a-b3f5-4f96-a9c6-b01f8f491140@kadam.mountain>

On Fri, Sep 29, 2023 at 10:19:53AM +0300, Dan Carpenter wrote:
> On Thu, Sep 28, 2023 at 08:34:40PM +0200, Philipp Hortmann wrote:
> > On 9/28/23 17:06, Pavan Bobba wrote:
> > > array name "abyBBVGA" updated like below:
> > > 
> > > a.type encoding info dropped from name
> > > b.camelcase name replaced by snakecase
> > > 
> > > Issue found by checkpatch
> > > 
> > > Signed-off-by: Pavan Bobba<opensource206@gmail.com>
> > 
> > 
> > A coverletter is missing.
> > 
> 
> The coverletter isn't required, but the more important issue is that the
> patchset wasn't sent as a thread but instead as separate emails.

I agree, our tools can not handl this.

Pavan, please resend these all as a patch series, properly threaded
together.  Tools like 'git send-email' or 'b4' will do this for you
automatically.

thanks,

greg k-h
