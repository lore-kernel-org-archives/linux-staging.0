Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BFC0137A
	for <linux-staging@lists.linux.dev>; Sun, 10 Apr 2022 17:38:14 +0000 (UTC)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-dacc470e03so14919999fac.5
        for <linux-staging@lists.linux.dev>; Sun, 10 Apr 2022 10:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BRJ1jNqE28imGI7c3KAwVBu2kMXYwikyn3C4D2W3iNo=;
        b=jda4TPC9ehpKNQxn2KF6cOe16kaYExIa9GB0ZSbtjxHec21YeUFvk8JJf1r//I54Uc
         985gz2HKIFDFtutQVg34xjYgOaWz+4GjrsFrrM9/rxzIZn2ZSrrEWfcxSQUzzAHLP6qz
         qT5D/CHXqmjLyIVvZRkrYKolD1nXhbEPByc92Z57Lrb6MVekybMphKdub9QMij8PI8EN
         jqpUqNSiSOOrNl7/0GxJM1D+VZiu5jD9DfPCn2G/j/uLD4UMC9hZWv8vdh35sQlIjHXy
         YP2fMsmxpVWbMfBWlS5li9XuRZaepocmL3VqhqcuGq7q1qlOUkBUC1S6lLS6JyuOgEeP
         ZSGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BRJ1jNqE28imGI7c3KAwVBu2kMXYwikyn3C4D2W3iNo=;
        b=xbMoga3K4mKHVXsC9/MC+DlUvdXL35chNG2lhGDgXBxOOS6TJN8txfTOCCEVEbIvYW
         jSic9hoOusxhnriylHzTPYxnYvsxmENFpHdEHrOFHCHlEyhrncZ1XoHlWDa/RGvpW3+K
         aCKYGEFCjI8WN/MLLyRU2BIKSSdalAzU2p/1gXDNWnP5tOKLIBCpClufqQ4ix+yv6t8R
         iO+7hCehmrLVTFYX4u6pP4E4pR4YgU2MoFXQSd6cb75OuOxoCpYpvkUzHhQzo9OIjOC+
         KsVkJOObvJF+LRutnNYZl4XLhvatFFF+nUfsU4Ox08WngGKLi6/RbKWmB8PMGb72E1oi
         Mymw==
X-Gm-Message-State: AOAM533dicZpZ3rMMmwKhK7svRz1lm+4jvUzJH+Vf6LOzVdUdlA0eaty
	Yb7DvJiaoGu9e3hzGztmcAD6LdaSWPwN6m9wsv8=
X-Google-Smtp-Source: ABdhPJzwTW3uwroGYu3j+q5A853r1EPrtOF0Dmk2K+UyXmCYAbuguxdcR1kMcRILj7K91t5TJVp8ROjWnCzpKKvpfmA=
X-Received: by 2002:a05:6870:51c9:b0:da:b3f:2b75 with SMTP id
 b9-20020a05687051c900b000da0b3f2b75mr12624326oaj.276.1649612293601; Sun, 10
 Apr 2022 10:38:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220410163117.3964-1-makvihas@gmail.com> <20220410163117.3964-2-makvihas@gmail.com>
 <783d850ce7778e9d8f203155034e432910553b1b.camel@perches.com>
In-Reply-To: <783d850ce7778e9d8f203155034e432910553b1b.camel@perches.com>
From: Vihas Makwana <makvihas@gmail.com>
Date: Sun, 10 Apr 2022 23:08:02 +0530
Message-ID: <CAH1kMwTPkPV=gLg38m=yq=n1U2Mqa4+1XNtB_5Kc2y7O0mpMpQ@mail.gmail.com>
Subject: Re: [PATCH 1/6] staging: r8188eu: drop unnecessary wrapper rtw_free_cmd_priv
To: Joe Perches <joe@perches.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, Phillip Potter <phil@philpotter.co.uk>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Michael Straube <straube.linux@gmail.com>, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Dan Carpenter <dan.carpenter@oracle.com>, Pavel Skripkin <paskripkin@gmail.com>
Content-Type: text/plain; charset="UTF-8"

> On Sun, 2022-04-10 at 22:01 +0530, Vihas Makwana wrote:
> > Remove the unnecessary wrapper. The logic of rtw_free_cmd_priv can
> > be moved to _rtw_free_cmd_priv.
>
> If you are going to drop wrappers, my preference would be
> to drop the underscore prefixed ones.
>
Yes, that was my initial thought too. But there are already some init
and free functions in the module with underscores prefixed.
So I didn't do it that way. Maybe the developers kept it that way for
some reason.


On Sun, Apr 10, 2022 at 10:38 PM Joe Perches <joe@perches.com> wrote:
>
> On Sun, 2022-04-10 at 22:01 +0530, Vihas Makwana wrote:
> > Remove the unnecessary wrapper. The logic of rtw_free_cmd_priv can
> > be moved to _rtw_free_cmd_priv.
>
> If you are going to drop wrappers, my preference would be
> to drop the underscore prefixed ones.
>
>


--
Thanks,
Vihas
