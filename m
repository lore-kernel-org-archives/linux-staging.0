Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47CFABE4C
	for <linux-staging@lists.linux.dev>; Mon,  4 Mar 2024 06:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709533794; cv=none; b=bqEQEdFQl6Uka7XSHqrdrO9+uH13YSy7A/ooTbklWLg83buUMH7pwRbQeu0jk+ngC7Nup4+SwKkaA7HSoXUls7ASp8yBdBDnEbd5pMlYpbpYRw53PS74lKr7tRnjS8mw+nBt0jdk9rFmKO6ymOn7qVKz71zlFc7U/XzsExRlh40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709533794; c=relaxed/simple;
	bh=Pf7uv/gYGGXC6+7FVldt3LroRAuk574J76EPU23+wJA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AuwRRIMEVep42WCHItVNVs8LAph1lNo6O0dnvuL5xOP/RmGYDzFZT5u2EeEIUScmURUMtg0bsI+20UdFvSddRQwalnVUMcsFYEp2iKFXEkWpbSwordO+9/JkFLGjAUOjLtBIGRQv2phmmOyRDX9C6mwifzd4vpwvPMCLK5Me9vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ktae43db; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ktae43db"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-412e784060cso262625e9.1
        for <linux-staging@lists.linux.dev>; Sun, 03 Mar 2024 22:29:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709533791; x=1710138591; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1Sr+3/igGAuTwcw+O5i8ci7ivmixVyDSgfl+R16S+q0=;
        b=Ktae43db2q5WKqv6u232I4yiYQEVS7nl8PyOvauvxQwsE+iWpuT7gDJ3vsn2nrwuua
         xow6vNgyHe6Er6lkQbX44b1YEJMcdsWauMEQgygSQPoZumSt0nlXqUxq6V2qTIS+ckaK
         aZRRcnuXdz1XTwmT2tnkx6bANN3o103ElwBVwvemMp6JhzANeVPDski2u/SGVTNjgE3N
         x60dzhSpTXGIsT0XczOqYUHBgfSMtYbX53hQt0wiOr1HkP+nUSFF076yhroStU5qTmO8
         kQH591jZun/wyebkZ9l/aP1uohWindetoQMQqFOSdjM4VPY1+yeyc6JE1yhZt47WGqQO
         bDYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709533791; x=1710138591;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Sr+3/igGAuTwcw+O5i8ci7ivmixVyDSgfl+R16S+q0=;
        b=nwGtCjGG4+2tfe0IzS5yoE2EZ//30is0UpgdZDDKsfNt+S/myz7ZAtOJSU1fUNbqVg
         UsUXSFgKCRVinTwPZrcPVX+bWRdZJPEPQP7SLTJc18R6f6BZzj9ABkBGQCRHK7N6XnT1
         1xEJsn5760h82ZcynktSP8+ylFsSVwarnMVj+/Oaoenylh1ymVKczluiRYH5p0IVAkJN
         dC+VW9SKU0yAA3RHijcoInFSQVGfTxpl14dC9DS8MH+NF1KweGtB9U1R6ctj4wB9N7mg
         MS+AJsKLUqw57gDPsEfBRYgF3qmkoKPTdbyqp5o0JpHdaJQBiDfZkbaaXtxO8l8FVkOv
         wr2g==
X-Forwarded-Encrypted: i=1; AJvYcCWOyEjyiaPrmnf6AZbnCOS9cf/Q8B4GLpYyfPt+l1yAl8l5nNI1zcwyCKEVXdzWeHhSaKCYpDsDrQ+LBnHi/JnVjBSHuAV+cuqf12C5AQ==
X-Gm-Message-State: AOJu0YxSl7CAGsBzL752GKwJYxQzSvenx3C5/oCBNNZRheKpU6cUhVAQ
	ZdJERegtgr+LSjvFlEc0hlCAse4WO6c7PJo7mcT8AsCvIwaMOIIS7Ph2ERPZBR0=
X-Google-Smtp-Source: AGHT+IHq9JCYT783Wtc+zj9tHovEmxaZxWX3kn+l7xtGlx5U/KJDz3VB67RRX9FFH9wGGkZte3BftA==
X-Received: by 2002:a05:600c:4f82:b0:412:dab5:b20e with SMTP id n2-20020a05600c4f8200b00412dab5b20emr3940436wmq.8.1709533791619;
        Sun, 03 Mar 2024 22:29:51 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id l21-20020a05600c4f1500b004101543e843sm16723413wmq.10.2024.03.03.22.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Mar 2024 22:29:51 -0800 (PST)
Date: Mon, 4 Mar 2024 09:29:47 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rui Miguel Silva <rmfrfs@gmail.com>
Cc: Mikhail Lobanov <m.lobanov@rosalinux.ru>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] greybus: Fix deref of NULL in
 __gb_lights_flash_brightness_set
Message-ID: <02f31119-e35a-4358-a0a0-079416ba4a9d@moroto.mountain>
References: <20240301190425.120605-1-m.lobanov@rosalinux.ru>
 <7ef732ad-a50f-4cf5-8322-376f42eb051b@moroto.mountain>
 <m3ttlolktk.fsf@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <m3ttlolktk.fsf@gmail.com>

On Sat, Mar 02, 2024 at 03:23:03PM +0000, Rui Miguel Silva wrote:
> Dan Carpenter <dan.carpenter@linaro.org> writes:
> Hi Dan,
> 
> > On Fri, Mar 01, 2024 at 02:04:24PM -0500, Mikhail Lobanov wrote:
> >> Dereference of null pointer in the __gb_lights_flash_brightness_set function.
> >> Assigning the channel the result of executing the get_channel_from_mode function
> >> without checking for NULL may result in an error.
> >
> > get_channel_from_mode() can only return NULL when light->channels_count
> > is zero.
> >
> > Although get_channel_from_mode() seems buggy to me.  If it can't
> > find the correct mode, it just returns the last channel.  So potentially
> > it should be made to return NULL.
> 
> Correct, thanks for the fix. Will you or me send a proper patch for
> this? Taking also the suggestion from Alex.

I'll send it.  Thanks!

regards,
dan carpenter

