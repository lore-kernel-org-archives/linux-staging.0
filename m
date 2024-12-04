Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08CAE1B87C6
	for <linux-staging@lists.linux.dev>; Wed,  4 Dec 2024 17:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733332870; cv=none; b=oNm0Y2nQje9a2kCFCe/mqpynnPS2Irc97sraaEA5nB+LwopwqpBwXwbW8tAIYEcznQFatFJ/owgUrwO3IF4FjbtsT6cSLwcsTF0JU1MoQLUOZKcil/smFmS6NdcBk/U/X8knFU61AcssPmsFY8dQc6Zc9wbOEJ42nobc6MXurRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733332870; c=relaxed/simple;
	bh=cS4i0U6cm/rszccFiZBNCF5t6wXp4Gy6L1mmeeVxTLA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iXFOXGRaD6tzlgtM/CH6nN6HUaUCJiO0YnXlkPj24rfoSDosQ44QUpPUO0nccQREKBCWvdqcA8WVKWxEhtFNLRwMhwcxP3rqoOueT40dv7NHLi1oismGttRPbAGy1UlrylYTEElDblNtDNLTVlYeGs3xRj8Etzl2iwDMvdFl9ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xZh9Gduq; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xZh9Gduq"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-53de556ecdaso44279e87.1
        for <linux-staging@lists.linux.dev>; Wed, 04 Dec 2024 09:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733332867; x=1733937667; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CwUi8SmsPb5Vycsa9GB+I0BWedaEfg/jRhZVV6qa67w=;
        b=xZh9GduqUEEucKOc+Kf9iCeFQ3E5Du2j03NfUgBGcWSnmmts6JBJZ10aoXtetghEVd
         jd5ESQKfNOGwkuLSZL+pF3Nicg6XU5bthJNsIc7KLZc+lmRje8/i0hp6l5sBV7J93Iar
         cwhQvF2DlUwu93tQ0qtPnR6lfeG6QXMgRw9KhRxddJ9+hmKxjTYiOsn5CWT4CFxvF/4s
         WEhZW8qO1JLwle7sjNDyFZG/PVET07CYmPkwrKuj/0KR7Bm+MwcLVgZ+sPTnA3LAPB12
         036WLXYp04aWtkJSCg1+0Cef64AC9rZux/6To4pOlajQoOdpIMjKsLYmh8cqPXktio4N
         Z81Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733332867; x=1733937667;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CwUi8SmsPb5Vycsa9GB+I0BWedaEfg/jRhZVV6qa67w=;
        b=R0I9zJoIZGlAMeKPaToS5t+5b9q1nG5IXj2nwmC2F+lu2moJx6UHzNSWgGjzhRjAw1
         PxkDjJOo3YMCz99LG5sHjy+9zgbCVBvT3ynhcEvxV/gYg9wgBpcw8RtHxVuuLPydgktT
         vNlN2uQYbzVIrG7yE4TQVDtS4r7LIqiPbYBCvrxEZaM8FvsMEQOz8alE5sCACnJsOa2R
         caWCFMFplg0o07tkbptX1b3lmachQX2r5rhMMxosAzWZSDBuVZPkw5KA8RhmMkQA9qhr
         8xdd89vtlyHhIPqS7viB0j10O5Hgz1Ocpsw2Ktz+lmj87tSws9fGljzQJm1fuDqgUL20
         eUEQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/cMFMeggwdHTHBmwDs2E6mNiLoVuHmGn96ZqojEVMN9qGyowSoNv7i7+vZNqTb+jKXvMBildfsNBDrrnO@lists.linux.dev
X-Gm-Message-State: AOJu0YzDWHiqKvgzac5Xq3tz2XK0wjKqPrlZXUMyXGKlmnnt0wjO4M+G
	K4gqvPXx/bX3CgH7Z107wvkwh4UVF0R26hEzWHdBumQu8WDjsjkHUcdFKGobXTU=
X-Gm-Gg: ASbGncvX9/65w3jf+DXxZadV3mGicZ7CD/lMQani64or57PIg9JUF9ml0vKEXaMsxvF
	/XDBx5eYKNOnkC+/zVHsPYmUCTiTOTFqChRZPTz3X7f3il4f0TfT2rfK5JCdxrQL40XxTmhGUG5
	V6wQKg01KMB1NaaLt0AmMex+0hG8GBkQZDac7f+GXrc4lZWPtmicLpOQ0u4/AUSCPFjFfIu0n9J
	ejN7cibrULsO+tM/aEkbM1mzRgOFnj1wR8Q2PPhQYdsNRdOVjaTRRci5CnUbl+aFfK+ZOYVdA==
X-Google-Smtp-Source: AGHT+IEPTiihAPUsJWXirfrgqA0sgpTCOG2Fx4MskWfdIdP1ollzTCwt1fpOL8Ol16tbpJQQ/vIs4w==
X-Received: by 2002:a05:6512:4028:b0:53e:1b94:727d with SMTP id 2adb3069b0e04-53e1b947326mr3303792e87.10.1733332867234;
        Wed, 04 Dec 2024 09:21:07 -0800 (PST)
Received: from localhost (hdeb.n1.ips.mtn.co.ug. [41.210.141.235])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5997d55b1sm755789866b.72.2024.12.04.09.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 09:21:06 -0800 (PST)
Date: Wed, 4 Dec 2024 20:21:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dave Penkler <dpenkler@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Marcello Carla' <marcello.carla@gmx.com>
Subject: Re: [PATCH 3/4 v2] staging: gpib: Fix erroneous removal of blank
 before newline
Message-ID: <1012388b-f316-47a3-a98f-0f40dc74948e@stanley.mountain>
References: <20241204170443.28333-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241204170443.28333-1-dpenkler@gmail.com>

On Wed, Dec 04, 2024 at 06:04:43PM +0100, Dave Penkler wrote:
> The original commit removed the blanks before the newline
> in the protocol string constants to satisfy checkpatch.pl
> This broke the driver since it relies on the correct length
> of the string constants including the blank.
> For example the original
>   #define USB_GPIB_SET_LINES   "\nIBDC \n"
> became
>   #define USB_GPIB_SET_LINES   "\nIBDC\n"
> which broke the driver.
> 
> The solution is to replace original blanks in protocol constants
> with "."
> e.g.:
>   #define USB_GPIB_SET_LINES   "\nIBDC.\n"
> 

Let me help you write the commit message.

    The USB_GPIB_SET_LINES string used to be: "\nIBDC \n" but when we
    were merging this code into the upstream kernel we deleted the space
    character before the newline to make checkpatch happy.  That turned
    out to be a mistake.

    The "\nIBDC" part of the string is a command that we pass to the
    firmware and the next character is u8 value.  It gets set in
    set_control_line().

	msg[leng - 2] = value ? (retval & ~line) : retval | line;

    Imagine the parameter was supposed to be 8.
      Old: "\nIBDC8\n"
      New: "\nIBD8\n"

    The firmware doesn't recognize IBD as a valid command and [whatever
    starts beeping and sets the computer on fire].

    Put a . where the parameter is supposed to go which fixes the driver
    and makes checkpatch happy.  Same thing with the other defines.

regards,
dan carpenter

