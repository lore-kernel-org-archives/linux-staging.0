Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679627F
	for <linux-staging@lists.linux.dev>; Tue,  2 Aug 2022 18:03:20 +0000 (UTC)
Received: by mail-oi1-f180.google.com with SMTP id i4so17416916oif.2
        for <linux-staging@lists.linux.dev>; Tue, 02 Aug 2022 11:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc;
        bh=GNoHkmqZpKx9Pktw11GIbNQ2bhjivWnkaFbnDxeXjko=;
        b=Udpqm0u/iKCRrsXn0zwaQsyNbevqIDy0JDzIIAcMh0IK1K/IwgtExogFGRWKiWTGtI
         uFfjjNke+0eMux5masDyDxE8wI85IacWFitHG7istD/kZT4u5nGWrNT2MsvqaPsjeDeE
         oDj1nrKjgBWFF5lT0nE8EDsaoMJeW5ouqZ1zlDb2KbDmKyj0sUtFb2nZ2T4GFw2aIrya
         apox241/J0FPpHvJKf4/USJnw37uXh1wPG3DnsrVXW3FuIUREHbbI6THvb/sQwxE1o+9
         A5/zD3/7GUypSEJVUVocU/5eWQgDnt5c4gtSzgAIBNCIL0r5kPKkpyVqAtnU+wFqiJf6
         R0XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc;
        bh=GNoHkmqZpKx9Pktw11GIbNQ2bhjivWnkaFbnDxeXjko=;
        b=TX8lnEGaNSxJRDns/j/3wzopjPuKiSC6dp5mhtRBhSKvBW76D+yFk5VOTK6ygEQ4qG
         T1OXqTq1Y4MCYCjNQTx3cuPgyFyhVSZxIOmeva+QSoLhAts88os71oHv2hiHXpRfcvel
         mJ5IuJ3PgwHDN1CSDUg7T5xW0DMzK6Ww1BDR7/kKUV6yn2aEZFdVHXrhpmrE8zrY9iyR
         zJf2sme8Lz7zmcmzkvHG35RwwN/jV7RkZm56Xcl7EyUQ6lG8iXTVZU8DyHhfMOcYHMKV
         ObDRqhe9zoaHpeQpCOuJg/q4d5lt+d8tZC6nrx91AZOaxF84QoiYxhA5KvhdwgwLJDeM
         3xLg==
X-Gm-Message-State: ACgBeo0E97yLrvomtZB4x+askC4KT8NHQP0KOlARCr+As0l9+9aP5yXK
	Sx3F5PJWyZUKdZ4eTzYGaTg=
X-Google-Smtp-Source: AA6agR6tKINKcuOaNVqYuLToWlaaeWaMIPBLG88vYHrun7FOyb6H5HO1ZUxOuFlhlSi5vMZ/8Pw79A==
X-Received: by 2002:a05:6808:bca:b0:33b:2275:27b8 with SMTP id o10-20020a0568080bca00b0033b227527b8mr290247oik.180.1659463399472;
        Tue, 02 Aug 2022 11:03:19 -0700 (PDT)
Received: from [192.168.1.108] ([216.130.59.33])
        by smtp.gmail.com with ESMTPSA id d13-20020a9d5e0d000000b006359cd3e3b0sm836323oti.77.2022.08.02.11.03.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Aug 2022 11:03:18 -0700 (PDT)
Sender: Larry Finger <larry.finger@gmail.com>
Message-ID: <a94b833a-2f3c-a5ba-f2e4-7c7ef0d1e862@lwfinger.net>
Date: Tue, 2 Aug 2022 13:03:17 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] staging: r8188eu: add firmware dependency
Content-Language: en-US
To: Grzegorz Szymaszek <gszymaszek@short.pl>, Greg KH <greg@kroah.com>,
 Phillip Potter <phil@philpotter.co.uk>, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <YukkBu3TNODO3or9@nx64de-df6d00> <YukvnVWuhUeOgRyZ@kroah.com>
 <Yukx8KEEOhKTJ7HQ@nx64de-df6d00>
 <c82114b6-1003-bfb5-0550-98dcbf1a3761@lwfinger.net>
 <YulcdKfhA8dPQ78s@nx64de-df6d00>
From: Larry Finger <Larry.Finger@lwfinger.net>
In-Reply-To: <YulcdKfhA8dPQ78s@nx64de-df6d00>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/2/22 12:18, Grzegorz Szymaszek wrote:
> The old rtl8188eu module, removed in commit 55dfa29b43d2 ("staging:
> rtl8188eu: remove rtl8188eu driver from staging dir") (Linux kernel
> v5.15-rc1), required (through a MODULE_FIRMWARE call()) the
> rtlwifi/rtl8188eufw.bin firmware file, which the new r8188eu driver no
> longer requires.
> 
> I have tested a few RTL8188EUS-based Wi-Fi cards and, while supported by
> both drivers, they do not work when using the new one and the firmware
> wasn't manually loaded. According to Larry Finger, the module
> maintainer, all such cards need the firmware and the driver should
> depend on it (see the linked mails).
> 
> Add a proper MODULE_FIRMWARE() call, like it was done in the old driver.
> 
> Thanks to Greg Kroah-Hartman and Larry Finger for quick responses to my
> questions.
> 
> Link: https://answers.launchpad.net/ubuntu/+source/linux-meta-hwe-5.15/+question/702611
> Link: https://lore.kernel.org/lkml/YukkBu3TNODO3or9@nx64de-df6d00/
> Signed-off-by: Grzegorz Szymaszek <gszymaszek@short.pl>
> ---
>   drivers/staging/r8188eu/os_dep/os_intfs.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/staging/r8188eu/os_dep/os_intfs.c b/drivers/staging/r8188eu/os_dep/os_intfs.c
> index 891c85b088ca..5bd3022e4b40 100644
> --- a/drivers/staging/r8188eu/os_dep/os_intfs.c
> +++ b/drivers/staging/r8188eu/os_dep/os_intfs.c
> @@ -18,6 +18,7 @@ MODULE_LICENSE("GPL");
>   MODULE_DESCRIPTION("Realtek Wireless Lan Driver");
>   MODULE_AUTHOR("Realtek Semiconductor Corp.");
>   MODULE_VERSION(DRIVERVERSION);
> +MODULE_FIRMWARE("rtlwifi/rtl8188eufw.bin");
>   
>   #define CONFIG_BR_EXT_BRNAME "br0"
>   #define RTW_NOTCH_FILTER 0 /* 0:Disable, 1:Enable, */

Acked-by: Larry Finger <Larry.Finger@lwfinger.net>

Thanks,

Larry

