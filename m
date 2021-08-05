Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3066A70
	for <linux-staging@lists.linux.dev>; Thu,  5 Aug 2021 10:50:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3922D61078;
	Thu,  5 Aug 2021 10:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1628160599;
	bh=SthkhSquS85GXKy9NWYR3UdjN9V1PIPsmvC9ZDihriw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=su0za5GN/yilG07ZhxIw4AeQrE/jkrMPRlot9BD8l7Qyaufhtq+bDQVnaCf3SiNoH
	 37p5nVjYUc1RByUZWmioO9/FPBQ3Zh7A6A9YtqORvZ62eNDYn64jh7ChkDrQWKgrB5
	 yGs16X40V0YlzXSDGs3oSjFmH7MrUmESjOO2DRfE=
Date: Thu, 5 Aug 2021 12:49:57 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: r8188eu: include: Remove unused const
 definitions
Message-ID: <YQvCVZEU4WWLOdk9@kroah.com>
References: <20210802011025.23887-1-fmdefrancesco@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210802011025.23887-1-fmdefrancesco@gmail.com>

On Mon, Aug 02, 2021 at 03:10:25AM +0200, Fabio M. De Francesco wrote:
> Remove unused const definitions. Issues detected by sparse. Remove the
> '#ifdef' and '#endif' preprocessor directives that surround them.

Can you now also remove the unneeded comments that reference these
variables as they make even less sense now?

thanks,

greg k-h
