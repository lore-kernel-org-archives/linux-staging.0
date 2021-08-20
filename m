Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796A472
	for <linux-staging@lists.linux.dev>; Fri, 20 Aug 2021 17:13:18 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id m7-20020a9d4c87000000b0051875f56b95so15313348otf.6
        for <linux-staging@lists.linux.dev>; Fri, 20 Aug 2021 10:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=FXSqbQkGwpmuS098nxMAvtEnVwMvIhc8mYNL176c7Gc=;
        b=LhTpqsGUoUHR22mwvjEuKWTyIgpnlo0fudH8JszfBfl8vw/u7iDHObOKAlj5JCWo+r
         QfhXJVCPgtqftDEL4YbzXxc8zt+qPkORkpdzn7yXHvaBt0+yijNwLv1F/gHBx64AwmNA
         u4Ho1lWEZOyDFTApDW/XxNkr74fCgwT3oCOmHagk+CkeFakWC3AOrlrY04kBgovbkomz
         terQGzTTPjYGtRGesP//tqfvP6NfC4YZVKMrxkMHim2FeioiyXZQR8EuGTUc547J61Es
         3IF2Ye8kLKDatrOpJnOCPyOgr3nDS5mQQ5lCIrdJ44Ge6o5ylltd+I+MyUk162HqNtkS
         YuaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=FXSqbQkGwpmuS098nxMAvtEnVwMvIhc8mYNL176c7Gc=;
        b=VSC3Phjzszm3/cLj5xTMLNOkou4+vI56VOwwgRu5gDUB10ZWKs30d1mSH9O1IJ/Wh9
         deIiIcF6iEQaDYF+veBHsks9lRLBaVl4+yAIWLVroxWCe7xW5dzGMHpYirG35k8AK+fk
         EsjHaPPtwbiysn15NBvCyp00bWVeH13RF6fdwR3G4L4HJ1LOSdfCmvXbTvBFn9MZBU5E
         sHRgKVdZVe4PQyTJ1Oel4Mo6FKoSC+5aWc6IHUQATGFCk2H1Inec6gSz1Jd7cwcSW4nm
         GhPB+3lbovCwpVd6BQv9O5skml0zdcDQS38xZyVSK8ARq67RH8Z74fLqgCAhMusxMNfx
         qjhw==
X-Gm-Message-State: AOAM533kpsJE8UuWxrJvqnhJDF6kijw9wMPkxclljlK3rC9OtTtfHaT3
	jaouK+Mo54dLJE5qocFJHys=
X-Google-Smtp-Source: ABdhPJwoXP+Q96yW0pS89vi2le0AyX3sajJwfU8BRmrxi9PhyXb7BshkwPYpy2+TrWz/FqIf826Zew==
X-Received: by 2002:aca:2206:: with SMTP id b6mr3687793oic.88.1629479597791;
        Fri, 20 Aug 2021 10:13:17 -0700 (PDT)
Received: from 2603-8090-2005-39b3-0000-0000-0000-1023.res6.spectrum.com (2603-8090-2005-39b3-0000-0000-0000-1023.res6.spectrum.com. [2603:8090:2005:39b3::1023])
        by smtp.gmail.com with ESMTPSA id 32sm1590953otr.2.2021.08.20.10.13.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Aug 2021 10:13:17 -0700 (PDT)
Sender: Larry Finger <larry.finger@gmail.com>
Subject: Re: [PATCH] staging: r8188eu: clean up endianness issues
To: David Laight <David.Laight@ACULAB.COM>,
 'Aakash Hemadri' <aakashhemadri123@gmail.com>,
 Phillip Potter <phil@philpotter.co.uk>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Bjorn Helgaas <bjorn@helgaas.com>, Shuah Khan <skhan@linuxfoundation.org>
References: <8a3fca82d9ec5dde9e42d40f0268a324cc87ebc6.1629301854.git.aakashhemadri123@gmail.com>
 <3dfde3cd06094e52b71b48a3a2524226@AcuMS.aculab.com>
From: Larry Finger <Larry.Finger@lwfinger.net>
Message-ID: <8bd7047c-49d1-b93d-3ccb-96d9773f3f66@lwfinger.net>
Date: Fri, 20 Aug 2021 12:13:15 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <3dfde3cd06094e52b71b48a3a2524226@AcuMS.aculab.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/20/21 5:26 AM, David Laight wrote:
> From: Aakash Hemadri
>> Sent: 18 August 2021 16:53
>>
>> Fix these sparse warnings:
> 
> Did you test this code before and after the changes?
> 
> I think you've changed the behaviour on LE systems which
> are probably the ones it was actually tested on.
> 
> Don't blindly change code to fix sparse warnings.

I'm late getting into this conversation. Gmail thought the original patches were 
spam.

First of all, we need to change the behavior as the original code is wrong; 
however, the code involves PPPoE, which I have never used, and never tested. I 
still need to check the correct endian values for one of the packet types. I 
hate reading IEEE official documents!!!!

I should have a review of the patches later today.

Larry

