Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF6AB3FC0
	for <linux-staging@lists.linux.dev>; Tue, 24 Aug 2021 11:07:49 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id s12so11746678ljg.0
        for <linux-staging@lists.linux.dev>; Tue, 24 Aug 2021 04:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=FpTK3hvE23pECqh9p0EL04iD+tphMlpsn6IwOnys+Yw=;
        b=MKAHNRe1lcS55l+C6nT7NY2946DeihoetzLsrM65H8RTbpH8YccKELXIddw5tqFebr
         RyxTc0FViBBli8GOFiht696B2DcQ7ieWqJPLL2UQRmJcMp181SlELCgypd4uLRj7MtSa
         gHbC3gcOYtCh1F1Jnm6wAt8nk7/ZCs7bmbpCjjKgVXQEdPExjj6uZLK2XFWKxOqaLq1F
         PRnLKkMgK2AxD6xJ+ecjNOGVhiHIsL2AIDhLj44gOqrfAe5opggNwHachKaFAnMpT3HX
         2HzBCNmW7iNWQANzQvfkpkrZ51chZCwgWyg+JipNhDZ9S/B/44ZgEdYDTn4SmRwX2pTv
         0zeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=FpTK3hvE23pECqh9p0EL04iD+tphMlpsn6IwOnys+Yw=;
        b=kV3PKhVnXHLgS91nsKhdgQAcE1Uk0USgBEzU09lNzPsxZn9nlnYNel+moHJkusfae4
         0Gci/eMnVBayDKfciQLcLAMeO7UOAwI7OIEZVYSa3ad3hOfZ8EVyhgs5j7S52BPIJ7SW
         j2p4Kk2dHdUE4P3eXI3p2wKG3G98w8y5F/oM63VAFkUL5rmAkhu+4HJqQngRIgaLbpL6
         3OLjNZL0EMqH6hoIt3RvbqxtGQfH7R1uH4vUGvTe/es0OLiOEmNG9N5pFEsKjqN+Eff5
         Bonax8BVkvtb15pKaXTHvCLesWH2p4oa9yVSbLsoGMQg/4Xk28L+ehp+qXWMPtsxOj2J
         u0hQ==
X-Gm-Message-State: AOAM532mPSt+Xp6HMB6zb285TvPY8Gx564lKH6XiomTfUdxzGeRe9Zbd
	U1pkWC8FF89mJYX/QpSL23o=
X-Google-Smtp-Source: ABdhPJzdeNtzFvmqVLRRORGLdHk7PoStaT2GgTR2xPoO/JFcfaiD+G7i7CNDEvBfQVJCY4nbmowEjQ==
X-Received: by 2002:a2e:8e8f:: with SMTP id z15mr24744472ljk.121.1629803268016;
        Tue, 24 Aug 2021 04:07:48 -0700 (PDT)
Received: from [192.168.1.11] ([46.235.66.127])
        by smtp.gmail.com with ESMTPSA id p1sm763760lfs.10.2021.08.24.04.07.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Aug 2021 04:07:47 -0700 (PDT)
Subject: Re: [PATCH 1/2] staging: r8188eu: Use usb_control_msg_recv/send() in
 usbctrl_vendorreq()
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
 Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20210823223751.25104-1-fmdefrancesco@gmail.com>
 <20210823223751.25104-2-fmdefrancesco@gmail.com>
 <68eebfaf-50a3-a7ec-12ba-cde33c74c9ce@gmail.com>
 <3198276.4iybWabFxt@localhost.localdomain>
From: Pavel Skripkin <paskripkin@gmail.com>
Message-ID: <d5ac7cd8-dc81-732d-b583-628cd2a273cb@gmail.com>
Date: Tue, 24 Aug 2021 14:07:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <3198276.4iybWabFxt@localhost.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/24/21 11:53 AM, Fabio M. De Francesco wrote:
> On Tuesday, August 24, 2021 10:13:46 AM CEST Pavel Skripkin wrote:
>> On 8/24/21 1:37 AM, Fabio M. De Francesco wrote:
>> > Replace usb_control_msg() with the new usb_control_msg_recv() and
>> > usb_control_msg_send() API of USB Core in usbctrl_vendorreq().
>> > 
>> > Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> > Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
>> > ---
>> > 
>> > Thanks to Pavel Skripkin <paskripkin@gmail.com> for his review of the
>> > RFC patch.
>> >   
>> > drivers/staging/r8188eu/hal/usb_ops_linux.c | 25 ++++++++++-----------
>> > 1 file changed, 12 insertions(+), 13 deletions(-)
>> > 
>> > [...]
>> >
>> Hi, Fabio!
>> 
>> Christophe is right about semantic part. 
> 
> Hi Pavel,
> 
> I haven't yet read Christophe's message (but I'm going to do it ASAP).
> I hope he found out what is wrong with the code, what made Phil's tests
> fail.
> 
>> Also,
>> 
>> if (!status) {
>> 
>> } else {
>> 	if (status < 0) {		<-
>> 					  |
>> 	} else {			  |
>> 					  |
>> 	}				<-
>> }					
>> 
>> Extra if-else is not needed, since status can be 0 and < 0, there is no 
>> 3rd state, like it was before.
> 
> Correct, thanks!
> 
> Now I read the following from the documentation of the new API...
> 
> "Return: If successful, 0 is returned, Otherwise, a negative error number."
> 
> I'll remove that status < 0 check and whatever else is no more necessary.
> Thanks, again :)
> 
> Regards,
> 

Btw, not related to your patch, but I start think, that this check:


	if (!pIo_buf) {
		DBG_88E("[%s] pIo_buf == NULL\n", __func__);
		status = -ENOMEM;
		goto release_mutex;
	}

Should be wrapped as

	if (WARN_ON(unlikely(!pIo_buf)) {
		...
	}

Since usb_vendor_req_buf is initialized in ->probe() and I can't see 
possible calltrace, which can cause zeroing this pointer.

Something _completely_ wrong is going on if usb_vendor_req_buf is NULL, 
and we should complain loud about it. What do you think?


With regards,
Pavel Skripkin
