Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8417B;
	Wed, 29 Mar 2023 11:42:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2946C433EF;
	Wed, 29 Mar 2023 11:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1680090177;
	bh=AYjLBzvCIli3/g87osWOfF8BceYv0fMCoWlwocskBR0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jy0p380j07xybOmELNTLvm2yJ7BUqFgyY3H82JSuXNR0dP5GF/dXeC90AXR3SLIxt
	 tVUe48iTddMowdhAMq4mh4E1QWLJ9ltSxJDNb82Jsrjf6vL2rDWthTu+nqgtyGu0Es
	 FhD9OZJZ0gJVrJTLpQkM5ExYtN/q4lxdb1tZz/T4=
Date: Wed, 29 Mar 2023 13:42:54 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Kloudifold <cloudifold.3125@gmail.com>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	linux-fbdev@vger.kernel.org, devel@driverdev.osuosl.org,
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev,
	linux-staging@lists.linux.dev, alison.schofield@intel.com
Subject: Re: [PATCH v6] staging: sm750: Rename sm750_hw_cursor_* functions to
 snake_case
Message-ID: <ZCQkPr6t8IOvF6bk@kroah.com>
References: <ZCQeyWW3+d7+qT+b@CloudiRingWorld>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZCQeyWW3+d7+qT+b@CloudiRingWorld>

On Wed, Mar 29, 2023 at 07:27:04PM +0800, Kloudifold wrote:
> sm750 driver has sm750_hw_cursor_* functions, which are named in
> camelcase. Rename them to snake case to follow the function naming
> convention.
> 
> - sm750_hw_cursor_setSize  => sm750_hw_cursor_set_size
> - sm750_hw_cursor_setPos   => sm750_hw_cursor_set_pos
> - sm750_hw_cursor_setColor => sm750_hw_cursor_set_color
> - sm750_hw_cursor_setData  => sm750_hw_cursor_set_data
> - sm750_hw_cursor_setData2 => sm750_hw_cursor_set_data2
> 
> Reported-by: kernel test robot <lkp@intel.com>

The test robot did not report that the names were incorrect :(

> Link: https://lore.kernel.org/oe-kbuild-all/202303110849.X24WnHnM-lkp@intel.com/
> Signed-off-by: Kloudifold <cloudifold.3125@gmail.com>

Is that the name you use to sign documents?

thanks,

greg k-h
