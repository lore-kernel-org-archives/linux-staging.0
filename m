Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A03D2CA1
	for <linux-staging@lists.linux.dev>; Thu, 27 Jan 2022 10:05:25 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id d5so2416862pjk.5
        for <linux-staging@lists.linux.dev>; Thu, 27 Jan 2022 02:05:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=LBOQjqTrRKyhdvBvzMylROfqbjWsRkHJwbCc+XSqEB4=;
        b=hU+y8UUCtnvmLs91gy6C7O0CCHoYJ2TYmaHx7LExtXnAX3g2ZUWGqWjQGO9/EoDTHL
         LKJm5G2IXBdaabWdTa5DJp52fycGA3iBYSheTFsR6/eT0zTGBJ9vL1CUM+YzZJ4QOml5
         mjaQGcvCY2aRk+2I7XMu+2PSCwnYj1z7fGDwI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LBOQjqTrRKyhdvBvzMylROfqbjWsRkHJwbCc+XSqEB4=;
        b=nLZlafbUEndyYC9TdJThDGu3aNinTAkK8l/Kl6gbl4VFpYcpUSbxxrR8GSZK6ef6+l
         qARKdn0GZWVjBGQONnoIcH4Jer1xVePEqc+rgtqRqLHecuEYMoNf1t6m+3eIH3gdLeX9
         52Gom6HiAB2sf70XoxYsEbTDZ/VlmrCtCOqot0fqre+tP2nDb4V4w3HhW3eV59E3Y7km
         sWHzIaAi2JWCASV8n2csVfQ0hIhmEiRQkysIEO0an9PW/4xVlW1N7nCpZYZulZn4GX5C
         Z2SB4ntnsMKwIuylU6F/hxQMYEy0okV4I9MMvhhDGBHmXWIDxH9JbzbAvSnKo9SGIZoa
         2MNw==
X-Gm-Message-State: AOAM531/JOFU7VjafaxXaM8OjD/WOntqsLIAFjyOFd0R29Eb1qdMz5k8
	LypE9DNjxsrUVhEnxwoFpoUoEA==
X-Google-Smtp-Source: ABdhPJwHB0qa1O7m8UjQXGx1IEj/br7glW0Yig/xNOufSEf8geSAYNnvEm+sDvMzb7zRtZzMRbp7zw==
X-Received: by 2002:a17:90b:1b46:: with SMTP id nv6mr3459486pjb.178.1643277924815;
        Thu, 27 Jan 2022 02:05:24 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id p42sm4980243pfw.71.2022.01.27.02.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jan 2022 02:05:24 -0800 (PST)
Date: Thu, 27 Jan 2022 02:05:23 -0800
From: Kees Cook <keescook@chromium.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH][next] staging: greybus: i2c: Use struct_size() helper in
 gb_i2c_operation_create()
Message-ID: <202201270204.D460EC35@keescook>
References: <20220121222250.GA73021@embeddedor>
 <202201241213.82E7D9F598@keescook>
 <20220126105404.GY1951@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220126105404.GY1951@kadam>

On Wed, Jan 26, 2022 at 01:54:04PM +0300, Dan Carpenter wrote:
> On Mon, Jan 24, 2022 at 12:19:03PM -0800, Kees Cook wrote:
> > This could still overflow if struct_size() returns SIZE_MAX. Perhaps:
> > 
> > 	if (check_add_overflow(struct_size(request, ops, msg_count),
> > 			       data_out_size, &request_size))
> > 		request_size = SIZE_MAX;
> > 
> > I should brush off the saturating arithmetic helpers series:
> > https://lore.kernel.org/all/20210920180853.1825195-1-keescook@chromium.org/
> 
> Yes, please!  Those seem like a million times easier to use.

Here they are! :) Please review:

https://lore.kernel.org/lkml/20220124232342.3113350-1-keescook@chromium.org/

Thanks!

-- 
Kees Cook
