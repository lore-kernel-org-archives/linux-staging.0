Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A32A88289A
	for <linux-staging@lists.linux.dev>; Sat,  7 Dec 2024 12:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733573113; cv=none; b=J5YQbDBSFlvEqG8O1f3XR9Tuyz2mvll8N/xxtxFbs7IqQ8AcpjAWm72qL0wvdEri0ZNCk3lk/1EQHQsEHPd504EGep4JrEQ0HBG6gG7XJ9thup9wOO/pOPu93+X2fBKUxihvtlVxSok/hqHept8aSChCz9XYrVcWzAGjBNYWnxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733573113; c=relaxed/simple;
	bh=XUhTtNMiWd67IKkOegH/TNVOgTKa1NKtDJaaVjISLfI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i2ye73H2vClXuUFWlXWaAn01ZhhsT1Jr9jHswduiPYTaTUMQoFsgYdGq5de0DeLR6qEg9FjHyMyi2uoJN6as56tmCWlyDZdmBSJ/xp8JlQbo+1/HBfJzlMRDMvTLc406pdkNON1x0J7akJwNZcSw0qhLCXM07eMnZGbu4H61M2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LAxO+JI2; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LAxO+JI2"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-385ddcfc97bso2313107f8f.1
        for <linux-staging@lists.linux.dev>; Sat, 07 Dec 2024 04:05:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733573110; x=1734177910; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kwT7vHo3R3LXrRlRlM/qmE4kKhDKC1HMZOGOfPI4MxQ=;
        b=LAxO+JI2WFGbr5W+AKZHimd2b1TPCdsKCvTVe5nLvAu6Q7wpAQ2ABFoYGcb4nwabWF
         V1dlkKf5YMbP8tONZolJd5UZNZcJE851xmkBDcKRqnVguL4FQolnqxFF9vfgid9LqgC2
         8FsDn+LiD9uTXc7McbkkUe6jYSu+B6tNWSsST88AtVsv0FzIHntv7euVP1tahHiDDAib
         V+2ZrQpz9k03NMcW0hEM8xUy+XwMBOY+KJxxNegdmUg6HJlle5VUTyQ5N3U0JzbIpbQM
         uZ8XxVDV5iDIdD5A/JahRMthJwlOFP/qQSmYFlK/lN7k3x56xapCiEa/7C8zz+vohaTz
         yciA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733573110; x=1734177910;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kwT7vHo3R3LXrRlRlM/qmE4kKhDKC1HMZOGOfPI4MxQ=;
        b=fFt+NbUZqYmhvtlWhrXgI6Ypd3tekqDmfkKyw7SlUiB3SCkOGuSSkhtYObxiHzMb14
         qzb9zdUPaeewUL6lWwRJw9IrJrapTZ+1IrMZmgf0TZIgMpvP/mHFhHjvbabVC/txaLbK
         OCGl1o1N2sdEUPzO7ivaACaHnX0wg1VVckcTDyTmCvoabdu0+JDcDJKNs43IRke8vzRn
         ksCKiEzEWOT6apyl68tMI4x98Y51xaalmiNgpOMCmk3UkLQeG1AS6AoyFQ12UHXHEsy7
         PH/8eUDaq2MVN8YJpZF62PLUo20R6CxXeypvwl2Q0d6PckJrLjFxmzAIl8plsouWMWWw
         o3lA==
X-Gm-Message-State: AOJu0YzrRNI6sHiffpdArPs1ejDyxHASTMISnqhLlvI3M7GUUWnpYiHB
	hvsE30SIqcPKiR1eq+zLLTesZDE7Dv62tQ+cNd2CUYoiLff/2dkngFBE8A==
X-Gm-Gg: ASbGnct7tT8PMsSGm48vbb5Wf/7mGJVVKg8l1/LQxzVkkekNtaNxhwbL8Gmoy0NpLSz
	tqSX+AdkKzcjJRA7xa1TnBQV5ShZ/p3e1RMlwXtxkCKaBltmp/E2ioHXe2/ftvI0Y5r3DUEX+xI
	pdJTvp9HOk2RPzlhWyyZ9/NiAI0//3jws33KRCkJq/wTEIuuAqE0IMBrNylPulEYPtsedM2VHNr
	uEJN/Bj7+l9nSwzrItzfuJM98CqqmZ/90wOjaVydTTC233e9VCfjU8vMp8ovkSizw==
X-Google-Smtp-Source: AGHT+IFYDvFSDvirwnn7zQTiB8KUX4HcatfTOBjDKsa9XfAeWJifkSAhdsQRT8lS1idvmMCGvJjBpA==
X-Received: by 2002:a5d:64a2:0:b0:385:f4db:e336 with SMTP id ffacd0b85a97d-3862b333791mr4305430f8f.2.1733573109677;
        Sat, 07 Dec 2024 04:05:09 -0800 (PST)
Received: from egonzo (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3861ecf4164sm7220403f8f.9.2024.12.07.04.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2024 04:05:08 -0800 (PST)
Date: Sat, 7 Dec 2024 13:05:07 +0100
From: Dave Penkler <dpenkler@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-staging@lists.linux.dev
Subject: Re: [bug report] staging: gpib: Add GPIB common core driver
Message-ID: <Z1Q5839SZAoQaDvr@egonzo>
References: <4efd91f3-4259-4e95-a4e0-925853b98858@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4efd91f3-4259-4e95-a4e0-925853b98858@stanley.mountain>

On Fri, Oct 18, 2024 at 09:32:22AM +0300, Dan Carpenter wrote:
> Hello Dave Penkler,
> 
> Commit 9dde4559e939 ("staging: gpib: Add GPIB common core driver")
> from Sep 18, 2024 (linux-next), leads to the following Smatch static
> checker warning:
> 
> 	drivers/staging/gpib/common/gpib_os.c:541 dvrsp()
> 	warn: no lower bound on 'sad' rl='s32min-30'
> 
> drivers/staging/gpib/common/gpib_os.c
>     525 int dvrsp(gpib_board_t *board, unsigned int pad, int sad,
>     526           unsigned int usec_timeout, uint8_t *result)
>     527 {
>     528         int status = ibstatus(board);
>     529         int retval;
>     530 
>     531         if ((status & CIC) == 0) {
>     532                 pr_err("gpib: not CIC during serial poll\n");
>     533                 return -1;
>     534         }
>     535 
>     536         if (pad > gpib_addr_max || sad > gpib_addr_max) {
> 
> sad comes from the user in serial_poll_ioctl() and it can be any int.
> 
>     537                 pr_err("gpib: bad address for serial poll");
>     538                 return -1;
>     539         }
>     540 
> --> 541         retval = serial_poll_single(board, pad, sad, usec_timeout, result);
> 
> Passing a negative doesn't do anything harmful and it looks like probably it's
> intentional to mean there is no "sad".  But instead of saying that "any negative
> is valid" it would be better to say that "-1" means there is no sad.
> 
> 	if (pad > gpib_addr_max ||
> 	    (sad < -1 || sad > gpib_addr_max)) {
> 		...
> 
> Presumably the user space code is already passing -1 as the no sad value but I
> don't maybe it's passing INT_MIN or something weird.  This is an API change.
> We're allowed to change the API so long as we don't break userspace.  In
> staging, we have a bit more leeway to break userspace as well honestly.
> 
>     542         if (io_timed_out(board))
>     543                 retval = -ETIMEDOUT;
>     544 
>     545         return retval;
>     546 }
> 
> regards,
> dan carpenter
Hi Dan,
Catching up with the backlog.

Unfortunately the user space library uses a weird convention for secondary
addresses.

A secondary address of 0 is specified by adding 96 to it. This was inherited
from the National Instruments API. The library subtracts 96 from the passedi
 value when calling the driver. When the user passes a zero address it 
means no secondary address which corresponds to a value of -96 in the
driver API.

I have changed the user space library to set the sad to -1 when a zero
address is passed and will submit the patch to add the check for the 
lower bound.
cheers,
-Dave

