Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B49723FCD
	for <linux-staging@lists.linux.dev>; Sat,  4 Sep 2021 20:41:45 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id jg16so5160854ejc.1
        for <linux-staging@lists.linux.dev>; Sat, 04 Sep 2021 13:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lFrmrzYdi4W9e05rZQyIefjI/ECSxbcxYQllGrHvMCg=;
        b=B0Z6m3EEkmYaeB0NxXr0zIH17/0/9gVvynrZc4f+uYbPozTISUs3B1mPr7AwYYAQr8
         Q3jBlroT+bOU+6l4FcfgYkd98mmA6FLmJ4TtHL5Q3rDX7bc9Rtrdd9Ud3td7ng8Eg6bk
         ZLc0EAOQoEWqhEodV+9A3Kclx79CkCVz3KUTsZW7kAF5OLY/NmaD9L3YSACuz2P1Nhll
         bwVvWUekDrsHG28XHdG9aFzA1OCGAQcGphVcSSiToXI5QWYui/tUe+Wkg3UM2kMXK7ad
         p//z9SKxYx99GHV8HUwJ2H8rKsD/nDqWmNWz1X+7PLXEmsi7iwv1t3d5yb+5UtKaS7Ng
         Lezw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lFrmrzYdi4W9e05rZQyIefjI/ECSxbcxYQllGrHvMCg=;
        b=dkmlbldP8atq3pBAYlifyfZJTwVt7xhqPPt4g8Xq3Ky8Nd9fu1CG5NyBip7uIqFO4x
         RiZQliCqGSZg8LFk4Zr+uyvNwXFZ2n+NX6lPVyWuSiamXSCOdZHAwRSg9BcGdSr+mirE
         tpWABXE5P4q/N02brBi/+l5CBgakfZP83Yhup1VxiY3oiff7oCNcrof591+8V858FnfL
         44V8OetDEYA8rdhlhzyzKjgAups7cDvUQXGqgK3AWtzU+Jzz7/IFpRmJpkL5ZEZfbsqB
         eBTRDk47mpWlJfWAuaZEFXj0XPPlYnHPCF3bT/LIDm3h6t3Xf0SEbqXhETlzU0QNzkZi
         qi3w==
X-Gm-Message-State: AOAM533A1Dxwagrslylbo56sy/y35HRwsUwQBzKAEntq3T66EwioaCf5
	cYqxVBsPma2rsW65kCX7Zps=
X-Google-Smtp-Source: ABdhPJxiSqnDZgkoMQ1RWDgSU3bxKLT9uacc3Q13nxfYCAaGFQxz88qrVNX+8deihPMXKkFfeHoA4w==
X-Received: by 2002:a17:906:3fc1:: with SMTP id k1mr5824741ejj.44.1630788103998;
        Sat, 04 Sep 2021 13:41:43 -0700 (PDT)
Received: from localhost.localdomain (host-79-23-101-208.retail.telecomitalia.it. [79.23.101.208])
        by smtp.gmail.com with ESMTPSA id n2sm1854806edi.32.2021.09.04.13.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Sep 2021 13:41:43 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>, Phillip Potter <phil@philpotter.co.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Pavel Skripkin <paskripkin@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>, kbuild-all@lists.01.org
Subject: Re: [PATCH 3/3] staging: r8188eu: Shorten calls chain of rtw_write8/16/32/N()
Date: Sat, 04 Sep 2021 22:41:41 +0200
Message-ID: <2791328.7pjKATJfGa@localhost.localdomain>
In-Reply-To: <202109050113.Uyg2SCTW-lkp@intel.com>
References: <20210904150447.14659-4-fmdefrancesco@gmail.com> <202109050113.Uyg2SCTW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="ISO-8859-1"

On Saturday, September 4, 2021 7:09:58 PM CEST kernel test robot wrote:
> Hi "Fabio,
> 
> Thank you for the patch! Yet something to improve:
> 
> [auto build test ERROR on staging/staging-testing]
> 
> url:    https://github.com/0day-ci/linux/commits/Fabio-M-De-Francesco/
staging-r8188eu-Shorten-and-simplify-calls-chain/20210904-231010
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git 
fde4862d1ac7100028da4371d92454fec6cf3f4f
>
> [...]
>
> All errors (new ones prefixed by >>):
> 
>    drivers/staging/r8188eu/hal/usb_ops_linux.c: In function 'usb_write':
> >> drivers/staging/r8188eu/hal/usb_ops_linux.c:105:47: error: 
'REALTEK_USB_VENQT_SEND' undeclared (first use in this function); did you 
mean 'REALTEK_USB_VENQT_READ'?
>      105 |                                               
REALTEK_USB_VENQT_SEND, value,
>          |                                               
^~~~~~~~~~~~~~~~~~~~~~
>
Hello to all,

I apologize for this easily avoidable mistake. I'm about to post the v2 
series.

However, I write this message to affirm that Pavel's tests on this patch are 
still valid and confirmed because his copy *has* the right parameter that is 
REALTEK_USB_VENQT_WRITE.

It's all my fault. Pavel warned me that during the review and test he noticed 
that I had written REALTEK_USB_VENQT_READ and obviously my build was 
successful because it was a symbol known to the compiler.

Pavel successfully changed his local copy and I (independently) changed mine 
without thinking about rebuilding. I was absolutely certain it was the 
expected parameter (perhaps the function name - usb_control_msg_send () - 
played a part in leading me to this stupid mistake).

In summary, first I want to apologize for the noise, secondly I want to 
apologize to Pavel who is co-author and tester of this 3/3 of our series.

Regards,

Fabio



