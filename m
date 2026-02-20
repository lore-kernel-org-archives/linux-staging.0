Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E182237707;
	Fri, 20 Feb 2026 06:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771567651; cv=none; b=BiDPbIvrnabVj/7kcsCJzHbJ+BLhwNsFRwrHj7JFX0yZ7yTZ3BqRvRObEAvkDHSkFwXalc3WyeSj9bx7Dd+trdjMj1/1KKAC898zckm9mOSA1QITsgZUvGkcV9QM1ee/nK/vybG7BqZKCCjuoa54CLjsi9IXO8Iuyg69DPX99gY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771567651; c=relaxed/simple;
	bh=cr58DkwfKYP4XIvkv2lhwCS2Plyk2LIPeqRIYuuUtDU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P2KMQBx+1oxOGiZ/0XPJW6dqa4bEvmO30lIzOi/fJ1gWQSC+cYcKCV0CaQQDWyDF8bjzpSw94wkyZASEIFiYFcOgW+ZjdPjuseQA5S/Hasda5A1zGBrxEuTQArQGTlN5igl4iRja6MxNIA/5xv8aYEZMeLpis6KOHvBh3JSjSsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=oqC6WQMa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="oqC6WQMa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 032A0C116D0;
	Fri, 20 Feb 2026 06:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1771567650;
	bh=cr58DkwfKYP4XIvkv2lhwCS2Plyk2LIPeqRIYuuUtDU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oqC6WQMaQMKLh1xrAlWDWNpUY8dOVZLVXqg4KIDL1JSDQwUC5SPMENJYgYFZQXdJP
	 YUc+LRz1n/TIwQqYjYeJJxfJAPabeWFypPne51HhNzWt5DHuTLHo9Rz5NMKeexAiQk
	 vPNgpme4LrWZT2KnWsDgQI5RUrzqgI7wdvNy5W44=
Date: Fri, 20 Feb 2026 07:07:27 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Hardik Phalet <hardik.phalet@pm.me>
Cc: linux-staging@lists.linux.dev, vaibhav.sr@gmail.com,
	mgreer@animalcreek.com, johan@kernel.org, elder@kernel.org,
	greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/2] staging: greybus: audio: small fixes
Message-ID: <2026022021-immerse-survivor-0916@gregkh>
References: <DGJJRT1BJV4H.1JGMNMC4SGKT7@pm.me>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DGJJRT1BJV4H.1JGMNMC4SGKT7@pm.me>

On Fri, Feb 20, 2026 at 05:41:50AM +0000, Hardik Phalet wrote:
> This series contains two small fixes for the Greybus audio manager:
> 
> 1) Fix a NULL dereference in gb_audio_manager_get_module().
> 2) Drop a stale TODO in the module release callback.
> 
> Both are correctness / cleanup fixes with no functional change beyond
> preventing crashes.
> 
> Thanks,
> Hardik

> From b381767672023234e6d18482a7b68aeb78fdf2b9 Mon Sep 17 00:00:00 2001
> From: Hardik Phalet <hardik.phalet@pm.me>
> Date: Fri, 20 Feb 2026 11:00:41 +0530
> Subject: [PATCH v1 0/2] *** SUBJECT HERE ***
> 
> *** BLURB HERE ***


No blurb?
