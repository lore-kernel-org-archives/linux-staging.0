Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019CD70
	for <linux-staging@lists.linux.dev>; Sun, 11 Apr 2021 06:39:20 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2805A610A7;
	Sun, 11 Apr 2021 06:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1618123160;
	bh=fREd7ZSaGcu2cgmLq4XKGuzplJjGYYf3PmF74aQLbsA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XWCF1dRyxH3E3t3zDQWnsLl4Sf4kaEw1fIiV2Hz7LV3EnHNz69B6FM4+pf56PEmfa
	 Ehh0WaX6T8pPtdcNIbJd+gJsOqxqEHr1P9Hl1C2X0BsbVnoz8fHxJ6y7T9EZUv6hgf
	 oc5MHgT46iGJ7vhNh7g0XB4IKSLa6iVTUsc2QDlE=
Date: Sun, 11 Apr 2021 08:39:18 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: outreachy-kernel@googlegroups.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [Outreachy kernel] [PATCH v2 0/5] staging: rtl8723bs: Change
Message-ID: <YHKZlqFy15QC9Mzz@kroah.com>
References: <20210410150008.5460-1-fmdefrancesco@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210410150008.5460-1-fmdefrancesco@gmail.com>

On Sat, Apr 10, 2021 at 05:00:03PM +0200, Fabio M. De Francesco wrote:
> Remove camelcase, correct misspelled words in comments, remove an unused
> variable, change the type of a variable and its use, change comparisons
> with 'true' in controlling expressions.
> 
> Changes from v1: Fix a typo in subject of patch 1/5, add patch 5/5.

The subject line above is very odd :(

