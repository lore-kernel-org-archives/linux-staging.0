Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A486D0D
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 10:00:29 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id y20-20020a1c4b140000b029011f294095d3so818286wma.3
        for <linux-staging@lists.linux.dev>; Wed, 07 Apr 2021 03:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=waneLiTPyr93n33EgplSceqj/1lZ2OvepBeYFzO1CDY=;
        b=l9gXrPML27gIv5NpFap6oZbVP4Tv4ly4vNEAMCuZsyngDUV4qQvsQd90iJ8zznCYqV
         tbWny/27otQejhIzIbuxilv2zl1drdUW98+8msECUFcbybKNxlTJVDZ7MAh7CenAUj3Q
         wFqnBFL5nwSRXWlyrMScKPcUXabEFFrq/bHMJDrYgNTlj93evTTG8E2aPVppw3TIr9cl
         LNBKVNm6Jbp114DZCw0AayTSL34ugn1IVwGRhv7f74yT6+IrzBNOhFMi0dUfG6IAl+RC
         IH3C0asFWlUDKBjpcE/BezhKulBZBb7tEDv+FuaIwdroAHGip+ctCZrq6Qiw9twauy/8
         Z1CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=waneLiTPyr93n33EgplSceqj/1lZ2OvepBeYFzO1CDY=;
        b=arvomo5cvFUJI6k2l44RW6mACKiZym5DORk3udqKAD1yxHilBkT4pX+VVZA8sz2CHo
         W1RzVmh7KF7/fRdnRz0W3G+l4tWZVPZS9rmeP/aT2rNMreuw6jpW7pjqyxFADcMSB0EW
         ZUwFOZjMeRVR/a3BmopKJ9aXToaqIo2q53jGaQTIYl2b59pmVUM9S4vxM/cPfWYTdzGB
         FI5gwexD8t0CPvfuqcYu7lPTXM/DWsmCE1Cd9CrCrhUpfvxy7+WIgspP3JDNqJ6H3wvf
         ecJGvEHSad74dVe0WQR5qsOrzcw9BL9NK1WePS3be5MianuVNd1+f+zTSMIfeY6Nm1zt
         mOXA==
X-Gm-Message-State: AOAM532NktAfUbnrYUFJcbpdIfOePQs2MnQQxcPeB6rMfVR1WBi6Yxyj
	8Vo8XGIEEo6L4XqPnsSFOCE=
X-Google-Smtp-Source: ABdhPJz3Do1VWrBS6vJD+XdmeCYawjFe0NvVElfquSm+wCALRzeCfI/kmhMqkHH+2oDVB3Kl+GKu5w==
X-Received: by 2002:a1c:bc8b:: with SMTP id m133mr2276492wmf.103.1617789628543;
        Wed, 07 Apr 2021 03:00:28 -0700 (PDT)
Received: from ?IPv6:2001:818:de85:7e00:ef5c:3f2a:a646:d6ec? ([2001:818:de85:7e00:ef5c:3f2a:a646:d6ec])
        by smtp.gmail.com with ESMTPSA id k131sm5635210wmf.39.2021.04.07.03.00.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Apr 2021 03:00:28 -0700 (PDT)
Subject: Re: [Outreachy kernel] [PATCH 1/2] staging: media: omap4iss: Ending
 line with argument
To: Matthew Wilcox <willy@infradead.org>
Cc: laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
 gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 outreachy-kernel@googlegroups.com
References: <cover.1617287509.git.martinsdecarvalhobeatriz@gmail.com>
 <441d27060ff6477d0ad418f41e194b96373c1f7f.1617287509.git.martinsdecarvalhobeatriz@gmail.com>
 <20210401152844.GF351017@casper.infradead.org>
From: Beatriz Martins de Carvalho <martinsdecarvalhobeatriz@gmail.com>
Message-ID: <e175859f-4f68-0408-415f-a3e19f7e4874@gmail.com>
Date: Wed, 7 Apr 2021 11:00:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210401152844.GF351017@casper.infradead.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


Em 01/04/21 16:28, Matthew Wilcox escreveu:
> On Thu, Apr 01, 2021 at 04:07:38PM +0100, Beatriz Martins de Carvalho wrote:
>> diff --git a/drivers/staging/media/omap4iss/iss.c b/drivers/staging/media/omap4iss/iss.c
>> index dae9073e7d3c..e8f724dbf810 100644
>> --- a/drivers/staging/media/omap4iss/iss.c
>> +++ b/drivers/staging/media/omap4iss/iss.c
>> @@ -559,9 +559,10 @@ static int iss_reset(struct iss_device *iss)
>>   	iss_reg_set(iss, OMAP4_ISS_MEM_TOP, ISS_HL_SYSCONFIG,
>>   		    ISS_HL_SYSCONFIG_SOFTRESET);
>>   
>> -	timeout = iss_poll_condition_timeout(
>> -		!(iss_reg_read(iss, OMAP4_ISS_MEM_TOP, ISS_HL_SYSCONFIG) &
>> -		ISS_HL_SYSCONFIG_SOFTRESET), 1000, 10, 100);
>> +	timeout = iss_poll_condition_timeout(!(iss_reg_read(iss,
>> +							    OMAP4_ISS_MEM_TOP, ISS_HL_SYSCONFIG)
>> +							    & ISS_HL_SYSCONFIG_SOFTRESET),
>> +							    1000, 10, 100);
> This is not a readability improvment.  I would factor it out into its
> own function.

Thanks for the review. How can I do this? I don't know how to do this.
Beatriz Martins de Carvalho
