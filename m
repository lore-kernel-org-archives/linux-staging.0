Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 164EC291C09
	for <linux-staging@lists.linux.dev>; Wed, 16 Jul 2025 12:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752667246; cv=none; b=Dd8aH7JN11y3ZYfk4FCopCe2U2opt92KVNBX2pyXDmglttZjtbwNQYy7RASMbLARuQI//68S6keRbp/S8/4TDUxaLI2ggSMvp4aZTCuFBW3kcyRmdtKw1Pe85NUDx53OoHWUvTJzLdk8infoa5c1z43jVAGa124Acv7jTYdDZAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752667246; c=relaxed/simple;
	bh=TsSflETNzzWLoljIC245T0He5bhbU+C/T/Kp//p2nzw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hmeHXFgXvy/7NyWwZ14e9q9yi0fh+lxqiDibejyUpF1aU6weGpdaan+d/lXUhtR6GijOlhGCHc/+mEJLpNyKCfAqwvJLjZLvopH0CmpC9k/TXV4GB+8dBKcBQ3XyMNXYAq2x1RVMxwJMGkObQNkbait4OlbgDi9pT3Z/2b405UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Cu7phCGN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Cu7phCGN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FD70C4CEF0;
	Wed, 16 Jul 2025 12:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1752667245;
	bh=TsSflETNzzWLoljIC245T0He5bhbU+C/T/Kp//p2nzw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cu7phCGNanmUhvKvQf75yZi4KEY0NLmC+Jih0cD2WutCSLf6cFHay1ZqMA4HCvdX9
	 wpn1OTYdP1qWWbKaNrhe9cBUY5ViXofgaVTTCPGWjQYPVZ3Ppdnz6Qwx51R0AvEuiW
	 ow+em9sOcpl77zqsDNabUz3rwmRNM8H11tyDORZE=
Date: Wed, 16 Jul 2025 14:00:43 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ignacio =?iso-8859-1?Q?Pe=F1a?= <ignacio.pena87@gmail.com>
Cc: linux-staging@lists.linux.dev, dan.carpenter@linaro.org
Subject: Re: [PATCH v4 2/2] staging: sm750fb: fix CamelCase variable naming
Message-ID: <2025071632-oxidizing-collie-00da@gregkh>
References: <20250716113755.73068-1-ignacio.pena87@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250716113755.73068-1-ignacio.pena87@gmail.com>

On Wed, Jul 16, 2025 at 07:37:55AM -0400, Ignacio Peña wrote:
> From: Ignacio Pena <ignacio.pena87@gmail.com>
> 
> Replace CamelCase variable 'Bpp' with lowercase 'bpp' to fix
> checkpatch warnings about improper variable naming convention.
> 
> Signed-off-by: Ignacio Pena <ignacio.pena87@gmail.com>
> ---
> 
> Changes in v4:
> - Fixed patch corruption issue by removing duplicate variable declaration
> 
> Changes in v3:
> - Removed the const declaration patch as g_fbmode is modified at runtime
> - Split only into alignment and naming fixes
> 
>  drivers/staging/sm750fb/sm750.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)

Where is patch 1/2?

confused,

greg k-h
