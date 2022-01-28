Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749922C80
	for <linux-staging@lists.linux.dev>; Fri, 28 Jan 2022 16:50:05 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id bg19-20020a05600c3c9300b0034565e837b6so4972661wmb.1
        for <linux-staging@lists.linux.dev>; Fri, 28 Jan 2022 08:50:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=gWV/XN5zRAIOOyre4Hd3/1fPFNZKmFqNYxQX4mefTd8=;
        b=iQhCP4QJ3ZIaKczGKn75eQyoFch7y+0jad41X5WbyeWpudEj9Y4ji+bpEJSAHZsBVQ
         lkfzhuiReR3tMm3H/dRE67MlOYNdWanSon6m6voT1a3Hgg/f/hxlTZSovUnOa+iyWQIt
         QMLn3rz20Y4HcJS8PGzj121W4jc6nYF/t7H4GAb/RiWV+y3h2cufBDhmTfNLDxyyKZFs
         TyknngVD3tN/8Veb6D86QBy/t8oYJpadm5mFpGO9UH/9MYvD+E0eggjAPfJlL8O2EtWu
         8KS38Yl6BaEEFQzj8k5Vzr/e4NvKpG4vPxTUZVaLcfX9JydZ0tqb8xTmzTjfhkXyDDD1
         iVew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=gWV/XN5zRAIOOyre4Hd3/1fPFNZKmFqNYxQX4mefTd8=;
        b=KfbMCGFwrv7CAm+jjcGqIz4fDntCnGorX7G5Eh8clYrzti6wlYhLcPBAk1gv4LwGv0
         az7YIi4l4XsS2o+pyXxzQb6mkQqc08n6hlRIjOo4dYC4hzvGABs9VgQgfAgR+QuHqVQE
         OBV5ba8zEGQyFgZYmdtyDhwrFfzFlnRb5/xtICBtKVPRzPFLOI7vxGaDGdB+Z4tXuSaE
         cwwxwnwjHo6IahGFXHn1pzWmSMjJBGSWmjb/zg4Z7MALwWWWRcC8LJt7fM44OKTDIoyL
         Vqu1ledBW2ULmNnL/8ft+xd74OCPwCNDcIYllZyK8U6vZNU7LM0Ng9itBMncLlySZ6gh
         H/cQ==
X-Gm-Message-State: AOAM531QNeth+T8Dnq8iLpHcLRx8/P7tMGD0FBaCsvMzwYQZ/O2LbmJx
	Mk7ZokF5ViyAwYsVHN58ipWecA==
X-Google-Smtp-Source: ABdhPJw6QP3li/jhqP7ZNADp8FrhH03P+aiOFZw5bn2VcoRg+qe/gkT7qFizWbRpefPZjrJT/Pw+8A==
X-Received: by 2002:a05:600c:1da5:: with SMTP id p37mr8171246wms.93.1643388603717;
        Fri, 28 Jan 2022 08:50:03 -0800 (PST)
Received: from google.com (cpc106310-bagu17-2-0-cust853.1-3.cable.virginm.net. [86.15.223.86])
        by smtp.gmail.com with ESMTPSA id a14sm6328156wri.25.2022.01.28.08.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jan 2022 08:50:03 -0800 (PST)
Date: Fri, 28 Jan 2022 16:50:01 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	greybus-dev@lists.linaro.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-usb@vger.kernel.org, netdev@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Alex Elder <elder@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>, Johan Hovold <johan@kernel.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>, UNGLinuxDriver@microchip.com,
	Wolfram Sang <wsa@kernel.org>,
	Woojung Huh <woojung.huh@microchip.com>
Subject: Re: [PATCH 4/7] mfd: hi6421-spmi-pmic: Use generic_handle_irq_safe().
Message-ID: <YfQeuWk0S4bxPVCg@google.com>
References: <20220127113303.3012207-1-bigeasy@linutronix.de>
 <20220127113303.3012207-5-bigeasy@linutronix.de>
 <44b42c37-67a4-1d20-e2ff-563d4f9bfae2@gmail.com>
 <YfPwqfmrWEPm/9K0@google.com>
 <d351e221-ddd4-eb34-5bbe-08314d26a2e0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d351e221-ddd4-eb34-5bbe-08314d26a2e0@gmail.com>

On Fri, 28 Jan 2022, Sergei Shtylyov wrote:

> On 1/28/22 4:33 PM, Lee Jones wrote:
> 
> >>> generic_handle_irq() is invoked from a regular interrupt service
> >>> routing. This handler will become a forced-threaded handler on
> >>
> >>    s/routing/routine/?
> >>
> >>> PREEMPT_RT and will be invoked with enabled interrupts. The
> >>> generic_handle_irq() must be invoked with disabled interrupts in order
> >>> to avoid deadlocks.
> >>>
> >>> Instead of manually disabling interrupts before invoking use
> >>> generic_handle_irq() which can be invoked with enabled and disabled
> >>> interrupts.
> >>>
> >>> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> >> [...]
> >>
> >> MBR, Sergey
> > 
> > What does that mean?
> 
>    Ah, you were asking about MBR! My best regards then. :-)

Yes this.  It's okay, Dan was kind enough to enlighten me.

Every day is a school day on the list! :)

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
