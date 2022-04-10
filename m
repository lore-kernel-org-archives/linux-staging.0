Received: from relay.hostedemail.com (relay.hostedemail.com [64.99.140.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EBBC137A
	for <linux-staging@lists.linux.dev>; Sun, 10 Apr 2022 17:08:08 +0000 (UTC)
Received: from omf16.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay09.hostedemail.com (Postfix) with ESMTP id D73DD22FA7;
	Sun, 10 Apr 2022 17:08:00 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf16.hostedemail.com (Postfix) with ESMTPA id 27B8520019;
	Sun, 10 Apr 2022 17:07:59 +0000 (UTC)
Message-ID: <783d850ce7778e9d8f203155034e432910553b1b.camel@perches.com>
Subject: Re: [PATCH 1/6] staging: r8188eu: drop unnecessary wrapper
 rtw_free_cmd_priv
From: Joe Perches <joe@perches.com>
To: Vihas Makwana <makvihas@gmail.com>, Larry Finger
 <Larry.Finger@lwfinger.net>,  Phillip Potter <phil@philpotter.co.uk>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Michael Straube
 <straube.linux@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Dan
 Carpenter <dan.carpenter@oracle.com>, Pavel Skripkin <paskripkin@gmail.com>
Date: Sun, 10 Apr 2022 10:07:58 -0700
In-Reply-To: <20220410163117.3964-2-makvihas@gmail.com>
References: <20220410163117.3964-1-makvihas@gmail.com>
	 <20220410163117.3964-2-makvihas@gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.40.4-1ubuntu2 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout05
X-Rspamd-Queue-Id: 27B8520019
X-Spam-Status: No, score=0.72
X-Stat-Signature: izm1rq8p4turfu5zpncoxejchtfie6ou
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1/lClx2oPpr4EGHJAsyxoihyxirHS6hFEk=
X-HE-Tag: 1649610479-746718

On Sun, 2022-04-10 at 22:01 +0530, Vihas Makwana wrote:
> Remove the unnecessary wrapper. The logic of rtw_free_cmd_priv can
> be moved to _rtw_free_cmd_priv.

If you are going to drop wrappers, my preference would be
to drop the underscore prefixed ones.


