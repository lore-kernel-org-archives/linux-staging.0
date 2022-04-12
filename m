Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0E31840
	for <linux-staging@lists.linux.dev>; Tue, 12 Apr 2022 01:55:17 +0000 (UTC)
Received: by mail-io1-f45.google.com with SMTP id k25so20766751iok.8
        for <linux-staging@lists.linux.dev>; Mon, 11 Apr 2022 18:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=oBVB6OMaVmW4VIDZAaEbON7kMyciD94DEsz9UZvj85o=;
        b=QjwzsS6usi7V1XeKXWF4Vglaq7eM5rnAiKiLughIP0ghQ//qBSt6pXF8Wy65karFKN
         f5jGgz69NhX4t81wiicmvfqWge29IsgGZrbnJjrHvbdZ2WShrE8PlKzG0n6jd0SJM/Yl
         7/Ls7B7PW47llnfhBXZ/+IzbGcfA7wRwyCQ4I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=oBVB6OMaVmW4VIDZAaEbON7kMyciD94DEsz9UZvj85o=;
        b=xOVSYOmoBSrPyLRgX0F05jJgWR9M6ZIdywcaKNZgWCU6XwQAzpZLNXfZr/kKLDlJnF
         AA1HgZa0EsWvupNldH38F0A+0b0MiY+ZBlALSvbUExfOS3KiUNSbMsAvWO6Syl9Vu4CO
         bv6JnathNHVhNg5awlHAkHfnYFbJXpfAryTuHiQbQubWqJF0j+JkF1K5WHBuuedNX5vu
         +OBpDotqeGpqrklBkdCdtZUxOZJHNGulrbKFfbTT3m+2OCqsE1sw57dYdb5namnnBtOb
         /EDVRQIUQEQpv/fuYPUVDi7sdU73GDRPC6QyEc3bD/BuzQ/NXpbBycP6NYmg9mbjCjuA
         aJlA==
X-Gm-Message-State: AOAM5310m7oQ/RsNdV7BpLgc1Bt7KVBygbJpt6YL4Ez3igsho5mmoFuW
	qk4H0R5PR4uM8ACsuHToAYi/xQ==
X-Google-Smtp-Source: ABdhPJyr6vt6puQIS2gbji09gkrJPhnfDSc5vipjeTwUTA07rThe82vQKJkBr4KzhKq/ChbxNSs8wQ==
X-Received: by 2002:a05:6602:2a45:b0:648:b21c:6f49 with SMTP id k5-20020a0566022a4500b00648b21c6f49mr14820942iov.206.1649728516198;
        Mon, 11 Apr 2022 18:55:16 -0700 (PDT)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id a2-20020a5d9ec2000000b00645ab33390dsm21121751ioe.9.2022.04.11.18.55.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Apr 2022 18:55:15 -0700 (PDT)
Message-ID: <9c3bdbce-e898-696b-b645-6e566faffa85@ieee.org>
Date: Mon, 11 Apr 2022 20:55:14 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 0/2] staging: greybus: fix warnings reported by checkpatch
Content-Language: en-US
To: Jaehee Park <jhpark1013@gmail.com>, johan@kernel.org
Cc: elder@kernel.org, gregkh@linuxfoundation.org,
 greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
References: <cover.1649712572.git.jhpark1013@gmail.com>
From: Alex Elder <elder@ieee.org>
In-Reply-To: <cover.1649712572.git.jhpark1013@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/11/22 8:50 PM, Jaehee Park wrote:
> The first patch corrects a typo in a comment. The second patch fixes
> 'void function return statements are not generally useful' warning.
> 
> Jaehee Park (2):
>    staging: greybus: correct typo in comment 'Atleast' to 'At least'
>    staging: greybus: remove return in an empty void function
> 
>   drivers/staging/greybus/arche-apb-ctrl.c | 2 +-
>   drivers/staging/greybus/audio_codec.c    | 1 -
>   2 files changed, 1 insertion(+), 2 deletions(-)
> 

These are really trivial patches.  Whether the second
one is even worth changing is questionable (it represents
"code churn" without really adding value).

That said, you've properly submitted the patches and I
have no problem with either one.  So someone else can
object, but if they do not:

Reviewed-by: Alex Elder <elder@linaro.org>
