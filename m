Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5BC32AACB
	for <linux-staging@lists.linux.dev>; Sat, 20 Jun 2026 09:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781948463; cv=none; b=Ave1v8vfH0SinpsSjPx14mboJdQ/ckFymilNku5SiULYGBakiTYCiB52SKfyW/2DABtMc1eqQNEeg6NmGmUik7ZnHeylh6lFqPOSz1pBWhHrVoHfFs03QaZrQOttqrXFnxCZJG187de48SGSEzbXcQ0spotxFUeimiOifQugruM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781948463; c=relaxed/simple;
	bh=AlGeUZ3QYvy+bZ8/zcaFDTLVaQTK5y6L+E5GcwCrFkw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qDh2b4STqoKAre2li/0H1qmV0+tWnJDLTVs7v7B1Wuj8kQtt27B4j2va1AvoummLD0e3PwdiEJycYQdTNBicRlLvir/kQfmRNHd4t9p4vGKHe+OrpRjwxddYXWw838vk/84citNb//GjxE3iTYHMc2u2+HdsAj6cV9JiZZ7dXbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nbSFOwcj; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nbSFOwcj"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so20753155e9.1
        for <linux-staging@lists.linux.dev>; Sat, 20 Jun 2026 02:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781948460; x=1782553260; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+HF98Lg0bNQFMKMo/Ru5lBzs3ltxb5oUjteAdlhOVD0=;
        b=nbSFOwcjFhANBLMlx9av/MDQHyWGpHvoCgudM5AkTfLe+dyvwnjGBIxGQdLPFtteVu
         fdl3fWeN00ZqBXZoD2NAou7jWG9FsUg4P62AA4aeec8oIfjT1ylBTpuH6TSSBBPojI61
         mrqDGQivQ8sFbfvj3LMXSIWd2DIXURRbSbC8Ifh/uM5ka0eA0+1Mr9CcLtwoahHpBvf5
         RSUZFDfZMHnnBed7ouH8iF6YXoAFkjs0eCes0nWoKuoMYbukolcNKHVK+P38X04EUyvq
         z4NDRhk21fIfdcthWDGxYLgSakDxjL7OkIXbKR5EeYrEzEp92iRIaeo1NH8iSttlTA1b
         pRPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781948460; x=1782553260;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+HF98Lg0bNQFMKMo/Ru5lBzs3ltxb5oUjteAdlhOVD0=;
        b=MovqTxp3IL7tNnDXiGJei4vKgXIVwNGFzQUeA1ljNT7bshfVo5YBMT0Nwgo4f95mAm
         8E5ZGSHv9UN64tjpYZPFUUlJH2tC+We2DPWhyHZpx8K8wYHO8ORZwp7PHm4JNhRYXZWc
         e2Bdx4nq0wltXfU6M6rIXA2V3wwf0HmnqZVxiFmGohq+kzvkzi7Gk8DspHW28xfuxEi7
         JTyAWg4HjVKZpKsHnRu2HSRbs5LVfEmWe8hWDI7kwCiHBU9/vYY7kWj/33QEnmJVNSLa
         MsATn1Z7gyfVyrE36vkqKad5tWmci1CLqnFXklfNm/RHx36K3mrbSsiLLUy0IQA8MLSz
         q82w==
X-Forwarded-Encrypted: i=1; AFNElJ9JCj2iogl/pHCavpvWj3qZ34zOudOSwfDLMmx22Sq/ViMLhKtsihuyMFozrPz0X3XmACjdGPnDfesodQ/F@lists.linux.dev
X-Gm-Message-State: AOJu0YwYMuIR0qOvt9Lgzd6KuZeR/HblN6KE2x85krCVM90iYDudlUbl
	0LrMfo1yYiAuYvYzPJ2jnPygmZrnR1gsvEzrcXO7NvhiRqoSGEbdj+Qy
X-Gm-Gg: AfdE7cm+QBwaMdcAzxNQYOcwF1qXKDMNlWcod4uVY3btjAo8OutpJRIwszBuzGwrZ3E
	ZzVXO+EiSYk57hycOS077a7JjEfOFxyFDCOEuciwXIdm97jqXLUrMxk7+6iVzvZwvVc/uffWEV9
	wqzGhauAeCx9KZdjz05Gm4uEfhBz2xIQ5ZeyZMPYxHs8MyGJPzRUqqAMRRTRgIX0dBle2gYdYQF
	SnF1+rMzXBX7KMxpNHvPk2ljKdq96yPOONPjTtgIhxT1sHEA/e7T6mPFE497wH9vdzlm/VrVngY
	4ZOTeXJ7Skt2l1+N6uVa+8bHO/EXWMPGpC3fGETLFkP3/2K9zEdA9MIKMGR5pSx97Gpuz7Lg57O
	g/4Q+ufkn/nT2snctsPSy2dp0Hh6Z8whFar3ZSKWwrpyRqmar3nWY8gbDthIDtDpY5lgPxDmyKI
	hz9Io5n20AR+yXTIG94zc=
X-Received: by 2002:a05:600c:1c13:b0:492:4e1c:120 with SMTP id 5b1f17b1804b1-4924e1c2052mr7589415e9.32.1781948459551;
        Sat, 20 Jun 2026 02:40:59 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fd15470sm149067445e9.2.2026.06.20.02.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 02:40:58 -0700 (PDT)
Date: Sat, 20 Jun 2026 11:42:31 +0300
From: Dan Carpenter <error27@gmail.com>
To: =?iso-8859-1?Q?Andr=E9?= Moreira <andrem.33333@gmail.com>
Cc: mchehab@kernel.org, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] staging: media: av7110: refactor av7110_start_feed
 to reduce indentation
Message-ID: <ajZSd4RhjJgDqn1q@stanley.mountain>
References: <20260619221524.51814-1-andrem.33333@gmail.com>
 <20260619221524.51814-2-andrem.33333@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260619221524.51814-2-andrem.33333@gmail.com>

On Fri, Jun 19, 2026 at 07:15:24PM -0300, André Moreira wrote:
> The av7110_start_feed function contains heavily nested if-statements,
> causing excessive indentation and violating code style guidelines.
> Refactor the logic inside the DMX_MEMORY_FE case by inverting the
> conditional check to break early, reducing the indentation level.
> 
> Signed-off-by: André Moreira <andrem.33333@gmail.com>

Imagine I read this commit message

> ---
>  drivers/staging/media/av7110/av7110.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/staging/media/av7110/av7110.c b/drivers/staging/media/av7110/av7110.c
> index e77be16f442c..2e32acf897ff 100644
> --- a/drivers/staging/media/av7110/av7110.c
> +++ b/drivers/staging/media/av7110/av7110.c
> @@ -942,16 +942,16 @@ static int av7110_start_feed(struct dvb_demux_feed *feed)
>  		    (feed->pes_type <= DMX_PES_PCR)) {
>  			switch (demux->dmx.frontend->source) {
>  			case DMX_MEMORY_FE:
> -				if (feed->ts_type & TS_DECODER)

And the first thing that I saw is that you removed this check.  There
is no information in the email why this is okay.  I have to look at
the code itself to see that.

The patch is fine, but I don't want to have to read the code to find my
answers.  Re-write the commit message and resend.

regards,
dan carpenter

> -					if (feed->pes_type < 2 &&
> -					    !(demux->pids[0] & 0x8000) &&
> -					    !(demux->pids[1] & 0x8000)) {
> -						dvb_ringbuffer_flush_spinlock_wakeup(&av7110->avout);
> -						dvb_ringbuffer_flush_spinlock_wakeup(&av7110->aout);
> -						ret = av7110_av_start_play(av7110, RP_AV);
> -						if (!ret)
> -							demux->playing = 1;
> -					}
> +				if (feed->pes_type >= 2 ||
> +				    (demux->pids[0] & 0x8000) ||
> +				    (demux->pids[1] & 0x8000))
> +					break;
> +
> +				dvb_ringbuffer_flush_spinlock_wakeup(&av7110->avout);
> +				dvb_ringbuffer_flush_spinlock_wakeup(&av7110->aout);
> +				ret = av7110_av_start_play(av7110, RP_AV);
> +				if (!ret)
> +					demux->playing = 1;
>  				break;
>  			default:
>  				ret = dvb_feed_start_pid(feed);

