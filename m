Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 528303FC1
	for <linux-staging@lists.linux.dev>; Mon,  6 Sep 2021 13:49:55 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id j17-20020a05600c1c1100b002e754875260so4825238wms.4
        for <linux-staging@lists.linux.dev>; Mon, 06 Sep 2021 06:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=A4jOhR2vRvnKHiSaA5vRT/Kewp2YBhwRZF6rf63lEkI=;
        b=DEaD2/Yzj/PIEGHCf2Hgo9sTxwYOGS0pd4+5rls6fny99vQBctrGXz+mpQT3NSi4qv
         vpvdJns2nVVQnM6kFp0Bi5TzO1zETmUQx8IwPSsb1UUGf9mh/iKoTz0OFrQB1+8K/5cJ
         /+WZp85bDP1VjTlBquBB0A0ueMkIFKeWYVnqq4W35+pS+JeYD826QdMswqdLt/8IYucI
         S598cEr7xEJJ2bU3bFVBg8KALmxcBkmzABNs1VLF6hXh/jXwE8C6XvmzpIJS90RYbyR2
         BIEISwZl5ESCB1CKuSissqglGkIZOmJdYoJK+sNKG3WtYlh4px8lQTavdaOZFy1iYDB5
         kN+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=A4jOhR2vRvnKHiSaA5vRT/Kewp2YBhwRZF6rf63lEkI=;
        b=U9lROr1BAnCUzR6QovWyTwd1RMBVJBefZnA1MQAOqj456npLawNzZOynGxlD8NSB6J
         iOUu6//7J0QTedRveTyfoET9HeklzIDHRfJZez0yd9qzKojuZEn8lwsRqT379qQIZcaH
         5qAEMjyaxOrl7yhSJncC8lbYS1tax9SlQPynWRfjSWCeAaeeqEpkwzBfXvpnmPp8k9O/
         8irkHgBvphMU2y7518HPzu69fEOtMWlEqasMF8C+bNaSxS/wb1jiJ+AhJEJj1KzNZd+p
         1RbW/MhTTW+oEKhVrctN1L65TvrwTWM+nJeY672E90ja+uXouamavYxqEab4+82sU/b5
         fbIA==
X-Gm-Message-State: AOAM531SZntIkckVym5m3cz8ZpmnUMTulklpF/ljbNIOLqWF9yhzBOxZ
	meZkK+bUr+CACqlk3ILwZvY76w==
X-Google-Smtp-Source: ABdhPJx3FlWvq/ELhQaqN25Y+JvPNsma3T425v7WMG7udITx98z2t1PeLJlC4vWYiLbDd9Hp9mhtWg==
X-Received: by 2002:a1c:7d06:: with SMTP id y6mr11185837wmc.7.1630936193693;
        Mon, 06 Sep 2021 06:49:53 -0700 (PDT)
Received: from Red ([2a01:cb1d:3d5:a100:264b:feff:fe03:2806])
        by smtp.googlemail.com with ESMTPSA id i5sm6838107wmq.17.2021.09.06.06.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Sep 2021 06:49:53 -0700 (PDT)
Date: Mon, 6 Sep 2021 15:49:51 +0200
From: LABBE Corentin <clabbe@baylibre.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: gregkh@linuxfoundation.org, mchehab@kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, mjpeg-users@lists.sourceforge.net
Subject: Re: [PATCH 0/8] staging: media: zoran: fusion in one module
Message-ID: <YTYcf3We4dcvBx1h@Red>
References: <20210903191540.3052775-1-clabbe@baylibre.com>
 <efe035cc-1839-210f-c0d4-4d58801aa65c@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <efe035cc-1839-210f-c0d4-4d58801aa65c@xs4all.nl>

Le Mon, Sep 06, 2021 at 01:03:56PM +0200, Hans Verkuil a écrit :
> Hi Corentin,
> 
> I finally had the opportunity to test the staging zoran driver.
> 
> I found several issues when running v4l2-compliance -s (I posted a patch
> for that), but more seriously is the fact that trying to capture MJPG
> at resolutions 384x288 or less just hangs my PC. It works OK with 768x576.
> 
> I discovered this when running 'v4l2-compliance -s -a -f'.
> 
> BTW, why isn't the initial format equal to MJPG 768x576?
> I would expect that for these boards that should be the default format.
> 
> Another issue is that the TODO should mention that for video output there
> should be a second video device node. And that's really something that
> has to be done before the zoran driver can be moved out of staging.
> 
> It shouldn't be that hard to implement, I think.
> 
> Right now it is impossible to run the compliance test for the output, since
> it doesn't even see it as an output.
> 
> Regards,
> 
> 	Hans

I work on having a second device for output, (it is the reason of "staging: media: zoran: move videodev alloc" which will help).

But I still have the problem of non working output.

Does output is really needed for going out of staging ?
Probably nobody have it working for ages. The only way to had it was to use an old mplayer output which is broken since so many time.
Note that this plugin will never work again.

The only way to work on output is to use ffmpeg which just recently have suport for writing non-raw video to V4L.

Regards
