Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E78E2C83
	for <linux-staging@lists.linux.dev>; Mon,  8 Nov 2021 09:57:34 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id i5so25844285wrb.2
        for <linux-staging@lists.linux.dev>; Mon, 08 Nov 2021 01:57:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=kOUbhllrGgmpU45GMJothVqWnhtxz4cIj2zv5C1qMWk=;
        b=oQBdMvS4KhzP9XZLtihtlQjZay5WL9YgNRwpEZsNQ8c5RhtCKzDNkrNUpBHVgJMA8Z
         hdR9qkW/20y/bhNkqFX9pFUpJuVjeicAqADHFJE/cVFJ6CsI2UsRB7+R7qguW9/QerXr
         TEwz24q0kXdt6phkXxkzdS7WBlcG5BkzwUN7hGxzUBSAFneS9A06eQee+Hu+RL1NWB3N
         DE5N/9TEWC2DxsxcBb2HNgdg0ZiO5H+l0YVmryVK/JZVDFjDd8poG3hDeQ4Rqr7G7MAL
         w6JGJuSbaQXdfs0PS1OL7+MWJqE7CJwZeK4b0zCmTOQWqbLofenvbujzq3sGG7ub0T/U
         RTxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=kOUbhllrGgmpU45GMJothVqWnhtxz4cIj2zv5C1qMWk=;
        b=p3bhzNA/UfCtxK5qkiIi8nPe5gza17Cy6i7ANHWfFx2k6zj7twUAS9CS79z72dOont
         KDi1pPpPRfjxyKlbfH6FiXFAZBjfXg2SpYb8oXFhZePs9x6UtfPLJIRcL8C9mnpLwsVJ
         WAk5moe7ATusgoXO50dEQXw6TBEjFJEBubXjFrFNzR+Ple/p+IWGXAFdF+e3hT1ske+p
         QgZK9CdXZwa8d2Q1CQEe+c7ZYTZE0FnxtRWBbIXmw4g9EZBLOg4F4+iJQSkzm9hDtm1Y
         wVvvl2kCDs7f2667TnmPdnjjKcRTMPEUwaTCltLUKtB4NtaIIJWhCrETuwlAfKGhx4Df
         LE5A==
X-Gm-Message-State: AOAM532GYpVxSrACbpOjhNMbOjBEaeKPqCYsPf0aXvHqSip+B8tNjh5n
	aiUx5wCHk1rUEepQBryFqlk=
X-Google-Smtp-Source: ABdhPJxDtSXVBMSAmrvWAmYcT5hvBCAgpVKjqIr6ghNej8nNREokF7CmLVosjHMM7wTvvT8bhUVFMg==
X-Received: by 2002:adf:f787:: with SMTP id q7mr78460918wrp.1.1636365452804;
        Mon, 08 Nov 2021 01:57:32 -0800 (PST)
Received: from ?IPv6:2a01:4b00:f411:e700:e085:8cb7:7bf6:5d62? ([2a01:4b00:f411:e700:e085:8cb7:7bf6:5d62])
        by smtp.gmail.com with ESMTPSA id f6sm15600793wmj.40.2021.11.08.01.57.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Nov 2021 01:57:32 -0800 (PST)
Message-ID: <0a4c26bdabadd666ddf124bbb767e5cc802af937.camel@gmail.com>
Subject: Re: [PATCH v2 3/8] staging: vt6655: Remove unused `i` increments
From: Karolina Drobnik <karolinadrobnik@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: outreachy-kernel@googlegroups.com, gregkh@linuxfoundation.org, 
	forest@alittletooquiet.net, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Date: Mon, 08 Nov 2021 09:57:25 +0000
In-Reply-To: <20211104133803.GC2794@kadam>
References: <cover.1635773679.git.karolinadrobnik@gmail.com>
	 <79a4f03c8f2bfa555ea149ddd1c0f938dd431a0b.1635773680.git.karolinadrobnik@gmail.com>
	 <20211104133803.GC2794@kadam>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Dan,

Thanks for taking a look at my patches.

On Thu, 2021-11-04 at 16:38 +0300, Dan Carpenter wrote:
> On Mon, Nov 01, 2021 at 02:32:01PM +0000, Karolina Drobnik wrote:
> > Commit c569952d92ba ("staging: vt6655: Use incrementation in
> > `idx`")
> > rendered the incrementation of `i` outside of the loop unnecessary
> > so it can be deleted.
> > 
> 
> That commit hash is something that only exists on your system. 
> Commit hashes are stable once they hit Greg's tree (he only rebases 
> in extremely rarely cases).

Ok, I can rewrite the message but I'm not sure how should I refer to
another patch from my patch set. I followed these guidelines[1] but if
there's a different way of describing it then please let me know.

> This commit is cleaning something that was left in a different patch
> in the same patch set.  Just merge it into the original patch.  Don't
> make a mess and then fix it.

I tried adding more than one logical change per patch some time ago and
Greg asked me to stop doing this.

> It's tricky to know how to break up patches.  My suggestion is:
> patch 1: remove all the unnecesary (unsigned short) casts
> patch 2: merge the rest of patches 1-3 together and send it at once

Sounds good. If Greg is happy with your approach, I can merge these
patches, no problem. 


Thanks,
Karolina

---------------------------------------------------------------
[1] -
https://elixir.bootlin.com/linux/latest/source/Documentation/process/submitting-patches.rst#L106

