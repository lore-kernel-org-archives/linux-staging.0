Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1848BE5
	for <linux-staging@lists.linux.dev>; Mon, 19 Jun 2023 13:49:27 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-54fdf8c79a3so1551116a12.3
        for <linux-staging@lists.linux.dev>; Mon, 19 Jun 2023 06:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687182567; x=1689774567;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nfV234ipEV2m8xogB7Wi+sWBOiJ7SNMV0abfD7C/wG8=;
        b=Ine5LS6c9y6jwgvPYxtPmp3P+gEHDDJp7KHx59PjhUElufW0f4UcBZlKvqAr5XwPbp
         bJfOVz1sMMhPSh4Rzv0AmURNRc6WUw70Rxd/uQFxsilFi0rmyC7lEVHPgIcyM0ZpNHnd
         1Y1ae7fYj506xRLLJ5Ufm+mc48XziVNB6C0hwZ3Ewa+2qht6XzRA1//Rd/BxMaJYO+4U
         alelOTV8aAV/oGz9ADJLrI+K7TpffXNJsbDvw3FjB6+Yr9Tr4UVyZjCR3QSmhQpTG1di
         43u/OS0ZP+9Hh25z4PQY5yHKju2EkENsCbEYCmKlfEue3H2ex+ThpX7iZqFha70LRy2F
         7Rug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687182567; x=1689774567;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nfV234ipEV2m8xogB7Wi+sWBOiJ7SNMV0abfD7C/wG8=;
        b=A/i4BfcQ2mtg0q/E52riTSliOYxrYfCiatBQwbGqTQf1CRC0e0AnfUKHIDpthiqTid
         t5ktaEp9jlMjILhddOMI3NbPZklNI/lmhpBK/78GDa+PDXmQz0/2iVufN9xlreYVrmUu
         2P80GIEw+x0vIktsK5LZRNyayh6yd6pGpdBTAHxn0SU6k7AcrntsNSWZGVjdk6gRlrem
         b9Qn5zYA+z72PJHf347cdnjHhpRDMMdDlmoDQc2/hX32sHokDL4+jrkq3nkwSWQQ7Gi6
         xRHwrvMlUYRfH22jmFcZNJlFozZYXoEAKRvTzIQ6cNytslaiDQiehfyfuW7+8ztr0+VB
         D2/Q==
X-Gm-Message-State: AC+VfDxLRxxmxLWJ0ODECuMynYO77cT4k44VuQb0G71hNfdVyaZLhNVN
	cqLDMDx8i4YA9cfuplu3Ajk=
X-Google-Smtp-Source: ACHHUZ6UkYGnyShtmIsx+2AzmKB5WwOodXTLV9pRDEnnIp+I/qSpQYiXcWw+0WYZsdbPX0yEYlgbVA==
X-Received: by 2002:a17:903:22c4:b0:1b0:6e1:4b9f with SMTP id y4-20020a17090322c400b001b006e14b9fmr876665plg.43.1687182566817;
        Mon, 19 Jun 2023 06:49:26 -0700 (PDT)
Received: from zephyrusG14 ([103.251.210.211])
        by smtp.gmail.com with ESMTPSA id w16-20020a170902a71000b001b061dcdb6bsm20501435plq.28.2023.06.19.06.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 06:49:26 -0700 (PDT)
Date: Mon, 19 Jun 2023 19:19:21 +0530
From: Yogesh Hegde <yogi.kernel@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	dan.carpenter@linaro.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org, ivan.orlov0322@gmail.com
Subject: Re: [PATCH v3 0/4] Trivial code cleanup patches
Message-ID: <ZJBc4bok1krfjqWf@zephyrusG14>
References: <cover.1687092111.git.yogi.kernel@gmail.com>
 <e80d385d-5515-ed42-e5dd-f9c977f7d4d1@gmail.com>
 <2023061938-unbounded-unbent-e706@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023061938-unbounded-unbent-e706@gregkh>

Hi Greg, 
On Mon, Jun 19, 2023 at 02:57:56PM +0200, Greg Kroah-Hartman wrote:
> On Sun, Jun 18, 2023 at 10:26:37PM +0200, Philipp Hortmann wrote:
> > This patch series alone is fine. But when my patch series ([PATCH 0/9]
> > staging: rtl8192e: Remove unsupported modes a and 5G) is applied before it
> > fails as we change same lines. Will see what happens.
> 
> Yes, none of these apply :(
> 
> Yogesh, can you rebase this on my staging-next branch and resend?
Sure, will rebase and resend. Did you mean staging-testing branch instead of 
staging-next branch ? 

The patch series is rebased to commit "f99bbb4412ce axis-fifo: remove the 
unnecessary dev_info()" which is the HEAD of staging-next.
Latest changes by Philipp are merged into staging-testing branch. 
Let me know if you still want to rebase it to staging-next branch. 

Regards 
Yogesh 
