Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4D7538D;
	Wed, 15 Mar 2023 14:03:31 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id j19-20020a05600c191300b003eb3e1eb0caso1158298wmq.1;
        Wed, 15 Mar 2023 07:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678889009;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XIk3ogv3pUdC7KwTvWg8R7IPOwtwSacY2eCQ4DVoSyw=;
        b=DhcNMjg36eUyCZu6ESsusG9qEqjaDiku8RyxJ9JQ5O4rOyvTH8Jii5N6Hw75QSECp3
         YPKlKhvmRV9mQ8RmIxvEPO9PXLb5c9gH/lXlQkOeFd00PXXPoKra/wqebmzCt/MniQr0
         RRr3XZjIN6ulRMO98Po1CAdXZKJq51jQJLeJcLCQ/OPWe+mH/j7aCAyLeoNnK2qZfAYr
         moZzn/fIP9zx1i51U/LAjhNu+L9ho6c34uRIT9mfUILwxCBZW060XcpNxgmJr8SrJHND
         iqzunKvoqnkQ04Eu0/VApr3FNVHxVyIMVpD1aC1K2zd6k8BF0P5d0sY3fHMH+nsiG39l
         6SyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678889009;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XIk3ogv3pUdC7KwTvWg8R7IPOwtwSacY2eCQ4DVoSyw=;
        b=oQkNVPOn4znaMR6zPIBl+fw1flWauT2OE7CYfCUsoSsqtW1j+kD7uv/y4AW2PQJcU2
         EenZMBCQ1nL3Amf4xMb0l5TPidxdvg0NV+kLFs1O+WWNr6QHUaLB0f1DFYVQALNJQX2R
         8zDpohgMXFlwBhdogPuD76l9XnPy5N4uTxUfyOWE8MwwwfypqvMaCsNfru1uxgvx0kYp
         byqy/y90vhbVQDoP5nj+ArRLPhYfO4RDA4oxmawhVuz/cuWnswKms4f5PlQaA0pr7JI4
         JvZe0tLM1v5ePJquuyANQ4QpNqkCiv1Tl5LWOF3wGR/oxB/odiNCs0bLL35tGZHTMCXV
         CFkQ==
X-Gm-Message-State: AO0yUKUprLADc8w/q1xkTIGPI1DL9yOV/wDX7Ps6933WkelJKz8b36v3
	9tz36+/2YgUvUFoFll8ECYs=
X-Google-Smtp-Source: AK7set+96i3xc8VHHtOjLteM5z+uwSmEOg6a1WnipirrplHwA+cni/zDDYAcWHcmCNkqwSOh+2nBpA==
X-Received: by 2002:a05:600c:540c:b0:3eb:25ff:3446 with SMTP id he12-20020a05600c540c00b003eb25ff3446mr18054106wmb.4.1678889009322;
        Wed, 15 Mar 2023 07:03:29 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id bg5-20020a05600c3c8500b003e7f1086660sm2211614wmb.15.2023.03.15.07.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 07:03:25 -0700 (PDT)
Date: Wed, 15 Mar 2023 17:03:20 +0300
From: Dan Carpenter <error27@gmail.com>
To: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
Cc: Michael.Hennerich@analog.com, lars@metafoo.de, jic23@kernel.org,
	gregkh@linuxfoundation.org, linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Outreachy Linux Kernel <outreachy@lists.linux.dev>
Subject: Re: Outreachy
Message-ID: <8a30c3d1-a1a4-468c-a9f4-d15e0f418ef6@kili.mountain>
References: <ec13bbba-88ec-64b0-58ae-eee8617990b8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ec13bbba-88ec-64b0-58ae-eee8617990b8@gmail.com>

On Wed, Mar 15, 2023 at 03:17:28PM +0200, Menna Mahmoud wrote:
> Hi Mentors,
> 
> 
> I am Menna, Outreachy applicant and I work on my clean-up patches.
> 
> Is it Okay to work on this error reported by checkpatch script?
> 
> 
> drivers/staging/iio/frequency/ad9832.c
> --------------------------------------
> ERROR: Use 4 digit octal (0777) not decimal permissions
> #256: FILE: drivers/staging/iio/frequency/ad9832.c:256:
> +static IIO_DEV_ATTR_FREQ(0, 1, 0200, NULL, ad9832_write, AD9832_FREQ1HM);

What???  Is it complaining about the 0200?  That is octal.  Why is
checkpatch complaining about this?  Am I wrong?  Maybe I am misreading.

I could investigate, but I am leaving that task to you.  It may be that
checkpatch has a problem and you can fix that instead.

regards,
dan carpenter

