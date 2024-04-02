Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFB2F15AAB4
	for <linux-staging@lists.linux.dev>; Tue,  2 Apr 2024 16:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712076424; cv=none; b=Ba0bbRhWmwE0cwgIvht8/zF1KoVuCnV+tJCtZGc59ZWA4HvkyzmPjDhYW0Xr5G8Fe0SG/qCUuBXgL5LcxN5JHanGkQGdL/CvHkYhw+OSFcIBuV/cKzYIGybGusQJepHeDzo8kYeQh/L6gBGEuTGRQYrRIDY9SJzpLMmuRVMojHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712076424; c=relaxed/simple;
	bh=wueQqgHgNfobgMl7ngnx77rJxYOAca9buPv+PhcY45A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NUqWsoa/4sIZy0QskeWKPmWTCV53mW3l5kNioO4JdTQw2Dge9X/tgpCeAUDnAIYbELSzYKXjrogNSdh8pw/SJOQ5fakAC1bhkXmPCVDhzHbOEOeBkZu1oDxgCPo9nIgTIy5RUA1TlPBhgGDxEFEL2FyedQYERMnifCbSjwvt5fY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BP/iqluM; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BP/iqluM"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-56df1dbb15dso1037319a12.3
        for <linux-staging@lists.linux.dev>; Tue, 02 Apr 2024 09:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712076421; x=1712681221; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CgRCLxVPL6foOssar2VbNFyHEq1eN153oN+Bgv5BRW0=;
        b=BP/iqluMKAk57W/PdeSwIVT99diKLtm2jOfZkvBCGduTRg6/xgHUmF+IksRahx0CXC
         JcwLfqPC4qmW7sei26Y5hy8fqFUy6xz+1/OcO91XRgH2PPRu8pXN7pimtIzYSvTuSFnB
         yULRB04Cfzc607WCmNgd8C6VjM75qhR4qCetp3GNVCThaxKkmwwgtdIYwOM9yq8+EQMX
         1NwEFi4x131bHEx0SIcBkdtND8KZk1VOt+EPN/ySHfcbpirBhEbqBAMsC6ZzX4AVnJDQ
         gSwpRzsACeSSax3Ogn4UR1Mf9okGJ8PLBUDuCBzEOrhTcSE7/lKMRnx/k+lk0yjjOrgS
         v9PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712076421; x=1712681221;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CgRCLxVPL6foOssar2VbNFyHEq1eN153oN+Bgv5BRW0=;
        b=csNOZo8XR6FLfigy04A/8B0H3tXo0BE9qZaY0vc/zPK7/fWpoWIP4j5h36H6TKEpQV
         GsaNUZRmgRMy1vddd79s5YBko6tFYJQ6mzshqYYGMQfZbHqRwxoPMsfaBFVj62XaBizl
         +WK4LyVIp3+D/+HIwT+dQZgpoKAV4cV1P0XfEqqK0A8dxde5t1bF2XFx//vZqJx98U2a
         QmTC4iYgtWLD3z/kJy/YDlIk07tgygZy841sebGrDvy8Fjcy1FY1M0Imlkk0zIy8Crii
         uYbBTaIrfKamAZfvqX9gIQAqpVIytPTZFJm8IK5SizUu+MrHR1RbY+D2xQn7JlprTzty
         98MQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmq2Orc0/+n5uqPfdHmANXlPDygrDQ1Bh4aKgGr82MzqOaIGLA9azrZj1TPBnxLK9g2gQODlI0fWAEMrKexdwjAxxcljn3xia/IzCNCw==
X-Gm-Message-State: AOJu0YxE7BxQixLgAKBuD2PTD0Qxk3OIeAEc/MICt89eZXLXVWwmlJND
	rP9dATBnQRnlf5gV9m4SqE0MitgAhCnc6PkMikeLZJc+/M/Nhlqf6tPGF6XXN4k=
X-Google-Smtp-Source: AGHT+IGekWANLpkZC1FyGzuPjK1/7OE3EWko5UnsSDR83c1+sNGh3cSBNrv0Gf8ykz8Q1y1BRVVhOg==
X-Received: by 2002:a17:906:d9cc:b0:a4e:109f:7b4b with SMTP id qk12-20020a170906d9cc00b00a4e109f7b4bmr8891710ejb.41.1712076421210;
        Tue, 02 Apr 2024 09:47:01 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id qf31-20020a1709077f1f00b00a4df4243473sm6683790ejc.4.2024.04.02.09.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 09:47:00 -0700 (PDT)
Date: Tue, 2 Apr 2024 19:46:57 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Shahar Avidar <ikobh7@gmail.com>
Cc: gregkh@linuxfoundation.org, hverkuil-cisco@xs4all.nl,
	andriy.shevchenko@linux.intel.com, robh@kernel.org,
	felixkimbu1@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/6] staging: pi433: Remove duplicated code using the
 "goto" error recovery scheme.
Message-ID: <068f3705-9f9b-4d61-be50-a131b9598703@moroto.mountain>
References: <20240402111414.871089-1-ikobh7@gmail.com>
 <20240402111414.871089-6-ikobh7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240402111414.871089-6-ikobh7@gmail.com>

On Tue, Apr 02, 2024 at 02:14:13PM +0300, Shahar Avidar wrote:
> pi433_init had "unregister_chrdev" called twice.
> Remove it using goto statements.
> 
> Signed-off-by: Shahar Avidar <ikobh7@gmail.com>

Your commit message needs to mention all the other changes you made,
especially the bug fix.  I feel like you're doing too many changes
really.  Just use the gotos to clean up but don't re-order the calls.

You need to add a Fixes tag.

> ---
> v2->v1:
> Followed by Dan Carpenter's <dan.carpenter@linaro.org> comments:
>         - Remove empty "fail" goto tag.
>         - Reorder pi433 init & exit calls so they have reverse order.

Keep the init calls the same.  Re-order the exit calls.  It's a bit of
a gray area if you can re-order the exit calls in this same patch.  Do
it in a separate patch just to be safe.

>         - Add "unreg_spi_drv" goto tag.
>         - Check "debugfs_create_dir" return value.

No.  This is wrong.  Debugfs function are not supposed to be checked.
https://staticthinking.wordpress.com/2023/07/24/debugfs-functions-are-not-supposed-to-be-checked/

>         - Update "if" statments for consistency.

I like this cleanup, but it's not worth the effort.  Just leave it
as-is unless you really really need to change it.  Do it in a separate
patch.

What qualifies as One Thing Per Patch is a bit of gray area.  Greg tends
to want things split up into tiny patches.  You have to know your
maintainer.

regards,
dan carpenter

