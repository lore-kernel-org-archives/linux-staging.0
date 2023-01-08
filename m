Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26C223A9
	for <linux-staging@lists.linux.dev>; Sun,  8 Jan 2023 14:09:43 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id r26so8872885edc.5
        for <linux-staging@lists.linux.dev>; Sun, 08 Jan 2023 06:09:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BUXuEljk/LxD9w4jO73XPIf1d37sjYsJSMSF4W9BlWA=;
        b=jnIkfCI95i8V+nhOhVF+virknHy12j6qhnbXrPZk0xrs5NiQXHAlDaz6em67jwTvtG
         GaFJY75ckI6IovPA2/darF2J5TUnJ6zPfl0nBbSzWc9epNb4ZbaPHesvi7NC3Fg49qdT
         TVYKm0zQWUdOQ3/7OjooICgHtMCLB4HGKzdMT+u+1ZX83qzfKAJzxqQoYzb6Wyl31cf1
         DcN22nf1RMq1+b5lNNKNxNBw6k62guo1XcpfbFbKkD/1QTnaTAcPzyFY00jSe4dT6YcK
         bDszSGLDvwORmvMHZUenspf3XNs0sE3lmOocr+oltZEKQ/SQoYJFi+vMTaCkNnr771Fo
         lAiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BUXuEljk/LxD9w4jO73XPIf1d37sjYsJSMSF4W9BlWA=;
        b=CIic0MDzKQxtdctGRC8ZHBj3XHPbWEgNMS+Ek4Rl+gQypigZqhzRMZ5P2SUUGfPCxr
         BF22/e22xQbdXJbgdSg1XzjnE0vh7A7jMF+o3DXRlzuuTJ3PMPTamvwODvCWXY9FXhAA
         x5NvtsvvxyW/WN4gx/+luBTucMBuIf6MW0ZkLujoVmOVWXWteL+A1vWgWGAKFgKJvMNp
         eQYSQbu9M39buj87MTCzZYc0iEodR47a4u3Mo+V0apwHxTR1CytWIRbcjC6MFvFacnxi
         IukAHk2dQWoeLMha7f3/0IMZ7RD2N49oXp091XJoqIR7prE7amJAOIycH2vxE/qTgFvY
         x0Mw==
X-Gm-Message-State: AFqh2kpSiU8/4Fhs2tvsx9eNiDmIxn22xjmW+xfaLrwwbrlX73b9/zeQ
	muDN8GY6Af46OUIapbdomeQ=
X-Google-Smtp-Source: AMrXdXvYiQlOR+JD4TwSmEN10aKOeP2vFwYvzmplnw/e2DJDGRW3IYF9i+EGVlRNTAgKnEAvZUcw6w==
X-Received: by 2002:a05:6402:5cf:b0:48d:3975:2d98 with SMTP id n15-20020a05640205cf00b0048d39752d98mr6314819edx.2.1673186981773;
        Sun, 08 Jan 2023 06:09:41 -0800 (PST)
Received: from ?IPV6:2003:c7:8f35:4b95:4409:6ca5:4fd4:216b? (p200300c78f354b9544096ca54fd4216b.dip0.t-ipconnect.de. [2003:c7:8f35:4b95:4409:6ca5:4fd4:216b])
        by smtp.gmail.com with ESMTPSA id x13-20020aa7cd8d000000b0047e6fdbf81csm2572702edv.82.2023.01.08.06.09.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Jan 2023 06:09:41 -0800 (PST)
Message-ID: <50111a6f-08de-1da8-0deb-50b0e7a172b7@gmail.com>
Date: Sun, 8 Jan 2023 15:09:40 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 2/7] staging: rtl8192e: Rename TSSI_13dBm, Pwr_Track and
 NumTotalRFPath
To: Dan Carpenter <error27@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <cover.1672330343.git.philipp.g.hortmann@gmail.com>
 <c7d3be41602e656170de46ea649b5bdf1081d5cf.1672330343.git.philipp.g.hortmann@gmail.com>
 <Y7Pni7tvFPhcz7bu@kadam>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <Y7Pni7tvFPhcz7bu@kadam>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/3/23 09:30, Dan Carpenter wrote:
> On Thu, Dec 29, 2022 at 05:25:46PM +0100, Philipp Hortmann wrote:
>> Rename variable TSSI_13dBm to tssi_13dbm
> 
> I would probably have kept this one as-is.  It's not CamelCase, it's the
> correct way to capitalize it.
> 
> regards,
> dan carpenter
> 

Hi Dan,

sorry for late.

No issue with keeping this variable as is. But can you tell me the rule 
for the rest of the variables in this driver?

Here just some examples: (I know that checkpatch is not always right)
CHECK: Avoid CamelCase: <Avg_TSSI_Meas>
CHECK: Avoid CamelCase: <TSSI_13dBm>
CHECK: Avoid CamelCase: <Avg_TSSI_Meas_from_driver>

Are those OK as well?

I would like to do it the right way. I do not want to discuss every 
variable change.

Thanks for your support.

Bye Philipp
