Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574BC256A
	for <linux-staging@lists.linux.dev>; Thu, 26 Jan 2023 14:27:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FE03C433EF;
	Thu, 26 Jan 2023 14:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674743255;
	bh=kyg287jVxNn5KSlNEsVGJfYboudO4DBm+FJvwry/P14=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KWMMZa3enFGjyBvR2geXY/y1os9YbC/Uq6fvpBx147xoAci6F2dWQUwOp5qev7dqv
	 sDFzMt7hO6YpQHUbi6UXLJq/caD9FXOsVNgrL+IcDeaytcggK82q8G4TPARg46UQvR
	 qp4uxp3LOCVaFqBaaCiwljX3GBc1l6jZqUd5AJMLb2hOnEyztqjAXwXmyWbJDEosk5
	 fuPKSnnu2l0tBH3n5rSQm/zULLwOhCLeU2BQcHzouuw4T2jv6+uHjM+0xXK+iTmSzm
	 vld+2pv3ErucYbDOohg29FfZIjY619rILYR8g/bpIZoRx6/QTcILHFraOIiC5DP3WZ
	 c4HaAqCJIpw1A==
Date: Thu, 26 Jan 2023 14:27:26 +0000
From: Lee Jones <lee@kernel.org>
To: sam@ravnborg.org
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Helge Deller <deller@gmx.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Antonino Daplas <adaplas@gmail.com>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Paul Mackerras <paulus@samba.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Robin van der Gracht <robin@protonic.nl>,
	Miguel Ojeda <ojeda@kernel.org>,
	Daniel Thompson <daniel.thompson@linaro.org>,
	Jingoo Han <jingoohan1@gmail.com>, linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org, linux-staging@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, Stephen Kitt <steve@sk2.org>
Subject: Re: [PATCH 15/15] backlight: backlight: Drop the deprecated fb_blank
 property
Message-ID: <Y9KNziZJxMjCffbs@google.com>
References: <20230107-sam-video-backlight-drop-fb_blank-v1-0-1bd9bafb351f@ravnborg.org>
 <20230107-sam-video-backlight-drop-fb_blank-v1-15-1bd9bafb351f@ravnborg.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230107-sam-video-backlight-drop-fb_blank-v1-15-1bd9bafb351f@ravnborg.org>

On Sat, 07 Jan 2023, Sam Ravnborg via B4 Submission Endpoint wrote:

> From: Sam Ravnborg <sam@ravnborg.org>
> 
> With all users gone remove the deprecated fb_blank member in
> backlight_properties.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Lee Jones <lee@kernel.org>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>
> ---
>  drivers/video/backlight/backlight.c |  2 --
>  include/linux/backlight.h           | 22 ----------------------
>  2 files changed, 24 deletions(-)

Applied, thanks

-- 
Lee Jones [李琼斯]
