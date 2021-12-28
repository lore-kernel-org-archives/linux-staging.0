Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB49729CA
	for <linux-staging@lists.linux.dev>; Tue, 28 Dec 2021 14:50:24 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id o7so21040796ioo.9
        for <linux-staging@lists.linux.dev>; Tue, 28 Dec 2021 06:50:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=l9nM/caC7jqplBef01OjNObpmzs6O53UR3TuHU2t930=;
        b=UZinsWCZe0ig758ZYaZg6eSk8CKPxR3PgBVvDfPOd0kgcrjKqBQeoD/Rtf61ksbFxU
         KWnQTqobxvDG7SJHhkjT/zSks3ZJhcvhfSAGlKa9HUdASuJofy2z/xWSpk4QF/TIcJKH
         iDbn5fBKSN/te5FWgkWD3LVlybAet056CZ3uQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=l9nM/caC7jqplBef01OjNObpmzs6O53UR3TuHU2t930=;
        b=GQhJQTlBmGlQ6310KKk6Xwj/pca6ln8pYOEgoPOMEgsclCVUMQtD5eEHJI2iOuCALh
         oI8QHcz9e5vIHLO19JFsjYmz5DQuM9ItD8ryVAi9K21nHydNwe2r05IRSAduezUNXks9
         vZZYc/LVSZhJa7gkEppIgpEpJrF/G/E3ctIfUtJ0Rp9XkScFgRZJ5+zLmciedZ52ffc0
         Y1XLeA7dmLdvZx9fP9+dpxFotR6nV8TfKXv89DPwbwwkULYv+Or3WYzluW1T/TYuxUtF
         9XopPeYdks+/k4Oy/uKgyZVOx51QPIWjtO469kxtWvug8ZJWPz0CBT4tXUaiCA57qom7
         UUSg==
X-Gm-Message-State: AOAM532lDIB6x7jZJyrkcX8ySYG+zzDzNwZzoYSs3CTr45zq9GfM4694
	Fr5RnWDRw+EODT7AKD7qpQSiNg==
X-Google-Smtp-Source: ABdhPJxw2e4B7IZMXTMBU/MguvgUyWMDdeJBwhgrgC7n+eBhfsdp+BFLVDXHmuv2wBeA6fO49CxqOw==
X-Received: by 2002:a5d:9f4c:: with SMTP id u12mr9371354iot.22.1640703023773;
        Tue, 28 Dec 2021 06:50:23 -0800 (PST)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id m2sm11776748iob.21.2021.12.28.06.50.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Dec 2021 06:50:23 -0800 (PST)
Message-ID: <2410da25-5f91-dd4c-77d0-b7226b56616d@ieee.org>
Date: Tue, 28 Dec 2021 08:50:22 -0600
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH] staging: greybus: audio: Check null pointer
Content-Language: en-US
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>, vaibhav.sr@gmail.com,
 mgreer@animalcreek.com, johan@kernel.org, elder@kernel.org,
 gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20211228020221.1635885-1-jiasheng@iscas.ac.cn>
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20211228020221.1635885-1-jiasheng@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/27/21 8:02 PM, Jiasheng Jiang wrote:
> Sorry the previous email is forgetten to wrap line.
> This email is corrected and the content is the same.
> 
> On Mon, Dec 27, 2021 at 11:54:10PM +0800, Alex Elder wrote:
>> I think this is a good change, but I would like you to improve
>> the description, and fix some different bugs introduced by your
>> change.
>>
>> What you are specifically doing is checking for a null return
>> from devm_kcalloc() in gb_generate_enum_strings(), and are
>> returning the NULL pointer if that occurs.  That means you
>> need to update all the callers of gb_generate_enum_strings()
>> to also handle a possible null return value.
>>
>> The fix does a good thing, and your description is correct
>> about what you are fixing.  But it should supply more
>> complete context for the change.
> 
> Thanks for your advice, I will correct my description in next version.
> But I still have some question about the devm_kzalloc().
> 
>> You can't simply return here.  If you look a bit above this,
>> where the call to allocate a control structure is done, you
>> see that a NULL return there jumps to the "error" label, so
>> any already allocated and initialized control widgets get
>> cleaned up before returning.
> 
> Actually, I have already thought of whether it needs to free after the
> devm_kzalloc().
> As we can find in the gbaudio_tplg_create_widget(), the widget_kctls is
> allocated by devm_kzalloc(), but isn't released when
> gbaudio_tplg_create_wcontrol() fails and goto error.
> And I check of the comment of the devm_kmalloc() in `drivers/base/devres.c`,
> because devm_kzalloc() returns devm_kmalloc().
> And it says that "Memory allocated with this function is automatically
> freed on driver detach."
> So there is no need to free the memory manually.
> Is that right?

You are partially right, but you're missing something.  Yes, anything
allocated with devm_kzalloc() will be freed automatically when the
last reference to the device is dropped.

But the two places you're returning are in the middle of a loop (in 
gbaudio_tplg_create_widget() and gbaudio_tplg_process_kcontrols()).
Each is building up a sort of hierarchical data structure, and as
you can see, the existing code takes care to de-construct the partially
built structure in the event an error occurs before it completes.

There is a chance that your simple return would "work", but by
reading the surrounding code you should recognize that the proper
way to handle the error is to jump to the cleanup at the end.

The other alternative would be to fix those functions so they
don't do that controlled cleanup on error and simply return
early (as you were proposing).  But without digging deeper, I
would assume the original developers designed it this way
very intentionally, because it avoids a problem somewhere.

					-Alex

> And I am sorry again because of the lack of the above explanation in my
> commit message.
> I will also add to my new commit.
> 
> Thanks,
> Jiang
> 

