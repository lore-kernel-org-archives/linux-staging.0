Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FDF82F23
	for <linux-staging@lists.linux.dev>; Tue,  8 Feb 2022 14:17:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CD37C004E1;
	Tue,  8 Feb 2022 14:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1644329829;
	bh=GK8zL7bCJXUu6YBd8ARaHTZaT8YLbCB64RKltU4JUTY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sJMlrQOu2pPNdZDw0l5vjkifH8fFo7/LATREK55pEiqV57421UXftgQ75PSt+uM09
	 d5hR8nCqsrYtte6hbTosbbwTuSkerdGk5jDcFbBZwL00uZoQLGYm5WTPnbS5Uvk0WL
	 gK3eFrlDIhPGl/6XXNiLwc3L6J002BpJqTkJr6gI=
Date: Tue, 8 Feb 2022 15:17:06 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Ankit Kumar Pandey <itsankitkp@gmail.com>
Cc: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	martin@kaiser.cx, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Fixed stylegude error in drivers/staging/rtl8712 by
 removing un-needed commented out lines
Message-ID: <YgJ7YhsyPVpdBt2J@kroah.com>
References: <YgJ5t1/Cn93qtBAE@ankit-vm>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YgJ5t1/Cn93qtBAE@ankit-vm>

On Tue, Feb 08, 2022 at 07:39:59PM +0530, Ankit Kumar Pandey wrote:
> Volatile keyword was left commented out as it was probably used during
> development but was not needed in final build.

Are you sure?  Doesn't it convey some meaning here that needs to be
verified before you remove it?

> And this was causing styleguide error, so I have removed this and there
> for this patch reduces minor styleguide warnings to 0

You can not mix coding style fixes like my bot told you :(

Also the subject line for this change is very odd, look at others for
this same file to see examples of what to do:

$ git log --oneline drivers/staging/rtl8712/rtl871x_pwrctrl.h | head -n 5
9be550ee4391 staging: rtl8712: get rid of flush_scheduled_work
c75afdaf2e53 staging: rtl8712: remove extra blank lines
7c93fdf090df staging: rtl8712: r8712_register_cmd_alive(): Change return values
e24c1f8658c9 staging: rtl8712: add SPDX identifiers
b355da4c7cfb Staging: rtl8712: rtl871x_pwrctrl.h - style fix

thanks,

greg k-h
