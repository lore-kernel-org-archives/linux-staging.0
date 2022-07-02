Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E94A1C30
	for <linux-staging@lists.linux.dev>; Sat,  2 Jul 2022 06:08:28 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id cf14so5276876edb.8
        for <linux-staging@lists.linux.dev>; Fri, 01 Jul 2022 23:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=SIPe2QQOYVv5nAVZFivPLxNrDO6JoR46VxCJNiekNps=;
        b=YnzgPKB/Ukeo0GRSswl9VzBr9aK07zBarTnK/4x7/YUKXouJiQw4Ik1AI5rnOkWm+P
         vf6lNcitqTd71wwgdrZzHGKwQ7bAdg87Xve5TIC67OZieNOBxQOlg5Ft+HjYJ1UiI4XP
         J1TiQ9Yz16OH03xyP9PSclOP83OLfuBSLpR65wWMeRP8psG6qKz4e9/LhQbU3WKLtYt0
         1atq/A14gUVDjaxI8OsJH+kzyaTav5SUWzQoIb83ZgWnq2NMVkOcCiDpZymr0e9uQWvw
         XpnUsOfPB+jhLeQqbkgAbzzTAuG8k873nbTd3OPyMV4eHvfna+5tKdo36kKhAu4vhXpR
         DqUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=SIPe2QQOYVv5nAVZFivPLxNrDO6JoR46VxCJNiekNps=;
        b=MAOY9kvnvodCGfZRAy9N5Pp9xnJUddIKk7Dq97NB/LN2LbBLdEH7G7M/oh4v2GUom5
         CqcI9aESyi2gpmIiTYej7VYwH+mqLPcFff8xZ52ov80xLgEPFss9aIaJ+H99VE41/da9
         a9wo4syl+Ecxlvoh4KkWCcUgErrDn3Z5mVWszC8xDj/ji8t79912orjLELCeJoR7ko0B
         6Fznyol5OY0QAgRaSkEuqW5C5jcXVntujvoj+uVTSQIXG6lRbzDOejzDM2zhZDMBK1oo
         BgqjItuspyCm3ArHwU4QNp6W75/7ARvpreZo89npL7wYF1dA73rNO97dOVOJKUOD7U1q
         hdpQ==
X-Gm-Message-State: AJIora8Lqgav7OJXO9VSizIjluArhg5lDx56WPrrP+4pdF5wC/0GPXqG
	0+vN4l/3xs4axcLm+05ZdUQ=
X-Google-Smtp-Source: AGRyM1tKa8/txO/iEciqI7SKwhDfeoLS35M7LWLwVgQlXfAb3AXiywLpZvHeZf3+kyDbzztwS3BN+w==
X-Received: by 2002:aa7:c2cf:0:b0:435:6576:b7c0 with SMTP id m15-20020aa7c2cf000000b004356576b7c0mr24043364edp.18.1656742106894;
        Fri, 01 Jul 2022 23:08:26 -0700 (PDT)
Received: from ?IPV6:2003:c7:8f2e:6912:39ab:4063:59d3:a7cd? (p200300c78f2e691239ab406359d3a7cd.dip0.t-ipconnect.de. [2003:c7:8f2e:6912:39ab:4063:59d3:a7cd])
        by smtp.gmail.com with ESMTPSA id k20-20020a1709063fd400b00722f66fb36csm11149417ejj.112.2022.07.01.23.08.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Jul 2022 23:08:26 -0700 (PDT)
Message-ID: <7232163c-f573-c1f8-5cd1-da5b70e76091@gmail.com>
Date: Sat, 2 Jul 2022 08:08:25 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3 2/6] Staging: rtl8192e: Avoid multiple assignments
Content-Language: en-US
To: Felix Schlepper <f3sch.git@outlook.com>, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 wjsota@gmail.com
References: <cover.1656667089.git.f3sch.git@outlook.com>
 <899a1010643a05668465069951518e5dcab9c77e.1656667089.git.f3sch.git@outlook.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <899a1010643a05668465069951518e5dcab9c77e.1656667089.git.f3sch.git@outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/1/22 11:24, Felix Schlepper wrote:
> This addresses an issue raised by checkpatch.pl:
> 
>       $ ./scripts/checkpatch.pl --terse -f drivers/staging/rtl8192e/rtllib_wx.c
>       CHECK: multiple assignments should be avoided
> 
> Signed-off-by: Felix Schlepper <f3sch.git@outlook.com>
> ---
>   drivers/staging/rtl8192e/rtllib_wx.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtllib_wx.c b/drivers/staging/rtl8192e/rtllib_wx.c
> index b7f19b38b0e1..121bf939c6a4 100644
> --- a/drivers/staging/rtl8192e/rtllib_wx.c
> +++ b/drivers/staging/rtl8192e/rtllib_wx.c
> @@ -149,7 +149,8 @@ static inline char *rtl819x_translate_scan(struct rtllib_device *ieee,
>   			max_rate = rate;
>   	}
>   	iwe.cmd = SIOCGIWRATE;
> -	iwe.u.bitrate.fixed = iwe.u.bitrate.disabled = 0;
> +	iwe.u.bitrate.disabled = 0;
> +	iwe.u.bitrate.fixed = 0;
>   	iwe.u.bitrate.value = max_rate * 500000;
>   	start = iwe_stream_add_event_rsl(info, start, stop, &iwe, IW_EV_PARAM_LEN);
>   	iwe.cmd = IWEVCUSTOM;


Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
