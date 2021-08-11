Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7BF2FAE
	for <linux-staging@lists.linux.dev>; Wed, 11 Aug 2021 07:01:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A785460E78;
	Wed, 11 Aug 2021 07:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1628665304;
	bh=RHCfi3wWX/wLf6Cna6iv/AWxWW7mgVgwUOhC31ctxb8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rSSPgqe1UrDefFl9i/RBm7GGRg0j6Oc5trLGdhn4vayNvwJ3R/ceboaIpW5+iFT/A
	 /z4mi//udfMoeFkDT1zCyjqHd1ZQGuQZgS7A9kDxqXgJQ6B6frEQghKB2643zava7B
	 UU8OOg16B2Ub/fmm+5ZLFMee6fpgzFUfBhutacAs=
Date: Wed, 11 Aug 2021 09:01:40 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Yizhuo Zhai <yzhai003@ucr.edu>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Juan Antonio Aldea-Armenteros <juant.aldea@gmail.com>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] media: atomisp: fix the uninitialized use and rename
 "retvalue"
Message-ID: <YRN11JOX/JHpq8Yn@kroah.com>
References: <20210723003607.64179-1-yzhai003@ucr.edu>
 <20210811035405.17382-1-yzhai003@ucr.edu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210811035405.17382-1-yzhai003@ucr.edu>

On Tue, Aug 10, 2021 at 08:54:03PM -0700, Yizhuo Zhai wrote:
> From: Yizhuo <yzhai003@ucr.edu>

This name is not matching the name you use in your signed-off-by line :(
