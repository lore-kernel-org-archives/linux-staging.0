Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 589C979C7
	for <linux-staging@lists.linux.dev>; Tue, 24 Oct 2023 04:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xAIcF/eW"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4083f613275so33046905e9.2
        for <linux-staging@lists.linux.dev>; Mon, 23 Oct 2023 21:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698120739; x=1698725539; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s7s3u7bi0Hk44VLnFMnw7DHZL5GKwqaXp0FXz9TuqLQ=;
        b=xAIcF/eWoVH0aoseylxGtpsH8B5ZXuQqLkZl0qlfGZgg3a88ckMZuNGEDWvVSZFnq6
         L8eZWKgG/9lnuUCfZFFzfCT01i4Rf/rAe+qplIdtr7OTBEP48ciBTe0L8rF03czmLxw0
         vbxTu1PHQI6ZdwXS07GItq/f1ytHy4y8KzOrzSzXko73x7rBMHNcw/oTtatYGMzFhv1C
         Jl/sY+v7qFhwhcApzag9Z1KWjGGpQalXovxC7Crd2as+rsOLyGZSJNpiVjBlmeeR/GZf
         2ANFPMpmKOMOc+btoWjDXCzarLqYrrItKG8BhIoevmqlDOjObS5P9OqFbcDpG/0uE+N5
         oUcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698120739; x=1698725539;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s7s3u7bi0Hk44VLnFMnw7DHZL5GKwqaXp0FXz9TuqLQ=;
        b=pe1h8wKbUiAP545Bkzlm5QuZhIUmYyKyLaY6JevS0p7qvng6snqghjNojdRMvj7OTi
         rBWkgQTgcwzWviR2GdG/nW8XQ3uPiWvz5Ag3TnWBJmWx4Wao1BMRgzZwg0w8wH5EAg++
         msdfoQ5+T11sI/ZSis/4kSwuB7wIpAzOVO6N6dI0Kt5qvC+MwM9yRJFn5VN8MHDthliH
         dJu67bpxEta5ncLLnLcEaQ+HYgjaJsX2+G4ZquAWN8ovRd424n7KZf7oxzIZ8PEuCXHo
         HIvRilMyzWQ0wyt+j655jb/EKIAYZpRDD2M12FDz5x/pq0ga8shemoOuIajta2rpm9iU
         MCQQ==
X-Gm-Message-State: AOJu0Yxc6XyUbfwEWMQOhwPKvhthaVSIm75g8qWKFy6NjXP8A0fOIq0O
	vVClM1Z3j0HmyZaIQcEX0sDgiw==
X-Google-Smtp-Source: AGHT+IGlH793z/rH9C/Fd5V+RxZl8AeFGmuOiIHr6g0/Mg9FTpJdXQRXzLSK1T7/FjtCxgRdGD9rGw==
X-Received: by 2002:a1c:770a:0:b0:401:906b:7e9d with SMTP id t10-20020a1c770a000000b00401906b7e9dmr9435592wmi.18.1698120739402;
        Mon, 23 Oct 2023 21:12:19 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id i18-20020a05600c481200b00407b93d8085sm15397033wmo.27.2023.10.23.21.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 21:12:18 -0700 (PDT)
Date: Tue, 24 Oct 2023 07:12:14 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Joe Perches <joe@perches.com>
Cc: Jonathan Bergh <bergh.jonathan@gmail.com>, mchehab@kernel.org,
	gregkh@linuxfoundation.org, error27@gmail.com,
	linux-staging@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] staging: media: av7110: Fix various whitespace
 checkpatch errors
Message-ID: <0fc4db47-4b05-473f-966e-962a2c671dcf@kadam.mountain>
References: <20231020232332.55024-1-bergh.jonathan@gmail.com>
 <20231020232332.55024-3-bergh.jonathan@gmail.com>
 <b301c9a1-7536-46c5-878e-7cd79e3a4742@kadam.mountain>
 <15f45bbde3f4289b012db7adb8166cf0d45e4fec.camel@perches.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <15f45bbde3f4289b012db7adb8166cf0d45e4fec.camel@perches.com>

On Mon, Oct 23, 2023 at 08:24:58AM -0700, Joe Perches wrote:
> On Mon, 2023-10-23 at 17:26 +0300, Dan Carpenter wrote:
> > On Sat, Oct 21, 2023 at 01:23:29AM +0200, Jonathan Bergh wrote:
> []
> > > diff --git a/drivers/staging/media/av7110/av7110_av.c b/drivers/staging/media/av7110/av7110_av.c
> []
> > > @@ -241,8 +241,8 @@ int av7110_pes_play(void *dest, struct dvb_ringbuffer *buf, int dlen)
> > >  		sync |= DVB_RINGBUFFER_PEEK(buf, 2) << 8;
> > >  		sync |= DVB_RINGBUFFER_PEEK(buf, 3);
> > >  
> > > -		if (((sync &~ 0x0f) == 0x000001e0) ||
> > > -		    ((sync &~ 0x1f) == 0x000001c0) ||
> > > +		if (((sync &~0x0f) == 0x000001e0) ||
> > > +		    ((sync &~0x1f) == 0x000001c0) ||
> > 
> > These should be:
> > 
> > 	if (((sync & ~0x0f) == 0x000001e0) ||
> > 	    ((sync & ~0x1f) == 0x000001c0) ||
> 
> Generally, I believe it would be better to avoid '& ~constant'
> and use the positive form instead
> 
> 	if ((sync & 0xfffffff0) == 0x000001e0) ||
> 	    (sync & 0xffffffe0) == 0x000001c0)
> 

To me it depends on if the 0x0f means something.  It would be better as
a define instead of a magic number.

regards,
dan carpenter

