Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C53610A34;
	Thu,  7 Mar 2024 07:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709796132; cv=none; b=k6a7RJ5+3M9VNpYVSp+o+EAZcuger9fgZZdaEzr/g4kYOcbS43hOO0Fxl8S9kJvzpLlDMfH1sSWHUuKW9LJ7XC1tu8CkagI/HvSUXAFPydz7NCwCHlgwmYJzCPEegMvv1e3HsvFDWU/0OG4rj/iyuXNOCoH3MrpdbWJGWBWcKHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709796132; c=relaxed/simple;
	bh=xwynXxL/cL0P2cuactwMwfR3aeyQlfkQgAut2HcZkmY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l727ZIWPp2qZEQ/sZQ0EYK/Qn+/SIFeJAhkF1uXSqArwhRPzNLNFYqlM0hsXessjLRdzhdXSf63rx1b8heocr9u53EwUsqtSgstnuRKgbY6tW4A5M+XZzAZxsPEyOYl7wQ3VK6lvhniWPYhUdfRYWBCXfLidBRVSVZcp0XnHgeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=MOcXRLfu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="MOcXRLfu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C8FDC433F1;
	Thu,  7 Mar 2024 07:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1709796131;
	bh=xwynXxL/cL0P2cuactwMwfR3aeyQlfkQgAut2HcZkmY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MOcXRLfu/hTPlzYOhck7LR7tcCVy7l8yOCn1Sxbe29aelqw9bL+FmbioaWn4DQvL7
	 GU5w3gDI6sHXcXkjv+WqnBD5tBYAqrMVHpmcfWjUJeY8hq7CveTPsGPZ54s2JALwnp
	 Bnae8QtlDGyia0Vzp3H5GAqAbDMje6FAVu917R8k=
Date: Thu, 7 Mar 2024 07:22:09 +0000
From: Greg KH <gregkh@linuxfoundation.org>
To: Dorine Tipo <dorine.a.tipo@gmail.com>
Cc: linux-staging@lists.linux.dev, outreachy@lists.linux.dev
Subject: Re: [PATCH] Staging:sm750fb: Rename variable sii164GetChipString
Message-ID: <2024030750-sneak-unpack-c7e1@gregkh>
References: <20240305223248.38321-1-dorine.a.tipo@gmail.com>
 <2024030721-mammogram-exquisite-69e9@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024030721-mammogram-exquisite-69e9@gregkh>

On Thu, Mar 07, 2024 at 07:21:33AM +0000, Greg KH wrote:
> On Tue, Mar 05, 2024 at 10:32:48PM +0000, Dorine Tipo wrote:
> > Rename variable sii164GetChipString to sii164Get_chip_string to fix
> > checkpatch warning Avoid CamelCase
> 
> That's not what this patch does :(
> 

Also, did you test-build it?  Your change looks to break the build,
sorry.

greg k-h
