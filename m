Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8FFA173
	for <linux-staging@lists.linux.dev>; Fri,  7 Jan 2022 18:45:10 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id c3so5527060pls.5
        for <linux-staging@lists.linux.dev>; Fri, 07 Jan 2022 10:45:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=w9ypsLnISzV2puuOjG8DGvXifynHcs0yI+Cx33i9X+w=;
        b=cygrNEBmz1DyagL+MK9Smfevh5IjJuSHSuEOlVsYJY/IsYLSqwrcAwQNSk35RtzqNQ
         C2Ngafv6Of7aHLdg+JJ1h7IfZE+dlMpZhyvQVYQjpqoOEGWLjXsCzPisUq2RZG6Go3Ez
         6BR6BadHpK5krEsAYIggJBO5cVnWOHb0vPUc1YQxJnxvDwjV8w9SgzvbnjWyQgfczshx
         ISExdudMCktyvp765YZGtSHppNG5Y1zZw4P8sJPB/k2gurJwwmoNbzhrb6EWZCzAzgKu
         aVQMgcyhNKNl6Gr4aA+mRXJH/063lvSSx6t4NgOKxpZhDaqRbDx1ZTs8197f0dm546Hx
         uZOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=w9ypsLnISzV2puuOjG8DGvXifynHcs0yI+Cx33i9X+w=;
        b=hUq+ylZ9HDyf+B51bdJrxe8KKSFTgS/gB0KO6oMUQlfG0BlLH0XVNxyUc+pfKDMQpO
         C4WUK6TPQv36K2RuekVcgl9+po0RsXqxDdmyIlGiXoFTLkHqMVqNrSlINqxWwbEy9m7s
         t3fjwljQA+Ctf03iBdxu20LyKvHvvCo/hVys2rZk+tzBvaJjbGs5Z0/ejMIq8NkPwStr
         Bvvce2D0+Cnt8VG8y8ijxICgNnqPNeet3bJkNzC/5EwTP8fg/NXtehpfxVNyv653vJMX
         ziummt5knvU4jVEupWkyyJo4z1/OgJROfN+tku7BE4txV5zbLfmnAbZHY/69s3lb5vwR
         +7og==
X-Gm-Message-State: AOAM530Xe8656/ocxajNDcRWeXPc/I6JyCoGUsBlWa9oJUmdJwMKR2yL
	5+YPTpJWKWBuhZBvDawLP/4=
X-Google-Smtp-Source: ABdhPJyKrLj0SsxFVhf0tlmH+eC9y6nJK4bslfXYvaePyZfl6eGKptmPg5yL7l0pOLb81WgTx3pmZw==
X-Received: by 2002:a17:90a:d3c8:: with SMTP id d8mr17189863pjw.189.1641581110207;
        Fri, 07 Jan 2022 10:45:10 -0800 (PST)
Received: from mail.google.com (122-58-164-114-fibre.sparkbb.co.nz. [122.58.164.114])
        by smtp.gmail.com with ESMTPSA id x25sm6301929pfu.113.2022.01.07.10.45.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jan 2022 10:45:09 -0800 (PST)
Date: Sat, 8 Jan 2022 07:45:04 +1300
From: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: gregkh@linuxfoundation.org, realwakka@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: pi433: move get version func to where all other
 functions are
Message-ID: <20220107184504.GA2693@mail.google.com>
References: <20220106093110.GA20011@mail.google.com>
 <20220107083258.GO7674@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220107083258.GO7674@kadam>

On Fri, Jan 07, 2022 at 11:32:58AM +0300, Dan Carpenter wrote:
> > Additionally, the patch below must be applied first as it was sent
> > before and touches the same file.
> > https://lore.kernel.org/lkml/20220103222334.GA6814@mail.google.com/
> 
> Put these sorts of meta commentary underneath the --- cut off

Thanks, I didn't know. Will start doing this from now onwards

> > 
> > Signed-off-by: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
> > ---
>   ^^^
> 
> here.  We don't need to preserve that information in the git log for all
> of history.
> 
> Other people have basically said all the other stuff that I was going
> to say...
> 
> regards,
> dan carpenter
> 
