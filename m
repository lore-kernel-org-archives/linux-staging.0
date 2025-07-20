Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A960F2F41;
	Sun, 20 Jul 2025 08:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753000627; cv=none; b=IbV1Yltm52SOQTZEsxwNB9h1T0l8aBGjiAQf967dB97DfJBO276bWvr/bFgrpUeqLH+bbZq77DONO2V4d+NvEYv7j8m3oLig8Kz/wwTzZEvG8q3VQIlS6dMmhZIHTajuVrFU7HLJiA8IjGDz9n4UMKrXNkuTaFeHzSVOtlT/fOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753000627; c=relaxed/simple;
	bh=IVrguVNrNpH4kNA/pbkgHYsi+Ky2hh27D9j282RUxUM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PH8IaF3yrFdfIkWYJyU2v0NR5FrqI+aVwYyn8QpG9dub0HNwfqqHYOi0sltU6hTxwXKxJteebxuWAytwZhKTfq06hcnrCJFPTEyeRtiOjTtWwWLYkaOXPo3s6JiWp5mNxRtdwtn7F0lfqzii1IOLr5nH5rnXqHRIkbbo6dv7+P8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=WqN8T1yT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="WqN8T1yT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C40AEC4CEE7;
	Sun, 20 Jul 2025 08:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1753000626;
	bh=IVrguVNrNpH4kNA/pbkgHYsi+Ky2hh27D9j282RUxUM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WqN8T1yTz6zptWxkvnBUN+9RXgb9GqREAGDW3baAtt2jBu+FhhjWrkFjGfl5Pqmz1
	 u24rQfr7Qd1i27vDZbBXNacqI1IH12MfIPIsfLguO6pHmhqh93u3c1xOEeq2IizXOK
	 ThLBUrbDpFZU6m6zKNS84Tr5zHVS0IGbwySOvNsI=
Date: Sun, 20 Jul 2025 10:37:03 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: remove unnecessary parentheses
 around address-of operators
Message-ID: <2025072033-untying-immortal-b355@gregkh>
References: <20250720083332.246512-1-vivek.balachandhar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250720083332.246512-1-vivek.balachandhar@gmail.com>

On Sun, Jul 20, 2025 at 08:33:32AM +0000, Vivek BalachandharTN wrote:
> Cleaned up redundant parentheses around the '&' (address-of) operator in various expressions
> to improve code readability and comply with kernel coding style guidelines.

Please run checkpatch on your changes.  I think you need to wrap your
changelog text at 72 columns...

And isn't this v2?

thanks,

greg k-h
