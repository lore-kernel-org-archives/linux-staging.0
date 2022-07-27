Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA274A3D
	for <linux-staging@lists.linux.dev>; Wed, 27 Jul 2022 06:47:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 017A0C433C1;
	Wed, 27 Jul 2022 06:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1658904466;
	bh=JfWQUy6Pmm4vrfUtuYPgkbRGh2vrMnsBsWln3MJW0M8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j2+W2kGCqKIoeTAj+fkWzxsKkdDzmbvxBT5nFiYpbvFsObGm1L4M+FNEbEFsnHAjU
	 +JmwSy5fiSwO1yEIAdMq00XxN7QCSpsc28RDHv7CiNpJpxPxoHZhoBlEzS7yZx2slp
	 WuUgLrmGGJ2rXhVaz+IZk5m0gssxFP5yJTMGfncM=
Date: Wed, 27 Jul 2022 08:47:43 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: Forest Bond <forest@alittletooquiet.net>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] staging: vt6655: Rename byOrgValue to reg_value in a
 macro
Message-ID: <YuDfjwHJN6n/CZ4i@kroah.com>
References: <cover.1658333350.git.philipp.g.hortmann@gmail.com>
 <83920d919acd7596488943182f37132e479d70f4.1658333350.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <83920d919acd7596488943182f37132e479d70f4.1658333350.git.philipp.g.hortmann@gmail.com>

On Wed, Jul 20, 2022 at 06:24:32PM +0200, Philipp Hortmann wrote:
> Fix name of a variable in a macro that uses CamelCase which is not
> accepted by checkpatch.pl

Why rename something you are about to delete in a later patch?

thanks,

greg k-h
