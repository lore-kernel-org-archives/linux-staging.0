Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0248168
	for <linux-staging@lists.linux.dev>; Fri, 23 Jul 2021 01:56:37 +0000 (UTC)
Received: by mail-oi1-f179.google.com with SMTP id t14so363396oiw.0
        for <linux-staging@lists.linux.dev>; Thu, 22 Jul 2021 18:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=f5Tj8x/M4U6ampYbsuwsF0GFRXuqhM0kUJh8KBosg4Y=;
        b=aLRYnBgOctErKkAziof/5ga8PoklMUrDGQAAyll1gt5C1rrpM6CTzHHNSrIXJ6KCU8
         vXJOVA0Sr/0pHRecD4EFWIF2NX/EBV379SP3Q+XR1qqa1z+6g5f+0MdBFPoc903G+Vzt
         IbGECGBw4KU/D3UXMGo8YJDOqYk5gABHfWifkHYoD/rY9NNMDLR9bmo5VkuwLbgwXU5I
         lxOe6H/lR1Xq9YbWRTJX3joeVTfuuMdqcCS7LAgdyQ8kLbVQb2CX5x0yEkPN94V7jvdd
         6DLEKSalEicTshHR2h/gG8LNTr9zB53HNSTwwjVpiGKADn0FP25U2tc8ypFkmt1cEiV7
         ndJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:subject:to:cc:references:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=f5Tj8x/M4U6ampYbsuwsF0GFRXuqhM0kUJh8KBosg4Y=;
        b=ubRRYewV0PG13N20QjdcFnkmsADsc67ValbgnfWxy2G3dbDzV2e/Wia2BS4m5+7oce
         KqErealPpkRJGz+MlfujoQSTj+oWv1NatSfimD/C5DTISr/ZdwoKjK2W3VKnoyqDkSLv
         3XZnBhz5pIiHAAmNhlqmp9Uc+Hc5mJM26bA6LOWMyw+8SaD56/XlxdUqfGvePyISJFev
         phTp4D59mkzG/YmUoHUB1RxVb93FlM1dkLszsP1rNv+VhSP5pSbtBd4jW/ZJ0BP6ZKo2
         e2rf0VCnXYPqpeD+m1uDi0ljx13Y7FuIQgiDJ+aUy8kOi0DXcBRx37meUZtBJugdW0gn
         AP7A==
X-Gm-Message-State: AOAM533MNYPaZC6x558rMF/I1r7KVZ7x2sz0cghi7BayWSeEyHfMbCcc
	VsJrFXBRaZnX65OBxEojpK4=
X-Google-Smtp-Source: ABdhPJxHvMvSWrkGs+kLqatInF7BnLPJuMLoqn9QY5GQKvo0G+T/QopqoV01kh5ZMPbgu8Qon1n6vA==
X-Received: by 2002:aca:4587:: with SMTP id s129mr4153169oia.64.1627005397040;
        Thu, 22 Jul 2021 18:56:37 -0700 (PDT)
Received: from 2603-8090-2005-39b3-0000-0000-0000-100c.res6.spectrum.com (2603-8090-2005-39b3-0000-0000-0000-100c.res6.spectrum.com. [2603:8090:2005:39b3::100c])
        by smtp.gmail.com with ESMTPSA id c16sm2518360otd.18.2021.07.22.18.56.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jul 2021 18:56:36 -0700 (PDT)
Sender: Larry Finger <larry.finger@gmail.com>
From: Larry Finger <Larry.Finger@lwfinger.net>
Subject: Re: [PATCH 0/7] staging: rtl8188eu: replace driver with better
 version
To: Phillip Potter <phil@philpotter.co.uk>, gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev, fabioaiuto83@gmail.com
References: <20210723004214.912295-1-phil@philpotter.co.uk>
Message-ID: <630e139c-85e5-f006-6b64-e368847251fc@lwfinger.net>
Date: Thu, 22 Jul 2021 20:56:33 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210723004214.912295-1-phil@philpotter.co.uk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 7/22/21 7:42 PM, Phillip Potter wrote:
> I had to break this patchset up a bit to get around the file size limits
> on the mailing list, and also I removed the hostapd stuff which is
> userspace related and therefore not required.
> 
> The driver currently in staging is older and less functional than the
> version on Larry Finger's GitHub account, branch v5.2.2.4. This series
> of patches therefore:
> 
> (1) Removes the current driver from staging.
> (2) Imports the GitHub version mentioned above in its place.
> 
> There is plenty of work to do to this driver, including to its Makefile,
> but it is at least buildable/usable for now.
> 
> Phillip Potter (7):
>    staging: rtl8188eu: remove existing staging driver
>    staging: rtl8188eu: introduce new core dir for RTL8188eu driver
>    staging: rtl8188eu: introduce new hal dir for RTL8188eu driver
>    staging: rtl8188eu: introduce new os_dep dir for RTL8188eu driver
>    staging: rtl8188eu: introduce new include dir for RTL8188eu driver
>    staging: rtl8188eu: introduce new supporting files for RTL8188eu
>      driver
>    staging: rtl8188eu: attach newly imported driver to build system

Phillip,

Patch 3/7 fails with a
drivers/staging/rtl8188eu/hal/phydm_precomp.h: already exists in error:
working directory. When I deleted the file, the patch applied.

Patch 5/7 fails with a drivers/staging/rtl8188eu/include/hal_data.h: already 
exists in working directory. Again it applied when I manually deleted that file.

Patches 2-6 all have trailing whitespace warnings.

I have started testing. Unfortunately, my GitHub version has a fault in that it 
runs systemd-udevd at 100% of a CPU. So far, I have found that an older commit 
works fine. As soon as I find the fault, I will let you know.

Larry



