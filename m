Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBBEB3FC2
	for <linux-staging@lists.linux.dev>; Fri, 27 Aug 2021 08:23:02 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id y6so10088807lje.2
        for <linux-staging@lists.linux.dev>; Fri, 27 Aug 2021 01:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=cGwCG4HWLVFH04pdCsg/k68G0ZdJYQVWI5q4QdMN3/o=;
        b=duKXzoEFn/SCWVeUH1ArFyk7tlUT7O2ap6nnddPyP28QSn7A3DvXS64jCE0dXQOGdw
         BD8KoYSUt8dz+w25h39FcTNt9gbXmVrk8K5T8ZZYh8y68/60jjl0hvA7wxXjGsaENNBI
         ohafQ3LqWXsIQbQVSbv1Cuzz6IXbS5Z0wpV4+mvGNxZApHB2ku3wc72hjpAVnKvDtpKf
         vjkyxb/Da9zG5uJb1iQRq93Cf0ft5JvOi1xxlN0Jtz3KzXIUOqm8/tQ1IVk1x3WIUPQO
         2imh0nt+zQNYkmpBlJrv/qBC6kZI+4yoXq/z+RaQi8ekxWh/Hp6xW1BVcileC1qLgwZb
         M40A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=cGwCG4HWLVFH04pdCsg/k68G0ZdJYQVWI5q4QdMN3/o=;
        b=ClebZyVEsaoxcqDQB9Ad892sY3LZpaHyfEE1XS1h5nIbgMGXELszm6JtGZOd0i6k3E
         bXWGIycGtEmsH4BiAtXMsWdiHFxYOYcdgc81HHmVKkt9g8u8zXfbzSZp6khQnfUMumnM
         pSMrherzEF8XnrVe/Lh1WfOYPstU6lxvNq7YX6b9L9Ss0vfPlnX30FydO1tM0UJ/iizE
         s+sqQNRfveQX0yhJO31FZme+eW9Ovo0FaXKI4CsI6jenNVw9XAEcB1M0vDOBJ4f8il3H
         D7dai2tkHg7xdU9NT5fuU0hEdTSnunHWoAwp/YQ+kT4OhNRF/xm4bTkwfVDY9640Kj4K
         sS8w==
X-Gm-Message-State: AOAM530n4Peer3pa+O6PhLB8zsVHw0RRX925p0VcQn0rd+0eIvJoLyrB
	Ad+w/4W+Yk7UgL2Qk0Zg9Jg=
X-Google-Smtp-Source: ABdhPJwzbZ61gzIoMYR8ibWU3hLXcE/h5UhDkzbUHSdKlfEe+cAu990EorN0eez/nBnDHDBC9t1pgg==
X-Received: by 2002:a2e:934b:: with SMTP id m11mr7038709ljh.284.1630052580989;
        Fri, 27 Aug 2021 01:23:00 -0700 (PDT)
Received: from [192.168.1.11] ([46.235.66.127])
        by smtp.gmail.com with ESMTPSA id z5sm608034ljz.23.2021.08.27.01.22.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Aug 2021 01:23:00 -0700 (PDT)
Subject: Re: [PATCH v3 3/6] staging: r8188eu: add error handling of rtw_read8
To: David Laight <David.Laight@ACULAB.COM>,
 'Dan Carpenter' <dan.carpenter@oracle.com>
Cc: "Larry.Finger@lwfinger.net" <Larry.Finger@lwfinger.net>,
 "phil@philpotter.co.uk" <phil@philpotter.co.uk>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "straube.linux@gmail.com" <straube.linux@gmail.com>,
 "fmdefrancesco@gmail.com" <fmdefrancesco@gmail.com>,
 "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <cover.1629789580.git.paskripkin@gmail.com>
 <c59d5d850bf9aab208704182c83086609289cb9c.1629789580.git.paskripkin@gmail.com>
 <f5c20e0f1b934e04ad11a3627d71f5db@AcuMS.aculab.com>
 <20210826112745.5e1421ed@gmail.com>
 <a251767ca181405b93b5ea55a26c3ff0@AcuMS.aculab.com>
 <20210826112127.GZ1931@kadam>
 <dc133b63e1f54f45a19e67d75a6fcb40@AcuMS.aculab.com>
From: Pavel Skripkin <paskripkin@gmail.com>
Message-ID: <b4d8ed8f-db03-a5b1-bb7a-0f086ea8ffbd@gmail.com>
Date: Fri, 27 Aug 2021 11:22:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <dc133b63e1f54f45a19e67d75a6fcb40@AcuMS.aculab.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/27/21 11:14 AM, David Laight wrote:
> From: Dan Carpenter
>> Sent: 26 August 2021 12:21
> ...
>> > > > ...
>> > > > > +		len += snprintf(page + len, count - len,
>> > > > > "rtw_read8(0x%x)=0x%x\n",
>> > > > > +				proc_get_read_addr, (u8) tmp);
>> > > >
>> > > > That is broken.
>> > > >
>> > >
>> > > Don't get it, sorry. Previous code did exactly the same thing, but
>> > > didn't check if read() was successful.
>> >
>> > Look up the return value of snprintf().
>> >
>> 
>> It's hard to understand what you are saying.  I think you are confusing
>> libc snprintf with the kernel snprintf?  In libc the snprintf function
>> can return negatives but in the kernel it cannot.  This is not going
>> to change.  Any code which checks for negative snprintf returns in the
>> kernel is wrong and should be fixed.
>> 
>> Anyway, the code works fine.  snprintf here is going to return a number
>> between 18-32 range.  It's not going to overflow the PAGE_SIZE buffer.
> 
> IIRC it is also in a loop ...
> 
> Maybe, but the idiom is just broken.
> Largely the result of snprintf() is never the value you are looking
> for and should be ignored.
> 

AFAIK, snprintf return value is largely used in sysfs at least.

$ grep -Ir "= snprintf" | wc -l
1200

Anyway, I will convert this dead code to sysfs interface and maybe 
snprintf will go away...



Thank you for your help and comments


> Userspace fprintf() is even worse.
> If you care about the write failing you need to call fflush()
> and then ferror() (typically before fclose()).
> 
> Fortunately I've never seen a 'must check' attribute on it.
> 
> 	David
> 
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)
> 


With regards,
Pavel Skripkin
