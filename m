Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9938390217
	for <linux-staging@lists.linux.dev>; Wed,  4 Mar 2026 21:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772661514; cv=none; b=l2ZT6CghgTLMx5UBGXWjDRCz/+8ryw+jmO815gLCuKPCkdGJ0FdapaTHfBvTzc3JjcQsqBem4OVNieppBCmbgvwrDb27NHjn6Hw5XnuaadJNJml5xE60EC5KlEEbGeROUa3VfQnw8x+m9VdkJu5GJBuv5PeO3H1AcQCyRiNTDfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772661514; c=relaxed/simple;
	bh=MxjDq8gQjsyN+WxP0d70LaLi462jemmqdXxq11ouqCI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YNcsJrqZTUm6AeLYT7EWCuSNWHm4yWI++GCtiULeGysFuJo62cGulAmkkIhjbRS0fP3Y64KYL4EqTGxKdYhLMKequlQU3sVLADm23pW36/HlodbXOOZ4YWqwTaqyyx/xBv7+MGwGyrqBEZh5XxSJ/IvnNEgGf9MOVJqg73qLnl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dguBWZX9; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dguBWZX9"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-82418b0178cso4177192b3a.1
        for <linux-staging@lists.linux.dev>; Wed, 04 Mar 2026 13:58:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772661513; x=1773266313; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SDR4PsYkFmZIckUOryLH4IjXcqpjDOwt0KGqniQjbHs=;
        b=dguBWZX9BQalanCDzvY3EeYepTd/gaIp5FXvAUQKsJ5amRXjWEjHL7JedLILuLCK8f
         L+fxXApFAGKWqdWRb7qIwAJ0BqRiicuqR8mb2marcf3vqWKag3w0qdtLQ+TYLFUCVvxh
         fsGP0dTouXg2Jb0MIDLmJzB+AynB8D/hJDYYT3uDGXJ9S79TfbBrboDEW6u8XfkaTwXv
         o+/X6MaVy0M5zmRHvvsOVNloGLMhq0vACJWOfaQplb9RyJvwZaTI4x9DEf0xufQvkGpn
         iQXO/+GdyGswgrYM8+McQ/xEhjgmfuFSCDkO9nmuqdV7dBvc1PqbMQGhtN080w1kDg0W
         D8YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772661513; x=1773266313;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SDR4PsYkFmZIckUOryLH4IjXcqpjDOwt0KGqniQjbHs=;
        b=fhlW39JvbDriDYJ21ZzWGakbSmdTu0dPbCxGPRAu8iVi/PK1fyM6669ZxXsQvMMWT/
         74wvfT9Hv9jakLBzDMnO16SxjzOV96XAxnbDdCuH9Tqr8BCjso5iyGRmOMYRQ77ppoLG
         mJL3E63rIZrKRZgco9sL4CZk6YOnp2PvJOp22oZ70oEGeIs4yzzklvASG99cqDhvgp5q
         MDxni7SvY/WFHDElcErNzLtkOZ8KbxO7ep0/SKtYiOvcSxSC9Mf7x5YZY8P+DjiOKOtx
         SceGA/S3cGyUmgNSoE2q2WIYplh8xk472J78wgU7Hb05GvZ3FOHKPpJOK4Bf6/u9yXnY
         yPHw==
X-Forwarded-Encrypted: i=1; AJvYcCXpVh70a+drQM19q3CURKPrIxZb5+6IyNOJdF6NYSUEvhh/slihLYdNhlHB3HK6zKkfkMaZ1mg1BrJZqiS6@lists.linux.dev
X-Gm-Message-State: AOJu0Ywn3j060uUQZbbOGEgP3hyVkbbK1Pf9LI8jfxszOtLZtANyVoZ6
	fL+I/BlKAN6xli+LeFEZex0EbEKtveAsHSvoq/EZV5meaZY4n1TiICkN
X-Gm-Gg: ATEYQzwzVKOIUGKP+pwmZl0njfo8RxJzZRkQIGUJFAFpww+pIREy3W8ymQvWOu7B8wp
	yXQg6qvxfAtjlBXzyIjvM2hGlDUkWD/r+jxQszMFm0My0A7Z+NLeerQXouyZFk4JL/9rJ6vQk/s
	7hMk0CnmC/EnltiGLVx6sAuTgAcwOHStk2tFCIQ6vKctvhQDfIFx+Tjxxn/G4OSeDGcgkZ6SXsf
	rsfMIxdCxuo4Ai8uyh8hua0Xp5GOo9TZs4XXRJEJb1NPryba/a4vojt12x2/KtZqgda/NlHv0RE
	oExHOLC4I/ePf79za3pdwEK7PUs6bY7R7AO12ipj1Pl3Ab5G6oI9LRI4qLsISvy5giQZHR9TxBE
	FcLVE65G3v8BQZ3vpyv+8pBZORcVGAQO93pdFEq+U0vXbGGi7g/uQC2ttxMDBnweIKjiOFaZplf
	rH4y6K9fJre1LxK9VlXZiAMEJgZnIQObj4p5Hq
X-Received: by 2002:a05:6a00:4288:b0:827:3321:7a23 with SMTP id d2e1a72fcca58-82972b63764mr2746760b3a.24.1772661513098;
        Wed, 04 Mar 2026 13:58:33 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82984a01827sm110603b3a.43.2026.03.04.13.58.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 13:58:32 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 4 Mar 2026 13:58:31 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Alexey Brodkin <abrodkin@synopsys.com>,
	Vineet Gupta <vgupta@kernel.org>, Scott Wood <oss@buserror.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>,
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sebastian Reichel <sre@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	netdev@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-amlogic@lists.infradead.org, linux-leds@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-watchdog@vger.kernel.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH 09/14] hwmon: drop unneeded dependency on OF_GPIO
Message-ID: <a1ce9ab4-49cc-46f7-8524-1cbc0e6333fa@roeck-us.net>
References: <20260304-gpio-of-kconfig-v1-0-d597916e79e7@oss.qualcomm.com>
 <20260304-gpio-of-kconfig-v1-9-d597916e79e7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304-gpio-of-kconfig-v1-9-d597916e79e7@oss.qualcomm.com>

On Wed, Mar 04, 2026 at 10:02:30AM +0100, Bartosz Golaszewski wrote:
> OF_GPIO is selected automatically on all OF systems. Any symbols it
> controls also provide stubs so there's really no reason to select it
> explicitly.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Applied.

Thanks,
Guenter
