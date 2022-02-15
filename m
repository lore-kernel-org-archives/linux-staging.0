Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D491576
	for <linux-staging@lists.linux.dev>; Tue, 15 Feb 2022 14:36:05 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id q7so32359555wrc.13
        for <linux-staging@lists.linux.dev>; Tue, 15 Feb 2022 06:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=MUUf+pXkN05JwdwuQzd9Pvh+Bteaj3c62ygRM6bt9Qk=;
        b=mudgwYtlwGFKHg2+iOKPcYtEENCpxIIfMw819BpddxPUCVCqMHj2+IeOBJM0X4iUpB
         GxtARny1Df2jwq3YqCemRhpibF1+gTiMw17Vuz0eueDZwShUR7fDR/zggpssLn9xYNBq
         qmwZJpwpMUokt7zNMHN46J+C38KBJPlHJMDFItwUmRn5U5LqxKHWe2Npafb0ihV4xtkj
         L+3NqEKaGGzN7pgAtibj2nHTis9XKdKJf6zUacBd0Zu+nAIceQOhrYA9xH0g3wno+CJ9
         iJvrc6sjhbNWiNFpFCIA2K3W2z8zBDgBSMIyKlwYzwwPQWg0KkqaO/xNG5dYbZsPVPPK
         A1pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=MUUf+pXkN05JwdwuQzd9Pvh+Bteaj3c62ygRM6bt9Qk=;
        b=bH5H8K5b7a4Jsk8vNCGx3/MHju1QPqmVsEv9eRoAMT2mL4Lf41SDwXKnfghtBcmZS5
         ujM+6e4qauqMBk1BBUmy2CbmNx8vtfNe6lW3zCMErAvS46M2Nn/iyK9mMw4oe3oKyhPW
         FyOcMHAjdv7Y6qTm6ZapZhpX6xYSEAD1smjq7QlRVRxjlOcqXxBOQoFtR8zVt61BhFTd
         Vn8x79KNB2B1Jqgo/Px5h/GaPCB67TLt77gYgXp5VGZF5Os6gtCijfy7yr1i9lLaRSEm
         JisInwhoE4sZEHseLHRVxS+oWNM4vkEatPPysc+wJMGFCvHuFXJCoYWniBvpqsQSDbRo
         OayA==
X-Gm-Message-State: AOAM533ocBpR/C5Kaym42ldh6h6ih5zCuENdT33tNP9pTTES4tXoprQ6
	Xn1IIpxtHRIg63hL2D+iY9EcdQ==
X-Google-Smtp-Source: ABdhPJxdzZWSPAfu5kiJHsgXoaKlEMHyoO7bf7BXdQ3G1AR5Pr3gbsP/kmzkmb0nxmt6dWCFQ9iT3w==
X-Received: by 2002:a5d:5381:: with SMTP id d1mr3487021wrv.559.1644935763754;
        Tue, 15 Feb 2022 06:36:03 -0800 (PST)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id n7sm15182386wmd.30.2022.02.15.06.36.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Feb 2022 06:36:03 -0800 (PST)
Date: Tue, 15 Feb 2022 14:36:01 +0000
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
Message-ID: <Ygu6UewoPbYC9yPa@google.com>
References: <20220211181500.1856198-1-bigeasy@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220211181500.1856198-1-bigeasy@linutronix.de>

On Fri, 11 Feb 2022, Sebastian Andrzej Siewior wrote:

> handler/ interrupt controller entry). It is low level code and the
> function expects that interrupts are disabled at entry point.
> 
> This isn't the case for invocations from tasklets, workqueues or the
> primary interrupt handler on PREEMPT_RT. Once this gets noticed a
> "local_irq_disable|safe()" is added. To avoid further confusion this
> series adds generic_handle_irq_safe() which can be used from any context
> and adds a few user.
> 
> v2…v4:
>   - Correct kernel doc for generic_handle_irq_safe() as per Wolfram Sang.
>   - Use "misc" instead of "mfd" for the hi6421-spmi-pmic driver.
> 
> v2…v1:
>  https://lore.kernel.org/all/20220131123404.175438-1-bigeasy@linutronix.de/
>  - Redo kernel-doc for generic_handle_irq_safe() in #1.
>  - Use generic_handle_irq_safe() instead of generic_handle_irq() in the
>    patch description where I accidently used the wrong one.
> v1:
>  https://lore.kernel.org/all/20220127113303.3012207-1-bigeasy@linutronix.de/

Please use the official cover-letter format (--cover-letter).

It would have been nice to at least find a diff stat here.

...

Do we really need to coordinate this series cross-subsystem?

Can we first apply the API, then have each of the subsystems adapted
separately?  Does the change-over all need to happen concurrently?

If the latter is the case, is this set bisectable?

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
