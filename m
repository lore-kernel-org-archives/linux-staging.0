Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228047A
	for <linux-staging@lists.linux.dev>; Thu, 14 Apr 2022 15:48:35 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id 88-20020a9d0ee1000000b005d0ae4e126fso3659594otj.5
        for <linux-staging@lists.linux.dev>; Thu, 14 Apr 2022 08:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=gNYhNOwWsPMWWIjh4znKGHbGnF3f5saGDocombsGcQs=;
        b=T5Q6ylrSXWbi1gB06EGn5ez6ONSx5hgEiLU0Q2LdC77NBM33vhSn2r+Xu7sUzpzekb
         NmXg46p21ji37vW0tC+WHmUkWviZFb5ht0eVDKIwI0laQfK9A+eQwdnw3Erhqfbhh1MF
         8lsapwF0uiJXqyRuYo0L6yeVpQ9OjrCyP2Ly2GL2Y0VGQS1X+fbV52c9krywCsj1rSRO
         3yEZmFvFMaKja8SDEufqMXdLdLDlbWJJ1/NsrLBdcz6oxelp5KjaIHuhaU506eZlIV/Q
         j2sPioebeUQiCbzAu5BzRk6j6U+7mD8d4pXXY7gx6V+juGGqKP30Sb4mj4WIq/lfkeSI
         rizA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=gNYhNOwWsPMWWIjh4znKGHbGnF3f5saGDocombsGcQs=;
        b=cI9kDsVCSwSzyzVSKnHOL4wMqhRcGh4ki6cchapYQ86FBqiMeSu5EDQfgiY2I+Qy2t
         pxSUZCh042gobwSfgIE2tqpI9Ye8QIcCBMv+7m/dP/MchFIJ5pFVf+bRWIOtgBPAXLS0
         v3FP+kF0oW23Dn56tI6DQ2JAsWE8JcweDddnF7X09NbBeTSbdhVIBtdGczSBRXHXgbij
         09nTeoHwFWlY77+o0sp4nloSA54NC5ksRl9dkkb/pCxxlEmtzZb37XpvY/ZvPuaLgX72
         jbFQ+lO3WcWrIXnz0VVNoCBk11tcLsoCLZ9ZZSvippDGVos2yKbYLNVE/VHOoiKBtZyP
         vLxg==
X-Gm-Message-State: AOAM533appo4Dzr4L24f7HMj0ZV9JfMCs8POfbLq4jlDJIXzOWM23I5e
	8F/PuJxRicTHDZc5vBgH/gU=
X-Google-Smtp-Source: ABdhPJyHlQ/FlSjp07ypkqiIpCKV/bHSNJPQvAMtEaa5juBrYZtbnPpgBQ8fzekpzBJOid9Tl6FxhQ==
X-Received: by 2002:a9d:7f19:0:b0:601:3f9c:4d1f with SMTP id j25-20020a9d7f19000000b006013f9c4d1fmr896557otq.178.1649951314269;
        Thu, 14 Apr 2022 08:48:34 -0700 (PDT)
Received: from ?IPV6:2603:8090:2005:39b3::100e? (2603-8090-2005-39b3-0000-0000-0000-100e.res6.spectrum.com. [2603:8090:2005:39b3::100e])
        by smtp.gmail.com with ESMTPSA id cy36-20020a056870b6a400b000e2c5d0c2bdsm795897oab.7.2022.04.14.08.48.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Apr 2022 08:48:33 -0700 (PDT)
Sender: Larry Finger <larry.finger@gmail.com>
Message-ID: <4ecf7d12-0ad9-5055-75c3-adf6e97c67cf@lwfinger.net>
Date: Thu, 14 Apr 2022 10:48:32 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 0/8] staging: r8188eu: fix and clean up some firmware
 code
Content-Language: en-US
To: Michael Straube <straube.linux@gmail.com>, gregkh@linuxfoundation.org
Cc: phil@philpotter.co.uk, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20220414104323.6152-1-straube.linux@gmail.com>
From: Larry Finger <Larry.Finger@lwfinger.net>
In-Reply-To: <20220414104323.6152-1-straube.linux@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/14/22 05:43, Michael Straube wrote:
> This series fixes wrong size of struct rt_firmware_hdr in the first
> patch and does some cleanups in rtl8188e_firmware_download() in the
> other patches.
> 
> Tested on x86_64 with Inter-Tech DMG-02.
> 
> v2:
> Added a patch to check size of struct rt_firmware_hdr at compile time.

Please wait a while before submitting new versions until those of us in time 
zones further west get a chance. My objections to the logging change still apply.

NACK

Larry

