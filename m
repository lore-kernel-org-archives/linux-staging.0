Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF72B660
	for <linux-staging@lists.linux.dev>; Tue, 30 Apr 2024 16:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714494846; cv=none; b=oxNg3olp0aDtD34qjqY3ZzrMo0TN8rHZVCZYxhNZ/CV+8VZY4KXjWCKFfpdRbllOhRraR0iwsjIPNueiFEdsTdT8krVKgP5/17Arg2JUUySmnAKHTpD0flH3BLmzl6pu2I7fsaPRVq1zYHuTJwo3YOmPwRRjspPRyUg+fEw4ARE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714494846; c=relaxed/simple;
	bh=Nmts7SGpTnSBJShEKqMgy0d0lvZ16gTsppVGUwwJsn0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V/Mdu6VPXMACVpBbcAieYkp7jjrei3N7u+ZYW/e5DrKcJV5Rw6OoXlimYzvH0sZrayiyEAkdD5hjrgHbmHUPKEz1bq97pa5W7WOYbAvytpS8VlftIYDor+Qg6aT/sVLeAMbkfwLUk4OphDv+xMcaKPF5brWOal8sy99SZCWk/es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G9LImaQS; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G9LImaQS"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-5d8b519e438so4555493a12.1
        for <linux-staging@lists.linux.dev>; Tue, 30 Apr 2024 09:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714494844; x=1715099644; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=8yVh0LSF6AnP8AlfPOMnHNGqdMushJrhziYcF69ydXM=;
        b=G9LImaQSP2LHnTwX5rNNzs61R09HC3+2eE0U2t8CVMPWwvQtnvuW5DrPnidltxqFai
         52aGc7ScwAKsGjR4o8S4ySJfwE83AERCzCM+X19FKvrAzDOIiwvs1kiS0AV7atMuUbfP
         AYUbKcAZImKDcxGqnWN1UMxCWi3LbjYH1Svz/wK7TMCO/n8CkiVu3W183g9odT1wLCw0
         5EeIqqmGSfelvm/IENIsZ6UJdGjxRgEAnneflmbnjp7cidMVrmQVjmMcIprrHz0IcmD/
         Xhpe4xXt0pkyKXO8+s66kKdTZjMZDErhKvHtSeUbOUPeFWLu+cysDEBkN6q8FMIWStyB
         0avA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714494844; x=1715099644;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8yVh0LSF6AnP8AlfPOMnHNGqdMushJrhziYcF69ydXM=;
        b=mOqIYtw79KaVoTG18r4J1wuKdrRtLV5XaDx0sl8gz1iU2bxHo/mifEqQS/lV740yL7
         B8JZBqY0DZtzhEvhkL/PauZFb1HTaTM8dw7CIwxdhtIAGWVdA6nQYysk+DeP24Lbtizg
         L+ETuCw+PaCgpsVzC8f0xPR6DZXfNREVK6nlaLqQhSmfJU6nR/+X1U7WeegqF9JmJEc0
         65kLDwSsYr4V+bj2ZqrQ29aX20NspwbdftSYxlqiRrg6Y+xL5tLWJFfLMRzQ1kU32akE
         8xXQQR8VE6+ufR2/1JYNmVWZ7fNcn8zs0i07L3u8a5ZRdKCNKZNO1Egjj6xVmA1sH/Fx
         WTDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZNTWxkCJdepjNpyPmeALyEwNbsi0NN3lDV/pfzqrhs03iJybaTG+5MdcGdqNDu6YbrOfaWDmDnHgUKV19/GGXbi8IGd7m9xnRJFFxJA==
X-Gm-Message-State: AOJu0YzB99JGxDSB5+jcgK12CGCrErFapFY/MMzrCHo8JnlM8xABqXqF
	mCiqjadokeK+A/97FusW7UD7LqlyANanG6nrf3FFf3CjEHy+78cu
X-Google-Smtp-Source: AGHT+IHMlRdPUV+Vp+iaQO91MrJbNZoGRQBwlMcCasW3TWZCQdK7tEfZ21nXdx7uZqOu4pSGHzepsg==
X-Received: by 2002:a05:6a21:33a8:b0:1ac:663f:9efd with SMTP id yy40-20020a056a2133a800b001ac663f9efdmr447542pzb.19.1714494844277;
        Tue, 30 Apr 2024 09:34:04 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id st5-20020a17090b1fc500b002b29ce888fcsm1447456pjb.53.2024.04.30.09.34.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Apr 2024 09:34:03 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <453bb1ed-1fe5-4b2c-90a1-eb15a0086489@roeck-us.net>
Date: Tue, 30 Apr 2024 09:34:01 -0700
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] hwmon: (da9052) Use
 devm_regulator_get_enable_read_voltage()
To: David Lechner <dlechner@baylibre.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jean Delvare <jdelvare@suse.com>, Jonathan Cameron <jic23@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
 Support Opensource <support.opensource@diasemi.com>,
 Cosmin Tanislav <cosmin.tanislav@analog.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Antoniu Miclaus <antoniu.miclaus@analog.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-input@vger.kernel.org, Jonathan Cameron <Jonathan.Cameron@huawei.com>
References: <20240429-regulator-get-enable-get-votlage-v2-0-b1f11ab766c1@baylibre.com>
 <20240429-regulator-get-enable-get-votlage-v2-3-b1f11ab766c1@baylibre.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20240429-regulator-get-enable-get-votlage-v2-3-b1f11ab766c1@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/29/24 16:40, David Lechner wrote:
> We can reduce boilerplate code by using
> devm_regulator_get_enable_read_voltage().
> 
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Signed-off-by: David Lechner <dlechner@baylibre.com>

Acked-by: Guenter Roeck <linux@roeck-us.net>

