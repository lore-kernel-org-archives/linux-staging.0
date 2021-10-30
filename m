Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com [91.221.196.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB612C82
	for <linux-staging@lists.linux.dev>; Sat, 30 Oct 2021 18:51:51 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
	by mx2.smtp.larsendata.com (Halon) with ESMTPS
	id 534003bd-39b2-11ec-ac3c-0050568cd888;
	Sat, 30 Oct 2021 18:51:00 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net [80.162.45.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: sam@ravnborg.org)
	by mail01.mxhotel.dk (Postfix) with ESMTPSA id 3952D194C35;
	Sat, 30 Oct 2021 20:50:41 +0200 (CEST)
Date: Sat, 30 Oct 2021 20:50:39 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] staging/fbtft: Fix backlight
Message-ID: <YX2T/4I6YnBg/gOG@ravnborg.org>
References: <20211030162901.17918-1-noralf@tronnes.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211030162901.17918-1-noralf@tronnes.org>

On Sat, Oct 30, 2021 at 06:29:01PM +0200, Noralf Trønnes wrote:
> Commit b4a1ed0cd18b ("fbdev: make FB_BACKLIGHT a tristate") forgot to
> update fbtft breaking its backlight support when FB_BACKLIGHT is a module.
> 
> Fix this by using IS_ENABLED().
> 
> Fixes: b4a1ed0cd18b ("fbdev: make FB_BACKLIGHT a tristate")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Noralf Trønnes <noralf@tronnes.org>

Acked-by: Sam Ravnborg <sam@ravnborg.org>
