Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7E12C82
	for <linux-staging@lists.linux.dev>; Fri, 14 Jan 2022 20:15:18 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id x11so8082348lfa.2
        for <linux-staging@lists.linux.dev>; Fri, 14 Jan 2022 12:15:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Af/c/cmtwosjw0APkMST/3ZMvIGAMWEBBfXo5bF9yz4=;
        b=FbvanhEpZqk0O3klSmyorAa4SenfcjBKEwaCoBAujnpi2H6lbhAAl9UaEb3OU1AX9S
         tq0yAwzp6rebqElwcBgvp5SXFcdgr0ZO7x9OTTgXYo0Kt6hMx0aTOB2W2HzqMe8eUeCg
         Rn1vVlCoRyO6TpFBrav28mV1gwcwHMvHiGFSOkXBYcMl0K/0r+7SNujgjwIRdwQehmA9
         1rvMjJC1yV6+wrmo//S5bf7VWPJXgVArhQnfE0rYYtco3s4BsBt1HZyrWYERRHUGoijp
         udx9xMGh8Z3J0gNZrUmuBdds1I5CGcCi1oNsfuhMNveAI9NvLxYXh/c4+FQ7YDvWzzsX
         3PgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Af/c/cmtwosjw0APkMST/3ZMvIGAMWEBBfXo5bF9yz4=;
        b=PVSCmloecKrCuhr9FlMV7Uu3acWM/9+ru08a7uNC9QbxftsfWegl9ympIKmG50qLAj
         /m1dwTE3jkCccYtpJrT33QP9ElO6Yc43kTOsCrXHet6KcGszWgj+mIY4tbBXMtpK1muh
         7sbD3sp/LfXl4JbZDH5dduQuGtw6y45J6glv3pePxa3xP48AbiLHu4UFflDttYCE7zog
         hQIKkSaKeYTu51vj08Gh2QwiBomOLFOutcwR2TKCIvOlL2Unk9BQfLjW7m79uj8YHvAr
         1hDfCtoqFBo79d86dMoyDYLKF0d1qsST3KSxOc5ehP85U2lLfpHph8EqSamG29S7N5Td
         XMRA==
X-Gm-Message-State: AOAM533M1cbFMrGiAWgqxATDpN+mcgtiQj4BT7KZ3fiCMoItsHKxzFR1
	HSnOb3io/FoIWtazUrveV5Y=
X-Google-Smtp-Source: ABdhPJz5MiqlmXP0O7zQjXu7kndxxygVYNSidIoVO+o80uaIKj74qbztLyYPTH+7DYm4A7IsMyL59w==
X-Received: by 2002:ac2:4116:: with SMTP id b22mr7954880lfi.530.1642191316151;
        Fri, 14 Jan 2022 12:15:16 -0800 (PST)
Received: from [192.168.1.11] ([217.117.245.67])
        by smtp.gmail.com with ESMTPSA id f18sm676700lfr.5.2022.01.14.12.15.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Jan 2022 12:15:15 -0800 (PST)
Message-ID: <8faa56ea-c670-9ad2-c3b3-a560f8cf2aaa@gmail.com>
Date: Fri, 14 Jan 2022 23:15:14 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH v2 7/7] staging: r8188eu: convert DBG_88E calls in
 core/rtw_sta_mgt.c
Content-Language: en-US
To: Phillip Potter <phil@philpotter.co.uk>
Cc: Larry.Finger@lwfinger.net, straube.linux@gmail.com, martin@kaiser.cx,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 gregkh@linuxfoundation.org
References: <20220110090020.6800-1-phil@philpotter.co.uk>
 <20220110090020.6800-8-phil@philpotter.co.uk>
 <32d83cb4-ceff-a5c5-be62-a8fe99aac3de@gmail.com> <YeDEsOz8GkNPJYJQ@equinox>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <YeDEsOz8GkNPJYJQ@equinox>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Phillip,

On 1/14/22 03:32, Phillip Potter wrote:
[...]

>> > @@ -112,7 +112,7 @@ inline int rtw_stainfo_offset(struct sta_priv *stapriv, struct sta_info *sta)
>> >   inline struct sta_info *rtw_get_stainfo_by_offset(struct sta_priv *stapriv, int offset)
>> >   {
>> >   	if (!stainfo_offset_valid(offset))
>> > -		DBG_88E("%s invalid offset(%d), out of range!!!", __func__, offset);
>> > +		pr_debug("invalid offset(%d), out of range!!!", offset);
>> >   	return (struct sta_info *)(stapriv->pstainfo_buf + offset * sizeof(struct sta_info));
>> >   }
>> 
>> Is it safe to proceed with invalid offset? Debug message says it's out of
>> range, so might be we should just return with an error?
>> 
>> 
>> 
>> 
>> With regards,
>> Pavel Skripkin
> 
> I would need to check the code, but good observation. I wanted to limit
> the scope of this series explicitly to DBG_88E calls, but might be worth
> changing this at the same time.
> 

I think, this log without immediate return is not very useful. If code 
writes somewhere OOB it means bomb has been planted. And this message 
can be reworked as "hey, I've placed a small bomb somewhere, please, be 
ready".

I do not mean, that log is useless, I mean log without return is not 
very useful



With regards,
Pavel Skripkin
