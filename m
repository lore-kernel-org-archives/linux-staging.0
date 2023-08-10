Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F07FEBD
	for <linux-staging@lists.linux.dev>; Thu, 10 Aug 2023 05:01:50 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-31757edd9edso455221f8f.2
        for <linux-staging@lists.linux.dev>; Wed, 09 Aug 2023 22:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691643708; x=1692248508;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CjjZvzyvl3fP1L/RGhqR7wcU7Jb4ABWNT4G18XbFhog=;
        b=Cyl6o2ALERVWYlXqKYobvRLYgo41YupXcmaSY9DluOqy0pNkV1zl6lx9YQsViuXzTy
         2pj3GLOX3EPuT1+rcWWwQhDVqVkuA7xp56dFWLYVUGIh0L/1907V0Ef4Wz8xYnUUFeJl
         GT6XdeFaf38ftDlwdlv1mDlTLCxuvt5LRnrocua1nb5ssKWHUC9M4lMT6FPPnRjhA8Yz
         jyVPemyXlbs/ZLs0CXd2OkSMVv2WEQCszNF5MHEp3zjyIZe3KNynQY/K9fQ2AqgJxhML
         1pzUPS/Bf/54KGD6AaUSgIUCpEntyNDbvk9sq3XBAXeH6L7cP3ekNHrGqAJzCdWRN3U2
         NU0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691643708; x=1692248508;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CjjZvzyvl3fP1L/RGhqR7wcU7Jb4ABWNT4G18XbFhog=;
        b=ABhZJJJCg43uqzPmS53uUG1srp/OsFLjia5jL6zzS72lv0kyGOypn3Oz6JNPtvSWkJ
         0HXFT2JSE9E+MECcv3u3biZdLlL+LZCZLwcDQznvRtQexMxdsQ8mSVXojO2Dp43EOHAc
         X8LvHLTCdR7y/zReIC6ENwkuiZqqiPj2oFMDF/KjOsVTGGwYzPER7StVpnpvHC5CfUS5
         uIpwHlHvtAJbbIRbJQlFt3pfUuvPurzUQva3CKadHY+qZ02MGUGp3zYR/+9gYUVtHDni
         OG+LByHEBYHY5jjMAJ6RTXRv6aG7TifxTVVtez0EkZ8ji5mPTxoC7WKp3IfLvvlAN/KC
         9YtA==
X-Gm-Message-State: AOJu0Yw2+oRMNUZWQAAAv7ndVlSeu1u8abmdtrJwz/0/0dQl/VyfCFC4
	68cNyYU1F/xYDVF7zOkHjG1b4A==
X-Google-Smtp-Source: AGHT+IHPeTvxwR9osIlv77E3zC7KUrombdsvkyCZRjVf7XIk9LhSLB/X67wTD+n/fo7hKsBZ77WdAg==
X-Received: by 2002:a05:6000:12ce:b0:317:15f5:a1ca with SMTP id l14-20020a05600012ce00b0031715f5a1camr1168913wrx.10.1691643708386;
        Wed, 09 Aug 2023 22:01:48 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id g5-20020adfe405000000b0031773a8e5c4sm809898wrm.37.2023.08.09.22.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 22:01:48 -0700 (PDT)
Date: Thu, 10 Aug 2023 08:01:45 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Michael Straube <straube.linux@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8192e: prefer strscpy over strncpy
Message-ID: <cbca3311-2d5d-4b87-8966-e2b57d74d6e1@kadam.mountain>
References: <20230805075114.15186-1-straube.linux@gmail.com>
 <2023080952-maroon-waviness-9621@gregkh>
 <b15bc777-b470-3c15-5ea7-8ef2f89622c3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b15bc777-b470-3c15-5ea7-8ef2f89622c3@gmail.com>

On Wed, Aug 09, 2023 at 08:02:05PM +0200, Michael Straube wrote:
> On 8/9/23 14:21, Greg KH wrote:
> > On Sat, Aug 05, 2023 at 09:51:14AM +0200, Michael Straube wrote:
> > > Replace strncpy with strscpy in two places where the destination buffer
> > > should be NUL-terminated. Found by checkpatch.
> > > 
> > > WARNING: Prefer strscpy, strscpy_pad, or __nonstring over strncpy - see: https://github.com/KSPP/linux/issues/90
> > 
> > If a global search/replace could be done, it would have happend a long
> > time ago.
> > 
> > How was this tested?  The functions work differently, are you sure there
> > is no change in functionality here?
> > 
> 
> It was only compile tested. To me it looked as it does not change
> functionality, but looking a bit deeper at it I'm not sure anymore.
> So, we should leave it as is.

So there are three main differences between strncpy() and strcpy().

1) The return.
2) strncpy() will always write net->hidden_ssid_len bytes.  If the
   string to copy is smaller than net->hidden_ssid_len bytes it will
   fill the rest with zeroes.  This can be important for preventing
   information leaks.
3) strscpy() will always add a NUL terminator where strncpy() just
   truncates a too long string without adding a terminator.

We want #3.  We don't care about #1.  The only thing to check is #2.

regards,
dan carpenter

