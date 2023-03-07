Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF03A2577;
	Tue,  7 Mar 2023 08:18:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23A45C433D2;
	Tue,  7 Mar 2023 08:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1678177119;
	bh=iFtZJY6joyaxJ6ADt/mWBI2yiWQo/C9fw6pfP6N9mtw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N2XdzAl5RViq1vIDsUYry3s7w+QDQ7nA7dMz9JWbmuXSK1rIxMU2b/f7fHUlqYVUw
	 LQQoylywLTOhH9GKkizHxrikMJHeqTlmwOdo+tsBBsRvo/3UfAPwLqCMCc9nSTtaoT
	 mfmNovxjz/zeYfwVRP5EAq8lhrq3p4SUX7/LsNTo=
Date: Tue, 7 Mar 2023 09:18:36 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Khadija <kamrankhadijadj@gmail.com>
Cc: Dan Carpenter <error27@gmail.com>, outreachy@lists.linux.dev,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: axis-fifo: alignment should match opening
 parenthesis in axis-fifo.c
Message-ID: <ZAbzXA5+tMaagtFj@kroah.com>
References: <ZAZSmPpB6fcozGa4@khadija-virtual-machine>
 <9543f943-759f-4e87-8f88-4eba7c1e4785@kili.mountain>
 <CACcTnM5kVTG3JaLK9mjaOO7qcXoTrb4xsg2af5Ac1ScqFfbjTg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACcTnM5kVTG3JaLK9mjaOO7qcXoTrb4xsg2af5Ac1ScqFfbjTg@mail.gmail.com>

On Tue, Mar 07, 2023 at 01:10:17PM +0500, Khadija wrote:
> Hey Dan! Thank you for your feedback.
> Yes, the code currently looks unreadable. I am making changes and resending
> the patch.
> Also, on running checkpatch.pl on my patch file I get a warning about 75
> chars per line. Is there a way of fixing it automatically using script?

Hi,

Minor housekeeping notes.  Your email client is sending out html email,
which is rejected by the public mailing lists.  Please reconfigure it to
not do that.

Also, try not to ever top-post like this, it breaks the review process
and makes it impossible at times to determine what you are actually
responding back to.  Read some of the mailing list archives at
lore.kernel.org for examples of the proper way to respond to messages
inline.

thanks,

greg k-h
