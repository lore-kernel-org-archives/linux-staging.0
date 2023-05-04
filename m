Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A251BFBF7
	for <linux-staging@lists.linux.dev>; Thu,  4 May 2023 14:53:18 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-3f195b164c4so4702235e9.1
        for <linux-staging@lists.linux.dev>; Thu, 04 May 2023 07:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683211997; x=1685803997;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lX/T27vjnEh8k9QeLjynwVpeQJ5Iqp1VjSSNsMcOBEs=;
        b=QhHC7viAls5QeeFDlr8Zxb6K0EZlwkRgePgufMqP08s34GEK45rZTvj2Rj0/EqNLwA
         0Q+PVahifxAYy4wnJlt9nFHcBO7gk7AROz7YCRzAHQfRbx4Wo9UFBw17ogFSOIED4oJb
         gCytz7C0GpOpIhQZ1PfuA3F3D5rT4vd4/xSlS7xjHQeB+lU3PcxRBkB3hevXwIsDb3I+
         3c8PtSzJvJ8ZVqosi1ECeolxhcEiPAD39C6nnBdMtuCuoT9zuNXi8BvX8fvja3JotePN
         fgOMDJhHJKF62H3E29aJw1a/vYRCCKoCk/H4RLqencEaoHC4TfjiEKDR+5myMhwr7t0z
         Og7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683211997; x=1685803997;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lX/T27vjnEh8k9QeLjynwVpeQJ5Iqp1VjSSNsMcOBEs=;
        b=Gt/EgWpMsznOiuIll8Gg4FH4VNpBhXupljifFo6QvWLpTOrYweC2p9Mbwd7hLVZsgT
         N211nTZU3ptPb7LVKWjHX/8nwl7+pGOC7NuyFI8e++fjuGpeRRcbRAbj+rOZ8korieEm
         eToPzzEApTsKO5JoXdiMto6jNvmjgLH8w3FFVbb2dRwsA0qqHr6swtjoSZFqBvDxXBLk
         4ezG+kXtRCbMc4R7J3dxFKzFSbDVi+owiF5NZOf087mpAoFpSIDzHqUJKJdn0d5q6x0e
         8gVm6Oq0ScyBzCFBG5tE4CMEtaLG+MPp62pzhhqbV1iUrEeWaKBCPqu8LdZMW8zGSi8b
         7TMQ==
X-Gm-Message-State: AC+VfDzj1SBOQ8FEpn6C3/v1DwwQhZUQBGdyewLLlELwmd1vcm7IN1Lp
	YSHxuWAiOJAJk8gk6bj6gjwG1A==
X-Google-Smtp-Source: ACHHUZ6GzN7URCucXGCsHRKXlnQyu6W06FtpSOkUPc/LLEF2fjxm7I4m5YoT/ZUAKJT3AvAfP/qXmw==
X-Received: by 2002:a05:600c:2104:b0:3f1:6f44:ff3a with SMTP id u4-20020a05600c210400b003f16f44ff3amr17146491wml.13.1683211996867;
        Thu, 04 May 2023 07:53:16 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id m20-20020a7bce14000000b003f3195be0a0sm5161389wmc.31.2023.05.04.07.53.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 07:53:15 -0700 (PDT)
Date: Thu, 4 May 2023 17:53:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dongliang Mu <dzm91@hust.edu.cn>
Cc: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jacopo Mondi <jacopo.mondi@linaro.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@google.com>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drivers: staging: greybus: fix GPF issue in
 gb_camera_capture
Message-ID: <bc5546c0-2c16-4b2d-ada1-c6dcf1d8c1a4@kili.mountain>
References: <20230504135841.1566958-1-dzm91@hust.edu.cn>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230504135841.1566958-1-dzm91@hust.edu.cn>

On Thu, May 04, 2023 at 09:58:41PM +0800, Dongliang Mu wrote:
> In gb_camera_capture(), it does not check the value of settings
> before dereferencing it. And gb_camera_debugfs_capture calls
> gb_camera_capture with the 6th parameter settings as NULL.
> 
> Fix this by checking the value of setting at the starting of
> gb_camera_capture.
> 
> Fixes: 3265edaf0d70 ("greybus: Add driver for the camera class protocol")
> Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>
> ---

No.  The original code is correct.  memcpy(p, NULL, 0); is allowed.

I don't see a bug.

regards,
dan carpenter

