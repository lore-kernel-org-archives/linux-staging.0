Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A857C;
	Mon,  5 Dec 2022 20:52:21 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id bj12so1354247ejb.13;
        Mon, 05 Dec 2022 12:52:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EUw6Hd+Tb+y6+h8IPlKOEXxbYBmUXjkCM3BqWwxBlG8=;
        b=Tu0y2YsPn1xteSCPzD/5LdsrIuEIAlXs+99JqYe67QKzQW9c1ZbI6s6ujYamITNDtN
         fNKvydO8AlCHSYhDHPCsITas0Rz0ZV6NDz3uFJW3jZgHzsm9vSzBwaE/7RWcRLaGmnSJ
         YBwoHkRvfYRVdNYhwRYGPgAl28cYKv77KViE+Zi9YPB/L4PrEbHivc00W0RlXJPxPDN5
         12/9Gxb77g23va8VGt+558SCRm5WjlOSlseXI7EV/e61rHArn9Ww6wDZxqbKHo1dKmCd
         c0lSgQBBaK982lqTBd32DdwR62vZgMenBDxvWwtM2QfZK/1nJDIxOJhazKvWRJK72G3O
         aopQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EUw6Hd+Tb+y6+h8IPlKOEXxbYBmUXjkCM3BqWwxBlG8=;
        b=OIPS6+U6bNXFPN2I/7IPs6WPGsxT+nXQOedMhsY6HM1bHAJaf8pGZz+V3MSaIj5se4
         aM6fcopU8dNXHQpDsS0j4IGllswebmKrBEEfvNk5S8RgwqkIN0IY8W9RZx6FsyYRqXXs
         jXU3IM3QWCGxSOYdf9fg/sVEg5uNNgo7E3GvDUbUwz3O4rzsj0oO3Ptq1qw16WnxprqR
         R1b4O+ga0DYkUusnaGyzGxRI7qPcNhbMZByX9B3J6BmpCAClueHhOlxwMEa/1O/CFHLU
         nrrwSUqVCYrcUP1jfsnZwYx1aWZcVQKo/7h7SG2hdZMY52SzGWp8dtLRc4ND7dSkN0We
         eitQ==
X-Gm-Message-State: ANoB5plUsCJ1HM5PA1UoBFapyTFT9OegExVXQc1O8ZHQRDM+uU8XRAfI
	b5YKbCJ4/Dow0BRp3nFa/8g=
X-Google-Smtp-Source: AA0mqf5GnVmcrBfMG8tVYmiTkS2qjOw6eiBPylS67ujMkmT01we801GcaVxVM/HsmWm1ZFJQfC2r1g==
X-Received: by 2002:a17:906:6dd7:b0:7a1:1c24:e564 with SMTP id j23-20020a1709066dd700b007a11c24e564mr58800700ejt.629.1670273539855;
        Mon, 05 Dec 2022 12:52:19 -0800 (PST)
Received: from kista.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id s26-20020a170906285a00b007af0f0d2249sm6645367ejc.52.2022.12.05.12.52.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 12:52:19 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: paul.kocialkowski@bootlin.com, Yang Li <yang.lee@linux.alibaba.com>
Cc: mchehab@kernel.org, wens@csie.org, samuel@sholland.org, linux-media@vger.kernel.org, linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, Yang Li <yang.lee@linux.alibaba.com>, Abaci Robot <abaci@linux.alibaba.com>
Subject: Re: [PATCH -next] staging: media: Remove surplus dev_err() when using platform_get_irq()
Date: Mon, 05 Dec 2022 21:52:18 +0100
Message-ID: <4229852.ejJDZkT8p0@kista>
In-Reply-To: <20221129012923.111691-1-yang.lee@linux.alibaba.com>
References: <20221129012923.111691-1-yang.lee@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne torek, 29. november 2022 ob 02:29:23 CET je Yang Li napisal(a):
> There is no need to call the dev_err() function directly to print a
> custom message when handling an error from either the platform_get_irq()
> or platform_get_irq_byname() functions as both are going to display an
> appropriate error message in case of a failure.
> 
> ./drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c:390:2-9: line 390 is
> redundant because platform_get_irq() already prints an error
> 
> Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=3274
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


