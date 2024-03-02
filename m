Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C8A79F0
	for <linux-staging@lists.linux.dev>; Sat,  2 Mar 2024 09:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709373593; cv=none; b=cwXG+eMjcMCo6ldDiZjGT3dl9u86SSnJ5rTEq2KrV1JoCZM+LOws3ZA0V6KKb97IQ8uq6EDf0JBGk8tqXyeol74iK+z3z7APID4uqi31v6j4sMIzHfcVPrFDbdpoSvLnobaEdyncTshZodwRacLctARoTfX0Bgb1PJ5Llrc+hwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709373593; c=relaxed/simple;
	bh=/0GFsJ+1/uHwP0+rcrGwi4dtraL0RyOLUoywuy05330=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n8PnJQRIhniTwquIHH77k9PTknecyBbSbZVJgWo6wmcfgZmH+L62hBWCrljRgm8n0CD8XgKqCsT2K36/3oK7StoyoOriwsevo74W/FbqX2XE8p9WH2FD0I7HA8zSaWbe/skbXPijaaYsNVD2iD6dVu9gYf2K6DBpiO3/pg+3X34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bBYkeCAl; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bBYkeCAl"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-412d6906338so1123405e9.3
        for <linux-staging@lists.linux.dev>; Sat, 02 Mar 2024 01:59:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709373589; x=1709978389; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WXevwhgIr2J2YRRZ5pTYABsmmlbW89cM1iNV1W0EhcQ=;
        b=bBYkeCAligC5DOSejN0ZyvlC3rzDPqreRbqb1pV5hfTgLZrVeDwSjoE5UjKsdUWIcd
         aqUxkfNGIHTmy3NYNjN0ygDpnyhFacwb3znstJ2o0I0hlAB/+fcIfu9cjDfCcV87rE++
         541UTpTz0AingiwcQtGE10lmVYSrajQRqxjAVvDxtRtlCR2bzuQDgm4lRKTv4Waa9yqb
         w/fSPCtvU+7mLonvd1JOOfgxGQc1JQRBmXKqHlRk5vNS8nxQ9zeWSl/vCM95wY+eGz2h
         oYPHPoZ2l99YRpl93dfGBEGRobgX4tMWBD6s6YMdQ6OHfjXQzuzJ0QUfjvyUe/oTlWeu
         ZcbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709373589; x=1709978389;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WXevwhgIr2J2YRRZ5pTYABsmmlbW89cM1iNV1W0EhcQ=;
        b=OW5fJ4T31gNBwC0wEGeiNBdLgySdV/53YaQfemQMvpKJOdTPlmtQjeD3XeBVStuKx7
         VTjMO584LrdOeLJRsQ7PrbvcAK3CgZ4VbPuzzJM69mK3wkB6kNkBbh+/zALXw/Xb3KGP
         aVAn366j9HaxphHsU26mtU19p68ZDlxypAlGhxy39tQeg3nX1M9U5PYRLcogmmTkJm3a
         ARHhhpyuLCrxdiZJzxbvXHrmNb5TvQM4ygCnJ1Cx7BRvVIckl6Ng7lz0TXPgzPTR9OZa
         kfN6B8vOllzqmMx1NjXOKfvrjNACTBuq5rjWHkxJrUU7f7BQHglxIUAUC0gNXW0UeL/W
         iCiw==
X-Forwarded-Encrypted: i=1; AJvYcCVUoTUuv6wWvqkTUOFHW0cWXUWqYbZ/RsWb9aKauJeTmoyZDFXT9VXTIhzfqBjXmHMwEKvWmSESejathXYkZf/rGljuHZo8WWc/ikKwRg==
X-Gm-Message-State: AOJu0YyN+0BWhJpcPzTuDrmi0dto4sj4kzyOWc4o9vumI9k3pHNshAH8
	T/thz1k8AoS4FDfk4Qys3IOqm5h3TBRq79QhVQq6IyM4RverrvwgJSNM3gKo+gI=
X-Google-Smtp-Source: AGHT+IGp8XtRUBc+woL08R4bjKNomQ6c36yPs4xmUB7xf/YAncZBACwwvcMHn7i4i9lCZGd9kOTtyw==
X-Received: by 2002:a05:600c:5192:b0:412:afed:5cfb with SMTP id fa18-20020a05600c519200b00412afed5cfbmr3731099wmb.15.1709373589034;
        Sat, 02 Mar 2024 01:59:49 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id z9-20020a05600c114900b00410bca333b7sm10876433wmz.27.2024.03.02.01.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Mar 2024 01:59:48 -0800 (PST)
Date: Sat, 2 Mar 2024 12:59:39 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Mikhail Lobanov <m.lobanov@rosalinux.ru>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] greybus: Fix deref of NULL in
 __gb_lights_flash_brightness_set
Message-ID: <7ef732ad-a50f-4cf5-8322-376f42eb051b@moroto.mountain>
References: <20240301190425.120605-1-m.lobanov@rosalinux.ru>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240301190425.120605-1-m.lobanov@rosalinux.ru>

On Fri, Mar 01, 2024 at 02:04:24PM -0500, Mikhail Lobanov wrote:
> Dereference of null pointer in the __gb_lights_flash_brightness_set function.
> Assigning the channel the result of executing the get_channel_from_mode function
> without checking for NULL may result in an error.

get_channel_from_mode() can only return NULL when light->channels_count
is zero.

Although get_channel_from_mode() seems buggy to me.  If it can't
find the correct mode, it just returns the last channel.  So potentially
it should be made to return NULL.

diff --git a/drivers/staging/greybus/light.c b/drivers/staging/greybus/light.c
index d62f97249aca..acd435f5d25d 100644
--- a/drivers/staging/greybus/light.c
+++ b/drivers/staging/greybus/light.c
@@ -95,15 +95,15 @@ static struct led_classdev *get_channel_cdev(struct gb_channel *channel)
 static struct gb_channel *get_channel_from_mode(struct gb_light *light,
 						u32 mode)
 {
-	struct gb_channel *channel = NULL;
+	struct gb_channel *channel;
 	int i;
 
 	for (i = 0; i < light->channels_count; i++) {
 		channel = &light->channels[i];
 		if (channel && channel->mode == mode)
-			break;
+			return channel;
 	}
-	return channel;
+	return NULL;
 }
 
 static int __gb_lights_flash_intensity_set(struct gb_channel *channel,
