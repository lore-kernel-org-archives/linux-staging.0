Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com [91.221.196.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA51E2C96
	for <linux-staging@lists.linux.dev>; Fri,  5 Nov 2021 22:04:58 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
	by mx2.smtp.larsendata.com (Halon) with ESMTPS
	id 776f41b6-3e84-11ec-ac3c-0050568cd888;
	Fri, 05 Nov 2021 22:05:20 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net [80.162.45.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: sam@ravnborg.org)
	by mail01.mxhotel.dk (Postfix) with ESMTPSA id 82348194B62;
	Fri,  5 Nov 2021 23:04:56 +0100 (CET)
Date: Fri, 5 Nov 2021 23:04:55 +0100
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Cc: gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, stable@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2] staging/fbtft: Fix backlight
Message-ID: <YYWqhwVUUO1WQPT+@ravnborg.org>
References: <20211105204358.2991-1-noralf@tronnes.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211105204358.2991-1-noralf@tronnes.org>

On Fri, Nov 05, 2021 at 09:43:58PM +0100, Noralf Trønnes wrote:
> Commit b4a1ed0cd18b ("fbdev: make FB_BACKLIGHT a tristate") forgot to
> update fbtft breaking its backlight support when FB_BACKLIGHT is a module.
> 
> Since FB_TFT selects FB_BACKLIGHT there's no need for this conditional
> so just remove it and we're good.
> 
> Fixes: b4a1ed0cd18b ("fbdev: make FB_BACKLIGHT a tristate")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
