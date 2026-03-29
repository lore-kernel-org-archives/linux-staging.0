Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D5440DFDB;
	Sun, 29 Mar 2026 07:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774769563; cv=none; b=lHdRsLE96ncAbq/Wz3TOh5FgudTqwtbgv5WPY3xXfLHfJ0NeRKrGHQGzFYVES2QxHUyemAL5r6p5BoaxKc8FXiLAVf8Tqgj86wTtf0RCkcDOSQix0ENsFkg8zqtB8esI6QOw7ItPQenoZ/kWzYdNULG4La4xJKCTt3/SH43QXhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774769563; c=relaxed/simple;
	bh=/+2yFIP79H5TyrkXV3X/UDH9GFN7GV/cE4ydltEQK44=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hd1J7M3KdbIPIUcVAgx8E8Hyzks4jSCAjbu1JEBfj4062+PQBfPjft4nVSpRD1THGl7y2vGXvKk8pqpA5KsfHz4xVfaEyTPDw1F3w/Bm8l9lgY+B30d47uxiuwQpMOuNcLejzNP/2n2rNhb9/vVL3DXabPun2Y+gEDHjiYS7ixo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=wxMq3P0v; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="wxMq3P0v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EF2CC116C6;
	Sun, 29 Mar 2026 07:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774769563;
	bh=/+2yFIP79H5TyrkXV3X/UDH9GFN7GV/cE4ydltEQK44=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wxMq3P0vvUPctHZUBNWF61guC2FIBrIWZ5taxXSYcTDMcmCHbFBmvza720CHyK6qj
	 h2wzP4lB4xLs3AswsRm+H8gT3CmcKVEabOpNSqIO5hX60cipklmcDFanm7QEd21+/P
	 fxiJFt89uxGJtvtrt9LsnNNjhIA3dS6fIvZz1I8M=
Date: Sun, 29 Mar 2026 09:32:40 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Bera =?iso-8859-1?B?Wfx6bPw=?= <b9788213@gmail.com>
Cc: david@cardinalsystem.net, andriy.shevchenko@linux.intel.com,
	dan.carpenter@linaro.org, ethantidmore06@gmail.com,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	straube.linux@gmail.com
Subject: Re: [PATCH] staging: rtl8723bs: rename variables to snake_case
Message-ID: <2026032921-badge-payable-66f0@gregkh>
References: <20260327203636.24891-1-david@cardinalsystem.net>
 <20260329064334.13617-1-b9788213@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260329064334.13617-1-b9788213@gmail.com>

On Sun, Mar 29, 2026 at 09:43:34AM +0300, Bera Yüzlü wrote:
> on Fri, 27 Mar 2026 16:36:36 -0400, David Holland wrote:
> > From: David Holland <david@cardinalsystem.net>
> 
> You don't need that.

But it is fine to use, that is not an issue to complain about here :)

thanks,

greg k-h
