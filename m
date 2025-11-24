Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1264528489B;
	Mon, 24 Nov 2025 16:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764002743; cv=none; b=SkBYbAZmdGAVv+ruZdgF7A1/h/LdoeoFyFhOxPGTWGaTqjhgSD0vqyZ2ngv3vg0ngidUg+u9FvvSsGNg3Nzg8nqd1MvnDG6lIr/x6kaEgHjyeWyLHSK7P+n4ppgEqRHVPgN6ccSQNEoUFPB3ASkgVdOlvPEbiJjBCSKdmecu9ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764002743; c=relaxed/simple;
	bh=x043GIkLw35Rjdnx5n+zs640oiA28pEhNqUcrLf66Eg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=liA21Y56jmycaScbvQNXUdAaVW9L1uIiXtzhfGGzEbhKsPziMxknjntXfgyjtXHL2UdLBU7sb8FnSfmPVHZzwNgPX6Kiw+/HF6YCPoQmfzkJx6Li0OKHSurKUkPeQH3wN20H5UyV+IRRezR/l0IqnfHdUhrk0BnE3T0qUuhcVLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=a3BHVoGD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="a3BHVoGD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64214C116C6;
	Mon, 24 Nov 2025 16:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1764002742;
	bh=x043GIkLw35Rjdnx5n+zs640oiA28pEhNqUcrLf66Eg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a3BHVoGDoTzb+phIzjTK7gstsf83EfWhY/qgbNUabWTDNVE9SqpC+Xh/c8fd7yYcP
	 Nt8+E3y7Uy4WgUihOEq8bXL73DoKeCBO9n9MdKHUKKHzzsNtEgBzeWIMug5gG/rORa
	 MeVWxnCCiUPcvfM9BYj4IlbL3sjMQMJhQ4Rh6vE0=
Date: Mon, 24 Nov 2025 17:45:40 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Bryant Boatright <bryant.boatright@proton.me>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: Re: [PATCH v2 1/3] staging: rtl8723bs: Rename camel case enumeration
Message-ID: <2025112434-outbid-tidbit-3192@gregkh>
References: <cover.1762803720.git.bryant.boatright@proton.me>
 <37abbb9fb3c082e587f1c22321f57287d0c7e660.1762803720.git.bryant.boatright@proton.me>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <37abbb9fb3c082e587f1c22321f57287d0c7e660.1762803720.git.bryant.boatright@proton.me>

On Mon, Nov 10, 2025 at 07:49:16PM +0000, Bryant Boatright wrote:
> Adhere to Linux kernel style.
> 
> Reported by checkpatch:
> 
> CHECK: Avoid CamelCase: <ParseRes>
> CHECK: Avoid CamelCase: <ParseFailed>
> CHECK: Avoid CamelCase: <ParseUnknown>
> CHECK: Avoid CamelCase: <ParseOK>

If you are changing the name, let's pick something that makes sense:

> -enum ParseRes { ParseOK = 0, ParseUnknown = 1, ParseFailed = -1 };
> +enum parse_res { PARSE_OK = 0, PARSE_UNKNOWN = 1, PARSE_FAILED = -1 };

These should be on multiple lines too, right?

Anway, "parse_res" doesn't make much sense, how about "parse_state"?
"parse_result"?  Something else?

naming is hard :)

thanks,

greg k-h
