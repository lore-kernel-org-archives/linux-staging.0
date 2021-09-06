Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ABC072
	for <linux-staging@lists.linux.dev>; Mon,  6 Sep 2021 18:38:29 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id q3so10568045edt.5
        for <linux-staging@lists.linux.dev>; Mon, 06 Sep 2021 11:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=5qxOSUsAvpDHSMLpGbVT+4MUrgaqCQsk57usbM5FUQA=;
        b=oS1pJaJNmoKNUp3OAGHbYYPiDbcwyH4364r5pn/7SRLQvOUU3JWcM9TbyfYQFuznI3
         sCCLZDQ/HkGPU6uwzExVsF4qvRTRRMx+QTSrm5py4ybdu3fQMnWNZx/yqMBAIbKciY97
         cLHwWAUevCOBqtcrOWhD3YN4kPTzD1EdB7w7TF6VgPBFSsraPj3oYFosmVvFJVpgWoN4
         vLvPU2CSqG9WsjxRMgLpdHZxER4DOxV94LxELhhsBARaGtWGr97CoriAdpLJi4MJWAOG
         bjuVhCH9nY8WJUfrXf5clF/cQQjjyCBpAjwsNmxU+bge4I9XC63Qdy6TYnk0b+SrCtGy
         KzXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=5qxOSUsAvpDHSMLpGbVT+4MUrgaqCQsk57usbM5FUQA=;
        b=OUI40KANt3O9xbxz6zXTUgvSm8npzbEo+nz/t6BKwbjQOtYRrtQ9I9IVXEmdsmkzNB
         e5nrz1MLD6hh26OpACjBJNkl0Rz7fFdeIi5HUu44hQx9x1I/oqK/U50j3DzBkVkwYELq
         RlbvyAMJaoPWLM648amm7AZ8d6bsL8/ol3qwZxS03OdsAtuzLUQY3TZ/fqwJr5rBt1pQ
         XbzIi3Yj1N4+yCWWnoGAlhgpXDghmap2NxP2LIg4j0xjmULsaT8HNwY0pb/KClKiCORt
         rYqxhrZ0+PaglAhKai4WWD6YTbAXibwbH3er3IND9Cuy39c/j8es89+/P3G5KJN8y3Bn
         YwIg==
X-Gm-Message-State: AOAM5324DfmGCPbAG5V9YQpANuCPvoHxNe0HnsrhKrYUz5Hdqji83Lxl
	7NgTl/DbJ24GJyKg361Z1pE=
X-Google-Smtp-Source: ABdhPJwpoEZWa4qVwaKDjw3npiXsKUEdhmQzDxp74swm3Ht6EjZvBjb3PAvJ1JJuxE//ph7uUcf98g==
X-Received: by 2002:a05:6402:350d:: with SMTP id b13mr14569940edd.1.1630953507637;
        Mon, 06 Sep 2021 11:38:27 -0700 (PDT)
Received: from ?IPV6:2a02:8108:96c0:3b88::8fe1? ([2a02:8108:96c0:3b88::8fe1])
        by smtp.gmail.com with UTF8SMTPSA id r11sm4355205ejy.71.2021.09.06.11.38.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Sep 2021 11:38:27 -0700 (PDT)
Message-ID: <a762c010-e6b3-6fed-30e9-1520664b6b25@gmail.com>
Date: Mon, 6 Sep 2021 20:38:26 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.0.1
Subject: Re: [PATCH 00/40] staging: r8188eu: remove function pointers from
 struct hal_ops
Content-Language: en-US
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk, martin@kaiser.cx,
 fmdefrancesco@gmail.com, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20210906182438.5417-1-straube.linux@gmail.com>
From: Michael Straube <straube.linux@gmail.com>
In-Reply-To: <20210906182438.5417-1-straube.linux@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/6/21 20:23, Michael Straube wrote:
> In order to get rid of the HAL layer this series removes the next
> bunch of function pointers from struct hal_ops.
> 
> Also it removes some empty functions and cleans up some minor style
> issues I stumbled upon.
> 
> Tested on x86_64 with Inter-Tech DMG-02.
> 

Ouch, although I've checked everything, starting with patch 20 there
is a typo in the commit messages. The word 'from' is missing. :(

I'll fix it and send v2, sorry.

Michael
