Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61E81FBA
	for <linux-staging@lists.linux.dev>; Tue, 12 Apr 2022 13:38:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F87AC385A1;
	Tue, 12 Apr 2022 13:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1649770728;
	bh=If4KJxS1/AVf307xWkNZDRnv4N5rmqUpTEKgaBEdAsY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y7esKDYjUXe0+ELyCyQfNazoS1s5EBVql/1k7Jpr+CgQLqu6dWGk98m30pJl1klQy
	 ON6oRW1/Eo4aCzDefZ6DUd49Y2WuuIKgbFul9C9XkctvAjZeoxxN087dlfTqM+rJ34
	 SoSxSmpIIaF4w4SAkmXbA3C9CPO9r5/Pm3PY905s=
Date: Tue, 12 Apr 2022 15:38:45 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Martin Kaiser <martin@kaiser.cx>
Cc: Dan Carpenter <dan.carpenter@oracle.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/8] staging: r8188eu: don't set _SUCCESS again
Message-ID: <YlWA5XkVDd9UJ81v@kroah.com>
References: <20220409151557.207980-1-martin@kaiser.cx>
 <20220409151557.207980-3-martin@kaiser.cx>
 <20220411101834.GW3293@kadam>
 <20220411183918.4mw5x6tatslii7mg@viti.kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220411183918.4mw5x6tatslii7mg@viti.kaiser.cx>

On Mon, Apr 11, 2022 at 08:39:18PM +0200, Martin Kaiser wrote:
> Thus wrote Dan Carpenter (dan.carpenter@oracle.com):
> 
> > On Sat, Apr 09, 2022 at 05:15:51PM +0200, Martin Kaiser wrote:
> > > ret is initialized to _SUCCESS, there's no need to set it again.
> 
> > > Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> 
> > I liked the original code better.  Otherwise you wonder, is it
> > intentional to return success on this path. 
> 
> You're right. The original code is easier to understand. It's not
> obvious that this check should return _SUCCESS and the remaining ones
> return _FAIL.
> 
> Greg, could you drop this patch or should I resend the series without
> this patch?

Please resend without this one.

thanks,

greg k-h
