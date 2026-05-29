Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69A0261B71
	for <linux-staging@lists.linux.dev>; Fri, 29 May 2026 10:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780051157; cv=none; b=Yqpfy8oPPRf6BFE1Sb3/7H4fC+YD0xKEpLJ5CGc7+vqLkVK6NbXGticdITgxkwvVYO/GJS7tIDSINWLrXIa75fId85FrW1OWIwRmc+K/wJLR1SbhGvaIbMJv2tTUnKuUDDSEYcpLXZuYAxbTkPQx1pP7VwkbQnt9LafT+h6rpvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780051157; c=relaxed/simple;
	bh=rvgiEl9LQVqE5UrFPQ7CggVAH3MVjiWMkIFeKt9hmBg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O4b1zduRVwxKyBdQSJrQCo+F3jpoGwqmcEkF0E3rMu2+QJnRe2IGbMG4BRetWn3grjhgz4h7qT4x2I2pr1caNx+0Sch5XkCTq8Ow8vlgwnfAtGdLSzPD4otSJnkIzOEd09vUOA40UFwlrzByYcEO3C3etbLQZX57e4ixn/Eqj5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c1UxDz1M; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c1UxDz1M"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-45eecb8bf67so1092950f8f.2
        for <linux-staging@lists.linux.dev>; Fri, 29 May 2026 03:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780051155; x=1780655955; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JRYr8moLEmjRWHLilv4FqgfxJEhbzr36lw1lU/Q2qfI=;
        b=c1UxDz1MyQJRdU0n6GBSTITjfaKdmzxFVl6QH1Kdptl2XTix5tLOU7XHc3Ix8vjRO9
         DSv/DKMjIhlbl6lZKVCp5v6iR+ILHQaqGwumQcRSvz+j3rzjYfid3DApgBjE5RMP1yQz
         Dl8kGvP4l2gKUbcOd+NBExmsarCszxZzkWww3VnKLwS++V3b+ex5katdAdraf4yuaUMD
         th2kUT8W07fogjz/GBPmxfafga6aqVhxOfXkGBjL1x+aCIl5L2HKvD8LasS9XJv8K9Vh
         pExZJe3W1gn6LV7KdRZ2hTDCWfeoZsKRRz0FOCxvyrwAuqQHpvnvH3GPJ9uk1k/Cgrjy
         Q8vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780051155; x=1780655955;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JRYr8moLEmjRWHLilv4FqgfxJEhbzr36lw1lU/Q2qfI=;
        b=LfUcLGQOLvfL5r2zLnqtXv3JCvw2/etQNGWV9+xYLqv2XzCO1kxXo/xG4VJIKKpy9f
         Tv8z8JkL9uiMjydobkN9wqg4hBm/R8y87meUwz2ijrJeu3WSZ+PGXy/BB/55BRpCHPN0
         FvemuJFY17ygX5s6EUTYBQwFz0R4oKDzA59I9KcQY7BuuZyYfFpbPbVuYIof/fN58cFu
         3q6s5CaN2nhgkKZ1eTE2tqYXWXP8EnuxTFbtUsbdI2WDUEjUg3TNti5SB2fnxZzBY+/h
         jJduCjvSUCRiDPQbxxibxGminNEsv3qj/K30Qt0anP3qjDsSxbI5rRZoalSyLW9tqu+9
         ahZg==
X-Forwarded-Encrypted: i=1; AFNElJ+xcbTfR7stvLGbT1jPN+2RR4iA23Q1As5GeH89rz9rbVMBD3gVlhBRObroWXcDpgg6sScSlMTxo/+chVMU@lists.linux.dev
X-Gm-Message-State: AOJu0YwliwVhJRaCz8RqcppVlmDSbJ9rr36zfELlpmh3WJ0VA18JoQvx
	uDQuKGkLJlpmqGt4yPw09glPH13yB5LJXHZFWObBrELOYWJGD4mEfJrv
X-Gm-Gg: Acq92OHwcE/BcR6Cl/nNas4ts5BwA0cKNhL26jYdJ4j99Ziv0vWRcaPtyMzq03OeTW4
	waNQq50V16kYa20lHk0yJkuibHrqLcJBmQ1oEkyeEhWto3v7WBSGbUSf+OI2Ilf884hJ+PCetNV
	Oj54AL4EF55hKsnC96gsOPQ8wDTkWOC1J/ackjE7ziGZrZVgFM/hgQXA46IZAJQCgPJ4t7m/dh2
	YI0YKmGiY7ymHmJdLg5RQsm2diAsTxm+ounZouWB3BUIJnoOqsqcMPasV7dOiMd+QPMwNDLEqlK
	pXgJl0cArrpPW1mQ0akEElOpJM3QcMc3a/rALMhMojC0AnZJ8FLrsU/G36oWLt2p+ri29r3dvsz
	2PCL8L7veNUdqi8byyFZlmmarJEDhAzQ/0a0/RKtYvNhuYQgGaCtysrp4/Zzsr7qlG4TWikeabA
	2UlGCR0xxZd7P/pT9ZnYehnYJqU5Zp5z4SxIjQuZvRoDjY
X-Received: by 2002:a05:6000:4697:b0:45e:b215:12e9 with SMTP id ffacd0b85a97d-45ef140238emr2957539f8f.6.1780051154817;
        Fri, 29 May 2026 03:39:14 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef357635fsm2492792f8f.33.2026.05.29.03.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 03:39:14 -0700 (PDT)
Date: Fri, 29 May 2026 13:39:11 +0300
From: Dan Carpenter <error27@gmail.com>
To: Onish Sharma <neharora23587@gmail.com>
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: sm750fb: remove unused variable
Message-ID: <ahlszyY6Nd9ANz-X@stanley.mountain>
References: <ahlXYIqzu4O5-u9J@stanley.mountain>
 <20260529101242.10189-1-neharora23587@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260529101242.10189-1-neharora23587@gmail.com>

On Fri, May 29, 2026 at 03:42:42PM +0530, Onish Sharma wrote:
> Remove the set_all_eng_off flag and its associated cleanup logic.
> The variable is redundant as the hardware should be initialized to a
> known state regardless of prior usage.
> 
> Suggested-by: Dan Carpenter <error27@gmail.com>
> Signed-off-by: Onish Sharma <neharora23587@gmail.com>
> ---

Sorry, miscommunication.  This breaks the driver.  This is also a bit
more involved than I thought...

There are two structs:

struct init_status {
        ushort power_mode;
        /* below three clocks are in unit of MHZ*/
        ushort chip_clk;
        ushort mem_clk;
        ushort master_clk;
        ushort setAllEngOff;
        ushort reset_memory;
};

And struct initchip_param.  The initchip_param is exactly the same but
with all the struct members renamed and comments added.  They have to
match because we cast back and forth.

Why do we have two different struct that have to be the same?  You might
think it is for API, but as near as I can see that is not the case.
Maybe it was at some point?  We should get rid of one struct.  Which
everyone is API is the one we should keep.  If neither is API then get
rid of init_status and keep initchip_param.

After that we can talk about getting rid of setAllEngOff/set_all_eng_off.

regards,
dan carpenter

