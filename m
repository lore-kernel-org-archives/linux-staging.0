Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3C722541C;
	Wed, 18 Mar 2026 15:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773846756; cv=none; b=JASxAYJbytQmXhZuBEoYxg2yqA8EJl94M4yGyYW2fjn6F85csZIyIVMxYgUcP2aOLHwQbpplwb/liI5EOqmsKsnPRXNo2chjKybT0V77+XSsUTtpUaxlNUdBAc3CT8S6gMmlcgkxSpzC9U//8QRmMPzeOgPmDYtq6qe4KIGlkKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773846756; c=relaxed/simple;
	bh=pgODCVg0VxfBWN9KdfziE883EMSLrI6dPQHaNdX+7cg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g0WRHXkTj3FQKluurkipbW3lOVB46fHmSWFqgqQScvV7bqsyUCdfU4m+ujBLsgO9Jd55kCeB3X1Vk62mju2WFBj/RcQ/IAxUBlBp73ugkgekDoud1C/oesiuhLzjp0tiKHGxcYsRG6tRNBzwsrKiQnaD+9dFCqdJmgo1z52FF6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=mOcjiIaQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="mOcjiIaQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B31D5C19421;
	Wed, 18 Mar 2026 15:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773846756;
	bh=pgODCVg0VxfBWN9KdfziE883EMSLrI6dPQHaNdX+7cg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mOcjiIaQ/nkJyS7h/mxGhdY/fSRiLWGpR78tfUn+DpmZz8lL6q+U1jG4WsSIDKcZG
	 xn2bhkjsnNS5rxwMe3VAlOkhK1RBjk195fc1iuSY96CZeyxBZ7un6EEywfLWkIo0K2
	 20z9OpUksOuD14t288152sfBdUI/gHBDy2Yqzqp8=
Date: Wed, 18 Mar 2026 16:12:32 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: =?iso-8859-1?Q?H=FCseyin?= Can Erdem <erdemhuseyincan09@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: rtl8723bs: fix code style issues in
 rtl8723b_hal.h
Message-ID: <2026031807-june-stress-0ba7@gregkh>
References: <20260318150146.8226-1-erdemhuseyincan09@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260318150146.8226-1-erdemhuseyincan09@gmail.com>

On Wed, Mar 18, 2026 at 06:01:46PM +0300, Hüseyin Can Erdem wrote:
> Replace __attribute__((__packed__)) with the preferred __packed macro.
> Add parentheses around macro arguments to avoid potential operator
> precedence issues.
> 
> Signed-off-by: Hüseyin Can Erdem <erdemhuseyincan09@gmail.com>

Please do not ignore what my bot told you was wrong with a previous
patch version :(

thanks,

greg k-h
