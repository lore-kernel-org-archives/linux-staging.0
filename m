Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E059E70
	for <linux-staging@lists.linux.dev>; Sun,  1 Aug 2021 17:50:56 +0000 (UTC)
Received: from martin by viti.kaiser.cx with local (Exim 4.89)
	(envelope-from <martin@viti.kaiser.cx>)
	id 1mAFbt-0002fK-Te; Sun, 01 Aug 2021 19:50:49 +0200
Date: Sun, 1 Aug 2021 19:50:49 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Larry Finger <Larry.Finger@lwfinger.net>
Cc: Phillip Potter <phil@philpotter.co.uk>,
	Greg KH <gregkh@linuxfoundation.org>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-staging@lists.linux.dev, Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: Re: [PATCH v4 0/6] staging: r8188eu: add newer/better RTL8188eu
 driver
Message-ID: <20210801175049.eubghjzmhx25ol73@viti.kaiser.cx>
References: <20210727232219.2948-1-phil@philpotter.co.uk>
 <20210728074605.pp5rs4c65tofnqot@viti.kaiser.cx>
 <CAA=Fs0mH9YAVhr24YeE3jpZrnuDGhOuhj=Sb9Ekkpb-xoC5LYg@mail.gmail.com>
 <20210729133730.lnxqzawnvksp4skg@viti.kaiser.cx>
 <1d687d5f-d514-655a-f8bf-a5bac321affb@lwfinger.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1d687d5f-d514-655a-f8bf-a5bac321affb@lwfinger.net>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: Martin Kaiser <martin@viti.kaiser.cx>

Hello Greg and Larry,

thanks for your responses.

Thus wrote Larry Finger (Larry.Finger@lwfinger.net):

> I do see this driver being cleaned up to the point that it transitions to mainline.

> It is not clear to me that it would fit into the rtlwifi framework. It
> probably could use the USB driver there, but unlikely to use a lot more of
> that code.

Ok, that clarifies that path forward. I wasn't sure if a standalone
(non-rtlwifi) driver is acceptable at all.

> I will certainly be on the lookout for conflicts with the rtlwifi and
> rtl8xxxu, indeed the whole drivers/net/wireless/realtek/, code as the
> cleanup proceeds.

At the moment, the driver (like the old one) can be compiled only as a
module. I guess that's because of name conflicts between realtek drivers
that originated from the same codebase. It seems that we'll have to
rename some functions along the way.

Thanks,
Martin
