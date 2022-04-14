Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF607A
	for <linux-staging@lists.linux.dev>; Thu, 14 Apr 2022 15:32:38 +0000 (UTC)
Received: by mail-oi1-f177.google.com with SMTP id z2so1392594oic.6
        for <linux-staging@lists.linux.dev>; Thu, 14 Apr 2022 08:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=dZuoh37v+Aj6sqcMi06F2S04MGr5lZnuPaxiehoSWJs=;
        b=BPrwFp10xhFZyfE3N65blMPhWgs1sPmtNBlG/TCafoQI2KPiIuGwSlKZ/GA/tLOKt2
         ssjDXVuaMMigRu352gZA0pvUFXMw4qIhi9F2kVfBEsqhyWoLO+vHs16hZSkbXIB0Eleb
         Ky8MwHcCtsbbaoEFgK6S4KXSsoU4J+nAWRg8sIrmxexLAFSyiyTpmbPYBCwL9B5Wz3YJ
         bJZAKLRuYQvxean4yeUnPli+jXV5zzEGdLx/bMNWGAtX+f/vWWyzxCLHHebkGiYYpab2
         wmjmqonjz8PIOm7VfZQfclUmFbnHPDANwpHb/tLCfTZm1UG673BnZhvx7V8VL6T95liY
         5wrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=dZuoh37v+Aj6sqcMi06F2S04MGr5lZnuPaxiehoSWJs=;
        b=NpKt+HeN53xArTgKN8IAHnoNAGnU+smVpCcLJ9V2WV2tlDTIJDTU28ONIAgR6apbZB
         gluAs39WAc1qB3I93uvqFkbN9KFUXZgsTGzM+8XJmLjQ+vce8EZFgVpLrkkDc+IhulJ4
         sJJ+0jp9p85MtrUEenUjI4oyO0heQo6lYA/jEEbitJvblHABNPBavMIk1BIUiTGrNtTc
         NHwDLnfFRshcWDiFj+Rrxfu2wftOHVOXyABXyMSoVGc3s6MCwcr4E8CAaps4O9gb6fM0
         /Bt/90kxx/e9CRyKYiEkcypeqvs9vd2nErS8i3wcJRLJxQycKdkKcAcTj3Cdt4NGruYb
         hxZg==
X-Gm-Message-State: AOAM533lwgNDa85EuXds5laymJyufiQ4xM7R20Vhq76SWTBNuUXHmPz7
	qDKzVNvt00LlosQp0YKG9Uo=
X-Google-Smtp-Source: ABdhPJw5rJYiOPYo0P5iabZTEkaoF9juWNaKPcLz9NEA4zgtkNreisfMuVnRoOSWXmp+g/Bw2rxjGg==
X-Received: by 2002:a05:6808:f8f:b0:2f9:76b9:421f with SMTP id o15-20020a0568080f8f00b002f976b9421fmr1895829oiw.281.1649950357262;
        Thu, 14 Apr 2022 08:32:37 -0700 (PDT)
Received: from ?IPV6:2603:8090:2005:39b3::100e? (2603-8090-2005-39b3-0000-0000-0000-100e.res6.spectrum.com. [2603:8090:2005:39b3::100e])
        by smtp.gmail.com with ESMTPSA id b18-20020a056830105200b005e9899ae22dsm121020otp.52.2022.04.14.08.32.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Apr 2022 08:32:36 -0700 (PDT)
Sender: Larry Finger <larry.finger@gmail.com>
Message-ID: <efbd9524-efba-c00b-e191-3e603445e9f4@lwfinger.net>
Date: Thu, 14 Apr 2022 10:32:35 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/7] staging: r8188eu: fix struct rt_firmware_hdr
Content-Language: en-US
To: Michael Straube <straube.linux@gmail.com>, gregkh@linuxfoundation.org
Cc: phil@philpotter.co.uk, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20220414083853.3422-1-straube.linux@gmail.com>
 <20220414083853.3422-2-straube.linux@gmail.com>
From: Larry Finger <Larry.Finger@lwfinger.net>
In-Reply-To: <20220414083853.3422-2-straube.linux@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/14/22 03:38, Michael Straube wrote:
> The second issue is that the u16 and u32 fields sould be __le16 and
> __le32.
> 
> Change the field Rsvd1 to u8 and the u16, u32 fileds to __le16, __le32.

There is a typo here.

Note that the various RsvdN fields are just reserving space and will never be 
referenced, thus it does not matter if they are u32 or __le32. It is OK to 
change them, but it is not wrong to leave them the way they are.

Larry

