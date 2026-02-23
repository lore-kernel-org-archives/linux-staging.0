Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C361F2B8D;
	Mon, 23 Feb 2026 13:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771854893; cv=none; b=mPnqOkF6jCFqgMfLOs5JsE4fHNsB305eCMSWjz04A+wQwV8Rvwlut0z28r2NwmSMqCLOB1a7Ew+nLXNRlJPZSe4IjjAriWv+KVMkrqrdxGkPGw0sA4Wn6C7ClhRgWTMfGR0JI/F1to6mCFWF4SJpyOuNzG3uQTRYCOWyzajSbsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771854893; c=relaxed/simple;
	bh=gA0W0NEXSUpUi1GRxkCf2xS2nGA5tG1NEYgLOBviZhc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jBMHtcVUTPLKt7ft4B6FnNgiwJXcVrBNWyrN1855+xRLHStSUZ5X8cbB2hqI0MAtFTkU0vhEK8UT1nN62cqiaKDY+q2e8/MnJbgUYN7oY7kih5TZdXe+FXjqLLIrymspEs+vjfwIZFnqo1FSVAUzableGyDUNBR06zXfSV+Omfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=abnEpa4j; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="abnEpa4j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19C73C116D0;
	Mon, 23 Feb 2026 13:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1771854892;
	bh=gA0W0NEXSUpUi1GRxkCf2xS2nGA5tG1NEYgLOBviZhc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=abnEpa4jWzdlqD0cynQBSZFk+/OZWCOU+pnLD0+2JeXm7p+4C24YSrkIIP8+qUnul
	 eLxDdmRisZXW4msEshLT7kJttFpNN/Q4BIOVCYuDQrjEj+u1hFdi7+LB81dhjDJlls
	 SzcopLAoluJ1bwoarjNcUbnq/L9zc8IWXYLlLGPY=
Date: Mon, 23 Feb 2026 14:54:33 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Hardik Phalet <hardik.phalet@pm.me>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] staging: greybus: audio: fix NULL dereference in
 gb_audio_manager_get_module()
Message-ID: <2026022310-unleaded-scoundrel-d443@gregkh>
References: <20260220062741.399677-1-hardik.phalet@pm.me>
 <20260220062741.399677-2-hardik.phalet@pm.me>
 <aZgWffV8wwa3MDW1@stanley.mountain>
 <DGJPGRAT9SXJ.1JK6YJQ9SJLNT@pm.me>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DGJPGRAT9SXJ.1JK6YJQ9SJLNT@pm.me>

On Fri, Feb 20, 2026 at 10:09:33AM +0000, Hardik Phalet wrote:
> On Fri Feb 20, 2026 at 1:38 PM IST, Dan Carpenter wrote:
> > On Fri, Feb 20, 2026 at 06:30:10AM +0000, Hardik Phalet wrote:
> >> gb_audio_manager_get_module() calls gb_audio_manager_get_locked(), which
> >> can return NULL when the requested id does not exist. The returned
> >> pointer is dereferenced unconditionally via kobject_get(), leading to a
> >> NULL pointer dereference.
> >>
> >> Only take a kobject reference when the module is found.
> >>
> >> Signed-off-by: Hardik Phalet <hardik.phalet@pm.me>
> >> ---
> >>  drivers/staging/greybus/audio_manager.c | 3 ++-
> >>  1 file changed, 2 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/staging/greybus/audio_manager.c b/drivers/staging/greybus/audio_manager.c
> >> index 27ca5f796c5f..1da8804e61ca 100644
> >> --- a/drivers/staging/greybus/audio_manager.c
> >> +++ b/drivers/staging/greybus/audio_manager.c
> >> @@ -111,7 +111,8 @@ struct gb_audio_manager_module *gb_audio_manager_get_module(int id)
> >
> > I don't think this gb_audio_manager_get_module() function is ever
> > called.  If it is then we need a Fixes tag.
> >
> > regards,
> > dan carpenter
> 
> Thanks for pointing that out.
> 
> I double-checked and could not find any in-tree callers for
> gb_audio_manager_get_module(), so this appears to be dead code and the
> NULL dereference is not reachable today.
> 
> Would you prefer that I drop this fix, or should I follow up with a
> cleanup patch?

Redo the series and just remove the unused functions entirely.

thanks,

greg k-h
