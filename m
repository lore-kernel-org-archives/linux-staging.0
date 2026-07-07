Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879F13DEFF6;
	Tue,  7 Jul 2026 10:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783419645; cv=none; b=Tli9Y87nLPgNZq3jU/wyouGKvwlXDddmJ1ZLrfhTRSVkm8Zq/y27szPIVl0IfvEOuwPZ8rmRpD//0mXZC5wxzTMcvelwgsv+52i0EsOeUIqsTZTvqr68dgJL8TDNsBvcfCXNK/ZKPysoHnUEUGdcaKD7F5FM1KiJyajvXG2H9wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783419645; c=relaxed/simple;
	bh=ttyg/4SJMq3MDKgp340Cq2oz3SXIDSgUXjtRDJZHMUI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l+HX2pvWRxy62wBhrPP4b6AuaGopkMa8NQNlsy2aGVbznBHQzuMic6uvmw3LNO19C8MNDJGLFqrT7NnVO4C1A+wIJGWk6EA9slbtRWzEFvm0tBKe9SQjR8yulV19POHOAjrps6JVR5xe+jgUlWG1IvmG/DxEHMh6AC27j3Y7k5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=KdHiYJ8h; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="KdHiYJ8h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 834D01F00A3A;
	Tue,  7 Jul 2026 10:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783419642;
	bh=X9A7GX7g3tw23EOgwClqEw1Chd5IB/fyt9P36dDn18w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KdHiYJ8hc/s5x8cdZC2os5IBfcKH/7Wj3IQwRf3Ed0kHJ1DrZl1VjfY/raK2n8m64
	 oOgQUZSxuUftpa/zwJpRs5X5Kxvsm5iQVs71R8hLEHTQxjnTGy2jatvi0LqHZa0NFA
	 SowwXdGT3ea2q2f9i9TDGxiYn0HxE+l3dLa+6438=
Date: Tue, 7 Jul 2026 12:20:39 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Manuel Ebner <manuelebner@mailbox.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Omer El Idrissi <omer.e.idrissi@gmail.com>,
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 4/4 staging: rtl8723bs: cleanup braces of sdio_intf.c
Message-ID: <2026070730-ravine-buckwheat-99a3@gregkh>
References: <20260525084956.215254-2-manuelebner@mailbox.org>
 <20260525090611.216670-2-manuelebner@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260525090611.216670-2-manuelebner@mailbox.org>

On Mon, May 25, 2026 at 11:06:12AM +0200, Manuel Ebner wrote:
> Remove braces of one-line if arm.
> 
> Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
> ---
>  drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

You are missing a ] on the subject line :(

