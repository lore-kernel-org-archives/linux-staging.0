Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B227F22B594
	for <linux-staging@lists.linux.dev>; Wed,  3 Dec 2025 09:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764754323; cv=none; b=Dyz4AlBN2PrPztYdLrsPtBmq0hgoUQX601bfV/cAQAx0QOqgIPzoRtSFgUQUb7bmTWvoYKPWTuIQmVBkvmigCvK/ZN/WyIONvL2LmbOvtrjUaSXMv55QTA4lnnMNitoXM5h690fFZnhSd0q5Dbo21YS3PagDpK/xcESKanOuPOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764754323; c=relaxed/simple;
	bh=5e7g4c0PjJAe9eCSqXfvz8HVMh8BhNBTz57IxFGzcP8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N1RG6gZLkOxaEZGCVg/ZuHgwC4CVB+ij8yHMmd8zrXr8tCaMq2LgMxi0gmDeOhLtpPDib6yBzRNmqWY+3Jd+DTZ8DG5DarZQB5fSMdA5J1aYRJ0Ux8jvJX4YIbpIngYyeyCoTu1vSPGrf6RqgbCieDd7RBLktcmYCH6caZBZeRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xstxYJA3; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xstxYJA3"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47775fb6c56so59873725e9.1
        for <linux-staging@lists.linux.dev>; Wed, 03 Dec 2025 01:32:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764754320; x=1765359120; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s4zu1A1ULeKyAXumQsFZvx09+zqt+hUHwzuEBchriwQ=;
        b=xstxYJA3znFcQhV6oq27wNgr8ceKgjWT6r+ErG+lotkTmcqlr28ng9iNBIphn01Ccj
         Ogx44HATOWv36oINwGhMPHg3VvWTsIK66xjaFJ7+sL41zzyJpA+ANOVGjysE7cFuLQqc
         +WJgnYyRwQ5lg/q6uDal6OICthqkTyveN2QhGeHW3lr/iN2c8H/1S3ojhGMD9Z4YOQiO
         8lXKGBx5tip+l/kIVc6U3hvhb3lQb3oYBtQ32TrEbqkFtlFzp6uuVWeJ0NZd/V8P5ZQC
         vY/dj44v7RqaewcbfgPlq2rGVbnr9aYKNLdBLmQ2wq44vqjMhLju3wxiYaQIOZMeOjiu
         3K1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764754320; x=1765359120;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s4zu1A1ULeKyAXumQsFZvx09+zqt+hUHwzuEBchriwQ=;
        b=pCWydWU+Gy2VIW7MLeG0IuoR3Jisbeb5+A5caAEbtj/nI4AtjsZVl0SYcCwPuw/WgZ
         RMMkrOozMxKRAb2B2rJToIglYrmmzxG/unXi759L2PDtHeEEX417x9/C1HIGKxiardcJ
         bNeizQxztc7bstA4hCikifVhiOoGZAv04I9gH36G7P1bjpFNkzJ/nSHDy+pBlH13gWZL
         WbQfUswWp7H05bs3V95AeLj8Du17mSfZ1Q7VQd6FNLJ+usPr3bUiaJFdU6e+/8/8UxWQ
         e1U/oDHLwKfCcGF6yKPL3x2G5/4Cav+Zri9ZaORQCZbZgpxgxNOsiknI1851iU0kY9vo
         DNlw==
X-Forwarded-Encrypted: i=1; AJvYcCU9kNbv3FKh4LTOQlQVcMxW2G0t3J6Ud9qtsriopCX2BL0dia4uwiVafkHQVl2QrEoR2hQTdg4nO+6RVkxu@lists.linux.dev
X-Gm-Message-State: AOJu0YzFniNxXHbZF/V/tHUcVoULQ6BlLMjqa8J/UG7e8T7ufHeaaDR3
	TslxyoLB6NYPyghoMng3eICk7qUn3rt/9+V3RPytlRoweRMtg5i1DuAEM+BfIZuI/sI=
X-Gm-Gg: ASbGncuksvr7uWduRUvGrdDsS6KeyLpFqFPbhpwJFqjtUTox8xy+DiQEwp7UcXYEK/9
	gsXb8HDAgZuxAsms7k2lmiMtUX3vcQN3olNO9IRBYuYPaz1GBZHAMAScOQGr6x8V+5B4OdSnENd
	URPSSO67+rmW5270dkfDIaqq2lcVxjd9KNzj0X9+KKWLQLjZWVGFCgNsa+C8lliY7iK9kp0xuQW
	Fs4ixJf/9ryL5QeYIMn+FQRhkO5XqoNRyAmA1t/Z+IL6Q9xhnvJECcNG6lRVrfT0tKeb6Yjuokf
	1SkjUhrOXfCBYfjtmYoW8l61Fhtu+6l6bm+gQuQ3/E/HPA5oZhXNj2KfnbU+4SUplFN8VUJ0LSb
	pOIE+i+i5GYywzqS5FyCJc+hyMhbubd2zRuFNOCFg0DXysghgT1DjLtafmVhDfF/Q+H59S0Uev9
	+L+BhSEpQbTeQ5gZR3
X-Google-Smtp-Source: AGHT+IEh/ACzRjySiHGMsxc8Cb1MX10KoPt/SdBCGw+RrGZT3rPN9oLM0P057DTi4DsPgYNGMahkCQ==
X-Received: by 2002:a05:600c:3586:b0:477:54cd:2029 with SMTP id 5b1f17b1804b1-4792aedfddfmr18110885e9.4.1764754319825;
        Wed, 03 Dec 2025 01:31:59 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42e1c5d607csm38704337f8f.15.2025.12.03.01.31.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 01:31:59 -0800 (PST)
Date: Wed, 3 Dec 2025 12:31:56 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Pavan Kumar Yalagada <pavankumaryalagada@gmail.com>,
	parthiban.veerasooran@microchip.com, christian.gromm@microchip.com,
	laurent.pinchart+renesas@ideasonboard.com,
	hverkuil+cisco@kernel.org, linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v5] staging: most: video: prevent probes during component
 exit
Message-ID: <aTADjJE99n2ju_kJ@stanley.mountain>
References: <20251203083411.7072-1-pavankumaryalagada@gmail.com>
 <2025120308-unlucky-chevron-0071@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025120308-unlucky-chevron-0071@gregkh>

On Wed, Dec 03, 2025 at 10:05:17AM +0100, Greg KH wrote:
> On Wed, Dec 03, 2025 at 03:34:11AM -0500, Pavan Kumar Yalagada wrote:
> > When comp_exit() runs, comp_probe_channel() could still add new devices
> > to video_devices, creating a race and potentially leaving the list in
> > an inconsistent state.
> 
> Wait, please step back.  How can this happen?  I would argue that if it
> could happen, then this must be solved at the higher level.  The most
> core should not be allowing this, as you do not want to be forced to
> solve this for each individual driver (hint, the driver core does not
> allow this to happen for normal driver operations for this very reason.)
> 
> You are only solving this for one most driver, not all of them (well,
> there are only two with this codepath...)  Please move back up the stack
> a bit and prevent this from even being an issue at all.  Especially as I
> do not think this really solves the problem, see below:
> 

I had looked at this before and had assumed it's more complicated than
it actually is.  All this stuff comes from configfs so all we need to do
is move the most_deregister_configfs_subsys(&comp) earlier in the
function.

> > This patch prevents new devices from being added while exiting by:
> > 
> > - comp_probe_channel() checks comp_exiting before modifying video_devices.
> > 
> > 	if (comp_exiting) {
> > 		spin_unlock_irq(&list_lock);
> > 		ret = -BUSY;
> > 		goto err_unreg;
> > 	}
> 
> That's great, but what prevents comp_exiting from changing right after
> you check it?

That would have been okay.  In that case it would have been added and then
removed from the list.

But, you're  right.  It's not the right fix.

regards,
dan carpenter
