Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1403ED2F3
	for <linux-staging@lists.linux.dev>; Tue,  5 Sep 2023 11:59:51 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-31c3726cc45so2152240f8f.0
        for <linux-staging@lists.linux.dev>; Tue, 05 Sep 2023 04:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693915190; x=1694519990; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=H9w3uV4OtPsdBYbHCTZu/QSzm/qmPZOCTm5LGAMv9s8=;
        b=vIsvEBlvFjYE7hkT/Ww5IULseDx5zFbmxnjUSv9iGRCys6EXhFjp0IwxmBA8Z5nYIn
         6hckJjiLyUPlaCMotDlE46xyDiOhIZ6v8S++TTlZslgHOV25Oj/LLi5VGnRAkhRdUUx2
         S4Hj1NSfzJt0AEBpd6QH3XnA11hkDfcLGTOc96ZWMiGEVJjQH5CEQyCnc33+bXlZxTq4
         8aFFZy/zRrkbYNYouCXEzr9QfIkXgno5Kle70nEbtMuU76WehsXQcVw//scRER2vOD9b
         1qC84wDOB6zTAyFTZNpXT6XW5Wr8iUrHiu01hSIGXhvjDfD0aT5fVSyLHxxfEx248HmJ
         vrdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693915190; x=1694519990;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H9w3uV4OtPsdBYbHCTZu/QSzm/qmPZOCTm5LGAMv9s8=;
        b=iyWm5gchYWOpzDk0hmmTIVNxaVX7Ik6V4J1uXEpD6FyGLkx67ZTWjzqomCpeZTTF7K
         xqvR1qzhDbM6L+dzzwcj8+dRYA/PzWEve4ToXiJICghChVTXpa3lz94txbBbh3nQQE4Q
         EmNZfzlcPp/TG48WMw1Pexinmc2I0af6CxsntkSlIOOpyRx3J/W88D9wNwKz6DlKmkwF
         Nh5bLmqGiOnOjnDnZ6I1TXjHJ9d7PJxA/I2YT1eHrsPKpz3MirZv5op1zh9OlB2luUrV
         DN07T5wVYO2wyl4T2HeiJL3mNU967nW8Y2quRV1hyZduPOFO5B+6L7wNhIfJXcO8mYY7
         E3iQ==
X-Gm-Message-State: AOJu0YzTIEW1tyGwLqiCTqmowdEm35TTME/PwTKn9cm21mjqF8J0ZPt9
	hEla+M39/OXX7Z9mdFGjcl0wvg==
X-Google-Smtp-Source: AGHT+IHXh3GSboJMjsDNLpubzBj884qaOle8e1HaDZcS5Oou0lZ3DTIj6eJGKfPhqNq6aeaPHcx9pw==
X-Received: by 2002:adf:f208:0:b0:318:7d5:67bf with SMTP id p8-20020adff208000000b0031807d567bfmr9465711wro.49.1693915190016;
        Tue, 05 Sep 2023 04:59:50 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id 16-20020a05600c025000b003fee7b67f67sm16725545wmj.31.2023.09.05.04.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 04:59:49 -0700 (PDT)
Date: Tue, 5 Sep 2023 14:59:47 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>, netdev@vger.kernel.org
Cc: gregkh@linuxfoundation.org, philipp.g.hortmann@gmail.com,
	straube.linux@gmail.com, Larry.Finger@lwfinger.net,
	wlanfae@realtek.com, mikem@ring3k.org, seanm@seanm.ca,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH -next v2 0/3] staging: rtl8192e: Do not call kfree_skb()
 under spin_lock_irqsave()
Message-ID: <d7326392-56e4-4ccb-a878-0a03c91d0d85@kadam.mountain>
References: <20230825015213.2697347-1-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230825015213.2697347-1-ruanjinjie@huawei.com>

Added netdev because they're really the experts.

On Fri, Aug 25, 2023 at 09:52:10AM +0800, Jinjie Ruan wrote:
> It is not allowed to call kfree_skb() from hardware interrupt
> context or with interrupts being disabled.

There are no comments which say that this is not allowed.  I have
reviewed the code to see why it's not allowed.  The only thing I can
see is that maybe the skb->destructor(skb); in skb_release_head_state()
sleeps?  Or possibly the uarg->callback() in skb_zcopy_clear()?

Can you comment more on why this isn't allowed?  Was this detected at
runtime?  Do you have a stack trace?

Once I know more I can add this to Smatch so that it is detected
automatically using static analysis.

regards,
dan carpenter

