Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FDCE2C85
	for <linux-staging@lists.linux.dev>; Thu,  4 Nov 2021 12:46:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3DBA460EBD;
	Thu,  4 Nov 2021 12:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1636030005;
	bh=j6d+mfoGeq/ZXtGuM8aOGWbKAQdD8PgJj7rgs7IUvAQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ojjipDXu6cxUAoJYz2IVypfJxoGmrO4mZh5r1rFs42gRv/7FxJ4YHSFTQ2/20Jkmu
	 p5fBDsdr7Kf3GZEyjd1eIEzLBXbvTl28RM1JxQ9ly2s8P+SnMtbdsxCXQHpKX0xRzC
	 1J552xVynp54qLhZey5EsXFBRI+JzklIGLgWnUVu2I6HfSjbTG7yrb7aQHHkzsZYs+
	 Z58kV5F1J+sRVcv/wWQFIeHKcsjG7xv4S3O9s170Th3ot0hNvFYzkAX0AqLPxexB9a
	 d4kOWTKsIBgX9iedfiHKy7wmhbjElOVAWVAONrH4X5QspxJgIY7Tf1WEdca0OB5QLi
	 OwPXk5Lpnrw7w==
Date: Thu, 4 Nov 2021 12:46:39 +0000
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Tsuchiya Yuto <kitakar@gmail.com>, Hans de Goede <hdegoede@redhat.com>,
 Patrik Gfeller <patrik.gfeller@gmail.com>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Kaixu Xia <kaixuxia@tencent.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Yang Li
 <abaci-bugfix@linux.alibaba.com>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, Alex Dewar <alex.dewar90@gmail.com>,
 Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>, Arnd Bergmann
 <arnd@arndb.de>, Alan <alan@linux.intel.com>, Peter Zijlstra
 <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>,
 linux-staging@lists.linux.dev, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: atomisp current issues
Message-ID: <20211104124639.38652387@sal.lan>
In-Reply-To: <20211103135418.496f75d5@sal.lan>
References: <20211103135418.496f75d5@sal.lan>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

As an update on that:

Em Wed, 3 Nov 2021 13:54:18 +0000
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:

> Hi,
> 
> From what I've seen so far, those are the main issues with regards to V4L2 API,
> in order to allow a generic V4L2 application to work with it.
> 
> MMAP support

This issue still needs to be addressed...

> From my side, I opted to add support for USERPTR on camorama:
> 
> 	https://github.com/alessio/camorama

...

> In time:
> --------
> 
>  Camorama currently doesn't work due to some other API bugs. See below.

But now camorama has gained support for autodetecting problems with
MMAP support.

At least for Asus T101HA, camorama is now working with atomisp.

> VIDIOC_G_FMT/VIDIOC_S_FMT/VIDIOC_TRY_FMT issues
> ===============================================

I addressed those issues. The implementation is not 100%, but it is good
enough for camorama to start working.

> 
> Video devices
> =============
> 
> Currently, 10 video? devices are created:

I didn't touch it. So, camorama should be called the first time with:

	camorama -d /dev/video2

in order for it to work. As camorama memorizes the last used camera,
it will pick /dev/video2 if called later without any parameters.

Regards,
Mauro
