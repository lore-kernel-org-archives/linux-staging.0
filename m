Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A8743D7
	for <linux-staging@lists.linux.dev>; Thu, 23 Jun 2022 04:58:34 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id pk21so15438085ejb.2
        for <linux-staging@lists.linux.dev>; Wed, 22 Jun 2022 21:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=eoUDrMh+erUbdaGJmsTl+ZRL/9QjZmm3J/nLPRs3FRA=;
        b=pdeYcyzIM/EeuiIsOGwFOug2CFDdImgKiroLQPKSUymMzgHK9YYCTF2BAEsz6plaEM
         z0t15pKe5c+FRjMrZ4RmmazpMaPT6a1ytZfgwbCxLAmQoceyLHCTouUvmwJhA5HnLfd8
         g0xY9rpDI7/aCcCgsX0C9LS/458kRbfPQhI5W+bQK1qtZDxfmMrFWwPLb4GqYV4ZQvu1
         zTG2z8MozpRuOheZ0gHBhjs2Z1hN3C6t5GSw1SIwCKmVidLUp60WvgQLkQGS+WORZ3Th
         dNY1bsxYk6MAH3rTqsmDEhn6DY5QnO4wYb+BCh9wDLUkxKF2zuZGvW9TN2wuc+BElU02
         /M/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=eoUDrMh+erUbdaGJmsTl+ZRL/9QjZmm3J/nLPRs3FRA=;
        b=Jc1V9d8CMLXIHPtXnhYYFFqPdSAOyiV09RHkeIU9s71uDh8MfMB5fLRaOEaHo6sknW
         svHS31o9e6Gwws5kdhLoenpr7n7G/rYGHnvJJpRV5/X13QZEF8mtXtfGRjN+pDQrWwPi
         wfa0W+wv6s6muZP4e+sZcVcXgUQ9z3bDW0gtsFgISWdMQEyiy8+H+/6Sqp1LzjRVhfJT
         9xAShmWEvTqHfwo7XAtkl06dIrKxEeX8/hxfjiEs9qcXobIaK30/QpKOxmjsM2E2oRlY
         8QTEv3PEHotU/01bNA/aZayDTrfG4TLqJWgPVTo1WnjXKn+lZe3gSAZb36IzqJClebLn
         V30w==
X-Gm-Message-State: AJIora+EpO1t4HgknptTWdRosKmy2lJSHNiATNsggYURix036qEKFOlJ
	dg33JbmaIsKeGgmb4o3q4t4=
X-Google-Smtp-Source: AGRyM1unO018+yZqKcHgMCl7hjTKn1obDbpp6FC73SYGcurEyYlhY8u1mzBcFu9wOCW10r6IW2/AfQ==
X-Received: by 2002:a17:907:3f04:b0:6e8:4b0e:438d with SMTP id hq4-20020a1709073f0400b006e84b0e438dmr6341869ejc.391.1655960312999;
        Wed, 22 Jun 2022 21:58:32 -0700 (PDT)
Received: from ?IPV6:2003:c7:8f2e:6923:8d97:93cc:4023:b7a9? (p200300c78f2e69238d9793cc4023b7a9.dip0.t-ipconnect.de. [2003:c7:8f2e:6923:8d97:93cc:4023:b7a9])
        by smtp.gmail.com with ESMTPSA id ff10-20020a1709069c0a00b006fec69696a0sm9970539ejc.220.2022.06.22.21.58.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jun 2022 21:58:32 -0700 (PDT)
Message-ID: <d50c16c1-0bc2-fdc4-16ab-0c27df824ffb@gmail.com>
Date: Thu, 23 Jun 2022 06:58:31 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] staging: r8188eu: combine nested if statements into one
Content-Language: en-US
To: Chang Yu <marcus.yu.56@gmail.com>, Larry.Finger@lwfinger.net
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20220623031515.402691-1-marcus.yu.56@gmail.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20220623031515.402691-1-marcus.yu.56@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/23/22 05:15, Chang Yu wrote:
> -	if (padapter) {
> -		if (pfree_recv_queue == &precvpriv->free_recv_queue)
> -				precvpriv->free_recvframe_cnt++;
> -	}
> +	if (padapter && pfree_recv_queue == &precvpriv->free_recv_queue)
> +		precvpriv->free_recvframe_cnt++;

Hi

tested with:
#include <stdio.h>
int main() {
     char padapter = 1;
     int pfree_recv_queue = 256;
     int free_recv_queue = 256;

     if (padapter) {
     	if (pfree_recv_queue == free_recv_queue)
             printf("Executed before patch: 
precvpriv->free_recvframe_cnt++;\n");
     }

     if (padapter && pfree_recv_queue == free_recv_queue)
		printf("Executed after patch: precvpriv->free_recvframe_cnt++;\n");

    return 0;
}

Seems to work. But the rules which operation is done first && or == are 
not too easy. I would prefer to have:

if (padapter && (pfree_recv_queue == free_recv_queue))

So it is very easy to read what is evaluated first.

But this is just my opinion and does not have to be right.

Thanks for your patch.

Bye Philipp
