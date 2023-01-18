Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 256557B
	for <linux-staging@lists.linux.dev>; Wed, 18 Jan 2023 08:38:23 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id j34-20020a05600c1c2200b003da1b054057so845614wms.5
        for <linux-staging@lists.linux.dev>; Wed, 18 Jan 2023 00:38:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=22BxzJ1I2g5CT4PBXC4jtXMSZii+bF3n9yE6J2j4Nb0=;
        b=fzgF8kdyThujN0e3XDBEFEVimxZI9UOjfDV0//Qk1I3gS6KDSAMYQX6VSO6y36WIK0
         42kcpq0vvvcTXiml3K/76AbVpoNxTSyXIvUVZiTysWF51Ft8Mmfo9OsJwxCPvKfWENuV
         z6DrWHId/BUBzgYSH5FHYQs/XEP5U5Thh+I7o+1Fdk1ACrWszVecl/WLe6Z1jOAuYFvh
         oRrALOxAk7XtbHwfEQhZUrr/eZjhoBVU6hHgy0g/ziKm0lNdNfx8liP3Hcr6VN380Dyh
         wyfKNCxK0lM7JuVzer5Fpotyoc6OqqnHT9KcJjcY6Hs/IhL8RS/bkw5R/K6aP6YykmRe
         Guqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=22BxzJ1I2g5CT4PBXC4jtXMSZii+bF3n9yE6J2j4Nb0=;
        b=sTMuF5Rop3D5lTxwZwSz1YKAfJWD2D8ZWubAVs2yOIGLXs4wHtSysH5zESorreY14v
         H1lVeY+vjvb0nD0yqpROpSQJWeEC+Uz7SNfIwznKEviU8vIYzyJG6AwD9n/q6KUIk+zY
         XnsgD48fJsYcR418ODhpi9y3NoIOEC1vpynhtckqm843NY9Ej593R9fBtDyu8sxPx2ha
         GVryD8cfbhaWE6sPqG/9vY2Me+5z7Wde519ik9a9isfFc61J4hWbm5wrqZ51fOlrP+J8
         L2kU0YB6KCRhgtTcuovSt5RwyO4VKh0EHdGFy9OXs8FfMksfD0matz6NWstHewqlVL9O
         S8kA==
X-Gm-Message-State: AFqh2kprYkFc9Xezq7EubKQK2VcUXwNNpZ5Q0lo94IM91cLgn9PCzG3+
	JXUD314jX+E6dvYs2q1sw63VSPwXUFeXnA==
X-Google-Smtp-Source: AMrXdXu8sggmhiVQbHcxiXko3AczajbXLKn7sftHuTG2wPYKrznfm6qkMVy2KgS5TC7GgPHQXwWbgw==
X-Received: by 2002:a05:600c:510d:b0:3da:f6ae:faa9 with SMTP id o13-20020a05600c510d00b003daf6aefaa9mr11167805wms.29.1674031101319;
        Wed, 18 Jan 2023 00:38:21 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id h6-20020a05600c314600b003d99469ece1sm1297950wmo.24.2023.01.18.00.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 00:38:20 -0800 (PST)
Date: Wed, 18 Jan 2023 11:38:17 +0300
From: Dan Carpenter <error27@gmail.com>
To: Brent Pappas <bpappas@pappasbrent.com>
Cc: rmfrfs@gmail.com, johan@kernel.org, elder@kernel.org,
	gregkh@linuxfoundation.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: greybus: gpio: Replace macro
 irq_data_to_gpio_chip with function
Message-ID: <Y8ev+UNO0bQDoZTs@kadam>
References: <20230117152857.22141-1-bpappas@pappasbrent.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230117152857.22141-1-bpappas@pappasbrent.com>

On Tue, Jan 17, 2023 at 10:28:57AM -0500, Brent Pappas wrote:
> Replace the macro irq_data_to_gpio_chip with a static inline function to comply
> with Linux coding style standards.
> 
> Signed-off-by: Brent Pappas <bpappas@pappasbrent.com>

Thanks!

Reviewed-by: Dan Carpenter <error27@gmail.com>

regards,
dan carpenter

