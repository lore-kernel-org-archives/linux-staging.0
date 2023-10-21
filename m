Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA53AC8F3
	for <linux-staging@lists.linux.dev>; Sat, 21 Oct 2023 13:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NwIlniwc"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1ca72f8ff3aso12303595ad.0
        for <linux-staging@lists.linux.dev>; Sat, 21 Oct 2023 06:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697895332; x=1698500132; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AsKAD0VhAPmzCctVVdKp45X+1iQVX0c5X8MLMjRCHgY=;
        b=NwIlniwcbnxHOj9TMPm+MxrX6ENvT35plUCkzDPgylvT+kEkuUTwn2aWqdqguVmJFx
         6vcJl+jggHRW3T34+EJBnC9m79FGvHAg3XNKBTM5wVYiBG1lz6vUn9SFOd1mqfkzKLgf
         2s6WATvHtPX9Gvv7IgscRsZimVplT3osL0xkg5uqe3ulwl9b1PlVe1MA+hylhnqQTTiD
         CXUVByiis6/YqOvxX1t9ZaLle/eGXNZ2x9SVM0pBZpiScsqpAhvgtD1cUoepfLvFxUhZ
         tg0VJTYptPA3rK82LXCM/GysfdeQmJha7f2l/P/phFmDWED3YAU6ho8IEpb436/F1LAz
         zQHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697895332; x=1698500132;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AsKAD0VhAPmzCctVVdKp45X+1iQVX0c5X8MLMjRCHgY=;
        b=VTdzp2BDoRE2wecd0IXB8B44cqAZMuZ3btUlO201NNQR3N2SN0oRk8CZ2LnG88TS8R
         fRFH6YlMDzPglNkcKlVOYyxkRHx1ly+BVzkutO/rFjnEE/mVIWCPJ2CqA1uiZh9vENct
         1hxis2Ae6xFG15CsQRb4gp96f2G56zm+3fKDRgegHSUwFZZg4ZpNZ/SqPUEF1gxRwQgB
         mWLiZ9cbzDPBqJUqPb/HYeIVbLiG40hIqB+uq0G49o0KN01014ATN0TBOyzrxToys5cJ
         slD4j5sUI7QKgrK8ZF63RxPJu5ZlVVzKpcyjtJED8hOZAb5Dz21X5Zf2tOCN3qYQoQyZ
         rKMg==
X-Gm-Message-State: AOJu0YwQcJuZUBD2pGCVJ1ioJkMMP3jMs3rEVY0CTlQXPPx8msDYV4rT
	J6kLk/bQRg3kq0P2Sjymzp8=
X-Google-Smtp-Source: AGHT+IG7/tbMEfdamoXp/VmbamxwRPF/ONl8l/tI/NBlmfVZMDJBEwW89HUUGTHoMHhSas3xIs2Njw==
X-Received: by 2002:a17:902:e744:b0:1c9:d3ce:e7d3 with SMTP id p4-20020a170902e74400b001c9d3cee7d3mr4144528plf.4.1697895331941;
        Sat, 21 Oct 2023 06:35:31 -0700 (PDT)
Received: from ubuntu ([122.167.9.184])
        by smtp.gmail.com with ESMTPSA id q13-20020a17090311cd00b001ca773d674bsm3175577plh.278.2023.10.21.06.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Oct 2023 06:35:31 -0700 (PDT)
Date: Sat, 21 Oct 2023 06:35:27 -0700
From: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, kumaran.4353@gmail.com
Subject: Re: [PATCH] staging: greybus: Alignment should match open parenthesis
Message-ID: <20231021133527.GB12776@ubuntu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
linux-kernel@vger.kernel.org, kumaran.4353@gmail.com
Bcc: 
Subject: Re: [PATCH] staging: greybus: Alignment should match open parenthesis
Reply-To: 
In-Reply-To: <2023102131-slacker-lily-28ff@gregkh>

On Sat, Oct 21, 2023 at 11:48:32AM +0200, Greg Kroah-Hartman wrote:
> On Thu, Oct 19, 2023 at 02:39:49PM -0700, Nandha Kumar Singaram wrote:
> > Adhere to linux coding style. Reported by checkpatch.pl:
> > CHECK: Alignment should match open parenthesis
> > 
> > Signed-off-by: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
> > ---
> >  drivers/staging/greybus/camera.c | 14 +++++++-------
> >  1 file changed, 7 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/staging/greybus/camera.c b/drivers/staging/greybus/camera.c
> > index cdbb42cd413b..405c8e78aa72 100644
> > --- a/drivers/staging/greybus/camera.c
> > +++ b/drivers/staging/greybus/camera.c
> > @@ -220,7 +220,7 @@ static int gb_camera_operation_sync_flags(struct gb_connection *connection,
> >  }
> >  
> >  static int gb_camera_get_max_pkt_size(struct gb_camera *gcam,
> > -		struct gb_camera_configure_streams_response *resp)
> > +				      struct gb_camera_configure_streams_response *resp)
> >  {
> >  	unsigned int max_pkt_size = 0;
> >  	unsigned int i;
> > @@ -267,8 +267,7 @@ static int gb_camera_get_max_pkt_size(struct gb_camera *gcam,
> >   * Validate the stream configuration response verifying padding is correctly
> >   * set and the returned number of streams is supported
> >   */
> > -static const int gb_camera_configure_streams_validate_response(
> > -		struct gb_camera *gcam,
> > +static const int gb_camera_configure_streams_validate_response(struct gb_camera *gcam,
> 
> Why change this line?
>
did these Code change to fix CHECK: Lines should not end with a '(' reported by
checkpatch.pl

> It's fine, but then:
> 
> >  		struct gb_camera_configure_streams_response *resp,
> >  		unsigned int nstreams)
> 
> These lines are not fixed up?
> 
> thanks,
> 
> greg k-h

Fixing these lines results in another checkpatch check(CHECK: line length 
of 113 exceeds 100 columns) so didn't added any change

Thanks,
Nandha Kumar
