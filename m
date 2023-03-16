Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170EE23A6;
	Thu, 16 Mar 2023 08:49:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70EF1C433EF;
	Thu, 16 Mar 2023 08:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1678956553;
	bh=6wnFsnrhXRbuycrd5u/IQx7nZFVKBubAgA80mnUg5hE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RLESccR4tZsYZtYqsuDpzKQlijij+5F9/UItPvHU/pnVaXtXkVXEd0HAMZFdwjolX
	 hXXhFk/5Wk3vq0oTWSQXI3//AIwkvFDaa4cVbX95dKMSOA4YgtBjZlcwfLTni+6rD5
	 Ujhgg1ypjCDspeWTvGTmOTS+E2ItySS+RcoTrnUg=
Date: Thu, 16 Mar 2023 09:49:11 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
Cc: outreachy@lists.linux.dev, martyn@welchs.me.uk, manohar.vanga@gmail.com,
	zoo868e@gmail.com, jerrykang026@gmail.com, cuigaosheng1@huawei.com,
	arnd@arndb.de, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v4 1/2] staging: vme_user: add space around operators
Message-ID: <ZBLYB1+4GI1ge6Q8@kroah.com>
References: <57006c151d4d95550b987143a6650f8b3594ddea.1678899549.git.eng.mennamahmoud.mm@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <57006c151d4d95550b987143a6650f8b3594ddea.1678899549.git.eng.mennamahmoud.mm@gmail.com>

On Wed, Mar 15, 2023 at 07:00:06PM +0200, Menna Mahmoud wrote:
> Add a space before and after the operator, for readability.
> 
> Reported by checkpatch script:
> 
> " CHECK: spaces preferred around that '+', '<<' and '>>' ".
> 
> Signed-off-by: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>

This patch, and patch 2/2, do not apply to my staging-next branch at
all.  Are you sure you generated it properly?

Please rebase it and try it again.

thanks,

greg k-h
