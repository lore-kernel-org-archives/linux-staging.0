Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795185112;
	b=hWvvjwC7J1iNRVgs1uQHSOKYXuu6RBpJjdO2Rc/tMjVzEn6iom+bq763OEWVDEij64Dt
	 8MqOKka6l55aYEDcOGsfFTvCxL7r7bJfEjpicmtKeakHEZYsb83Y8XznVidzKsaBSS/Qj
	 BbhB2Fl63nQZn11cs/n5T+tucg1bdyHKPNieFwo9VUUr3rwmOBF/SspY9rq5WPdHfyj0e
	 6NF6Vh2hJgVY/LXb0gv2eNqzCULtrbB/tEgrK9xxro5J17FrdFXsQ3Y8CViwL8uJsSLLS
	 B5UEZCQoOwOwFx6gJkC8VzGYHzfNxZdJsezEI7AdSg9hfxHq2gvwy7tX22T+kvB/jyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795185112;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=UKqMm3UXGqso/anZy4h8q75LGkn2zjk5fh4PpP+m3sA=;
	b=BM+8gME7Cj9gNQGg0YcksMFD5A+GkwEEsPpDXBNeLUcjBEwLlkdFhkExbn8kt4G8weTa
	 WmunVcgyj20tk1jRvXJm54Yj15vCaeUh31z8mVBYZ3smppA6paRBsnEgdTkbMY1Ied7G7
	 RAjD/S64xeLEOLRDrrT59nsBPA3UCRiqRyDOPx5gNMD8bH91BVcxrJaf8veQ8HLwiMZLQ
	 Yfuq1ZzSYx/3tIlhzGAZXyyWUpd0daPeOCj1uWol05q91fZNBaHuN15BlEhfnI7zQh1ar
	 WUnfdNqFgVTQ8HOmk91YF2trErdAAXESS+ik/T3MKXGKUglTQYzH75GLjpmzOnFj1gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=HgLDQrvT;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C66DC60A262A
	for <linux-staging@lists.linux.dev>; Fri, 20 Nov 2026 14:31:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C66DC60A262A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=HgLDQrvT
Received: from killaraus.ideasonboard.com (2001-14ba-7086-3000--a06.rev.dnainternet.fi [IPv6:2001:14ba:7086:3000::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CB45B177;
	Fri, 20 Nov 2026 15:29:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1795184959;
	bh=PbMjJCJgx3+izFU6cu2LfBSpM6luqbK+uhrzCbmlxRQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HgLDQrvTF2KGEte1LaI3I+6S2Tni780bRwGgmjKdrNLC0OKZxcddLdVRb9ppXqDOZ
	 wlAKCmPbwgEnHD8zLOIX5bZvCcnc6RtQaEh7zKeZfaYd9NRkqHZw3fOF6+p7QjRfhL
	 4d41Ax3rGdKiHr9a4c2O3bKzIlpH1Ymj0Y66emr8=
Date: Fri, 20 Nov 2026 16:31:47 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Cong Nguyen <congnt264@gmail.com>,
	Faisal Mukhtar <mukhtarfaisal03@gmail.com>,
	Dan Carpenter <error27@gmail.com>,
	Hungyu Lin <dennylin0707@gmail.com>,
	Hao-Qun Huang <alvinhuang0603@gmail.com>,
	Yury Norov <ynorov@nvidia.com>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v1 01/10] staging: media: tegra-video: Move driver to
 media/platform/nvidia
Message-ID: <20261120143147.GA2466366@killaraus.ideasonboard.com>
References: <20261113161819.36847-1-clamor95@gmail.com>
 <20261113161819.36847-2-clamor95@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261113161819.36847-2-clamor95@gmail.com>

On Fri, Nov 13, 2026 at 06:18:10PM +0200, Svyatoslav Ryhel wrote:
> The Tegra Video Input drivers are mature and developed enough to be moved
> from staging into the media subsystem. No other changes are introduced.

The driver should at least be converted to be MC-centric before being
moved out of staging. I haven't checked if other changes would also be
needed.

> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/media/platform/nvidia/Kconfig                           | 2 ++
>  drivers/media/platform/nvidia/Makefile                          | 1 +
>  .../media => media/platform/nvidia}/tegra-video/Kconfig         | 0
>  .../media => media/platform/nvidia}/tegra-video/Makefile        | 0
>  .../{staging/media => media/platform/nvidia}/tegra-video/TODO   | 0
>  .../{staging/media => media/platform/nvidia}/tegra-video/csi.c  | 0
>  .../{staging/media => media/platform/nvidia}/tegra-video/csi.h  | 0
>  .../media => media/platform/nvidia}/tegra-video/tegra20.c       | 0
>  .../media => media/platform/nvidia}/tegra-video/tegra210.c      | 0
>  .../{staging/media => media/platform/nvidia}/tegra-video/vi.c   | 0
>  .../{staging/media => media/platform/nvidia}/tegra-video/vi.h   | 0
>  .../media => media/platform/nvidia}/tegra-video/video.c         | 0
>  .../media => media/platform/nvidia}/tegra-video/video.h         | 0
>  .../{staging/media => media/platform/nvidia}/tegra-video/vip.c  | 0
>  .../{staging/media => media/platform/nvidia}/tegra-video/vip.h  | 0
>  drivers/staging/media/Kconfig                                   | 2 --
>  drivers/staging/media/Makefile                                  | 1 -
>  17 files changed, 3 insertions(+), 3 deletions(-)
>  rename drivers/{staging/media => media/platform/nvidia}/tegra-video/Kconfig (100%)
>  rename drivers/{staging/media => media/platform/nvidia}/tegra-video/Makefile (100%)
>  rename drivers/{staging/media => media/platform/nvidia}/tegra-video/TODO (100%)
>  rename drivers/{staging/media => media/platform/nvidia}/tegra-video/csi.c (100%)
>  rename drivers/{staging/media => media/platform/nvidia}/tegra-video/csi.h (100%)
>  rename drivers/{staging/media => media/platform/nvidia}/tegra-video/tegra20.c (100%)
>  rename drivers/{staging/media => media/platform/nvidia}/tegra-video/tegra210.c (100%)
>  rename drivers/{staging/media => media/platform/nvidia}/tegra-video/vi.c (100%)
>  rename drivers/{staging/media => media/platform/nvidia}/tegra-video/vi.h (100%)
>  rename drivers/{staging/media => media/platform/nvidia}/tegra-video/video.c (100%)
>  rename drivers/{staging/media => media/platform/nvidia}/tegra-video/video.h (100%)
>  rename drivers/{staging/media => media/platform/nvidia}/tegra-video/vip.c (100%)
>  rename drivers/{staging/media => media/platform/nvidia}/tegra-video/vip.h (100%)

-- 
Regards,

Laurent Pinchart
