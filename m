Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C19173
	for <linux-staging@lists.linux.dev>; Tue, 25 Jan 2022 10:06:17 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id p27so55770711lfa.1
        for <linux-staging@lists.linux.dev>; Tue, 25 Jan 2022 02:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=ud9DiM8VXrKsWeZzHUUKWRDkppaHwsBI8qRwydUZ+m0=;
        b=YpEDvIqtEPJyL6+mUnjFt0QsJRSM/uIFV3c5/0abH9LNVkVGRRRDgylx0YJjbi9x6o
         mAohTRQbsIv79sGcU4vfzaL9yzAMbBPmISvk95mkinJ+7DL8K99RL6BwqSzGWfIvF9/Q
         jpzQGP7bkh58oWrgs9upXmWxdVTRq6IYmopDxphx4YA7fzXxtBF2Q3hZJMJD5WHq9L29
         +5r6xlEhck9jx1jOnIA+nBcdEDaOU5dimhhV4plCUaH839DkeAkih652uualzT7k7sIW
         9CZ5csJNgbJLlWceD5M1buQng8t+NkDuOp3FpHkN1cjDoG0KEaTuXqDM562YyiAfISZT
         uXRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ud9DiM8VXrKsWeZzHUUKWRDkppaHwsBI8qRwydUZ+m0=;
        b=zmMXsls+k9OBD60h+ePRj/zlpCHUVpC/d2oVaWBCePvy3iUXlqXti75uy31eDAwt5O
         0WSaegzdg0pcmnYuZudSypJFEXxVqvatIeZ+SoWGB4fMkySs+VWdaZZ5oytL4sPaT/Eb
         Cjy6AjRpIstqoUorcTzEOUBzFW3r6OW0h7equKWRFwPgZU7QCwu0cdSeMBBLnEpA9U5N
         ZicUDCWB3v9oLIly3Tc5kBvrtdTE+Nxyg40XFKjNEX/3vn7h9rm6gFXca+8bkJ1+US+/
         jhl/D4wbAJrjgfAKIJqZrR1UJLphaIIPTF4cZ0aI/wKNXQ7D2CXGQRYauvzEsHtKiATB
         eKkQ==
X-Gm-Message-State: AOAM531161CEgkDX7dQxdzLR66Jm42WajGFBZ0SQfQO9bRtY0lTTP+dm
	bGiGeOqLlzVVyiJCB0vmeFE=
X-Google-Smtp-Source: ABdhPJxw/bvArVLR/7d+tKW8D9mkO4ehCNLAbjHSTEEfEuQvsMAcJClYSXyNTJGH73wxjsA3zMGelw==
X-Received: by 2002:a05:6512:6cd:: with SMTP id u13mr10622286lff.477.1643105175547;
        Tue, 25 Jan 2022 02:06:15 -0800 (PST)
Received: from [192.168.1.11] ([94.103.227.208])
        by smtp.gmail.com with ESMTPSA id g26sm1440265lfj.176.2022.01.25.02.06.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jan 2022 02:06:15 -0800 (PST)
Message-ID: <99efd1a3-9605-ffe9-5d3c-51312ce7a4d6@gmail.com>
Date: Tue, 25 Jan 2022 13:06:14 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 08/18] staging: vchiq_core: simplify
 vchiq_add_service_internal
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 bcm-kernel-feedback-list@broadcom.com, Phil Elwell <phil@raspberrypi.com>,
 Gaston Gonzalez <gascoar@gmail.com>, linux-staging@lists.linux.dev
References: <1642968143-19281-1-git-send-email-stefan.wahren@i2se.com>
 <1642968143-19281-9-git-send-email-stefan.wahren@i2se.com>
 <74c587ca-4ce9-68e6-8eb1-f956ca05cef3@gmail.com>
 <20220125095940.GT1951@kadam>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <20220125095940.GT1951@kadam>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Dan,

On 1/25/22 12:59, Dan Carpenter wrote:
[...]

>> > -	service->trace         = 0;
>> >   	atomic_set(&service->poll_flags, 0);
>> 
>> Nit: atomic_set(0) can be also removed
>> 
> 
> No, let's not write code that assumes it knows atomic_t internals.
> 

Isn't atomic_set() just (let's say) "magic" write to memory in all 
cases? Am I missing some design issue here?




With regards,
Pavel Skripkin
