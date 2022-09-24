Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48188F73
	for <linux-staging@lists.linux.dev>; Sat, 24 Sep 2022 11:00:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 463BCC433D6;
	Sat, 24 Sep 2022 11:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1664017255;
	bh=9uaMglO4d8AhlUSfEKHkSM8sH4uU4CqKL/M0IckF7ww=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TsR20HN0ZS9kQ7VbLdcvvas/ILHJOSyQZifsc6Ibaa2VXwiPHMv0kQbyHV1jPAthK
	 fy8ha/YlrXgiNoTsADilFpX1mTIX9DoDP6n0CxrgIcnS93P3td+kX2PpPIkMXJVFyw
	 bAmnWZnK9OzeSBElAIkXOZrn11zWAO+yxT4WpScQ=
Date: Sat, 24 Sep 2022 13:00:53 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Valentin Vidic <vvidic@valentin-vidic.from.hr>
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8192e: fix CamelCase struct member
Message-ID: <Yy7jZZArCCTC2/c1@kroah.com>
References: <20220919211948.136659-1-vvidic@valentin-vidic.from.hr>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220919211948.136659-1-vvidic@valentin-vidic.from.hr>

On Mon, Sep 19, 2022 at 11:19:48PM +0200, Valentin Vidic wrote:
> Fix checkpatch warnings for struct member pFirmware.
> 
> Signed-off-by: Valentin Vidic <vvidic@valentin-vidic.from.hr>
> ---
> v2: drop the 'p' prefix from the struct member and always
>     use priv->firmware for access.

Also does not apply to my tree.  Please rebase and resend.

thanks,

greg k-h
