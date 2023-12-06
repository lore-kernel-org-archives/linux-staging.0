Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB5A1A71F
	for <linux-staging@lists.linux.dev>; Wed,  6 Dec 2023 09:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dRfWsOoD"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3316d09c645so547658f8f.0
        for <linux-staging@lists.linux.dev>; Wed, 06 Dec 2023 01:54:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701856494; x=1702461294; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aTCNtdrnCjRUY4nx+WfhitLfkIdEU+u5rOlYMuK6fK8=;
        b=dRfWsOoDW7rpMLCTyIwjEkbUoYiEfU9BaqejL/coKmvg8u58LAC+yW9MwB1jti0A3p
         FLqaWGB0P7eoVdjntmV10dZ7tVURTkMHrYn48s/sH3UdOfIIwXp/fZ39wE9m7C9UfMjJ
         Wpf3wFtAol6myDBVYfXTHa/r8Eu+ZWotOI4Qck0Z6cBPvuuJ7yF0NzATLaVPsIClRgYm
         g2JQXTLiXJgCarb91TcOn+0MKilLGpkM6/StktlPGCuqO7KcPxUNl1vx/+n0HeLDOr7C
         +teGaVRpXDbXYckSYF/ulEWo+FvYXFFujgzHkKd9vXOXMTWur1RiN+k4mSekYVdpDHlt
         chuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701856494; x=1702461294;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aTCNtdrnCjRUY4nx+WfhitLfkIdEU+u5rOlYMuK6fK8=;
        b=W69J2Ubp++Y8TqXXVdIoW1Gj4I1/+dbR6kQbODvcwo1rhhsmYP777UnB5i7A6LoTP4
         kDFj5fVAXaVND/adL+9jechp85Ek/hSQ+UaCuOYj/DsjmBlv+HLvrLR6A/O8SxSmT6Hu
         sjmzuTgtQCIHX7qtucIlRhlzTXI9HoUFm9iFUO73s2Ezyt1RoKl18hqK7KucsvEb15mJ
         sx/ikKm+r3IV4wUAsNC7NaHmJFHcjmEXgk0MkjPkwKZj+5qIsIzrTL9CCh8v2NUefzHk
         Tuzjili8XtHOVcwkj2/aLOqlpr2IwzAok7u8iTdRu1/PaGDLHBMJU1P7Y9kD7AS3UtU6
         FBxw==
X-Gm-Message-State: AOJu0Yxn55Hxln6xxYLEg4b+KuN99U4ix6SYy3Igf4qhlga3ch4ocHdu
	WGltcSJqGYLAvz8pTgRk710uug==
X-Google-Smtp-Source: AGHT+IEpDHw+FDWXV5qQDjf1VsIrkntIzlpWxO7g9TKHWOxe/F+ZDIhT8l5H46wJNNjZlIQhmbBNiQ==
X-Received: by 2002:a5d:58f4:0:b0:333:2fd2:4ad4 with SMTP id f20-20020a5d58f4000000b003332fd24ad4mr290215wrd.80.1701856493874;
        Wed, 06 Dec 2023 01:54:53 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id g7-20020a5d4887000000b003335ebde680sm2861777wrq.75.2023.12.06.01.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 01:54:53 -0800 (PST)
Date: Wed, 6 Dec 2023 12:54:44 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: hverkuil@xs4all.nl, mchehab@kernel.org, tfiga@chromium.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, kernel@collabora.com
Subject: Re: [PATCH v3 1/2] videobuf2: core: Rename min_buffers_needed field
 to vb2_queue
Message-ID: <a2011bd9-8d1d-486d-8a54-794193dc99ec@suswa.mountain>
References: <20231206085608.33246-1-benjamin.gaignard@collabora.com>
 <20231206085608.33246-2-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231206085608.33246-2-benjamin.gaignard@collabora.com>

On Wed, Dec 06, 2023 at 09:56:07AM +0100, Benjamin Gaignard wrote:
> Rename min_buffers_needed into min_queued_buffers and update
> the documentation about it.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

[ snip ]

> diff --git a/drivers/media/pci/zoran/zoran_driver.c b/drivers/media/pci/zoran/zoran_driver.c
> index fa672cc8bc67..2c91f75e8d79 100644
> --- a/drivers/media/pci/zoran/zoran_driver.c
> +++ b/drivers/media/pci/zoran/zoran_driver.c
> @@ -749,9 +749,6 @@ static int zr_vb2_queue_setup(struct vb2_queue *vq, unsigned int *nbuffers, unsi
>  
>  	zr->buf_in_reserve = 0;
>  
> -	if (*nbuffers < vq->min_buffers_needed)
> -		*nbuffers = vq->min_buffers_needed;
> -
>  	if (*nplanes) {
>  		if (sizes[0] < size)
>  			return -EINVAL;

This was not mentioned in the commit message.  And anyway, please do
that as a separate commit.

regards,
dan carpenter

