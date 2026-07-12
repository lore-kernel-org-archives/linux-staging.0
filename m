Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24CF36A000;
	Sun, 12 Jul 2026 05:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783834094; cv=none; b=YTuZbuPyp6WkU0n6xMljgXRub8rbI3XKpcw5Ql2tDQiMsQ0kL86Ukf8fem3nwtWSpC3wFhyEJPwOCGQOkVwU3zTs6Te2ddyVXqa8RSkVwU5eR8zzhXLhVmgZjrXJSjLN03zWC4YBwf9PpsrybXmyk5TvXg9oAjnzJAVqqxYc7Do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783834094; c=relaxed/simple;
	bh=ynKsVxYb1CfwogSXuGVGCFUYQ717rm/rBGArPb1/wOE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lx7zki+0aUG+vvjhxZKciQUjQWFiMNja4U9sfCsLBlLX9WkTu25lBlsEJzfB81Yk7wgeW2nVpgbP9JFf2RKoZXSluam4n6877NmgMNOx8ms3iGjmU4pJeYlOMO43dXkVd20FbmD7QNGiDk5o9rSlyzILZpBAR5lkrRIKNqG4Lp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=GoP+R/6j; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="GoP+R/6j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0216C1F000E9;
	Sun, 12 Jul 2026 05:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783834092;
	bh=wiQTopz++05rlu4BoBfBxYwS69YUGMl8bTK4tTUVVQM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GoP+R/6jZakGdAWlSTgVtdf5NbVd2GgUzgEjFRHFGEmCc28kCqftjB2EjMaZinPTg
	 JJEIz7T2Yn3DgGd1n8SI4ng0saUCiRKp0SShs0rTde/YZ4goxI/EqfMAgHGRm0P/6l
	 uAF7gClDMecdXV/CpC/sbe6Vo+rscy0c3DDP0rBU=
Date: Sun, 12 Jul 2026 07:27:57 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2] staging: rtl8723bs: Fix logical operator alignment in
 rtw_mlme.c
Message-ID: <2026071234-hash-everybody-fd33@gregkh>
References: <ajf8qOpXZ9fFFczS@koolguy>
 <20260711142345.2903-1-fliegbert2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260711142345.2903-1-fliegbert2@gmail.com>

On Sat, Jul 11, 2026 at 02:23:45PM +0000, Dalvin-Ehinoma Noah Aiguobas wrote:
> Move logical operators to the end of continuation lines and adjust
> indentation in rtw_mlme.c to comply with the Linux kernel coding style.
> 
> Change v2:
> - Rebased against current origin/staging-testing
> - Changed subject and patch description

Changes goes below the --- line, right?

Please fix up and send a v3.

thanks,

greg k-h
