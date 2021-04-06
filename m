Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247E45F
	for <linux-staging@lists.linux.dev>; Tue,  6 Apr 2021 05:17:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 04A7B613A3;
	Tue,  6 Apr 2021 05:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1617686245;
	bh=+znzAHRb+50H/RORNjCd4hc3uJ2CmZGOiy6dCAaomfs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s/yFExXqWE9W1zGxI3GwhSnrxA2GOkC1X0Bb9CqUZ+8WnioY1wf1vohouyft2Bqyh
	 466TCRsW4tXnXQRLw5LcmsBL/KRAJfo9javWyUkpS2KAVDH6GaLtT7jQzUp4NWJBgN
	 ewps1Wi/KOHhlgAqgk7OP3kagmOQAW0z8W6Hds5w=
Date: Tue, 6 Apr 2021 07:17:23 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: David Villasana =?iso-8859-1?Q?Jim=E9nez?= <davidvillasana14@gmail.com>
Cc: mchehab@kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re:
Message-ID: <YGvu4x6+argAcs4z@kroah.com>
References: <YGt9UNqRnOx2j+4M@fedora>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YGt9UNqRnOx2j+4M@fedora>

On Mon, Apr 05, 2021 at 04:12:48PM -0500, David Villasana Jiménez wrote:
> linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
> Bcc: 
> Subject: [PATCH] staging: media: atomisp: i2c: Fix alignment to match open
>  parenthesis
> Reply-To: 

Something went wrong with your email again :(
