Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6654068
	for <linux-staging@lists.linux.dev>; Sat,  6 Nov 2021 09:48:35 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id z19so918733lfd.8
        for <linux-staging@lists.linux.dev>; Sat, 06 Nov 2021 02:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=X6vi9li6S8v4Q1SwfLryhJAxrd9Ozh6/T71E0ZGXYMQ=;
        b=SNMpzsiYgYsr+iE7Skz+2AY/R7OOklaJAEN2jaoTO9NxFqsIzDJuHFrxqpdi+1TgOT
         DoSNxB4LVEanTtgFIyBKT5zcd0reXf2mzBJ7yJKdoGsSmr8biqbjgqrKHEiHKp+oHc3y
         /ceBif4B6KjehIeD8BC/CJ7xdvPEOt7ZhcCuZK0m8+NObgxrikdIaWuRAq7w4EY57XiE
         QvN9gcf4JxYwOJOncLmJEdpE+GGMrDnh9Pz7T22LXGqvy44Hn735IwLx1trs3hFim+Bg
         Aqxu7M9upE/U27BVcKSzya8zFsyVd4DCngmj85rU9WrYoEcSBamADhLhYxFRV407LEAX
         YKtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=X6vi9li6S8v4Q1SwfLryhJAxrd9Ozh6/T71E0ZGXYMQ=;
        b=ZCq1vjJzxqb+Z1QUjSi6Pc5YYpKlm7Opg5T7o3yrX6yUYnEUKX1jv2NDPeek9ppJPQ
         rH6t4pEbU5N1aOtiiXqve/xwrzXnDsQOTjsRhdWA8172mSXNwsED9QLsuBaSx2nS6kvy
         Opf+gwaoBxVZUJ1Zsl8+vgjaYrf56HDPTdWt5LnjLKWhABu/UWnAQrXhgDR9OCBhFDee
         JgqCIBhVV24P6uMLM+eNk/IBzwph8fncbfLFpIMDm5sZRZPTj8jbcXFBAINKI0Eb6Nmm
         raA4b/68fw2uClQX0koSOmA+BVUBGD76vOnAt+T8dU9tO1RL63iY2tpBlvtKtcoRAqs/
         BZrg==
X-Gm-Message-State: AOAM532wVs5Fe2Iy+lVRJJ2MZSuoiXd/acIrUQpo4JvXR7YnvZy4Pzwo
	zEFA1JiSTExzIQUvZsDbPUwYkPNkjis=
X-Google-Smtp-Source: ABdhPJwXz/Wt1rMP35pFlMuIrJ5FriroW7p0taYzaeHSJ5ZX94Yr/sInr92i6PSfga3gK9vyitfJEw==
X-Received: by 2002:a19:4951:: with SMTP id l17mr61584151lfj.206.1636192113363;
        Sat, 06 Nov 2021 02:48:33 -0700 (PDT)
Received: from [192.168.1.11] ([217.117.245.207])
        by smtp.gmail.com with ESMTPSA id bt10sm1106322lfb.193.2021.11.06.02.48.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Nov 2021 02:48:32 -0700 (PDT)
Message-ID: <5ed4c9f0-111a-7a13-1426-2f9f26b9937a@gmail.com>
Date: Sat, 6 Nov 2021 12:48:31 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: r8188eu driver in 5.15 only shows wifi networks on channel 11
Content-Language: en-US
From: Pavel Skripkin <paskripkin@gmail.com>
To: Zameer Manji <zmanji@gmail.com>
Cc: linux-staging@lists.linux.dev,
 "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
 Phillip Potter <phil@philpotter.co.uk>,
 Larry Finger <Larry.Finger@lwfinger.net>, Martin Kaiser <martin@kaiser.cx>,
 Michael Straube <straube.linux@gmail.com>
References: <CABtXzjTvsN8sCQq0tMG+VZ8Vu04a1zR20P-hbQf-Mnpmu2gTNg@mail.gmail.com>
 <2d7b9450-159b-f244-f4c3-e9db753f83eb@gmail.com>
 <CABtXzjSjkQTMmrA_PmbLaMUFR9X7xUMx+VG=v1jsdLQAdg+rJg@mail.gmail.com>
 <510e2388-41ea-bf66-16ee-eb282cc41405@gmail.com>
In-Reply-To: <510e2388-41ea-bf66-16ee-eb282cc41405@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/6/21 11:32, Pavel Skripkin wrote:
> On 11/6/21 00:03, Zameer Manji wrote:
>> Hello Pavel,
>> 
>> I will attempt to bisect the issue.
>> 
>> So far I can confirm it occurs in 5.15-rc1.
>> 
>> I also forgot to mention that this issue occurs on an arm64 platform
>> if it matters. Would you be able to test this issue out in an arm64
>> VM?
>> 
>> 
> 
> Hi, Zameer!
> 
> I think, I can build aarch64 kernel and test it in vm.
> 
> Btw, did you try to enable debug logs? debug=9 module argument will turn
> on all debug logs and maybe there will be some additional information
> about what actually happened
> 
> 

Test results from aarch64 vm. My qemu configuration is

```
qemu-system-aarch64 \
	-machine virt \
	-drive file=./debian-rootfs-aarch64.img,format=raw \
	-cpu cortex-a57 -machine type=virt \
	-nographic \
	-smp 2 -m 4096 \
	-kernel arch/arm64/boot/Image \
	-net user,hostfwd=tcp:127.0.0.1:55555-:22 \
	-net nic,model=virtio \
	-device usb-ehci \
	-usb -device 
usb-host,hostbus=$BUS,hostaddr=$DEVICE,guest-reset=false,id=tp \
	-append "root=/dev/vda1 rw nosplash"

```

if something is wrong here, please, let me know, i will retest. I am not 
an expert in arm :)




And test results:

```
root@debian-vm-aarch64:~# iwlist wlx28ee5214eeb6 scanning | grep "Channel"
                     Frequency:2.437 GHz (Channel 6)
                     Frequency:2.412 GHz (Channel 1)
                     Frequency:2.412 GHz (Channel 1)
                     Frequency:2.412 GHz (Channel 1)
                     Frequency:2.412 GHz (Channel 1)
                     Frequency:2.412 GHz (Channel 1)
                     Frequency:2.412 GHz (Channel 1)
                     Frequency:2.412 GHz (Channel 1)
                     Frequency:2.417 GHz (Channel 2)
                     Frequency:2.417 GHz (Channel 2)
                     Frequency:2.427 GHz (Channel 4)
                     Frequency:2.422 GHz (Channel 3)
                     Frequency:2.427 GHz (Channel 4)
                     Frequency:2.427 GHz (Channel 4)
                     Frequency:2.442 GHz (Channel 7)
                     Frequency:2.432 GHz (Channel 5)
                     Frequency:2.437 GHz (Channel 6)
                     Frequency:2.452 GHz (Channel 9)
                     Frequency:2.452 GHz (Channel 9)
                     Frequency:2.462 GHz (Channel 11)
                     Frequency:2.452 GHz (Channel 9)
                     Frequency:2.462 GHz (Channel 11)
                     Frequency:2.457 GHz (Channel 10)
                     Frequency:2.467 GHz (Channel 12)
                     Frequency:2.462 GHz (Channel 11)
                     Frequency:2.462 GHz (Channel 11)
                     Frequency:2.472 GHz (Channel 13)
                     Frequency:2.462 GHz (Channel 11)
                     Frequency:2.472 GHz (Channel 13)
                     Frequency:2.472 GHz (Channel 13)
                     Frequency:2.412 GHz (Channel 1)
                     Frequency:2.422 GHz (Channel 3)
                     Frequency:2.432 GHz (Channel 5)
                     Frequency:2.432 GHz (Channel 5)
                     Frequency:2.432 GHz (Channel 5)
                     Frequency:2.442 GHz (Channel 7)
root@debian-vm-aarch64:~# uname -a
Linux debian-vm-aarch64 5.15.0 #3 SMP PREEMPT Sat Nov 6 12:10:40 MSK 
2021 aarch64 GNU/Linux
root@debian-vm-aarch64:~# lsusb
Bus 001 Device 002: ID 2357:010c TP-Link TL-WN722N v2
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
root@debian-vm-aarch64:~#

```

I didn't try to connect to my wifi, since your problem occurs even 
before connecting


Any ideas about how to reproduce or what have I done wrong? :)





With regards,
Pavel Skripkin
