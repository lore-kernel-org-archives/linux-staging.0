Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72CEB72
	for <linux-staging@lists.linux.dev>; Wed, 28 Jul 2021 01:50:35 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id g23-20020a17090a5797b02901765d605e14so1924325pji.5
        for <linux-staging@lists.linux.dev>; Tue, 27 Jul 2021 18:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Uxwg9y2D5FscAC8WTII8k+Fl1MaCKaIyqWX2425pbwg=;
        b=LrIioahOxuG0Yy87ee4V5QkSIPXjkcKgctqXOSVmOvUvbl3AGJicrLW+CgQjr1Drb9
         2+LoeVSx6hMKWQ3vNE2BnohqbgXg5IYeiV7M4xOT5JsYW83C6ivu5hTcWryqGo7UZRdo
         H7BcuPUaJ6KHTDmRelDadDBO+fGgawogS5vN8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Uxwg9y2D5FscAC8WTII8k+Fl1MaCKaIyqWX2425pbwg=;
        b=cmV3tG2tgi7+MhdlKz4bvf5sJQrkDn4UQzvPHYzuOANatO4YTRioCP4cprvpjDhlJk
         NYBhdu6YET90MuxYWphG3uUesU5PyxfhjNoaNN2pNLcxDWF+mEwVicr2hekwNMyTxihk
         xkQbppbRN/n/8BeVt4Kld7AuuD1NrjDXZWZ2sV0fqVhp9ZrhpoQ0+8KbmVvX8D2VTZ21
         D+TDbUzOon84o1yHe4mZ6fB7fO128Zg0Dqfpcw8NXfrukE7cYj+vgjolXBjflfV0csmY
         Lt1MjrKwS6AyOmeVTjvh/YJny/gdMgO1KmSOGmI5yDDATM0wplaf2bDiXVaeyorAtZMl
         4XGg==
X-Gm-Message-State: AOAM5331EW48Xcx6VdeLyGioKDAz9FM34xd9geQHTrAe1XvahE4BCC7F
	YY04yYUkR+7Swg02EqRQWBKvzg==
X-Google-Smtp-Source: ABdhPJyheVx5T5IFdDGIlFJGMqu67VgDnTIUx7vGl5lFj0tDG77pOvHSTj72nmspZwOompBVxs+mRA==
X-Received: by 2002:a17:90a:bb0d:: with SMTP id u13mr25562521pjr.88.1627437035064;
        Tue, 27 Jul 2021 18:50:35 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id s193sm5105347pfc.183.2021.07.27.18.50.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jul 2021 18:50:34 -0700 (PDT)
Date: Tue, 27 Jul 2021 18:50:33 -0700
From: Kees Cook <keescook@chromium.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-hardening@vger.kernel.org, Keith Packard <keithpac@amazon.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-staging@lists.linux.dev, linux-block@vger.kernel.org,
	linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com
Subject: Re: [PATCH 01/64] media: omap3isp: Extract struct group for memcpy()
 region
Message-ID: <202107271849.00A81539B@keescook>
References: <20210727205855.411487-1-keescook@chromium.org>
 <20210727205855.411487-2-keescook@chromium.org>
 <20210728005546.GA35706@embeddedor>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210728005546.GA35706@embeddedor>

On Tue, Jul 27, 2021 at 07:55:46PM -0500, Gustavo A. R. Silva wrote:
> On Tue, Jul 27, 2021 at 01:57:52PM -0700, Kees Cook wrote:
> > In preparation for FORTIFY_SOURCE performing compile-time and run-time
> > field bounds checking for memcpy(), memmove(), and memset(), avoid
> > intentionally writing across neighboring fields.  Wrap the target region
> > in a common named structure. This additionally fixes a theoretical
> > misalignment of the copy (since the size of "buf" changes between 64-bit
> > and 32-bit, but this is likely never built for 64-bit).
> > 
> > FWIW, I think this code is totally broken on 64-bit (which appears to
> > not be a "real" build configuration): it would either always fail (with
> > an uninitialized data->buf_size) or would cause corruption in userspace
> > due to the copy_to_user() in the call path against an uninitialized
> > data->buf value:
> > 
> > omap3isp_stat_request_statistics_time32(...)
> >     struct omap3isp_stat_data data64;
> >     ...
> >     omap3isp_stat_request_statistics(stat, &data64);
> > 
> > int omap3isp_stat_request_statistics(struct ispstat *stat,
> >                                      struct omap3isp_stat_data *data)
> >     ...
> >     buf = isp_stat_buf_get(stat, data);
> > 
> > static struct ispstat_buffer *isp_stat_buf_get(struct ispstat *stat,
> >                                                struct omap3isp_stat_data *data)
> > ...
> >     if (buf->buf_size > data->buf_size) {
> >             ...
> >             return ERR_PTR(-EINVAL);
> >     }
> >     ...
> >     rval = copy_to_user(data->buf,
> >                         buf->virt_addr,
> >                         buf->buf_size);
> > 
> > Regardless, additionally initialize data64 to be zero-filled to avoid
> > undefined behavior.
> > 
> > Fixes: 378e3f81cb56 ("media: omap3isp: support 64-bit version of omap3isp_stat_data")
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> > ---
> >  drivers/media/platform/omap3isp/ispstat.c |  5 +--
> >  include/uapi/linux/omap3isp.h             | 44 +++++++++++++++++------
> >  2 files changed, 36 insertions(+), 13 deletions(-)
> > 
> > diff --git a/drivers/media/platform/omap3isp/ispstat.c b/drivers/media/platform/omap3isp/ispstat.c
> > index 5b9b57f4d9bf..ea8222fed38e 100644
> > --- a/drivers/media/platform/omap3isp/ispstat.c
> > +++ b/drivers/media/platform/omap3isp/ispstat.c
> > @@ -512,7 +512,7 @@ int omap3isp_stat_request_statistics(struct ispstat *stat,
> >  int omap3isp_stat_request_statistics_time32(struct ispstat *stat,
> >  					struct omap3isp_stat_data_time32 *data)
> >  {
> > -	struct omap3isp_stat_data data64;
> > +	struct omap3isp_stat_data data64 = { };
> >  	int ret;
> >  
> >  	ret = omap3isp_stat_request_statistics(stat, &data64);
> > @@ -521,7 +521,8 @@ int omap3isp_stat_request_statistics_time32(struct ispstat *stat,
> >  
> >  	data->ts.tv_sec = data64.ts.tv_sec;
> >  	data->ts.tv_usec = data64.ts.tv_usec;
> > -	memcpy(&data->buf, &data64.buf, sizeof(*data) - sizeof(data->ts));
> > +	data->buf = (uintptr_t)data64.buf;
> > +	memcpy(&data->frame, &data64.buf, sizeof(data->frame));
> 
> I think this should be:
> 
> 	memcpy(..., &data64.frame, ...);
> 
> instead.

Whoops; thanks! This is what I get for temporarily silencing the
read-overflow warnings. :)

-Kees

-- 
Kees Cook
