Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A59374A0E;
	Thu, 16 Jul 2026 04:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784177234; cv=none; b=PA8TCoxq1K7wJlxPi25aUXblQuS0YEvLIOFCjIctOR2DYbSUjWnV4LipZLcaLxLDXXkE9ehOLIRSIt1HZ97AmFK/xiMaCFwGx78ndG87WPuFi/1VaAwuphPWe1jzgcXQ4dWhDgUEwE5lgN30oeeRTpf54OnQXAl9l/PASrLJ30A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784177234; c=relaxed/simple;
	bh=MCZlnBL9vt/F6zIYrgK6U+8wOdYLifYZVw6p52JBGXM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HLvUceRJtvgISRwGJx09xJMY+AFuifepkF41TOekya0WWIphvbHy9eaY9bKLgmM4O3d0FM/0R20AKc+ExM4mhvcTf6RkPK2V8HY2l4oPzN7ldfzim7eL8ZyjEmtjG/kGsMdiqspr1yd8dmpwXGz+zXfDWXIATvVEqtv8dJ4LHXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=KKUjQLhC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="KKUjQLhC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A7301F000E9;
	Thu, 16 Jul 2026 04:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1784177232;
	bh=I6nPnB3iNL1Dd7rUc1hMfIrkW390VKINK9p6X5U4Or0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KKUjQLhCu5IXhhyNW8b6nRcnWZy4FIs4Siaxiu+5JxmZ+jrNgCElNMHi1te1WEPJ2
	 jg7SfWLTmbMzKOCQkhK8RHGx9wPrVo9ZxQuc+xJFPqSFXXRrDeavb3sSxf2DiTJSP4
	 H0+h+3TMUVu2UjSDFvExuAah4HMchfQVpXdWTGpM=
Date: Thu, 16 Jul 2026 06:47:06 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ivy Lopez <skunkolee@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: use kfree_sensitive() for key
 material
Message-ID: <2026071641-stardom-feline-0ada@gregkh>
References: <20260713233401.48262-1-skunkolee@gmail.com>
 <20260715235511.7357-1-skunkolee@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715235511.7357-1-skunkolee@gmail.com>

On Wed, Jul 15, 2026 at 05:55:11PM -0600, Ivy Lopez wrote:
> The set_stakey_parm struct contains a 16-byte encryption key.
> Use kfree_sensitive() instead of kfree() to ensure the key
> material is zeroed before the memory is freed, preventing
> potential information leaks.
> 
> Signed-off-by: Ivy Lopez <skunkolee@gmail.com>
> ---
> Changes in v2/v3:
> - Remove unrelated ftmac100 changes accidentally included in v1

Did you forgot to add the version to the subject line too?

Also, you have 72 columns for the changelog, please use it.

thanks,

greg k-h
