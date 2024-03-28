Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7EC13BB25
	for <linux-staging@lists.linux.dev>; Thu, 28 Mar 2024 23:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711667452; cv=none; b=hbyQCJlOIN43kzmOz3VokIgL2I7bAjcov1gZfzbPkv2jOI3PJCphBhgwonFOlD/NYnqj9AHxAzFOyKQ6DsVx4Wh3pSoB9zqtmIj+MYwkWoLIGdSLsigxE7T/wJpWZ5twHZQwqNzha9W9S3eBMXcWg6B5xnBZGNbs4uFQkMYhGlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711667452; c=relaxed/simple;
	bh=0y8coj0+mQQPGC8OXljV4UuS/PYbmLCErGfzrrSuPSk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k2d43LtPWYNsQbQoRWPsnICMCRhwict3z4JpHpIRKK201AOlqVFJcsNjfS+m775tGcsmNEMWZHVShs4sIOY2YSLZrDwOPgttP3v5jDjem5p2Dk1Oktnc7Ws7o/BNEiAQN4IGH3yoWjQLgfSCPbj02rMdNBEV0lRDPRkERJH+spU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=i27Tc8hK; arc=none smtp.client-ip=209.85.166.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="i27Tc8hK"
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-7d0976ee73bso18684039f.2
        for <linux-staging@lists.linux.dev>; Thu, 28 Mar 2024 16:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711667450; x=1712272250; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pmlJUaTfqfou50yhLN4yiBmfHrUkQYfBdioXp5GpAWg=;
        b=i27Tc8hKbBes21olCO5QgcG5J+a3l8x5epKI3HNnuEHOstp5QAAl2gA1StnQITrHvs
         PqA4MmlUSGu5lSgqeMxTUYBXHE0EWSdf/cejTco6QnFZha50MR5RYEtu1LU59iXeIeBe
         EzUdrCEUdLgwa754L9z6PsLJNvRqUJRnSqE7uLGkZmJ/ddCKGctXqhZOuigXdyttgTi5
         ADAa1BJKbptPVcaNNt69jBfzf405X4GVcyCD6E9Ke6W21YmXsYPqyDpvIxX5y6XpDVx8
         qmIOc0zYSPGLKdzT045GwwSYWdcVmyO7+4zcVBUzqDOJeEaPNBEubBNP8IgEzODEzIWS
         w59Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711667450; x=1712272250;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pmlJUaTfqfou50yhLN4yiBmfHrUkQYfBdioXp5GpAWg=;
        b=WQPOfCRpOAzJOTQzLqWFvuKsgRLqH2tA778elS1qe7LVSxzNaNJj+lzh5itIaage6C
         ljVWBez7tw/M0yGaglGZ5gNqKRktrpm+ylaH++rv5onH/CLcicCLXbrFcWChxCFYQpjf
         vi/59t5WlZ/HoiRbf2z5kwm3eIgfAEszcQZYex4mIQQbysC57kHJ2O9W3V/c68VLM3Z2
         3Uzq7/bIzdqoA8d0VPjyprJw1Jlx0OvfmqKN2uWIINPr8hWAI8PSnOm3t+p2GFw2ThYc
         tAcq3WNjfalkjlogRmp7LJ/itvSZrPBKdS/iv8hCHw0w8hUeJIzpIqwmhFV8C0Eb0/Rw
         vCnA==
X-Forwarded-Encrypted: i=1; AJvYcCUrHgUtS3h1iHJ+PqU30cf9JZTuy5HtWTW47MJDBLNYzkRbzARQOB6pnwAYKxUBQvUky1gkSfyjZ/doBDoqV4Gx8fNERuxYG83Os4jWyg==
X-Gm-Message-State: AOJu0Yw5WAXev29EayDuquTDf56vO63fq4IoESDygGCapCeMxiSc83/P
	KfSPTPFWjkprupgXe97iwfauhGomtkOSPcIJRc3o1Gbh3fHZiHKb0SWqKE6FcQ==
X-Google-Smtp-Source: AGHT+IHQfPBAN6+CqMvntTVcDubTpW2Aufa4WgLyOK0enhUXjNvXbnr12eNJW5kapUHT3+2CUrQ0lQ==
X-Received: by 2002:a5d:9485:0:b0:7d0:23b2:c96e with SMTP id v5-20020a5d9485000000b007d023b2c96emr752226ioj.5.1711667450017;
        Thu, 28 Mar 2024 16:10:50 -0700 (PDT)
Received: from google.com (30.64.135.34.bc.googleusercontent.com. [34.135.64.30])
        by smtp.gmail.com with ESMTPSA id r1-20020a056638130100b0047ecdebb896sm231622jad.16.2024.03.28.16.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 16:10:48 -0700 (PDT)
Date: Thu, 28 Mar 2024 23:10:44 +0000
From: Justin Stitt <justinstitt@google.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-kernel@vger.kernel.org, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 01/11] staging: vc04_services: changen strncpy() to
 strscpy_pad()
Message-ID: <hbwxiid52lv2dq7rdtvard3up46khu5uv335tzavwag3v6s6jl@dzjrnooz553m>
References: <20240328140512.4148825-1-arnd@kernel.org>
 <20240328140512.4148825-2-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240328140512.4148825-2-arnd@kernel.org>

Hi,

On Thu, Mar 28, 2024 at 03:04:45PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> gcc-14 warns about this strncpy() that results in a non-terminated
> string for an overflow:
> 
> In file included from include/linux/string.h:369,
>                  from drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c:20:
> In function 'strncpy',
>     inlined from 'create_component' at drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c:940:2:
> include/linux/fortify-string.h:108:33: error: '__builtin_strncpy' specified bound 128 equals destination size [-Werror=stringop-truncation]
> 
> Change it to strscpy_pad(), which produces a properly terminated and
> zero-padded string.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

If there is other review that warrants a change, we might as well switch
over to the new 2-argument version of strscpy{_pad}() introduced in
Commit e6584c3964f2f ("string: Allow 2-argument strscpy()"). No need to
change for only this reason, though.

Reviewed-by: Justin Stitt <justinstitt@google.com>

> ---
>  drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
> index 258aa0e37f55..6ca5797aeae5 100644
> --- a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
> +++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
> @@ -937,8 +937,8 @@ static int create_component(struct vchiq_mmal_instance *instance,
>  	/* build component create message */
>  	m.h.type = MMAL_MSG_TYPE_COMPONENT_CREATE;
>  	m.u.component_create.client_component = component->client_component;
> -	strncpy(m.u.component_create.name, name,
> -		sizeof(m.u.component_create.name));
> +	strscpy_pad(m.u.component_create.name, name,
> +		    sizeof(m.u.component_create.name));
>  
>  	ret = send_synchronous_mmal_msg(instance, &m,
>  					sizeof(m.u.component_create),
> -- 
> 2.39.2
> 

Thanks
Justin
