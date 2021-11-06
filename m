Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD36F68
	for <linux-staging@lists.linux.dev>; Sat,  6 Nov 2021 00:29:41 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id o4-20020a1c7504000000b0032cab7473caso7571608wmc.1
        for <linux-staging@lists.linux.dev>; Fri, 05 Nov 2021 17:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=uN3WMQFe0hvRsy6yv6SJmASXyPGscCDvF5bb2Y8pt3E=;
        b=uGVFcNxdDeR7JCuTx003ZrOnle8glpoKwnYasry8OyAScw9jebQq+qEkdS04/xQtTH
         CCkPbCqs93u8YL5qn6Aykb9tyOlNps6qS5n5Q7GmHj9zSh5k6syrzAlRF2ktgZ8LFQJr
         IpwM2du+gmNdUSnHjP6GDIhI0RoxlTo1r6aqO5qrGMGGzaD5tTrhg9y/cGBP54EvMkna
         QscN77hNS2v2U0BiUM0GvS3KVp7JSgMrzqbsnR8dKClFwkRvhuNpdT9jb76lDpFl1Mpw
         nbb7flFZMxo/07V9oI6faFZ2QdqQ9noOZUuyznMsjIkA8KxQ9Da5KBCAP1fqzq+fnxHG
         3qXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=uN3WMQFe0hvRsy6yv6SJmASXyPGscCDvF5bb2Y8pt3E=;
        b=HcBmbLLKbRKu7VgmJZY8cJNtkv1ZCIxjhZqkpvgC1K5SlksFcgVy1d9LfSZsZc5E6q
         B/DeddEFQm54q8HaxHTU3W8V5IB74BeOLn97AgcbDKX6rqImTc+QDKBE53VwapXU5Z7K
         ghkuavTCZLNSNUdzVbOSjZjhSMQ0unuoq0KqwgF0xPPM5GzacdGkWBUpnphL+Y9fwITy
         yYN8myTRGN5IyjO4mJVxrQuHIGrvWDTVwLrQZEltAzmtXBrRuGtqpbdDPPcJf451fAmU
         TXFUvbSAoOnwqGhsvlKsOBiPT1YiLlKbr9JHncQZhCeZajHIM54Psk6EEMZd1Mdhk2mU
         H0gg==
X-Gm-Message-State: AOAM530vn2OTgzlOLgVOsTlnSMcIXRY3CF4CKXTJECbPe5viaTJRCXtY
	UCHEvrCafUyBwge8T9KIf9MZpg==
X-Google-Smtp-Source: ABdhPJyZA5BVagbiLk0+JSsbwY9TfrIqA9Ff4s+vAfWLrwCD6eulQePHo25cSjJg8zWvPbSKTelENg==
X-Received: by 2002:a1c:1fcf:: with SMTP id f198mr34495133wmf.66.1636158580171;
        Fri, 05 Nov 2021 17:29:40 -0700 (PDT)
Received: from equinox (2.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0::2])
        by smtp.gmail.com with ESMTPSA id t8sm9013022wrv.30.2021.11.05.17.29.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Nov 2021 17:29:39 -0700 (PDT)
Date: Sat, 6 Nov 2021 00:29:37 +0000
From: Phillip Potter <phil@philpotter.co.uk>
To: Zameer Manji <zmanji@gmail.com>
Cc: Pavel Skripkin <paskripkin@gmail.com>, linux-staging@lists.linux.dev,
	"Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Martin Kaiser <martin@kaiser.cx>,
	Michael Straube <straube.linux@gmail.com>
Subject: Re: r8188eu driver in 5.15 only shows wifi networks on channel 11
Message-ID: <YYXMcaXl3TB2yu7g@equinox>
References: <CABtXzjTvsN8sCQq0tMG+VZ8Vu04a1zR20P-hbQf-Mnpmu2gTNg@mail.gmail.com>
 <2d7b9450-159b-f244-f4c3-e9db753f83eb@gmail.com>
 <CABtXzjSjkQTMmrA_PmbLaMUFR9X7xUMx+VG=v1jsdLQAdg+rJg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABtXzjSjkQTMmrA_PmbLaMUFR9X7xUMx+VG=v1jsdLQAdg+rJg@mail.gmail.com>

On Fri, Nov 05, 2021 at 05:03:46PM -0400, Zameer Manji wrote:
> Hello Pavel,
> 
> I will attempt to bisect the issue.
> 
> So far I can confirm it occurs in 5.15-rc1.
> 
> I also forgot to mention that this issue occurs on an arm64 platform
> if it matters. Would you be able to test this issue out in an arm64
> VM?
> 
> 

Hi Zameer,

Like Pavel, I was unable to replicate this issue, and I'm on x86-64
which may explain why I couldn't, if the bug is arm64 specific as you
suspect. I don't currently have access to ARM64 hardware, but if it
helps I can try and run a fully emulated ARM64 board in QEMU with USB
passthrough as some point over the weekend?

What was the last commit/release that definitely worked for you prior
to 5.15-rc1?

Regards,
Phil
