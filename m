Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91D1EB3E
	for <linux-staging@lists.linux.dev>; Mon,  5 Dec 2022 12:22:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C645C433C1;
	Mon,  5 Dec 2022 12:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1670242948;
	bh=qRF5edHMbAecWo8CQr4Qqz1yhE/mivsv7gKQsDWYevE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dbkyuHMWyoweKu+FVXYm+8Q1GioiZ91EeGR7pCkjU1/Kd6aIXaT3ob4Z8fzx3aYDH
	 qycukLKE41MqFsX6bxdvqeddbXUez1R+SIZL7xYTgjyiftnpguICG/SzGas7ZATbMD
	 DQ6HZb603IYtigmrevb/jKhVNBHjJtZvtzjC6sVo=
Date: Mon, 5 Dec 2022 13:22:26 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Dongliang Mu <dzm91@hust.edu.cn>
Cc: Martyn Welch <martyn@welchs.me.uk>,
	Manohar Vanga <manohar.vanga@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>, Mingyi Kang <jerrykang026@gmail.com>,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 2/2] staging: vme_user: fix coding style
Message-ID: <Y43igvotWRmQzn+e@kroah.com>
References: <20221126125642.16358-1-dzm91@hust.edu.cn>
 <20221126125642.16358-2-dzm91@hust.edu.cn>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221126125642.16358-2-dzm91@hust.edu.cn>

On Sat, Nov 26, 2022 at 08:56:34PM +0800, Dongliang Mu wrote:
> Fix coding style enforced by Linux kernel

What coding style was changed?  Please always be specific.

thanks,

greg k-h
