Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2800E2C83
	for <linux-staging@lists.linux.dev>; Mon, 15 Nov 2021 15:13:02 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id z34so44416735lfu.8
        for <linux-staging@lists.linux.dev>; Mon, 15 Nov 2021 07:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=lKwpCQBPYhLtB1zqTXQVzRnVbkrv/Vyz5cRaUgIENsA=;
        b=SYBJ+usIv+nNyp6M4froRWdGBZO24BYuvV1KNXsVg2gtX6D1NU6SuaVbE4CqWIDvMC
         Aukowe6n9r82eOeAHjKtqyDSgaVvJ+BB29wHdoyCC50/e68IAazNYc+o+k4GyPtpBHBd
         N9eBfKC6lGDb8nX28mPNoCfYegf4f8UudMdcHL1DowPP2RSrgpAQ9SPKCfdbYDpIDZnB
         au88zvmZ5xRYvLfl/3t/qjWnZyibDpK9HyrVgSde0Qtya/Qa+vdQytyX4k03RpnaO9pR
         1bE30XvoLAqFXkDvvcy+0ykhxYj2UR6+mlCdM2cG+NXAy44KYQvKH+ic09DRfa1IlQEs
         8Ptg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lKwpCQBPYhLtB1zqTXQVzRnVbkrv/Vyz5cRaUgIENsA=;
        b=7vQD4H18Zh8kwDOZr7rHl0Xbr24kXqVv3jFTasDg7Jo7pWAEqeW37trSJLbaa/UpT3
         TgcSBby8HZ4+v6IXLl8GDyzf4mLhAVXVLXP5yHwg/n4+2/Ui9zN24JNpcVmSj5CkYi7a
         U2zBtFmKt5I/eHqx+NFfx404TDgIzh8Z0G39f8dZrKj8+rPgTSCxEOADKkIlez3eDcVq
         Z9gMbNJ6p4ZFA2jT4B/hfU948TIfuHoIXT15dASZ9qOrn+znqrjGt3nfcu95MYnAESrQ
         z/2+fBx+UpXFYbIJ6xoMjMusXQPeaBzHQis170Djd83NT3iT3nq6eN2/Yd4jBo7b0SX1
         MtVQ==
X-Gm-Message-State: AOAM5309+9Iqg6bI52YkuUuzQPe/cpdzWzdBxK3fCGNXRws2jUhCaozG
	AUVWTzIBULDXhAwpmCAGsLo=
X-Google-Smtp-Source: ABdhPJw91dfbKB7o3kkKR47TTAh3PA4fW2wt5xAYQi4x53gKcFKU6FTUMn8AMXDULBMGKboq9a0Oxg==
X-Received: by 2002:a05:6512:66:: with SMTP id i6mr36586729lfo.287.1636989180282;
        Mon, 15 Nov 2021 07:13:00 -0800 (PST)
Received: from [192.168.2.145] (46-138-46-211.dynamic.spd-mgts.ru. [46.138.46.211])
        by smtp.googlemail.com with ESMTPSA id h14sm1446936lfu.195.2021.11.15.07.12.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Nov 2021 07:12:59 -0800 (PST)
Subject: Re: [PATCH v2 0/3] Add NVIDIA Tegra114 support to video decoder
 driver
To: Hans Verkuil <hverkuil@xs4all.nl>, Nicolas Dufresne
 <nicolas@ndufresne.ca>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Anton Bambura <jenneron@protonmail.com>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211114224732.11550-1-digetx@gmail.com>
 <1411d7a3913677fee58e103f7610e122686e87bf.camel@ndufresne.ca>
 <55f445d8-8207-35a3-6c6f-dcb9ea70a90f@xs4all.nl>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <274daf12-ae6f-8a95-5cae-bb5b558e25e2@gmail.com>
Date: Mon, 15 Nov 2021 18:12:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <55f445d8-8207-35a3-6c6f-dcb9ea70a90f@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

15.11.2021 17:49, Hans Verkuil пишет:
> On 15/11/2021 15:43, Nicolas Dufresne wrote:
>> Hi Dmitry,
>>
>> Le lundi 15 novembre 2021 à 01:47 +0300, Dmitry Osipenko a écrit :
>>> Video decoder of Tegra114/124 SoCs uses additional memory buffer required
>>> for decoding of protected content. We won't support that content, but it
>>> is impossible to disable access to the buffer, hence a stub buffer needs
>>> to be provided. This series enables decoder driver only for Tegra114
>>> because Tegra124 support requires more non-trivial changes on both kernel
>>> and userspace sides.
>>
>> I believe the stateless API is quite in place now, but I only see maintenance on
>> this staging driver. I don't believe it really make sense to keep maintaining a
>> staging driver without any step forward de-staging it. I believe it gives the
>> wrong message on the Kernel staging purpose.
>>
>> I'm not criticizing your effort, I believe you are doing nice work for you
>> community, but would prefer to see this driver be ported to the official kernel
>> APIs rather then being maintain as staging till the end of time.
> 
> I agree with Nicolas here. This driver only support H264 and the stateless API
> for that is now in mainline. So there is no reason not to convert to the
> stateless codec API and move this driver to mainline.
> 
> It would be really nice to see that happen.
> 
> Without any progress on that I am inclined to remove this driver some time
> next year.

I'll prioritize the v4l patches of this driver. The reason it wasn't
done yet is because the current custom UAPI works perfectly fine and I
was busy with a bit more important patches so far.
