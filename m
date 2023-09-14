Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0892F4E
	for <linux-staging@lists.linux.dev>; Thu, 14 Sep 2023 06:38:06 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-31c65820134so483815f8f.1
        for <linux-staging@lists.linux.dev>; Wed, 13 Sep 2023 23:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694673485; x=1695278285; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+Ln9AYYR12krk4RrRHWYO/LjdYMxN479/wAy3HLaC4E=;
        b=fb73KLNn0Sse+V9Ti1mNshb3n2cJR3rYLDDe6R0pYN36gjKbogkAUTB4g+45bUzfbR
         8g3oUt/ni6Sb1011ZWYLR5YpCAOi6wlrEcCOGjgUONv25wva2Xs7ZamIkrjhnVEW8WXK
         UxUOSW3vJ+pmZeC1/AlUb5Kk+epH2nhOXUVVcs26YRuxa+W9XmsDyjDsxHkK3vCxYy6w
         W3ER84+Ur9/0eLqFBZmQGv7iOl31AxxtmybQCHkLAusHHYKXtUvEfPgA2mJvGO8s7emS
         XvDZ+y79VOtwfpePhhLFcKqOZih+G4dHMeUx8Dl+Y9aabaUxT7Q8iAWqN+GnDKpOj7rk
         5ikw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694673485; x=1695278285;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Ln9AYYR12krk4RrRHWYO/LjdYMxN479/wAy3HLaC4E=;
        b=bvg+FR+1a07JSxWrywRmHyidkRIpZQTDuZEV9oTt0l33q6xgVkmLsOho4uXRq5xpUU
         ep1KrJvcP4Ee7fHF8IIMujvyTbXgt7lqhh4XH0HC/N4/qP9IjFKEwDKQ9ghrGim6RSeT
         0hTbZ3ekafWFhqXjoNZI0vVoEQdPIC2UTLfGFMcllHwWE+pb5AeRa93uJLPIjTx66EPn
         xB8HeuJYL16V9Ayufa3wSGmtWi9xH6akl6wdvlzfHztrbr0I1/Xegx2tly6VYSPTHRnu
         9jR8hnuLfXgNAcvVRWjjEwr/+RTMoFIzEVHCzMv23LZaxKLMV0ODrg7hPI2oV5rmjOBA
         VzaA==
X-Gm-Message-State: AOJu0Yzl78VGNaehuCwWRd451F5VSlYHfrVJUBcGPn7E8MJ4qqaSRWd+
	qGhvZ32xkomE8TgWUX+ZYEon8g==
X-Google-Smtp-Source: AGHT+IGPEw/siPqdPa1mmpWtwvScyxJuter6eejbGV+yhWaeYVM/X3KyHBo5xANDsRBa4zWBvGUj/A==
X-Received: by 2002:a5d:58fc:0:b0:317:6ef1:7939 with SMTP id f28-20020a5d58fc000000b003176ef17939mr4011730wrd.23.1694673484942;
        Wed, 13 Sep 2023 23:38:04 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id k3-20020a056000004300b0031fba0a746bsm851192wrx.9.2023.09.13.23.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 23:38:04 -0700 (PDT)
Date: Thu, 14 Sep 2023 09:38:01 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Umang Jain <umang.jain@ideasonboard.com>
Cc: linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stefan Wahren <stefan.wahren@i2se.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Adrien Thierry <athierry@redhat.com>,
	Dan Carpenter <error27@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Phil Elwell <phil@raspberrypi.com>
Subject: Re: [RFC PATCH v2 3/4] staging: vc04: Convert vchiq_log_info() to
 use dynamic debug
Message-ID: <7ea529c2-3da6-47df-9b09-28d4ab36c4ef@kadam.mountain>
References: <20230913185528.770634-1-umang.jain@ideasonboard.com>
 <20230913185528.770634-4-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230913185528.770634-4-umang.jain@ideasonboard.com>

Please rename vchiq_log_info() to vchiq_log_dbg() or something.  When I
see "info", I think it's a KERN_INFO level.  This is all debug stuff and
it's done correctly but the name is misleading so it looks wrong.

regards,
dan carpenter

