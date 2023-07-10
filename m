Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54BA423C6
	for <linux-staging@lists.linux.dev>; Mon, 10 Jul 2023 05:47:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5146C433C8;
	Mon, 10 Jul 2023 05:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1688968027;
	bh=d8K4eM0jKwdKQA1s85MdlK6toxYLzAe2+LGYszPYOvk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=xxzPFNL9Xda0x+ebbSA6bXOUrCEBExZFFL3vWt/RQLkRX5SFmhMDakVNgm/CX3Apl
	 o+H6SD3aHGnknNqFaOV2GqU8LL5p4VhxIUQiFCp1wmrKhSLVJjvkk0kyK0LHdNs/+n
	 D1e0nTwQAj6OOYG3dpZ5jaB1mxoO8Z8flSVd9xZU=
Date: Mon, 10 Jul 2023 07:47:04 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Zhang Shurong <zhang_shurong@foxmail.com>
Cc: Markus Elfring <Markus.Elfring@web.de>, linux-staging@lists.linux.dev,
	kernel-janitors@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	Dan Carpenter <error27@gmail.com>, Xu Panda <xu.panda@zte.com.cn>
Subject: Re: staging: ks7010: potential buffer overflow in
 ks_wlan_set_encode_ext()
Message-ID: <2023071056-amused-yam-5e29@gregkh>
References: <tencent_5153B668C0283CAA15AA518325346E026A09@qq.com>
 <2a41ca22-a0eb-df38-be43-7175e1230bd0@web.de>
 <2023070919-monetary-sleet-2f5c@gregkh>
 <e24f9c2c-1163-631a-f8c0-b6dcb445a858@web.de>
 <tencent_BB4124566E846A2FB6ECC0F63C5A15BE5009@qq.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <tencent_BB4124566E846A2FB6ECC0F63C5A15BE5009@qq.com>

On Mon, Jul 10, 2023 at 01:41:07PM +0800, Zhang Shurong wrote:
> Hi Markus,
> 
> > 2023年7月10日 03:56，Markus Elfring <Markus.Elfring@web.de> 写道：
> > 
> >>>> The "exc->key_len" is a u16 that comes from the user.  If it's over
> >>>> IW_ENCODING_TOKEN_MAX (64) that could lead to memory corruption.
> >>> 
> >>> Please choose an imperative change suggestion.
> >> 
> >> Please stop reviewing staging patches, it is not helpful for anyone.
> > 
> > It seems that further contributors need to become more aware about
> > (and finally adhere to) requirements from the Linux development documentation.
> > 
> > Regards,
> > Markus
> 
> I'm guilty of my incorrect patch format. And do I need to write another
> patch to fix this format issue?

One of the hardest things in kernel development is learning what
reviews, and what reviewers, should be ignored.  This is one of them :)

No need to change the patch yet, let me get to this change this week and
I'll let you know.

thanks,

greg k-h
