Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3CB63D9DDA;
	Thu, 26 Mar 2026 10:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774521442; cv=none; b=REUUC4ANEVop3laY0qEj/aFMH0nR/pTJ2E+bFRWBU6UCrbQCgCRFIuOPGlXfrI7UQqRvP74O7bC+KqhGHmQj/d/u/Q1olpXppAOa4QRRUM3JEovEQeJtkFVZO40ISJQWKJjmHc7q/4kYfw+bszTk0lNp6ESwjLTn511Sull7dk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774521442; c=relaxed/simple;
	bh=kVu4lFXq9JGXJBT8gtmgxNpj++iMgzhaemJy0ehQVN0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tkyqf5Q0hzYhj8LYhveFVCcmtCbFiSi/fZF1O3UynMGc40iZOUHEA8iUTR9XJo4yX3Nv1k9exCaRO1UAgnLbS1jOUXGgYiWKY5iF0lts31jQKOTluTUSw8SmnIX6pZwBT+bREwFn/I2VFlJEzUHuz2UtSGCbBMjarbCxCnkS4ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=jc47WPC0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="jc47WPC0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3ED79C116C6;
	Thu, 26 Mar 2026 10:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774521441;
	bh=kVu4lFXq9JGXJBT8gtmgxNpj++iMgzhaemJy0ehQVN0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jc47WPC0WIS1VR46nPEkZyd+P2ZL1BumhKbEbkPm2Rn2CDFLe2rJMYn+7Af2UTdNz
	 Hw8xklF3fjqz72NK0hgvFkGaGSY7mU91e7djFjgOBgqewgfDQCfGnKW9X19zhxdk+a
	 1cXSWEjlTsAOyxpiS84Dzz2DKEtLvfPAzo4TBKZk=
Date: Thu, 26 Mar 2026 11:36:57 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Omer El Idrissi <omer.e.idrissi@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Omer El Idrissi <omer.e.idriss@gmail.com>
Subject: Re: [PATCH v3 0/4] clean up error handling
Message-ID: <2026032638-spinach-spirited-48f6@gregkh>
References: <20260324220453.47406-1-omer.e.idrissi@gmail.com>
 <20260326081627.5841-1-omer.e.idrissi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260326081627.5841-1-omer.e.idrissi@gmail.com>

On Thu, Mar 26, 2026 at 09:16:22AM +0100, Omer El Idrissi wrote:
> This series lets sdio_init() propagate standard kernel error codes 
> instead of returning _SUCCESS/_FAIL.  There are two callers for this
> function.  rtw_resume_process_normal() already returns negative values 
> but the caller doesn't check for errors so changing this doesn't
> affect anything.  sdio_dvobj_init() returns NULL on
> error so leave that as-is.
> 
> Signed-off-by: Omer El Idrissi <omer.e.idriss@gmail.com>

You sent v3 twice, was that on purpose?

confused,

greg k-h
