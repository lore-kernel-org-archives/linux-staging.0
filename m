Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B30A17D0
	for <linux-staging@lists.linux.dev>; Sat, 24 Sep 2022 11:00:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B31C4C433C1;
	Sat, 24 Sep 2022 11:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1664017240;
	bh=0cgQjrAHRa4yNdePpc3uDLv+zyZLOOX2AQU5LSWA6Gk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bupviSbQ1r+IZBfJGpRRfzuWRy0Q1QWbJdAei6hRL/4UJc8eLzLvsiDm9E5mnYGDu
	 +TYOvqlNb26xnRXAkmVxTghPLLuvoAgAVWUx+vKZtDV/f14CzInJjaWuSDp6aVzg6z
	 kKCT/wzGSxdYwkkpaCkmeY4SJoA/HvcwEwKQ1ess=
Date: Sat, 24 Sep 2022 13:00:37 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Valentin Vidic <vvidic@valentin-vidic.from.hr>
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8192e: fix CamelCase variables
Message-ID: <Yy7jVe8BrobRZNfl@kroah.com>
References: <20220918113041.3805576-1-vvidic@valentin-vidic.from.hr>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220918113041.3805576-1-vvidic@valentin-vidic.from.hr>

On Sun, Sep 18, 2022 at 01:30:41PM +0200, Valentin Vidic wrote:
> Fix checkpatch warnings for variables: LinkCtrlReg, DeviceID,
> RevisionID, IrqLine.
> 
> Signed-off-by: Valentin Vidic <vvidic@valentin-vidic.from.hr>
> ---
>  drivers/staging/rtl8192e/rtl8192e/rtl_pci.c | 26 ++++++++++-----------
>  1 file changed, 13 insertions(+), 13 deletions(-)

Does not apply to my tree :(
