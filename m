Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2240D7B
	for <linux-staging@lists.linux.dev>; Sun, 30 Oct 2022 02:43:53 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id k5so180736pjo.5
        for <linux-staging@lists.linux.dev>; Sat, 29 Oct 2022 19:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2ggnKUyDGzSh8VA712RZdHnC7EeozkTTB151R7EI0vc=;
        b=AxktH6M6HembcbtUcw2e7dm1jU4rZ4V5w1dInI2pOM7Z3MVhPI/5TE8H7ZYg7qrk4+
         eoshHs40IrICubHsVpLVkhysyXK01MdJkh7zvVUDBTG2vJqy2S2jPKsINmWZs4Dt2tAs
         WI1YKzKPhMGCfG/lx+hWcI+J+fW0xjcgTVXwfLRepKil45VlhXJ33wyYxYuWYqLZLHbj
         myPurIu/gBKT/wOSOx3FhkrRwP9cfpQx2jZZu2MeurxHd7wibY6j6v1kGFiq3tNIUjL9
         dg/piWbIbs/Vb+Kw4nFLNWwu1AIJqCKZ84Zn9RVncfaWaycGVIDlnpwexv0TmAlfabPy
         c9fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2ggnKUyDGzSh8VA712RZdHnC7EeozkTTB151R7EI0vc=;
        b=nKqsl1jXAQKoQ5wJVtsJNMebvI2/+Kqud3zAr115zL7G9aFY+M5oZetTREDk6KHpl8
         2QsPGaSVZ/Hl4TbdY+7Hq4DMKM4Lq/GwUlhywrG52tLLII96lFecSi69QTtcCH1HNJ5o
         HXwnzdxOrXVbKtl7gSxgwhfnsO01xJvbxgKTIsXiLG2bfXfPrc9y5dnFZ2FngU6pa+8u
         /feXU6SqgbeVh+XYiZf49TcIADD/GKxkWffaR3KlgpFXOMbxjO/x/tJRKF9l1YhkSYHn
         RZ0eJlIbyuU8K6DOmX3gIN+TE0Yemom0WiqSPk7BfVDRNHRGQ1sLE8uv6CD0Dy75Todm
         Z7Fw==
X-Gm-Message-State: ACrzQf3phqS6JxDiRjX4PnUJ66pyOXxHowYR9jDs/XeJk4xAxT8r1pQu
	X/8jz1E7kf2XZsFYJHtbe+U=
X-Google-Smtp-Source: AMsMyM4JhLEMjvo9skcbp6g+szVwSDHLrkiWnVSk3Y+eTN1lvn68Nr0kdADV4KGqo4Rh48PyOwgqAA==
X-Received: by 2002:a17:902:b601:b0:186:9f20:f6a4 with SMTP id b1-20020a170902b60100b001869f20f6a4mr7380307pls.38.1667097832539;
        Sat, 29 Oct 2022 19:43:52 -0700 (PDT)
Received: from ?IPV6:2001:8003:d90f:f801:7164:b4e6:b90b:c4d5? ([2001:8003:d90f:f801:7164:b4e6:b90b:c4d5])
        by smtp.gmail.com with ESMTPSA id a3-20020a170902ecc300b00186e34524e3sm1924242plh.136.2022.10.29.19.43.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Oct 2022 19:43:51 -0700 (PDT)
Message-ID: <b874e6ff-6a19-410f-1fe8-2334a58f503a@gmail.com>
Date: Sun, 30 Oct 2022 13:43:46 +1100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH] staging: vchiq: add 'static' to function definition
Content-Language: en-GB-large
To: Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, kernel-janitors@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20221022043548.1671644-1-scottjcrouch@gmail.com>
 <Y1Okpjbi2kKU2GFz@kroah.com>
 <52599d6e-dc16-4186-9fb9-d17ce428fe9c@app.fastmail.com>
From: "Scott J. Crouch" <scottjcrouch@gmail.com>
In-Reply-To: <52599d6e-dc16-4186-9fb9-d17ce428fe9c@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/10/22 01:08, Arnd Bergmann wrote:
> On Sat, Oct 22, 2022, at 10:07, Greg Kroah-Hartman wrote:
>> On Sat, Oct 22, 2022 at 03:35:48PM +1100, Scott J. Crouch wrote:
> 
>> Nice try, but this breaks the build in a very horrible and strange way
>> that no one has been able to figure out yet:
> 
> I got curious and figured out what happens:
> 
> Without CONFIG_OF, of_match_node() always returns NULL, so
> vchiq_probe() returns -EINVAL unconditionally before calling
> vchiq_platform_init(). 
> 
> If vchiq_platform_init() is marked 'static', gcc's dead code
> elimination then eliminates it, which in turn means that
> 'g_fragments_base' is never initialized and gets replaced
> with a NULL pointer.

Good spotting.  Actually, I was clumsily learning how to run sparse on the
staging directory and wasn't sure what config to use that didn't involve
enabling everything manually.  But from what I can tell, it's OF_OVERLAY (or
something downstream of that) that gets rid of the warning.  BCM2835_VCHIQ
requires BCM_VIDEOCORE which already depends on OF.  I'm confused because I
don't actually know how to reproduce the gcc warning without manually enabling
the module such that OF is enabled but OF_OVERLAY isn't, since allmodconfig
enables both -- maybe there's a way to do that.

I'm also confused why devm_rpi_firmware_get() doesn't have the same problem as
of_match_node() just above it -- it returns NULL when RASPBERRYPI_FIRMWARE is
unset, but gcc still builds without the warning.

Scott.
