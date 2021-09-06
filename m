Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295A23FC0
	for <linux-staging@lists.linux.dev>; Mon,  6 Sep 2021 16:40:09 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id v1so4201206plo.10
        for <linux-staging@lists.linux.dev>; Mon, 06 Sep 2021 09:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Id4IX7WNAacgPXIphmc2k5gyC+m0hiqYBkdrE/MPtks=;
        b=kBCfkgdYuVEn/boyOC/8CVOCiHUy5PqQ0EddIOm/b2kYpY1vS6UxJrOeatra2KToIv
         sXuwihBL1wN0qexKUNEF7rHpdNl6IRu/6EWw+cLutG4aoOIfDARjB8fJYsDDY73vNqlO
         QV+rmJrXUvEY51I0erAEkkjCVLXG6IY7Ih0a7z28pT2hwthMQ3mPrWSk7NvUCeuQigUq
         rBDr0aAAAbCN09oMLNWLHsB/jW8DEMKt4i3y1ryx67yjzGcQhVzuiRomlKMABOKymhj3
         CImmTJcXKop9ODoNWBmf4UdHtDLzG+kqlctlGX/gb6msUXnJMzvP7jjkN1XkCxLQhURg
         jWgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:cc:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Id4IX7WNAacgPXIphmc2k5gyC+m0hiqYBkdrE/MPtks=;
        b=nfft6C580nXxLhl0M9QS94WL7rEdvMd8oA9lZk1fZk00IeXzg7XSQtLtKyuncO/W4g
         bgTdXjCathH/XDC6IB9eLevKyhI5L0nodnxk0lNclNXFYMwPCXRx8CZ1BEf3yPqvPcBZ
         Q1tLApqKUgC7dhpNWhTQ/UI6IV+Qpw3kbBpUY2FfNHYIqZMvGQ6f55AtVihkHeXPHVhb
         u/Cd35T/nOjN15ACBxSrHG0pjtPnCZaGpz6KYjaSnUQ7DgmGA6YTmoG4yciUtA5f+4YC
         ik0lu2GELaeBabKt/eOCTqSKydR2xeYbB9UUwp2n9b1z+tv/oteBZ0k6CgTGIt+kgf+A
         NUxA==
X-Gm-Message-State: AOAM532deGyOtbGSPbdCq0y5aAvtYkNJ913Z1/1rCNdoSQh42C1vxDL3
	r0AFDUqs0/8VRWn8Ov2JSFY=
X-Google-Smtp-Source: ABdhPJy9FY92iSOiLR5dF/Ju7R1WHruQJ2enjFHx1DshRbyipXCPqOomp/NfxJ5To0JHWI+o14qVcg==
X-Received: by 2002:a17:90a:9b13:: with SMTP id f19mr15375pjp.224.1630946408627;
        Mon, 06 Sep 2021 09:40:08 -0700 (PDT)
Received: from [192.168.1.6] ([117.98.200.228])
        by smtp.gmail.com with ESMTPSA id h16sm8008282pfn.215.2021.09.06.09.40.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Sep 2021 09:40:08 -0700 (PDT)
Cc: saurav.girepunje@hotmail.com, Larry.Finger@lwfinger.net,
 phil@philpotter.co.uk, straube.linux@gmail.com, fmdefrancesco@gmail.com,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: r8188eu: core: remove duplicate structure.
To: Greg KH <gregkh@linuxfoundation.org>
References: <YTSj7upqzTiccWH2@user> <YTYchKn/l3GboOsd@kroah.com>
From: Saurav Girepunje <saurav.girepunje@gmail.com>
Message-ID: <4537b0fd-848e-5188-823b-3a3bb750391d@gmail.com>
Date: Mon, 6 Sep 2021 22:10:04 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YTYchKn/l3GboOsd@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 06/09/21 7:19 pm, Greg KH wrote:
> On Sun, Sep 05, 2021 at 04:33:10PM +0530, Saurav Girepunje wrote:
>> Remove duplicate structure mlme_handler and action_handler. Both
>> structure are having same member. Replace it with mlme_action_handler.
> 
> Why merge both names together?  Why not just pick one name and stick
> with that if they really do the same thing?
> 
> thanks,
> 
> greg k-h
> 

Yes, we can pick one name also . I think action_handler name will be better.

Thanks for review Greg,


Regards,
Saurav Girepunje
