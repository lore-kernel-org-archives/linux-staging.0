Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A871E1B0420
	for <linux-staging@lists.linux.dev>; Sat, 18 Jan 2025 17:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737221409; cv=none; b=I79+UDmzNl2yXpHV3jxzYicC0RskiNgfs5tB8B6sTFX/TzbZv4fJW3Qjx+eLklRwFchIw1TkpuQNLzDyCnUbO5WKUA5ziqZrGvX5HXHWVidTD94BYftoO21OBJTcv8QN56Q1s3wxbZFZVm+0f8kgoJVsamQnjneSvrfaAcFym7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737221409; c=relaxed/simple;
	bh=LnqAzHwVaMwj2hNHjz5Y+Bo0xka8rDl0g/wL7tQngf0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TYaGe2nylTWbfDV3HG//v1w5AEh2fxbFd3UjQgu/ArnXXxzAdLB1htKfBXrFc1Q12of7ETeyqhKJE2sV6E8YIp0Dx86XJ3Y5Fl/08GQPC2lxw1bAjuMNaKGTLcW+edhOp/41CvFnqe7SEBRjcYDlovGEOcUWkb7HfMrO7pfxfxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OdMdQY2O; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OdMdQY2O"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-385ef8b64b3so2735376f8f.0
        for <linux-staging@lists.linux.dev>; Sat, 18 Jan 2025 09:30:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737221406; x=1737826206; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=stgYAQSIvUmK2obsKkbvEGbXHNFzhSSApkGvWu0pmZM=;
        b=OdMdQY2OMcXZ+pPYP4OepsB91cQ4DbMHFGiBRZY7hoU65lsSusmIJLQ2ineQfty4TD
         W7MMKZq0uUqw3aPzW40MEBIEVBeKHnVU4UdKJBvU4MAqG8d0tvRY+OnulDMDsMYmBek+
         fC6bbfN4TkAUig7enF/dbzF0hOry468sA5VvHGg2iLZtbU19uXkcGKriAiG/Y2Fy3xNK
         jQv/83JHPyFkFeArQvB1EFIGbS6c4x54bjP3buAupVnhCI99YQPOjH7KWi33E4cRJg5M
         2IBkA3EkfMQ3h58dvI8dD1jlzEC1qPaRLnPWgjiDZI7ZfNGFClHlJSkpi9maV9cuASHy
         +w0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737221406; x=1737826206;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=stgYAQSIvUmK2obsKkbvEGbXHNFzhSSApkGvWu0pmZM=;
        b=HOjI3InkteNW1WZZQW2KqDsLj63cEjOCZe55FK+s0G2lA7xNUwB4lQrYZ+mxO+u9tX
         9PgR2EXg67Q7CZP3WZgOxvSQcJHMYeA0aJ8c4skzHIQvYOYvks1Qq80rAidT1zjoT72d
         KeVotW36JQiCcwKvaVe2BRC7Ylk4Wf/Ag7EJwWBvNVWcVD8Vx8YYvJ79UP11OCPkmfTe
         i45bIVxg7ooO/wdRSoZcYsSErYlyqZEssM1ipYvm70B+KOKM4R2p8kW+d6/w4Z7+ta+K
         5CIfAnxjtt34wXqateps2QCu+wx2R23GM5O/I6PwRLsmmfprn/Mhbg5trLT25ICyH0eM
         c15Q==
X-Gm-Message-State: AOJu0Yxq7i0aGh/UwXWJj7YJ+JIRZyb/7aCguYNt12gXqbC+MwlaIy7G
	F7AqyqwQW0bk/Jl432wC0KTppdKCrVfVhczXwow9VtO/dJaVHZD/j+A6Hg==
X-Gm-Gg: ASbGncv1siRkgppK60ByuhKIK9L+FI8zuNbAY8aqRzPuMC+dRoN3bsS1pFKKBozESf9
	hE4mFmjG9ELV+8A7KvVvIJchfFzSberZg5HQvzlp7oy2xYsi7BZ2qdvWQe80tsTnS2Sy8pWv+3z
	hBWtv+bU2cCuKgbBn/fUU8JLjtrE8WMUML2zDWRv+woxfQstShMB2aPMKFEAe0eYxIB/DRvnggI
	2JxWt4b5Z6ONDwKXz2mAIKe3b2KbwiHq8Eiu/7K1pgB9qEmrUIfoXNZyZLXZ/VqIO7ZGeSYJsLg
	YZADq1TmLQ==
X-Google-Smtp-Source: AGHT+IGIrn4W7A6Y6GYIOee5aorvXmQxd4WWv/8N7CvYdqkMw/BtNPQCoYNo0aVMHalaQyg7XKqU9w==
X-Received: by 2002:a05:6000:1548:b0:38a:624b:e7fe with SMTP id ffacd0b85a97d-38bf5655d9fmr5922861f8f.7.1737221405631;
        Sat, 18 Jan 2025 09:30:05 -0800 (PST)
Received: from egonzo (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf3221b7fsm5631637f8f.27.2025.01.18.09.30.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2025 09:30:04 -0800 (PST)
Date: Sat, 18 Jan 2025 18:30:03 +0100
From: Dave Penkler <dpenkler@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] staging: gpib: Fix NULL pointer dereference in detach
Message-ID: <Z4vlG3xV3weJC-L4@egonzo>
References: <20250118145046.12181-1-dpenkler@gmail.com>
 <20250118145046.12181-2-dpenkler@gmail.com>
 <2025011830-whoopee-dormitory-82da@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025011830-whoopee-dormitory-82da@gregkh>

On Sat, Jan 18, 2025 at 04:36:15PM +0100, Greg KH wrote:
> On Sat, Jan 18, 2025 at 03:50:45PM +0100, Dave Penkler wrote:
> > When the detach function is called after a failed attach
> > the usb_dev initialization can cause a NULL pointer
> > dereference. This happens when the usb device is not found
> > in the attach procedure.
> > 
> > Remove the usb_dev variable and initialization and change the dev
> > in the dev_info message from the usb_dev to the gpib_dev.
> > 
> > Fixes: fbae7090f30c ("staging: gpib: Update messaging and usb_device refs in agilent_usb")
> > Signed-off-by: Dave Penkler <dpenkler@gmail.com>
> > ---
> >  drivers/staging/gpib/agilent_82357a/agilent_82357a.c | 4 +---
> >  1 file changed, 1 insertion(+), 3 deletions(-)
> > 
> > diff --git a/drivers/staging/gpib/agilent_82357a/agilent_82357a.c b/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
> > index 34d85a1bdb37..2aaccebc3c7b 100644
> > --- a/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
> > +++ b/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
> > @@ -1442,12 +1442,10 @@ static int agilent_82357a_go_idle(gpib_board_t *board)
> >  static void agilent_82357a_detach(gpib_board_t *board)
> >  {
> >  	struct agilent_82357a_priv *a_priv;
> > -	struct usb_device *usb_dev;
> >  
> >  	mutex_lock(&agilent_82357a_hotplug_lock);
> >  
> >  	a_priv = board->private_data;
> > -	usb_dev = interface_to_usbdev(a_priv->bus_interface);
> >  	if (a_priv) {
> >  		if (a_priv->bus_interface) {
> >  			agilent_82357a_go_idle(board);
> > @@ -1459,7 +1457,7 @@ static void agilent_82357a_detach(gpib_board_t *board)
> >  		agilent_82357a_cleanup_urbs(a_priv);
> >  		agilent_82357a_free_private(a_priv);
> >  	}
> > -	dev_info(&usb_dev->dev, "%s: detached\n", __func__);
> > +	dev_info(board->gpib_dev, "%s: detached\n", __func__);
> 
> In the future, these dev_info() lines all need to go away as when
> drivers work properly, they should be quiet.  I'll take this fix for now
> as it's needed, just something to plan on for the future cleanups here.
> 
> thanks,
> 
> greg k-h
OK
thanks,
-dave
