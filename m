Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B15C15383A
	for <linux-staging@lists.linux.dev>; Mon, 28 Apr 2025 05:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745819003; cv=none; b=fDHX/VDtD3cF8GbwFsMHd0ysLHlopOAOd6antc/TGZAHhy9/vmKLCHU7xSztGX5xLW+dHFuOHj0yRuZlQAir6e8Ml7ZCLH9T2UYR5UJBI88zwkNbaouIiTUSdJL6fsLVKRTiR273v89Fj6SiUSvwn1GfkIbNNh/e2zMioKW7qqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745819003; c=relaxed/simple;
	bh=El5m9bn6jLg7dx1/0uc6SOz5xQODHTSC++POmhTAQ0M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MJyidKAwiVnuCqs2oncq1gWVn0dOh3ugTsjYJXcLfP1joZFGHiCDfcSJfFBCX2IszcGCcNpMXS9iQq0WgUZHjC+Eca8FJZJ1TIzdnlcgoAZ/5gOdKWd7nj1HgzHo19vsdmhzW3RriNImi2Bu5YK5spYB4f2D9b4WwnJZ8oliDts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JxhLaMqV; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JxhLaMqV"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43d0618746bso31028475e9.2
        for <linux-staging@lists.linux.dev>; Sun, 27 Apr 2025 22:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745819000; x=1746423800; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hZJn25BoekZI/eA3vGGcSBEp+xipteVFmvyRDRMifpw=;
        b=JxhLaMqVTGimyxQjyGZV5PC9/0DVEwOEUNk5foEuI5XG17ke4fqgg/MRm1skr58Y2H
         iiBtpWm0tf8e8NQ1B/dEzd/cvoqUZHofWDeMYaMxC9gECWp3uKWY+0VRUKDwsYA7WzBr
         qotAO1kW0vMLd5bxTY1gBxtogng3bPewEfKl+ybGQN3sSqT0w0NLB6cWZhosLXECPraK
         79X3bC+m5k1/DICjY0tXSQ/GtrMH9Q0O2lDK4O1qeDwuYQKGBGzLm0oPnO9psbIVvo2s
         eC+DoWor8Hb87WzkoRJDjGsNkUv6bmQk+Lbj52OfcIqZKW4NLdWEbOJNPxs3124s+Nv3
         uKYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745819000; x=1746423800;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hZJn25BoekZI/eA3vGGcSBEp+xipteVFmvyRDRMifpw=;
        b=o5+UwAX++0Ylkaz0yDbCJ1GPxCjeWOgdCgfq2QGIqSMw0r3zHaI+CjYDoqALaiduZO
         en1Mxa6xYfzJwnOEsoUYjSk7WzId6m3M38CAXhJXg1OTSHIqT04wQr6ObB8QuiRBy/mY
         DiPUu6liUBijX/Zqj63nfoEaEJ/eSqiqXC4v7zmYsZWk958b131hNtF4XqhBIKODU68x
         Kntb30N33tfTkMoyMKbtaiAhj2R8Vk3GruUrAc/tNtNmxqCMbSbdG25eLn2Jn1eLV6xC
         F5GZkk+v07iKyjiU58zeSAMEhAgggxJ9843sGaSMTxPH1/bFaDs3CqqfLLRd+ii9z0CZ
         vZHA==
X-Gm-Message-State: AOJu0YzFLGKUmwhRDrQchK/iAz5rblUBaXHMUUJ5ZGoVYd9RbMk6K8/n
	VZ0cgA1y7rR5lS1tL3f1ujyGne+CnYJc8qClGJ4FrponVn1PndYI/Shj3d2nkUu1Dl5xHJ7btQS
	N
X-Gm-Gg: ASbGncs4Oh88WBZWsDBQD72U1tP8qxQXFxOOzuiNvzpWv7SgsDCJGGTXaqb4S4lus1g
	qjzESLjopWuEpiKwK5OpkFOdKrk21Zpghkg0yR5VZstUWAqwT1sAQFdwtXER/3nS+ZuMPWJV+nQ
	4L6ljsSCioP+da2fp6c8wr3AdvIPt0U1ceLjUEXIWp44RoHp6FT/rY4gF3LjXUI++HcU9uBmO1o
	t0V1s/t75QHWa8Gn5wjJ8ZilDmm7IUiVsWpuukKoZwyB2KM33JxdVvmfdB/gZCgU76K4YXCN+Yc
	7ua6LZH5MDgRYXFxrXIhNtLxHqN2w+eGiqeYSYSiF6uP9dRfk2NsnhjY
X-Google-Smtp-Source: AGHT+IGbf7WsEizZCaNaFPAic9BYrXVx2UhCehpiTFncD9l8/Lcnwd9nsP9IfeSa+To1zsLoW7jj3g==
X-Received: by 2002:a05:600c:1e04:b0:43c:eeee:b70a with SMTP id 5b1f17b1804b1-440ab846cecmr56444255e9.22.1745819000206;
        Sun, 27 Apr 2025 22:43:20 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-440a52f8861sm116239235e9.6.2025.04.27.22.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 22:43:19 -0700 (PDT)
Date: Mon, 28 Apr 2025 08:43:16 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sridhar Arra <sridhar.arra@yahoo.com>
Cc: linux-staging@lists.linux.dev
Subject: Re: [PATCH] drivers/staging: Fix indentation and add mutex comment
 in fw-management.c
Message-ID: <ae7930bd-d4f3-42b3-bc1a-d25f29419046@stanley.mountain>
References: <20250428032621.656795-1-sridhar.arra.ref@yahoo.com>
 <20250428032621.656795-1-sridhar.arra@yahoo.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250428032621.656795-1-sridhar.arra@yahoo.com>

Patch prefix is wrong in the subject.  There is no commit message.
You're doing two things so it should be two patches.

On Mon, Apr 28, 2025 at 08:56:21AM +0530, Sridhar Arra wrote:
> Signed-off-by: Sridhar Arra <sridhar.arra@yahoo.com>
> ---
>  drivers/staging/greybus/fw-management.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/greybus/fw-management.c b/drivers/staging/greybus/fw-management.c
> index a47385175582..f59c5c7fd590 100644
> --- a/drivers/staging/greybus/fw-management.c
> +++ b/drivers/staging/greybus/fw-management.c
> @@ -28,6 +28,7 @@ struct fw_mgmt {
>  
>  	/* Common id-map for interface and backend firmware requests */
>  	struct ida		id_map;
> +	/* Mutex to protect access to firmware management operations */

Do you really feel like people will understand the locking from just
reading this comment?  It's too vague.

regards,
dan carpenter


