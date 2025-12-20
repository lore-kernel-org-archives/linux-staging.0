Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120C62FA0DB
	for <linux-staging@lists.linux.dev>; Sat, 20 Dec 2025 10:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766225368; cv=none; b=ak08Eu4Q1q4FnU5I5VL34IfgXOyrxxSXbJXCfBuddzH9fXlG7GHjyKGGoegS5dYjVcHz0sbmWUusdZWChzz91NYar5HUUOh9hNrYfv3ILCQR2Hlbdo2EgfdXH2te07OmfOXtH80w+Gjz2onr5XIkG0JrRKMyNiyyIxAdeNSm0Lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766225368; c=relaxed/simple;
	bh=T286e3Yg0Q0S75/6v0G/eny0pp2qOlq56+De2M6BuMo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OGy4fUldCoRA1g0agIRSn9QakCADVEYx9bSXMhmO6DwDH4CgRKMAVDdUVVrqMA44wYlFvSPMfHfornhAGa2ihyLaQgXeBtiLMFv0LvCW+hfDiSEgoVIHHPe5sPXavX/upEai6tlSqfQH54erDGVt9ZX7gR6ImGeq+tJrQa1bw0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F1FQa5W7; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F1FQa5W7"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-42f9ece6387so915842f8f.0
        for <linux-staging@lists.linux.dev>; Sat, 20 Dec 2025 02:09:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766225365; x=1766830165; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YltJZVr5NuyQpfEZwyZbwRl9KappV6MIekKgUZHqamY=;
        b=F1FQa5W7Cqgknz7U5tArXPLwup9i0Rbwi6X7pyRgLyBJXtf9PX7RWzsn0Y2HNUtxSB
         WSyaPrJff7N4r7TQfWLAlTHHCggIad5mOkrv7p16HylVKY0lP+hedx4ZQL40e+AxaVo8
         TPlDKjawEA/35yuyFTURNIkpR5GHfAIP7vaNlWgi2tWkmEtg/U/GwNzYCPs2Po8CNlqU
         chfNVawd4RbC6w+etCOeytZt44PMSlkPDqX6H7VkLfruDRf9eDUtuFpnjc8vSLQC703m
         Rf07REH4hwV4yYAmPIThKRPDNqTernXVbzFrLmQEJkICSWnGM5QRlEthimWZz0+6CHKd
         qa7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766225365; x=1766830165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YltJZVr5NuyQpfEZwyZbwRl9KappV6MIekKgUZHqamY=;
        b=kbBauiUevM9Ge94HVTwcFpruxhi5NDUqqxjmqVL8mFreqFF+oyRUmxaMHH3KL+OQAw
         njDnxcmsWA1ZxTalex8RDjFgPsZEPZk8QiggwAUTxZHGZXUurn+KCMQyx3Bu3yURridA
         Qa56drDji0ppgkmlwMZzidbuhQYXmAQ+KEpBZmYyjie2sO7mQ7QydUWuGzQK7DWAWPWD
         1AY+J+yznYu5h62bJdy1yH4ghtO+L1bl1Ma6aLBV8of5AwQDIte8aY7ABshW7x2q4DkM
         43qTWeJWEpLMx5KpSGocp0wQbKz0tRZUaotvJhqymut9qjFE4hY/jytIwzk0AL0HfT+F
         X1Vw==
X-Forwarded-Encrypted: i=1; AJvYcCWfg5MSm49k68sO7Lvj3Y76PNoUjMr70BqUj3DMqDB1oK8Kh/I2tpKUiS8RDipZ03imGcjDTFL1rHy8u+GY@lists.linux.dev
X-Gm-Message-State: AOJu0Yz1KLvIiDrwlyZrqxBUJWkJLHCoaVyvrS4XGEI0O3+y+FrpgEKl
	YSjl4zTGDu3t+4CZVSHWWk6XGgE9jVszahooKjTWC2LMHTm9q1zXJBeJ
X-Gm-Gg: AY/fxX5XoKkYb/Kn+Mj4TR0QEppURk2gbahcPhnnswfzTaZ5vjrd+SR9LneyjIy31ew
	kebRZfVLqM0UXx1Oh9YeDlktywGNYJkZM56T6CvyrgVSPIQub4xafosanslOG46mu3LkCx/OX9u
	qgDizTEJOpETgX5RCB0Q5foijLSgs9hyEtoOdWt3/myr+KLPY7vQNH5uE/Hli2cMD5t8NyS3cJK
	CU9QBXiv/iK5xXPnct57jyf6eJqpTOhNBgMsxpqyttgJk0JKDN4Mn2Gb3UkZ+Fp4Lc+aAR07dtc
	t3T8TKfpoThk20jWGBDdNsg1QZbP3T3Q+3hdp9mP+JRHjmveFJ+6kBDwULPIoPuyw4hX2Z2exzC
	iACo80tgNcCmzUT1f/fD56RRAT45vOHNSBD+/RoaVhJTLZPcuvUA2OpvS+BVhuOuoAT2yqLI+Kb
	iRGCyPbr3Xb54rfRCL3BuaFsf6zO7XwXpxN6M8oDCJEoTk4wzaFSoE
X-Google-Smtp-Source: AGHT+IEVS0YXlTRBLtbgj2BbSWCnRw75i1fGTOjJqia9uMJ4AbbjmPLtb4whaBSPbMoQAZnfFVwMxg==
X-Received: by 2002:a05:6000:400f:b0:431:5ca:c1a9 with SMTP id ffacd0b85a97d-4324e4c9e82mr6668504f8f.23.1766225365164;
        Sat, 20 Dec 2025 02:09:25 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea22674sm10222429f8f.10.2025.12.20.02.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Dec 2025 02:09:24 -0800 (PST)
Date: Sat, 20 Dec 2025 10:09:23 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Preyas <preyas17@zohomail.in>
Cc: marvin24@gmx.de, gregkh@linuxfoundation.org, ac100@lists.launchpad.net,
 linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: nvec: replace short udelay with usleep_range
Message-ID: <20251220100923.2a3de6db@pumpkin>
In-Reply-To: <20251220092229.16606-1-preyas17@zohomail.in>
References: <20251220092229.16606-1-preyas17@zohomail.in>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 20 Dec 2025 09:22:29 +0000
Preyas <preyas17@zohomail.in> wrote:

> From: Preyas Sharma <preyas17@zohomail.in>
> 
> Signed-off-by: Preyas Sharma <preyas17@zohomail.in>
> ---
>  drivers/staging/nvec/nvec.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
> index 263774e6a78c..6ffe5e8656d1 100644
> --- a/drivers/staging/nvec/nvec.c
> +++ b/drivers/staging/nvec/nvec.c
> @@ -648,7 +648,7 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
>  		break;
>  	case 2:		/* first byte after command */
>  		if (status == (I2C_SL_IRQ | RNW | RCVD)) {
> -			udelay(33);
> +			usleep_range(33, 66);

Given its name the function looks like an ISR - where you can't sleep.
Spinning isn't a good idea either....

	David

>  			if (nvec->rx->data[0] != 0x01) {
>  				dev_err(nvec->dev,
>  					"Read without prior read command\n");

