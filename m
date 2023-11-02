Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CFA81BDEB
	for <linux-staging@lists.linux.dev>; Thu,  2 Nov 2023 14:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bLQpGIFr"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-9c41e95efcbso149458166b.3
        for <linux-staging@lists.linux.dev>; Thu, 02 Nov 2023 07:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698935477; x=1699540277; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IM5n/dsc1U3VyZD/kU7nFCD3rW9G/9wfv8XONCzUoVQ=;
        b=bLQpGIFrGsEP6SQ9k82Q3S+hosFiBd/VjgOHN93xc9YhhS+UkQb7qXSu+zj+RvS3bn
         A/3wxrNe6+AKxP0du+ilnx4rcTAIX4n/eEcsBnXkGuzF8rL/oc2thshnNGFWppO+BiOF
         CTVVjdE8GYKJy8iqPSGVx2ZD7hh/APk0rHkcXJC4KmPhAr/ukrzm2tz5HygFoP4vI3uK
         jOl8SYgbjKkRGEyg+IpzMPzuQhotLAW4d9k0uluQ6n0CV5CAxtgvMRLq2aBIpa0CXq/K
         wylNclHLN/0h5hIubgTLbQmrGDhRalB5doVI1lvDFyFZn85hvKJWAM3dDXVSdOH86FvV
         gAMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698935477; x=1699540277;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IM5n/dsc1U3VyZD/kU7nFCD3rW9G/9wfv8XONCzUoVQ=;
        b=MIL899FGvl0+h88obfcaQ9sVlAgxPZ6Ab5bHtyYqb8nmjXtT1WrlF+30kMYdvQxkB+
         uL3B4y0vMC0ZQ4Ycxv1P4L4Wbkoe1aPg0b/k0QZCzJgNaOtZZMW/R9AVfA9kgoiSc6Fn
         B7Qt6iCcDVEN0oNb1e+q8uIpcuNtPEibKm8EzNjnYwerqJwTMHGk5ilj+lTRn0XicETV
         KnVGdbwmdd/Jo79tu3FSDoa2Lj7zh3LQmED3CLQ1l+tDYHQAUyGee7z/RJEhpVJfsj6V
         Wz09FXE1fzfkcU6qDroU0LEKJU+RbVxCWgVWCbe5foSX3mO9NOqr1OqCRZ75mo5ISIgH
         JSEw==
X-Gm-Message-State: AOJu0YzftCycbkUwP9BcvA1dGKn8o8J2Rr4fnbyznRWdg+rIj7QYQXgu
	WavgNaHX/8qXaIlVAFdbjIMX8A==
X-Google-Smtp-Source: AGHT+IHyujoiAsaChivrEQn1HXmVMVyLwPAXky87rdhKgOFCHxxWUybvxziS+0RLPGY5Y130m30Fgg==
X-Received: by 2002:a17:906:7956:b0:9c3:a3f2:4cec with SMTP id l22-20020a170906795600b009c3a3f24cecmr5101056ejo.0.1698935477571;
        Thu, 02 Nov 2023 07:31:17 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id f25-20020a1709062c5900b009ad7fc17b2asm1199083ejh.224.2023.11.02.07.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Nov 2023 07:31:17 -0700 (PDT)
Date: Thu, 2 Nov 2023 17:31:12 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Alexandra Diupina <adiupina@astralinux.ru>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andy@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
Subject: Re: [PATCH 1/4] Remove redundant return value check
Message-ID: <fc1ba609-93d6-4508-b6ac-bba9471cb075@kadam.mountain>
References: <20231102141135.369-1-adiupina@astralinux.ru>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231102141135.369-1-adiupina@astralinux.ru>

On Thu, Nov 02, 2023 at 05:11:32PM +0300, Alexandra Diupina wrote:
> media_entity_pads_init() will not return 0 only if the
> 2nd parameter >= MEDIA_ENTITY_MAX_PADS (512), but 1 is
> passed, so checking the return value is redundant
> 

It can return an error because of this check:

drivers/media/mc/mc-entity.c
   215                  if (hweight32(iter->flags & (MEDIA_PAD_FL_SINK |
   216                                               MEDIA_PAD_FL_SOURCE)) != 1) {
   217                          ret = -EINVAL;
   218                          break;
   219                  }

Plus I don't like removing error checking for this reason.

Earlier this month I fixed a case where someone removed an IS_ERR()
check but then we modified the function to return error pointers.
https://lore.kernel.org/all/356fb42c-9cf1-45cd-9233-ac845c507fb7@moroto.mountain/

regards,
dan carpenter

