Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D06CAD38
	for <linux-staging@lists.linux.dev>; Mon, 12 Jun 2023 15:00:57 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-3f6d7abe934so31457335e9.2
        for <linux-staging@lists.linux.dev>; Mon, 12 Jun 2023 08:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686582055; x=1689174055;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/UCUFMga2EMcERlpB49Y2fRq+ymUyOKrUgYsHf0ed/0=;
        b=L7nqJsGZJ4kjY557qHqALuPae3RMHgvnYVpXo9/i2LZxf+CHtnV8BP7RS0uaMpPTwT
         X+6kER9YLs5NxP7uKsF8cHFD32Ls6Scn2FTrCk9nnG09Yp6PZMYOkG1tQkgHjBix6xY7
         xuhU29+n8M9LCoUamZ9pqUzT8dDv7DywYHg8fIZMxw8t7F+5VYUwNYFTYo9GfgqeretD
         EmsVU0NZjuohlcKKvHC1OpmyXxOWixpyOSKcW7xV3NEfYWS56ZHkZZAui0yWoIrkt/Qe
         cHuDOT6CHhLJpMAmKvexEECF0ia6zcRfZkBvR9gopfAI64jbHon5ing/2AKGWvSwP9r3
         IlEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686582055; x=1689174055;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/UCUFMga2EMcERlpB49Y2fRq+ymUyOKrUgYsHf0ed/0=;
        b=D4yOUot9PGwxOXnEdCWudPPm0K4tXUbDzAYuCbxfCCoNb+vo9SPFdQiIqW0KSIbjEi
         16mbDvOTDVTtZAzVd0ZMqQuWq426Z5jsQO2dn+ti6QnheSLQeN+9w36KJteUY3C7BKIt
         OMG/9j5JZWlP3wwGhWE3btqooVL1AtJLxh7mGfhK7GushehG72FmL39FkWrEnT9BB5eS
         OsqOdijCPj3osW86PCM4jBZiILFz76FEgqZUtD5CX9Skbj4tqIMryCTwn8GIOzjR7jZ0
         iMsC5WTy38HBG9QNqa7oZgGkrtkUpNoaluadEsytjmiXNXnaR77evLlMDHGdObbSs4tC
         bfNg==
X-Gm-Message-State: AC+VfDwMrWYqnXoz74W4oVZ520G52s25SFyPoRW03YyznSyKOyY5YSbC
	7TR5CCQ7/hS42SI5Zhk/wq/SIw==
X-Google-Smtp-Source: ACHHUZ5u3c8rRm+E7KnayrCIdvayKld94mEi/X7AbulId0IMRsAxTcEdEsJfHEZekp046ksej9BC6w==
X-Received: by 2002:a05:600c:21c4:b0:3f7:e48b:9752 with SMTP id x4-20020a05600c21c400b003f7e48b9752mr5759053wmj.32.1686582054775;
        Mon, 12 Jun 2023 08:00:54 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id f9-20020a7bc8c9000000b003f8140763c7sm6545492wml.30.2023.06.12.08.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 08:00:53 -0700 (PDT)
Date: Mon, 12 Jun 2023 18:00:50 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: daniel@ffwll.ch, javierm@redhat.com, sam@ravnborg.org, deller@gmx.de,
	geert+renesas@glider.be, lee@kernel.org, daniel.thompson@linaro.org,
	jingoohan1@gmail.com, michael.j.ruhl@intel.com,
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-sh@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 01/38] backlight/bd6107: Compare against struct
 fb_info.device
Message-ID: <573e1bac-57a6-466c-ab69-28366a300143@kadam.mountain>
References: <20230612141352.29939-1-tzimmermann@suse.de>
 <20230612141352.29939-2-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612141352.29939-2-tzimmermann@suse.de>

On Mon, Jun 12, 2023 at 04:07:39PM +0200, Thomas Zimmermann wrote:
> Struct bd6107_platform_data refers to a platform device within
> the Linux device hierarchy. The test in bd6107_backlight_check_fb()
> compares it against the fbdev device in struct fb_info.dev, which
> is different. Fix the test by comparing to struct fb_info.device.
> 
> Fixes a bug in the backlight driver and prepares fbdev for making
> struct fb_info.dev optional.
> 
> v2:
> 	* move renames into separate patch (Javier, Sam, Michael)
> 

Thanks.  This helps a lot.  I stared at this for a long time without
seeing the fix.  Then I misunderstood Sam's review comments (my fault,
they were clear in retrospect) so I got completely lost.

regards,
dan carpenter

