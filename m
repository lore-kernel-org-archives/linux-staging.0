Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846392599
	for <linux-staging@lists.linux.dev>; Mon, 21 Feb 2022 12:38:12 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id d3so11186823wrf.1
        for <linux-staging@lists.linux.dev>; Mon, 21 Feb 2022 04:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=LKx7tTbFFTJnPN+u30WrvTluvsJNKvcCbVga5G4cng4=;
        b=euLhhZZCAI7A/+S/XKiME2KJm3o1oTmFVCPDGgzFxPD2ZbJ1lTYg7afyyVyL3gRe98
         idxSTePdGLX9d7sOwTHhzwAEWxOh9vHhERxV3oXp6U/pHUot27L8awxSYKn43JgEk9VO
         xMoaXpKHXp/XPZDkz7aGntl2MjCvslMxkER2B5OVMkqBxRsO+tvKorJ/2YRTj2go2DYy
         Ao/Jv886fKTdXfeFsccbc2ocJU51YG/+RctufqIhNMKqdkpkTjGfiMa+jJ0BPchvN3Zp
         6ed29r/PqxTv4NtEV3O9aeq+xkTgM2hKtwH9kJX+P4Ib7K6K0TjwFSUIuLcUh4EPHgM4
         gYRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=LKx7tTbFFTJnPN+u30WrvTluvsJNKvcCbVga5G4cng4=;
        b=P3G1MdVg68Xdos6pXmbwD4Ldd8YUl/9oFA4muVGh9Nfsi3sO882LNOUo0cm2MWpsUj
         nXCyux87uER4MBbJY2lqGRmgZAlmmFBnvGeE7gDjEiECSQkwvcnkTiHDItjWvN19uMRy
         hDkICALlOCkNSZCXt0AC1kHwZnjx/MYPMGJFrkur7UO1Asyew7Im38wnDrP/D6AgbHjV
         JYoTfWWtC8bW+oeAmQMREr0VlXYwHF9o1EFJHjh8ZumZgpn6d2LNTSQQEzIdP6csn3PZ
         5Lgsdk9yL3z9TXylYSV1um6OKXsM70TIpnxN/iEodA/Lxc7XrBZQJMycaWLIlsg3WXDF
         dSpw==
X-Gm-Message-State: AOAM532982Ka+bjfZtdGK/h/eZbFTjfvKkOWXy8jvTPMCM90ZvZEGpkQ
	CqKxNJXtk/tZjZPy20odJkuxPw==
X-Google-Smtp-Source: ABdhPJxHAdNPhIyEhEY/h4/cryx14gzxwTvnqDvWQ2edSk5VVdfaR7tSY1L1Bei9A1l58+XEvcEKig==
X-Received: by 2002:a5d:6a09:0:b0:1e3:3f5e:e8d with SMTP id m9-20020a5d6a09000000b001e33f5e0e8dmr15590128wru.670.1645447090808;
        Mon, 21 Feb 2022 04:38:10 -0800 (PST)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id t1sm60536942wre.45.2022.02.21.04.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 04:38:10 -0800 (PST)
Date: Mon, 21 Feb 2022 12:38:08 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	greybus-dev@lists.linaro.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-usb@vger.kernel.org, netdev@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Alex Elder <elder@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>, Johan Hovold <johan@kernel.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>, UNGLinuxDriver@microchip.com,
	Wolfram Sang <wsa@kernel.org>,
	Woojung Huh <woojung.huh@microchip.com>
Subject: Re: [PATCH v4 0/7] Provide and use generic_handle_irq_safe() where
 appropriate.
Message-ID: <YhOHsD4jB9pHpfdl@google.com>
References: <20220211181500.1856198-1-bigeasy@linutronix.de>
 <Ygu6UewoPbYC9yPa@google.com>
 <Ygu9xtrMxxq36FRH@linutronix.de>
 <YgvD1HpN2oyalDmj@google.com>
 <YgvH4ROUQVgusBdA@linutronix.de>
 <YgvJ1fCUYmaV0Mbx@google.com>
 <87a6ekleye.ffs@tglx>
 <875yp8laj5.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <875yp8laj5.ffs@tglx>

On Mon, 21 Feb 2022, Thomas Gleixner wrote:

> Lee & al!
> 
> On Mon, Feb 21 2022 at 10:57, Thomas Gleixner wrote:
> > On Tue, Feb 15 2022 at 15:42, Lee Jones wrote:
> >> What is your preference Thomas?
> >
> > I suggest doing it the following way:
> >
> >  1) I apply 1/7 on top of -rc5 and tag it
> 
> That's what I did now. The tag to pull from is:
> 
>    git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq-api-2022-02-21
> 
> >  2) Driver maintainers who want to merge via their trees pull that tag
> >     apply the relevant driver changes
> >
> >  3) I collect the leftovers and merge them via irq/core
> 
> So everyone who wants to merge the relevant driver changes, please pull
> and let me know which driver patch(es) you merged. I'll pick up the
> leftovers after -rc6.

Ideal.  Thanks Thomas.

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
