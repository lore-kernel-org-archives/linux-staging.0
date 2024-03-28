Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1BF14265E
	for <linux-staging@lists.linux.dev>; Thu, 28 Mar 2024 20:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711657077; cv=none; b=nN8LdS50RbTbB6hfoyY3cOHUxy3r3741SpmJQooe5yCA0YOhv+TvxX9vS4v2jCqMccb4dkEcT3GkC2IJot6VUjVIkvlSJoZsdUMc966dO2FM9hHaM/A/P8vua48VsuSPZN9R0VYYKkjRxOIp68iIONljzhQBhYUqR0RS5S6H/gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711657077; c=relaxed/simple;
	bh=9jYHvj/0a/yHqut5NhaqVyMqutJHLvv2Ne7s1n0MDn0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YFf0nubeL0AwpF/IklEFyFvW9+9gdMml8F7kfGAeVaOpxQjRiC5NwT81Ehb0O59yfO/9ZTvIKBfVtBv/LXqG+bkDKYuNaGIio2Gqe2kQLelN+PwqNECTU9M+auQpS3mzrT/rNphFLYMwnL+ukp64Smeox0zuw2lv678O8vKL8AM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h3ZQxyPA; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h3ZQxyPA"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1def2a1aafaso10689375ad.3
        for <linux-staging@lists.linux.dev>; Thu, 28 Mar 2024 13:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711657075; x=1712261875; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nEayUKz9gKaOZC4X5AV80mwdg3zyZD5G0L3PubFSTFo=;
        b=h3ZQxyPAmPEbJZgoyjTl64Wi7uT7wtu0cRyiYKcc+LbyPV06OkT9Q8Qbiqk/fuuXmK
         ASD9HDsj6nCUAeq2T5PZL3XqSg1qXhGH2mVSz/G42dzGdpMd1kIUyZOcFoF9KApjxTzQ
         Ffrdq/cZ5X+E29KA8ZSI/s4RM9kNsKeJhpHb1VLzmvGwMoSLxLr1+YuF/Ta8nNXl+6/B
         u5SvK7+8CWXju0mDc8UYMFuTxorCxA2Oy/m8yLzmAfW/YDachAoPdzp24jUFQxXgSAXC
         ue6OsrEs3XZ8R9d7ztBR4RnMg+/HCHVDinIbIk3eb2HCuTxs+5BtcFGJuWemC84MR65x
         Z5xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711657075; x=1712261875;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nEayUKz9gKaOZC4X5AV80mwdg3zyZD5G0L3PubFSTFo=;
        b=VpER3OLNHXXlZJCyBOr1dHZtgUT9+umpfS5OnfnSvPIdxtziJ1CDdg2kXRDtf6Q/jM
         O3kNjfTJTcgDJbm6kwje/X06LTdUB3WS9niMP5MA+UHis4cRVVNHMHvWHxaK0guWfNWd
         cRhAmbnx4QNQkJf2bNsKNEnGr5Y2LS5TOnv2rtBDhNMxCFo/CMDP2dHnUHNU+JfBeRpg
         Sm/tqPqWWUMDlAG641jJW8ehrrUZcQfk1qerAjKwxYmThkLsI6WSyE2p8c+rMz2Zw3GW
         P1etwLqFi1AhxHE19asbL1NH61RuCWHKsQcZMqF4hhDiMjezZWcc4hgf7mp3o1y3XlyX
         NalQ==
X-Forwarded-Encrypted: i=1; AJvYcCXixQMhke7QuKrC2w5JVom23W6QRZZkhiN4VfBX8puOefHtYcMU8JGKPVDVqUCVVld7xDUQEqBX5kYFyWBVAiv7lQTQu6CiMjY7yVHAmQ==
X-Gm-Message-State: AOJu0YwfNeLpmafDRgix2evbAWOXwVm9gm82PoYwSBnlLwbWzjVs3g20
	S4RL3iA8fK6+56Qpp5mGW8nUK4G884p+0kcbv6EjUpMAS4GD9JZ2
X-Google-Smtp-Source: AGHT+IF2rPO6hFqFWtIX3SdzDeOGVa2ri0rsD7VKNpG6/c1HmD1Dag/mcKtYH3XvXNUZLF0lzYTQIw==
X-Received: by 2002:a17:902:8549:b0:1dd:7da:e0a9 with SMTP id d9-20020a170902854900b001dd07dae0a9mr508604plo.69.1711657075433;
        Thu, 28 Mar 2024 13:17:55 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:493e:82a3:49f9:d88])
        by smtp.gmail.com with ESMTPSA id h1-20020a170902b94100b001dd0c5d5227sm2022519pls.193.2024.03.28.13.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 13:17:54 -0700 (PDT)
Date: Thu, 28 Mar 2024 13:17:52 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>, Jonathan Corbet <corbet@lwn.net>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Support Opensource <support.opensource@diasemi.com>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-input@vger.kernel.org
Subject: Re: [PATCH RFC 1/7] regulator: devres: add APIs for reference
 supplies
Message-ID: <ZgXQcGlMiewRzki5@google.com>
References: <20240327-regulator-get-enable-get-votlage-v1-0-5f4517faa059@baylibre.com>
 <20240327-regulator-get-enable-get-votlage-v1-1-5f4517faa059@baylibre.com>
 <ZgWw66OpLnLPdCn-@google.com>
 <043b347b-2652-4ffb-a8e0-954a89899ade@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <043b347b-2652-4ffb-a8e0-954a89899ade@sirena.org.uk>

On Thu, Mar 28, 2024 at 06:18:32PM +0000, Mark Brown wrote:
> On Thu, Mar 28, 2024 at 11:03:23AM -0700, Dmitry Torokhov wrote:
> 
> > So because we decided that we could not have devm_regulator_enable()
> > because of (IMO) contrived example of someone totally mixing up the devm
> > and non-devm APIs we now have to make more and more devm- variants
> > simply because we do not have access to the regulator structure with
> > devm_regulator_get_enable() and so all normal APIs are not available.
> 
> I don't follow what you're saying here?  What normal APIs are not
> available?  AFAICT this has nothing to do with a devm enable, it's a
> combined operation which reports the voltage for the regulator if one is
> available which would still be being added even if it used a devm
> enable.

You can not do devm_regulator_get_enable() and then call
regulator_get_voltage(), you need a new combined API.

> 
> > This is quite bad honestly. Mark, could we please reverse this
> > shortsighted decision and have normal devm_regulator_enable() operating
> > on a regulator?
> 
> Nothing has changed here.

Yes, unfortunately. We could have:

	reg = devm_regulator_get(...);
	...
	err = devm_regulator_enable(dev, reg);
	...
	err = regulator_get_voltage(reg);

and not multiply APIs, but we do not have devm_regulator_enable().

Thanks.

-- 
Dmitry
