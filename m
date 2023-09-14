Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685D4ED9
	for <linux-staging@lists.linux.dev>; Thu, 14 Sep 2023 06:45:14 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-31f8a05aa24so553878f8f.1
        for <linux-staging@lists.linux.dev>; Wed, 13 Sep 2023 23:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694673912; x=1695278712; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qciRX+mxJBBHRMzVMlIssNJGjXlizxRyZBvLkx7U7fE=;
        b=udy4SgjpIuKMUyD0Np75E+If2H4D7htlbeUWKSUMV1Zm3UW/z3n4/1c0vVSljNHTvM
         6QpLA72dhle6eEtI1wyVu5yL3kSgKNTaYAGBi7TBvY/ksMRowDMsh+vIDadWtmNvqIg+
         Q0cE8uc1zQ3cwXXY05sDZdCSz3P8mZ4oQBpkBVR7RoqFElIMMZSVptLR/+m5U4bfB1wx
         HRFG/Oq2wkUPd5dOgs3lHFA6hdCGZFO47Yyrdso2/LphNPT/hDmSUJWEz/4NKId6q3vw
         FlPhN9wdlxoIKwVyUerTbgw3qdeaJT3pYp67ZbgKT0BeFrktQ81SlOl4ctSwkN6tsaYC
         OsUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694673912; x=1695278712;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qciRX+mxJBBHRMzVMlIssNJGjXlizxRyZBvLkx7U7fE=;
        b=Oz8uudESUCcvbBX8Q5olN0tf+8crxG8xQZCqOKu+PyhGhgfTFMGadqorqHfOzQdOoA
         4zbYJGvGEglhBmC3h88T/BkMqcfKb/0RaOsHN59Y5a0tu4KeAXinMThJsTBNdZmh7KzA
         GZM1js47K4l3aTyfD13pjwgSVpgQhd5JQ0GoopHXhu1iAkZ9X0JgTQCtckLy3MI3vKSJ
         aNxdt9jqfIaeDuG62FaiVT4/HBpxPPRiJjAhSPxr3Id3URrtLzuFT5WtNeH4uHAt7Y1c
         y3/VkynOLKwV+SLWTxIjtBwbTv8r7H14JH8g/FBKSmFKyZEje170nzjGC9FWapBnEdI7
         wKFw==
X-Gm-Message-State: AOJu0YwwwZ1PsKum0B/gMWzJxo1qRC9L8MzytEbFDxP+oq1yWbE7m9hi
	BuQOS0ddkNZMcvqlSQku19K7qrqmvQTR4f2qlCw=
X-Google-Smtp-Source: AGHT+IHe7UCEpR+G+JyVeTmGXSRIMzrAAHrOS6yN9jozComNQvSSilZ54N6s5sU/SwELgdKIAspvGg==
X-Received: by 2002:a5d:458b:0:b0:318:7d5:67bf with SMTP id p11-20020a5d458b000000b0031807d567bfmr3770811wrq.49.1694673912687;
        Wed, 13 Sep 2023 23:45:12 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id y12-20020adfee0c000000b0031aca6cc69csm861825wrn.2.2023.09.13.23.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 23:45:12 -0700 (PDT)
Date: Thu, 14 Sep 2023 09:45:09 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Umang Jain <umang.jain@ideasonboard.com>
Cc: linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stefan Wahren <stefan.wahren@i2se.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Adrien Thierry <athierry@redhat.com>,
	Dan Carpenter <error27@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v11 5/5] staging: vc04_services: vchiq_arm: Remove
 vchiq_register_child()
Message-ID: <44275d78-7318-4a28-b048-01b60f90d2fc@kadam.mountain>
References: <20230913195354.835884-1-umang.jain@ideasonboard.com>
 <20230913195354.835884-6-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230913195354.835884-6-umang.jain@ideasonboard.com>

On Thu, Sep 14, 2023 at 01:23:54AM +0530, Umang Jain wrote:
> vchiq_register_child() is used to registered child devices as platform
> devices. Now that the child devices are migrated to use the
> vchiq_bus_type instead, they will be registered to that. Hence, drop
> vchiq_register_child() as it is no more required.

This needs to be folded together with patch 4.  Otherwise it introduces
a compile warning which breaks git bisect.  (I haven't tested this so
I'm going to be so embarrassed if I'm wrong).

regards,
dan carpenter

