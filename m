Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D747C
	for <linux-staging@lists.linux.dev>; Mon, 23 Jan 2023 12:04:48 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id q5so5915513wrv.0
        for <linux-staging@lists.linux.dev>; Mon, 23 Jan 2023 04:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fISD/Oh7f7rfwyoXhffv2IBzPjVxst2oLjHNZ3zqbvY=;
        b=bsFNkkE+AmRGZwOFLU6vo4nHH5vaJSggAKfQcACTiS5z2nThSUcvIrBIT1uyFfegFC
         WPH0TXiUX8QgReBUgV9DiVo82Xz4GyOh9UxFUEIqqXOM1U+dw/yqsrLdsWUJ3D2tlT7P
         JgU5ITbcs7zgJntXJ1dXmlInsCvq7C1hOOzxmGrUspNtr5IM7enrSCIPpbALknQ9I67n
         e1IZ68nh/VCpH6N9f6CE9ZCh/VWEX/0W46FxEWy1/a3vGAFJ30sW3Um5AAHx8+FXNsGd
         03p1Yq2K9fBIJLeLPcs8Mq3Mn/SIPS14UQRQQnTJDEb4/GGEm730ShDYvHNMsEr/Kq5a
         4xIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fISD/Oh7f7rfwyoXhffv2IBzPjVxst2oLjHNZ3zqbvY=;
        b=1UoX6TPcWGpWsOnWBdD1Dkijsp7YMJtibwTJOkqtMZBTil8TSP0uTeAzPEyox9/n75
         xrPAZfYUvMw1d35ku2u0VeKuhOy8J0oQAHFVs2Ra3mT69BQU8v3FfFv4onM2UlqPeQOy
         dJgQAik55cJOfnmbQyKFzg3WM1KoPItr45zt0CdMGiZhUuchrqgjQ3lP5hUwH/JK0r4f
         a95cFXQitp8XuHY5dm9JoncF2AlA2HNiwP+Lxegrap/ETlhGfnuQKnxiu/QX52h5KM6y
         7ia6YhbW0A8iIETGxkJIrEw6fthVvM9qrthyiWFfxER3Q6JU5VN7bgk0QhOSp80JK8VI
         SkBw==
X-Gm-Message-State: AFqh2kqYzwBDM6IrQryZ9476zncod+kJg89HKsQcW3j3YX4FFt8qaQ5W
	/DD1adHFPoHE1NDYUkPxkUc=
X-Google-Smtp-Source: AMrXdXtz9NS77O/I/Wca40ouoJ07XrkjM28zIcnW0OPop/rjoLw++G0AKR7A6dFxTiVx9ZULIg7VbQ==
X-Received: by 2002:a5d:4528:0:b0:2bd:f155:a8b0 with SMTP id j8-20020a5d4528000000b002bdf155a8b0mr22056318wra.51.1674475486618;
        Mon, 23 Jan 2023 04:04:46 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id bu3-20020a056000078300b002be505ab59asm8607749wrb.97.2023.01.23.04.04.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 04:04:45 -0800 (PST)
Date: Mon, 23 Jan 2023 15:04:41 +0300
From: Dan Carpenter <error27@gmail.com>
To: Brent Pappas <bpappas@pappasbrent.com>
Cc: andy.shevchenko@gmail.com, andy@kernel.org, colin.i.king@gmail.com,
	gregkh@linuxfoundation.org, hdegoede@redhat.com,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Subject: Re: [PATCH v3] media: atomisp: pci: sh_css: Inline single invocation
 of macro STATS_ENABLED()
Message-ID: <Y8532S313qKhIme8@kadam>
References: <Y8lZreSphK6DIkJg@kadam>
 <20230120171408.16099-1-bpappas@pappasbrent.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230120171408.16099-1-bpappas@pappasbrent.com>

On Fri, Jan 20, 2023 at 12:14:08PM -0500, Brent Pappas wrote:
> Inline the single invocation of the macro STATS_ENABLED().
> The macro abstraction is not necessary because the logic behind it is only
> used once.
> 
> Signed-off-by: Brent Pappas <bpappas@pappasbrent.com>
> ---
> Changelog:
> V1 -> V2: Inline macro instead of replacing it with a function.
> 
> V2 -> V3: Remove unnecessary check that stage is non-null.
> 

Thanks!

Reviewed-by: Dan Carpenter <error27@gmail.com>

regards,
dan carpenter

