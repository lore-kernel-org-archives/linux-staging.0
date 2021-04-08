Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55D46D00
	for <linux-staging@lists.linux.dev>; Thu,  8 Apr 2021 19:53:05 +0000 (UTC)
Received: from martin by viti.kaiser.cx with local (Exim 4.89)
	(envelope-from <martin@viti.kaiser.cx>)
	id 1lUai0-0005Mt-Kd; Thu, 08 Apr 2021 21:52:56 +0200
Date: Thu, 8 Apr 2021 21:52:56 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, linux-staging@lists.linux.dev,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/10] staging: rtl8188eu: remove unused macros
Message-ID: <20210408195256.j6phxlsjf73w3pof@viti.kaiser.cx>
References: <20210407170531.29356-1-martin@kaiser.cx>
 <YG6wEDs2ZVPAOeUZ@kroah.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YG6wEDs2ZVPAOeUZ@kroah.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: Martin Kaiser <martin@viti.kaiser.cx>

Thus wrote Greg Kroah-Hartman (gregkh@linuxfoundation.org):

> Wow, that's there for a really old kernel version and should not be
> needed anymore at all.  I'll take this, but please remove the other ones
> here, they are not necessary.

Ok, I see what you mean. New patch is on the way.

Best regards,
Martin
