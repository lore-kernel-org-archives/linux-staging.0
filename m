Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874C418C93E;
	Thu, 29 Aug 2024 09:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724925093; cv=none; b=sJuxaphIsDbwHMsbHBl+0kEp1zfMB4JIJOh4rrY8rnNK+1y0Ht2TX3fRq8dtIWM5XH4J2RtQtgqz/CLQjAkh3I49y9agytH1gxh8w7eXr/vb+PooymV6avh550nlpo4eUzjK5UXNWE15dRvnuKZ2TkoFRB+rEREgvnoMciUZVkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724925093; c=relaxed/simple;
	bh=cu/KdYEEKeZ6u3YFovuXScqXy+8yNKssxgLaNPeUheo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ly5IMc79/mZymmoMxE2nUFygNumMrM1Eco2Br9Zsi2/1wsrHgWzIayHxMycRRKN1kLVIWscMF02/z1RmxDwstxz72+GQNneEEO+fsFI315nxrV3IhSVdX/o6iUrEaTOFzJ+AdlKh9hPglzJym2hhEtCa5aMwMVAvWWs4s+LC0xY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=M3patPC6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="M3patPC6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8E38C4CEC1;
	Thu, 29 Aug 2024 09:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1724925093;
	bh=cu/KdYEEKeZ6u3YFovuXScqXy+8yNKssxgLaNPeUheo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M3patPC6CqA/lBiAldgAN3i3iFA+SVdNBZKXfAvdtsI+wID/pUvpVN9rX8vK0hoib
	 zhZzFG6KzOwJOVani5sakNV0xMMsRQqlCaDaCMpkerSeYnrHCBy32XitW8tzpGJaWu
	 NNt9G26WnfXE05wHXrkfUfkgWyDOOwlMbEajiaLc=
Date: Thu, 29 Aug 2024 11:51:29 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Alien Wesley <alienwesley51@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	~lkcamp/patches@lists.sr.ht
Subject: Re: [PATCH v4] staging: rtl8192e: Fix multiple assignments in
 rtl_wx.c:529
Message-ID: <2024082954-reenter-monitor-46a5@gregkh>
References: <20240827001107.10641-1-alienwesley51@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240827001107.10641-1-alienwesley51@gmail.com>

On Mon, Aug 26, 2024 at 09:11:07PM -0300, Alien Wesley wrote:
> Separated assignments for pairwise_key_type and group_key_type
> in order to silence the following checkpatch warning.
> 
> CHECK: multiple assignments should be avoided.

There's no need for the line number in the subject line, that might not
be correct when it gets applied due to other changes from other people.

Can you resend a v5 with that fixed up?

thanks,

greg k-h
