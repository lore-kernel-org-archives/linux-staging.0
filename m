Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6F8168
	for <linux-staging@lists.linux.dev>; Wed, 21 Jul 2021 17:33:32 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id j1-20020a0568302701b02904d1f8b9db81so2741089otu.12
        for <linux-staging@lists.linux.dev>; Wed, 21 Jul 2021 10:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=yQvWx8b/PayFmpSQ5Jj9oWmkqMQ/d55eDm4ZHsU3zhY=;
        b=HFp8YubYuMOLAZ/ewztsVazRtJ7+8bJEcmxBW2SRKmFgWYQr4yry154xyQL0lbuVUL
         /iAzsb8orhEs9wHSEPWHpAViwRWWINMWKjA/iEPpw5BaWSeRQGM7g2hTXvVz+AK8L1oi
         DELCXZxZfAk5+hz4YD/m6DTGBC1W5tXO3FPFm6DVVKxpFd8xU4BJcISD2c4PcNPNxnVa
         459LEaWlA5NEDcuAKfhbRPN0rTszigxxzP69qWH/Fsyx4STd/9bOKH8uws+BpJ2ey+O8
         1rDTxT4nU6sbk/nORLkgvDbNDo137Xbra1EtoVxs3zfVbJbslApdo6ZY1zkJZNXuLa/O
         SuDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yQvWx8b/PayFmpSQ5Jj9oWmkqMQ/d55eDm4ZHsU3zhY=;
        b=o8zLNyIcfbKH0x77IQalm1deu+QT9Xp9vqq7Vr3oougXepn/QsdzpJCexrbyB0+ycu
         s1n+Fk2d6sVvv3qoAF4iRyonsYdN/v5a87Xm3YSTAuMm7F8jgaQffnzJ8CqOFgaAy2oC
         4yOQLjhiIPLb+UvyRpYrYGft1u1NQeBCAKqQP/nQDyxRtxBpI9c/el8ZTnMbZq0/WP3T
         4tQP9XCsTUdxlClfq3B4dH4/RFoBUn8In0COZJGB2BYaczLreizNW33N1dFHPFlEmSll
         M/WiWhmav6U6NfsHb0PGDdibKyuMJEbLqsjBooeNTh3i1tfpmoe6Dpvy7aAa1RtrukvU
         lEwA==
X-Gm-Message-State: AOAM532XP/nrKbeUWACVu3G/BbVAly5wNcEKiEFLibxsXVi0GLlyVTv1
	Rt+LR6iDfdHl/rDtdfL5tYU=
X-Google-Smtp-Source: ABdhPJyUaxLg2anHDgpH9X7FfuzT/ZI5iMx+6OfB6fZ0tgZiM2rKFVF/8IIk6gP1Q9WhX74SXCNrLQ==
X-Received: by 2002:a9d:2d83:: with SMTP id g3mr27061302otb.228.1626888812044;
        Wed, 21 Jul 2021 10:33:32 -0700 (PDT)
Received: from localhost.localdomain (cpe-24-31-246-181.kc.res.rr.com. [24.31.246.181])
        by smtp.gmail.com with ESMTPSA id v203sm5134839oib.37.2021.07.21.10.33.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jul 2021 10:33:31 -0700 (PDT)
Sender: Larry Finger <larry.finger@gmail.com>
Subject: Re: [PATCH resend] staging: rtl8188eu: move all source files from
 core subdirectory
To: Phillip Potter <phil@philpotter.co.uk>
Cc: gregkh@linuxfoundation.org, dan.carpenter@oracle.com,
 linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
 fabioaiuto83@gmail.com
References: <20210719224601.255364-1-phil@philpotter.co.uk>
 <7bc43fb0-2dab-190b-c480-9e77cff863d4@lwfinger.net>
 <20210720090035.GB1406@agape.jhs>
 <08a8b372-8ec2-afcc-cc54-305d1dd74a59@lwfinger.net>
 <YPfRf8dgFd+u5hzm@equinox>
From: Larry Finger <Larry.Finger@lwfinger.net>
Message-ID: <0c2d97fa-e1e1-3564-98b8-37d5b9a1a9cb@lwfinger.net>
Date: Wed, 21 Jul 2021 12:33:28 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YPfRf8dgFd+u5hzm@equinox>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 7/21/21 2:49 AM, Phillip Potter wrote:
> Dear Larry,
> 
> Whilst I (and no doubt others) are happy to look into what you've
> suggested, I do have a few questions:
> (1) Why is the version from github not the one in staging?
> (2) On a related note, working on it offline is difficult in terms of
> proving contributions, particularly for a kernel mentee such as myself.
> 
> Might I suggest replacing this driver with the one you suggested
> entirely, so work on it can continue in public? I am happy to submit
> this and continue work if you think it would be viable. Many thanks and
> I appreciate your thoughts on this.

The reason that the newer driver is at GitHub, rather than in the kernel, is 
that I never want to devote the 6 months needed to get it into the shape of the 
old one that I did send to staging. If you take a little time to look at the 
GitHub code, you will see what I mean. I did this once before only to have 
Realtek release a new version with all the old warts again. At least we have the 
fact that this is a heritage product, and Realtek will not be releasing any 
newer drivers.

As is, the code generates very few sparse warnings, but it still contains a 
number of local CONFIG variables that would never be accepted in the kernel. It 
also contains a large number of module parameters that need to be evaluated and 
likely removed.

If you wish, I will give you write access to the GitHub repo so that you can 
make changes there. The numerous users will give you instant feedback if/when 
you break something. If you want to use it to replace the kernel version, go 
ahead. I promise that I will not give negative reviews, but I am sure others 
will have such comments. In any case, I will continue to maintain my repo. There 
are too many users with old kernels, and the backports project is difficult to 
use for their level of expertise.

Larry
