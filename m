Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36ED3FC7
	for <linux-staging@lists.linux.dev>; Sat, 25 Sep 2021 08:41:38 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id s17so26986634edd.8
        for <linux-staging@lists.linux.dev>; Sat, 25 Sep 2021 01:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=TWXubKOvMz8RPY80gbWSplFIj9VL/MAsdT5ulfYEg5s=;
        b=Yzhy4VYAihYPNk68Q4uYq3tw96m2O/PpPGP4Uk2zg2vo0xh3ppb8W5YTlP+53E4pI0
         u0fsuFDEcX93I7dH8bb9SgGKRjhOd9TfYhc1uG7b4KUn5bH/iH4G5oPuwifDXggazKZG
         6RrP864voUkyyf7zbDdQ8ryDqgjJUzEwb7xU/4kQmTKt1R2hM5JO0MuAdTzT3uYZbwOO
         OEKT7HpCBboY3/qBTu7ND53JX6M++SDVKMla5KSZxwhS8AxUXLI7cgfWZeTFeWH+FDNs
         0M5/a1xVi63kEi9ldYlJZfrP/r353BwWLMpI8uRNskK0t+KqMQXDXmoWfdlyXo4t0Ziz
         PZiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TWXubKOvMz8RPY80gbWSplFIj9VL/MAsdT5ulfYEg5s=;
        b=VKYfveAiEgC1vwyhOdE4CSrfmzpW6WoPcEmeFTpCuboF+1u+K7Fulnv8OA7GEeup/l
         xWI/oFFnhxdPz58rdtyn+eU6KnQ4fb7lTG5uAvyRQpAVbPuvxrPP1njrWcgUMi5zBblb
         73+/ccoXLC1NV1+eCl2RU49XavFvXoMQSkIqFSAuVlGRPPm9ZH9nWtxBrvfayg7Fcl/Z
         N4Yw1AjEtyeZB4cM7TSz7EIG/NjQ1eBBbxRXW6z+roI9COzo/z75gd+D2loH2TTE8OSD
         nyFVQItuGbaBtZR+4f3eEjKjLQ0E7YW+5E3UB1jPhhGr5LvyZ4KZHF0VjooG4Hwsf08N
         UsIw==
X-Gm-Message-State: AOAM532vkmguVlgpP7AneQgbaB0NcdITOMt905WDZlGsycQ8WlEKUDTf
	UDsEX5tW+uKgRXyuVb2+y9k=
X-Google-Smtp-Source: ABdhPJx608ZOfp8CfukkMnRsT/CCD/4F5yQ2ZCozjRb8IELVkYCYHqPuEp+Fnj3pFtliU7iIPHn8gw==
X-Received: by 2002:a17:906:4ccf:: with SMTP id q15mr16221751ejt.9.1632559297269;
        Sat, 25 Sep 2021 01:41:37 -0700 (PDT)
Received: from tom-desktop (net-93-71-218-228.cust.vodafonedsl.it. [93.71.218.228])
        by smtp.gmail.com with ESMTPSA id 10sm6004676eju.12.2021.09.25.01.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Sep 2021 01:41:36 -0700 (PDT)
Date: Sat, 25 Sep 2021 10:41:34 +0200
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Forest Bond <forest@alittletooquiet.net>,
	Yujia Qiao <rapiz@foxmail.com>,
	Lucas Henneman <lucas.henneman@linaro.org>,
	Madhumitha Prabakaran <madhumithabiw@gmail.com>,
	Marcos Antonio de Jesus Filho <mdejesusfilho@gmail.com>,
	Aldas =?utf-8?B?VGFyYcWha2V2acSNaXVz?= <aldas60@gmail.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Deepak R Varma <mh12gx2825@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] staging: vt6655: replace camel case
 b_short_slot_time instead of bShortSlotTime.
Message-ID: <20210925084134.GA4727@tom-desktop>
References: <20210925074531.10446-1-tomm.merciai@gmail.com>
 <20210925074531.10446-2-tomm.merciai@gmail.com>
 <YU7XBPzQAq2s7d4L@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YU7XBPzQAq2s7d4L@kroah.com>

On Sat, Sep 25, 2021 at 10:00:04AM +0200, Greg Kroah-Hartman wrote:
> On Sat, Sep 25, 2021 at 09:45:22AM +0200, Tommaso Merciai wrote:
> > Signed-off-by: Tommaso Merciai <tomm.merciai@gmail.com>
> 
> I can not take patches without any changelog text at all, sorry.
> 
> My bot pointed you at the instructions for how to write a good
> changelog, please read that before resubmitting.
> 
> thanks,
> 
> greg k-h
  
  Hi,
  Thanks for your time. Sorry but I'm trying to check what I'm missing
  "Versioning one patch revision" as suggested by Gustavo A. R. Silva.

  https://kernelnewbies.org/Outreachyfirstpatch

  I put Changes since vN after git format-patch "---". Maybe I'm missing
  other stuff?

  Thanks for your patience.
  Tommaso
