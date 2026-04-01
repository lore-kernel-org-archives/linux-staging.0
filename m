Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07EF3D4126
	for <linux-staging@lists.linux.dev>; Wed,  1 Apr 2026 09:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775035978; cv=none; b=kPhyVRnz1v33vRJfy3zCaPpAoJ4ZUhVVoDVBN4paFollt3ZHuQoXS3brmhpDsqKwE0sCFF+OlCGWvQnBrCPiehPi/PJ/FFWQz778QPm/uD4tpLc5GEdk96lnubSfcw2tQhHh3hU+OAk/8aNsZ/D9wwqinaI/NowvejnGJ+TwO9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775035978; c=relaxed/simple;
	bh=9Y7W41pctDZ86bQLCH3kuhubLiko2Pof2yAkh+IQB2A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VolUVQeJjqirXknUeK7jPnQ1dajP1R6M68qxXph/nuoVZnluEz6O+PuCmOI7pesqpqKKmefSnNoqJQYAO0HzOF7YfW73S1/Zt1tpGBlLOduMt3iIroGRb4fRs8ekuDltkiqS7vf+LlX6cdeI3swqxRsdgZjvhxhCdBHlyzFjZy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DZT1uvlY; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DZT1uvlY"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-486507134e4so75233085e9.0
        for <linux-staging@lists.linux.dev>; Wed, 01 Apr 2026 02:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775035974; x=1775640774; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qDzMOb+8lR1XzsVdZxlSyEr/CwgkYchiH6+SrA9cQBI=;
        b=DZT1uvlYMyoYK1iYz6HSz44T1UqSs0h/7WvwLl91V6JS2TDmXgdIRaJ1TOBUXMGX4L
         KqS1vPD1rzrlXCrcymkTWIaYe/b7bOV8C1XX4aOwErXsXIwZK8ifB63/sSy0EBOhNCCZ
         N87yH8pMaVWJcOdAiv9WS9wBa3p/Sev7faLipM4FRgHIgrgOAEJI51XmQjvv5QUU5wpo
         HHGOWfYTLzGWi2HzSD4INZgHTSZ3rE3kkAJC4vPGm8eleuRkJ9DFH6ATU3krknWhAwV4
         gzKpwbPBBS/FGkjpyomrVRtpfO8i9XokC/uK1mbTWsx3hNb+5LTf8AVnetaj1k1Gx+Bf
         6Qsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775035974; x=1775640774;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qDzMOb+8lR1XzsVdZxlSyEr/CwgkYchiH6+SrA9cQBI=;
        b=p+jCh5MI7y9nm2p/tAFIwXBqPtaUiA+FAyKJ+HWmqQXz8V0d7YNwjH1GSSEtj870tF
         LIv8L0zA/KAE2sTNY1jFuCcAUhs2KdkNRBPfT4HNk9q0dRWX/g+UQR5NvvKX+KD0B4Et
         KIokMQVpY3QI1m6dfi7O4IvWzSTQyhEaCyi0P4LdsRVxi0wsSqmOFKNp6+WxHhxph0JP
         ske8glMzzkSNh6CtGVOWTa7XNMkXD0g614QK0tt62Sau8KkWcPEQHW0jLsKQX4nns8lm
         T5mDBHYbSjvXLsYAoAxTVWGp8JlGRA+llf6X/s2Mk6FEQe+tPSmZsLdtE9UCeStIzFUP
         KHpw==
X-Forwarded-Encrypted: i=1; AJvYcCVTNa5sNZyHdqFLSxn8pvNNWeBDVsHImdyLJpqgNRIo7l5ZI20KLbjXbwxdLA7ffmNgHyRvIv81UX5iRX2D@lists.linux.dev
X-Gm-Message-State: AOJu0YxTBmjHacghqnde5c6b3GgjdQWS1vpFOiHKXP/EizyFAkq5WJBj
	ewd61w5VV03OsDv0HjW5IA48SD7KKsueWLI9e1EPf4P/sMQMVS0ifMYv
X-Gm-Gg: ATEYQzzAihiuUB06Wx4qcNuAyRk99mW46c4U5EctWDtdFq5TcVIWAstobLYkRyGKGme
	+jcqF3rOVewHw3Y7PZqGPP4ofnmhah61G1KyG0XwfCmI0q1t67AEXDvknxZA4+Xjp4x3ANeLTqK
	7N7hs90H7cPdKFPIeGzG0JY8QTDU8ljs6NGyxtJmtVCmSIgZM+PgVEJ+xgI2UQoYRq7SC/qH1m+
	IVTUtfgxihSDzdjiQAmUDAhbv08CbHfrJHNnVBOWbaxebkcYuPWChdQTakwHlLlYqeaVBgUwPZ7
	j5io75/+Z6TSobVjNSGmiPq6tgWntytFrG1HAIAD57PHldpPJH9BXAEvpq91OXWcyfZxZe3u+dQ
	9J1scWeGU+Vkou96iot1wcUAyrta7wCCXGzZ6gAKaurOtfCVh7p380zYuJ+KzxZg3lX5xe9ls2E
	BsEDqI5ihdFpUkvBrIcN0=
X-Received: by 2002:a05:600c:4f91:b0:486:fd71:e609 with SMTP id 5b1f17b1804b1-488835b32a4mr40774435e9.25.1775035974146;
        Wed, 01 Apr 2026 02:32:54 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887eb5aff3sm145259245e9.15.2026.04.01.02.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 02:32:53 -0700 (PDT)
Date: Wed, 1 Apr 2026 12:32:50 +0300
From: Dan Carpenter <error27@gmail.com>
To: AyushMukkanwar <ayushmukkanwar@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] staging: octeon: ethernet: replace pr_* with
 dev_* and netdev_*
Message-ID: <aczmQgWONTe464um@stanley.mountain>
References: <2026033119-endpoint-jimmy-6b83@gregkh>
 <20260331111757.110703-1-ayushmukkanwar@gmail.com>
 <20260331111757.110703-3-ayushmukkanwar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260331111757.110703-3-ayushmukkanwar@gmail.com>

On Tue, Mar 31, 2026 at 04:47:57PM +0530, AyushMukkanwar wrote:
> @@ -783,16 +797,15 @@ static int cvm_oct_probe(struct platform_device *pdev)
>  			dev->max_mtu = OCTEON_MAX_MTU - mtu_overhead;
>  
>  			if (register_netdev(dev) < 0) {
> -				pr_err("Failed to register ethernet device for POW\n");
> +				netdev_err(dev, "Failed to register ethernet device for POW\n");
>  				free_netdev(dev);
>  			} else {
>  				cvm_oct_device[CVMX_PIP_NUM_INPUT_PORTS] = dev;
> -				pr_info("%s: POW send group %d, receive group %d\n",
> -					dev->name, pow_send_group,
> -					pow_receive_group);
> +				netdev_info(dev, "POW send group %d, receive group %d\n",
> +				pow_send_group, pow_receive_group);
>  			}

Please run your patches through checkpatch.pl.

regards,
dan carpenter

