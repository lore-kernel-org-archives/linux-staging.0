Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38CBE1C5793
	for <linux-staging@lists.linux.dev>; Fri, 13 Sep 2024 02:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726193487; cv=none; b=iHuqK+NhlyCwEX6g+Lea3oWkGm8kcwtDacflHABL8/UWRzXzV2bnNFJwMMu0+mHti83sKcOLweaWUBPyFd3ggNFIYv4uet5u/8mfeWp9yr5loTqmagTPqxKcWUv/qd0aOH6rRa0gv+BL5XsbzJu+TslOXuPbf8g+uC99gCmNLzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726193487; c=relaxed/simple;
	bh=+g+iYLsDPMNU1DGfwkevSBUgkSvkrTNSbSdY7kviCWU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PeZbu7Im+5WxMwKZPwBPC2N14SJZ2vvYpVPCd/OB5PBeZ3ghRwlIVLvEH2zt1dtTpOKCIGG611R0YTWVuQbzrns5OIJtFcN4IJfMdfWjMFykXNf8Nd7rNUtLMf83y8/W0y6KoCO3+z/2CFvIxTf44Y7nRqmP5IRx8CamwJsb+bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V9KudvZk; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V9KudvZk"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2057c6c57b5so9570705ad.1
        for <linux-staging@lists.linux.dev>; Thu, 12 Sep 2024 19:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726193484; x=1726798284; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VKXxde7RE5OYjcQSsDvsckGBTQR5Rmzs2NTJhqDpLY0=;
        b=V9KudvZkNIW3mVpyY+5CxB7/H+R5FW51jeKhM31yH1fbfO3mn2ASBTjqZpgUWMpBkP
         sshA/q98FysUJFhV007U2mBX7iKmMur2DHnpt+RT1GFec9/n9iHux7l75txqoo4KRPPo
         AShsRQS93MD7mB9g69WY7GxB+IMyHdSD0lR+SopeS5MtXYP6YkDGEvXk2Lt1JYAdLl09
         4lqNuZ6bDq+A3phe+BHq7HPV1cLaWXBeivCoG7p/7roFJAb0IaHslYPSVM1n9Kc2BGW7
         lQSevNc3EOoP4D9qHipOCy3L4jfANCcLLs9bjsFRORsZZbZKmhKDyLErVEhie23LhBrU
         uBSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726193484; x=1726798284;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VKXxde7RE5OYjcQSsDvsckGBTQR5Rmzs2NTJhqDpLY0=;
        b=BQVlZL8hB7t/jhSC46sp9hyr1POeOfUzeXHmGfiGR7IKumWFpaeRJPIWciX++Be/Wm
         TwE+Cn4EMiU2jODmRUm5A2FHkLkSOXDO20ZBgVPOQeeWU89yPr/rvA+LLqfNj4a0Reh0
         5Q/Tz738hsTF0iAB6OhpvHLTxwtGG8ageoVBKcvMeD1SKGDxVMUIoRiei+c2XOgCf2tT
         LviFtWRCsNmn6cVLMBP/aug4GSwrFFwjFRdISVl2HirVTUSZGS5MmNvABvjjQCXEGk08
         J59fzlZqMNCLftZ6kwgrXtlkc9A+fRdZk8fPxujak2q6cEB3s52fT66bTd4B/onHqA62
         4A5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWAU9XKFQzFasvBUuMovyIvLuIp8Gs35k7iuFSQnobQ3Abl9sQw6x18alpNqJKDFWFPX3ug8d31WFAakYy4@lists.linux.dev
X-Gm-Message-State: AOJu0YywfOrZhH6etHuziVxc8DPQ8yPnmlx0hiixxr5W/Kx1FCpU9cjX
	9zQTeetqeAJt9LbBtlGqNlWb+7TYIB7e7kBKkc3Eo/eVqNaJd4l6XtRgUdTt5MA=
X-Google-Smtp-Source: AGHT+IEqrZCzRb+7n3J3P4T7vXPxWSJssj5ZmpmeBBQjEtUecyl2Bpb6qoxteoq3R1rJwSoV4Mle6A==
X-Received: by 2002:a17:902:f684:b0:1fd:6ca4:f987 with SMTP id d9443c01a7336-2076e592912mr64011855ad.15.1726193484186;
        Thu, 12 Sep 2024 19:11:24 -0700 (PDT)
Received: from embed-PC.myguest.virtualbox.org ([106.222.229.1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2076af478a6sm19925485ad.102.2024.09.12.19.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 19:11:23 -0700 (PDT)
Date: Fri, 13 Sep 2024 07:41:15 +0530
From: Abhishek Tamboli <abhishektamboli9@gmail.com>
To: "Ricardo B. Marliere" <ricardo.marliere@suse.com>
Cc: gregkh@linuxfoundation.org, skhan@linuxfoundation.org,
	rbmarliere@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: octeon: Use new initialization api for tasklet
Message-ID: <ZuOfQ9JxL71s2JFx@embed-PC.myguest.virtualbox.org>
References: <20240912172231.369566-1-abhishektamboli9@gmail.com>
 <wpmjgqvxzzowc36wtwxlht23pvvuzdpijhtkiojlayr66cktxp@dnj2ss4fu6x7>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <wpmjgqvxzzowc36wtwxlht23pvvuzdpijhtkiojlayr66cktxp@dnj2ss4fu6x7>

Hi Ricardo,
>
> This fails to compile for me:
> 
> In file included from ./include/linux/kernel_stat.h:8,
>                  from ./include/linux/cgroup.h:25,
>                  from ./include/net/netprio_cgroup.h:11,
>                  from ./include/linux/netdevice.h:42,
>                  from drivers/staging/octeon/ethernet-tx.c:10:
> drivers/staging/octeon/ethernet-tx.c:44:52: error: initialization of ‘void (*)(struct tasklet_struct *)’ from incompatible pointer type ‘void (*)(struct tasklet_struct)’ [-Wincompatible-pointer-types]
>    44 | static DECLARE_TASKLET(cvm_oct_tx_cleanup_tasklet, cvm_oct_tx_do_cleanup);
>       |                                                    ^~~~~~~~~~~~~~~~~~~~~
> ./include/linux/interrupt.h:665:21: note: in definition of macro ‘DECLARE_TASKLET’
>   665 |         .callback = _callback,                          \
>       |                     ^~~~~~~~~
> drivers/staging/octeon/ethernet-tx.c:44:52: note: (near initialization for ‘cvm_oct_tx_cleanup_tasklet.<anonymous>.callback’)
>    44 | static DECLARE_TASKLET(cvm_oct_tx_cleanup_tasklet, cvm_oct_tx_do_cleanup);
>       |                                                    ^~~~~~~~~~~~~~~~~~~~~
> ./include/linux/interrupt.h:665:21: note: in definition of macro ‘DECLARE_TASKLET’
>   665 |         .callback = _callback,                          \
>       |                     ^~~~~~~~~
>   CC      mm/memfd.o
>   CC      fs/proc/fd.o
>   CC      fs/jbd2/transaction.o
>   CC      drivers/firmware/efi/libstub/gop.o
> make[5]: *** [scripts/Makefile.build:244: drivers/staging/octeon/ethernet-tx.o] Error 1
> make[4]: *** [scripts/Makefile.build:485: drivers/staging/octeon] Error 2
> make[3]: *** [scripts/Makefile.build:485: drivers/staging] Error 2

Thank you for pointing out the issue. I’ll be more cautious to 
avoid such issues in the future and will resubmit the patch.

Regards,
Abhishek
