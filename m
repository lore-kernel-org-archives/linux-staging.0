Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D3201B4156
	for <linux-staging@lists.linux.dev>; Fri, 17 Apr 2026 14:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776434540; cv=none; b=iLEOWSUnvamSFeYk8DLdxPjZ+6zFaCZglV+g51OxaN9MzkAxtNGKNty4LKIQ11CS5/siQhGlmkAeiWrBLqu5wE4TG9FGnmh0nS9MalFA4kajBJ5jwDP+ETLCI2MMhbbrMvXczirpUW5QyKyOj+3cPkMZnzWEgJYkWFVYmmCWn8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776434540; c=relaxed/simple;
	bh=dZ9GD/Olh90uG0JI2WwMZDNp/4JluJw1R4f5usRRnXs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dOR6gDZH92+57F9d07gD8fc0PEKD+rxBbf+Ofsw+zln5JuufIIcfD/VqL8dYlOIMefsbKv/nmY3hou5ax89/TPZ6KFY8esQbPggw6DLOC3fxRIygnCIOIHuIX2qb+8OsBwLMNM7MGdvLA1yPF05zGBU0WaXX8wCx7YgrVBRPK2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gCQu6AI4; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gCQu6AI4"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488afb0427eso9200575e9.1
        for <linux-staging@lists.linux.dev>; Fri, 17 Apr 2026 07:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776434537; x=1777039337; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=u1g+4ReXpg8o/Hja17dXPjGo07lyXXK1KMLo4Txko/I=;
        b=gCQu6AI4f4fZFDiKgW9U0518d/+2oIB9SIcQlVgRWV17POCS8VkOdR5KGYvZRZLo0g
         LMmqD6c4SVsdeQMeGrRIShxSeIB9r6OX60waBgcy/oNWyxbUxaao30Rgq3KYqz0rBAF1
         kJiLNpN3LvUp0rZDqDd1HG+gn2img4P6bgvoY5hpAJ8Tc+VVnvZeGoaGJovDDXlEOGuY
         aD5ltRy4GUT/1DTHP5SITSVre48UWWdFopyi+d1IXrnRYhKmVC82zYwSpn/u6LYtzgXC
         GsOSoRmh4170vGKJ1xFLAA5xgeHkp/TDyrtsl8C64N5yquOYKCSSS6NXAXYH3AdqRmFy
         n7mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776434537; x=1777039337;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u1g+4ReXpg8o/Hja17dXPjGo07lyXXK1KMLo4Txko/I=;
        b=aiHezcy6uZi+36H0TVm359hgCDeY7I5l0FpxUOPAqqKe53z1/r1kXsTZpfcPTxyIOv
         Bn1bRaDmt6Siutz/MCrTCRCF0nu/nxer3YoG1lYjzQf6N2djUANdVFm1QjKrTL8gUSii
         k/nARS+1iZBTNcpNKTrUDMPwY2zvpERUj7w2yARB5vv/YA7120eZxTq8aeOipFFV63++
         dZCG++CqtKDWHoRqI1y13NSXpsVCUXCTSsEmTP0hHbVx8oXyT6Lr57rsW70xf3lQN5Gn
         ZOONb2ra1A7cMuHTO/tWIAB4zTzp2olTmVfG35NOOrIkYaEBMfB+R8hSnglRGGEPh4iG
         nTUw==
X-Forwarded-Encrypted: i=1; AFNElJ8JgN4s/b4tzB3Ray9nhy1tq9SMzwiGpOzl9EZejV/UdzNQVu6iw1v0/6rbIXYw7Ahms7cTMZWQOX4iX3TU@lists.linux.dev
X-Gm-Message-State: AOJu0YygJieEleB8pQyv6OZfujY35dKy4fKctc7JAYAIFRzqpN8h5BNg
	BFsT9Ais/Nn2xXBKMF/KElFCqB8GtRI7c+keNi8nGLbTFSWYU3Zy0pJH
X-Gm-Gg: AeBDietGAH2ExCXuKPym/ONfazRiIM7xHFvfzlqYbXHqN8lv03d+fhVWGTE0YzRFsGg
	orzRUHWqRf4jJxRJucSnIN383+TFTTg/o0Th4mYurB7MSUAgeKpf1cCMIzriGyR4MLbb/r0xIHf
	zNGFtj3fl4MKdJaocuE8OEjsj2rLvXnjhCCGFwR+qxfnpkejnaw8fftuu9LiQmIutjYDr/Xswsf
	tVMhqyCkDTE3vcFXbm28s20nZJ+0jL1vxQ3pyDPQcf8QXjKQpKMNJx/ZtUdFmulcrziOazHCR+b
	+o+9z+C/62cnMTDDiExFjDUqG0DI0KXQITRtC1LDXZkLNbLfNXLvNvf6jazRFwCZTQ8981W0Daw
	JzwLKbuw8KPVVWCz864RQ5urFXAnVBceogtRNNsHi+57CjE1mQl5o8IG3U6cOqEEOF3iCV0zVfw
	jRPF/EfFHoki2vanGBtJp+7GgfVr4rwA==
X-Received: by 2002:a05:600c:c0db:b0:488:a14d:3d81 with SMTP id 5b1f17b1804b1-488fb73a9a2mr33391295e9.2.1776434537206;
        Fri, 17 Apr 2026 07:02:17 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc1cfbf2sm46780695e9.15.2026.04.17.07.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 07:02:15 -0700 (PDT)
Date: Fri, 17 Apr 2026 17:02:12 +0300
From: Dan Carpenter <error27@gmail.com>
To: Maxwell Doose <m32285159@gmail.com>
Cc: tsbogend@alpha.franken.de, gregkh@linuxfoundation.org,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] mips: cavium-octeon: remove cmd queue state and related
 typedefs
Message-ID: <aeI9ZDPoP0apY92N@stanley.mountain>
References: <20260417023602.112359-1-m32285159@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260417023602.112359-1-m32285159@gmail.com>

On Thu, Apr 16, 2026 at 09:36:02PM -0500, Maxwell Doose wrote:
> diff --git a/arch/mips/include/asm/octeon/cvmx-cmd-queue.h b/arch/mips/include/asm/octeon/cvmx-cmd-queue.h
> index 67e1b2162b19..faef98173a4f 100644
> --- a/arch/mips/include/asm/octeon/cvmx-cmd-queue.h
> +++ b/arch/mips/include/asm/octeon/cvmx-cmd-queue.h
> @@ -71,6 +71,12 @@
>   *
>   */
>  
> +/* Global pointer to the state of command the queues
> + * Moved here to satisfy requirements in cvmx-cmd-queue.c for EXPORT_SYMBOL_GPL
> + */
> +extern struct __cvmx_cmd_queue_all_state
> +	    *__cvmx_cmd_queue_state_ptr;
> +

This is arch/mips/ and that's a different tree from staging with
different maintainers.  Generally, the rest of the kernel doesn't like
churn so I probably wouldn't send patches like this one for arch/mips/.

This comment isn't accurate.  This is a Sparse thing and nothing to do
with EXPORT_SYMBOL_GPL.

Normally we would decare variables like this in a header file, sure.
I guess the original authors wanted make absolutely sure no one ever
used this variable so they declared as an extern in
__cvmx_cmd_queue_state_ptr() __cvmx_cmd_queue_get_state().  It's unusual
and paranoid but I can't think of another reason why they would do it.
Generally, outside of staging, you just go along with whatever the
original author wanted.  They did the work after all, so they get to
decide.

This patch removes the declaration in __cvmx_cmd_queue_state_ptr() but
leaves it in __cvmx_cmd_queue_get_state().  We definitely can't do that.
And we can't mix this in with a remove typedefs patch.

regards,
dan carpenter

> @@ -234,10 +240,8 @@ static inline int __cvmx_cmd_queue_get_index(cvmx_cmd_queue_id_t queue_id)
>   * @qptr:     Pointer to the queue's global state
>   */
>  static inline void __cvmx_cmd_queue_lock(cvmx_cmd_queue_id_t queue_id,
> -					 __cvmx_cmd_queue_state_t *qptr)
> +					 struct __cvmx_cmd_queue_state *qptr)
>  {
> -	extern __cvmx_cmd_queue_all_state_t
> -	    *__cvmx_cmd_queue_state_ptr;
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

>  	int tmp;
>  	int my_ticket;
>  	prefetch(qptr);

[ snip]

> @@ -299,10 +303,10 @@ static inline void __cvmx_cmd_queue_unlock(__cvmx_cmd_queue_state_t *qptr)
>   *
>   * Returns Queue structure or NULL on failure
>   */
> -static inline __cvmx_cmd_queue_state_t
> +static inline struct __cvmx_cmd_queue_state
>      *__cvmx_cmd_queue_get_state(cvmx_cmd_queue_id_t queue_id)
>  {
> -	extern __cvmx_cmd_queue_all_state_t
> +	extern struct __cvmx_cmd_queue_all_state
>  	    *__cvmx_cmd_queue_state_ptr;
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

>  	return &__cvmx_cmd_queue_state_ptr->
>  	    state[__cvmx_cmd_queue_get_index(queue_id)];

