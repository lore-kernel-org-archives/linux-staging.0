Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9CB1FB8
	for <linux-staging@lists.linux.dev>; Thu, 19 May 2022 03:41:32 +0000 (UTC)
Received: by mail-oi1-f178.google.com with SMTP id q8so5012163oif.13
        for <linux-staging@lists.linux.dev>; Wed, 18 May 2022 20:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:content-language:to
         :cc:references:from:subject:in-reply-to:content-transfer-encoding;
        bh=E+Jeeum5dAYeu7JrVKgmUScX8K6q6nSaD3V1Uo7Z0xo=;
        b=KFjvSCT6GXj5Kr0HO4phTFW0x5Mhrxpol/LwndM9mgk+gt2L/LZ/5khjHvxx9tCYCl
         ccDkePOGAv4JpJmRo0Xqzh6ClQpZnN/1/b7sQl4OHAEBLezdGI2XWE9/o/Z1OZFdJplA
         hvInyanC3HKTFBbmtIho+sxxjhNvtMvXN/SpDUcK6pzwbtXhkX4B8r6bM063uhwPRf2Y
         cRgCWW0s7tOlAD3+MsxhCIYV0WDd/vE6gTqXbb2/O3YdWrgPTUK3f0QWoOCgnNy5j+zJ
         Pm+2UwK0eLGDknVSYV48h5O6crlLJ0idezAZuMW3TB+ty1IBtVt29pHwTXbVrYvZnNon
         S1IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :content-language:to:cc:references:from:subject:in-reply-to
         :content-transfer-encoding;
        bh=E+Jeeum5dAYeu7JrVKgmUScX8K6q6nSaD3V1Uo7Z0xo=;
        b=jPHojdYAFYG1ppguN8K/WmYdY7k0nONqpLY/0NyzAGRVY3aKbyRzO7KutI/iS4edtG
         /v+uEICveVLJd8kw4WenzqVPBoi+vgjpThB+nnOzSFYD1DimLTa62bHJyty6Fi4q/Da9
         LQ3GjtHBGqMHFM8cphLkjRFwby5q9i6pXPp7h600JKNDROkTrPnWBsebQFh5C5B2MvQ3
         kY2peqWFWgQGhoWizg7U80SaznnQQsGx8jdjxJbOrtNjh6nlE4OOSxotGw59yrK/L5Ok
         Xvs8OgWvWE1rOKYq8Ypertux/AwcrtXaVBbKVKkUnW3mHAMgvu99l/mTmDihttp+XXLp
         IXAQ==
X-Gm-Message-State: AOAM533GYVgkltQO8famhuW7yPsPJKVvBgVU6NmxeN7HvEJ5XD0LxtpY
	4RA62jklbTV02fltBlkA9zY=
X-Google-Smtp-Source: ABdhPJzNbyvmXREi3jFpQ1BXha9I4ZZcQvTagfhdtbiKBgx1gr2M0BpSR/Ospfm2JXh/HEBEZ+zfpQ==
X-Received: by 2002:aca:4154:0:b0:322:7a9c:7daa with SMTP id o81-20020aca4154000000b003227a9c7daamr1784072oia.52.1652931691271;
        Wed, 18 May 2022 20:41:31 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id p4-20020aca4204000000b0032694a9925esm1451284oia.10.2022.05.18.20.41.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 May 2022 20:41:30 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <0530d502-1291-23f3-64ac-97bd38a26bd4@roeck-us.net>
Date: Wed, 18 May 2022 20:41:27 -0700
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: kernel test robot <lkp@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-staging@lists.linux.dev, linux-omap@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-hwmon@vger.kernel.org,
 linux-fbdev@vger.kernel.org, kvm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Linux Memory Management List <linux-mm@kvack.org>
References: <6285958d.+Z2aDZ4O1Y9eiazd%lkp@intel.com>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [linux-next:master] BUILD REGRESSION
 736ee37e2e8eed7fe48d0a37ee5a709514d478b3
In-Reply-To: <6285958d.+Z2aDZ4O1Y9eiazd%lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/18/22 17:55, kernel test robot wrote:
> tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> branch HEAD: 736ee37e2e8eed7fe48d0a37ee5a709514d478b3  Add linux-next specific files for 20220518
> 
> Error/Warning reports:
> 
> https://lore.kernel.org/linux-mm/202204291924.vTGZmerI-lkp@intel.com
> https://lore.kernel.org/linux-mm/202205041248.WgCwPcEV-lkp@intel.com
> https://lore.kernel.org/linux-mm/202205122113.uLKzd3SZ-lkp@intel.com
> https://lore.kernel.org/linux-mm/202205172344.3GFeaum1-lkp@intel.com
> https://lore.kernel.org/linux-mm/202205190527.o9wVEvHI-lkp@intel.com
> 
> Error/Warning: (recently discovered and may have been fixed)
> 
[ .. ]
> drivers/hwmon/nct6775-platform.c:199:9: sparse:    unsigned char
> drivers/hwmon/nct6775-platform.c:199:9: sparse:    void

This is getting tiresome. Every driver using outb() on m68k will
experience that "problem". As far as I can see, it is caused by

#define out_8(addr,b) (void)((*(__force volatile u8 *) (unsigned long)(addr)) = (b))

in arch/m68k/include/asm/raw_io.h. I have no idea what the
"(void)" is for, but removing it "fixes" the problem.
Either case, this is not a problem with the nct6775 driver,
nor is it a new problem.

Guenter
