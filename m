Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 217248F4A
	for <linux-staging@lists.linux.dev>; Tue,  8 Nov 2022 09:46:31 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id y16so19995920wrt.12
        for <linux-staging@lists.linux.dev>; Tue, 08 Nov 2022 01:46:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=O5IgkeQmSxEG1HaPKm+nMukRSPWOYNkhN02jAR5oCCE=;
        b=hezLi6sT4lRvroGT/dZOxWO8QJQl7HtGGdEeklPbIsTUo5Ej1iJ7EAs3lPtSFluUuh
         E7PFq3+gd15YoXaGCWAU41s7C0LBWt0kd+4k+q/+k3PXqUZrQ5nSdGoy0NIa/eckmY+i
         A9gb5ebUP5yJFyjjBFeWNxbQbI31Qho8pZqoDsnicVQVIHihQZ5Fa76rWf5x3HqZgMn4
         78uUewQeRQBxQNNZCOybuGYxfwsLCldVjIRxCNf87ejoN1nDKujNJrEa6pVFYzj30h3L
         iICueYSj52+m0urr3vZVSldPzQ216KPiezqqE3s3Gc9gWaqqNWRIImJABL3AGRWcQADe
         srqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O5IgkeQmSxEG1HaPKm+nMukRSPWOYNkhN02jAR5oCCE=;
        b=T5W8HlkB+qbBShzAoRUCrg/I5HtlJVf8cEZBQs6e+eKS4bohvCft9frBPbY1SujW/O
         w2Ougmm8LfjL/m0JXgY9Pue12RGx5rd2tAfxz9JvOJVtjMw1vEfdEhGUyRUV6CXDNJZZ
         4qMlqkl5XpGesnTYpEJUpiIDtYHgQs/seQRZ76GgRczJfGNoHY8Pk8GQJuTw+eOi5OA+
         bR8rnxmqtY/51z8M8Sxio61Axagnt2UVlJfMC0fCvScH8Q48wDm7Pu2ila9K17lYVMZl
         crh2IRWolRbNHNo5msABRv3GLLfrvU384A86FF2KHqmKYUaHoikWcVmG0UBT+u07VBxy
         8JfQ==
X-Gm-Message-State: ACrzQf2YHOIrpX65nh2pCeB0OjTeKUuFP+lHMSr9MtdULcCVGZrGx/K6
	3QNDvoh1O0Fngzlg3W4Nv8s=
X-Google-Smtp-Source: AMsMyM5IZKYCnOmlHMEgK799dgzKIDWJt0m+zOxQXKffBaJo4gDQj8fc+whAJY8algsbapvM3hN5FA==
X-Received: by 2002:adf:e911:0:b0:236:73b7:e668 with SMTP id f17-20020adfe911000000b0023673b7e668mr34305141wrm.96.1667900789237;
        Tue, 08 Nov 2022 01:46:29 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id p15-20020a1c544f000000b003cf483ee8e0sm13565499wmi.24.2022.11.08.01.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Nov 2022 01:46:28 -0800 (PST)
Date: Tue, 8 Nov 2022 12:46:25 +0300
From: Dan Carpenter <error27@gmail.com>
To: Hans Verkuil <hverkuil@xs4all.nl>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Deepak R Varma <drv@mailo.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: patches for staging:media drivers
Message-ID: <Y2olcaNp3xkRRK7j@kadam>
References: <Y2eSCZJNWn6DzCUu@qemulion>
 <48f4bda9-b5e3-9649-aab9-b529889bf110@linaro.org>
 <Y2oO7fU4whKr+3hb@kadam>
 <bf7dc5f6-acf3-73f0-b73b-d5707152190b@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bf7dc5f6-acf3-73f0-b73b-d5707152190b@xs4all.nl>

On Tue, Nov 08, 2022 at 10:35:54AM +0100, Hans Verkuil wrote:
> 
> I don't mind taking patches for media staging drivers as long as:
> 
> 1) they are not for atomisp, and
> 2) they are not for deprecated drivers (drivers/staging/media/deprecated/)
> 

This is unrelated but I somehow misread an email and thought we were
going to create a drivers/deprecated/ directory.  I still think that's a
good idea for future deprecated drivers.  We normally put them in
staging/ but it's not really the ideal place for them.

regards,
dan carpenter
