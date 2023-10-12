Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF25D533;
	Thu, 12 Oct 2023 07:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l9kv2Sce"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-690b7cb71aeso511370b3a.0;
        Thu, 12 Oct 2023 00:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697096920; x=1697701720; darn=lists.linux.dev;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Hqr9DYS4ACIYnQ3en5nq0rV5Tc/FbTrcS4p8q2+2Uk=;
        b=l9kv2ScezSQxKZeOOyJ2UFy5ywiZLw/DwfWdvWh4IxaeUld3Gp5BhO2Rw6B6+usxpl
         +cyiLxvs+eB1fgIDgU29V5g5DHPmm1K6QKFsl/hWNeto6v2TG+aL6RXG0k/JuyG8CMOz
         tq0MQff473mQEHsIoJQqyMDM0WUtZCqWPpBPVol19crc949p8WjRdwPeh/FwhL9L95A+
         3I7sU7OTo3OAlYJI/xjpLE6LSvMUIFC9/Laruk3DTE0z3/vd3XdFqa6lDwlRn3eAQE3L
         m7/YM5RVSatBNjrKqv73AiM65Kj2WcEbC4Fj9qpZYUjgc4Qsy3DmTpUd9b/KLZo4+HxB
         BAyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697096920; x=1697701720;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Hqr9DYS4ACIYnQ3en5nq0rV5Tc/FbTrcS4p8q2+2Uk=;
        b=bxYuqg1HRvlZPoZExcmLiv+T6y2dS0aQ/a0/nMi4UWydK/BrRkyxlNZS6nVy7Gp10D
         m8wVY041NKmW+BxqfLues+eAOGQN1yOU2iaXdP1wIss6AUdwx3QZIBeIEN0NzcJ7sLW2
         pgw08fng+P2tkBEwQUwsVSH2HDLqpmi4zNs6gAFx8xm0YNGEx5528lr8ux7cVSGV4hre
         q0CYE2UKgEGaA79B1f9NfvPWWqsxgMoRhlFj3Gojbh1Mkco9tmQBM+EBIpySCBqAkfqb
         4XLn2bVXhceYRZW0uOwGDMsmoPua8KqNjfbXXOHr1Gity1USxJpfN+Lk1481LQdUlk2L
         DJXw==
X-Gm-Message-State: AOJu0Yy1yDdfAw+W5UhNzTxDqhJqthJ85EVOcLJHDyiRxcVz7HFbHFe+
	hglW+dluKamPy8pfke4imd1MTFHVPcgIpA==
X-Google-Smtp-Source: AGHT+IEiuF9qWvd2+RjNGi35ydOY4c2AD2UYc/uZ57nUdQJEN+nHg2/NMuqRfHEXRYg8wA6okTSWfw==
X-Received: by 2002:a05:6a20:12ca:b0:159:c07d:66f0 with SMTP id v10-20020a056a2012ca00b00159c07d66f0mr32043518pzg.6.1697096919636;
        Thu, 12 Oct 2023 00:48:39 -0700 (PDT)
Received: from Negi (2603-8000-b93d-20a0-2184-6fa4-0d39-1c6b.res6.spectrum.com. [2603:8000:b93d:20a0:2184:6fa4:d39:1c6b])
        by smtp.gmail.com with ESMTPSA id z16-20020a656650000000b0058953648c27sm919443pgv.88.2023.10.12.00.48.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Oct 2023 00:48:39 -0700 (PDT)
Date: Thu, 12 Oct 2023 00:48:38 -0700
From: Soumya Negi <soumya.negi97@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Micky Ching <micky_ching@realsil.com.cn>, outreachy@lists.linux.dev,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rts5208: Parenthesize macro arguments
Message-ID: <20231012074837.GE16374@Negi>
References: <20231012050240.20378-1-soumya.negi97@gmail.com>
 <81d6e283-fd87-4fd6-964f-22cbf420cdaa@kadam.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <81d6e283-fd87-4fd6-964f-22cbf420cdaa@kadam.mountain>
User-Agent: Mutt/1.9.4 (2018-02-28)

Hi Dan,

On Thu, Oct 12, 2023 at 09:33:07AM +0300, Dan Carpenter wrote:
> On Wed, Oct 11, 2023 at 10:02:40PM -0700, Soumya Negi wrote:
> > Use parenthesis with macro arguments to avoid possible precedence
...
> >   */
> >  #define rtsx_writel(chip, reg, value) \
> > -	iowrite32(value, (chip)->rtsx->remap_addr + reg)
> > +	iowrite32(value, (chip)->rtsx->remap_addr + (reg))
> 
> These would be better as functions instead of defines.

There are actually more macros in the code. Should all of
them be redefined as functions? The original code looks like this:

/*
 * macros for easy use
 */
#define rtsx_writel(chip, reg, value) \
	iowrite32(value, (chip)->rtsx->remap_addr + reg)
#define rtsx_readl(chip, reg) \
	ioread32((chip)->rtsx->remap_addr + reg)
#define rtsx_writew(chip, reg, value) \
	iowrite16(value, (chip)->rtsx->remap_addr + reg)
#define rtsx_readw(chip, reg) \
	ioread16((chip)->rtsx->remap_addr + reg)
#define rtsx_writeb(chip, reg, value) \
	iowrite8(value, (chip)->rtsx->remap_addr + reg)
#define rtsx_readb(chip, reg) \
	ioread8((chip)->rtsx->remap_addr + reg)

#define rtsx_read_config_byte(chip, where, val) \
	pci_read_config_byte((chip)->rtsx->pci, where, val)

#define rtsx_write_config_byte(chip, where, val) \
	pci_write_config_byte((chip)->rtsx->pci, where, val)

#define wait_timeout_x(task_state, msecs)	\
do {						\
	set_current_state((task_state));	\
	schedule_timeout((msecs) * HZ / 1000);	\
} while (0)
#define wait_timeout(msecs)	wait_timeout_x(TASK_INTERRUPTIBLE, (msecs))

> >  	pci_read_config_byte((chip)->rtsx->pci, where, val)
> > @@ -131,8 +131,8 @@ static inline struct rtsx_dev *host_to_rtsx(struct Scsi_Host *host)
> >   * The scsi_lock() and scsi_unlock() macros protect the sm_state and the
> >   * single queue element srb for write access
> >   */
> > -#define scsi_unlock(host)	spin_unlock_irq(host->host_lock)
> > -#define scsi_lock(host)		spin_lock_irq(host->host_lock)
> > +#define scsi_unlock(host)	spin_unlock_irq((host)->host_lock)
> > +#define scsi_lock(host)		spin_lock_irq((host)->host_lock)
> 
> For these ones, the name is too generic.  probably the right thing is
> to just get rid of them completely and call spin_lock/unlock_irq()
> directly.

I understand that there should be 2 different patches, one for the
macro-to-function rewrites & one for replacing the scsi lock/unlock macros with
direct spinlock calls. But, should these be in a patchset(they are vaguely
related since the patches together would get rid of the checkpatch warnings)?
I'm not sure.

Thanks,
Soumya

> regards,
> dan carpenter
> 
