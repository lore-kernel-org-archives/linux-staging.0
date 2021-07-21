Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC65670
	for <linux-staging@lists.linux.dev>; Wed, 21 Jul 2021 08:19:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 12A1760725;
	Wed, 21 Jul 2021 08:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1626855575;
	bh=rSPMcqavfaZHJaVAoTYpAUv/15YqukMFmRLnFN5hDns=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K0/gD1mRnrfhmRCmDq+D658f+DH4AoV7oBRyJnvhus33WWabIjAnsF+zxhHetVSBu
	 LT+uB7YWGDZ5XDP3pc7dEKaV1uulupmJFrXrwPZhULQVHeeuRjpnnzbCHUK1GO4QPe
	 7GGhpaU8kKEvNdiivk2YE8466cic/DCR0FtcrBr4=
Date: Wed, 21 Jul 2021 10:19:33 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8188eu: Remove an unused variable and
 some lines of code
Message-ID: <YPfYlf25CtKckRQx@kroah.com>
References: <20210705134151.15143-1-fmdefrancesco@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210705134151.15143-1-fmdefrancesco@gmail.com>

On Mon, Jul 05, 2021 at 03:41:51PM +0200, Fabio M. De Francesco wrote:
> Remove set but unused iw_operation_mode[]. This driver doesn't support
> SIOCSIWRATE.  It just returns zero and does nothing.  Change it to
> return -ENOTSUPP instead.  (This is an API change but we don't expect it
> to break anything).
> 
> Suggested-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> ---
> 
> v1->v2: Delete rtw_wx_set_rate() and its association with command
> SIOCSIWRATE as suggested by Dan Carpenter <dan.carpenter@oracle.com>

Does not apply to my tree :(
