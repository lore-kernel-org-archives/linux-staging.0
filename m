Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E67201FDA;
	Sun,  3 Apr 2022 16:43:29 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id dr20so15370543ejc.6;
        Sun, 03 Apr 2022 09:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=dfM9iFVEMlQhnqd2qRR4eBc2QvDGokUysbFV1hlfGcE=;
        b=BXa3LtkpNMBGbMAHpD5eKBfHr6zCd3rMKm5CGEfwjl6XPVdMekbtjGmoM/z2KFNWwU
         X6kHZBbg+gkpQjuXhncMf05tFL2Zht8pfNc1PAwH3NAzR44liezgut1pTsPfEhCrBSKU
         oFkoe3bpwwXebOXb15aB+IsEM5YVvnCMl0r7ql6v9scYIuW1zJfHXS7eODDXnjOWqB4w
         duVp2z6MvIBmr7cvGsGKDQib5qGpXEqCVa5HpTzNL4XzT/9Dd0TP+PWWex3WDDhqhJak
         yNXi8CMgkpf6ut3HSjQGgppv5yrf7Gvb2hLXelsEwMeoxZeEdPBFFKkLtlPAIbTzmzSw
         eOJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=dfM9iFVEMlQhnqd2qRR4eBc2QvDGokUysbFV1hlfGcE=;
        b=hhSmfdKu+KGiBg80pmRszxD5NG/2UrryMh2f9LSTSUS1D4obwnqhVT8/niHgDIbKuS
         pV6RDZ/8HfPTsocpUUuXmvFQ9kk4X+mrHgpdx3QY6IhuYyq57y+j2YEMd4G/P/GXTmOz
         99erRIHP0xDAW2pp+LHAHqeqCBgSEOGPCeV7qzyti8cirzat0ixmioOnED3aoMV11fkx
         rQucW+pYBi92KeIQ4f+BGS2B9rTeeA1apx/WWjS4/9+6Trf0ekf5wSsUJGYesOsQXY7Y
         JR3s41Fb33XJuivznDF0+GsFPdgd8CPuSZjmUHdVHSyzOEya83T9EWNVVh4q7GK6oJf8
         AXTA==
X-Gm-Message-State: AOAM531Pm7lCfYjqK4eWrr08AXpi3AzlYhUj4DzUtZn10e3LB9F2gX+L
	Z+zgKj7FpZlBiYpq1jwMMiA=
X-Google-Smtp-Source: ABdhPJyA5QVq7pKuGoqcuQoJWMTsO14n1ezBhA8QzyDvWkYZhpDpEKvagmoiwKECNaUofAQaHOfVUg==
X-Received: by 2002:a17:907:6e08:b0:6e7:f074:e41d with SMTP id sd8-20020a1709076e0800b006e7f074e41dmr1078741ejc.164.1649004208173;
        Sun, 03 Apr 2022 09:43:28 -0700 (PDT)
Received: from [192.168.0.151] (ip5f5abb55.dynamic.kabel-deutschland.de. [95.90.187.85])
        by smtp.gmail.com with ESMTPSA id l2-20020a1709060cc200b006d3d91e88c7sm3384228ejh.214.2022.04.03.09.43.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 Apr 2022 09:43:27 -0700 (PDT)
Message-ID: <3e1dfdde-d9f3-9e16-82a6-7b5497981bdd@gmail.com>
Date: Sun, 3 Apr 2022 18:43:26 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] staging: r8188eu: simplify control flow
Content-Language: en-US
To: Sevinj Aghayeva <sevinj.aghayeva@gmail.com>,
 Pavel Skripkin <paskripkin@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 outreachy@lists.linux.dev
References: <20220403155111.GA333187@euclid>
 <ed0e9f7b-9ba9-b0c8-8261-397bf793b9b9@gmail.com>
 <CAMWRUK6K77KpRkCkruL=RQcmA1opbvapyPJOA-EFpYdXxY8ujQ@mail.gmail.com>
 <4ccc9ac3-c542-cd32-0cbb-7cdabbf0dbf9@gmail.com>
 <CAMWRUK7g7BqUL1NziBfbc6Epx7G8Xos47sKAtcimDZYmG-hVgA@mail.gmail.com>
From: Michael Straube <straube.linux@gmail.com>
In-Reply-To: <CAMWRUK7g7BqUL1NziBfbc6Epx7G8Xos47sKAtcimDZYmG-hVgA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/3/22 18:29, Sevinj Aghayeva wrote:
> Ah, I see. You run it on an email file that contains the patch. I
> could reproduce what you saw when I ran checkpatch without any options
> on an email file. But my usual workflow is to modify a file, e.g.
> rtw_mlme.c and then run "checkpatch.pl -f rtw_mlme.c", in which case I
> cannot see the "Alignment should match" error. So it looks like if you
> do not specify -f then checkpatch.pl enables --strict option.
> 

Hi Sevinj,

I'm also not a checkpatch expert, but on my system this works without
--strict too. I applied your patch to my local tree and get:

/scripts/checkpatch.pl -f drivers/staging/r8188eu/core/rtw_mlme.c

[snip]

CHECK: Alignment should match open parenthesis
#1638: FILE: drivers/staging/r8188eu/core/rtw_mlme.c:1638:
+               if ((p->PMKIDList[i].bUsed) &&
+                               (!memcmp(p->PMKIDList[i].Bssid, bssid, 
ETH_ALEN)))

[snip]

You can also run checkpatch on the patch files (without -f).
Then it's easier to see if you introduced new issues.

regards,
Michael
