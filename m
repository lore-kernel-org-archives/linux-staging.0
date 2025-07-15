Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8548EC2
	for <linux-staging@lists.linux.dev>; Tue, 15 Jul 2025 22:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752619776; cv=none; b=BVGefvSTO5RErIp771aezwwX2yXWvMg/L+5J9nRV1I1yGgshp44XLu+/qrCimHIn76EuF9Jhf+1yrH9IBXpObRMAbqd5tlVxN41SKAdwb8IOynvYLFlAU442oCRUFmEhn5mh/1yvi5yHGHbHyIjWJYQF3GQVqLpFwmC24l4x5R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752619776; c=relaxed/simple;
	bh=aHKfckmBB9pNC1rUhOelWods5emIXfVqXzJlxU4Izmo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z1G3JHPemR3RmTBnL3jrHfmEUwzHVPzpSuywaQMKxRYcv9Edxa/QZyjlU8onDu47HG6vA3hh7OPBG0zK4yNVOtyphORRtI2Wmtvlj+aDprMdkDNETqwT1nKsMrYKBfm5Vv/6W6aaB0atdCdXsI+nnKW6TIkBoyfip/JHKEzqg64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kW5Y4m2w; arc=none smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kW5Y4m2w"
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-41bebd9dd8dso401118b6e.2
        for <linux-staging@lists.linux.dev>; Tue, 15 Jul 2025 15:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752619773; x=1753224573; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Meih1vrfHM7dcTFISQeDmli8ZACX1BaaO2z4qU+kXBk=;
        b=kW5Y4m2wMlilODYrzLt1uzAuiHY6Ar7vyVeQmU8qphXZh437tfNNcFfJzDC2a8CAp9
         BXgsuOoyBCrDzooCBMMIctVnuYtS/upnSndSR9+VJhSVvo4fgtVMon6HvxXmD6SHzEy8
         xYpVqF492POnVA7rtV3QkH5k3J1Tyvkq9fafW5lBA+nBH/DIK99fOUh937faVix1EJgd
         aX/x6PCDLsY1l85uPK8wrwi6vnnGWB5JchHxpifZhhJY4/kGEozDwcgtD3dYvZ+dmQCJ
         LGZZaLccrXp+EpnTkAaPY77cWN++EDLSmFsc8Hu/N9hwy5VsxYYCs9rHiTrQhrQOCCt7
         HlsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752619773; x=1753224573;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Meih1vrfHM7dcTFISQeDmli8ZACX1BaaO2z4qU+kXBk=;
        b=Ghor8n5tykCO2c4egIrjhktDauT7RZjlsK1w4JiQNLTuOa2lZnzmsDgo99AMJuRfOq
         A5bsoFttUnfIA3KOUalzpHkCqpxz0yZWPdMENw78Q3+5Al61mKpCt6yYR9fCX5qtuksL
         CoW6PKyIPWofqoQdOv8r8Li4q+ujiBM/rthG3sxD13eOJAeQeTsABFtILbdISqXG5VdS
         Hs3ITagWKGxEmj9XTNuSLhQ3w2bZGTaWeMydG+VSeW3itIqOso6DZTnDBzj3H0zBsp1T
         wvPv1gsGeajqwlniUdgvXC0e7Fcq9hp6rgRizTzofCAuyTsdxZzZTItOsRajJ6LuyIq1
         v0Lg==
X-Forwarded-Encrypted: i=1; AJvYcCUGIasw+eLyPz4cRpQh3dA23TxfJLg/J3CI6B75OokR4dQnJ+BxgY0d2lVBQh+dTWFJgQvxCygtrx8BtNA7@lists.linux.dev
X-Gm-Message-State: AOJu0Ywgss1TNa4USjyNZcGjp2hvzCWFp3sdgbjHqK53TaVR64iqzpN8
	t71tZ8dOOnbsh+GYHu+8Uneo+5b0LXW1dmNvdVtH0rSiOyCHaUrKSIip75ZWX+NuO0M=
X-Gm-Gg: ASbGncs+dWazKVoBXF/QHOoUvFoY63T8knDMa3//9jq5Nf3XkhkmLw1PsXD2EGkul7Q
	oo+cMJak0z3LhCHn+nnEgKDc3FmsO6OUR9yBdI9U+/7PQia7UnL6BMWqhhwpdjUaML12UgBVazj
	QsONr9WPLMe9Ip+lPxEYfp6ile6FCvmhrUxq9gE6fXO6LhmBDxELLv5U5/CK2r7TwSvm10yAv2H
	6Fvcu0ADaypMAk58vkEFZ0uWzhmC2OYShW1M2YLpEnj6bH1l9MvPXH9ifFIKqFjnpsLp/hxJ/oQ
	uOq8NSlrfFrOteSg8HQi1Ix9zWFI6VN2D2vvMwdXGvtD1YqyJKwEyBnVvzSpFSUkEzz27wgCjvl
	NfFwEJK7XEc9glJXHw0M543LH/VBg
X-Google-Smtp-Source: AGHT+IHb2bZemDxPF4WZAJSK+ejBi+wHZl583w7pdU2xkGVNYggYyrUKBYM/ObYKZs0J5TYJtHz5gA==
X-Received: by 2002:a05:6808:1a28:b0:406:76e4:c4f with SMTP id 5614622812f47-41d049934e6mr486948b6e.18.1752619772869;
        Tue, 15 Jul 2025 15:49:32 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:a172:6205:b5e:43cb])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-41ce258d4afsm200723b6e.24.2025.07.15.15.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 15:49:32 -0700 (PDT)
Date: Wed, 16 Jul 2025 01:49:30 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ignacio =?iso-8859-1?Q?Pe=F1a?= <ignacio.pena87@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, devel@driverdev.osuosl.org
Subject: Re: [PATCH] staging: sm750fb: Fix checkpatch warnings in sm750.c
Message-ID: <3422f016-92e9-4d2f-a0ec-6cd3adc27469@suswa.mountain>
References: <20250715204804.44380-1-ignacio.pena87@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250715204804.44380-1-ignacio.pena87@gmail.com>

On Tue, Jul 15, 2025 at 04:48:04PM -0400, Ignacio Peña wrote:
> Fix multiple checkpatch warnings:
> - Change 'static const char *' to 'static const char *const'
> - Fix alignment issues with function arguments
> - Change CamelCase variable 'Bpp' to 'bpp' following kernel style
> 

You'll need to break these into multiple patches.  Also it's going
to break the build so please be more careful.

regards,
dan carpenter

