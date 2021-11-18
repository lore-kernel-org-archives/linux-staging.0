Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3837C68
	for <linux-staging@lists.linux.dev>; Thu, 18 Nov 2021 13:56:41 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id k37so26590129lfv.3
        for <linux-staging@lists.linux.dev>; Thu, 18 Nov 2021 05:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=assU+xqwKMXZXMgvbGwSACpg0iW9I33yDyaJq1bZY78=;
        b=pwQsB9qgwE9Kf0x0rUv89oWr8bxw8cL/pkheUlX4hKs4P4SkCr0nZr7bOU8/oEi/nr
         vmk6/SvWfIK7GHAd3J9YkJqp0FpVJ5s2Kd6f89Id573UXmzQKTVm2DW3eHgIWKuRZevx
         f5ol6GFrfGKQLI1LYEd1uZJVsk2mfd1bXdaKwstEkSUtgPrXZTjg6q1CzSSOezMm4a2H
         rVWZDgZjVTYYeP2bPeCchXXLMm9FZaXduhG2aC4U3M2qB97jcb73c3r/ZrPJY+varuth
         Xz2qYNC2rgKJgXScjXJKHicKyKQyaV1Dse0iC2m8y5Lzofq8bo3Ie1m3Eqg6i2cMeDVY
         pUVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=assU+xqwKMXZXMgvbGwSACpg0iW9I33yDyaJq1bZY78=;
        b=NIXPl+2gDqLruHpwBL3ceY/VusQ0WVb/NRowWBuOBHltjj+3Vy1WC2XP1m6fvewM3t
         1n5aDbzTtdMnAvKxJjO6Njlq0PfnvVdqv+epOrTZRniwPSyQTyxFd4A231ieNCOnZte2
         Cl5kiT4ho8cYiXYe8NWjhlMMrvVt+yE9obuwjECeVTn0r/EGqDU+nwllW/nw0R5JDCWu
         m4PxTG77o5QN1X/F9I7RYGmDJzz979k4FKfR0/mO32epkwwWz1AvXBo0vS3h16JAknRX
         b7gpvS06hAgtb53pK6dF0twk4/HdTGOMWKHwI6GUorl94OEbfZIWCG29hAzCmxMGXxKw
         Su3A==
X-Gm-Message-State: AOAM531+vOfEPh35irYs5ayYj6qHTeMdw7XPyPzpDUmCWhxHKV+j2mqO
	MsFyPUu8WqDWuE2tWunGwZM=
X-Google-Smtp-Source: ABdhPJzywHzBvK2iQnHk9cczmUuenULBkbRAoPkANXhZngz0wNRgO0dK0BdZadLlCL1uZiAffCgFFQ==
X-Received: by 2002:a05:6512:3406:: with SMTP id i6mr24720320lfr.262.1637243799281;
        Thu, 18 Nov 2021 05:56:39 -0800 (PST)
Received: from [192.168.2.145] (94-29-48-99.dynamic.spd-mgts.ru. [94.29.48.99])
        by smtp.googlemail.com with ESMTPSA id z1sm323667lfu.222.2021.11.18.05.56.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Nov 2021 05:56:38 -0800 (PST)
Subject: Re: [PATCH v1 1/3] media: staging: tegra-vde: Support reference
 picture marking
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Anton Bambura <jenneron@protonmail.com>, Hans Verkuil <hverkuil@xs4all.nl>,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211114222353.22435-1-digetx@gmail.com>
 <20211114222353.22435-2-digetx@gmail.com>
 <42b24cd0-ac37-3cfe-1fb2-d6292015318a@gmail.com>
 <20211115124402.GE26989@kadam>
 <e4b9d596-d206-71d1-6ec5-1a41af579836@gmail.com>
 <20211115154858.GG27562@kadam>
 <89166c20-6b05-ed4b-ed45-451f4f1e10bc@gmail.com>
 <20211118061418.GO26989@kadam>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <a7238d27-6f9a-58ac-1acd-44fa6ea0727d@gmail.com>
Date: Thu, 18 Nov 2021 16:56:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20211118061418.GO26989@kadam>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

18.11.2021 09:14, Dan Carpenter пишет:
> It's not hard to run Smatch yourself...
> 
> Depending on if you're on a apt distro or yum distro then fetch the
> dependencies with one of the follow commands:
> apt-get install gcc make sqlite3 libsqlite3-dev libdbd-sqlite3-perl libssl-dev libtry-tiny-perl
> yum install gcc make sqlite3 sqlite-devel sqlite perl-DBD-SQLite openssl-devel perl-Try-Tiny
> 
> git clone https://github.com/error27/smatch
> cd smatch
> make
> cd ~/kernel_source/
> ~/smatch/smatch_scripts/kchecker drivers/subsystem/

Thanks, I was running Smatch couple times in the past. Finding how to
run Smatch isn't the problem, the thing is that Smatch either isn't
packaged by distros or packaged version is outdated, hence there is a
need to maintain it by yourself.

Also, is it guaranteed that Smatch will always work properly with
linux-next?

I imagine more developers could start to engage in using Smatch if
kernel supported 'make smatch' command which would automate the process
of fetching, building and running Smatch.

Couldn't the "kernel" version of Smatch reside in the kernel's tools/?
Or maybe just the parts of Smatch that are necessary for kernel
checking, like kernel's DB/scripts and etc. Doesn't it make sense?
