Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D058B214A8B
	for <linux-staging@lists.linux.dev>; Fri, 27 Jun 2025 20:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751056367; cv=none; b=lrSBpbFCzz5e+9kywLxeqKCtbn/gHRLYS3yFGsbECVhoqqWllX/3O1yqWVLKcMlCUGa/lWpDtGgC5lq3ba2o22yMALCxyJ+ICKl7x2GiAxbY7dNM7afHRgo/zB4mZ3/8Ue655/PPElb/3r1olOYWOPEDH+Dia54iziMgUf1WzAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751056367; c=relaxed/simple;
	bh=IDPrpIyVvRgSr2ZbdswIDGez7eFpJld3p2kUMrb9wuE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z8Io5aA0Oxcuci7U/pGgEEH1nkuyQaiEE77xptrxD5PDVDeiv0p+PuGy4A+1DpbEGxvXu68X2P1YrhqDNFxUL4zsbIvyJ5hsEiZE4QyLg4U2F1tu+VTWbZSL7b0plhhOl59m46Jr7I31OICATP7CNHGZURm3eFGTHP5/L2TAJ+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ADURal+c; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ADURal+c"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-73a9c5ccfcdso172907a34.0
        for <linux-staging@lists.linux.dev>; Fri, 27 Jun 2025 13:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751056365; x=1751661165; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fxxJVAuITfeFuKBhm74QOGA6/KTq2RtogFp6PLr2NWA=;
        b=ADURal+cwi1yNKWmrWMcvpXqVoTYBephYQh9vdtE6BH1cee/OL16uEjAu9mS1NR9z2
         BF4KubZdvgyfAwEZbHXOm47EwHMr3xQrp9JuQZYl/iEJHXn4aQqhdPKOgMT3u1jeLdyp
         qBmuwfs/4DR9t8lgo5ohv+u5464DSoSkBx8yzSJ4SVgue5bp7zGFVj2UaJDiGwIACasW
         yMgwhkZJPk1Z12pBIdUFQbDPL0ZRc/SPB+amMuHkDVRx2YTnm/mHwklJl+k6C0tSHvQG
         VQ118Xv7HsmMyXBb+b2uww95tej1pFyqFnnQyxbXhWB/YUGBh6ES+9xigiZNELArsAtZ
         kHQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751056365; x=1751661165;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fxxJVAuITfeFuKBhm74QOGA6/KTq2RtogFp6PLr2NWA=;
        b=jrLcAbqbWCTp9j2+keIx7t+DgyBRZ/rxrRlck/CYFWZvUcCcixS/S3DGMuiPb7MaST
         5T1ub6kc3zvv0IvEms9OCgCyg/FVE4/6VSpDaZDVx2SIhbBPN0NkRFm7y8li/lyZl9dR
         gd+14xKUTFFja96Latv4imuywIickj90MvhnNCLQ5nN9UwQEYgjPcg2hf74GUMlLtupw
         /dlwK5CZusR1Cs9/MfRhsheNnLkyv3QEyXnJDgJqLQvNLah+8mSSYPxjxNh+51nzY7Ao
         un+VxJOk1KmPK80uPUlrfmSTGxdSHMkm/PGNgvebUT2SyIXUyYZlQkBnmRq1BaF1N7Ih
         0fAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVx97Sy4HrjAb61wmsV0KsElC9XXvGTRo25I7FUjry7ic+XIrFfK4GoFpmsZSgfOVqUPAY87KSGpa8Bk0mK@lists.linux.dev
X-Gm-Message-State: AOJu0YxSD9BBfTASnqSe+Wm6RzAQMvZbXlCbOwVlM06rcYBDDtOY76zj
	5GJNQ7ivDSn3/DED4ow5/8f6fN60lSe/GF+0tXbD4gXlMdMcOI23Id3k1jHDK34v+E8=
X-Gm-Gg: ASbGncuIXfOGeN0AhBJY5wDBkNFHFChyWqWi23ASx3k7eb2A6zd6J87K7srv19ovczf
	GhoK6fdS/DCUX8iEzVBOL8z5yeunwVrlevO6Y/s5Pw8mD/KnIgB9bq/y1v2PAnzXT4N4Itr/YEW
	PuWVxg9yxvWYo/AJ4KlXdXI8V48X3uBcw8y/9hcaYDVJlM8dTAfpma8q2uyr9vyNOflu5ipf6Ks
	2y19DXLxmwDttQ7HDH3mABw8cjQxFjntxg4JYVkWh6CV7BFL37u3PHr7ODUe5PqzpyB7YqJdCpD
	FfJJxKCAIm6ijY4kjxX7Wg+AplV5M05kaahZnPZjSLInyHIFLWY/ZYh0rqiGBpi+XthmZydNALm
	jHmboCsxvIWoz07Wns9ElxQ3GSbW7MGpJnxhPEkdpjxYkzz8=
X-Google-Smtp-Source: AGHT+IGWKYpvpagCApwnJlXX3gZzQRWpYwcRUEZj3b9BUxUrQ3Di96C9uBw6U2LmMWpj7SyRsppMow==
X-Received: by 2002:a05:6830:358f:b0:72b:93a0:706e with SMTP id 46e09a7af769-73afc5fc0e1mr2924527a34.23.1751056364922;
        Fri, 27 Jun 2025 13:32:44 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:1715:453e:e133:7d6? ([2600:8803:e7e4:1d00:1715:453e:e133:7d6])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73afb100941sm499701a34.47.2025.06.27.13.32.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 13:32:44 -0700 (PDT)
Message-ID: <364b2846-e299-4be5-aadf-0668445c715d@baylibre.com>
Date: Fri, 27 Jun 2025 15:32:43 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drivers: staging: iio: frequency: ad9832.h: Fixed TODO
 note.
To: Abdalla Ahmad <Abdalla.Ahmad@sesame.org.jo>,
 Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Gabriel Shahrouzi <gshahrouzi@gmail.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>,
 "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>
References: <20250627175114.548076-1-abdalla.ahmad@sesame.org.jo>
 <aF7kW6xRxRb0VN5H@smile.fi.intel.com>
 <AM9PR08MB6114261F0CA8CD89EC443E59A145A@AM9PR08MB6114.eurprd08.prod.outlook.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <AM9PR08MB6114261F0CA8CD89EC443E59A145A@AM9PR08MB6114.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/27/25 2:29 PM, Abdalla Ahmad wrote:
> Hi

...

> 
>> Ideally this should be dropped from any global header file. If one needs
>> something like this, it can be propagated via software nodes.> Well, Including it in include/linux/iio/ made sense to me, would you please elaborate?
> 

No one uses platform data anymore. We use linux/properties.h instead to give
named properties for this sort of thing. So the right thing to do would be to
create a proper devicetree binding for the chip to define the properties and
fix up the driver so that we can move it out of staging. Then the header file
would just be deleted as part of these changes when we stop using platform
data.

If you don't care about the driver and just want the TODO to go away, then
we can just delete the comment since it is no longer applicable. It doesn't
make sense to move the header out of staging without moving the rest of the
driver out of staging at the same time.

