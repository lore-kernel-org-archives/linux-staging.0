Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3207D2FC;
	Tue, 17 Oct 2023 06:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P1rLnhFP"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-9c14313eb1cso63813966b.0;
        Mon, 16 Oct 2023 23:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697523591; x=1698128391; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dBTFzOZUm33JicBd54NiMc5LyGvqTjPU5461OiFS0cA=;
        b=P1rLnhFPTKV2xHTdH7flkpUfVIimdRZdVu7sXE5al36rzoccltL+FBOepnDa0azJxM
         3zH37jRGIhvV8UJty2gwSVZjeSFeYOXTyqVhAj8kqHGbeLotnDn94x9eILzNllTPR98j
         0ZamFMHe1pMBz0i7aiN68X3nBQ5S188bm0Y5+iF1mGnQB2bYZp2F+XtA2KNy+FtR0FfY
         HP+aNM/FIzTQ7aidLaItIVDpX0dSONjMcv3Jy9FypEO5a6eV78BXEND8sd6eD3wWXqES
         b5BXC5zbyliEX+gNl9d14VQ4C3Zv+p78mzDjqbMWIdhpfFfoLKsQqmlHMvy71qtCrLUv
         x4WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697523591; x=1698128391;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dBTFzOZUm33JicBd54NiMc5LyGvqTjPU5461OiFS0cA=;
        b=rhdof2P5kHGWtk9/PEtopFwYl95iL3PdfFae/9Vof0JoHctTUjxOGV8sLHZIfWvSlh
         nLkO1lnwa8EELNChFFASRHv6JcIXDcbJql4l0sF0Jm0TOMo8OOZXIdWEfIFhiCvthanO
         gPhRZMoerxcazMNbpU7Hl+tNKUhr+OZka1xM4BXaqD43sgCPtq7CB+/e/h/D6hROETmB
         nE0ulvnmrdcCtG9Qfi0+RB9GUXYAiVr0F95UZHPPjVrBaAC6yc+qa+J+pKKkG+lsBHYK
         piu/DkS11FeyVsGO0RW389/RCV8BqetoGmQ/1+9Z1c371uuv+fw8Zry2xPvrrAhm+q+5
         mYPw==
X-Gm-Message-State: AOJu0YwKxdiibjIaYpH5awY2ou8SJG6Xh9Vp/xxgruvs/T0bmF3m0nT9
	OtVnuTHnjS4iGvXMuTywdhQ=
X-Google-Smtp-Source: AGHT+IGRvXAWIeFFF+cl54Cxh1CELKVXCCwn+KlvhhO2eJEOrA1kX4Jvjy4ihoENtdDerksriPn6ng==
X-Received: by 2002:a17:907:6d1e:b0:9c4:4b20:44b0 with SMTP id sa30-20020a1709076d1e00b009c44b2044b0mr835694ejc.1.1697523590615;
        Mon, 16 Oct 2023 23:19:50 -0700 (PDT)
Received: from [192.168.0.104] (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id z15-20020a17090655cf00b009b27d4153c0sm587208ejp.178.2023.10.16.23.19.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Oct 2023 23:19:50 -0700 (PDT)
Message-ID: <0f6661a4-7281-4d26-8c26-ba03a567fcaa@gmail.com>
Date: Tue, 17 Oct 2023 08:19:49 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Rename variable bUpdateBBVGA, byCurrentCh, byCurPwr
 and byBBPreEDRSSI
To: Gilbert Adikankwu <gilbertadikankwu@gmail.com>,
 forest@alittletooquiet.net, gregkh@linuxfoundation.org,
 outreachy@lists.linux.dev
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <cover.1697495597.git.gilbertadikankwu@gmail.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <cover.1697495597.git.gilbertadikankwu@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/17/23 00:58, Gilbert Adikankwu wrote:
> Make the variable names adhere to Linux kernel coding style and mute
> checkpatch.pl errors.
> 
> Gilbert Adikankwu (4):
>    staging: vt6655: Rename variable bUpdateBBVGA
>    staging: vt6655: Rename variable byCurrentCh
>    staging: vt6655: Rename variable byCurPwr
>    staging: vt6655: Rename variable byBBPreEDRSSI
> 
>   drivers/staging/vt6655/baseband.c    |  2 +-
>   drivers/staging/vt6655/channel.c     | 18 +++++++++---------
>   drivers/staging/vt6655/device.h      |  8 ++++----
>   drivers/staging/vt6655/device_main.c |  8 ++++----
>   drivers/staging/vt6655/dpc.c         |  2 +-
>   drivers/staging/vt6655/rf.c          |  4 ++--
>   6 files changed, 21 insertions(+), 21 deletions(-)
> 

Hi,

-       if (priv->byCurrentCh == ch->hw_value)
+       if (priv->current_ch == ch->hw_value)^M
                 return ret;

ERROR: DOS line endings

What does the "^M" at the end of the new line?
Did you run checkpatch on your patches?

Thanks

Bye

Philipp



