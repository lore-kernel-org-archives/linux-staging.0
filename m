Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5AC3340286
	for <linux-staging@lists.linux.dev>; Tue,  3 Feb 2026 12:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770121858; cv=none; b=SgB/BDj0kkReUIpQrV7HAIaNssW4vzIvXdViKlufFMps28VbFnApocQzsp5ehH01zdUaYrqTiBRMjmAiN2iaQzBdokk30mc/Khx2hSQQsVgFmS/Mf/E4W1LI0vhYqlMrGxDFgF4mkTD8bX/pQ1RTrXIx6NzA7LywPnr12vNwzh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770121858; c=relaxed/simple;
	bh=RSZ1Yf7eTRVjmcBnhGnnNL3vux6jfpfUh4rbJUALLMg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JL+t5TgAbJJBn3ZEy49Bauv6GIyaxf25rdWAhyG/uobUvNJ2cP8Mmm/+q9zTpc0jmLF1MKVwmS6osY9Gd/1nln3jkW07LVOhm2GdV0CCI908gYMINZW696Lsig0dBxv+DwjYfIFQIzAZ3ne12Ya5BscnESnzERcqLzewmZvwcBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=GANdOolf; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="GANdOolf"
Received: from LAPTOP-N070L597.localdomain (unknown [222.191.246.242])
	by smtp.qiye.163.com (Hmail) with ESMTP id 32f6c5976;
	Tue, 3 Feb 2026 20:30:43 +0800 (GMT+08:00)
From: Zilin Guan <zilin@seu.edu.cn>
To: andy.shevchenko@gmail.com
Cc: andy@kernel.org,
	gregkh@linuxfoundation.org,
	hansg@kernel.org,
	hverkuil@kernel.org,
	jianhao.xu@seu.edu.cn,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	zilin@seu.edu.cn
Subject: Re: [PATCH v2] media: atomisp: Fix memory leak in atomisp_fixed_pattern_table()
Date: Tue,  3 Feb 2026 12:30:42 +0000
Message-Id: <20260203123042.3745628-1-zilin@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CAHp75Vd1jd9o3NuFOEBH9DHhX7VZcqYfkaZ6N4AvKJz0=7Wg1g@mail.gmail.com>
References: <CAHp75Vd1jd9o3NuFOEBH9DHhX7VZcqYfkaZ6N4AvKJz0=7Wg1g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9c237bd2a503a1kunm3123fa8e28b62f
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCGh4aVk1DGRgZHUpMGR8YSlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJSUlVSkJKVUlPTVVJT0lZV1kWGg8SFR0UWUFZT0tIVUpLSUhOQ0NVSktLVU
	tZBg++
DKIM-Signature: a=rsa-sha256;
	b=GANdOolf4yZu8rJhQZrmpcHHTScwB05KhsF5gIH0eXo/l/mV6s2FPCEE0zzLBZ/TFxAA4YoVtb8/fbh3aC6/KkiUu31YivxaLMoWnMLpHAeMUqfmq1Bdm4PAKV7XrnBEjVZ2FSlWhVdltNOTJeB3ly8J84SPDEG5wqsfIonNxRo=; s=default; c=relaxed/relaxed; d=seu.edu.cn; v=1;
	bh=0p1xL2PYhoW2I+JlqTaQUb7nzwe+Gpv2OrBcrq4OoxI=;
	h=date:mime-version:subject:message-id:from;

On Tue, Feb 03, 2026 at 10:12:34AM +0200, Andy Shevchenko wrote:
> On Sun, Feb 1, 2026 at 3:59 PM Zilin Guan <zilin@seu.edu.cn> wrote:
> >
> > atomisp_v4l2_framebuffer_to_css_frame() allocates memory for
> > temporary variable raw_black_frame, which must be released via
> > ia_css_frame_free() before the function returns. However, if
> > sh_css_set_black_frame() fails, the function returns immediately without
> > performing this cleanup, leading to a memory leak.
> >
> > Fix this by assigning the error code to ret and allowing the code to
> > fall through to the ia_css_frame_free() call.
> >
> > The bug was originally detected on v6.13-rc1 using an experimental
> > static analysis tool we are developing, and we have verified that the
> > issue persists in the latest mainline kernel. The tool is based on the
> > LLVM framework and is specifically designed to detect memory management
> > issues. It is currently under active development and not yet publicly
> > available.
> >
> > We performed build testing on x86_64 with allyesconfig. Since triggering
> > this error path in atomisp requires specific Intel Atom ISP hardware and
> > firmware, we were unable to perform runtime testing and instead verified
> > the fix according to the code logic.
> 
> ...
> 
> > +++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> > @@ -3369,7 +3369,7 @@ int atomisp_fixed_pattern_table(struct atomisp_sub_device *asd,
> >
> >         if (sh_css_set_black_frame(asd->stream_env[ATOMISP_INPUT_STREAM_GENERAL].stream,
> >                                    raw_black_frame) != 0)
> > -               return -ENOMEM;
> > +               ret = -ENOMEM;
> >
> >         ia_css_frame_free(raw_black_frame);
> >         return ret;
> 
> 
> No, instead assign the returned code to ret to begin with
> 
>   ret = sh_css_set_black_frame(...);
>   ia_css_frame_free(raw_black_frame);
>   return ret;
> 
> -- 
> With Best Regards,
> Andy Shevchenko

Hi Andy,

Thanks for the suggestion. Assigning the return value directly to ret is 
indeed cleaner.

I will update the code as suggested and send v3.

Best regards,
Zilin Guan
