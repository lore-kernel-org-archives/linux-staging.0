Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF183C13E
	for <linux-staging@lists.linux.dev>; Fri, 29 Sep 2023 07:19:57 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-31427ddd3fbso12494742f8f.0
        for <linux-staging@lists.linux.dev>; Fri, 29 Sep 2023 00:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695971996; x=1696576796; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2G37RIl7kto4FtV/40rmYpXWGRKCCU93GLbr4NX82jY=;
        b=CVZ8cmLs7K8Xtble/4hRyZVjfOMQAugyezkI2XeIqzS+F2/wEf9M5ZxM+hv2DX1HAK
         T0RKDmTowbjEzaTHI8L863h6O0jd3QNv88iWAAMCX1Kid9kHI0Oe2iNOfsWo1DOJGWwj
         B6Z+4ihBlTNP7c/N7z0ZkYMiQe8rPetPqXVXbhKuKKDWtNLRGjJX4K0osvnctTr9yUV2
         6YAR/gNziirTyQN+xteMeiVUZM2+wPf69oZPL9u+amBg7qwhHYTpduGXftbxWytAFTZy
         U+i89EqEmEPQJI5dSbLR3g8ze2bnFUklPnafKiWtA9s9NCGXG3XasIXgCznqfe+oO2/L
         97Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695971996; x=1696576796;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2G37RIl7kto4FtV/40rmYpXWGRKCCU93GLbr4NX82jY=;
        b=Y74MMTHh968GcXm+Y8VElR44tYyT14ItdtBrcLQkboU6317DdQLjKvZWL3BZ6Kox4e
         QOYQFvUeCcG5sLiD28WGLrxtYyxd0V7cI2rgQnCw0Fl9CPIS8/Ysi19MNkq8g4/SysiH
         AdDScH9zUPugDBfCoQ89IL9pt0+YcM0xdFyUzTplYrFrFtwIp8RluSx7JDxqeo+k7Jf+
         PdV5WhfWi0CzQ12SLGBhgGUcq/lT2Aqi7C9epjGg7OKaVfqo8CqjBAmi9HBYLU/lrZY2
         vLaabXg2FjnSBAR8mr1O5I48mxRIJ2w6kmX8EodR2rga6fA+f038wi3oDj3yooxAzAgo
         txyw==
X-Gm-Message-State: AOJu0YxyEwxi4cEBQpw6Oib5iyQdL0TQG2ft24EKRcYRmM/icRubdDqH
	g6DvFg2W1wi6vaiDAdDLpVPrBA==
X-Google-Smtp-Source: AGHT+IFAnTJgZXllMlYUYlRUdQ4ql6RQj0k5B3k8rVQv/EDo9kRhHUg7wimNSMotX2rYeIBxcKp5VQ==
X-Received: by 2002:a5d:6910:0:b0:31f:e980:df87 with SMTP id t16-20020a5d6910000000b0031fe980df87mr2970055wru.38.1695971995977;
        Fri, 29 Sep 2023 00:19:55 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id z15-20020a5d4d0f000000b00324ae863ac1sm2148989wrt.35.2023.09.29.00.19.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 00:19:55 -0700 (PDT)
Date: Fri, 29 Sep 2023 10:19:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: Pavan Bobba <opensource206@gmail.com>,
	Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] staging: vt6655: Type encoding info dropped from
 array name "abyBBVGA"
Message-ID: <76e75a6a-b3f5-4f96-a9c6-b01f8f491140@kadam.mountain>
References: <ZRWWcGiySdLbCM3z@ubuntu.myguest.virtualbox.org>
 <29dc3df5-f313-f194-7f73-3207215e0864@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <29dc3df5-f313-f194-7f73-3207215e0864@gmail.com>

On Thu, Sep 28, 2023 at 08:34:40PM +0200, Philipp Hortmann wrote:
> On 9/28/23 17:06, Pavan Bobba wrote:
> > array name "abyBBVGA" updated like below:
> > 
> > a.type encoding info dropped from name
> > b.camelcase name replaced by snakecase
> > 
> > Issue found by checkpatch
> > 
> > Signed-off-by: Pavan Bobba<opensource206@gmail.com>
> 
> 
> A coverletter is missing.
> 

The coverletter isn't required, but the more important issue is that the
patchset wasn't sent as a thread but instead as separate emails.

regards,
dan carpenter

