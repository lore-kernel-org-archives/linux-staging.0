Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DCA4370D4F;
	Mon, 27 Apr 2026 03:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777261842; cv=none; b=Z7oe/jX4cdNWJ7VbFr7kvw58oPZoIJk4gY6a1s+RGA6cE2ezN2q9BbBukjNcFwVjGy2O0nzANAzAIUn9wMq+HapLk/Fe/yyf1Ra1664jlVJ3cNdRVZvrdUcQDYwXrCnKdlTHbHn5LgiP/uPGo9DYbsAzZlgb4cqAcNRqVGMDqLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777261842; c=relaxed/simple;
	bh=B0IFs5cZ2XtSKxOZ07ren8gz6btXM9tKZXA5/R9FPl4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DFvIj7xil6AqZRBgayVKRZ12xXHd0Bm+8ZWJAdXBOezGw5wEivrGpO+rFCE0UPpjBtjJKDmbwHQEmxBFLJUp1qo5SH/rW5u3JfO2usxmLiLqT8SN8Kwp5M++70vuN532c1WjlicYtdHa8px+VLjFHUXWgTHOAykQyzlkNaOkCVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=NZat1Kie; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="NZat1Kie"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA41BC19425;
	Mon, 27 Apr 2026 03:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777261841;
	bh=B0IFs5cZ2XtSKxOZ07ren8gz6btXM9tKZXA5/R9FPl4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NZat1Kie8p0FT5DVKOUY3R7A+ATfRmV7jA6K8KQL/22boRUnbFBXAGCPpZd5ni1/j
	 FrVNLfAgHlv9lCKhCQCreQNFZ1xbGTnCt2GAvn1e53lZwUyJAUWOGMJw12oBmk50ym
	 3PC113gwO+Z9AEaLA86QBSvOxbc5EUyGlCyYuiVk=
Date: Sun, 26 Apr 2026 21:18:05 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Kosugi Souta <k.souta0926@gmail.com>
Cc: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] staging: greybus: fix unsigned long long type
 warning
Message-ID: <2026042657-eldercare-staunch-20f0@gregkh>
References: <2026033032-rethink-jogging-f3b0@gregkh>
 <20260404005939.116701-1-k.souta0926@gmail.com>
 <20260404005939.116701-2-k.souta0926@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260404005939.116701-2-k.souta0926@gmail.com>

On Sat, Apr 04, 2026 at 09:59:37AM +0900, Kosugi Souta wrote:
> Fix the checkpatch.pl warning "Prefer 'unsigned long long' over
> 'unsigned long long int'". This cleans up the code style in
> authenticate.c.
> 
> Signed-off-by: Kosugi Souta <k.souta0926@gmail.com>
> ---
>  drivers/staging/greybus/Documentation/firmware/authenticate.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/greybus/Documentation/firmware/authenticate.c b/drivers/staging/greybus/Documentation/firmware/authenticate.c
> index 3d2c6f88a138a5..0ef88b7d24de02 100644
> --- a/drivers/staging/greybus/Documentation/firmware/authenticate.c
> +++ b/drivers/staging/greybus/Documentation/firmware/authenticate.c
> @@ -58,7 +58,7 @@ int main(int argc, char *argv[])
>  		goto close_fd;
>  	}
>  
> -	printf("UID received: 0x%llx\n", *(unsigned long long int *)(uid.uid));
> +	printf("UID received: 0x%llx\n", *(unsigned long long *)(uid.uid));
>  
>  	/* Get certificate */
>  	printf("Get IMS certificate\n");
> -- 
> 2.43.0
> 
> 

Does not apply to the tree anymore :(
