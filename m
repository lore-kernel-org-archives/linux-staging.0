Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F748381A4
	for <linux-staging@lists.linux.dev>; Sat,  6 Apr 2024 22:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712442927; cv=none; b=Q1EiOf08LzzGbwvAcXb0EaRxVDqV3Lho+hD+8IrUOXU2d2hX5YdJ0DWm8cZqJ0k4LPHr8mu3l9hjdm56nOvQgPPjl/qcBwFuRL2xlrpbkEoQ3+IFTvRhgZW+Vm7yfttevuG0G1r35DetVAbbyugX87JqTezS2l85N5K5B+oJdaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712442927; c=relaxed/simple;
	bh=ExTorBXo2Se2/NmYxszJ+H2lEtI10Uh/Yw+rhldhREg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IWT392Ve/9zvYh21lQFJVL6A6XchocVFOteZqt0wttshh3VDb8Za5LQ0YiJiWnrw+sRSJ/vN9dWELbB908xI/95M6+yQsVG04P1IyMuKldApOVdrZq/UJdr8kKa0qkmWxxMjbyMMkPcjKyi8KmBbbfnMOn4GHQUOXpKZZ1GQxEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fnSNTzOo; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fnSNTzOo"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-78d57b9f3caso57046285a.3
        for <linux-staging@lists.linux.dev>; Sat, 06 Apr 2024 15:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712442924; x=1713047724; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GjHnM6vQHjQJFOGaXPhz8ZI07k2GyCIqt2D6nyEj5Bc=;
        b=fnSNTzOoV0pxJf/qU2q0E92QTxUwn+elh5QRBM/ioph2aSFqFQkXe6kIoaUNGU7tzb
         XPJceNoRoIzMKECixA5EvXtiZOMfDODB5jRrU7pL7VSEnRubi7EYorZ/LCdRc1TqVSGB
         Rscrf9A9tfjUsB+Jv28VQn1DrmpqfChMTFKvQDMISmyl8FLGHnB/TW/pd8up3eKkackl
         wkqsMwvIaUmb8hXzBZ74pg6RT5CvQXtGoEbpNsyDyTqrwZdWZxgZz6AmAb3pRPii863L
         5vIKMV3Ioume5FBXRtBQ/D3OudunFduMji3kQcMwb4Nh4X/v4M3ScD+9bNg5NfpARitl
         IS2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712442924; x=1713047724;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GjHnM6vQHjQJFOGaXPhz8ZI07k2GyCIqt2D6nyEj5Bc=;
        b=C8tKc7WNGrO88IXWY1sbtZoE5NMi410N2ynh46bFP5fAVBEoatE71xRhRJ3DSzT86Y
         AKu3TvEbiz1qCA4Kle6ZQ1IzqaPT0WaeW5ajURKmy8E0l+aX7Pixs59jCg5Co/pwaCh5
         vnyZicgCXp+j4IA1Y7pdZQl0XohAHFS81B+QGT2geUiraBVkek0f6e9iVZHjFQGX+Jar
         68iekhirVk6Drt7Dme3dvBJr+xXZypxUJ7tJVvAtRCdvBPo3w6MXBw+Xh5yX1hOwk0mu
         /ivLe31MYfgdp595sKmatzT5GwwcgSqcAc+tj1ia7ZVyjutNaoXDr/tFjGI+KPUCnR36
         0s3w==
X-Forwarded-Encrypted: i=1; AJvYcCWrHMI1d95Td/lPUa9SAXXfWumAkpAEPLGaKDiooB6AyoqAZuAazgcO7WaUdQsfogb1rYiV9i8K05F84mnbUR/CVc4A1rEw7XcTjDcU9Q==
X-Gm-Message-State: AOJu0Yym4VCFEFOUGysXeswntEHOqZBA26gLx3x9Aulvdnfw24klym6F
	ejBzgVDvYOgNuqG31+ZOsRtMARVSmNR6e8YwfIp4lyru5NfkQbHO
X-Google-Smtp-Source: AGHT+IEkvgy8+qUt0j8Xfe01Nb9Ngkcf/YUBeFTPPedadUYM/B+HYCGUUeSyvLy371dBR4zqX5Mrhw==
X-Received: by 2002:a37:e20b:0:b0:78d:52e6:5136 with SMTP id g11-20020a37e20b000000b0078d52e65136mr3023912qki.51.1712442924469;
        Sat, 06 Apr 2024 15:35:24 -0700 (PDT)
Received: from mba15m2.local (pool-68-134-50-197.bltmmd.fios.verizon.net. [68.134.50.197])
        by smtp.gmail.com with ESMTPSA id g22-20020ae9e116000000b007882fe32acasm1801841qkm.3.2024.04.06.15.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Apr 2024 15:35:24 -0700 (PDT)
Date: Sat, 6 Apr 2024 18:35:22 -0400
From: Jackson Chui <jacksonchui.qwerty@gmail.com>
To: Alex Elder <elder@ieee.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: Clear up precedence for gcam logging
 macros
Message-ID: <ZhHOKkqVIdsuZ-4Q@mba15m2.local>
References: <20240404001627.94858-1-jacksonchui.qwerty@gmail.com>
 <658e1f40-d1eb-4ba7-9ba3-0aa05a1ed06e@ieee.org>
 <ZhBrff8qkkmum4wc@jc-ubuntu-dev-korn-1>
 <5eb3afe2-da7b-4f98-aac2-bff529a02cea@moroto.mountain>
 <5e1c5156-d906-4473-970b-bff71e4dcd96@ieee.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5e1c5156-d906-4473-970b-bff71e4dcd96@ieee.org>

On Sat, Apr 06, 2024 at 11:45:51AM -0500, Alex Elder wrote:
> On 4/6/24 4:09 AM, Dan Carpenter wrote:
> > On Fri, Apr 05, 2024 at 02:22:05PM -0700, Jackson Chui wrote:
> > > On Thu, Apr 04, 2024 at 05:05:09PM -0500, Alex Elder wrote:
> > > > On 4/3/24 7:16 PM, Jackson Chui wrote:
> > > > > Reported by checkpatch:
> > > > > 
> > > > > CHECK: Macro argument 'gcam' may be better as '(gcam)' to avoid
> > > > > precedence issues
> > > > 
> > > > I agree with your argument about the way the macro should be
> > > > defined.  But perhaps these gcam_*() functions could just
> > > > be eliminated?
> > > > 
> > > > I see 15 calls to gcam_err(), 1 call to gcam_dbg(), and none
> > > > to gcam_info().  It would be a different patch, but maybe
> > > > you could do that instead?
> > > > 
> > > > 					-Alex
> > > > 
> > > > 
> > > > > 
> > > > > Disambiguates '&' (address-of) operator and '->' operator precedence,
> > > > > accounting for how '(gcam)->bundle->dev' is a 'struct device' and not a
> > > > > 'struct device*', which is required by the dev_{dbg,info,err} driver
> > > > > model diagnostic macros. Issue found by checkpatch.
> > > > > 
> > > > > Signed-off-by: Jackson Chui <jacksonchui.qwerty@gmail.com>
> > > > > ---
> > > > >    drivers/staging/greybus/camera.c | 6 +++---
> > > > >    1 file changed, 3 insertions(+), 3 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/staging/greybus/camera.c b/drivers/staging/greybus/camera.c
> > > > > index a8173aa3a995..d82a2d2abdca 100644
> > > > > --- a/drivers/staging/greybus/camera.c
> > > > > +++ b/drivers/staging/greybus/camera.c
> > > > > @@ -180,9 +180,9 @@ static const struct gb_camera_fmt_info *gb_camera_get_format_info(u16 gb_fmt)
> > > > >    #define GB_CAMERA_MAX_SETTINGS_SIZE	8192
> > > > > -#define gcam_dbg(gcam, format...)	dev_dbg(&gcam->bundle->dev, format)
> > > > > -#define gcam_info(gcam, format...)	dev_info(&gcam->bundle->dev, format)
> > > > > -#define gcam_err(gcam, format...)	dev_err(&gcam->bundle->dev, format)
> > > > > +#define gcam_dbg(gcam, format...)	dev_dbg(&((gcam)->bundle->dev), format)
> > > > > +#define gcam_info(gcam, format...)	dev_info(&((gcam)->bundle->dev), format)
> > > > > +#define gcam_err(gcam, format...)	dev_err(&((gcam)->bundle->dev), format)
> > > > >    static int gb_camera_operation_sync_flags(struct gb_connection *connection,
> > > > >    					  int type, unsigned int flags,
> > > > 
> > > 
> > > Thanks for the feedback, Alex!
> > > 
> > > I thought about refactoring it, but I feel it is worth keeping
> > > the macro around. It acts as an apdater between callers, who
> > > have 'gcam' and want to log and what the dynamic debug macros
> > > expect. Without it, the code gets pretty ugly.
> > 
> > Another idea would be to create a function:
> > 
> > struct device *gcam_dev(struct gb_camera *gcam)
> > {
> > 	return &gcam->bundle->dev;
> > }
> > 
> > 	dev_dbg(gcam_dev(gcam), "received metadata ...
> > 
> > (I don't know how to actually compile this code so I haven't tried it).
> 
> Yes, I prefer this over the original suggestion.  But
> even here the gcam_dev() function doesn't add all that
> much value; it saves four characters I guess.
> 
> Jackson, the basic principle that makes me say I don't
> like the wrapper macros is that the wrapper obscures
> the simple call(s) to dev_dbg(), etc.  If there was
> something you wanted to do every time--along with
> calling dev_dbg()--then maybe the wrapper would be
> helpful, but instead it simply hides the standard call.
> Better to have the code just use the functions kernel
> programmers recognize.
> 
> 					-Alex

Dan, Alex I think both of you are spot on.

I like the suggestion of adding 'gcam_dev()' as an accessor
function and directly calling to 'dev_*'. I'm busy this weekend
but will send out a new patch with this change next week.

Jackson

> > 
> > regards,
> > dan carpenter
> 
