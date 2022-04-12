Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B679B1FA1;
	Tue, 12 Apr 2022 04:57:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8E10C385A1;
	Tue, 12 Apr 2022 04:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1649739434;
	bh=L1NutSiSa9tUlI/WgF41v5kwoq1ZhvNvo0ryAQDw26s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NRN6jm7mBVoQv5Et9CeZMtG57b9+Hwynzv7QrQsDxxjbnMxox8EG3lCn0CMgiCZEF
	 JvzezXjoB8EX7cJTszpMsBAsC0cxsE5zgmnc1TDMGsqTWOss6b8ffjIuhUeWI7PQ9R
	 sFycCrDi8c9sEV9RnArFeAccVTVHb3Rg8kKMwbho=
Date: Tue, 12 Apr 2022 06:57:11 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jaehee Park <jhpark1013@gmail.com>
Cc: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Subject: Re: [PATCH] staging: greybus: replace zero-element array with
 flexible-array
Message-ID: <YlUGp+/BzMSm3oDC@kroah.com>
References: <20220411211411.GA2796005@jaehee-ThinkPad-X1-Extreme>
 <YlUGbFs8oNikJCcv@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YlUGbFs8oNikJCcv@kroah.com>

On Tue, Apr 12, 2022 at 06:56:12AM +0200, Greg Kroah-Hartman wrote:
> On Mon, Apr 11, 2022 at 05:14:11PM -0400, Jaehee Park wrote:
> > Zero-length and one-element arrays are deprecated. Flexible-array
> > members should be used instead. Flexible-array members are
> > recommended because this is the way the kernel expects dynamically
> > sized trailing elements to be declared.
> > Refer to Documentation/process/deprecated.rst.
> > 
> > Change the zero-length array, buf, in the struct 
> > gb_usb_hub_control_response to a flexible array. And add wLength as a 
> > member of the struct so that the struct is not a zero-sized struct.
> > 
> > Issue found by flexible_array coccinelle script.
> > 
> > Signed-off-by: Jaehee Park <jhpark1013@gmail.com>
> > ---
> > 
> > I have a question for the authors: 
> > I saw a fixme comment in the hub_control function in usb.c:
> > / FIXME: handle unspecified lengths /
> > 
> > I was wondering why this comment was left there?
> > 
> > In this patch, I'm using this struct:
> > 
> > struct gb_usb_hub_control_response {
> >     __le16 wLength;
> >     u8 buf[];
> > };
> > 
> > And instead of using response_size, I'm doing this:
> > 
> > struct gb_usb_hub_control_response *response;
> > And using sizeof(*response) as the input to gb_operation_create.
> > 
> > Would the flexible array address the handling of unspecified lengths 
> > issue (in the fixme comment)?
> 
> No, you can not change the format of the data on the bus without also
> changing the firmware in the device and usually the specification as
> well.
> 
> >  drivers/staging/greybus/usb.c | 7 +++----
> >  1 file changed, 3 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/staging/greybus/usb.c b/drivers/staging/greybus/usb.c
> > index 8e9d9d59a357..d0b2422401df 100644
> > --- a/drivers/staging/greybus/usb.c
> > +++ b/drivers/staging/greybus/usb.c
> > @@ -27,7 +27,8 @@ struct gb_usb_hub_control_request {
> >  };
> >  
> >  struct gb_usb_hub_control_response {
> > -	u8 buf[0];
> > +	__le16 wLength;
> > +	u8 buf[];
> 
> What is wrong with buf[0] here?
> 
> You can fix this in other ways if you really understand the difference
> between [0] and [] in C.  Please look at many of the other conversions
> if you wish to do this.

And I would not recommend this as an "outreachy introduction task"
unless you understand this.  There are much easier first patch tasks you
can accomplish instead.

good luck!

greg k-h
