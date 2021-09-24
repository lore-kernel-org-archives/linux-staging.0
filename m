Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D103FC8
	for <linux-staging@lists.linux.dev>; Fri, 24 Sep 2021 21:09:15 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id bx4so41072570edb.4
        for <linux-staging@lists.linux.dev>; Fri, 24 Sep 2021 14:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9l0vLnZ07LMXxy/IHB8Q/PtOVi8eVZesGOSTgkOJwlA=;
        b=Ho/3CJvliGeBvjWN5lR83BRCWF8WjNxzn3BWENEZtG322ntHBBn3y6J5SbUupR3T5F
         6r7IzFRIAOcfbZhhvUKojnai+dqfuxNtXQ9i+pufen4rFVK8rP5rHaeqGFePf/3nxfbf
         3vFqOex2Digiv6Zj+8DdRUKiLZ6RDXId9JfCSLTOyYja3hL/3ulV7BDiqzD4U7inXITq
         Y5kW91w5cu+ENUBThE9LjwnvgrmccxK1NqyzxuL6uR24VXg76DRT/KrxnQyd5kftY0kv
         AN4QXLRDb4mNO+SjgnvwSKFSqzA0uWzdv9Ym6XpyULWmGPlNrfGjY1BCiRt7sF6HSN4+
         qRkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9l0vLnZ07LMXxy/IHB8Q/PtOVi8eVZesGOSTgkOJwlA=;
        b=kvu5t56KNE4jx5Q7S1SWXn9eHLSozHXH9gvm0Rh172jlYSSNLGRJxUMsfls6mLRQ8p
         gLrwRWnf3He2I3qGVyCKbPbF9tUO+7qWGap5NX2AXsoQcdk+sHBLYqmJyQgBGQYS9GM+
         Wnoh4pAhYk7UpS9eH4LmfkxL/XayX4v5tc/8SERUnveUyP5RKKI0X37hJOdTUvTmS8CC
         pIvdh+iyXd3c3EqICo7aRCHnQV24DfNWlDYCJvVQyedX01yP8ay6zYP74jDaoeJac/xo
         g8EVKkIrf16E/GS7Nm72ojhkeWwk+LhHjxV8hD6KFA/TyXL82nMQor2AuqFSR8Nplx1d
         GKNA==
X-Gm-Message-State: AOAM531UAJHy2ioWBlwIR5lUiM9YWV3ctkgrJewny371XhY27M3TPA8i
	MKw/uK+gQ63YXNkJtlHwCsA=
X-Google-Smtp-Source: ABdhPJzPa4o/AIzPwMBAtAiqTMKOhVx6IUQVvjhTdoIjpuk8tM2p0hr7yj2l6zDt27LiZBtysNS0Xg==
X-Received: by 2002:a50:e1cd:: with SMTP id m13mr7509421edl.93.1632517753771;
        Fri, 24 Sep 2021 14:09:13 -0700 (PDT)
Received: from tom-desktop (net-93-71-218-228.cust.vodafonedsl.it. [93.71.218.228])
        by smtp.gmail.com with ESMTPSA id d22sm5541293ejk.5.2021.09.24.14.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 14:09:12 -0700 (PDT)
Date: Fri, 24 Sep 2021 23:09:10 +0200
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lucas Henneman <lucas.henneman@linaro.org>,
	Madhumitha Prabakaran <madhumithabiw@gmail.com>,
	Yujia Qiao <rapiz@foxmail.com>,
	Marcos Antonio de Jesus Filho <mdejesusfilho@gmail.com>,
	Edmundo Carmona Antoranz <eantoranz@gmail.com>,
	Aldas =?utf-8?B?VGFyYcWha2V2acSNaXVz?= <aldas60@gmail.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Deepak R Varma <mh12gx2825@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: vt6655: Replace camel case variable name
Message-ID: <20210924210910.GA10906@tom-desktop>
References: <20210922225138.668520-1-tomm.merciai@gmail.com>
 <6695e45f-4530-ab39-923d-8347649762bb@embeddedor.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6695e45f-4530-ab39-923d-8347649762bb@embeddedor.com>

On Wed, Sep 22, 2021 at 06:12:37PM -0500, Gustavo A. R. Silva wrote:
> 
> 
> On 9/22/21 17:51, Tommaso Merciai wrote:
> > Work in progress: replace camel case variables
> > 
> > PortOffset -> port_offset
> > 
> > Signed-off-by: Tommaso Merciai <tomm.merciai@gmail.com>
> > ---
> 
> When someone gives you feedback and you have to respin your
> patch, you should version the patches that you resend, and
> mention what changed, here:
> 
> Changes in v2:
>  - Variable should be port_offset instead of port_off_set.
  
  Thanks, you're right. Resend V2.

  Tommaso

> 
> I encourage you to take a look at this:
> 
> https://kernelnewbies.org/Outreachyfirstpatch
> 
> It will be of great help if you are trying to land
> your first patches. :)
> 
> --
> Gustavo
