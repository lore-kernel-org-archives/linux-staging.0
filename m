Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1BFA2C87
	for <linux-staging@lists.linux.dev>; Fri, 29 Oct 2021 09:03:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D7E3461179;
	Fri, 29 Oct 2021 09:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1635498185;
	bh=MBRBqnIahHscUii/Hqj9f4+8UuGf7NTR97e/S6KsWEM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=sWo9oHoGwbh1PKR2KhlMKJ5WBY2+dDXY622nCsjZaJ05mtkiIliWzdUGpprc2GTUR
	 ehIs5rb4CV0dnBRitpKsW8zdzAQOqcuWQCdIu31DccJ+dTPfx0g3tEs6ub0o8kiCms
	 bWRKfuoT2nMbhI+8hXlp6tR6Uxm9cvUUR5VDECqsz/yfaRM4K9zsb6ENzyezg7vYkq
	 gyMwkMgbkeC5LlubtrTs+K52+DwqAjxLxmfmnYeyZJfFv4OCst8y7ABAQQv7QK0B5t
	 pj6OmzAchTJ731+goVsLgSu4Fh+cylA/1aunoqWItPBrD9pU7rQDxV6P1xLKEQhDvV
	 jPsNanmLN51iw==
Date: Fri, 29 Oct 2021 10:02:59 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Tsuchiya Yuto <kitakar@gmail.com>
Cc: unlisted-recipients:; (no To-header on input)@bombadil.infradead.org,
 Hans de Goede <hdegoede@redhat.com>, Patrik Gfeller
 <patrik.gfeller@gmail.com>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Zijlstra
 <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Dan Carpenter
 <dan.carpenter@oracle.com>, Arnd Bergmann <arnd@arndb.de>, Kaixu Xia
 <kaixuxia@tencent.com>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [BUG/RFC PATCH 1/5] [BUG][RFC] media: atomisp: pci: assume
 run_mode is PREVIEW
Message-ID: <20211029100259.2cdfdfce@sal.lan>
In-Reply-To: <20211017162337.44860-2-kitakar@gmail.com>
References: <20211017162337.44860-1-kitakar@gmail.com>
	<20211017162337.44860-2-kitakar@gmail.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Mon, 18 Oct 2021 01:23:32 +0900
Tsuchiya Yuto <kitakar@gmail.com> escreveu:

> This is almost a BUG report with a patch to just make atomisp work
> again with the current mainline kernel. Thus, prefixed with [BUG][RFC].
> 
> RFC:
>   1. When looking at the `case CI_MODE_NONE:`, it tries to do something.
>      So, it should rather work with CI_MODE_NONE, too? Just I don't know
>      how to configure userspace apps to use CI_MODE_NONE ?
>   2. How can we re-add the run mode support again without relying on
>      the s_parm ?
> 
> >8-----------------------------------------------------------------8<  
> 
> After the commit 8a7c5594c020 ("media: v4l2-ioctl: clear fields in s_parm")
> added on v4.18 (backported to v4.9.182 and v4.14.127), the capture mode
> flag is cleared (except for V4L2_MODE_HIGHQUALITY).
> 
> Due to this, it seems that now we can't use this flag to set atomisp
> run_mode. This results in capture not working with the following message
> (loaded atomisp driver with dbg_level=1):
> 
> 	kern  :warn  : [ 3658.776616] ia_css_pipe_get_info: ia_css_stream_create needs to be called before ia_css_[stream/pipe]_get_info
> 	kern  :err   : [ 3658.776641] atomisp-isp2 0000:00:03.0: get_frame_info 1920x1080 (padded to 0)
> 	kern  :warn  : [ 3658.776666] atomisp-isp2 0000:00:03.0: Can't set format on ISP. Error -22
> 
> So, when we can't detect run mode from the s_parm capturemode
> (CI_MODE_NONE), let's assume the run mode is PREVIEW.

The run_mode on this driver is related to how camera works on Android.
On such systems, camera have a preview mode, which is what the user
views at the camera display. This is usually set to the display
resolution (or to some other resolution that would allow a high
fps rate). When the photo button is clicked, it sets the camera to
the highest resolution mode (by default), which usually means a low
fps rate.

This doesn't make much sense on desktops, nor standard Linux apps
support that.

Anyway, after looking on this patch, I guess the best is to apply
this patch instead:

	https://lore.kernel.org/linux-media/543e61dd07c90a7d8577b3a94696edc77953b9d8.1635497370.git.mchehab+huawei@kernel.org/T/#u

As a plus side, it is also one step further to allow generic apps to
use the atomisp driver.

Applying it allowed me to do:

	$ v4l2grab -D -f 'NV12' -x 1600 -y 1200 -d /dev/video2 -u
	$ nvt/raw2pnm -x1600 -y1200 -f NV12 out017.raw out017.pnm
	$ feh out017.pnm

So, I'm dropping patch 1/5 from media_stage, replacing it by the one which
sets the mode after open().

Regards,
Mauro

> 
> Signed-off-by: Tsuchiya Yuto <kitakar@gmail.com>
> ---
>  drivers/staging/media/atomisp/pci/atomisp_ioctl.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> index c8a625667e81..6fc64f0ccc31 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> @@ -2638,7 +2638,11 @@ static int atomisp_s_parm(struct file *file, void *fh,
>  				asd->high_speed_mode = true;
>  		}
>  
> -		goto out;
> +		dev_warn(isp->dev,
> +			 "setting run_mode using s_parm capturemode is not supported anymore\n");
> +		dev_warn(isp->dev, "assuming run_mode is PREVIEW\n");
> +		mode = ATOMISP_RUN_MODE_PREVIEW;
> +		break;
>  	}
>  	case CI_MODE_VIDEO:
>  		mode = ATOMISP_RUN_MODE_VIDEO;
