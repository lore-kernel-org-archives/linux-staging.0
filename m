Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13FC28F2
	for <linux-staging@lists.linux.dev>; Thu,  7 Jul 2022 19:57:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3783C3411E;
	Thu,  7 Jul 2022 19:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1657223822;
	bh=n7MelmtNe8VfFFywW2/Di9aycwkuewiUHOubfAM+7e0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K5xuq4KAzqIehIFHonir99QSW6W4dulY/1If9Fa4lmDzX0wZYDVDDivMQPaYjAnBF
	 s1jiddqm1PbDSImX31tT+5et9Deq+DWDWR55zf3Y5jJ3YfAMAz5/AipMI/xSUSEz5P
	 h+2jXgsWO7SROGrOTagK84V8tP7cveOChTKwSNVE=
Date: Thu, 7 Jul 2022 21:56:59 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: huangzetao <huangzetao1@huawei.com>
Cc: "Larry.Finger@lwfinger.net" <Larry.Finger@lwfinger.net>,
	"phil@philpotter.co.uk" <phil@philpotter.co.uk>,
	"paskripkin@gmail.com" <paskripkin@gmail.com>,
	"straube.linux@gmail.com" <straube.linux@gmail.com>,
	"martin@kaiser.cx" <martin@kaiser.cx>,
	"abdun.nihaal@gmail.com" <abdun.nihaal@gmail.com>,
	"linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	"inux-kernel@vger.kernel.org" <inux-kernel@vger.kernel.org>
Subject: Re: =?utf-8?B?562U5aSNOiBbUEFUQ0ggLW5leHQg?=
 =?utf-8?Q?v2=5D_staging=3A_r8188eu?= =?utf-8?Q?=3A?= Use
 eth_broadcast_addr() to assign broadcast address
Message-ID: <Ysc6i+zLCDS4v/7j@kroah.com>
References: <20220701094011.81163-1-huangzetao1@huawei.com>
 <Yr7DQJTPrSWTOa0c@kroah.com>
 <c4a1182373524b398889b3e1da078127@huawei.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c4a1182373524b398889b3e1da078127@huawei.com>

On Mon, Jul 04, 2022 at 02:45:45AM +0000, huangzetao wrote:
> Please disregard it.

Ok, I will now disregard all patches with the "reported-by: Hulk Robot".

greg k-h
