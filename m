Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 814751C30
	for <linux-staging@lists.linux.dev>; Sat,  2 Jul 2022 06:18:01 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id u12so7510781eja.8
        for <linux-staging@lists.linux.dev>; Fri, 01 Jul 2022 23:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=rjnvf2nzoXQy+5nkYCPr1RToUR3goLYUGd5DCz8Akl0=;
        b=dGexRLg1HBZ1ZhUu3cuBoieQIS1Zm4Sby+16+i1RL7oDfoF9MtgOnE5UY0EEMX49Nl
         YrikbJhGEr/gYarhVGhy2yGmGaCL9vIL0iSiq9+HE6edwQET0TjSPU1b/HhcqiJu5H5Z
         IqZQXsk+FYifqNstB3I4ADjX5MYZHhtN2jDFSh8QBtCWGxWhXfkyrTGEEWuKhoVkY1or
         1nYoT5MiXYFkXzrwtO+ToOE6kljWiK1FOjcz8xfx028M/2J01kGKXHK3iRWAQeg7XQtj
         GISx+Kui5A2+M0cgI4IdQQg1ALaNaTx3hULdTyaROe1lLnOFtvPu7WVBwMwTAmrkOrhC
         Y+vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=rjnvf2nzoXQy+5nkYCPr1RToUR3goLYUGd5DCz8Akl0=;
        b=u8q7JTu1/r7Tq9wTlKmAKGx0BccF7+rbDnvtxwLzP3kMxS/kSI+Zzrtyb69atAnesr
         3N5T8DrjhMfVC5DTwLy19pQTL03v9Z0R2puRRg6q7YYEJyG7nmluFEPgwJZnzB4lkcmb
         tj9tNXuzrg3cVAkQOVILwS/u1ttmME1RgVuxtwpla0WPf6yoJ7DKPpmlQekqvm0mahBC
         IS4Ai9uHQ6C2w2IdZt9762plb6w7erj2HCdA9zd83+u+obg6H8twelAMzAVgl5n7ZhqO
         uCYqqHdBL23d/KU9MHngG5R/RXjAG7JQ9WgZ24EDAo2QVufJu9DBkfiN7t2l+hO1xNBW
         OEDw==
X-Gm-Message-State: AJIora9N7+PWOvOkuQJYzHmKJDwQU8ELIv9ijiEqtBqS2NAzjTf5jMgO
	Zru0t7H0Vu27pSE57ThTqJs=
X-Google-Smtp-Source: AGRyM1uIsQFoA54+cAxvUHEltKnhJAmh3FYHcqy7rpcm7PbMXGq5UIfrrzZ0eNLUsMGawYdhc/9J0A==
X-Received: by 2002:a17:906:8a5b:b0:72a:8b2b:c5b4 with SMTP id gx27-20020a1709068a5b00b0072a8b2bc5b4mr6782370ejc.75.1656742679790;
        Fri, 01 Jul 2022 23:17:59 -0700 (PDT)
Received: from ?IPV6:2003:c7:8f2e:6912:39ab:4063:59d3:a7cd? (p200300c78f2e691239ab406359d3a7cd.dip0.t-ipconnect.de. [2003:c7:8f2e:6912:39ab:4063:59d3:a7cd])
        by smtp.gmail.com with ESMTPSA id w13-20020a170906d20d00b00726298147b1sm11213260ejz.161.2022.07.01.23.17.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Jul 2022 23:17:59 -0700 (PDT)
Message-ID: <eeafc6b3-1a47-4729-a4b0-1c841586f6fd@gmail.com>
Date: Sat, 2 Jul 2022 08:17:58 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3 0/6] Staging: rtl8192e: rtllib_wx
Content-Language: en-US
To: Felix Schlepper <f3sch.git@outlook.com>, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 wjsota@gmail.com
References: <cover.1656667089.git.f3sch.git@outlook.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <cover.1656667089.git.f3sch.git@outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/1/22 11:24, Felix Schlepper wrote:
> This series addresses some issues raised by chechpatch.pl
> and some very minor refactoring.
> 
> v2:
>      - The first version, only addressed coding style issues.
>        Now, I additionally refactored rtllib_modes and its uses, since
>        there is no need to use string formatting.
>      - Logically separated one assignement into two. So we dont have
>        'fixed' = 'disabled', which was silly.
> 
> v3:
>      - Fixed a checkpatch.pl warning, which was introduced with patch 1/6.
> 
> Felix Schlepper (6):
>    Staging: rtl8192e: Refactored rtllib_modes
>    Staging: rtl8192e: Avoid multiple assignments
>    Staging: rtl8192e: Remove unnecessary parentheses
>    Staging: rtl8192e: Added braces around else
>    Staging: rtl8192e: Remove unnecessary blank line
>    Staging: rtl8192e: Added spaces around '+'
> 
>   drivers/staging/rtl8192e/rtllib_wx.c | 37 +++++++++++-----------------
>   1 file changed, 15 insertions(+), 22 deletions(-)
> 

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>

Sorry for sending one email for each patch. Next time I will just send 
one mail for one patch series.


When compiling I saw that the driver is divided into more modules. So 
the r8192e_pci.ko is not touched by this patch series.

kernel@matrix-ESPRIMO-P710:~/Documents/git/kernels/staging$ make -C . 
M=drivers/staging/rtl8192e
make: Entering directory '/home/kernel/Documents/git/kernels/staging'
   CC [M]  drivers/staging/rtl8192e/rtllib_wx.o
   LD [M]  drivers/staging/rtl8192e/rtllib.o
   MODPOST drivers/staging/rtl8192e/Module.symvers
   CC [M]  drivers/staging/rtl8192e/rtllib.mod.o
   LD [M]  drivers/staging/rtl8192e/rtllib.ko
make: Leaving directory '/home/kernel/Documents/git/kernels/staging'

kernel@matrix-ESPRIMO-P710:~/Documents/git/kernels/staging$ sudo insmod 
drivers/staging/rtl8192e/rtllib.ko
kernel@matrix-ESPRIMO-P710:~/Documents/git/kernels/staging$ sudo insmod 
drivers/staging/rtl8192e/rtl8192e/r8192e_pci.ko
