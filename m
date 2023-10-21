Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8095C11CB0
	for <linux-staging@lists.linux.dev>; Sat, 21 Oct 2023 19:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="RdFYQVNh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6061EC433C7;
	Sat, 21 Oct 2023 19:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697915803;
	bh=o3hiRg/8G1Iiv0YIVdw4woN39m99Lnio78wd/2HsaNA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RdFYQVNhEje7aE6E2emoV+ek4GRqn0X1zeGzIBQ4AohYqbXx1jG6dfyY5kdPITO5M
	 Xdj3xv+M1fDiUHdq6yWYcVlqjRxQDg/+kE0wtKIm61odc7nzbf/HRxSRzbBUULmNCA
	 fUwt9gwIzcvapF55WH9Ex8nwb8MS60O9i7bvvKfw=
Date: Sat, 21 Oct 2023 21:16:40 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
Cc: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, kumaran.4353@gmail.com
Subject: Re: [PATCH] staging: greybus: Alignment should match open parenthesis
Message-ID: <2023102119-comfort-try-840a@gregkh>
References: <20231021133527.GB12776@ubuntu>
 <2023102147-educator-worry-06f4@gregkh>
 <20231021180634.GA17039@ubuntu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231021180634.GA17039@ubuntu>

On Sat, Oct 21, 2023 at 11:06:34AM -0700, Nandha Kumar Singaram wrote:
> On Sat, Oct 21, 2023 at 04:45:46PM +0200, Greg Kroah-Hartman wrote:
> > On Sat, Oct 21, 2023 at 06:35:27AM -0700, Nandha Kumar Singaram wrote:
> > > greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
> > > linux-kernel@vger.kernel.org, kumaran.4353@gmail.com
> > > Bcc: 
> > > Subject: Re: [PATCH] staging: greybus: Alignment should match open parenthesis
> > > Reply-To: 
> > > In-Reply-To: <2023102131-slacker-lily-28ff@gregkh>
> > > 
> > > On Sat, Oct 21, 2023 at 11:48:32AM +0200, Greg Kroah-Hartman wrote:
> > > > On Thu, Oct 19, 2023 at 02:39:49PM -0700, Nandha Kumar Singaram wrote:
> > > > > Adhere to linux coding style. Reported by checkpatch.pl:
> > > > > CHECK: Alignment should match open parenthesis
> > > > > 
> > > > > Signed-off-by: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
> > > > > ---
> > > > >  drivers/staging/greybus/camera.c | 14 +++++++-------
> > > > >  1 file changed, 7 insertions(+), 7 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/staging/greybus/camera.c b/drivers/staging/greybus/camera.c
> > > > > index cdbb42cd413b..405c8e78aa72 100644
> > > > > --- a/drivers/staging/greybus/camera.c
> > > > > +++ b/drivers/staging/greybus/camera.c
> > > > > @@ -220,7 +220,7 @@ static int gb_camera_operation_sync_flags(struct gb_connection *connection,
> > > > >  }
> > > > >  
> > > > >  static int gb_camera_get_max_pkt_size(struct gb_camera *gcam,
> > > > > -		struct gb_camera_configure_streams_response *resp)
> > > > > +				      struct gb_camera_configure_streams_response *resp)
> > > > >  {
> > > > >  	unsigned int max_pkt_size = 0;
> > > > >  	unsigned int i;
> > > > > @@ -267,8 +267,7 @@ static int gb_camera_get_max_pkt_size(struct gb_camera *gcam,
> > > > >   * Validate the stream configuration response verifying padding is correctly
> > > > >   * set and the returned number of streams is supported
> > > > >   */
> > > > > -static const int gb_camera_configure_streams_validate_response(
> > > > > -		struct gb_camera *gcam,
> > > > > +static const int gb_camera_configure_streams_validate_response(struct gb_camera *gcam,
> > > > 
> > > > Why change this line?
> > > >
> > > did these Code change to fix CHECK: Lines should not end with a '(' reported by
> > > checkpatch.pl
> > 
> > That's great, but you didn't say that in your changelog text, so it
> > looks wrong here :(
> > 
> > thanks,
> > 
> > greg k-h
> 
> Sorry for missing that, will add and send the updated patcha

Careful, remember to only do one logical thing per patch.

good luck!

greg k-h
