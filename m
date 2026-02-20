Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03464237707;
	Fri, 20 Feb 2026 06:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771567672; cv=none; b=XEhuv+boPruBykRNw63V+bTXjXirkNHFaljizMpwEfn7mpZVlLw5LL25TYNw0YqawnE1fGFMqFTibnwQOulSYAstPV5sD99k/DlvNeyu/BiIz8iaNnFJyxswrzDTINEeV5Z9gXTjYCp1nQGeh/JVXfeBuJEL5Hjf9ap15zPGJVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771567672; c=relaxed/simple;
	bh=+4BS3OOort1sjJLflJFcuSgUG7p1C987J8JYwDnMn3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NwnB/h4Zs2MAVyxoNbpKujd/Lmz0QWyhl0z5KLRcvOXwcKMvmucQ/Rvi50oYtg0yUzJVnQOusS0nerwoJ1yf1C4IGjiwbXFdEPyOmXGIW3WaivmoUPUJo69HqSB2Jn6SEuNl9E1l5xmbT9nEps9Do0IGzPEj6DiynVLOZuYqwF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=tFS+XWQj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="tFS+XWQj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19557C116D0;
	Fri, 20 Feb 2026 06:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1771567671;
	bh=+4BS3OOort1sjJLflJFcuSgUG7p1C987J8JYwDnMn3Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tFS+XWQj1jXCyJ9qGfQpPOTaVcZeqrji4EGRmeY289SFiKj7cNCUZfrfSlWFFgMKB
	 jQS4y2OcEb61vTt1RWG5eWelmPbaEBe6qUqkb7fl3vlKZ/ogjG4cH3XpDpxY7r3/if
	 srCdEoNXKPaLCo2mIjyYU3FmEltwi85De7AbjgG4=
Date: Fri, 20 Feb 2026 07:07:48 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Hardik Phalet <hardik.phalet@pm.me>
Cc: linux-staging@lists.linux.dev, vaibhav.sr@gmail.com,
	mgreer@animalcreek.com, johan@kernel.org, elder@kernel.org,
	greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] staging: greybus: audio: fix NULL dereference in
 gb_audio_manager_get_module()
Message-ID: <2026022030-verdict-impotency-9d5f@gregkh>
References: <DGJJRT1BJV4H.1JGMNMC4SGKT7@pm.me>
 <DGJJTPL4YY7N.1JMN32YIUCHB8@pm.me>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DGJJTPL4YY7N.1JMN32YIUCHB8@pm.me>

On Fri, Feb 20, 2026 at 05:44:19AM +0000, Hardik Phalet wrote:
> Empty Message

Something went wrong, please resend these as a v2.

thanks,

greg k-h
