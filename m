Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B2F33DA
	for <linux-staging@lists.linux.dev>; Tue, 13 Sep 2022 13:53:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9FA7C433D6;
	Tue, 13 Sep 2022 13:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1663077212;
	bh=aup2nwX3kkZwT2fpjNlwE5UG1xXwi8SrWSRqDOplkjQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tfbWd0RBZMbNshwdkuNQn++nN9X0RLPcaK60s3OCX//2cV+ZO4x8O1r8IngPrFCEz
	 ywY+7pZvFCQQR5xXodV7/KoWSnkkbifRNW4BKYyMTp8yTZu9yGMI6f0SOyV6Uy0K1X
	 JwvOSOkxeGU/ibG51pKAWbCmCl2sj/cw61zPjs7g=
Date: Tue, 13 Sep 2022 15:53:56 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Johan Hovold <johan@kernel.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org,
	stable <stable@kernel.org>
Subject: Re: [PATCH] staging: greybus: audio_helper: remove unused and wrong
 debugfs usage
Message-ID: <YyCLdCsGouLie1/E@kroah.com>
References: <20220902143715.320500-1-gregkh@linuxfoundation.org>
 <YyCAaaLuT5s1Jhy2@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YyCAaaLuT5s1Jhy2@hovoldconsulting.com>

On Tue, Sep 13, 2022 at 03:06:49PM +0200, Johan Hovold wrote:
> On Fri, Sep 02, 2022 at 04:37:15PM +0200, Greg Kroah-Hartman wrote:
> > In the greybus audio_helper code, the debugfs file for the dapm has the
> > potential to be removed and memory will be leaked.  There is also the
> > very real potential for this code to remove ALL debugfs entries from the
> > system, and it seems like this is what will really happen if this code
> > ever runs.  This all is very wrong as the greybus audio driver did not
> > create this debugfs file, the sound core did and controls the lifespan
> > of it.
> 
> Yeah, this looks very broken indeed.
> 
> > So remove all of the debugfs logic from the audio_helper code as there's
> > no way it could be correct.  If this really is needed, it can come back
> > with a fixup for the incorrect usage of the debugfs_lookup() call which
> > is what caused this to be noticed at all.
> 
> > Cc: Johan Hovold <johan@kernel.org>
> > Cc: Alex Elder <elder@kernel.org>
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Cc: greybus-dev@lists.linaro.org
> > Cc: linux-staging@lists.linux.dev
> > Cc: stable <stable@kernel.org>
> > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
> I know this has already been applied, but still:
> 
> Acked-by: Johan Hovold <johan@kernel.org>

Thanks for the review, much appreciated.

greg k-h
