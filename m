Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1BF23C9
	for <linux-staging@lists.linux.dev>; Wed, 16 Feb 2022 09:50:45 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id r20so2455505ljj.1
        for <linux-staging@lists.linux.dev>; Wed, 16 Feb 2022 01:50:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=5BSEQWlpqzUNC7cde1R/udWhNZ/HbmdZRR8iTULYXlQ=;
        b=QE29adL5btNluj+3qUfq1CYwY0DrPQHuRx6PkLyu+fXmQ1T5ixOOnHG5wDFt2FBVVX
         l56hP8Da+r2H1KEnMaRO/piSebG92stURNx3gtaA4KmOoEisT4yr47IEzS7cGlRNnmF0
         KkEF0z+sQbSapCgNtDsFW5+FJeX28glmDHN+biX7B5dMIC2Xup1lqufrvq8MMjnXgcZc
         i0efQNA5OpVzDD2eU9TujFZQQ6yKHb8QSgikwBh/82vUQBkeFEf/5s1aYcL/eJXxOIJy
         yyAtUKvYn84hc4/J54m88HVyGZM1bJJ7iLXGFvNeNOj+GxFi3cVAyisWspXlUzo85wmI
         GJSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=5BSEQWlpqzUNC7cde1R/udWhNZ/HbmdZRR8iTULYXlQ=;
        b=ZWo+juYdthw6hPoWF6VETtkwaM6Gl53VEXrvvLyQeU2zL3dFf3KKbGhcZUweDEetqi
         CZgHBeU38ZEyQIxqTI+aRaCxtPaErMYlmHC4j2LnPhdEzxvAz5QmhpEehij5MZQLONGY
         0ZA114Io7vXMtv6F1ea9WBPoy9u+8rQSdzbiMzSKbsFQLjjUgh9S3fxRj/83ydDOhst4
         Fe4NB6CeijRnBdmmVNUxBweZZ+gAI6gRhEcGa5PRP0dv2YAaGOnJHQrvc0hVtev8Tq8O
         6z5Z9cWY47cttMGEUaBK8vNO8gJWoN099c/+6XQWGFrF1XCAjO4WK2HXivP86qUg9E7y
         7l+A==
X-Gm-Message-State: AOAM531jKV6oMGK1jRTb50nQFurvCNlNafkFB5zYiqCcl7USxF2f3Gqm
	B+q5oGK4sqNXc01gnv5MKIs=
X-Google-Smtp-Source: ABdhPJwMpnx9ZO+IdlvQw5i56UM/gTv6nAVkEK2NfXUX8SBX6DfFhJN3S4zO6dATaFZIZzewh8t9rg==
X-Received: by 2002:a2e:bd84:0:b0:244:c1e5:c6a7 with SMTP id o4-20020a2ebd84000000b00244c1e5c6a7mr1438956ljq.228.1645005043169;
        Wed, 16 Feb 2022 01:50:43 -0800 (PST)
Received: from [192.168.1.11] ([217.117.245.154])
        by smtp.gmail.com with ESMTPSA id v11sm1248197lfp.95.2022.02.16.01.50.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Feb 2022 01:50:42 -0800 (PST)
Message-ID: <85740a8e-e654-7742-642f-44d01c323c26@gmail.com>
Date: Wed, 16 Feb 2022 12:50:41 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v2 03/15] staging: r8188eu: remove converted DBG_88E calls
 from core/rtw_mlme_ext.c
Content-Language: en-US
To: Phillip Potter <phil@philpotter.co.uk>, gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com, Larry.Finger@lwfinger.net,
 straube.linux@gmail.com, martin@kaiser.cx, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20220216010709.791-1-phil@philpotter.co.uk>
 <20220216010709.791-4-phil@philpotter.co.uk>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <20220216010709.791-4-phil@philpotter.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Phillip,

On 2/16/22 04:06, Phillip Potter wrote:
> Remove all the netdev_dbg/pr_debug calls that were previously converted
> from DBG_88E inside core/rtw_mlme_ext.c. Due to the sheer number of
> lines, this patch is separated out for ease of review. After some thought,
> it makes more sense to just entirely strip all of these calls, so that
> debugging code in the driver can be more consistent and useful going
> forwards.
> 
> Signed-off-by: Phillip Potter <phil@philpotter.co.uk>

[code snip]

>   	if (pstat->aid > 0) {
> -		netdev_dbg(padapter->pnetdev, "old AID %d\n", pstat->aid);
>   	} else {

Ok, this one has same issues as 2nd one. I am going to stop reviewing 
this series for now, because looks like I am missing some context...



With regards,
Pavel Skripkin
