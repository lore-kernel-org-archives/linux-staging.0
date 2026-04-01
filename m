Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0AAB3B27EA
	for <linux-staging@lists.linux.dev>; Wed,  1 Apr 2026 08:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775032162; cv=none; b=EjMz4ZoK4QqS5ryyZINNaYsMylWNWEWbm95qeAkbPnlOFMRP1u6hUfRbEBQ2ZiIZciGXcPuDZBpRPLxQwboliuUrOj+StKz65g2EytHll5tgruqCBmYbNrEMSMwvyafSg3PDmWfyCY2bu7zQDlDozTswkSd+EnsWPDV10+NNTQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775032162; c=relaxed/simple;
	bh=xWymgsxKoXsfs+629uIVGha7HwRpch1lFzOxT+ljJkU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ecsmu/FUlcksgEqXqELJ/1t6BayuRkiiEi7Z6srwSst9Vg+fSSxamIZFJr+MQsfDFTGFpPkao0/mBlRVkgS2fAO7PDMfgx1oVxUNw7sw3dJfS+GkmNo8qxBIOuGgYONNd809Zx8TsnfytgyzB0yeU+OWDF6cpzxMWRYCvMVZGsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rkRbdkBd; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rkRbdkBd"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-486b96760easo72999975e9.2
        for <linux-staging@lists.linux.dev>; Wed, 01 Apr 2026 01:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775032159; x=1775636959; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HH4vyhHFmJJWYYMCxWnCs0SONovTrBJdlFBGYKRYxY0=;
        b=rkRbdkBdeGeq9NpC4DPZDF7HPlnkJ1byUVLrZQb1g8ZhkILpl02JbltIVl5H7zUQCF
         PbJHnpblOVEh05iKWf2i3Wzru/D1h6Q0Cw8FfWCNe2aoXna2HwkmFHsML5LHI+HzUVut
         shly6NNJufrjlf4aWCi5w9lVDSDpkI90GOTlEUuf1YRLyZ1CTv7t6BuAPjcbVuD+fl1l
         kF+WaehgcCpcgYJQTH2yGNwyDrbELywE/nED9Jx2Wg9tClCUzQnmucPshXR7kJW1EOOZ
         5oj2/sDSy4eNiK1oKzVraxZ0wm8J1IPNCzJAWjXjkP9fD5s7Mck0gDoBx1Nr3Y8kbcH5
         d2ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775032159; x=1775636959;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HH4vyhHFmJJWYYMCxWnCs0SONovTrBJdlFBGYKRYxY0=;
        b=HGlgck7MH2lR95ObLadIH9Z6b0Ac30uyLs9QKa6NsjhvDs3CyB8g5fDLUJP2xHbYGj
         Wt0cFzCerw5R0BwQ7OM/acueO4yPXfLLB2cIQdU7zAS5+nqljwxkrWBavN/vsnM7X8Ua
         +hHHtPh4CKjJ6FUmb2T5qtdzjDS2tH9CYJ8MzrFR5owh+rMPliEeRshXi3srLl31YwGE
         z9loyplDzgamrQLT073NNHgR6I87YrSya0UmBekunfa8DMgtkDzOAlLeglOhQ1Ovfysl
         RVp80ZimlcI/aN0D8o4r11U6XD7kjO0nfY3U3+Yr05GdOJaIfZWR01D3SNdlawfHSo9E
         puHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUej2vXbIJAz0JnzI1/X4rEy8AZiDQP73e4UCSfXkxhL25BKBwQ8meGH6++KE9Y5Brq4ycLjheYIH3B0l+n@lists.linux.dev
X-Gm-Message-State: AOJu0Yydrx2reoYbRCAY5xRbHSN7fELAk9T0jMoe+KVZGWsXkJhtalfL
	pZ9Q30L24P1EliiVFjBb3p+PpuNwA1dUkAxbequGr5nwbJL3KEYC4PLy
X-Gm-Gg: ATEYQzzdGojEqs3ShH2F5Vphai0eu/wxhTdrCE7+auxqjy95GplHpetYBVLboZUIiGr
	H1f0sehk0ZUx5ZBsnyb82aHh7I+woff7MWQD9GnPA9Hdy//XGSudtzmj1Ubd4LHhn4iiZ3jS8Ie
	CqQj4NYcC47AbLPYSEC8VRFtCiXGDR3V2dgQQ4WtWq2t7iC5kTECkQJXvO+V83n0UZqOKDUsgJN
	TI+u1JSJFqCPWbHvQvA2+9GSeCA1HOvtABtMSKSw915iKGegonDNObZr+b+RgoFLV5+B1V8dpLP
	9V9Q7+FMbap0q7rFOjFeqoCX5inRZB2YHsyY3Zk4iOymNT2CrO+CcV8ODMO9M4oFkVgFuQ4O0SM
	XS8OYpAw4JQjUT1jqEF5ke4JfIr5BqGMihj9O8HB8g0xIHEP8pqAZsB6VyrIoTtjAQ5Kb+aJwtt
	IiqQR7ebnkPsbXZuS/dCk=
X-Received: by 2002:a05:600c:8184:b0:485:4eaf:eb53 with SMTP id 5b1f17b1804b1-48883590481mr41435375e9.19.1775032158912;
        Wed, 01 Apr 2026 01:29:18 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e80a6ebsm118583285e9.6.2026.04.01.01.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 01:29:17 -0700 (PDT)
Date: Wed, 1 Apr 2026 11:29:14 +0300
From: Dan Carpenter <error27@gmail.com>
To: Sudarshan Srinivasan <ss22.kern.dev@gmail.com>
Cc: mchehab@kernel.org, gregkh@linuxfoundation.org,
	dan.carpenter@linaro.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: media: av7110: coding style fixes: too many
 tabs
Message-ID: <aczXWu23wEVVO4fJ@stanley.mountain>
References: <20260330204035.22074-1-ss22.kern.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260330204035.22074-1-ss22.kern.dev@gmail.com>

On Tue, Mar 31, 2026 at 02:10:24AM +0530, Sudarshan Srinivasan wrote:
> This patch fixes below warning reported by checkpatch.pl
> WARNING: Too many leading tabs - consider code refactoring
> 
> Signed-off-by: Sudarshan Srinivasan <ss22.kern.dev@gmail.com>
> ---
> PATCH v3 consolidates and addresses review comments from earlier versions.
> 
> v3:
>   - Removed the additional tabs in handle_ts_memory_fe() as indicated by Greg KH
>   - Retained the original code style as suggested by Dan Carpenter
> v2:
>   - Refactored change by adding function handle_ts_memory_fe
> 
> v2: https://lore.kernel.org/linux-staging/20260318191149.109616-1-ss22.kern.dev@gmail.com/
> v1: https://lore.kernel.org/linux-staging/20260316152340.238100-1-ss22.kern.dev@gmail.com/
> 
> 
>  drivers/staging/media/av7110/av7110.c | 33 +++++++++++++++++++--------
>  1 file changed, 23 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/staging/media/av7110/av7110.c b/drivers/staging/media/av7110/av7110.c
> index 607992100baf..35f7d6bb8c74 100644
> --- a/drivers/staging/media/av7110/av7110.c
> +++ b/drivers/staging/media/av7110/av7110.c
> @@ -932,6 +932,28 @@ static int dvb_feed_stop_pid(struct dvb_demux_feed *dvbdmxfeed)
>  	return ret;
>  }
> 
> +static int handle_ts_memory_fe(struct dvb_demux_feed *feed,
> +			       struct dvb_demux *demux,
> +			       struct av7110 *av7110)
> +{
> +	int ret = 0;

Don't do this unnnecessary initialization.  It just disables static
analysis for no reason.

> +

What happened to the if (feed->ts_type & TS_DECODER) check?

regards,
dan carpenter

> +	if (feed->pes_type >= 2)
> +		return 0;
> +
> +	if ((demux->pids[0] & 0x8000) || (demux->pids[1] & 0x8000))
> +		return 0;
> +
> +	dvb_ringbuffer_flush_spinlock_wakeup(&av7110->avout);
> +	dvb_ringbuffer_flush_spinlock_wakeup(&av7110->aout);
> +
> +	ret = av7110_av_start_play(av7110, RP_AV);
> +	if (!ret)
> +		demux->playing = true;
> +
> +	return ret;
> +}
> +
>  static int av7110_start_feed(struct dvb_demux_feed *feed)
>  {
>  	struct dvb_demux *demux = feed->demux;
> @@ -951,16 +973,7 @@ static int av7110_start_feed(struct dvb_demux_feed *feed)
>  		    (feed->pes_type <= DMX_PES_PCR)) {
>  			switch (demux->dmx.frontend->source) {
>  			case DMX_MEMORY_FE:
> -				if (feed->ts_type & TS_DECODER)
> -					if (feed->pes_type < 2 &&
> -					    !(demux->pids[0] & 0x8000) &&
> -					    !(demux->pids[1] & 0x8000)) {
> -						dvb_ringbuffer_flush_spinlock_wakeup(&av7110->avout);
> -						dvb_ringbuffer_flush_spinlock_wakeup(&av7110->aout);
> -						ret = av7110_av_start_play(av7110, RP_AV);
> -						if (!ret)
> -							demux->playing = 1;
> -					}
> +				ret = handle_ts_memory_fe(feed, demux, av7110);
>  				break;
>  			default:
>  				ret = dvb_feed_start_pid(feed);
> --
> 2.43.0
> 
