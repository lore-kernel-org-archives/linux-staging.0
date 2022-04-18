Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85EFF64C
	for <linux-staging@lists.linux.dev>; Mon, 18 Apr 2022 04:01:03 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id bg9so16620537pgb.9
        for <linux-staging@lists.linux.dev>; Sun, 17 Apr 2022 21:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=WDL1LdNCgcBojb3ge+3pVQIK1RVySUq4qbmbuvDh6aM=;
        b=h7h1nXmldfg6Ma6isM9+5oIdvEdeoX6annXY4zG+KmSd+Oo9+OyzgT7R8J40vSH8lF
         VKIzoLdn4opHnUt+zP0iYwz4qZCzDcawKprYLI2jPxkepfUry+WAFc2GvbDtObPsK01L
         3t8yaLPHPn7C35fNEAK5wqET+qShNKc7WFeDt6lyWIYzJZ4phfV0pS6+vFTTLpdjaYVt
         JGQ/Wcr/ahflqcJpnw1vZ8x9oJNJqzz8Qe02w/42dPlx91y92uwRuQEfh/4j/9ankgGE
         PHGN6zRs3vCDTA1hV5d1HuVU8Z+uu+ELmkNy9CX/QjPieEB3ww5rxoSum9nv7OD+WTc/
         /vIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WDL1LdNCgcBojb3ge+3pVQIK1RVySUq4qbmbuvDh6aM=;
        b=lWTi4JabUimOmkg6M1yi74R85kjQfeM7vYVzxiOLSQXS7r/Ur5YA1YpPM5H7SZfmTj
         WkdB7lK4Hd3jW5Cdgv4YQDPllLbVo2V8+KcbzEGRzjSW2fyRfTviqbZ2VoeG4oKnE0F0
         55rLxdATe/3gBuWbicO3mUkMkH4PoRLiS0inmX4pW+6U83tCCunXFJkijer9tinrtrR+
         G85K0YZ+ulsXpOvAMbZxRIKBB2KPu8NlisWxApkqJQRp1jSU1OyoaO1j3UJZ9xU5H1TB
         b8wAvodlzmVkE5FuBE7zNplMMMxJvy3mv75KsyyJLq7f3Cnvk47tuNXL02g/NJA7wmep
         RK7g==
X-Gm-Message-State: AOAM5336WaKrYtJzxDMj28rJ0jMNxP3eM7T+H5mLYkqUFuAVpBqbrY82
	ye4GxmylImhN7qAsa2N6IJs=
X-Google-Smtp-Source: ABdhPJykXDe0gp+/XzGRlhpFer2xNQGb2VKm+tH66pl2cpaeyf8rwhJ5Y+rXsRprsibUqrLemIE8kw==
X-Received: by 2002:a63:fa06:0:b0:39c:f169:18e6 with SMTP id y6-20020a63fa06000000b0039cf16918e6mr8667168pgh.129.1650254462888;
        Sun, 17 Apr 2022 21:01:02 -0700 (PDT)
Received: from localhost ([152.70.90.187])
        by smtp.gmail.com with ESMTPSA id b2-20020a056a000a8200b004f1111c66afsm10935762pfl.148.2022.04.17.21.01.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Apr 2022 21:01:02 -0700 (PDT)
Date: Mon, 18 Apr 2022 12:00:58 +0800
From: Wang Cheng <wanngchenng@gmail.com>
To: Pavel Skripkin <paskripkin@gmail.com>
Cc: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8712: fix uninit-value "data" and "mac"
Message-ID: <20220418040058.ws6ijoeggnycs22y@ppc.localdomain>
References: <20220414141223.qwiznrwgjyywngfg@ppc.localdomain>
 <68484555-f763-bc42-eb4c-9cea2ee8dadb@gmail.com>
 <20220415095741.3zfuztivtgidvpqc@ppc.localdomain>
 <5d9181be-0a02-0623-7741-1d4352d62610@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5d9181be-0a02-0623-7741-1d4352d62610@gmail.com>

On 22/04/16 01:57PM, Pavel Skripkin wrote:
> Hi Wang,
> 
> On 4/15/22 12:57, Wang Cheng wrote:
> > Hi Pavel, thx for your review.
> > 
> > Sorry, this patch is just confined to fixing uninit-values with
> > modifying the original code as less as possible. It sounds good to
> > refactor r8712_usbctrl_vendorreq() with better API.
> > 
> 
> I understand your idea, but this will just hide the real problem until
> syzbot hit it in different place. So, I believe, it's better to fix the root
> case instead of hiding local cases.

Of course, I agree on fixing the root case. I will think about replacing
APIs properly.

thanks,
- w
