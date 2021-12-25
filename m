Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B16E173
	for <linux-staging@lists.linux.dev>; Sat, 25 Dec 2021 18:19:41 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id u22so18636290lju.7
        for <linux-staging@lists.linux.dev>; Sat, 25 Dec 2021 10:19:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Eet2DOTt9N2FCnKhTSMQv7VraNOtLbXFUud1z4lNfWQ=;
        b=IPPITeuzagbGAOYzBYx5hHjxtGBYL6z/xyWZP7VNam/VlJUak/Ro9DZ/z4TT9CwZFj
         IM6SD+KUBgOgyAiZg8AajRmArf6o/1edk7wSgrqCAp6qgRuUZXyXe2Jwv8kBkGqYuQYw
         z0rtd5oh4S2cjBHEuj4B9QhBKI3Et3IYrxl/JGAZF8KPcp/nqC5n2gZlkPdgyH8nBwEz
         FOn4cBIcPLOj4rjFT9q8nr14phac37KLeJlA07AVVrKo3wmmkZvAuHeMrxECuUgg0NdA
         Oy63GI/Bt0sRDWbtchRd9TZ1BMHdJWRxBcGdz53ScIfdmJw+DkSp+x+SzIbAemWd0wvJ
         g0nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Eet2DOTt9N2FCnKhTSMQv7VraNOtLbXFUud1z4lNfWQ=;
        b=IGrcBlBI4oIGuoQ/cWC8LjEqnHhRC53UsbwbZQBhpKlZOcQ+6muouEDu6dHjomb0bM
         jQyEwL5IQHGyGS2loVrZTpqo97QZnzol6usLjBxjjnWvnBljwLbN80H8l8ZB4pwmw+9Z
         qTyclcCjCfR5wleFUdEYl161cKw+Sx6kFxT4WEJU0yHlUUFkPZ4JpySLZOd445AElcom
         6S2V+lFSceEvrrk7x5yGtwhlLp4TyYxQl566vL9uY6Y/u9warnKPFJbUP5eklSJMJ3jO
         AcV7G2Yg9RKC2U0UUY8CKQ95g6t4FRcHWzZ2iqT1yVQRaqLwWdrZFDr7iK1PB5PEZPZv
         MvCA==
X-Gm-Message-State: AOAM532VJa3qbMfkBXMTnBYhTDjv8+Zz/r7l6GrvzLfBQK4rn2ZiMax4
	MVH7p2C6QD+m3bnHCZfyjqc=
X-Google-Smtp-Source: ABdhPJysz6tdYSDfA/n2nGuHihjtO7p4DujRww268V5QT82tRVyJ0qqPPEuGYF5mI02+ULaxqmq5PA==
X-Received: by 2002:a2e:9e43:: with SMTP id g3mr8089001ljk.291.1640456379591;
        Sat, 25 Dec 2021 10:19:39 -0800 (PST)
Received: from [192.168.1.11] ([94.103.235.97])
        by smtp.gmail.com with ESMTPSA id s14sm1173044lfg.43.2021.12.25.10.19.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Dec 2021 10:19:39 -0800 (PST)
Message-ID: <b2914fb5-4c60-9786-e06e-363904f0b12f@gmail.com>
Date: Sat, 25 Dec 2021 21:19:38 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v4] staging: r8188eu: Use strndup_user instead of
 kmalloc/copy_from_user
Content-Language: en-US
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, Larry.Finger@lwfinger.net
Cc: phil@philpotter.co.uk, gregkh@linuxfoundation.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 Abaci Robot <abaci@linux.alibaba.com>
References: <20211225170436.111000-1-jiapeng.chong@linux.alibaba.com>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <20211225170436.111000-1-jiapeng.chong@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/25/21 20:04, Jiapeng Chong wrote:
> This code assumes that the user is going to give us a NUL terminated
> string which is not necessarily true.
> 
> Fix following coccicheck warning:
> 
> ./drivers/staging/r8188eu/os_dep/ioctl_linux.c:4253:8-15: WARNING
> opportunity for memdup_user.
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Fixes: 2b42bd58b321 ("staging: r8188eu: introduce new os_dep dir for RTL8188eu driver")
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---

Subject line and commit message are completely unrelated to the change 
itself, please fix up.


With regards,
Pavel Skripkin
