Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D12C2F0
	for <linux-staging@lists.linux.dev>; Sat,  1 Jul 2023 15:00:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA57FC433C7;
	Sat,  1 Jul 2023 15:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1688223649;
	bh=+CATQ94X96pEsyvLLOgVuj1lXomvGeVeEj/5+G0He70=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IugKfnLCUmen9tyhpHqp7khuvKjnd4QiZTBtTs6YmpQA7x/ibTk6VaY4+nC6wiqYQ
	 ehoa2e0ol6Lyt/ame8kyPwlJzjF9gk4aD65wv3JlAY5qtAyYsOcR9hwvZicds7VymN
	 vgW00+0+EuaM+ZFzPGpWgIlIT2UTayLbAZ1WHjy8=
Date: Sat, 1 Jul 2023 17:00:46 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Franziska =?iso-8859-1?Q?N=E4pelt?= <franziska.naepelt@googlemail.com>,
	linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Emily Peri <eperi1024@gmail.com>, Guo Zihua <guozihua@huawei.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Kang Minchul <tegongkang@gmail.com>,
	Philipp Hortmann <philipp.g.hortmann@gmail.com>,
	Veerendranath Jakkam <quic_vjakkam@quicinc.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/3] staging: rtl8723bs: Fix space issues
Message-ID: <2023070123-unburned-worsening-0713@gregkh>
References: <20230701102538.5359-1-franziska.naepelt@googlemail.com>
 <5ad04b3a-7c77-cadb-13b4-509a086cf04d@web.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5ad04b3a-7c77-cadb-13b4-509a086cf04d@web.de>

On Sat, Jul 01, 2023 at 04:43:09PM +0200, Markus Elfring wrote:
> You should not put only your own email address into the field “To”.
> Please reconsider the distribution of addresses between message header fields once more.

Please do not comment on staging driver changes anymore, it is not
helpful to anyone involved.

greg k-h
