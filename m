Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B64D10E1;
	Sun, 22 Oct 2023 07:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NupiNPsA"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-9bf941607d4so68373766b.1;
        Sun, 22 Oct 2023 00:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697958577; x=1698563377; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7VuUrAT1/Th4+3DgWgdpcxcj5Og5do5ih7a6V+PS/SU=;
        b=NupiNPsARCQVgIqlEThdPFelGyzd0LPPDeS1sQNRNLG8n7msmapyNWtsPs/uYy/dNc
         xMhpXpfI73ZD0vzKlt66QYs6ZypWQOheVZQDgB8dUCN40RPZelPjjRYOpkmWATm9tQyf
         JcNMEaF/vNBe+jNeDiPkXyAm0iD7z0gcDTJpPdKleFaqQ6ZfNKqXjd8SOmRJZFEo0cH6
         UGP3itEKGNgXmw4wnfguddbO9uBBI51PEFQJJ30bfCBUUsvNwTz0mKggX2Y7CYrP/pm8
         CbLfKSV0YUhdlyRRrhyC7OeYgt33qE4Csy/7yZ/4H1/b97Mj+sF2ggyg181Jv0yAVzUz
         Dn9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697958577; x=1698563377;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7VuUrAT1/Th4+3DgWgdpcxcj5Og5do5ih7a6V+PS/SU=;
        b=uVz9lvUGylsekY/XL2yXyYeePVQJm4eJ8/0WtcFPO39HShx3CDPHiQu6LKbosjcwck
         w6AYKew5sUUKAGYadDl7jXbOnBQfPJW6lfMrb7Nki1NDVisbATr8vYeEu9XIjNPVg+/t
         Y3XUlbjg0w6gaDGXtCFUrMGRFefkh5FlKcZNd2myQZsuqaubzs1idV+u978WhTlpS/DT
         os1NXQVSawwd5YrX4KNp6bmZhsPzT67xUHeaxITsuzOS9rTLzi3IbiJQJKM4H4aBe+Ai
         xJLwprO97p0Fm7zyOkSX6sB/GNTTnMZ1Ac3Wk0GcCfYErY84nMVuF18GlOd7WdulRH5u
         0XxA==
X-Gm-Message-State: AOJu0Yy5Sd4RGIQd8TY+Dy7YI0qGTGQz6+N3/Kn7eolTswZLgSUoQWYs
	uuCXg5oGkwRLlKzYEnee/gQ=
X-Google-Smtp-Source: AGHT+IHpWFSh0xuBo4Si/FGcG50HBVDR+UsxBieOFg/xsNfweEU4hj1dct+CudLFa0Mr8Hp+MLQ2Yw==
X-Received: by 2002:a50:d4d4:0:b0:53f:9242:d24f with SMTP id e20-20020a50d4d4000000b0053f9242d24fmr3897922edj.0.1697958576575;
        Sun, 22 Oct 2023 00:09:36 -0700 (PDT)
Received: from [192.168.0.103] (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id w21-20020a50d795000000b0053e4d1cbc6esm4540607edi.55.2023.10.22.00.09.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Oct 2023 00:09:36 -0700 (PDT)
Message-ID: <58cb8d84-b4ee-4d61-baa3-04d2bcdc9c43@gmail.com>
Date: Sun, 22 Oct 2023 09:09:34 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] staging: vt6655: Rename variables byCWMaxMin, bySlot,
 bySIFS, byDIFS and byEIFS
Content-Language: en-US
To: Gilbert Adikankwu <gilbertadikankwu@gmail.com>,
 gregkh@linuxfoundation.org, outreachy@lists.linux.dev
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <cover.1697927812.git.gilbertadikankwu@gmail.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <cover.1697927812.git.gilbertadikankwu@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/22/23 01:12, Gilbert Adikankwu wrote:
> Make the variable names adhere to Linux kernel coding style and fix
> checkpatch.pl errors.
> 
> Gilbert Adikankwu (5):
>    staging: vt6655: Rename variable byCWMaxMin
>    staging: vt6655: Rename variable bySlot
>    staging: vt6655: Rename variable bySIFS
>    staging: vt6655: Rename variable byDIFS
>    staging: vt6655: Rename variable byEIFS
> 
>   drivers/staging/vt6655/card.c   | 72 ++++++++++++++++-----------------
>   drivers/staging/vt6655/device.h | 10 ++---
>   2 files changed, 41 insertions(+), 41 deletions(-)
> 
Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
