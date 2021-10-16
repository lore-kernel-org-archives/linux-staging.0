Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F402C83
	for <linux-staging@lists.linux.dev>; Sat, 16 Oct 2021 14:33:17 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id r10so31576062wra.12
        for <linux-staging@lists.linux.dev>; Sat, 16 Oct 2021 07:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=idYztUyu5/NmJ0nSrqXeX0um6ddWJVBcDb90sOh6alA=;
        b=p4XbeylLjQhni1UJ8oKQys3fJiPZNxE04sbcPo9oeh9VOUPxMoN7IEwoI+arZe7orA
         P0LrLMPC2sLe6DStZ2SqmsnBYdoIVYP2R6FmgnzwYfSbXA2OAkn5lWou/+87n1N3Hjac
         eZ86YYLN/EG0qCWNaP+cjnR/WMpXmk80lERhXXZ5rFNJy7EAMa0+2LHR1n0mpS7CD9Ne
         WSjwRg1xm7m+2nIEGqXiZ1M5ptyElhMrGOwrESVC8nRAwX8t/79B4M+Z8oB4360Seg4A
         +VlsdKBQajR/9qXZNLRopoqW8XLw6DYP7oN8F3eCHoaHiw6zWz1WynlrY8OQNK6pSvOg
         2SOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=idYztUyu5/NmJ0nSrqXeX0um6ddWJVBcDb90sOh6alA=;
        b=aBD07vbKVVHCjm2oKzPO7JJsC47sH1cj0fb861q5FaAvjJa/hmb86cdr85oXSg+bc4
         hvGgDGplU56N0aazDDJQfvIT7mCuxN49hUJqQZm2v1CcVOn+nmS+ZfqrDNZ77K8ApmZW
         4GS+nctpQYB3xJj0/ZLYwDgGfu4b0AygYy8UG9YrfQ2aVv2c/AjXOiUiITixgnZjSZIk
         zr2lh60PF1HGj6N8RN3V5HqVEN0ONZz8cxKURQTITkJOVMJhUcECgz2TGjayqgaz17iM
         l2eZqGkAE4FGTfGcq6CfdEGBA1tlVlz0qg07lBYWlAJoOFYMmM6fjsphaRqJ1HGH1r92
         P5nA==
X-Gm-Message-State: AOAM530RS7QCvUY6NR+JR9mduoIFkdWuJNYlg5jUOYHrSJEGkK+PQ71P
	l2yY9jL0woXRxsW1kSJShy+wRg==
X-Google-Smtp-Source: ABdhPJxp8A6H5iId25YJ1awwSy3ISnoW5kjD9/jfit8S8kB8k77RN6ZxXS4EhVhlr1pisZz3AvI6Jw==
X-Received: by 2002:a5d:6e8d:: with SMTP id k13mr22321139wrz.295.1634394795614;
        Sat, 16 Oct 2021 07:33:15 -0700 (PDT)
Received: from equinox (2.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0::2])
        by smtp.gmail.com with ESMTPSA id g12sm13315099wme.3.2021.10.16.07.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Oct 2021 07:33:15 -0700 (PDT)
Date: Sat, 16 Oct 2021 15:33:13 +0100
From: Phillip Potter <phil@philpotter.co.uk>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: Larry.Finger@lwfinger.net, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	dan.carpenter@oracle.com
Subject: Re: [RFC PATCH] staging: r8188eu: Use completions instead of
 semaphores
Message-ID: <YWriqaly1skBHnIX@equinox>
References: <20211015110238.1819-1-fmdefrancesco@gmail.com>
 <YWm/x56aX+rNOlE0@equinox>
 <5414235.RPW7nLbG7U@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5414235.RPW7nLbG7U@localhost.localdomain>

On Sat, Oct 16, 2021 at 08:59:27AM +0200, Fabio M. De Francesco wrote:
> P.S.: No need to apologize at all :)
> 
> I had noticed that you haven't been around for a while. I would have 
> appreciated a review from you (and Larry) on the series of 32 patches that 
> Pavel Skripkin and I co-developed and submitted some weeks ago.
> 
> However, I am 100% sure that you really had some important reasons for not 
> being here.
> 
> > 
> > Regards,
> > Phil
> > 
> 

I have no excuse, other than simply not having enough hours in the day
:-)

Regards,
Phil
