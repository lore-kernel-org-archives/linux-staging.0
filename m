Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 694DA7FC
	for <linux-staging@lists.linux.dev>; Wed, 14 Jun 2023 13:52:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51FC5C433C0;
	Wed, 14 Jun 2023 13:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686750725;
	bh=CO5xc8YPPQWPDb40OvDsmBIPZj3o5j1/a0jNwh4QVN4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dMU49nXfjD0xUXILvTvlDXF8NMUb2VlD+tfLPuwxXKPYNwvghwaxBU+9u2dFQKFMo
	 XG+fJzMiwNtoO0PTs068LLyp6fKUG1EThsNPAAUJAhH3cSh2dtIxXzlGd88HQv484/
	 ZAlAl83NY+7EBAOlT+shnVTY6WCtv7JBz6vvP95GR1zrwO/OawUrUrsW1MuGojBZsU
	 ioUn869QlwHx9xsO4FSJtFNrH+83l/Y//XX2lHjKyHDmUnW2nJ8wKCVlv7fkPfS+Te
	 paPKw8aaxdheBAC+5kYRLZAtm7ruqPpKky4hXCGyPIRxJST++sKSPrIR2izAJsgq5m
	 lVIOfM71BDihA==
Date: Wed, 14 Jun 2023 14:51:57 +0100
From: Lee Jones <lee@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: daniel@ffwll.ch, javierm@redhat.com, sam@ravnborg.org, deller@gmx.de,
	geert+renesas@glider.be, daniel.thompson@linaro.org,
	jingoohan1@gmail.com, dan.carpenter@linaro.org,
	michael.j.ruhl@intel.com, linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-sh@vger.kernel.org,
	linux-omap@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH v3 01/38] backlight/bd6107: Compare against struct
 fb_info.device
Message-ID: <20230614135157.GU3635807@google.com>
References: <20230613110953.24176-1-tzimmermann@suse.de>
 <20230613110953.24176-2-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230613110953.24176-2-tzimmermann@suse.de>

On Tue, 13 Jun 2023, Thomas Zimmermann wrote:

> Struct bd6107_platform_data refers to a platform device within
> the Linux device hierarchy. The test in bd6107_backlight_check_fb()
> compares it against the fbdev device in struct fb_info.dev, which
> is different. Fix the test by comparing to struct fb_info.device.
> 
> Fixes a bug in the backlight driver and prepares fbdev for making
> struct fb_info.dev optional.
> 
> v2:
> 	* move renames into separate patch (Javier, Sam, Michael)
> 
> Fixes: 67b43e590415 ("backlight: Add ROHM BD6107 backlight driver")
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Cc: Lee Jones <lee@kernel.org>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v3.12+
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> ---
>  drivers/video/backlight/bd6107.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Can the Backlight patches be applied without the others and visa versa?

-- 
Lee Jones [李琼斯]
