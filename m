Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1BF1FA9
	for <linux-staging@lists.linux.dev>; Tue, 20 Jun 2023 05:18:10 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2b45e6e1b73so50973591fa.0
        for <linux-staging@lists.linux.dev>; Mon, 19 Jun 2023 22:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687238288; x=1689830288;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y7PuqpyqHE/HUVu8CRaW9WlThpzPBfO6+875ZQx+jnA=;
        b=euZ3NbqF9mB24d0ScudIoCLcjGflfbklhPemkj/vHLxufMsWRiAGBP9qLHpeL7+ibl
         KRmAsBeL396AbnFIajAYSoVRQP1OSDV73iXpEuEqKjWbJuW1jnhGCNpaD4i0QrN0y4SC
         YYqtSkae846yMDjV3BaQJTSXpLLQqClqPJQylp5sQ9hbnOQKXk86ODhLiNMZFzXOUmqw
         spw6fYU/7QuiB7LtKQuSToUkUX4PVOZ7HQi9Sg3oPqRwUMlyvKkWTohnsVrmuBqhDdjp
         MORXtKz1IOxy2hQ2xYKKGz6TA5JWo/svqiWxln2fXV1LiYLgXbWOUwRQFaBoRWj+xMHI
         ESxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687238288; x=1689830288;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y7PuqpyqHE/HUVu8CRaW9WlThpzPBfO6+875ZQx+jnA=;
        b=KQKPbAqKMRhdMXNIOLpyxU5Ha2+FdujW6kLg7m50Qwn+Ug/G0oMQ/jgiH7/ynX+IpQ
         MzVMzXOqqW3UIIZyBKKZutjyRvK9qVAc1LlKZSKNqEP/jOOfHaVDtTebl01tk5a6OfDM
         i8aRXsfjRSoKShoENSaxf11zkvNOTBIjClo1aRqXNtIn8fvj+/WqI00/WqupE8aI3jVb
         8ryTyGW+slWamUMZAJZmjULF1BVXCKDW7xWRfdIne/sHAoD/bHQ0FGoK770Ue+QNdUAT
         xdrYDQk7h65YbuZTdhUxH57ahsqjaYpvTvWggEK2V2Njk8uNCXyk+LDt7lIU+i9kjT44
         p7DA==
X-Gm-Message-State: AC+VfDx0Z5lxCZFLv+wCd47mIh0/ly0LeYY35e8LrZYG8wPH1KDec7cm
	hBmmPmlpXTK3NDGxSwKzQwGLug==
X-Google-Smtp-Source: ACHHUZ5ccBcWPxcFeRk9KZTmk2iY37jAco/koAiv37L1FuAnmeROZMwkEffaczENJYwJooQ+gl1ReA==
X-Received: by 2002:a2e:95c4:0:b0:2b4:6a20:f12d with SMTP id y4-20020a2e95c4000000b002b46a20f12dmr4718664ljh.43.1687238288311;
        Mon, 19 Jun 2023 22:18:08 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id z8-20020a05600c220800b003f9b12b1598sm4395724wml.22.2023.06.19.22.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 22:18:05 -0700 (PDT)
Date: Tue, 20 Jun 2023 08:18:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Prathu Baronia <prathubaronia2011@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
	Khadija Kamran <kamrankhadijadj@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	error27@gmail.com, lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	oe-kbuild@lists.linux.dev
Subject: Re: [PATCH v6 1/2] axis-fifo: use devm_kasprintf() for allocating
 formatted strings
Message-ID: <e118d13a-d36e-4417-9fe5-68d46472c09a@kadam.mountain>
References: <ZI/5H+GZU6/2osGT@redkillpc>
 <20230619162246.33007-1-prathubaronia2011@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230619162246.33007-1-prathubaronia2011@gmail.com>

On Mon, Jun 19, 2023 at 09:52:44PM +0530, Prathu Baronia wrote:
> In various places, string buffers of a fixed size are allocated, and
> filled using snprintf() with the same fixed size, which is error-prone.
> 
> Replace this by calling devm_kasprintf() instead, which always uses the
> appropriate size.
> 
> Signed-off-by: Prathu Baronia <prathubaronia2011@gmail.com>
> ---
> V5 -> V6: Split into api change and name change commits
> V4 -> V5: Remove the dev_info() and use a unique identifier for dev name
> V3 -> V4: Split into warning fixing and cleanup commits
> V2 -> V3: Fix smatch warnings from kernel test robot
> V1 -> V2: Split into logical commits and fix commit message
> 

> -	snprintf(device_name, 32, "%s_%pa", DRIVER_NAME, &r_mem->start);
                                      ^^^

> +	device_name = devm_kasprintf(dev, GFP_KERNEL, "%s_%p", DRIVER_NAME, &r_mem->start);
                                                          ^^

This is a sneaky fix which Greg already kind of complained about if I
remember correctly...

regards,
dan carpenter

