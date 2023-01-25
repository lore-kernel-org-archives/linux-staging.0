Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA0F6FB1
	for <linux-staging@lists.linux.dev>; Wed, 25 Jan 2023 18:56:17 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id t18so5219926wro.1
        for <linux-staging@lists.linux.dev>; Wed, 25 Jan 2023 10:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N9Bf/oOVjGROKj/Iq3R+gnZrE+akCZf2qIA0FI6qo4s=;
        b=C8eWTaPTD4LOO8OAMJOinkpU8TMOVNv7+FzPMfCqYcGiAr/PMcKOHiNa+rgtWDKEeb
         ciNABQ0up71Www5Fq9Kis+Ohttor/6A0GipOpIlHU6BmhSx05QP1gOoyWF8oU0Fwqd4e
         m371yCkxV8O7D9Sfeml/CsSNWIxhQgEsY2U5R4zhHmsJr0hDjCOzW0RU4Ee+Vk4pgTj+
         v4Y7gSxgiWdnx09M2tjpSpUArDvONUJtlMt9XHXzKX+IMRNozZynohC5XbGyJ1TP3VmN
         pCauM9y86DpLxjY27bvnyF9GeETkssNaVtq9ys4owaAXGsT4n1bLUP28NRcrQ/Nt9ngK
         oTjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N9Bf/oOVjGROKj/Iq3R+gnZrE+akCZf2qIA0FI6qo4s=;
        b=txgHrHEVyl7yvEhugQKxYZCMEkr2ZIgjoAPjg1Qi1+DHtIy7/thGXbTXHVWQ28i/5m
         jn/2CKFGxmzjXd8i/smlloRwU5eTBAM1E63ReMtmjYtDc4qfC+1X+j8XR95Wm+17mfUm
         gdSTTgfMEmwSemWZDS9TaLE7RCD47+XhItY+9Atb+Rjy/AOwCwOIjGxFwzt/Kx17RvBQ
         uzynZqwrlNE5QWqwNg+jiMrEdYVAt+0oAyUc0AKhOXkhHwg9+CLa2EmpjNjBmuIqSXNJ
         crY6ONl4G+9Le0K0/r3l06nVQeoXx2WmEsTnNPmKc5xXUu/OE1U+MQGV5zwvYYjDgHmH
         GUNg==
X-Gm-Message-State: AFqh2kr3D90CCA67cDQ2PUnrbKJP+J2q14lJCQhAdxF+nN+DUjJQeM8F
	WF0pNBkh7xDntppMV+h0YuE=
X-Google-Smtp-Source: AMrXdXspT/LjjjvdbBeEACEjwsD4dwN7dNTJ6TyC8ek+t562mWjotaxxXKN0ouOJCkEDVBHuSqI1vg==
X-Received: by 2002:a05:6000:80c:b0:2bd:e0e8:694d with SMTP id bt12-20020a056000080c00b002bde0e8694dmr7181380wrb.6.1674672975705;
        Wed, 25 Jan 2023 10:56:15 -0800 (PST)
Received: from [192.168.1.100] (p57935ca5.dip0.t-ipconnect.de. [87.147.92.165])
        by smtp.gmail.com with ESMTPSA id n21-20020adf8b15000000b0028965dc7c6bsm5049115wra.73.2023.01.25.10.56.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jan 2023 10:56:14 -0800 (PST)
Message-ID: <0b5d743a-c071-e4b5-23e4-ab59d6ef785d@gmail.com>
Date: Wed, 25 Jan 2023 19:56:13 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 0/4] staging: r8188eu: clean up usb transfers
To: Martin Kaiser <martin@kaiser.cx>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>,
 Michael Straube <straube.linux@gmail.com>,
 Pavel Skripkin <paskripkin@gmail.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20230124210108.62170-1-martin@kaiser.cx>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20230124210108.62170-1-martin@kaiser.cx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/24/23 22:01, Martin Kaiser wrote:
> This series cleans up some defines related to usb transfers. It's based on
> the series I sent yesterday.
> 
> Martin Kaiser (4):
>    staging: r8188eu: usb_read_port_complete needs no regs parameter
>    staging: r8188eu: remove defines that strip regs parameter
>    staging: r8188eu: remove unused defines
>    staging: r8188eu: remove usb_ops_linux.h
> 
>   drivers/staging/r8188eu/hal/usb_ops_linux.c   |  6 ++++-
>   drivers/staging/r8188eu/include/usb_ops.h     |  2 --
>   .../staging/r8188eu/include/usb_ops_linux.h   | 27 -------------------
>   .../staging/r8188eu/os_dep/usb_ops_linux.c    |  1 -
>   4 files changed, 5 insertions(+), 31 deletions(-)
>   delete mode 100644 drivers/staging/r8188eu/include/usb_ops_linux.h
> 

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> # Edimax N150
