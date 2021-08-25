Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F753FC0
	for <linux-staging@lists.linux.dev>; Wed, 25 Aug 2021 12:17:11 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id i9so52486695lfg.10
        for <linux-staging@lists.linux.dev>; Wed, 25 Aug 2021 05:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=zCxZkeEen3d25W+uS0Sr+vZJbSneoSqKjRT90Qz8wDY=;
        b=EoeO8sZSweVS76zmvaXo7TSanEDmUv72pgj1aVfwGzvdSvJ5l7aV2BjFf55W+p7QMz
         w1GK6WecmUbmp5EkVBEbUG+eJfq+2DSacwK7pk23bmQm/FLDsp5n2kP/vsSh9HtCIgPI
         FEbSifT8MdNygUuqGCXzkbmnKygM93LG9WwPDrqqi09jPxvacewoiJLZnA+j6vpdGOIL
         20gI7OoyI8Sx61FkDKuIwBPviAxbqwndHLelanQIdK7bBuJxZJGL39h0+VjatdIsiSDZ
         r1EB9yLI8ahyi0uNez9/69sMHonnu599OXrROV+b4R8dFCbnYv5ZeMXCWBjqzQVq7+Ew
         T/uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zCxZkeEen3d25W+uS0Sr+vZJbSneoSqKjRT90Qz8wDY=;
        b=Cxnecyi7BBYlYT068Zl7PZ2F807spN4XGyC+tqHjry8F9FtFS4wqfTh97TJ4flwmZL
         cUayK71UCDKgU9mpSFMFLbxzQUWF8jUQ4KTPa00tHckwhIO1ePSZ8JbAUrvtRdP1fVPm
         AoYR4fAOF9fp6ozzUj+sqeavzoMHs0+nZb5J9hUMZjaWWkRKdEwt64AAZ9LLApIr1yCL
         tiO6wy68zZrDxBr6O2HdYreSAf/zdvwy6Sp6rKVEk5lP7Sv4RPz4Y+2KQ91dh2iToYsn
         yUGSl6bWmpbWn2xw8evmKBwzf/6qNRdOKxgMLWZPOPp4vOYBpvl2QL9hGxlOQHRasYx0
         4Lcw==
X-Gm-Message-State: AOAM532wHIWWo51cHGnG3wRWsX7TysmdikN8TUkt/9txXz/A4HldDD+j
	aSuLMJAira/3YDd/KRYWQ1o=
X-Google-Smtp-Source: ABdhPJyjerkngXehWGPpCZZXFm5N8uM7hy/38Z2QEwNLyguybS3fLnfdp+9QV1lXkXIRB60w6ANvOQ==
X-Received: by 2002:a05:6512:3391:: with SMTP id h17mr31707375lfg.173.1629893829901;
        Wed, 25 Aug 2021 05:17:09 -0700 (PDT)
Received: from [192.168.1.11] ([46.235.66.127])
        by smtp.gmail.com with ESMTPSA id bt38sm2049619lfb.213.2021.08.25.05.17.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Aug 2021 05:17:09 -0700 (PDT)
Subject: Re: [PATCH v3 3/6] staging: r8188eu: add error handling of rtw_read8
To: kernel test robot <lkp@intel.com>, Larry.Finger@lwfinger.net,
 phil@philpotter.co.uk, gregkh@linuxfoundation.org, straube.linux@gmail.com,
 fmdefrancesco@gmail.com
Cc: clang-built-linux@googlegroups.com, kbuild-all@lists.01.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <c59d5d850bf9aab208704182c83086609289cb9c.1629789580.git.paskripkin@gmail.com>
 <202108251911.Vwmzl4rI-lkp@intel.com>
From: Pavel Skripkin <paskripkin@gmail.com>
Message-ID: <9743e1ee-75f4-6231-427b-8c7f659fb252@gmail.com>
Date: Wed, 25 Aug 2021 15:17:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202108251911.Vwmzl4rI-lkp@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/25/21 3:05 PM, kernel test robot wrote:
> Hi Pavel,
> 
> Thank you for the patch! Yet something to improve:
> 
> [auto build test ERROR on staging/staging-testing]
> 
> url:    https://github.com/0day-ci/linux/commits/Pavel-Skripkin/staging-r8188eu-remove-read-write-_macreg/20210824-162756
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git 093991aaadf0fbb34184fa37a46e7a157da3f386
> config: arm-buildonly-randconfig-r001-20210825 (attached as .config)
> compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project ea08c4cd1c0869ec5024a8bb3f5cdf06ab03ae83)
> reproduce (this is a W=1 build):
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # install arm cross compiling tool for clang build
>          # apt-get install 11.1.1
>          # https://github.com/0day-ci/linux/commit/d4e4bbed4e59df37967086f60fe92cb1b4504d37
>          git remote add linux-review https://github.com/0day-ci/linux
>          git fetch --no-tags linux-review Pavel-Skripkin/staging-r8188eu-remove-read-write-_macreg/20210824-162756
>          git checkout d4e4bbed4e59df37967086f60fe92cb1b4504d37
>          # save the attached .config to linux build tree
>          mkdir build_dir
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross O=build_dir ARCH=arm SHELL=/bin/bash drivers/staging/r8188eu/
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>>> drivers/staging/r8188eu/hal/usb_halinit.c:2022:3: error: expected expression
>                     u8 tmp;
>                     ^
>     1 error generated.
> 
> Kconfig warnings: (for reference only)
>     WARNING: unmet direct dependencies detected for QCOM_SCM
>     Depends on (ARM || ARM64) && HAVE_ARM_SMCCC
>     Selected by
>     - ARM_QCOM_SPM_CPUIDLE && CPU_IDLE && (ARM || ARM64) && (ARCH_QCOM || COMPILE_TEST && !ARM64 && MMU
> 
> 

We need to fix Kconfig, ok, I will take a look at it later

> vim +2022 drivers/staging/r8188eu/hal/usb_halinit.c
> 

>    2020		case HW_VAR_BCN_VALID:
>    2021			/* BCN_VALID, BIT(16) of REG_TDECTRL = BIT(0) of REG_TDECTRL+2, write 1 to clear, Clear by sw */
>> 2022				u8 tmp;

Hm, I don't know anything about ARM compilers, so should I wrap this 
code block with {}?

My local gcc 11.1.1 (x86_64) does not produce any warnings/errors

>    2023	
>    2024			error = rtw_read8(Adapter, REG_TDECTRL + 2, &tmp);
>    2025			if (error)
>    2026				return;
>    2027	
>    2028			rtw_write8(Adapter, REG_TDECTRL + 2, tmp | BIT(0));
>    2029			break;
>    2030		default:
>    2031			break;
>    2032		}
>    2033	
> 



With regards,
Pavel Skripkin
