Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E071C4AB6
	for <linux-staging@lists.linux.dev>; Fri, 18 Feb 2022 17:45:34 +0000 (UTC)
Received: by mail-oo1-f43.google.com with SMTP id 189-20020a4a03c6000000b003179d7b30d8so4366217ooi.2
        for <linux-staging@lists.linux.dev>; Fri, 18 Feb 2022 09:45:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=afcM4DQupixAxH0kc1FcSrJ62dkTTraEAu7alpgcE5k=;
        b=T2FTHtJlw2tz58RdWq5RP/pXsvqUojg0GbRxPQDEAZsbI5S3XxD3nc+uWjVc5kMo46
         EVoPJlz3ZiGLQ97OD+P8Mz+CPb/quyO5wYs8zjn8cO9huLAmun9brZQb+K5PdUJfwhCa
         Gv9KcPoWfBCHCe4jeVU+iqa+belCW2JP35GX2LQzk0synQTcnKE22hM41CFe7yGJl15T
         PQJMoJYfZ5ITi3OuEmNpqyyc9avf4BlkQ8ie5Q0S506dpdzkwIoW2fYHQsaedQJLMS6U
         s3nb0vmjJ31wQMNN0x6J2Vc46Bw6y0DPLb03A/vYhscgM8HKBZKA/weNIbTO9DIHkyQi
         dT8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=afcM4DQupixAxH0kc1FcSrJ62dkTTraEAu7alpgcE5k=;
        b=a6K0W7U5isRCasxOTMC1Y8mPayzHLnObef2AZdpTwF3Bx4B7s99JnKHriDW1lzChoc
         5tUB5IkcJ+nfW9FtB/laithFjYAw3OJguFJ1b/VKRc5aAx71kVLX3mxQ5Ug+9GW6lt52
         MqBy2i/CVwNV/uKBfeB7xIYHAM4SgL9Pn9aOemQ+YSBT9VGMYob3QVJxiZTEZbPhjDOZ
         S5NgJUXiJ/ip08KBB3OeMrkRKSs/zAjNBp7rX/ZJ8tchnpL3gqFDTseBi/Q04dhdJKnQ
         Vq9MIPRZv/7RxyVP8BkQ68TOJAjWnGM7Sw7hIl5MP/m41cD0bWL4v8Ar58OQnPgCtKJ0
         OPMg==
X-Gm-Message-State: AOAM53042+YrDNqafUMGzduR2lC4iNph9w6WJhc63+Zyli2DUArebJTa
	2o4mNOHFQgG020rdQTOdLEr/IQgJ1tM=
X-Google-Smtp-Source: ABdhPJyId5/JaldGbob8T9AXgeuwzjHaMaeS4RXNFfR3wDk9nqVeHI5Geg7g8vUf9Ox7DP8Cs8Hm1w==
X-Received: by 2002:a05:6870:75c6:b0:d3:5241:d4c0 with SMTP id de6-20020a05687075c600b000d35241d4c0mr3168966oab.19.1645206334092;
        Fri, 18 Feb 2022 09:45:34 -0800 (PST)
Received: from [192.168.1.103] (cpe-24-31-246-181.kc.res.rr.com. [24.31.246.181])
        by smtp.gmail.com with ESMTPSA id p22sm22691187oae.33.2022.02.18.09.45.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Feb 2022 09:45:33 -0800 (PST)
Sender: Larry Finger <larry.finger@gmail.com>
Message-ID: <fb51e801-d1b9-a436-8fd2-e05a69f0c24b@lwfinger.net>
Date: Fri, 18 Feb 2022 11:45:31 -0600
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH RFC] staging: r8188eu: comment about the chip's packet
 format
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@oracle.com>, Martin Kaiser <martin@kaiser.cx>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Phillip Potter <phil@philpotter.co.uk>,
 Michael Straube <straube.linux@gmail.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20220218092252.853807-1-martin@kaiser.cx>
 <20220218102227.GE2407@kadam>
From: Larry Finger <Larry.Finger@lwfinger.net>
In-Reply-To: <20220218102227.GE2407@kadam>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/18/22 04:22, Dan Carpenter wrote:
> On Fri, Feb 18, 2022 at 10:22:53AM +0100, Martin Kaiser wrote:
>> The structs phy_rx_agc_info and phy_status_rpt define parts of the
>> header data that the r8188eu chipset sends to this driver via usb.
>>
>> Add a comment to clarify that we cannot modify the content of these
>> structures and remove seemingly unused fields.
>>
>> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
>> ---
>>
>> Dear all,
>>
>> I experimented with "cleaning up" these structures and related code before
>> discovering that their content comes from usb packets we receive from the
>> r8188eu chipset.
>>
>> Would it make sense to add a word of warning to prevent others from
>> repeating this exercise?
> 
> Just the fact that these structs are endian means they're from the
> firmware or the network.
> 
> If a struct has a pointer in it, then it's rarely part of the UAPI but
> if it has endian data then it probably is.

Additionally, do not change any struct with the __packed attribute. Most will 
have endian variables as well, but not all will.

Testing after modifying any struct is a necessity.

Larry

