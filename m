Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3D072
	for <linux-staging@lists.linux.dev>; Fri, 11 Jun 2021 15:36:32 +0000 (UTC)
Received: from martin by viti.kaiser.cx with local (Exim 4.89)
	(envelope-from <martin@viti.kaiser.cx>)
	id 1lrjCI-0004Tj-9y; Fri, 11 Jun 2021 17:35:50 +0200
Date: Fri, 11 Jun 2021 17:35:50 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Phillip Potter <phil@philpotter.co.uk>, gregkh@linuxfoundation.org,
	Larry.Finger@lwfinger.net, straube.linux@gmail.com,
	kaixuxia@tencent.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, liushixin2@huawei.com,
	unixbhaskar@gmail.com, gustavoars@kernel.org,
	bkkarthik@pesu.pes.edu
Subject: Re: [PATCH 0/6] staging: rtl8188eu: remove hal/odm_debug.h
Message-ID: <20210611153550.7p2deovau37rlpju@viti.kaiser.cx>
References: <20210611002504.166405-1-phil@philpotter.co.uk>
 <20210611091010.GE10983@kadam>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210611091010.GE10983@kadam>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: Martin Kaiser <martin@viti.kaiser.cx>

Thus wrote Dan Carpenter (dan.carpenter@oracle.com):

> On Fri, Jun 11, 2021 at 01:24:58AM +0100, Phillip Potter wrote:
> > This series removes hal/odm_debug.h, which contains various preprocessor
> > definitions, as well as an unwieldy ODM_RT_TRACE macro which is not best
> > practice. It also removes all uses of this macro, and the associated
> > fields in struct odm_dm_struct which are only used by this macro.

> > This makes the code cleaner, thus moving it closer to getting out of
> > staging.

> Looks good.

> Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>

same here: looks ok and doesn't break anything

Reviewed-by: Martin Kaiser <martin@kaiser.cx>
Tested-by: Martin Kaiser <martin@kaiser.cx>

Best regards,

   Martin
