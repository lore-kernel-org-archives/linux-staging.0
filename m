Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E86137B
	for <linux-staging@lists.linux.dev>; Wed, 20 Jul 2022 19:00:32 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id y11so31820468lfs.6
        for <linux-staging@lists.linux.dev>; Wed, 20 Jul 2022 12:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=nXbqLZ52l8rkAxQgKq0ZUlGmE/J2GY5DjCY+3KWjA1Q=;
        b=CMOjU4rp5sj91z03o+3gaF3/LSL0widFjnesWZJSVXp3ZnrU+C0MhweYjvkEGOhBA9
         8lEFxJkmrbFlzPq/fyKQc4W1cglx2GyxhD/N3WhFuXNmDdXjLsOYLmhc/khwu7qUHswB
         MvQzEi13TzixX5rSpDi4F4xQeNONZrHkm9trYuad5fjGqbtgvytZxZrH16E8B2FU4w4E
         wtDgihrLQpA9rjnk2GIGaksTkQbb3s4wTN0rjUHzRublwOqDR1sLDRkvTS4iNGWVibeQ
         E8xApwywwSVS3nOcMB4Xo17TOtb72mnDlqJ6iWRhN+571if1ktnLMYmAnCPEwo+Xxm0o
         289g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=nXbqLZ52l8rkAxQgKq0ZUlGmE/J2GY5DjCY+3KWjA1Q=;
        b=Lz9WbsYovDADNDQSpib0HpK7AvVjoqm43eR9a2X8+32XR2X3Gm468Zb8D/EmEwl2nS
         ndA8G3ekHn7OgXovRXcayZyuh01Xcxm0gBT0hf3UocdhFKqan3Rv1eMpAFuIgvf4Mamf
         PSQ25BxAcrNLo5x9mUpCL3246+E15u8yuqEKiurMnDcTuNIEJpVxKdlJhVcjxMqnqXZ7
         ghIYPJxBGlgt+ZG45/j6H/I/Wg+cohVIhAIrAkmRY3fs2dajPNRB++nQa2czvUGL9tHf
         ARleBeAX1iTQDLRf+0YpAr27plTbuxxX52jZMiChfAWO6CpTJzckHDEcy5lUM+Prasiq
         Vlyw==
X-Gm-Message-State: AJIora+VVnwjJoF6amCg/f4yqqVaFVsB+z6Jgo83XVUrhZMU0ruih7r2
	1F/JhII2AjggWc6bJr0CygU=
X-Google-Smtp-Source: AGRyM1tj6l0S42zkoOEMR6ssrYGWstFB+ylRfRCkxaFpAaoJ0AfHqk7X0hwSNUnlFU9hhCbL/EHhrQ==
X-Received: by 2002:a05:6512:2e7:b0:488:a7c8:3d14 with SMTP id m7-20020a05651202e700b00488a7c83d14mr20912776lfq.273.1658343630780;
        Wed, 20 Jul 2022 12:00:30 -0700 (PDT)
Received: from [192.168.1.11] ([46.235.67.63])
        by smtp.gmail.com with ESMTPSA id 4-20020ac25f44000000b0048a3c5e09c8sm2329237lfz.199.2022.07.20.12.00.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Jul 2022 12:00:30 -0700 (PDT)
Message-ID: <a2747f00-99b8-10a2-edf5-7dd6fd7a1f8b@gmail.com>
Date: Wed, 20 Jul 2022 22:00:28 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] staging: r8188eu: Inserted empty line after declarations
Content-Language: en-US
To: Abhijeet23081989 <abhijeet.srivastava2308@gmail.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Michael Straube <straube.linux@gmail.com>,
 Rebecca Mckeever <remckee0@gmail.com>, Martin Kaiser <martin@kaiser.cx>,
 Vihas Makwana <makvihas@gmail.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20220720160217.70966-1-abhijeet.srivastava2308@gmail.com>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <20220720160217.70966-1-abhijeet.srivastava2308@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Abhijeet23081989,

Abhijeet23081989 <abhijeet.srivastava2308@gmail.com> says:
> Warning found by checkpatch.pl script.
> 
> Signed-off-by: Abhijeet23081989 <abhijeet.srivastava2308@gmail.com>

Please use your real name as you always do when signing documents in 
real life.

Patch with above S-b can't be accepted.




With regards,
Pavel Skripkin
