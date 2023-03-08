Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF79479DA
	for <linux-staging@lists.linux.dev>; Wed,  8 Mar 2023 16:07:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CA98C433D2;
	Wed,  8 Mar 2023 16:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1678291634;
	bh=TkylqFak7vZZsSeE/sFaN6QWkOyeNoj88OqtgJhVEnU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UnVe4f1U0ySARhRvz0POBdWwCF9g073DYKdRJWFUUAX/dy2tZFhEAm/N0KCaS/E4A
	 JawrAG7PJSHqX3dtQDCtY9y9UPhGbX6g4xmc3geCVG3tXoXtEbDrh1LjQ+2hl2/U7z
	 gCOdfA6rydggeccce/+8Y5UBVhTgqAqkdGq8PdZI=
Date: Wed, 8 Mar 2023 17:06:54 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8192e: Remove function
 ..dm_check_ac_dc_power calling a script
Message-ID: <ZAiynpIQKYs246z5@kroah.com>
References: <20230228202857.GA16442@matrix-ESPRIMO-P710>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230228202857.GA16442@matrix-ESPRIMO-P710>

On Tue, Feb 28, 2023 at 09:28:57PM +0100, Philipp Hortmann wrote:
> Remove function _rtl92e_dm_check_ac_dc_power calling a script
> /etc/acpi/wireless-rtl-ac-dc-power.sh that is not available. This script
> is not part of the kernel and it is not available on the www. The result
> is that this function is just dead code.
> 
> Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
> ---
> I found a hint in this blog about the content of the script:
> https://www.kubuntuforums.net/forum/archives/eol-releases/-9-10/network-
> support-ai/41269-realtek-lan-connection-timeout
> 
> If you know more about the purpose and the need for this script please
> respond.

Good catch, that shouldn't be there at all.

greg k-h
