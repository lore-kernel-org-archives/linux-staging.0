Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC4D028F2;
	Mon, 13 Mar 2023 15:18:26 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id da10so50250429edb.3;
        Mon, 13 Mar 2023 08:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678720705;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MkKHmqcfbmJH/dgkn01ZifvD9vX4NKoyZbN+sv0bg4g=;
        b=SFCB9GSWjTgriIT2vT1e10gKYkJ42rNvR7IweNASU8StzW8KQpH0KQFUkrnFH0cmpj
         cH8iS83Un5I3Cc63uCV4WQJuOo9sOGO/0FxOFvxwnAMza7htXchBVuZC/fozqb/ksYeO
         TxlW5OsGTea1map2W4LXuIZfh4IWmE4XSQDJ0QuUaEKKjtWW5fIWxhANbBM5OProb3/W
         IL0PbIorMhA8Vmd2fxd/09Fd1seF635Uybmyjss7dHg6k90jeuc+Dvp1jomzo2q5GcCN
         FrU/Z7Wwj9LeQIC9BYGD84JUTB+H+/Z8+qLe0/nhDf8ULTyBMRb275rSDIgLiHyg2P6A
         LnMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678720705;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MkKHmqcfbmJH/dgkn01ZifvD9vX4NKoyZbN+sv0bg4g=;
        b=RxXvAl0KFV5942H/bjS2brwHTAZQX7aNn1tqQuErSOZGucFUdUYu2V6cSMXw0YvcRv
         Jg7kCjCCEHRyVP1R1HVW4avIBSE85uNeifnaf9j/2CkMw80cJklMg81UYk1aO2sYb3Ux
         lJmY5JiNDpqo3Or5lIXOOB86LtLz4PrCFi3Ik4Q9q1/S3Zr1doRoDC7n6ELPNvoe3Us0
         uL7GfvHnwY5c+5Xmc6+I48B/mRqXRrNbaLwNUCm0ZpYh2tjB++mq/JBe2V1w2zaDXUQT
         DNjDuIj+GhMhVdIV/HFVfDPoLRwszm6Se/pU/8mJyhdjaqCxU4NqIX5DwphlkSWe6R5J
         hXHw==
X-Gm-Message-State: AO0yUKXormNAHpSj0lfX2LAkRfiQQh467evly7nydsCDeS8dLDDbubBs
	btQEt7DFxUIJeKbVSSbngh3EVO/uCFZYRyPF
X-Google-Smtp-Source: AK7set+Awvfu1l6DgJOJxMipMw0IWmFDrqV3siwzDsfGuYnU2syyHJHoky40qbZtpSajQgAxvY1lng==
X-Received: by 2002:a17:906:2d51:b0:8b0:f58c:e87f with SMTP id e17-20020a1709062d5100b008b0f58ce87fmr32879265eji.33.1678720704962;
        Mon, 13 Mar 2023 08:18:24 -0700 (PDT)
Received: from khadija-virtual-machine ([39.41.45.115])
        by smtp.gmail.com with ESMTPSA id l1-20020a50c101000000b004af5968cb3bsm3384049edf.17.2023.03.13.08.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 08:18:24 -0700 (PDT)
Date: Mon, 13 Mar 2023 20:18:20 +0500
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: Dan Carpenter <error27@gmail.com>
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
	outreachy@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] staging: axis-fifo: initialize read_timeout and
 write_timeout once in probe function
Message-ID: <ZA8+vC0e6EUdm9q/@khadija-virtual-machine>
References: <ZA4M3+ZeB1Rl2fbs@khadija-virtual-machine>
 <9938109.ZD9C4EEAuf@suse>
 <ZA83yzPTq+nQF9Dd@khadija-virtual-machine>
 <f545dc88-717b-4fa0-851a-733dd5fc2eff@kili.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f545dc88-717b-4fa0-851a-733dd5fc2eff@kili.mountain>

On Mon, Mar 13, 2023 at 06:04:45PM +0300, Dan Carpenter wrote:
> On Mon, Mar 13, 2023 at 07:48:43PM +0500, Khadija Kamran wrote:
> > Also, I had one question. Is it okay to write a long subject as I have
> > used in this patch?
> 
> People say subject should be 50 chars (I forget the exact limit) but
> there is a little bit of flexibility.  This subject is too long though.
> Perhaps I would use something like:
> 
> [PATCH v5] staging: axis-fifo: initialize timeouts in probe only
>

Thanks Dan,
I am going to use this for the next patch  O:)

> regards,
> dan carpenter
> 
