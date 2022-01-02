Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C294173
	for <linux-staging@lists.linux.dev>; Sun,  2 Jan 2022 18:41:16 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id d9so66098773wrb.0
        for <linux-staging@lists.linux.dev>; Sun, 02 Jan 2022 10:41:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=tShDbYknZRWS4YLp1TQWmgakh1Xx5r6yUGEJ8fPlufM=;
        b=KT1w8ru6khj009b2hhJSG+gmT9S2sh+TI+IC0XSmz5/a8YvlQD1is3MFEjGtPRbkzL
         qxo9N0eB9cd8U65sUkhbyD7CC5mLDQtbLM0+BTZ2NQvl9XXnUhmcRiMRTplU15reqs1A
         0vZ2oMuUhPHP541+0MiWGLXZqFoSrvb2j4mUa0td8puRYZtQMgn1CYZjSCPXidAJHcGh
         IABazWv+OY/w24UGF6j2pu1BYESyngrg19tEzG0p939EuMVtm2oebyHx4PtSyf+1O0PL
         b60Q+iMde0KCQ2gZNO2suYmqEcKwemJ49rr0OooZVZ2tWuU8111/coVS0YhF2C6hM9Kb
         y4DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=tShDbYknZRWS4YLp1TQWmgakh1Xx5r6yUGEJ8fPlufM=;
        b=QVV21+fvlJWM46iHPO/Ct7BqzRDSRFO05yM7Fyl45Iqm8lEpIry/+wn143qjyPAxBR
         VqRT99wuxA6qmEfSUNNoEu0nIC5UjlvrwZkWwF6VFGQi6ICpKkbP1EC0IyYoSF0T3veD
         Q1olfw2APrT1Y4zSM4fqxcpxCMSJxv1ZLfoezpZ1Ury6fm6uEQKv/GeFUmKQHpO+toiq
         d12uhlHxgOG60xy7haslEKPSOrrbawMEevg+zBPtvmZocrXy3UZiQHVKeuELHZUtI+qb
         9ZYBSxq+LfvWWDMdLr3wbsXTFZPiUgcbCax0qrcWW+aRhcxtKQryaYguLNulg36WvRiD
         WsBA==
X-Gm-Message-State: AOAM5305JAU71mj4KxByDWinYOryy3DtiaN7uVWScvdH3fRWTUy0Ufos
	sLxVexhC5/piB7vhtZ/7p/U=
X-Google-Smtp-Source: ABdhPJwGzVTO3MmfHrAdE+ZI+yg060sdsonun9deEPMt3V7tGLIQ2Xs2Ex44QO2xbPCkYcj5KPFwGg==
X-Received: by 2002:a5d:56c2:: with SMTP id m2mr36334359wrw.313.1641148874773;
        Sun, 02 Jan 2022 10:41:14 -0800 (PST)
Received: from ?IPV6:2a02:8108:96c0:3b88::d7e8? ([2a02:8108:96c0:3b88::d7e8])
        by smtp.gmail.com with ESMTPSA id z11sm39696846wmf.9.2022.01.02.10.41.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Jan 2022 10:41:14 -0800 (PST)
Message-ID: <1821100d-c647-5237-de4a-b96bde556c5e@gmail.com>
Date: Sun, 2 Jan 2022 19:41:13 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH 0/5] staging: r8188eu: some trivial cleanups
Content-Language: en-US
To: Martin Kaiser <martin@kaiser.cx>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20220102175932.89127-1-martin@kaiser.cx>
From: Michael Straube <straube.linux@gmail.com>
In-Reply-To: <20220102175932.89127-1-martin@kaiser.cx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/2/22 18:59, Martin Kaiser wrote:
> Remove unused variables and defines in several places.
> 
> Martin Kaiser (5):
>    staging: r8188eu: remove unused power management defines
>    staging: r8188eu: internal autosuspend is always false
>    staging: r8188eu: fix_rate is set but not used.
>    staging: r8188eu: cmd_issued_cnt is set but not used
>    staging: r8188eu: turbo scan is always off for r8188eu
> 
>   drivers/staging/r8188eu/core/rtw_cmd.c        |  3 ---
>   drivers/staging/r8188eu/core/rtw_pwrctrl.c    |  9 +-------
>   drivers/staging/r8188eu/hal/rtl8188e_dm.c     |  1 -
>   drivers/staging/r8188eu/hal/rtl8188e_rf6052.c | 21 +++++++------------
>   drivers/staging/r8188eu/include/drv_types.h   |  2 --
>   drivers/staging/r8188eu/include/rtw_cmd.h     |  1 -
>   drivers/staging/r8188eu/include/rtw_pwrctrl.h |  5 -----
>   drivers/staging/r8188eu/os_dep/ioctl_linux.c  |  6 ------
>   drivers/staging/r8188eu/os_dep/os_intfs.c     |  4 ----
>   drivers/staging/r8188eu/os_dep/usb_intf.c     |  3 +--
>   10 files changed, 9 insertions(+), 46 deletions(-)
> 

Looks good to me. For all patches:

Acked-by: Michael Straube <straube.linux@gmail.com>
