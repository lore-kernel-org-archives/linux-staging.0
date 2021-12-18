Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 075FF2C9C
	for <linux-staging@lists.linux.dev>; Sat, 18 Dec 2021 20:58:52 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id p8so9081953ljo.5
        for <linux-staging@lists.linux.dev>; Sat, 18 Dec 2021 12:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Gn8LJv7JTpUL1v6yuZFpAmH+5yz/07bstJ00rIQdQV0=;
        b=AIynQEuZX6hK4iCa+QOvii2tCyfq3a+MdGHfY3np4HyjvAZkeNCGwocKB6A6HFp0rr
         0hECi8fT11+me1vtchODQNYlJjcJBPM+Cv6QysfCLFDXW+Sf7eoCIy34MDR61vhk2nXN
         VOCM4sqq0SO5sKzeA8RPeFK3NTNIy4O4GycuBxloKy4Wj7KBCxsOiZNjhW9RTKFhvD8G
         +UVYAHwJJ5XfQBYG2c0JLZlrsBhnmzx9yYTK7/9FBrmsNR3UCHKpZTKcvtB2M36DpxIa
         Pym3AxELoVwxcOySUezCUVv3/4sJmfjH8/v2zuB6MviVed+sjsHc9+96jdi+kKfDWmKx
         o23g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Gn8LJv7JTpUL1v6yuZFpAmH+5yz/07bstJ00rIQdQV0=;
        b=AGz+H7RnRdVyEm9GVnv/HDdTK7mx40D17/nW6TKxZGSzNPxoJI+GddHtvCYjD5yEPR
         dR1eoBMVwIr1Bkdl12FxiMqDM0iq6ZhfON0iV9BDJEf42lxfqaDamxtBVrZ1gHIWQhA0
         87rkMOhGwdlYi3z8jFOYJyM5Htw2ORGSNZzefwFOsbN++S74PzVAIpmDXpTWSya/D0x6
         Apc7cd84ZkCQ2XAASCGnX/ANrAqRAKZVNeAf/VaevtO387sKWcIlJtS3gYtu12rcNLkJ
         1sDD4NAj2p1Ql/vMHclbQoT+1KwBtSQn0GvXM80Uxee1k9qM2cRqVITPT2pcHyzyrkaQ
         dMyg==
X-Gm-Message-State: AOAM532LvoMPErVh0ysfXoUC/JeXlR8t4Jil39Dd+jBlCE3bpfsxRaoD
	KyjmKEAy9lzW88m+bAmqd6A=
X-Google-Smtp-Source: ABdhPJz35ebU5vl/+epVPzIj4/sQdll1xVOINZIHBMz07xkug1F8dOcgVZ8yUVfOMhpKFwdubTW7bw==
X-Received: by 2002:a05:651c:54d:: with SMTP id q13mr8245383ljp.498.1639861131085;
        Sat, 18 Dec 2021 12:58:51 -0800 (PST)
Received: from [192.168.1.11] ([94.103.229.239])
        by smtp.gmail.com with ESMTPSA id m9sm2113358ljg.80.2021.12.18.12.58.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Dec 2021 12:58:50 -0800 (PST)
Message-ID: <f4c7b099-2b9b-46d3-112b-c7c2ffd3ef80@gmail.com>
Date: Sat, 18 Dec 2021 23:58:49 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH] staging: rtl8712: Fix alignment checks with flipped
 condition
Content-Language: en-US
To: Ismayil Mirzali <ismayilmirzeli@gmail.com>, gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev, simon.fodin@gmail.com,
 Dan Carpenter <dan.carpenter@oracle.com>
References: <20211218202847.23086-1-ismayilmirzeli@gmail.com>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <20211218202847.23086-1-ismayilmirzeli@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/18/21 23:28, Ismayil Mirzali wrote:
> From: Ngo Tak Fong <simon.fodin@gmail.com>
> 
> Fixed two CHECKs of Alignment should match open parenthesis and flipped
> a condition to pull the code in one tab.
> 
> Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Ngo Tak Fong <simon.fodin@gmail.com>
> Link: https://lore.kernel.org/r/20211207212223.GA70594@simon-desktop
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---

This one is already applied to staging-testing.
See commit d0df53d36cd51154463796bc6abdd11abdbc67c1

Looks like you have sent it by accident



With regards,
Pavel Skripkin
