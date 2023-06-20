Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1471643F
	for <linux-staging@lists.linux.dev>; Tue, 20 Jun 2023 14:11:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C18A0C433CA;
	Tue, 20 Jun 2023 14:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1687270296;
	bh=BySw7zeEB+zqgTdSK07c1pD8YXeUFZjxQogJ1e5vW+I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WqW7UZIwMPujOd37QYsJAwDjyW9IfiLgFlA1DZ4rwi3pYToXRoN5ycs/OLYxtX0X8
	 NaYpi+6iNl8kSjeKbWmcPrUxJ8BDkPB2FvTXMqHjWv8XFDN2k4k/jcbjurI6CwC2zB
	 jB0e9WOD3ZRdO3Y/gmUWM7dpDqlrSCyQvLPL1pEs=
Date: Tue, 20 Jun 2023 16:11:33 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Umang Jain <umang.jain@ideasonboard.com>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Adrien Thierry <athierry@redhat.com>,
	Stefan Wahren <stefan.wahren@i2se.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] staging: vchiq_arm: Remove extra struct vchiq_instance
 declaration
Message-ID: <2023062022-emerald-bartender-4065@gregkh>
References: <20221221074047.233473-1-umang.jain@ideasonboard.com>
 <52a40c60-f044-c757-f8fd-241f456fb722@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <52a40c60-f044-c757-f8fd-241f456fb722@ideasonboard.com>

On Tue, Jun 20, 2023 at 07:16:15PM +0530, Umang Jain wrote:
> Hi again,
> 
> Can this be collected please?. The series has two R-b tags and I think it
> got skipped during the last window?

SOrry for the delay, this got dropped somewhere, now queued up.

greg k-h
