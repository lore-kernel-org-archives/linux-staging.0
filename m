Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6821C5ED6
	for <linux-staging@lists.linux.dev>; Sun, 20 Feb 2022 20:26:06 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id u20so14984427lff.2
        for <linux-staging@lists.linux.dev>; Sun, 20 Feb 2022 12:26:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=G4fVxuzKrXmk38T9ip2XGji02lbnRZqnCl8NZe97wHE=;
        b=He1Y719i4nk05titS+vnyIbXkWJVbwJ8jXoEnZOmY1VD+fE29A0WSXEKhp++2F+E9G
         /cq7CQpdZCwDnwP2EGewSN8lQNBXzFPxO690+2/fVofhEr+vnFUF1GyJQJ0g7X9ggPZU
         OT50Si0Zz2DHx7fGcUCyz1mrCaRIvWhW2pWh/f2p8z7QcJ43MwjhKoUSWAR/ggN4upqK
         qtWVaiiPNmTTTZuhtD4gAdVK/lOcJxR5HerXKrMrjFEVu0SequidsDZ9+dM7nuN69/Do
         4gqn1snpubaj/fHPIh4coXn09n/MVbeVkO5tgwEbtO7+V9XAi7/KddsXnwzWomjBZ3rt
         osBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=G4fVxuzKrXmk38T9ip2XGji02lbnRZqnCl8NZe97wHE=;
        b=irVVFq2f9uyf4cSY4ZrfKMQNy5EPkIsTzJXaVhVM/I9wPvjJjYM2o40iMqWIRIoSWr
         0F0xvl2K5FUsK4Y63ZQdWQ/roNPvpW1FkLlU+HlH+8kxhtKr9bd0H1D2carshlFqGnuc
         o7dX9Wh9RT0PVUW2HyJs/1zC29f5c73J0vbxhODyWmYYK45eMNjJUR5t9UL+wr7D1LIG
         WxI/wPdfk2EIIXEZNGjMcMLxaWSpjTgCwEoYSsbtx4Pst40mxby21Yinw2KfxBkv4B35
         OrIOnc9tb4l5il+cx6Dqr32ywaFHntsAkF26LRCfHP3y7rUByMQx4u7wyMO6jxXwmi0e
         R9vQ==
X-Gm-Message-State: AOAM532CZuP8kD6PUTDmSo+/qB5kBMT8q/54rsqw2zHkHWhxBSmgsvYX
	W4cnXuxOd1xp0NiDPywcG1M=
X-Google-Smtp-Source: ABdhPJxQVI93xxc6iHZZTjo1QbebVWjw6taqMs6g/mPjpLmKZVeMZO/UN7svWA1nLVwFm8CjugquGw==
X-Received: by 2002:a05:6512:234e:b0:443:d569:4366 with SMTP id p14-20020a056512234e00b00443d5694366mr4961370lfu.490.1645388764361;
        Sun, 20 Feb 2022 12:26:04 -0800 (PST)
Received: from [192.168.2.145] (109-252-138-165.dynamic.spd-mgts.ru. [109.252.138.165])
        by smtp.googlemail.com with ESMTPSA id s4sm914433lfr.73.2022.02.20.12.26.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Feb 2022 12:26:04 -0800 (PST)
Message-ID: <65dcd557-984e-8801-96c1-0f14f4d6589b@gmail.com>
Date: Sun, 20 Feb 2022 23:26:02 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 6/8] media: staging: tegra-vde: De-stage driver
Content-Language: en-US
To: kernel test robot <lkp@intel.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Nicolas Dufresne <nicolas@ndufresne.ca>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kbuild-all@lists.01.org, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20220220172950.3401-7-digetx@gmail.com>
 <202202210437.dSxqXeIm-lkp@intel.com>
From: Dmitry Osipenko <digetx@gmail.com>
In-Reply-To: <202202210437.dSxqXeIm-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

20.02.2022 23:19, kernel test robot пишет:
> Hi Dmitry,
> 
> I love your patch! Yet something to improve:
> 
> [auto build test ERROR on media-tree/master]
> [also build test ERROR on tegra/for-next linus/master v5.17-rc4 next-20220217]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> 
> url:    https://github.com/0day-ci/linux/commits/Dmitry-Osipenko/Add-V4L-stateless-video-decoder-API-support-to-NVIDIA-Tegra-driver/20220221-013333
> base:   git://linuxtv.org/media_tree.git master
> config: x86_64-randconfig-m001
> reproduce (this is a W=1 build):
>         # https://github.com/0day-ci/linux/commit/dd010c4949a824dda7225b7074050b5736d3894a
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Dmitry-Osipenko/Add-V4L-stateless-video-decoder-API-support-to-NVIDIA-Tegra-driver/20220221-013333
>         git checkout dd010c4949a824dda7225b7074050b5736d3894a
>         make W=1 ARCH=x86_64  randconfig
>         mkdir build_dir
>         make W=1 O=build_dir ARCH=x86_64 distclean
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>>> scripts/Makefile.clean:15: drivers/staging/media/tegra-vde/Makefile: No such file or directory

I had a feeling that something is missed in v4.
