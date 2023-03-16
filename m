Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 762F3364;
	Thu, 16 Mar 2023 13:02:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C7C1C4339B;
	Thu, 16 Mar 2023 13:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1678971756;
	bh=wtyW9cFcS7GaC2uqYbfW//FSDvaFcF/MEKwTodX7V6g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L+2g8w9v+Y2BrzJ1zzkpK8lcmcBdVPOvgqyQ4KsY+jWHwjKiuYUuTwHiFQkN2coMH
	 zCYwYp5+gF70eJpAEn4mvSf8nCT2r7ZAZkQEOofpIpsR9Z53EuaQY4Gyma3Ro5CeoD
	 YT5UVo88ZWyInXJowSUem0K2Gxb0RH1N9bZCOYfk=
Date: Thu, 16 Mar 2023 14:02:33 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Khadija Kamran <kamrankhadijadj@gmail.com>
Cc: outreachy@lists.linux.dev, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] staging: axis-fifo: initialize timeouts in probe only
Message-ID: <ZBMTaYH+NM7uFJr5@kroah.com>
References: <ZBMR4s8xyHGqMm72@khadija-virtual-machine>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZBMR4s8xyHGqMm72@khadija-virtual-machine>

On Thu, Mar 16, 2023 at 05:56:02PM +0500, Khadija Kamran wrote:
> Module parameter, read_timeout, can only be set at the loading time. As
> it can only be modified once, initialize read_timeout once in the probe
> function.
> 
> As a result, only use read_timeout as the last argument in
> wait_event_interruptible_timeout() call.
> 
> Convert datatpe of read_timeout from 'int' to 'long int' because
> implicit conversion of 'long int' to 'int' in statement 'read_timeout =
> MAX_SCHEDULE_TIMEOUT' results in an overflow warning.
> 
> Perform same steps formodule parameter, write_timeout.
> 
> Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
> ---

I do not think you built this version as I get the following build
errors when I apply it and build:

In file included from ./include/linux/kernel.h:29,
                 from drivers/staging/axis-fifo/axis-fifo.c:17:
drivers/staging/axis-fifo/axis-fifo.c: In function ‘axis_fifo_init’:
./include/linux/kern_levels.h:5:25: error: format ‘%i’ expects argument of type ‘int’, but argument 2 has type ‘long int’ [-Werror=format=]
    5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
      |                         ^~~~~~
./include/linux/printk.h:427:25: note: in definition of macro ‘printk_index_wrap’
  427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
      |                         ^~~~
./include/linux/printk.h:528:9: note: in expansion of macro ‘printk’
  528 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
      |         ^~~~~~
./include/linux/kern_levels.h:14:25: note: in expansion of macro ‘KERN_SOH’
   14 | #define KERN_INFO       KERN_SOH "6"    /* informational */
      |                         ^~~~~~~~
./include/linux/printk.h:528:16: note: in expansion of macro ‘KERN_INFO’
  528 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
      |                ^~~~~~~~~
drivers/staging/axis-fifo/axis-fifo.c:957:9: note: in expansion of macro ‘pr_info’
  957 |         pr_info("axis-fifo driver loaded with parameters read_timeout = %i, write_timeout = %i\n",
      |         ^~~~~~~
./include/linux/kern_levels.h:5:25: error: format ‘%i’ expects argument of type ‘int’, but argument 3 has type ‘long int’ [-Werror=format=]
    5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
      |                         ^~~~~~
./include/linux/printk.h:427:25: note: in definition of macro ‘printk_index_wrap’
  427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
      |                         ^~~~
./include/linux/printk.h:528:9: note: in expansion of macro ‘printk’
  528 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
      |         ^~~~~~
./include/linux/kern_levels.h:14:25: note: in expansion of macro ‘KERN_SOH’
   14 | #define KERN_INFO       KERN_SOH "6"    /* informational */
      |                         ^~~~~~~~
./include/linux/printk.h:528:16: note: in expansion of macro ‘KERN_INFO’
  528 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
      |                ^~~~~~~~~
drivers/staging/axis-fifo/axis-fifo.c:957:9: note: in expansion of macro ‘pr_info’
  957 |         pr_info("axis-fifo driver loaded with parameters read_timeout = %i, write_timeout = %i\n",
      |         ^~~~~~~
cc1: all warnings being treated as errors


Please always test-build your patches.

thanks,

greg k-h
