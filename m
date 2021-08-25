Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688CB3FC0
	for <linux-staging@lists.linux.dev>; Wed, 25 Aug 2021 10:41:56 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id o10so51950608lfr.11
        for <linux-staging@lists.linux.dev>; Wed, 25 Aug 2021 03:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=rGRHoxWTYsZ2ancUp4Mt0E/4VV8VJ/nnMF5nCt2kATU=;
        b=ooR9aQ9YBN+6sdCKSrhKZFMEHsttqfWZ4p4NsKi0f0mWDcfU6QmsNRQhCIIOz6QlQB
         3MMqYYxgRrA/hEQi3gMOM6lQL3bN2Fw6smJv4qqtdhzWvRCHcGmjB5/vrDsfC/tk1Llt
         r0UqCJBfbwP+tf3rgcF9TRZwRh6cnxdmFlI3vq4EniTDj6S6PDULagOScgl4dm4LH5UR
         qeJAFWhj8QF4lt/dTOl2FuLRo3eN+inECiBTCI9xFnaYb0fvnzjEvNRtzLT37SKtRD53
         p6K/PBA9AUSfKIfLov2AllN92umVq4yt6P+J11JgEIBfwfrl/cjTj8rWEAXyNsBMN/Qq
         yKgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rGRHoxWTYsZ2ancUp4Mt0E/4VV8VJ/nnMF5nCt2kATU=;
        b=eQAEGbElQR3qwf8fFZBKeBjqKl2iX7/h7bmZw/f2yNJjJpFDQOqDkY0KOtHLU4bC/q
         c4J0ovKW80xKbwt9PemnH4wP6z0NKOzl3bYuUeQqGyzz7UK65gQRAiBB6+0T68AMaylF
         R48IbfKxMls3u8jF+W+qzR1DK8KaRE+/TuCzp1VbsS5qAjs/2lPCrclf7lSnDeMiutcr
         Yd8E3UfNpdg+Skf/Toya2k75bnXFrTTBAu+CNfjSnpgrKpzmSpQKEAcWmQ63jQyAgqmX
         XgZnagEspZoFgCCgaXExuypvlI/FKilv9FYamHd/Nuchx4ReF+/ZNheODHP9zXWXm4gl
         Ve2Q==
X-Gm-Message-State: AOAM531PktjedVh2Rxe7s2c6+uSuhzyL9ZR4zxaHnKGZpOsaWR3lTvZb
	SUT6o1xmUHivWYCH4WcgaaI=
X-Google-Smtp-Source: ABdhPJygjsmJWLm0id3fQ1AG48XpgXk0LJRMjIVEwaVM0OORRZGLvuatloMoJEaj6Jb3uNaHDfwFSA==
X-Received: by 2002:a05:6512:3d16:: with SMTP id d22mr32405295lfv.132.1629888114427;
        Wed, 25 Aug 2021 03:41:54 -0700 (PDT)
Received: from [192.168.1.11] ([46.235.66.127])
        by smtp.gmail.com with ESMTPSA id l14sm2010480lji.106.2021.08.25.03.41.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Aug 2021 03:41:53 -0700 (PDT)
Subject: Re: [PATCH v3 4/6] staging: r8188eu: add error handling of rtw_read16
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
 Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
 gregkh@linuxfoundation.org, straube.linux@gmail.com,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <cover.1629789580.git.paskripkin@gmail.com>
 <1665728.ljvk3MsED4@localhost.localdomain>
 <ab20fcd7-69a8-0530-7770-0e309178b0f0@gmail.com>
 <2227654.mbYB7oqmoa@localhost.localdomain>
 <794dfd94-fe88-43ac-c4ec-9ff7df9db6de@gmail.com>
 <20210825100647.GS1931@kadam>
 <3396277b-6d80-b621-0ef0-71de7d581602@gmail.com>
 <20210825103802.GS7722@kadam>
From: Pavel Skripkin <paskripkin@gmail.com>
Message-ID: <a38b05bc-abeb-7d30-736f-1bd68c2517c3@gmail.com>
Date: Wed, 25 Aug 2021 13:41:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210825103802.GS7722@kadam>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/25/21 1:38 PM, Dan Carpenter wrote:
> On Wed, Aug 25, 2021 at 01:13:54PM +0300, Pavel Skripkin wrote:
>> On 8/25/21 1:06 PM, Dan Carpenter wrote:
>> > On Wed, Aug 25, 2021 at 12:55:37PM +0300, Pavel Skripkin wrote:
>> > > The main problem, that no one knows who is the "old". Greg can take patches
>> > > in any order he wants
>> > 
>> > Patches are always taken in first come first serve.
>> > 
>> 
>> 
>> Ok, but if pending patch needs new version, then it will be taken at the
>> end?
> 
> Versions don't matter.  No one is tracking any of that.
> 
> A patch arrives.  It is either applied or rejected.  First come first
> serve.
> 

Ok, big thanks for explanation

>> 
>> Here is the situation we have:
>> 
>> 	I have the patch series based on old function behavior, it was
>> 	posted first
>> 
>> 	Then Fabio posted refactoring of the function and it changes
>> 	return values.
>> 
>> 
>> Both series are pending right now and made on top of staging-next branch.
>> Who needs to rebase? I think, applying these series as-is can broke the
>> driver, since error handling will be broken
> 
> That's a bug then.  The patch should be rejected.  You're not allowed to
> break the code.
> 
> Also don't write patches which lead to merge order breaking the code
> silently.  That makes it difficult for stable as well.  For example,
> don't do this:
> 
> -void frob(int a, int b);
> +void frob(int b, int a);
> 
> In that case, you would change the name of the function so that the
> build would break when people mix old and new code.
> 

Understandable, thank you :)





With regards,
Pavel Skripkin
