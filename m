Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com [91.221.196.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AABEA2C96
	for <linux-staging@lists.linux.dev>; Fri,  5 Nov 2021 22:03:59 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
	by mx2.smtp.larsendata.com (Halon) with ESMTPS
	id 509f24b8-3e84-11ec-ac3c-0050568cd888;
	Fri, 05 Nov 2021 22:04:15 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net [80.162.45.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: sam@ravnborg.org)
	by mail01.mxhotel.dk (Postfix) with ESMTPSA id D8AA4194B12;
	Fri,  5 Nov 2021 23:03:50 +0100 (CET)
Date: Fri, 5 Nov 2021 23:03:49 +0100
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Cc: gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] staging: fbtft: Remove fb_watterott driver
Message-ID: <YYWqRSaVrLLmW7GV@ravnborg.org>
References: <20211105202448.62518-1-noralf@tronnes.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211105202448.62518-1-noralf@tronnes.org>

On Fri, Nov 05, 2021 at 09:24:48PM +0100, Noralf Trønnes wrote:
> This driver was made for a prototype and as far as I know it never went
> into production because it was too slow. So let's remove it.
> 
> Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
