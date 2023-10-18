Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D651E11C8C
	for <linux-staging@lists.linux.dev>; Wed, 18 Oct 2023 10:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FiI45gtz"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-406609df1a6so62117905e9.3
        for <linux-staging@lists.linux.dev>; Wed, 18 Oct 2023 03:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697625748; x=1698230548; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=448I85XwNoqixMRXF1Oandk2osuw1e0W186O+rEwgcI=;
        b=FiI45gtzw+POP049UeuuplWkcO3ErcU78bS7+L+tG6bdC1TbV+w9Nll7OgSiuso/b9
         HmDOpXUn4blhkSQw2VScfiJNsKrBdHMFeUBD4HXu5BcN3n1l8NRWDAsR6vsa0n5EluYC
         hBwnC7LmtEKoV8r8WA+i6kckex7ie/gKzyTCyxc2G4nk5mKAeId9vqYBRBlf3agVpZ/O
         cl7EKB3H61Ok7gYao6JGhEoiEoM7cVyBdMWr155DqX0SJutintXb9EU3ISSMSl7+7IL/
         lppNROlP4LRcLUd96/rJ4KkxEQthsu7zoxGC8z3kUsknEEYP5AoDC4HQJ+rkruoyUQHy
         N+Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697625748; x=1698230548;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=448I85XwNoqixMRXF1Oandk2osuw1e0W186O+rEwgcI=;
        b=GCfVyib8OGCyqWclR8M8YQOcjtp0CzFgzNvRntsskVtO4WkPIGp0MKPDXeqtodwRbQ
         j7GjZfa0k7hYuQ2vBidX1/QV75FAfhLDySvCNyzo8xihDnCpMVYa2epemWSjoHF0293N
         RspKFxWjA60mvwqSNPaFcfMOs6TmFcuTEW7HQTjJ99eQrrTXiQe08Xsak3CFdLUdK2nf
         PqfTqYdbPVAI5ormi2re2wh2Dl8Kv09AeTeE4QdukNHX58NCx/7XA/3wvw7vwXm1TM5/
         UEGMei//wvZFeNIggVG54789SCFqXmizCQWOMU2ftwSzHU25Mvu/8Kd99CrBquYgLNO5
         zN/g==
X-Gm-Message-State: AOJu0YxYT3m75dCI3EPIzpf8dJOYCgLKcxt4ZaBzUKApC3oEI9fZDE1w
	JrNVpgkmAo/oGYf45SVF6OW9eA==
X-Google-Smtp-Source: AGHT+IFHcjEQiixwI2g9jmynGtr+82+q7ej2ryHl7K5UYNYMB4Yw28x6O0HkMBHmjb2SFwF+QW365w==
X-Received: by 2002:a05:600c:350a:b0:406:517f:ac85 with SMTP id h10-20020a05600c350a00b00406517fac85mr4034957wmq.18.1697625748092;
        Wed, 18 Oct 2023 03:42:28 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id w13-20020a05600c474d00b004067e905f44sm1376117wmo.9.2023.10.18.03.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 03:42:27 -0700 (PDT)
Date: Wed, 18 Oct 2023 13:42:23 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Karolina Stolarek <karolina.stolarek@intel.com>
Cc: Julia Lawall <julia.lawall@inria.fr>,
	kenechukwu maduechesi <maduechesik@gmail.com>,
	outreachy@lists.linux.dev, shreeya.patel23498@gmail.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rts5208: Replace delay function.
Message-ID: <e5c482ab-0342-43f5-a62f-c0c176e2e094@kadam.mountain>
References: <20231018004300.GA3189@ubuntu>
 <7bc719c4-459f-3d8-7ed-b1e1adf158@inria.fr>
 <1118ec6d-e1e7-79f3-08e4-9a79c996eed1@intel.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1118ec6d-e1e7-79f3-08e4-9a79c996eed1@intel.com>

On Wed, Oct 18, 2023 at 09:32:46AM +0200, Karolina Stolarek wrote:
> On 18.10.2023 09:03, Julia Lawall wrote:
> > 
> > 
> > On Tue, 17 Oct 2023, kenechukwu maduechesi wrote:
> > 
> > > Replace udelay() with usleep_range() for more precise delay handling.
> > > 
> > > Reported by checkpatch:
> > > 
> > > CHECK: usleep_range is preferred over udelay
> > 
> > This message is typically not a good candidate for outreachy patches,
> > because you need access to the device to be sure that any change is
> > correct.
> 
> Could we add a paragraph on how to pick good checkpatch.pl error to fix to
> the Outreachyfirstpatch docs? This could go to "Find a driver to clean up"
> section, for example.

I think you should put a note about usleep_range() and the extra
parentheses one.

Also say something about looking up stuff on lore.
https://lore.kernel.org/all/?q=sd_change_phase%20usleep_range
In this case someone tried to update this before.  The patch wasn't
merged but it wasn't clearly explained to the developer why the patch
wasn't merged.  Ah well.

Generally fresh warnings are better than old warnings because we fix the
simple stuff where checkpatch is obviously correct.

The other thing is that people really need to look at the wider context.
Look at the surrounding code.  Look at when the checkpatch warning was
introduced and try to put yourself in the developer's head to figure out
what they were thinking.  Are there other opportunities for cleanups
nearby.

regards,
dan carpenter

