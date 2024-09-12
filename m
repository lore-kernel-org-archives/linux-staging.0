Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E371BE868
	for <linux-staging@lists.linux.dev>; Thu, 12 Sep 2024 20:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726171998; cv=none; b=ha6ZiuVNn+zSOAz6qj3RaTm9BMSllIT2rIekmtGWAdNf2zl0kiqOqMmxcFi8jMM2njygNW7RKTQbX33TH5L93KL64ouNhnPJao5OtrwEku++LMSCjref1JMS67R9WYw4lB2lLUFjBDggZpV8buW1ORrE1Qp+pSrKSFff4o329nQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726171998; c=relaxed/simple;
	bh=6okTQsa8rgzwLl9EMROLD96VdwwjEKOOEENsTmnsbU4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pe0wzkCFNWbX0GrW9luf1iT+CTmu47622XQq3df2m8RWkkSA9gNJ+HduUdb/zgNAnE1WhdCOTZEpZjk7vODZ1uFjfIZI6k61/hr6xSeiAuG1jL2AhNyCrtqJ2RS95zlMCZvc/8KjfKomUIiVNzte/Wm0wSREXJqKjI0MR69BqhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Q/8eRP1R; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Q/8eRP1R"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-428e1915e18so1413735e9.1
        for <linux-staging@lists.linux.dev>; Thu, 12 Sep 2024 13:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1726171993; x=1726776793; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6/HJTiMeQZOHmvpm6Ii84I2SgNaOByjP7wc4AbEy0aE=;
        b=Q/8eRP1RqaEUipXNb4LHlQRTiPo4OUhlq/8mGGzfEkspa8TKLJkQX0CJyJ4FxEu2WM
         DiT1LixWJLrBrStJ2/EmYEdGPcQbBm5yZuANZdTrydvfXZzFOR5ZJUR3/BuwRB8syVEd
         sRub6/LSGEec0CoHts5IDdtSqvXQqL+wl0uMP2DcNp+0ls4zqMjo3nInWxI9XwnSYf0W
         kajqM1P1UulJ+IgZQDc5G7ZBymW4W3CO22g9LUtJEtx5R91O1GCS1ia8NBBwUROoDBtq
         aH7+isC5tzjJNN0RvPQzTGHTOPtXH9Fwqrx/fD9yMxrannv93SUzC0WRyo9OcUA4vfOT
         nKSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726171993; x=1726776793;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6/HJTiMeQZOHmvpm6Ii84I2SgNaOByjP7wc4AbEy0aE=;
        b=rjfyr+L0B5PpAJpD9bP5GPqC/ULoZmMi91F2RR2IUBi4Z90niWsNwuso5FgxpUS+DR
         Ll1MlWjT4WRTO1Ip/X0UMM1uHEmHcPqGbwJf0bdd9ggFAomWWVT4xNc5TfmA2FdZ9qRU
         2+1dTUowq6ujldbSb4P31j4aTiH+xTIT7r0eQoaiNdNyWEJUbPnGuXiR31ecTOzOz9mE
         CkHiLCrPKozA1IhwUCZ/mE97RmnS3vPM4DwN26RReRTv7CceHHDxc3of9i4lRqDey+QH
         HdJGU6wjGxguVBhM3U+tgay1/xuXhqiC42HAaYMI/FhoQFKC+RJEM16Nwn+fp3RWbHBt
         X+eA==
X-Forwarded-Encrypted: i=1; AJvYcCWSA0okqrK8VIARMU07c8YZ6KWd12P8xKW60g3rpQCsn6snGiNV6iRflnF1IlY1IRsUS9PVEIDdf1nImFH0@lists.linux.dev
X-Gm-Message-State: AOJu0YwZ+luhyAZBhj2o/WlaHXK1v5xhfkQlbZyY3hYmmiZYSXtRplp2
	Xc6RaONjvNYOa//WekrweWZlImyjS/Qs4IaFrDQk0TGd0dj1gt34SQ2qi7cVNEo=
X-Google-Smtp-Source: AGHT+IFuESW6u6fBWF/+LEDQ2JIBb+AK4uD5H903pPBCcN1b1sjbV/Ut3OwzKvhomN0NC4gqB+byJA==
X-Received: by 2002:adf:e80d:0:b0:368:3751:de3 with SMTP id ffacd0b85a97d-378d61f1f9emr189043f8f.31.1726171992398;
        Thu, 12 Sep 2024 13:13:12 -0700 (PDT)
Received: from localhost (200-158-197-118.dsl.telesp.net.br. [200.158.197.118])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2076af44f91sm17798075ad.63.2024.09.12.13.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 13:13:11 -0700 (PDT)
Date: Thu, 12 Sep 2024 17:13:08 -0300
From: "Ricardo B. Marliere" <ricardo.marliere@suse.com>
To: Abhishek Tamboli <abhishektamboli9@gmail.com>
Cc: gregkh@linuxfoundation.org, skhan@linuxfoundation.org, 
	rbmarliere@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: octeon: Use new initialization api for tasklet
Message-ID: <wpmjgqvxzzowc36wtwxlht23pvvuzdpijhtkiojlayr66cktxp@dnj2ss4fu6x7>
References: <20240912172231.369566-1-abhishektamboli9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240912172231.369566-1-abhishektamboli9@gmail.com>

Hi Abhishek,

On 12 Sep 24 22:52, Abhishek Tamboli wrote:
> Use the new api DECLARE_TASKLET instead of DECLARE_TASKLET_OLD
> introduced in commit 12cc923f1ccc ("tasklet: Introduce new
> initialization API").
> 
> Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
> ---
>  drivers/staging/octeon/ethernet-tx.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/octeon/ethernet-tx.c b/drivers/staging/octeon/ethernet-tx.c
> index bbf33b88bb7c..ae1bac99b461 100644
> --- a/drivers/staging/octeon/ethernet-tx.c
> +++ b/drivers/staging/octeon/ethernet-tx.c
> @@ -40,8 +40,8 @@
>  #define GET_SKBUFF_QOS(skb) 0
>  #endif
>  
> -static void cvm_oct_tx_do_cleanup(unsigned long arg);
> -static DECLARE_TASKLET_OLD(cvm_oct_tx_cleanup_tasklet, cvm_oct_tx_do_cleanup);
> +static void cvm_oct_tx_do_cleanup(struct tasklet_struct clean);
> +static DECLARE_TASKLET(cvm_oct_tx_cleanup_tasklet, cvm_oct_tx_do_cleanup);

This fails to compile for me:

In file included from ./include/linux/kernel_stat.h:8,
                 from ./include/linux/cgroup.h:25,
                 from ./include/net/netprio_cgroup.h:11,
                 from ./include/linux/netdevice.h:42,
                 from drivers/staging/octeon/ethernet-tx.c:10:
drivers/staging/octeon/ethernet-tx.c:44:52: error: initialization of ‘void (*)(struct tasklet_struct *)’ from incompatible pointer type ‘void (*)(struct tasklet_struct)’ [-Wincompatible-pointer-types]
   44 | static DECLARE_TASKLET(cvm_oct_tx_cleanup_tasklet, cvm_oct_tx_do_cleanup);
      |                                                    ^~~~~~~~~~~~~~~~~~~~~
./include/linux/interrupt.h:665:21: note: in definition of macro ‘DECLARE_TASKLET’
  665 |         .callback = _callback,                          \
      |                     ^~~~~~~~~
drivers/staging/octeon/ethernet-tx.c:44:52: note: (near initialization for ‘cvm_oct_tx_cleanup_tasklet.<anonymous>.callback’)
   44 | static DECLARE_TASKLET(cvm_oct_tx_cleanup_tasklet, cvm_oct_tx_do_cleanup);
      |                                                    ^~~~~~~~~~~~~~~~~~~~~
./include/linux/interrupt.h:665:21: note: in definition of macro ‘DECLARE_TASKLET’
  665 |         .callback = _callback,                          \
      |                     ^~~~~~~~~
  CC      mm/memfd.o
  CC      fs/proc/fd.o
  CC      fs/jbd2/transaction.o
  CC      drivers/firmware/efi/libstub/gop.o
make[5]: *** [scripts/Makefile.build:244: drivers/staging/octeon/ethernet-tx.o] Error 1
make[4]: *** [scripts/Makefile.build:485: drivers/staging/octeon] Error 2
make[3]: *** [scripts/Makefile.build:485: drivers/staging] Error 2


>  
>  /* Maximum number of SKBs to try to free per xmit packet. */
>  #define MAX_SKB_TO_FREE (MAX_OUT_QUEUE_DEPTH * 2)
> @@ -670,7 +670,7 @@ void cvm_oct_tx_shutdown_dev(struct net_device *dev)
>  	}
>  }
>  
> -static void cvm_oct_tx_do_cleanup(unsigned long arg)
> +static void cvm_oct_tx_do_cleanup(struct tasklet_struct clean)
>  {
>  	int port;
>  
> -- 
> 2.34.1
> 
