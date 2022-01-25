Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DFFA2C82
	for <linux-staging@lists.linux.dev>; Tue, 25 Jan 2022 12:48:35 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id t9so4850030lji.12
        for <linux-staging@lists.linux.dev>; Tue, 25 Jan 2022 04:48:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=ZAMOdaZV3kaz6DNePCCcseQo6HQuQu7Jogq542aV50U=;
        b=kZymcFPiqTrN6lay77u5I0pKKqy2ePROp3bdw2vGb8US+M0sWOhNhaqYtxFsK6XlWR
         dIQRE4DeBE7TxBj+NGMkPXgtz76s9jy0dTstR5MrSue8bnRaJabAw6uhlwpqeLFFFAOR
         ZSJGt/PXAZVjf93sLfwIsbvGJij0XBJn1vZ5CvU81dBY3+B/ucKnTRHhZmPKQWk7PBJL
         hSussOi/wXrQjzlqTJNsw9XWl6lJGHw7zpQukUEqWFlCCXNoDRgV9Igurb14+aQgCA/S
         G1k+kySrajDS+Mua7l6UXeEFUGgGUuKSpMtI5uH4iyI7on+g/9Of5mmWaf2TEhQfDQei
         lIcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ZAMOdaZV3kaz6DNePCCcseQo6HQuQu7Jogq542aV50U=;
        b=sXGpNBRAV0+baEWFzctU7guOSRZzFna7Cjam9wZRisWvHPQ3fgpAg3hrv9A0ZKYVOA
         SprJTCzt2XsNqg0EbOE1p9lxvecAcRdqRx2yObeWQdR7wtjCAIcYVJG/UFes9AIKAjrS
         1T8HyKBKuzktaRQXcfVTDxmUCEcmMjJx9Ihm8RL0ohhxx5+j1K6pjXCwS8AoPbiuRSIi
         NA5xYtCrf3fFU2fGsJMsIXrtsM+NuOga3URjQ4jdoGfuudfG0nU6FCLTL2yFsuOkIt3U
         OerO37lk7wf9pY3aRAj8Eil2aaYjyExj/r3Tp3V5NY6Mrl35wzFz+grtC+yp2wrXeEfC
         kpHg==
X-Gm-Message-State: AOAM531WXtzyKeQXFEPeeA0mQFutC//ljYQ7Od0LTUXosuwbctVkEqQk
	oNymsRUoq8RhdTPhn2qUoiQ=
X-Google-Smtp-Source: ABdhPJzD0Dpm374X8XGe9j8y27j8+MrVZsA3uxyWNkyDoKVx4BpSAuxrJHa9ZGTTJW3EUDmd8kf0yQ==
X-Received: by 2002:a2e:22c6:: with SMTP id i189mr760695lji.496.1643114914006;
        Tue, 25 Jan 2022 04:48:34 -0800 (PST)
Received: from [192.168.1.11] ([94.103.227.208])
        by smtp.gmail.com with ESMTPSA id j23sm781579lfh.35.2022.01.25.04.48.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jan 2022 04:48:33 -0800 (PST)
Message-ID: <67ddc4d7-e19f-7c9d-a4b7-4eb555830ea1@gmail.com>
Date: Tue, 25 Jan 2022 15:48:32 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 05/10] staging: r8188eu: remove smaller sets of DBG_88E
 calls from os_dep dir
Content-Language: en-US
To: Phillip Potter <phil@philpotter.co.uk>, gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com, Larry.Finger@lwfinger.net,
 straube.linux@gmail.com, martin@kaiser.cx, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20220124224415.831-1-phil@philpotter.co.uk>
 <20220124224415.831-6-phil@philpotter.co.uk>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <20220124224415.831-6-phil@philpotter.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Phillip,

On 1/25/22 01:44, Phillip Potter wrote:
> Remove all DBG_88E calls from the os_dep directory, other than those in
> os_dep/ioctl_linux.c, as this contains almost 200 on its own so will be
> done in a separate patch for ease of review. These calls do not conform
> to kernel coding standards and are superfluous. Also restructure where
> appropriate to remove no longer needed code left behind by removal of
> these calls. This will allow the eventual removal of the DBG_88E macro
> itself.
> 
> Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
> ---

[code snip]

>   
> -	/* 2012-07-11 Move here to prevent the 8723AS-VAU BT auto
> -	 * suspend influence */
> -	if (usb_autopm_get_interface(pusb_intf) < 0)
> -			DBG_88E("can't get autopm:\n");
> -

Didn't you make a function change here? I didn't test and also didn't 
find any mentions of tests in cover letter.

I am asking just to be sure you done it not by accident :)





With regards,
Pavel Skripkin
