Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C759328E0;
	Wed, 13 Apr 2022 08:53:02 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id x33so2319591lfu.1;
        Wed, 13 Apr 2022 01:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=REX/z+n7YWBBJDlzF+Aw7IHHABYWnYTA+zJDNU+tu7Q=;
        b=oEV3gX7Rvbzp2KVJLJ69CrNyKqmwoP9ryrMSU7KFeaMcacoPE/HZ0whfjtAsHzQpH2
         Zyyzmlg29f0yESAZ5wwvxMM8xVAi39rYWqNVEQP1sRzsxAmxm+D8Lf3aLmABPl9xMatv
         WSdeMrWqfdu+vEBxsFXFyG8krQqi5IO3Aj+0fVZhLxB6QWlLDG6X7989fbz/hcOjzM8V
         WFosbj7EhA7qJW5HwhySVemvTAgMvVXR5tKIKriPawNP0X9kLJa9pjHA5Cm71cL2xX81
         qEU5YTeKYWiUJPKBQ2s99TqJaQwewk1WtynSoE1p+Jq5YKWlWyf/BTZOpyIDs5RfRgZB
         WweQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=REX/z+n7YWBBJDlzF+Aw7IHHABYWnYTA+zJDNU+tu7Q=;
        b=zM44RcGhgTrJbsgYQUS50Gg2q3ufYCZjYmU5HFjwFO8i4J6W/1lp2dXfg6RYzUi+Ol
         AihmkfetFTCCEu84+r5oBOCPQSgzTl0HqngUMYlGWsYtVtFfYRcHLZ9/3e+x/gsrAAQI
         Bo59cM4ZzINHM/BYevprlUxZ3/KHeuAeVzTS8Ktg60Mdood8HY3jokWNcyAO1kGjLNG4
         qNwMJTfNdjPVmUP55qlOlyEQxEr099+yYuNMHaRFaqYb0bktd/W9kCPoEGq6m8CS2LLL
         QXRlcqgKrieWGUjQu6GK96G1yDt1Ip65GJZ46HLZZGRy2bu2cD28f1YM3TFJmzcvUHY7
         2Rxw==
X-Gm-Message-State: AOAM533mEO92eI7vkCSi1N8WckSbqZl1fpBpJaQfR6rAqRNowSJaDSyf
	Yo8yUpegabPAYsEEVv6Ynw0=
X-Google-Smtp-Source: ABdhPJxr5eXW2iLcB++u3dsXLo8Bp0ENFxT3tQssPkZ7+Fl2HgeHHYKub6XLGAH++AsjbnjZnMU4ig==
X-Received: by 2002:a05:6512:b08:b0:46b:a876:3009 with SMTP id w8-20020a0565120b0800b0046ba8763009mr8839300lfu.378.1649839980642;
        Wed, 13 Apr 2022 01:53:00 -0700 (PDT)
Received: from [192.168.1.11] ([94.103.225.17])
        by smtp.gmail.com with ESMTPSA id y20-20020a2e7d14000000b0024b44fb9a9esm1930623ljc.51.2022.04.13.01.52.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Apr 2022 01:53:00 -0700 (PDT)
Message-ID: <4946ce95-8692-b765-b5ea-ab4b521182fc@gmail.com>
Date: Wed, 13 Apr 2022 11:52:59 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] staging: r8188eu: remove else after return and break
 statements
Content-Language: en-US
To: Mahak Gupta <mahak_g@cs.iitr.ac.in>, Larry.Finger@lwfinger.net,
 phil@philpotter.co.uk, gregkh@linuxfoundation.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 outreachy@lists.linux.dev
References: <20220413052759.4859-1-mahak_g@cs.iitr.ac.in>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <20220413052759.4859-1-mahak_g@cs.iitr.ac.in>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Mahak,

On 4/13/22 08:27, Mahak Gupta wrote:
> Else is not necessary after return and break statements, hence remove
> it.
> 
> Reported by checkpatch:
> 
> WARNING: else is not generally useful after a break or return
> 
> Signed-off-by: Mahak Gupta <mahak_g@cs.iitr.ac.in>

[snip]

> -	}
> +	/*  could be pure B, pure G, or B/G */
> +	if (rtw_is_cckratesonly_included(rate))
> +		return WIRELESS_11B;
> +	else if (rtw_is_cckrates_included(rate))
> +		return	WIRELESS_11BG;
> +	else
> +		return WIRELESS_11G;

This 'else' is after 'return' as well, isn't it? Just wondering what's 
the difference between this one and others in this patch




With regards,
Pavel Skripkin
