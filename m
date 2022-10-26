Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C68139F;
	Wed, 26 Oct 2022 13:51:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86151C433C1;
	Wed, 26 Oct 2022 13:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1666792297;
	bh=HKTXbklFgkZRcsC9KCxAcDRF1DhW6GsskRH6sDGwdoQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TUmSDcH1+dPCaB5/1lDr7wepq/jZSmLYFP94fi90Dk7weU573EjVrO2DqKyLBmK4z
	 wbiC8qFflt/alrzUQ53urFGw9D0uqoL/knn+7gb0OQipjTEuA6XRy/0+osyePZfK7w
	 qNM6RISbGRSjA3I7RWUrA3q+gKFfvxQyV7IcZpPo=
Date: Wed, 26 Oct 2022 15:52:29 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: Re: [PATCH 02/17] staging: vt6655: changed variable names:
 s_vFillRTSHead
Message-ID: <Y1k7nY8LnibU5lMh@kroah.com>
References: <cover.1666740522.git.tanjubrunostar0@gmail.com>
 <8afb904f9fb22a262b3563d5cfc5804863bfb5ea.1666740522.git.tanjubrunostar0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8afb904f9fb22a262b3563d5cfc5804863bfb5ea.1666740522.git.tanjubrunostar0@gmail.com>

On Tue, Oct 25, 2022 at 11:36:58PM +0000, Tanjuate Brunostar wrote:
>     change variable names s_vFillRTSHead and wTimeStampOff to meet the
>     linux coding standard, as it says to avoid using camelCase naming style.
>     Cought by checkpatch

s_vFillRTSHead is not a variable name.  It is a function name, and ick,
that's a horrid name, please make it sane (i.e. do NOT put the type of
the function in the name like they did here.)

thanks,

greg k-h
