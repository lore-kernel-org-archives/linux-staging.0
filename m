Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB743D60
	for <linux-staging@lists.linux.dev>; Thu, 20 Oct 2022 15:40:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7CBDC433D6;
	Thu, 20 Oct 2022 15:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1666280400;
	bh=paSkJ6XNB19cOMHvXXftJd+uNk9OWiSWuVvEd+PP5+Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YXOT0JD6AmvgknGkG57AqwkQ9Yf3r9g+Q4BLgQIwMxyAOPVfZZ1Iw7FunI3uTSLaG
	 wR6wuxmEQ7hiLCETS/Qk2kf898HmCIQz4817WwGvf4UuNudACR+/vW4qK1xqgWTeb/
	 GkQW2lXWpWAMSH/I5shkmvPAW46BtUP/nd/Uxc50=
Date: Thu, 20 Oct 2022 17:39:57 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Sekhar Nori <nsekhar@ti.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-arm-kernel@lists.infradead.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	"Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
	linux-kernel@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
	Arnd Bergmann <arnd@arndb.de>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 13/14] staging: media: remove davinci vpfe_capture driver
Message-ID: <Y1FrzZu6ixKU0o+t@kroah.com>
References: <20221019152947.3857217-1-arnd@kernel.org>
 <20221019152947.3857217-14-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221019152947.3857217-14-arnd@kernel.org>

On Wed, Oct 19, 2022 at 05:29:39PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> This driver was for the davinci dm644x and dm3xx platforms that are
> now removed from the kernel, so there are no more users.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

