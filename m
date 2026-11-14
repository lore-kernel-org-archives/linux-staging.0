Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794627413;
	b=ct76ommmfIUtit00LO2D8q3sbrlvoIuZ5sNE9SOeTNeP4Y+AGCS2ZDgmSK7QL5LsmofF
	 SwehpaIwbOjgQjkoAfkL3kvVkwDsJRFBDgbduPQ7EMwGpQTbZpAa0pUsfXpBbcRsa4Mq2
	 vskTdxW0y+3jlB/BH7xm5Okd8v+Wuu5TJ/q4NNjfINXZrtt9yv0+j/IK7aDWBJDE4PKpy
	 Ijv9hUPyLQ1ayuSca0ydOGC99nrJChaandLRl1meEV85tK26uzPPJFYcpYkLP1PF854n+
	 NdCPGpBD4WoXgetrZ0MQeZnz2uRe6/xrHzarEqa/TdJCWizqqroZboNowzX0ARnD87w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794627413;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=3a+9UrHFnp0GCYUcXwgUcuHkUgb2iyxD30t2rDDa9ak=;
	b=saEtOHrnlDwZIOJ7KGQvBm7qN050+pScG+AtUB7IwHGeweVkiiaqahEdZZEe30Ekq3Qc
	 0cwACFn9PjUtT09N/Q639y2b2wfrtfwN5pXsF2sQl5wKMMDLuDYA/wFJGQycwwvKGsWn6
	 rimQJMKKJKc5sGZnDTNZ+iEGc8d5X7i9PcqPFJv5OJhvz6E8ckFt0aBBBlFpZcs+fzrPe
	 rDkXQUAXrQBMd4is8hlJz0fAH+PnCpiSzhVHdjIlFT/kfrJFwDotNiyM+embDVj8DR24z
	 ++wfBLW13VL66zqsZujREjhUVlC6jmlptjNLpj/W9KCKD/s8QFc0jkI4QsXW9Uzedhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=F8ckFeaN;
	arc=none smtp.remote-ip=209.85.210.225
Received: from mail-pf1-f225.google.com (mail-pf1-f225.google.com [209.85.210.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B0F606A323
	for <linux-staging@lists.linux.dev>; Sat, 14 Nov 2026 03:36:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63B0F606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=F8ckFeaN
Received: by mail-pf1-f225.google.com with SMTP id d2e1a72fcca58-8a05b210703so758188b3a.0
        for <linux-staging@lists.linux.dev>; Fri, 13 Nov 2026 19:36:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794627412; x=1795232212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3a+9UrHFnp0GCYUcXwgUcuHkUgb2iyxD30t2rDDa9ak=;
        b=yBTNt7qHYzSUkvJuhqsAIuNem3AxyI1162a1ktTXSDDIJn/Bw331IBE8QuXyNC9wqG
         dEIDi08e1/bPrVUCjqRj0TOxVD99oGeH3ohvbgG0Z80AjjbNLZl4WcAtQ3RbRGSO5EGT
         XHjXn7tZGtABOSVmLuHZeD1XmwmszOIxql/3B9kVTApU/1gIbR/PvI+UgMkERm+/aH1O
         wdmsxne4aShrNP0bkHML2GumdRrbcAeTKDaN32PDLGYeiUxUPOQayFBSeEJ+OL/9vTx8
         9RMDFCmrspFihkqZD52GbQmf7ZqZS7uMLNX1Xrby5OHOFBG0p03kE5daeq5+1ntiAMMD
         JDtw==
X-Forwarded-Encrypted: i=1; AL+hErFPMzaJp0o3FYlIIqYN0e04rMRXMQyXZO5ppjI+S8/OH1OWVuE34+b0p8T0J1lhMHuFM8VUaByi4uD+MIi+@lists.linux.dev
X-Gm-Message-State: APuU4Z9iOrXpGqhkxcpwF0upD8Bkj69Eyc9iAZ28fVy0Vy8hAnRQ3ZWP
	6dIf9yblPPSmJKzzKuwIvf049hjx47gi7oWeoETWq20o8Ua5AC/Ff14eRyD/5JkECf4D3c6GM1v
	8xSTE1jDKzi4Tmtjj2QVg96BU0p/l/uIntoseSNdTU1M0u5HIT5vTFB2q24ElHfGKszW2VEY7Tp
	w9oYCbGOUg8SNN5tAfkZ/odA1VZO0LT2AHDqijGMZYi8NYJTuETrqq6anK7bq+rTBgiKY+MCyxb
	+eUVAVWzDFTb+rSlOViR5puSA==
X-Gm-Gg: AYBFou2CCi6/WlxNF+EG/HYsStYJ6G3VkE+fVzMvnZEcNRtvsqJoBlyUPpoNCjOB2wt
	OmNh967VROyqT6Nu82LT8h7hiGeDZEil/esmQ8K4nbyPHBKgLDq+oAtT3BBGAlCuMXXGEyrcwGz
	o9+LvBjN3Id/PxuDXcqcEdpY5HPOIZOC+KRdESz673JfUpsfLJ8UtsQIGWtXxrq27dmIYcgq0R1
	qZ5+SorTF1E+unG3MZQLuQbGg/zufFn4tYFxy52QYVU98ZYSAzzb2krNQOE9eiCSnfVaZBijBkL
	FXbfOl7hnFa9reA6Y94WXkErmIHztz62UkSM0eiKnNT+OPqtdZw8RnfB9AddOxP1+wUMA1qgiwT
	nERjEfa76vbf2MwWTtrKVfzZHhFIHGZo7zXukvW+Qn2DQ2AB45gkThzSGu/SS6uHiZGlU73WWSe
	rbqOoRpTYWPvNEwo9poF0PPSImqTURy7N6pI4r7AAkhz0=
X-Received: by 2002:a17:90b:17d1:b0:3ac:9a5e:9ce9 with SMTP id 98e67ed59e1d1-3b1b0a3b41cmr4606838a91.29.1794627412235;
        Fri, 13 Nov 2026 19:36:52 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1b25dd0d5sm2749256a91.0.2026.11.13.19.36.51
        for <linux-staging@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:36:52 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36de26cb4b3so2011026eec.1
        for <linux-staging@lists.linux.dev>; Fri, 13 Nov 2026 19:36:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794627410; x=1795232210; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3a+9UrHFnp0GCYUcXwgUcuHkUgb2iyxD30t2rDDa9ak=;
        b=F8ckFeaNZhPzGGcCIPjtcGXTaRZrjY2+FjDM7mQeU6v/fnAjg5dtTtbOwyOEzJjoeu
         I56XHXeVHe2/zskLYT3Ep3Pe+T8USdT+SRsvd1GzakkPT4FGInN+t5YH8awZHdYhnDK8
         8B0wN8GVqbVkuTub8g9/NaSsHAToFIzCiWhOs=
X-Forwarded-Encrypted: i=1; AL+hErE3i5Qp+LFqUrY7gS8X8OPQIjexq5uljf3LTLAJOstSV7Xzqj842w0Whob+4P8OjIj7X6jjecCe609mHeVY@lists.linux.dev
X-Received: by 2002:a05:7301:1506:b0:36d:394d:e690 with SMTP id 5a478bee46e88-37969089a16mr3722060eec.40.1794627410022;
        Fri, 13 Nov 2026 19:36:50 -0800 (PST)
X-Received: by 2002:a05:7301:1506:b0:36d:394d:e690 with SMTP id 5a478bee46e88-37969089a16mr3722036eec.40.1794627409340;
        Fri, 13 Nov 2026 19:36:49 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3797f98b9b2sm11532824eec.6.2026.11.13.19.36.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 19:36:48 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Martin Wetterwald <martin@wetterwald.eu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Gaston Gonzalez <gascoar@gmail.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Phil Elwell <phil@raspberrypi.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <uajain@igalia.com>,
	Kees Cook <kees@kernel.org>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [PATCH v2] platform/raspberrypi: vchiq: register bus at subsys_initcall
Date: Fri, 13 Nov 2026 19:36:47 -0800
Message-ID: <20261114033647.876683-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261022082927.59030-1-martin@wetterwald.eu>
References: <CAFERDQ0FpdVvA5VJxOyRAE_pgxnPVmFx1tkZio5R272j6Bs4tg@mail.gmail.com> <20261022082927.59030-1-martin@wetterwald.eu>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

From: Florian Fainelli <f.fainelli@gmail.com>

On Thu, 22 Oct 2026 10:29:24 +0200, Martin Wetterwald <martin@wetterwald.eu> wrote:
> Since 6.19-rc1, with CONFIG_BCM2835_VCHIQ=y and CONFIG_SND_BCM2835=y
> (both builtin), the sound cards bcm2835_headphones and bcm2835_hdmi are
> not detected anymore (vc4-hdmi is not affected).
> 
> dmesg shows:
> 
>   Driver 'bcm2835-audio' was unable to register with bus_type
>   'vchiq-bus' because the bus was not initialized.
> 
> Since the VCHIQ interface was moved out of staging, its bus is no longer
> guaranteed to be registered before its client drivers. bcm2835-audio,
> still in drivers/staging, registers at device_initcall level and now
> runs first.
> 
> Register the bus and the platform driver at subsys_initcall so the bus
> exists before any client driver, independently of link order. The
> platform driver probe already returns -EPROBE_DEFER while the firmware
> is not ready, so probing earlier is safe. When built as modules, this is
> equivalent to module_init() and nothing changes.
> 
> Tested on Raspberry Pi 1B rev2, 1B+, 2B, 3B and 4B with VCHIQ and
> bcm2835-audio both builtin and both as modules.
> 
> Cc: stable@vger.kernel.org
> Fixes: aa125180c673 ("platform/raspberrypi: Destage VCHIQ interface")
> Reported-by: Martin Wetterwald <martin@wetterwald.eu>
> Closes: https://lore.kernel.org/r/CAFERDQ0FpdVvA5VJxOyRAE_pgxnPVmFx1tkZio5R272j6Bs4tg@mail.gmail.com/
> Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>
> Tested-by: Gaston Gonzalez <gascoar@gmail.com> # Raspberry Pi Zero
> Signed-off-by: Martin Wetterwald <martin@wetterwald.eu>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/drivers/fixes, thanks!
--
Florian
