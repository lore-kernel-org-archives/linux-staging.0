Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D1712FBF
	for <linux-staging@lists.linux.dev>; Mon, 31 May 2021 07:56:03 +0000 (UTC)
Received: from martin by viti.kaiser.cx with local (Exim 4.89)
	(envelope-from <martin@viti.kaiser.cx>)
	id 1lncm7-0003sc-UW; Mon, 31 May 2021 09:55:51 +0200
Date: Mon, 31 May 2021 09:55:51 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] staging: rtl8188eu: remove dummy wext handlers
Message-ID: <20210531075551.xjlr74wjxhxsrvj3@viti.kaiser.cx>
References: <20210529121346.8422-1-martin@kaiser.cx>
 <20210529121346.8422-2-martin@kaiser.cx>
 <20210531060223.GV1955@kadam>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210531060223.GV1955@kadam>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: Martin Kaiser <martin@viti.kaiser.cx>

Hi Dan and all,

Thus wrote Dan Carpenter (dan.carpenter@oracle.com):

> The patch is good, but next time, just put all this commentary in the
> commit message.

I was asking myself if this "expression of my doubts" should go into the
commit message or not.

Thanks for the feedback.

   Martin
