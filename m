Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED36555897
	for <linux-staging@lists.linux.dev>; Sat, 24 Aug 2024 16:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724518798; cv=none; b=kNlRa9UFHf9mKeqFzaFbkKJhJsJUVA2Eja2ewsYd8ealpPA6d1FWmlHR7trgFn3iG3UWZBEjeXRiBYQr3ETtXHvH4frXYUxmLiKoz7foCzfmzarmQ8sONWrNXkGQm5PmTCAf4BPp4+1DrJmrhxlS/fSg+8jA++12MzgrlC6iyqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724518798; c=relaxed/simple;
	bh=lXeQCgFqCwc9junnPX+UHRGX8JYyp8g9h937WdAwc4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M6MJl/3MAN0CMUOE8cizbwJeW0D8cZGNpvia/Ny+Au7Gk//fJkU6287U0kXVjADrl5haZkedT5f+c8vljaBF51ytBvzXUsoS7vWyTXopH6/XYqNg7Ne1jzVURXL7nxoXQqJt5Nnc7UlcRX0KCc/QhtlyPK7a+OXnUdSviQUyF5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SsXYd8qn; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SsXYd8qn"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-20227ba378eso27347715ad.0
        for <linux-staging@lists.linux.dev>; Sat, 24 Aug 2024 09:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724518796; x=1725123596; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FuHiveji2iGcXAoGZFjQjnvmuv4HXmCovzfcy4zrYNw=;
        b=SsXYd8qn7nytrrdcDb/ph42OjHFOoHljLNkxSY70SF28t5fNnlLSRy8+8+2aviyDve
         LU0UX0XIbdVpfG36CH5QjYUGoWeFVYcPlm0EuD0qYdd5cBSgUGmaF8PZLI5CWl1VaAuW
         N3tcNiv3gjDuNfj2yMp4IZwv4nydGpnWfaQyEYxhM8aH5DSvw6xQl72Rcs6CWZS0K7t0
         G4kMspQMgZhdgvncBioRyBL231xb9AXBLnloSsAf6DF9vzye11qGLv9kddxVTFLQuxaH
         7gEZzq87McN6rJR2LKT44LAanCR2YoxzIRfAF4WUuhYoiJ/ORnHaps0GHT6uaXAf8Y+u
         Srcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724518796; x=1725123596;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FuHiveji2iGcXAoGZFjQjnvmuv4HXmCovzfcy4zrYNw=;
        b=dagnWYTwRoTO8Zxr55KH5EC+STCP1z36m8NkfcNvjUOpde0/fj4pC5VWlk7hTPXeoU
         MGDIYsbUZKjOhMyYK+Ze6+TcFnyRrl2x5XzFHhlnQzj4XPotMn4OOGlwtyObisoqs3+p
         VjL1kdd0CfQonFUf71QzkF3CuJSrQfdSC7hAqw4jK93KyByEkhZtuCXkSU4BC5Cuz574
         SBKrzGZ9Wi+9o6ugItc45i4VRVj5gxDP8dno1/6drz8sMcMj4Xbyt1/4QHZzQe4l9C7/
         jsOCKWDiqLSPeONbVPdrnZ4OES6OTk/wXVT30s0btxV1s5B1MPFNJj2wGgHO0h+K4Uqe
         KH5g==
X-Forwarded-Encrypted: i=1; AJvYcCUvRTbfnqZitWbRrZsKXDh87Juwadd1aXPgQes+ziRiASJVINwnDynV088PIcgg7sXJFypRTQoE5RtVv01k@lists.linux.dev
X-Gm-Message-State: AOJu0YzqzfQJZ2OZW4EJTYLYa4BrfGaCuuIfPqdz8dK+hMULVV95oYxl
	uqWYR+Qz+YMv7t6NnQW8GVpCrR3uab5ClCPNkqFMdvFUzq5lp4M+
X-Google-Smtp-Source: AGHT+IHvJPCSZ1L4NU2yIrRUj8XWrmqpuqmf6ZlTkB+V89y0EIDEkUyMOsWqefDwmDw/BaSZMb8nBA==
X-Received: by 2002:a17:903:22cd:b0:1fb:1b16:eb7b with SMTP id d9443c01a7336-2039e469e8amr70973515ad.16.1724518795941;
        Sat, 24 Aug 2024 09:59:55 -0700 (PDT)
Received: from embed-PC.myguest.virtualbox.org ([106.222.233.87])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20385bdc663sm44275575ad.273.2024.08.24.09.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Aug 2024 09:59:55 -0700 (PDT)
Date: Sat, 24 Aug 2024 22:29:49 +0530
From: Abhishek Tamboli <abhishektamboli9@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: tdavies@darkphysics.net, philipp.g.hortmann@gmail.com,
	garyrookard@fastmail.org, linux-staging@lists.linux.dev,
	skhan@linuxfoundation.org, rbmarliere@gmail.com,
	dan.carpenter@linaro.org, christophe.jaillet@wanadoo.fr,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8192e: Replace strcpy with strcat in
 rtl819x_translate_scan
Message-ID: <ZsoRhYeQb4A1yepl@embed-PC.myguest.virtualbox.org>
References: <20240823153411.74142-1-abhishektamboli9@gmail.com>
 <2024082430-unlatch-antennae-0ea7@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024082430-unlatch-antennae-0ea7@gregkh>

On Sat, Aug 24, 2024 at 01:45:00PM +0800, Greg KH wrote:
> On Fri, Aug 23, 2024 at 09:04:11PM +0530, Abhishek Tamboli wrote:
> > Replace strcpy() with strcat() in rtl819x_translate_scan()
> > Also Fix proto_name[] buffer size issue to accommodate all
> > network modes.
> 
> When you say "also" in a changelog text, that's a huge hint that this
> should probably be split up into multiple changes.  Please do that here.
Sure, I'll do it.
> More comments below.
> 
> > Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
> > ---
> > Changes in v2:
> > - Revert the use of strscpy and replaced it with strcat.
> > - Remove the 'pname' and replace it's usage with direct
> > operations on 'proto_name' buffer.
> > 
> >  drivers/staging/rtl8192e/rtllib_wx.c | 13 ++++++-------
> >  1 file changed, 6 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/staging/rtl8192e/rtllib_wx.c b/drivers/staging/rtl8192e/rtllib_wx.c
> > index fbd4ec824084..ec0c4c5bade7 100644
> > --- a/drivers/staging/rtl8192e/rtllib_wx.c
> > +++ b/drivers/staging/rtl8192e/rtllib_wx.c
> > @@ -23,14 +23,14 @@ static const char * const rtllib_modes[] = {
> >  };
> > 
> >  #define MAX_CUSTOM_LEN 64
> > +#define MAX_PROTO_NAME_LEN 10
> 
> Where did this "10" come from?  What sets this limit?  Why not 100?
> 1000?  2?  You get the idea :)
> 
yes, I got it.
> >  static inline char *rtl819x_translate_scan(struct rtllib_device *ieee,
> >  					   char *start, char *stop,
> >  					   struct rtllib_network *network,
> >  					   struct iw_request_info *info)
> >  {
> >  	char custom[MAX_CUSTOM_LEN];
> > -	char proto_name[6];
> > -	char *pname = proto_name;
> > +	char proto_name[MAX_PROTO_NAME_LEN];
> >  	char *p;
> >  	struct iw_event iwe;
> >  	int i, j;
> > @@ -59,13 +59,12 @@ static inline char *rtl819x_translate_scan(struct rtllib_device *ieee,
> >  	}
> >  	/* Add the protocol name */
> >  	iwe.cmd = SIOCGIWNAME;
> > +	/* Initialise proto_name as an empty string*/
> > +	memset(proto_name, '\0', sizeof(proto_name));
> >  	for (i = 0; i < ARRAY_SIZE(rtllib_modes); i++) {
> > -		if (network->mode & BIT(i)) {
> > -			strcpy(pname, rtllib_modes[i]);
> > -			pname += strlen(rtllib_modes[i]);
> > +		if (network->mode & BIT(i))
> > +			strcat(proto_name, rtllib_modes[i]);
> >  		}
> > -	}
> 
> I think the } placement is now incorrect, right?  Did you run checkpatch
> on this change?
Yes, I do run the checkpatch on this change and didn't get any warnings
or errors.

Thanks, for the feedback. I'll do the changes.

Regards,
Abhishek
