Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B8F7B
	for <linux-staging@lists.linux.dev>; Mon, 24 Oct 2022 05:33:13 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id z97so27078059ede.8
        for <linux-staging@lists.linux.dev>; Sun, 23 Oct 2022 22:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DtHptBjk8kIZkL1NlEJYM02aKu6ZiaEAAGqFry1nchk=;
        b=oC+rgEmDJBLhp+V+/+qfAVduz4E5q6S4Rt1lRj6dHhDPMEdloeP1OJaL/XqJmpTIqK
         lOP2B8UK6DdzGHo5ST/WGJ6MnOiuIpHhZjq2mutun7fNEAouMVMDwXJyIJ3ggDX8lkSL
         AkqXxo3D9DfH6QN/CQWVbG9inCsgJBWopDlNqqvAIZ/PDKsOjE5C/mt2Sk/UXBoT0egs
         g6YdEZ9bDzuitkcmSuKjDjhTod2IlYAoQ7F8LzOCO9iIK7iLhFXQju8OcbbP+lktVaye
         fP5FQ8JUJJotyYjn13btYvB6irLACYvYga9UqYY1IUVPcJL/fA5KJjXlvbNI2Xk2RV7e
         pS9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DtHptBjk8kIZkL1NlEJYM02aKu6ZiaEAAGqFry1nchk=;
        b=ej3uvzJhl1X5soTBa/euPf7+ZCrJKb4Iuzv8YLPqrQnm2t3vJugF1YeY30HR3kt+Cr
         Ps2T2HvgOAxhSnbLjrUjUE+KtCcUSNX8rR+ujMMtbUu+4I2r8tRWxYlgRXQXw2SsEazK
         AUK/ihCloCt67MnOnMUrYP0IXSR0ZgZuSY83xmBDS7WnJ4GApBOEA837SrjTGG0jf64W
         AGEkHjct18BE2Uy6snRz06p7W5ECkPXvraD9BVbrMkRrBRgNgNcbrdZb1jbjjGHDK4fA
         8xhIZO6slEICDlLrrGjkXAIXR6VbeXUwZdX0Ce3DBmFDUVKtGrmVeLiEqnOSV78epHi8
         6/jg==
X-Gm-Message-State: ACrzQf0Av5TierUQSv1RGDQHdgavPdUcohHaNYFs2kU5goL7IgWW7O14
	GVOlGTTN0rlr+CuGiRoUkMQ=
X-Google-Smtp-Source: AMsMyM6lbF5HanzI2YWSqPBNqKtOsiOk93FPMQoTSH07lG6y3jDPjd8TwYh2BtydZGExNoWDpG32BQ==
X-Received: by 2002:a05:6402:5cd:b0:446:5965:f4af with SMTP id n13-20020a05640205cd00b004465965f4afmr28787999edx.12.1666589591868;
        Sun, 23 Oct 2022 22:33:11 -0700 (PDT)
Received: from [192.168.1.100] (p57ba2cf5.dip0.t-ipconnect.de. [87.186.44.245])
        by smtp.gmail.com with ESMTPSA id r27-20020a056402035b00b00459012e5145sm17895410edw.70.2022.10.23.22.33.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Oct 2022 22:33:11 -0700 (PDT)
Message-ID: <91249bf7-1cab-dcde-1736-e536159b5e91@gmail.com>
Date: Mon, 24 Oct 2022 07:33:10 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/4] staging: r8188eu: cleaning up unused variable
Content-Language: en-US
To: Kang Minchul <tegongkang@gmail.com>,
 Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>, Pavel Skripkin <paskripkin@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20221023200532.259276-1-tegongkang@gmail.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20221023200532.259276-1-tegongkang@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/23/22 22:05, Kang Minchul wrote:
> This patch series cleans up unused variables in r8188eu
> causing coccicheck warnings.
> 
> Kang Minchul (4):
>    staging: r8188eu: remove unnecessary variable in ioctl_linux
>    staging: r8188eu: remove unnecessary variable in rtw_recv
>    staging: r8188eu: remove unnecessary variable in rtl8188eu_xmit
>    staging: r8188eu: remove unnecessary variable in rtw_ap
> 
>   drivers/staging/r8188eu/core/rtw_ap.c        | 5 ++---
>   drivers/staging/r8188eu/core/rtw_recv.c      | 3 +--
>   drivers/staging/r8188eu/hal/rtl8188eu_xmit.c | 3 +--
>   drivers/staging/r8188eu/os_dep/ioctl_linux.c | 4 +---
>   4 files changed, 5 insertions(+), 10 deletions(-)
> 

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> # Edimax N150
