Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6056910F4
	for <linux-staging@lists.linux.dev>; Sat, 21 Oct 2023 13:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HTOZbSY3"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1c0ecb9a075so12052375ad.2
        for <linux-staging@lists.linux.dev>; Sat, 21 Oct 2023 06:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697893540; x=1698498340; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=G5f1f0vQfSjdVi/REtt5j0YQgF8soTdJTFMLk1PEhnc=;
        b=HTOZbSY3gjrXScvmSeJ7iy9jtPvj98t0gOUnwl90SB7fzOeyU6dLJUqz8lU1ZF01D7
         ZYfWNHTRQ5qZvrJEx1G/W/3yIPtIh5MDGN8753mOK8/DAo9RW5197TlVMsMvB/DnBcYg
         aQCH1S2Ml3gr3Fns819c4XqQ5+9ZzIbUTsiCN5Gdkmka/YaiAG3dtru2Q6Pz1/10UdOi
         26Dezn6wxKM7mj05Iotc+WNik09ZQQJ+EvyJOPt/kxhvEl8qvpfn6Qu00SsCfI8nmgVm
         wN4koL2zdtD25n6Gf8hGvC0cfyDc82VxvzvS174c37AZzGBjuyn8pxv7kHG/QSt/4E2Z
         5ZhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697893540; x=1698498340;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G5f1f0vQfSjdVi/REtt5j0YQgF8soTdJTFMLk1PEhnc=;
        b=nByNgL+qzYa3KAe5Fb/MiipTjx2y/0IfHgyw1+ltXqYoiIynYMuBtR3kG1SBoSGAmf
         7/zdcxBNYpOTcr3DcBSmqpbvrjDjgeEtSaGxHSlrITAj8jn9OpSH4+mFJNg2F+Tj/hbf
         q2i/anjrkU154kW3m+zD9TrcVu19nR64pFSGMVZOFcWIaTNtgmCs7LbAPlkV6VbNSC+0
         aCU43KcTD3fCDIgJvvt+2Dep4StDW0iEehgNs83yP/zSYEoXmbUI/gPtV/pZCZWyD16A
         EcP7J6Ai9HTddy0XrRtCLiZJg5N86DYyCIPEIDPtSZiCrqUXaX5c2Fp4sZvkpxCUSz+Z
         eyyw==
X-Gm-Message-State: AOJu0YznT91bpOSc1LQ7KrjNIDRY3soqEPPXLC+77p1SFPrxVaNMwH8w
	T+S5RHjfbYA5qV0kZ4PyfmaDrs5HNuYR3Q==
X-Google-Smtp-Source: AGHT+IFHYGt3bF0G2tCnQmvxBHxEud8YIBJqmnRa57y5tilld1MEtDW8BNCG6blbLAEA1bLsnbhCeQ==
X-Received: by 2002:a17:903:2012:b0:1c5:bea4:8537 with SMTP id s18-20020a170903201200b001c5bea48537mr2867431pla.15.1697893540382;
        Sat, 21 Oct 2023 06:05:40 -0700 (PDT)
Received: from ubuntu ([122.167.9.184])
        by smtp.gmail.com with ESMTPSA id j6-20020a170902da8600b001c9c8d761a3sm3130187plx.131.2023.10.21.06.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Oct 2023 06:05:40 -0700 (PDT)
Date: Sat, 21 Oct 2023 06:05:35 -0700
From: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
To: Alex Elder <elder@ieee.org>
Cc: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: Alignment should match open parenthesis
Message-ID: <20231021130535.GA12776@ubuntu>
References: <20231019213949.GA2922@ubuntu>
 <e24e41be-b2c4-4bda-8a34-a628c55c4061@ieee.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e24e41be-b2c4-4bda-8a34-a628c55c4061@ieee.org>

On Thu, Oct 19, 2023 at 07:15:37PM -0500, Alex Elder wrote:
> On 10/19/23 4:39 PM, Nandha Kumar Singaram wrote:
> > Adhere to linux coding style. Reported by checkpatch.pl:
> > CHECK: Alignment should match open parenthesis
> 
> Sometimes checkpatch.pl warns about things that are not
> really that important.  One class of this type of issue
> is white space errors.
> 
> Yes, consistency is good, but the kernel simply doesn't
> have universally consistent conventions, and I doubt
> it ever will.  There might be times where a source file
> consistently follows a white space convention that
> differs from what checkpatch wants.  Suggesting a
> wholesale change to that file to "fix" that typically
> wouldn't be welcome.
> 
> Unfortunately without some experience it's hard to know
> which checkpatch warnings can be safely ignored.  I would
> place white space warnings at a lower priority for fixing
> than some others.  For example, this is also a pretty
> trivial warning:
>   CHECK: Macro argument 'gcam' may be better as '(gcam)' to avoid precedence
> issues
> And it is most likely not a problem in this case, but fixing
> this type of warning is probably more constructive than
> just adjusting white space.
> 
> I have no objection to your patch, and it's a fine way to
> get some experience with the patch process, but I don't
> think this particular change is necessary.
> 
> 					-Alex
> 
> > Signed-off-by: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
> > ---
> >   drivers/staging/greybus/camera.c | 14 +++++++-------
> >   1 file changed, 7 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/staging/greybus/camera.c b/drivers/staging/greybus/camera.c
> > index cdbb42cd413b..405c8e78aa72 100644
> > --- a/drivers/staging/greybus/camera.c
> > +++ b/drivers/staging/greybus/camera.c
> > @@ -220,7 +220,7 @@ static int gb_camera_operation_sync_flags(struct gb_connection *connection,
> >   }
> >   static int gb_camera_get_max_pkt_size(struct gb_camera *gcam,
> > -		struct gb_camera_configure_streams_response *resp)
> > +				      struct gb_camera_configure_streams_response *resp)
> >   {
> >   	unsigned int max_pkt_size = 0;
> >   	unsigned int i;
> > @@ -267,8 +267,7 @@ static int gb_camera_get_max_pkt_size(struct gb_camera *gcam,
> >    * Validate the stream configuration response verifying padding is correctly
> >    * set and the returned number of streams is supported
> >    */
> > -static const int gb_camera_configure_streams_validate_response(
> > -		struct gb_camera *gcam,
> > +static const int gb_camera_configure_streams_validate_response(struct gb_camera *gcam,
> >   		struct gb_camera_configure_streams_response *resp,
> >   		unsigned int nstreams)
> >   {
> > @@ -378,8 +377,8 @@ struct ap_csi_config_request {
> >   #define GB_CAMERA_CSI_CLK_FREQ_MARGIN		150000000U
> >   static int gb_camera_setup_data_connection(struct gb_camera *gcam,
> > -		struct gb_camera_configure_streams_response *resp,
> > -		struct gb_camera_csi_params *csi_params)
> > +					   struct gb_camera_configure_streams_response *resp,
> > +					   struct gb_camera_csi_params *csi_params)
> >   {
> >   	struct ap_csi_config_request csi_cfg;
> >   	struct gb_connection *conn;
> > @@ -783,8 +782,9 @@ static ssize_t gb_camera_op_capabilities(void *priv, char *data, size_t len)
> >   }
> >   static int gb_camera_op_configure_streams(void *priv, unsigned int *nstreams,
> > -		unsigned int *flags, struct gb_camera_stream *streams,
> > -		struct gb_camera_csi_params *csi_params)
> > +					  unsigned int *flags,
> > +					  struct gb_camera_stream *streams,
> > +					  struct gb_camera_csi_params *csi_params)
> >   {
> >   	struct gb_camera *gcam = priv;
> >   	struct gb_camera_stream_config *gb_streams;
> 

Thanks Alex for the review and feedback.

Regards,
Nandha Kumar
