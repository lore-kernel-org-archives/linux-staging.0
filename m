Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE0768
	for <linux-staging@lists.linux.dev>; Wed, 17 Nov 2021 10:58:33 +0000 (UTC)
Received: by mail-ua1-f52.google.com with SMTP id w23so4937860uao.5
        for <linux-staging@lists.linux.dev>; Wed, 17 Nov 2021 02:58:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=GL2vVTwkDGaxnJKnzTpSFsHa3YcDS/lACsSvbC/mwqI=;
        b=7yAOmEZtKssLDy+Mi1v2A8a/1edO5rzt+1q7QWK/blFKaXK8ebDMcY7nc+YOTG8Kjd
         ZiCyRY3v5vfuTHYoj5MVj6n6cTVNYKXbwF3zZW3xHkWSl5sOjIwMkBKLHjm+rXuKokps
         buf1CnkCaSMhGEjqACdor1ActX5fzLq7ADgXGorAAqqAK9yUJ0rWjiF7t7Ze5CY9Zs1M
         BW/fHP84yKPphZ8yQPiQhDQPHK3ITuznYGa/j2WKeH/BZX95BJI/1/4IVHS6tvl5/dc/
         7f0LvQNZKCxT9FZSexm3uxQ8dn8ZkCks7bJKZRDetCQdaQR+Y2hEmQ5tc9QQyxD7+CgA
         AX3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GL2vVTwkDGaxnJKnzTpSFsHa3YcDS/lACsSvbC/mwqI=;
        b=4CAxiK5jKCdmY+hXIvs0Nk2ONQI2ssLHwOb1KBQkiCKeSqScYcEGHPHjxzpfYcEKP2
         G5YCILbwkXCLiRy+CgIA/hSieqZbNxw6tKNXidKiCEtPfkca9+MpvriV+j7d7Mt0IhMy
         FfvdCSucLVG7UJOOFlS1/WuCbDjLey9/hS1bCFZwCX/37lryDb5q+M5+lvk2IQEAIr0b
         tQG2zm6ajlG9Hy2GmjJwOimH8cFtK0ptjik9OjHIbMEKGATDOqCeEtztawG98xPXzAGC
         8f9Ta1OToln79wQ9tFUoHS14futTsW5lWuLiiXGuPXutYvOub6l7LpZDkMpDauneBc8Z
         sfDg==
X-Gm-Message-State: AOAM533TIjmz70YcZlm3r62kuKZPwD/E3svPqKEMHO8vBSL0DMoRZrWu
	yoPVZa80zEBCtHZ+NelxnLdjuw==
X-Google-Smtp-Source: ABdhPJx0rFYEn6Y1Kc0Vuh2EfsmgisCwK03nysfYsSX7F1YoD/nOk5rKQZ75zS/TNfM4/Zj8NiZlHw==
X-Received: by 2002:a05:6102:dc7:: with SMTP id e7mr66274552vst.21.1637146712303;
        Wed, 17 Nov 2021 02:58:32 -0800 (PST)
Received: from eze-laptop ([186.122.18.126])
        by smtp.gmail.com with ESMTPSA id r20sm11672009vkq.15.2021.11.17.02.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 02:58:31 -0800 (PST)
Date: Wed, 17 Nov 2021 07:58:23 -0300
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: James Cowgill <james.cowgill@blaize.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] media: hantro: Avoid global variable for jpeg
 quantization tables
Message-ID: <YZTgT3Gt8GVQqJtm@eze-laptop>
References: <20211111220108.1873947-1-james.cowgill@blaize.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211111220108.1873947-1-james.cowgill@blaize.com>

Hi James,

Thanks for the patch.

On Thu, Nov 11, 2021 at 10:01:08PM +0000, James Cowgill wrote:
> On a system with multiple encoders present, it's possible for two
> encoders to write to the global luma and chroma quantization tables at
> the same time if they both submit a JPEG frame to be encoded. Avoid
> this race by moving the tables into the `jpeg_ctx` structure which is
> stored on the stack.
> 
> Signed-off-by: James Cowgill <james.cowgill@blaize.com>

Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
