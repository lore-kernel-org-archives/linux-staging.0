Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F941578
	for <linux-staging@lists.linux.dev>; Tue, 15 Feb 2022 15:42:18 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id l12-20020a7bc34c000000b003467c58cbdfso1759699wmj.2
        for <linux-staging@lists.linux.dev>; Tue, 15 Feb 2022 07:42:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Gtjf9sYNQ8tWBLlDu3878tO9bOueSPSIdgfErkYWlBY=;
        b=DfOm8aL3XIsw72i/aZu6TaMC/vPWGMQcXFr7OkI4Sf4eJrfk085WYNEhE+YixC1q9B
         URdh8F77SUPEgJZQr5QXaHqX6CdKz9yrjFxWzIH9q9JALAqMZjdtzp+dEb7tENQ3uRxk
         b5kqYhOXOH+exRGXHZDAmKVw7O4YZFqXS1BLFZJYFX2I522dxdj6NmQEpOt4DD5vOHbV
         s9hW+Om+CoGgk8pR5NXkxcrG1j9UEir00MQhC9r1fQsVR1EBoJcI4eirTOn19do2+TIf
         Lx2dj12+PPeEMK9mjKSkkEACHehbDAl6CMbg0vXb+oLop+OXpJ9jkc7JqBtqUT33J+wP
         zpRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Gtjf9sYNQ8tWBLlDu3878tO9bOueSPSIdgfErkYWlBY=;
        b=viVn9aCyp0hfRBDps8wK035ov4uUZu00CGSWO5dar3tp107POnJRiMecjdopP9sGYu
         LrC9XTVJVQuBoSVc9hxfXYY89PI3ksowvlBYrtLE3pU46DMgSvmh8GtGWymlijIcJc/S
         Gj/RUzy3OjFFgElEMtJ7AwgxkMo1/r2l8lkl2sZmm7cKIrTnBaAO15/cgplih4HV4OkF
         o0C6nH8tZlrq5Nk3v+NDuh5vuECMeah8dFTnA1/x+LW7dfp35RD0dRUOHQLPo9oL4ZGR
         AAAwjoqU3EJziLBhXfqbVjHoKUuxUVmqNJjPv00d6ugGPlOVIncrhFwWOj4w59o6TByS
         19TA==
X-Gm-Message-State: AOAM531TcpEsav4V+kxkJJRxmvkOnBAgg64FyXC2TxJ4Poq9Jvxe4IQr
	2YtLvzg+CKPPmnTbQaT6lRfkvA==
X-Google-Smtp-Source: ABdhPJwnCjLd1r+f0841f6Uaydm3Kuy4F+zJ0sUGx8wUMnwu4nP1nVBSXBIog2dMKdF/OUO+qbc42A==
X-Received: by 2002:a05:600c:2301:b0:37b:de9e:226d with SMTP id 1-20020a05600c230100b0037bde9e226dmr3567367wmo.78.1644939736406;
        Tue, 15 Feb 2022 07:42:16 -0800 (PST)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id g8sm19421269wrd.9.2022.02.15.07.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Feb 2022 07:42:16 -0800 (PST)
Date: Tue, 15 Feb 2022 15:42:13 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: greybus-dev@lists.linaro.org, linux-i2c@vger.kernel.org,
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
Subject: Re: [PATCH v4 0/7] Provide and use generic_handle_irq_safe() where
 appropriate.
Message-ID: <YgvJ1fCUYmaV0Mbx@google.com>
References: <20220211181500.1856198-1-bigeasy@linutronix.de>
 <Ygu6UewoPbYC9yPa@google.com>
 <Ygu9xtrMxxq36FRH@linutronix.de>
 <YgvD1HpN2oyalDmj@google.com>
 <YgvH4ROUQVgusBdA@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YgvH4ROUQVgusBdA@linutronix.de>

On Tue, 15 Feb 2022, Sebastian Andrzej Siewior wrote:

> On 2022-02-15 15:16:36 [+0000], Lee Jones wrote:
> > On Tue, 15 Feb 2022, Sebastian Andrzej Siewior wrote:
> > 
> > > On 2022-02-15 14:36:01 [+0000], Lee Jones wrote:
> > > > Do we really need to coordinate this series cross-subsystem?
> > > 
> > > I would suggest to merge it via irq subsystem but I leave the logistics
> > > to tglx.
> > 
> > Could you answer by other questions too please?
> 
> I don't think that I can answer them. I said I leave the logistics to
> tglx.
> 
> This can go via one merge via irq. This can also go differently i.e.
> feature branch on top of 5.17-rc1 (with 1/7) which is merge into each
> subsystem and then the "feature" on top.

Apologies for the confusion.

I'm not asking you about merge strategies.

We can handle that without issue.

> Either way it remains bisect-able since each driver is changed
> individually. There is no need to merge them in one go but since it is
> that small it probably makes sense. But I don't do the logistics here.

Okay, this is what I was asking.

So there aren't any hard dependencies between the driver changes?

Only the drivers are dependent on the API.

So, if we choose to do so, we can merge the API and then subsequently
add the users one by one into their respective subsystem, in any
order.  This would save on creating an immutable topic branch which we
all pull from.

What is your preference Thomas?

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
