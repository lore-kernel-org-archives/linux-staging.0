Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98DA23209
	for <linux-staging@lists.linux.dev>; Tue, 10 Jan 2023 17:00:38 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id v134so2937493oie.3
        for <linux-staging@lists.linux.dev>; Tue, 10 Jan 2023 09:00:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=zXZsuTIGi/ixi+3iOAMc5o4ScDsAr7qGP1zK8uDTBUQ=;
        b=NpnUkQFoEmasofPqZY0T0hnydP42p6wmF4dyujrNH69rFigXed2wFOjwmcHszR5kd2
         lDCBpqhUFDzQy4FAWDHulPFEIGW8lzV7fs91Ij77G49BIX00DyR4NbLe4lKctZS/3mrR
         /k22UYtunzLtIcGLrUP6FZBj9qgU5ClQvqpNLVJKW+D+Mz2bfLy3OlM/R9C0cmtiHN7m
         cXUNdvU362h33FPVOlffCE8qKLBznOOuru99SRuKIEXNGy+p+mYaorpB1MGTKjlLQzbr
         XD25pifDJAISN1bwtJOhg4o/muK1l1qZPG/qVFl/3S4WdO3p8IQB99gPL6HsmiL8GX+A
         cHIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zXZsuTIGi/ixi+3iOAMc5o4ScDsAr7qGP1zK8uDTBUQ=;
        b=veynS7PpbXI1eIHk2U9aTN1pz6FY6vdbU9vBQUIF8p0SlEXItR+i/RyHVXeZ5C8mMR
         HBXOqyzJkPllwX9Sscu0rV3Y5hwdHCB5e4zS1Uou5hZKlAlTYDz4siOK0zXcZMe4n9Vx
         1uNVkh07aPhWzZA5nLvYilGhF7uHC/Lhz+m5aREnw+yTPw8ZCE4bCVM7ZO3oys0uUGvO
         QWhFuVw2WU/oArQn1U6M6MCo7jVYg/YaWXSXZzkmmdEnuS6vt4X71eVI8Zb/MGQiWOvx
         6bfDUJBkZ1gzdq5aD1ktws/sc/NTFOkhYRFIsuo0XZ9X67RmwC4y6OFGmtsrqTvwVkt+
         TawA==
X-Gm-Message-State: AFqh2kqkjEoCSDbWMuhSWiHhcL4YAQOCMNrsfwSOjUAwyKLgqRc/IiS0
	Yehs9CSRzzuDKUqLvf8ca5E=
X-Google-Smtp-Source: AMrXdXtTeKAMJW5AP+S+Eh2ByHH4e0Z9+a3dW5mSa9XfpRfJgJoY1lXwL9odIiLTEMKNkbxPYQ+E6Q==
X-Received: by 2002:a05:6808:3a4:b0:35e:baa8:dded with SMTP id n4-20020a05680803a400b0035ebaa8ddedmr28317995oie.17.1673370037607;
        Tue, 10 Jan 2023 09:00:37 -0800 (PST)
Received: from [192.168.1.119] ([216.130.59.33])
        by smtp.gmail.com with ESMTPSA id d2-20020a05680805c200b003544822f725sm5529480oij.8.2023.01.10.09.00.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jan 2023 09:00:36 -0800 (PST)
Sender: Larry Finger <larry.finger@gmail.com>
Message-ID: <9e3e0f34-8a6c-72ca-d86e-de63f87fd7fa@lwfinger.net>
Date: Tue, 10 Jan 2023 11:00:35 -0600
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] staging: r8188eu: Used u16 instead of __le16 in
 rtl8188e_set_FwMediaStatus_cmd()
To: Dan Carpenter <error27@gmail.com>,
 Gaurav Pathak <gauravpathak129@gmail.com>
Cc: paskripkin@gmail.com, phil@philpotter.co.uk, gregkh@linuxfoundation.org,
 linux-staging@lists.linux.dev
References: <20230110135058.21364-1-gauravpathak129@gmail.com>
 <Y71zhnbfIWqAPM4i@kadam>
Content-Language: en-US
From: Larry Finger <Larry.Finger@lwfinger.net>
In-Reply-To: <Y71zhnbfIWqAPM4i@kadam>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/10/23 08:17, Dan Carpenter wrote:
> On Tue, Jan 10, 2023 at 07:20:58PM +0530, Gaurav Pathak wrote:
>> - Changed 2nd argument from __le16 to u16 to fix sparse warning
>>    "warning: incorrect type in argument 2 (different base types)"
>> - Removed le16_to_cpu() in staging/r8188eu/hal/rtl8188e_cmd.c
>>
>> Signed-off-by: Gaurav Pathak <gauravpathak129@gmail.com>
>> ---
>>   drivers/staging/r8188eu/hal/rtl8188e_cmd.c     | 4 ++--
>>   drivers/staging/r8188eu/include/rtl8188e_cmd.h | 2 +-
>>   2 files changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/staging/r8188eu/hal/rtl8188e_cmd.c b/drivers/staging/r8188eu/hal/rtl8188e_cmd.c
>> index 8310d7f53982..a055e71d30ae 100644
>> --- a/drivers/staging/r8188eu/hal/rtl8188e_cmd.c
>> +++ b/drivers/staging/r8188eu/hal/rtl8188e_cmd.c
>> @@ -193,9 +193,9 @@ void rtl8188e_set_FwPwrMode_cmd(struct adapter *adapt, u8 Mode)
>>   
>>   }
>>   
>> -void rtl8188e_set_FwMediaStatus_cmd(struct adapter *adapt, __le16 mstatus_rpt)
>> +void rtl8188e_set_FwMediaStatus_cmd(struct adapter *adapt, u16 mstatus_rpt)
>>   {
>> -	u16 mst_rpt = le16_to_cpu(mstatus_rpt);
>> +	u16 mst_rpt = mstatus_rpt;
> 
> You are changing the behavior of the code here for big endian systems.
> Either the change is good or bad.  TLDR; I suspect the change is bad but
> I don't know.
> 
> The mstatus_rpt is CPU endian.  It is the one of two things for connect
> or disconnect:
> 
>     connect: (psta->mac_id << 8) | 1
> disconnect: (psta->mac_id << 8) | 0
> 
> So the question is in FillH2CCmd_88E() should the connect/disconnect
> come before the mac_id as it currently does or should it only work that
> way on little endian systems and be reversed on big endian systems?
> My feeling is that the second option makes no sense so this patch is not
> correct.
> 
> Instead what should happen is:
> 
> -void rtl8188e_set_FwMediaStatus_cmd(struct adapter *adapt, __le16 mstatus_rpt)
> +void rtl8188e_set_FwMediaStatus_cmd(struct adapter *adapt, u16 mstatus_rpt)
>   {
> -	u16 mst_rpt = le16_to_cpu(mstatus_rpt);
> +	__le16 mst_rpt = cpu_to_le16(mstatus_rpt);
> 
> But this is just my intuition and I don't know this hardware.

I agree with Dan. This patch was attacking the symptom, not the cause. The 
original Realtek driver confuses cpu_to_le16() with le16_to_cpu() in many 
places. Apparently, I missed this one. On little-endian systems, both are 
no-ops, thus it does not matter.

I have a big-endian system (PowerBook G4) and will test later today.

Larry


