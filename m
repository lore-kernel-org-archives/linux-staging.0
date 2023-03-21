Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C19FE33F0
	for <linux-staging@lists.linux.dev>; Tue, 21 Mar 2023 18:30:30 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id k2so16960813pll.8
        for <linux-staging@lists.linux.dev>; Tue, 21 Mar 2023 11:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679423430;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rkjWHBgUku8MSuRSZQ+S7pLaMQUx4hKAx9achzwRQ08=;
        b=AXOihnAH0B0O4pktC/PqBcmYDX5szxYRzghNl161/BIG9cu3cfq5pL2vR7gYwCvycK
         ya2Eb42AtqfvNT0Rnqki7KI140cDOtuSv7aK4Er2DgH9uyp5ncyd9fo1gxhN84PcK+Mb
         oZtEQwq2KbwtX2HA2yO2+hGyg8GB6yXvmudYWWXWhkG7um0VZ2mTTg2HcypGjKYhNrK9
         m2o/GfMiifYLQBXNqyf/GtONlkj/lesMLTgTBgnRTKQlTbk0UO2v4anALIhzz/0cA1mE
         PbBUHhvY5b0SFIgZcyYKVdWXFD1BUTTB8Spcr7dWKpSsMre5BcKUiJF16o2AskD0sG09
         hMwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679423430;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rkjWHBgUku8MSuRSZQ+S7pLaMQUx4hKAx9achzwRQ08=;
        b=R75kBlx0hATwDnFoyDyJy5IaP9rICZQTGxQElOWhg83VOPpKHGR3eigzJrtq4xWiUJ
         OaZL3GeauXxD8gjHPAd+nk/jB7ZZbhc1fzYvGm55YWisfEKYFgkclBCq5HncSV/ikKFh
         kMHVG9Tb+a7P3fJ1bZ1DU6497lYG+0osNSkWjLThxqqtCaKOylN7DhFBukgcIf4HnTUe
         yEgqL9NxGQodvYJNoCEwmRbFKzzhW9guJ1q1nc/z4QI0uNhIT0JMDJ5d+6wgOASUTNUY
         llpNIMDlWt0C0NVPKSpU2W8jR/tQ3AyptldRl/wlDE+deBtCi2AVSLOKJkgyJlpzBe0a
         htPA==
X-Gm-Message-State: AO0yUKW5xIbGdE08g0ltb2VNNnHz8R6oTMlTdPx6ZRKrm8tCst2tflF9
	aShBFc7SEiOYcvUq4qo/3SI=
X-Google-Smtp-Source: AK7set/8TvvOjgCXUYMDgSNVuWVwb7G7MjD3roFihJpRn+nnL3hwsQcop75N18OV7FrB+B+FLXpUkg==
X-Received: by 2002:a05:6a20:3391:b0:d8:f312:b3b with SMTP id f17-20020a056a20339100b000d8f3120b3bmr2824221pzd.3.1679423430170;
        Tue, 21 Mar 2023 11:30:30 -0700 (PDT)
Received: from trent-reznor ([2601:641:4000:81:109e:9b0c:f18f:7fa1])
        by smtp.gmail.com with ESMTPSA id d2-20020a639742000000b00502e7115cbdsm5817599pgo.51.2023.03.21.11.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 11:30:29 -0700 (PDT)
Date: Tue, 21 Mar 2023 11:30:26 -0700
From: Daniel Watson <ozzloy@gmail.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: av7110: put spaces around operators
Message-ID: <ZBn3wmTkcZ0WC6iW@trent-reznor>
References: <ZBlShLl4PYlNIpGN@trent-reznor>
 <487b75ea-aecd-5fdc-c2a2-5f5080f8647e@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <487b75ea-aecd-5fdc-c2a2-5f5080f8647e@xs4all.nl>

On Tue, Mar 21, 2023 at 04:08:30PM +0100, Hans Verkuil wrote:
> Hi Daniel,
> 
Hi!

> I'm not sure what the point it of these two fixes since this driver is
> full of such things.
these fixes were the only ones where checkpatch said "spaces required
around that ..." for this file.

> In any case, I'm rejecting this. Just leave this driver alone, it's not
> worth the effort.
ok.

> If you are doing this as part of some mentorship program, then skip the
i'm doing this on my own.  i read that newbies should do about 10 minor
patches to get familiar with the process before doing something more
substantial.

> drivers/staging/media directory, it's not suitable for that.
ok, i'll try other drivers in staging.  i'll also see about getting a
mentor.

thanks again!
