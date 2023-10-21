Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF6DD291
	for <linux-staging@lists.linux.dev>; Sat, 21 Oct 2023 18:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h4TWIsfs"
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3b2f5aed39cso1330519b6e.1
        for <linux-staging@lists.linux.dev>; Sat, 21 Oct 2023 11:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697911601; x=1698516401; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qUzqqyc66JMYlS7ayqT1z7znMFxZmcvmwm8m+LXNCLI=;
        b=h4TWIsfs7mTyU81MZ9mRs035/KGgcrQ9EwTTwlAWz5sP0NYZVsL/Kjbom3A49Um42f
         J7t8gkbjCtDomdBAuJfh6fh1GENNtRe4PudOdo60Yf5e9UStkHovTtnHtjQ7FtpjZsbn
         pV3+2KYblJS7zMQnzjm6PTT4ys5N/wp8sshFqGCG+o4KmC3KVpmurh2z3bqrPE8xEb4i
         4oiHjc4S9qQ/Fr8ik/vjHCHmgPaeTO4c0poiEmKagSzZarCfAywYC9oPL4DzjsXgPdmh
         cnTg5rgfgMCLR/Jrs1LBybkabyHjmdO1p5/XzDGwJq+qtUtduO67EwwqlPnXDTWIWMJ+
         ndcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697911601; x=1698516401;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qUzqqyc66JMYlS7ayqT1z7znMFxZmcvmwm8m+LXNCLI=;
        b=dCx332GvvQwr78FQcCQ47P/3g7CHa7jmhrhNFTgxQKBzk4bWSmYoOaChvJEZYXl1FY
         ftfNrrR8mg4JsGurTjPAdEQU1i5Jc+bBGmjlERANFScRCnjmOH/huSVKNexbTUU+M4It
         w6z77ruXC45Uvcd9wXjv0SoXalvnu5mAtkta28R5DnV5mKA77I57wjmeL2wN/Q05pXWI
         p/vqFp0fvL08D1hSwojZKoFUTmx77WuUUpukaICMwttJbMF5eQ+82YV5LUJaSZWgJR50
         tbJHAim7rfUWsRoSLvq9IjlJ9NWaUT4VNss+6qipasg+4FVfdb7k77hMTShmFkETVawr
         NhXg==
X-Gm-Message-State: AOJu0Yxb5V4FKlGbL8HsF/1m8zzrBMcII/2tOlpeF8AbL5PtWr/15UV0
	SZuIGyQM87LBHHKTnkrT+D4=
X-Google-Smtp-Source: AGHT+IFV9OUT+QBGHAwcURd/bz/8xcbxn3EgnWhtBo6XXAGKsF9WmQhMZLZtFmiSxwIPRFhIHC4ByA==
X-Received: by 2002:a05:6808:222a:b0:3b2:e9ab:68e6 with SMTP id bd42-20020a056808222a00b003b2e9ab68e6mr7246790oib.0.1697911601268;
        Sat, 21 Oct 2023 11:06:41 -0700 (PDT)
Received: from ubuntu ([122.167.9.184])
        by smtp.gmail.com with ESMTPSA id d15-20020a65620f000000b0057e7ae47893sm2945165pgv.47.2023.10.21.11.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Oct 2023 11:06:40 -0700 (PDT)
Date: Sat, 21 Oct 2023 11:06:34 -0700
From: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, kumaran.4353@gmail.com
Subject: Re: [PATCH] staging: greybus: Alignment should match open parenthesis
Message-ID: <20231021180634.GA17039@ubuntu>
References: <20231021133527.GB12776@ubuntu>
 <2023102147-educator-worry-06f4@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023102147-educator-worry-06f4@gregkh>

On Sat, Oct 21, 2023 at 04:45:46PM +0200, Greg Kroah-Hartman wrote:
> On Sat, Oct 21, 2023 at 06:35:27AM -0700, Nandha Kumar Singaram wrote:
> > greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
> > linux-kernel@vger.kernel.org, kumaran.4353@gmail.com
> > Bcc: 
> > Subject: Re: [PATCH] staging: greybus: Alignment should match open parenthesis
> > Reply-To: 
> > In-Reply-To: <2023102131-slacker-lily-28ff@gregkh>
> > 
> > On Sat, Oct 21, 2023 at 11:48:32AM +0200, Greg Kroah-Hartman wrote:
> > > On Thu, Oct 19, 2023 at 02:39:49PM -0700, Nandha Kumar Singaram wrote:
> > > > Adhere to linux coding style. Reported by checkpatch.pl:
> > > > CHECK: Alignment should match open parenthesis
> > > > 
> > > > Signed-off-by: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
> > > > ---
> > > >  drivers/staging/greybus/camera.c | 14 +++++++-------
> > > >  1 file changed, 7 insertions(+), 7 deletions(-)
> > > > 
> > > > diff --git a/drivers/staging/greybus/camera.c b/drivers/staging/greybus/camera.c
> > > > index cdbb42cd413b..405c8e78aa72 100644
> > > > --- a/drivers/staging/greybus/camera.c
> > > > +++ b/drivers/staging/greybus/camera.c
> > > > @@ -220,7 +220,7 @@ static int gb_camera_operation_sync_flags(struct gb_connection *connection,
> > > >  }
> > > >  
> > > >  static int gb_camera_get_max_pkt_size(struct gb_camera *gcam,
> > > > -		struct gb_camera_configure_streams_response *resp)
> > > > +				      struct gb_camera_configure_streams_response *resp)
> > > >  {
> > > >  	unsigned int max_pkt_size = 0;
> > > >  	unsigned int i;
> > > > @@ -267,8 +267,7 @@ static int gb_camera_get_max_pkt_size(struct gb_camera *gcam,
> > > >   * Validate the stream configuration response verifying padding is correctly
> > > >   * set and the returned number of streams is supported
> > > >   */
> > > > -static const int gb_camera_configure_streams_validate_response(
> > > > -		struct gb_camera *gcam,
> > > > +static const int gb_camera_configure_streams_validate_response(struct gb_camera *gcam,
> > > 
> > > Why change this line?
> > >
> > did these Code change to fix CHECK: Lines should not end with a '(' reported by
> > checkpatch.pl
> 
> That's great, but you didn't say that in your changelog text, so it
> looks wrong here :(
> 
> thanks,
> 
> greg k-h

Sorry for missing that, will add and send the updated patch.

Regards,
Nandha Kumar
