Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F0972
	for <linux-staging@lists.linux.dev>; Wed, 25 Aug 2021 09:55:42 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id m28so5416069lfj.6
        for <linux-staging@lists.linux.dev>; Wed, 25 Aug 2021 02:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ZuRtowUJOs608UZxn9IiIdQ8Fj+noUUsQnyhszsaqJE=;
        b=aMleZF1Ow+5j/0iRi+FlFa7P3Sg7PfcadR6MXWYarALpDZrCTqNTTpdxnvexOg0MqW
         lQGoN3wcK+qW31kCr5LAc0BxdgGQCnyev0zvT4n8Fwklb1dk8/dVzIKpMmoXmZk00TgJ
         2kJgYL/LodXM/N3PpBi595zNEduT6E7u/TnIGMcEuinOAwLDqOJJHpj9+V2Yflp+nSPz
         JqdOeNFD7mbuaKMzPsXOfu76m/geatgY2nHMHpQevn6/shjF70l7tT1+LlFAGN8NOup2
         CL2/ootCunbM5C7xEeqbTESrW9VeNC6QwAnXpODD7YcyMYtGIqNsAnd3kwIRxgsDSkNE
         K4zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZuRtowUJOs608UZxn9IiIdQ8Fj+noUUsQnyhszsaqJE=;
        b=W0o9ZNujBljCtM4lRF++RBzj5Rkj6AQs5oCFnftX/TXut2J8dujlGqvo9WYSUttlw3
         zG+TZJlanQa88LPQrpfDbnKtYP0v1uCLuYO7uER19V/h1/KpbwCr7n3tC4BcZ2Dq9tVU
         VEaAm78+aNXONxD22gDFpeESgEKQShTikjUXgmxO5LIWoX7XmISs3ZmOa/b7UejY0QX+
         0RI5Fw7JnY2LgQBzZfsSeinHTMBpf1PjTk8HgdM1y0MCDxY8ihY8AcaAQksJet0uk8CG
         FJWJolpfqQkZrmLRhHdviPji0ZH9SXUk6VnQL9D66Vz9HOYQMwFX+Sn15vck94eu0Zlc
         u6tg==
X-Gm-Message-State: AOAM532qeQnhJNMFCrkYgeQiHGbc5Se+nzTD+oZamWB014gCnbp72Cky
	LGARBB3hKvCRYbM+sLGZazI=
X-Google-Smtp-Source: ABdhPJyhX3b6BOyPPYnRXXJA2E42GbHdgsl+U0YvrwnaMecNP4GSgQ9mnoCBSfoWLB14MMinAXSoOg==
X-Received: by 2002:ac2:592c:: with SMTP id v12mr26563923lfi.249.1629885340373;
        Wed, 25 Aug 2021 02:55:40 -0700 (PDT)
Received: from [192.168.1.11] ([46.235.66.127])
        by smtp.gmail.com with ESMTPSA id w18sm332803lfa.50.2021.08.25.02.55.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Aug 2021 02:55:40 -0700 (PDT)
Subject: Re: [PATCH v3 4/6] staging: r8188eu: add error handling of rtw_read16
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
 Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
 gregkh@linuxfoundation.org, straube.linux@gmail.com
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <cover.1629789580.git.paskripkin@gmail.com>
 <1665728.ljvk3MsED4@localhost.localdomain>
 <ab20fcd7-69a8-0530-7770-0e309178b0f0@gmail.com>
 <2227654.mbYB7oqmoa@localhost.localdomain>
From: Pavel Skripkin <paskripkin@gmail.com>
Message-ID: <794dfd94-fe88-43ac-c4ec-9ff7df9db6de@gmail.com>
Date: Wed, 25 Aug 2021 12:55:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <2227654.mbYB7oqmoa@localhost.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/25/21 12:48 PM, Fabio M. De Francesco wrote:
> On Wednesday, August 25, 2021 10:22:16 AM CEST Pavel Skripkin wrote:
>> On 8/25/21 7:35 AM, Fabio M. De Francesco wrote:
>> > Dear Pavel,
>> > 
>> > Please note that if and when my patch "Use usb_control_msg_recv / send () in
>> > usbctrl_vendorreq ()" will be merged, "if (res! = len)" will always evaluate 'true'
>> > and usb_read16 () will always return -EIO even if usbctrl_vendorreq () succeeds.
>> > 
>> 
>> Yep, thank you, but it depends on which series will go in first :)
>> 
>> There is a chance, that you will need to clean up this part, if mine 
>> will be merged before yours
>> 
> 
> Ha-ha ... I know that beautiful rule: whoever breaks must fix!
> However there should be another rule which says that
> the old (me) takes precedence over the young (you) :-)
> 

The main problem, that no one knows who is the "old". Greg can take 
patches in any order he wants, because they are naturally independent :)


We only can say smth like "this one depends on this one" as reply to 
patch to inform Greg about the situation.

> Seriously, thank you so much for your help and the "Reviewed by"
> tag on my work.
> 

You too :) We are doing same job here for the good of community and 
kernel itself




With regards,
Pavel Skripkin
