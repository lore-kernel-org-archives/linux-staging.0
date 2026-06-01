Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28136367B67
	for <linux-staging@lists.linux.dev>; Mon,  1 Jun 2026 11:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780313842; cv=none; b=mHwrSRBZzO3/uuR0mJQjoIX8rAQiWh4aQQ1vXk18ZThzXc/TfWyR2Omq8MepUayRkBQdq7If9/PH+0esNSbH71+DoqWuaCh7HW+yA90hNQM7W5opCubzQDtkTbD7BVcY1VxG0Ls9hDygKgGJYVFPNleJUDvyKosDtGvK1Ichp0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780313842; c=relaxed/simple;
	bh=Zjof0WVULYCBSZ2Pq6gQ3NRucoS9NMNzybSAd/5mwGU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Myfk9eUuVY5qQlqOTqz4+Pv+VUhguX0RxnYwMIa3UWufbapMAIs337pHuvep3qoX0lJt/ku36XC5k4OxwLoS65te4PHq7YiFYMYk0SPCAhz5xzYn6styDAdgeqkIsdYFMiGEAFk+3c0Z+jIf45w+oXziLMx41Wb+HpYFIH/Xw7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WisJW9Pu; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WisJW9Pu"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-68d23430690so2227030a12.3
        for <linux-staging@lists.linux.dev>; Mon, 01 Jun 2026 04:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780313840; x=1780918640; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4Y5aiob/5xwmuKj1NkLrGEbiNwQs8EGYTAf6Wpc7voc=;
        b=WisJW9Pu+CYazDrScP/Sd3FBwAvRNIzCB4e/MtLAS6nq5+syW8wWSdII5OuacWLmc/
         qleEdnPbV2np9Lxymma917sEVMvXxn/NdeNORdQq7cGJZsYaA+eY2O8Y2czvd9jL+kFO
         BF/TOaVuS0fquhYEQ8IE09KXabGXOGf/JrglJRoFlmAWYkE1lePl1NRJ0DUVxrW3lWS2
         Kh3yXQgSs6Wuv1fOWS17VcZHLqe5XU1W74+CgdC15dRMJoP+fFAaeOHl7Q+bQGUTZcQs
         Gq0HQP9BNQVHvuKvPMSyQu8JptKec5FA/Q6px01qfmbHg3IPeN1z9vUWH6vWLZ5onm7C
         WCDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780313840; x=1780918640;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Y5aiob/5xwmuKj1NkLrGEbiNwQs8EGYTAf6Wpc7voc=;
        b=FgtmlpOaMyjzENP061yFLVQ+nAsRqzWpqUax1NxjWu0Y9yIIE1A53bpKI/BEa3aovm
         o98IaaBNtzPUIv6tZlpxxhGorIK2fV0P1cylbjS52zC8EnY79UXcTNDa/0WFIoZ2lFvU
         qc+XjspzYR2he6U3LMjet2fMdg84JM/xxYJ2v6oaqjGhX2EWzDqdqAvbqDyQCvkbQTS1
         HtaIvpdKKMLQ937qLADHMB10Fjw2c28FXBdXkizwAJbrmZFKh8478dOEee7gDCdayBlh
         +asZdN6gJkQAxZR0q4mPrUQIu7LA9ibFcbGzvU5OJFNsNUcCsSlUZzVehafgqXhIzYfe
         l7oA==
X-Forwarded-Encrypted: i=1; AFNElJ9HNKOQkUW18arPgdv6ToD5b36v4IWVcL5waOuNz9n12H82WhSXEG3b3ldd4kDME9XJrIL9tJhe8IvrocWZ@lists.linux.dev
X-Gm-Message-State: AOJu0YxJFc1QiiIaJfiys5pTlPkceR8QkJIreqMLAV44DWJwXi7L7wHa
	894hbNn6TyVoBopxPxBC2hpMzapDjji2J93cSBWzIFUCFXqbwQPx7DTM
X-Gm-Gg: Acq92OEDjd898A3q6miNn6Fapms6n1YRWjUtUXZR8a8O7N1F6N+pGElynD06XQYBlIH
	2HtiZwM/K3qpKS+mzPkJg8UHrD4hdFUZuxwSFySuwm/jQS18ZUflrSopQOkbMeJGrkmxJeH3Mvn
	GNHWp0B/2XEw7fUrftba2a981EY3h3kknLa8vkBjVUc+qgq+xWgror5XZLkYgUND2q9iev24Wxf
	ejnLlvw4z3MSWbZPnPmLsQ9WunQYYK/v3MI2FoM9F5us2iD5ryBfI23QxOAND8/UO57D9q70Ue1
	0yKatRbQxucwT9GnXktOhFLfXYHxi5REXAyanBu/xUNzWx6EwsqUnN/HUKNLX0vmpNmlJNN0cxd
	oPQGdfL5o91Sp0oNeiQjvY7RRD8pS9QsxQLpwHrnQoxcbbdwpwzMOVvIPs3r+q+A3J7Ne1wA7OD
	R0CvLWxKj01jlN3mE8XtO+CvggIxwGf4GT4PgS80Gefoe+
X-Received: by 2002:a17:906:c151:b0:bee:9d02:6e7c with SMTP id a640c23a62f3a-bee9d032e8amr30809366b.10.1780313839361;
        Mon, 01 Jun 2026 04:37:19 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bee7bdf4438sm25754166b.55.2026.06.01.04.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 04:37:18 -0700 (PDT)
Date: Mon, 1 Jun 2026 14:37:14 +0300
From: Dan Carpenter <error27@gmail.com>
To: Taha Narimani <tahanarimani3443@gmail.com>,
	Nishad Kamdar <nishadkamdar@gmail.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"open list:STAGING - INDUSTRIAL IO" <linux-iio@vger.kernel.org>,
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: iio: adc: ad7816: drop busy pin requirement for
 ad7816
Message-ID: <ah1u6r2NemqKd2k7@stanley.mountain>
References: <20260530173514.56640-1-tahanarimani3443@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260530173514.56640-1-tahanarimani3443@gmail.com>

On Sat, May 30, 2026 at 05:35:12PM +0000, Taha Narimani wrote:
> According to the AD7816/7/8 datasheet, the AD7816 is an 8-pin device
> and does not possess a BUSY pin. The BUSY pin is exclusive to the
> 16-pin AD7817.
> 
> The driver previously requested a 'busy' GPIO unconditionally for both
> the AD7816 and AD7817. If a device tree correctly modeled the hardware
> by omitting the busy-gpios property for the AD7816, devm_gpiod_get()
> would return -ENOENT and cause the probe to fail.
> 
> Fix this by restricting the busy GPIO request strictly to the AD7817.
> 
> Signed-off-by: Taha Narimani <tahanarimani3443@gmail.com>

The patch is corrupted.

Otherwise this seems reasonable enough.  (I haven't read the datasheet
but I trust that you have).  Let's add Nishad to the CC list since he
is the one who first limitted it to not check ID_AD7818.

The other way to solve this would be to use devm_gpiod_get_optional()
in the probe() function and test for NULL in ad7816_spi_read().  I
think this would be a cleaner solution because then it works based
on the device trees instead of having to hardcode which devices
have it in the driver itself.

regards,
dan carpenter

