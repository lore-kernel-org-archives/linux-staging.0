Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E373219
	for <linux-staging@lists.linux.dev>; Thu, 14 Apr 2022 20:12:22 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id v13so1287453ljg.10
        for <linux-staging@lists.linux.dev>; Thu, 14 Apr 2022 13:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=C7Dpx8L5PzGi8MBDFzzJb1vldbU1zpGfPhld97bZSAs=;
        b=gmjchlWALI17UFCdID3TR9EBYjsHEeMNZLijEWhQIsluZarr/j6DhtUPjiBWXWLynk
         VRW3lL0sBBVPAPytXrHxMu/gBxYsB87pXHGYRigm3pP2hRtv508GdwYUFpMv1YWdJpSH
         3Satsf2u3iPdfj4mE3Q7NQ0KV1GvTUE6jmCpkjmQSGf8iySi/Y24Pi+YEkvfwwi7obmA
         SXnnWPM41VosqFZkbvMWQSqDKZ84bF632iriYGKNL/sEjxVLp6j7cDbxdrFakBOQvvOX
         nRy0//qbWYbkotnjB/de15PjyOuo74A/S2uluslNPMHmQTeiX3ea26xqqUoUmT4NX49t
         PgkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=C7Dpx8L5PzGi8MBDFzzJb1vldbU1zpGfPhld97bZSAs=;
        b=E/P/Pt0lg5Se79OPJf0yF9TYDis9Qc+7mV3kqIJaEbH/0IqnxVGRbPpNUCAe4f5ZRC
         QJ2K2wGcRigrLNtcYe2myxSQ7D14jE/sLAKG07q4fPU5c8tu95z49Ek93Dl4B8BUhBXG
         jgmmUDazpNBtg9PXoLtZZ2+XqYX1nJYLHYsR5SfhUqavFQrW18UOXKj1mI8xmZwfnfuf
         EfzDnMPEcsYgX6sFyVUMnf3hdM4fI45lca0Rrj5cV32AUaq5t9jV0lazP4e78/99S/nJ
         Lef8/eqNntbxZQpO9/J2ikHmGFccfUHGYXK1Sym3t9RVRhV2bYyOkqPxCgGvN9Sz8naS
         SljA==
X-Gm-Message-State: AOAM533E/qm1MjI3RCTRTCv5GatKznO1rE25sdKAMmy5gpXFidFRxah1
	42InqsIbq7xC1UA/J9FVGgo=
X-Google-Smtp-Source: ABdhPJyemqW4EyjQt67Jy4WtBGwGHgtgq6zSrJohnxe9v0EvhsP5qdKqIJxfQD/Q1yOorqLVmGSUfQ==
X-Received: by 2002:a05:651c:90a:b0:249:5d82:fe9c with SMTP id e10-20020a05651c090a00b002495d82fe9cmr2540794ljq.300.1649967140450;
        Thu, 14 Apr 2022 13:12:20 -0700 (PDT)
Received: from [192.168.1.11] ([94.103.225.17])
        by smtp.gmail.com with ESMTPSA id w27-20020ac2599b000000b004481e254f08sm95301lfn.240.2022.04.14.13.12.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Apr 2022 13:12:20 -0700 (PDT)
Message-ID: <68484555-f763-bc42-eb4c-9cea2ee8dadb@gmail.com>
Date: Thu, 14 Apr 2022 23:12:19 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] staging: rtl8712: fix uninit-value "data" and "mac"
Content-Language: en-US
To: Wang Cheng <wanngchenng@gmail.com>, Larry.Finger@lwfinger.net,
 florian.c.schilhabel@googlemail.com, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20220414141223.qwiznrwgjyywngfg@ppc.localdomain>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <20220414141223.qwiznrwgjyywngfg@ppc.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Wang,

On 4/14/22 17:12, Wang Cheng wrote:
> Due to the case that "requesttype == 0x01 && status <= 0"
> isn't handled in r8712_usbctrl_vendorreq(),
> "data" (drivers/staging/rtl8712/usb_ops.c:32)
> will be returned without initialization.
> 
> When "tmpU1b" (drivers/staging/rtl8712/usb_intf.c:395)
> is 0, mac[6] (usb_intf.c:394) won't be initialized,
> which leads to accessing uninit-value on usb_intf.c:541.
> 
> Reported-and-tested-by: syzbot+6f5ecd144854c0d8580b@syzkaller.appspotmail.com
> Signed-off-by: Wang Cheng <wanngchenng@gmail.com>

This patch will just hide the problematic API in that driver. Correct 
fix is changing usb_control_msg to usb_control_msg_{recv,send}.

IIRC this driver does not want read various length requests, so it 
should be fine




With regards,
Pavel Skripkin
