Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F043FC3
	for <linux-staging@lists.linux.dev>; Sun, 22 Aug 2021 15:30:12 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id c12so26596085ljr.5
        for <linux-staging@lists.linux.dev>; Sun, 22 Aug 2021 08:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=UUbd05FldiIoBAm96I7gNRChHATg0GhZfAiC5EXuLrA=;
        b=TDxe6Pr+2JgQIav8J1lASsQ2sQ5sNJ3gUFRzgjvzbgdD+IR8rEXPHn53p8EkgO99t1
         eQGS3TE6OaygCfGxNPPaDhQYJZHgHuC17R5eAqNLuSkEVclYS/o2gBYyvqe1yI8QEXkR
         UKULvCp9s9/sEz4i5BcZ5+s1yF/vfv2W5VCGQaTOKhhXiFWqCcGwWFl4u+LRhtxTt+Yp
         SWG0qUvbS0qD90RNYl/kNRugcs3hVYNhuJYIp+igABrADYQIwPzXnWaF2/18h1HqyXgq
         NmMzbC9JkGwHHk2wJVjmWkYAuMbSgp2C6+iCObrVfPPhCf2UdmZTeBhtLDNglKBUsny/
         P2Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UUbd05FldiIoBAm96I7gNRChHATg0GhZfAiC5EXuLrA=;
        b=bHpt3Hmi+GxcEo+MgeDs6jF/XithzpUETE7lDJjb5oxI5cGXrXi46SE3d9oxIcCaoC
         3reeYK/470yUaFwLOaO7puCpkL0FoYa33UKcCJ8xKYXTV1YOvPOsqcZ5YNxz9HhM8+Si
         H1eN85JEaAM0L4JFKSj/MPrOtMGQIMLlBQas4CySOzgu5xsHWp5oRc5y9Fdoh0v0Nlxo
         mZrAiD90rGjyJOFWbqTRO2NhQKV7gh4Bmc2JcGULPODRFM4rHuUERUxduzfIqvBkudM1
         BGrNkt1jsFI06Nn9Pk7pMKcpdVWcoQ7rSPHym70D7634zKhx3cR6qn8lF3VIPehAx5kg
         OYLA==
X-Gm-Message-State: AOAM533N0xp+p4nUV61nH+qBUDArAjQra4wY0ffpKkaoejfwh0rCC3LG
	MqgdFylKc03dCCCEgRDl4e4=
X-Google-Smtp-Source: ABdhPJx8sDEPnIXalJagpmfAMZRPgoYxbLiwPl2oRJ2mNqbBrSnc4p9uSU4JLR9R3Ot4hSsPYkNUeA==
X-Received: by 2002:a2e:534c:: with SMTP id t12mr23231914ljd.133.1629646210630;
        Sun, 22 Aug 2021 08:30:10 -0700 (PDT)
Received: from [192.168.1.11] ([46.235.66.127])
        by smtp.gmail.com with ESMTPSA id u1sm1219570lfk.96.2021.08.22.08.30.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Aug 2021 08:30:10 -0700 (PDT)
Subject: Re: [PATCH RFC v2 0/6] staging: r8188eu: avoid uninit value bugs
To: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
 gregkh@linuxfoundation.org, straube.linux@gmail.com, fmdefrancesco@gmail.com
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <6182ed46-d79d-7f66-c7c0-096486410b4d@gmail.com>
 <cover.1629642658.git.paskripkin@gmail.com>
From: Pavel Skripkin <paskripkin@gmail.com>
Message-ID: <44fc34ec-6bbe-9cd0-0c51-78836bad7e0c@gmail.com>
Date: Sun, 22 Aug 2021 18:30:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <cover.1629642658.git.paskripkin@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/22/21 5:35 PM, Pavel Skripkin wrote:
> Hi, Greg, Larry and Phillip!
> 
> I noticed, that new staging driver was added like 3 weeks ago and I decided
> to look at the code, because drivers in staging directory are always buggy.
> 
> The first thing I noticed is *no one* was checking read operations result, but
> it can fail and driver may start writing random stack values into registers. It
> can cause driver misbehavior or device misbehavior.
> 
> To avoid this type of bugs, i've changed rtw_read* API. Now all rtw_read
> funtions return an error, when something went wrong with usb transfer.
> 
> It helps callers to break/return earlier and don't write random values to
> registers or to rely on random values.
> 
> Why is this pacth series RFC?
>    1. I don't have this device and I cannot test these changes.
>    2. I don't know how to handle errors in each particular case. For now, function
>       just returns or returns an error. That's all. I hope, driver maintainers will
>       help with these bits.
>    3. I guess, I handled not all uninit value bugs here. I hope, I fixed
>       at least half of them
> 
> 
> v1 -> v2:
>    1. Make rtw_read*() return an error instead of initializing pointer to error
>    2. Split one huge patch to smaller ones for each rtw_read{8,16,32} function
>       changes
>    3. Add new macro for printing register values (It helps to not copy-paste error
>       handling)
>    4. Removed {read,write}_macreg (Suggested by Phillip)
>    5. Rebased on top of staging-next
>    6. Cleaned checkpatch errors and warnings
> 
> Only build-tested, since I don't have device with r8118eu chip
> 

BTW, can you recommend any devices with this chip except for ASUS 
USB-N10 Nano? I didn't find any of them with delivery/reasonable 
delivery price to Russia.

I want to help with testing and moving this driver out of staging 
directory :)



With regards,
Pavel Skripkin
