Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED32C17EF
	for <linux-staging@lists.linux.dev>; Sun, 27 Nov 2022 14:45:16 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id bj12so20123781ejb.13
        for <linux-staging@lists.linux.dev>; Sun, 27 Nov 2022 06:45:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HUXgxrLtiv5I/LQlNEQb4l+Oh7igXNjdXrq3rf5J8X4=;
        b=gBMq8hfrt16Aw9izcazXcsAAESg4Uet8vUpMKOiQLkEEBKYNvi5/gOGatHK6u9dDzv
         8jjHXi8TcYSM8vymib4BcAshPgvYZtQuOz+GhOgXuw7OXBoiUkv6uNJTjSdf6MBzieuc
         hUTJi9MctsCbjyj6WhhDPMfmVwYUvsGSQDtuMD98cbJv3HC4r3AIhv+vxHBm0Pi2Xzba
         V/pqfu1PYZkkQGCmH8iRNrZKgw9WaMz1KHx/s2UAyYdhKAUOuFvkUqsFHXasz1PV8mix
         XbXanAopjcjdt6eKnklD6h5IZHdlDSZHmV3JtVRfnK5QSFZ92VrSs1E4Zg4R86pGuRJW
         XjIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HUXgxrLtiv5I/LQlNEQb4l+Oh7igXNjdXrq3rf5J8X4=;
        b=j2drZupNRxJEivMD/4/keCCAZCry4mwA36ObSDGw5Uy4O/EUTKO9Yr4+jE6k9jJRnJ
         BLjqzn849YHepHsRQtDLQfSGwYFTv6QAzeghLefGFBwKCEUmTr2IGcFye4PIJVLDfeWe
         DQ2Me4CUQM85i3Ddqoxghyuh8ndACPSe+uLf15HV1V54Xq0CGH7SDDxBjWODOHChX2EZ
         I7Mnwc3RzJxiC068LV5XGaOpzBbmh/rMmcXSJEaifh98dS9sRlUrZlxwIEv8sAq6bvay
         aZ19lQq/4EyJJI8m1JtGH6FU6gZN5cI5EBRn88uJTyhgBRIUmppwRn//GuG6EfAImhms
         R7IA==
X-Gm-Message-State: ANoB5plv+oziaHSWgPGOc7opjInSs8U+hBDEOEsYEEhmOVMKASHyKESX
	5d7YGMKu37B80wlBpyi6Has=
X-Google-Smtp-Source: AA0mqf6c+8WPcm/JlIo3iB1fQ/xqDK7wRMkWXpyMXY2y7dm8TQlMIs/+TF81znkGa2PL6vJqdvlpdw==
X-Received: by 2002:a17:906:dfef:b0:7ae:db2:f10a with SMTP id lc15-20020a170906dfef00b007ae0db2f10amr25590181ejc.709.1669560315225;
        Sun, 27 Nov 2022 06:45:15 -0800 (PST)
Received: from [192.168.1.100] (p54a07888.dip0.t-ipconnect.de. [84.160.120.136])
        by smtp.gmail.com with ESMTPSA id lb25-20020a170907785900b007933047f923sm3816923ejc.118.2022.11.27.06.45.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Nov 2022 06:45:14 -0800 (PST)
Message-ID: <b55f9596-6a2b-a65f-7de8-63c096a36317@gmail.com>
Date: Sun, 27 Nov 2022 15:45:13 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 0/5] staging: r8188eu: another round of cleanups
To: Martin Kaiser <martin@kaiser.cx>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>,
 Michael Straube <straube.linux@gmail.com>,
 Pavel Skripkin <paskripkin@gmail.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20221126154253.178275-1-martin@kaiser.cx>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20221126154253.178275-1-martin@kaiser.cx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/26/22 16:42, Martin Kaiser wrote:
> This series simplifies the issue_probereq_ex function and fixes other
> minor things.
> 
> Martin Kaiser (5):
>    staging: r8188eu: drop return value from issue_probereq_ex
>    staging: r8188eu: remove wait_ms parameter
>    staging: r8188eu: fix the number of probereq retries
>    staging: r8188eu: simplify the checks for zero address
>    staging: r8188eu: use ieee80211 helper for protected bit
> 
>   drivers/staging/r8188eu/core/rtw_mlme_ext.c   | 30 ++++++-------------
>   drivers/staging/r8188eu/core/rtw_recv.c       |  5 ++--
>   .../staging/r8188eu/include/rtw_mlme_ext.h    |  3 +-
>   drivers/staging/r8188eu/include/wifi.h        |  3 --
>   4 files changed, 12 insertions(+), 29 deletions(-)
> 
Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> # Edimax N150
