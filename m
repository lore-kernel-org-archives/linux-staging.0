Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A7A7A
	for <linux-staging@lists.linux.dev>; Thu, 14 Apr 2022 15:43:18 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id b188so5774399oia.13
        for <linux-staging@lists.linux.dev>; Thu, 14 Apr 2022 08:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=1cLq8LqK3UWLIBy6r884Y8tieCmkMT6Wfv6wEy0NldI=;
        b=VptJw5dBZp9OfikGLgMiouAjoLb8WgvNhpgSnhJNtvZHJb+l4sA7vUtX3KbyRteXS3
         JXG60RH0lkJDCpBNyitMeY4XHSAMdbNvgwDG2qavT+ZQn4AmewRlPfUcCYXicLxD06bK
         84W9C+YV4RwjBvBMDxnd46yCVSDp0I0XJeYkWPf7/XD8vKriHYv1F2/XYgTVA8CoHofX
         tdXDZaJI3QqkbGWeiy2sePVHdAdLbVM4hitoz+JX/EFyFDsBhypwgilIy8lKnV7lrDhH
         W9TWvvVvOhovrxY7ojvOKmQFl4SadjdmYiYsjngOpB54zgjd4JVL2EhwONuN5lf10rkM
         hNDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=1cLq8LqK3UWLIBy6r884Y8tieCmkMT6Wfv6wEy0NldI=;
        b=RFc/YlUW4FDtkLeiacDV3myBLyYvxoyLKTXPWGoBHQmSPTegxMEYaoKR6TjIArMFCm
         33nJsJALca3HoCi4/H/T/fP+SMMitS+BVyBmR1W6rpLJSzEZIGInFbXP1Tcmk1j+MGY7
         0qoVqfXXEvP8fUgdF2X4VGQS5ObL1ciexGx8XDcK35h4NQnrzb0gAAPIu5Kxn8EVxcwX
         zbF3wu6sMnWTPEApfqbVb30+J+j+BQWgonALZOqAoc7nvlZsMn7wK9DuuL4TGFMltQ/U
         FGjLzyNkEe4Jm+SLmIpgpmOK7ardPSClD5te6FpH9UbqCUjHIVN1EQMstOGHnKuEIBes
         asOg==
X-Gm-Message-State: AOAM533ikSP0dyrpEjBeCwH4oJ6tFVX6WnJCF4WOLQ5aO7Qzesc4yNyE
	f3y9DNQG+8B0bmKD/3yTv84=
X-Google-Smtp-Source: ABdhPJwCUcGJxvcxLdlnB+MKeVNToYmiypu3HyQ2KpwPVeExLTI1mbnL0OHiHBRuOEXR1X1cPL2/eA==
X-Received: by 2002:a05:6808:1202:b0:2f9:c7b4:fd56 with SMTP id a2-20020a056808120200b002f9c7b4fd56mr1582429oil.55.1649950997784;
        Thu, 14 Apr 2022 08:43:17 -0700 (PDT)
Received: from ?IPV6:2603:8090:2005:39b3::100e? (2603-8090-2005-39b3-0000-0000-0000-100e.res6.spectrum.com. [2603:8090:2005:39b3::100e])
        by smtp.gmail.com with ESMTPSA id k124-20020aca3d82000000b002ef4c5bb9dbsm138726oia.0.2022.04.14.08.43.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Apr 2022 08:43:17 -0700 (PDT)
Sender: Larry Finger <larry.finger@gmail.com>
Message-ID: <9316567b-19e7-e8c1-ab45-491eae6ec0c2@lwfinger.net>
Date: Thu, 14 Apr 2022 10:43:16 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 0/7] staging: r8188eu: fix and clean up some firmware code
Content-Language: en-US
To: Michael Straube <straube.linux@gmail.com>, gregkh@linuxfoundation.org
Cc: phil@philpotter.co.uk, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20220414083853.3422-1-straube.linux@gmail.com>
From: Larry Finger <Larry.Finger@lwfinger.net>
In-Reply-To: <20220414083853.3422-1-straube.linux@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/14/22 03:38, Michael Straube wrote:
> This series fixes wrong size of struct rt_firmware_hdr in the first
> patch and does some cleanups in rtl8188e_firmware_download() in the
> other patches.
> 
> Tested on x86_64 with Inter-Tech DMG-02.
> 
> Michael Straube (7):
>    staging: r8188eu: fix struct rt_firmware_hdr
>    staging: r8188eu: clean up comments in struct rt_firmware_hdr
>    staging: r8188eu: rename fields of struct rt_firmware_hdr
>    staging: r8188eu: use sizeof instead of hardcoded firmware header size
>    staging: r8188eu: remove variables from rtl8188e_firmware_download()
>    staging: r8188eu: always log firmware info
>    staging: r8188eu: check firmware header existence before access

Acked-by: Larry Finger <Larry.Finger@lwfinger.net> for 2/7 through 5/7. Patch 
1/7 has a typo in the commit message, and I have objection to the logging 
changes in 6/7 and 7/7.

Larry

