Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3511725B1D6
	for <linux-staging@lists.linux.dev>; Mon, 12 May 2025 09:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747041426; cv=none; b=AJQqBBiud7e5yQx78R1LxZydVu8yHdaE1ZWitBEldVeYWaErU0ZS1mzXUHbnY/apo4Z94Jn7G+aY82CKMxgBQVHH8tTwNmhWlQzQ84+03eGDehpWjabPWIjyAgAktcyeeiCaxHsIts2hI36hmPJmFHCKeFfODgzjvCk2+1NJAvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747041426; c=relaxed/simple;
	bh=4JHWQtD5VUidfJI5qSDVeFsSE96Iacz0eGd/SM8Rb7w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YyEULQO/3mntI2LlQnfqWpqKybnjFf+CN4CW2MX+DTO1vlxz7bBADkIx6eYLl3NVTmIoYehOR59ATPOkdZnq8mqkLM6CJvftsk6lCHDfuCNmAlAOYx4G6ZJGB7tosibLsRoUKwjqh/4kiCGAJdt3s5B8c5Pee+/vSmdVbe9B6WI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ftZs+VBA; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ftZs+VBA"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-442e9c00bf4so545155e9.3
        for <linux-staging@lists.linux.dev>; Mon, 12 May 2025 02:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747041423; x=1747646223; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nRFLE3s9Bruf1VCyUAW6Rf8xhCic7rN3m+YlZIBz8vQ=;
        b=ftZs+VBAy9jtUNujtGjsTwo4W98rXcEZzLcfGulc/k2VsV5leAoUmVKIBZVvLS07Mz
         9g5+M5GJkHHt+GLID4AjTYbMJQaoEhlNOKejHI4NWHusQ/UU995xor/m5zkEMSjTGJUD
         /Y2I0Qj2z2f9qGFxzYZwADoNXG5IPklSZbhzJY0XphX7yK/1d8oH//3N+9tSRE/Sgp9v
         Gax5UBfvFaQLFuVBX2B1UZqjqvCPn1fNkbUcJLmTgzT5u2USPgRd5jta/PO5ciK2K5U0
         L8TBWT2VeiRfyD5v7NGaZ0W4ycfnUxW+D6lDb+LK1xSCv4XZmZEWCaD+l0RL6ZDIMvcI
         AE0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747041423; x=1747646223;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nRFLE3s9Bruf1VCyUAW6Rf8xhCic7rN3m+YlZIBz8vQ=;
        b=V6UAk9ap52Npjt825g2su2ulRu+kuy50RwfEpmRW3UKYyh2aXbgggYwGym1MGDjPrT
         Lvk6/j1IGRPv4G4yzV+chUCAFBKZQVUqQWJ4FxQnrikhW4HhvZg907zAbT1hxDm5sys5
         qsH7GcN5faxOR21SebRXaEg21rSjTmcYranFH3NWwREG9NUiSRK+hBOP8Ow3fUIG0iON
         LyLo2qjPle9Ew+V56diFC+V04MldVztceDxJOkOKc6OTZZnDJK5WHkxAeVVwmYtkLJZQ
         61lw4tdWDVQlFua5EA0UFw2X69ZUA/0A/wan9ChM+vG5Xp9ClYyTrfhWMXN7SDIkB7C5
         OX1A==
X-Forwarded-Encrypted: i=1; AJvYcCUVVM+wcNlaD10459yZlTXvgpyflgNcFAJ51pKScyJAugjgXsfS9n9CH3jUY7Eitph5z93VD3TDGPl+GnZJ@lists.linux.dev
X-Gm-Message-State: AOJu0Yzn5fPQia5inhSdNcnzN3sqjc30DqR87QNxNZtQpwLTXISXvYii
	V7OVOgpcJe0QqBCLSxmMmcZNWlnex+PlRtYkAMxSxN4zIJttDMWn
X-Gm-Gg: ASbGncuSABPqnE2amuZsUEOMe24Iv08BUWlstRAh7KMxW6H9O8EHwVh8WcoVm6GabTv
	yllRDky/0ShdLKABwVmoYXOzOLOeJqGRMcvV5WT63hUcZGORVGjF02NFvcGUm8iUD5o36zF0tOH
	y5Chtxs7sG3o8s2Z/GqYxUcJ7LliVR6DAev0Aaudqd9dgRMH+kwWPR3jocmNpqEHyX0PLcIszFk
	5xhy9P7iBziofELTPrjMjGmP7XuRapEX2YWj11TmLDqK+Fvgppbg28yuvHcU0ZrYZYzCwHdaRIX
	eNkY0+rQEyhJ4dHRZX0zMtSAszOoRP/7l4KuaSK7cjR3
X-Google-Smtp-Source: AGHT+IEkFmH1KxHL9I9yJXaVSzYPTzM7e7It56PAmN5cCAz7vgAoMC4bm8LOyC0GJ+1F/pUgvWXhMw==
X-Received: by 2002:a05:600c:8212:b0:43d:b3:fb1 with SMTP id 5b1f17b1804b1-442d6ddd806mr99404725e9.27.1747041423109;
        Mon, 12 May 2025 02:17:03 -0700 (PDT)
Received: from egonzo ([2a01:e0a:9ad:d3b0:ec4c:9f30:1dfe:440a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f57ddfd6sm11596764f8f.4.2025.05.12.02.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 02:17:02 -0700 (PDT)
Date: Mon, 12 May 2025 11:16:58 +0200
From: Dave Penkler <dpenkler@gmail.com>
To: Thomas Andreatta <thomasandreatta2000@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Thomas Andreatta <thomas.andreatta2000@gmail.com>
Subject: Re: [PATCH] Staging: gpib: iblib: iboffline check if board is in use
Message-ID: <aCG8ivhN64EYsuki@egonzo>
References: <20250510172419.274616-1-thomas.andreatta2000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250510172419.274616-1-thomas.andreatta2000@gmail.com>

On Sat, May 10, 2025 at 07:24:20PM +0200, Thomas Andreatta wrote:
> Ensures that a board cannot be taken offline while it's still in use.
> 
> Signed-off-by: Thomas Andreatta <thomas.andreatta2000@gmail.com>
> ---
>  drivers/staging/gpib/common/iblib.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/gpib/common/iblib.c b/drivers/staging/gpib/common/iblib.c
> index 7a44517464ab..0ab5680457ac 100644
> --- a/drivers/staging/gpib/common/iblib.c
> +++ b/drivers/staging/gpib/common/iblib.c
> @@ -240,7 +240,6 @@ int ibonline(struct gpib_board *board)
>  	return 0;
>  }
>  
> -/* XXX need to make sure board is generally not in use (grab board lock?) */
>  int iboffline(struct gpib_board *board)
>  {
>  	int retval;
> @@ -250,6 +249,15 @@ int iboffline(struct gpib_board *board)
>  	if (!board->interface)
>  		return -ENODEV;
>  
> +	/* Ensure board is not in use */
> +	if (mutex_lock_interruptible(&board->user_mutex))
> +		return -ERESTARTSYS;
> +
> +	if (board->use_count > 0) {

use_count is never zero for an initialised board so this would always
return -EBUSY not allowing a board to be placed offline

> +		mutex_unlock(&board->user_mutex);
> +		return -EBUSY;
> +	}
> +
>  	if (board->autospoll_task && !IS_ERR(board->autospoll_task)) {
>  		retval = kthread_stop(board->autospoll_task);
>  		if (retval)
> @@ -262,6 +270,7 @@ int iboffline(struct gpib_board *board)
>  	board->online = 0;
>  	dev_dbg(board->gpib_dev, "board offline\n");
>  
> +	mutex_unlock(&board->user_mutex);
>  	return 0;
>  }
>  
> -- 
> 2.34.1
> 
