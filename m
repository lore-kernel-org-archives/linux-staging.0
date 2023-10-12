Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D721428DB5
	for <linux-staging@lists.linux.dev>; Thu, 12 Oct 2023 16:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kkprpY8j"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4064e3c7c07so2394375e9.1
        for <linux-staging@lists.linux.dev>; Thu, 12 Oct 2023 09:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697127369; x=1697732169; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3Ozq89ZVImu+VFbUodXs67/WQLM2XUzrt4ew1bbqvvc=;
        b=kkprpY8jrSFuzSnhELx/zvTH6FigGuhjG6RHB6Y1snmc3vcMMqouBqxzNqVP9dbZgd
         Iwdc9vCgfNuK/2b8CWyH4Yw1VUerPJngVfXzWmZy24+21x35D9miep6DXH2mpXhOCWww
         IuA9zF9SUqY0XKW+FS1H8fOnb8G11e7xnMawk8mDrQUr2OjqlT7UAvgPfxcK3adYg+Y5
         pHwU6Islimz329GUs1naIhRldaW36bfqPJZN2VQsNPvpVVYInjL1gSmvcJmC0Wi/lm9O
         L047p0Z62cR3Qc1PfCGKGfbWTy3HJxdkyW38cClFoJ0ElizVTOcNNMbv/Qemf+aIR01B
         RLDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697127369; x=1697732169;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3Ozq89ZVImu+VFbUodXs67/WQLM2XUzrt4ew1bbqvvc=;
        b=YfS/xCWtpRum6y78udytdXyb+/jKpgGMIyVe9vpWYzM9b0JA5L6APD+5VUsBWz2HMu
         VrETrJTjMPJ2ggsaYHqK7fR344DNM5r60L7hew5OCWq//U45X29xlL9427uIIp1u3TG+
         9FiXMvkJ9acO2VfXAJJI6f8Fj5aPZPS2LNmEKd1kKteQqslwt04oMpsc4Os5tYnhOOeL
         HR0s5WlzNGSH2uiMYbdTS73KvbxXyL97bDV9VwXL3HDyMC4Jm8q9bupIx4e4q/KhYp/G
         wU97qOhUQ0H+CzolceWi8KE/7kRaAPxRe+cTQ3cQKDP/3Ygx4lWhEM9vglTF84fKSTEx
         wdTA==
X-Gm-Message-State: AOJu0Yzrv1soBmaTltldvOWWqrPV6YnG0ibD40dhYVi53kLBgMLsZokM
	dFLpmisZ9TeVFYBmXa+YFAI=
X-Google-Smtp-Source: AGHT+IFc0tMzaENSKcJzOmy69mZYDNpmzbDNLoSVYManGTw2vTqI4L7A6X6S4uZ6PY+sQnDzhERXIw==
X-Received: by 2002:a05:600c:5192:b0:405:1ba2:4fcf with SMTP id fa18-20020a05600c519200b004051ba24fcfmr21565540wmb.4.1697127368564;
        Thu, 12 Oct 2023 09:16:08 -0700 (PDT)
Received: from [192.168.0.104] (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id 19-20020a05600c235300b004065d67c3c9sm233127wmq.8.2023.10.12.09.16.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Oct 2023 09:16:07 -0700 (PDT)
Message-ID: <bd45c5d9-ed42-41e1-bb6e-6662ed0937f2@gmail.com>
Date: Thu, 12 Oct 2023 18:16:06 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [RFC] wireless: move obsolete drivers to staging
To: Arnd Bergmann <arnd@arndb.de>, Kalle Valo <kvalo@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Arnd Bergmann <arnd@kernel.org>, Nicolas Ferre
 <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Pavel Machek <pavel@ucw.cz>,
 "David S . Miller" <davem@davemloft.net>,
 Larry Finger <Larry.Finger@lwfinger.net>, linux-kernel@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-staging@lists.linux.dev
References: <20231010155444.858483-1-arnd@kernel.org>
 <2023101051-unmasked-cleaver-79b3@gregkh> <87y1g94szz.fsf@kernel.org>
 <2023101139-pyromania-game-2237@gregkh> <87r0m1fwg9.fsf@kernel.org>
 <20231011080955.1beeb010@kernel.org> <87sf6g2hc8.fsf@kernel.org>
 <63e57ef8-c9f2-489a-8df8-51dcffd437c6@app.fastmail.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <63e57ef8-c9f2-489a-8df8-51dcffd437c6@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/12/23 16:36, Arnd Bergmann wrote:
> I'll also send Greg a patch to remove rtl8192u now that we know that 
> this has been broken for 7 years.

Hi Arnd,

please allow me to do this.
I had a separate mail with Greg this morning...
https://lore.kernel.org/linux-staging/2023101244-unaudited-sadly-d9d6@gregkh/T/#t

Waiting for your confirmation who is sending the patch for removal.

Thanks

Bye Philipp
