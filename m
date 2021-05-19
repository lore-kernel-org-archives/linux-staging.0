Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCBC02FB6
	for <linux-staging@lists.linux.dev>; Wed, 19 May 2021 14:36:24 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id t21so7154965plo.2
        for <linux-staging@lists.linux.dev>; Wed, 19 May 2021 07:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=/7osFR6MEEYQpHLWyp6KyxkTwNcxiA/gGlaqW/3bR3s=;
        b=W0auG0ei3o/B9QcqCK31lm5YRnE4wvDSB1toLIbs7NsMkpIH+mfAEGufjYzVTJXsN9
         cGTXYDJQLuK+3n0Ewm1+3RSiD/5arlhWwCECU2l6sdU0cCnstTXo03E+GlbWrOWKbaz2
         Wrin7MmqqGhnuxJJWE2kFnYiXoOtRGrWplH51rNb+m1Ao18J8Xw9RzllYAAqhtPLyYNK
         AOGz4Yfc8BPyYbI48Yg/atdmhcKFZg7Gf6tSBnG4SP9I1Z04e6XFpE52hpxo7i6Vep9U
         cGECBrH1VZ9juvjfmdD2DM25VDsVMRjx15lkZgFZvFCGW+q8IkXRniDkK3SaK1bVdLnV
         4PcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=/7osFR6MEEYQpHLWyp6KyxkTwNcxiA/gGlaqW/3bR3s=;
        b=Rn4fvxB5AyuEjoypY4Ha7l0miNxAg7UZR0m4OEyQslTxC0RmI2hICdyPLsdB9phebs
         M6DZbvRAyZUSbxrIcPYEo/IjItkx+YQRBWlGeY4ltpJA+/SMg28aFGYnXR6m80PMLV2S
         cUxxkFLGU4nqOHxfSH4voQBQGYlxqtmSBSvjbnQLXU2f1bc7WtF2CvZvz7m3lJw47x6b
         3vJWIMWiP0bioaI0FSpe7aeQ5BD4TnWuZuCCK0Xq9l4yjZiS5JgNMPAIMldPMv5kCLPw
         IStmmPSJELVJE/pJQ18CLy8fn0iyPbK7Sbna2mgtdfRs7itGq6ijTHwK06OanipNu1qd
         REnQ==
X-Gm-Message-State: AOAM5321UQUAlFUxWLosrQkkj8zmrAyXhFyJokps4sN2qRgsSXMNrHOl
	Xc5Qh21eJeMUAQczokEF18EDYfET3KZ1kAjh
X-Google-Smtp-Source: ABdhPJzrY3zr58BXKEAhkbpJsFzuw4adk1CjKpAfSqW6blcLIZp7DXwFgSeLAjZIZ4BGKoN8oAymiw==
X-Received: by 2002:a17:90a:ad44:: with SMTP id w4mr11818669pjv.71.1621434983688;
        Wed, 19 May 2021 07:36:23 -0700 (PDT)
Received: from [192.168.1.2] ([103.196.78.23])
        by smtp.gmail.com with ESMTPSA id t24sm4304154pji.56.2021.05.19.07.36.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 May 2021 07:36:23 -0700 (PDT)
Subject: Re: [PATCH] staging: android: ashmem: Declared file operation with
 'const' keyword
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: =?UTF-8?Q?Arve_Hj=c3=b8nnev=c3=a5g?= <arve@android.com>,
 Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>,
 Joel Fernandes <joel@joelfernandes.org>,
 Christian Brauner <christian@brauner.io>,
 Hridya Valsaraju <hridya@google.com>, Suren Baghdasaryan
 <surenb@google.com>, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20210519081958.7223-1-hridayhegde1999@gmail.com>
 <YKTM8KmXI8bXUSqp@kroah.com> <0ddb894f-f66f-f31b-ef8a-0646e0a99b9f@gmail.com>
 <YKTfbdFhvM7fbpet@kroah.com>
From: Hriday Hegde <hridayhegde1999@gmail.com>
Message-ID: <08cf8110-cf84-8784-c919-eba27474b796@gmail.com>
Date: Wed, 19 May 2021 20:06:14 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YKTfbdFhvM7fbpet@kroah.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 19-05-2021 15:20, Greg Kroah-Hartman wrote:
> A: http://en.wikipedia.org/wiki/Top_post
> Q: Were do I find info about this thing called top-posting?
> A: Because it messes up the order in which people normally read text.
> Q: Why is top-posting such a bad thing?
> A: Top-posting.
> Q: What is the most annoying thing in e-mail?
>
> http://daringfireball.net/2007/07/on_top
>
> On Wed, May 19, 2021 at 03:00:08PM +0530, Hriday Hegde wrote:
>> I am not really sure how to do that and how to reflect it in the patch i followed what was taught in the Beginners course and it does not mention building. I know i need to test it out but is running 'patch -p1 < x.patch what i need to do?
> That does not build the code you changed, right?
>
> I'm sure whatever course you took, it did reference the fact that you
> need to ensure that your change actually works properly by the very
> least being able to be compiled correctly.  Please go over those
> instructions again.
>
> good luck!
>
> greg k-h

I am using the A Beginner's Guide to Linux Kernel Development (LFD103) by the linux foundation for this but i cant find any commands to as to build and test , the only way i tried compiling is with a custom Makefile and it didn't work, i've got a few errors so the const keyword might not work here since the variable is being written to.

