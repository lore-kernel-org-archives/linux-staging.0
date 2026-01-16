Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 835312040B6;
	Fri, 16 Jan 2026 13:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768569198; cv=none; b=lj3K/mARI4JNMnpSXmK2zrLSuPu/IB/vfteRfhMV0L0MYYiV4wTHkjkbj/ssP5+psKQ+xcXimyejalqTMtycweu5udFzZt0crHKTIL/TY141zhK7lzUvgpMWTPOn/HFeXwYWRMMr/Syh7CVfKkftXRmtmCKQ8801GO9VCDokO/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768569198; c=relaxed/simple;
	bh=+riUz3TnbeUvHXlEdOu9+nnfe0NdYB7BKQUHV4Mg/Mg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Oa/o+SE/VQJeXQD1qchc7iz2bhOw5AYPIakxBPpQdlnfM67DY39LNbeWOtWTYdPP0OBG5v7K+Yy43AsNhYjBdu/xz4U4MtVpLLdHk9rx8+rRTDoMMOWxjV3j//32DJ8uKi5rwzgS+fymSdzr1fzPsflK88MwccfuGPdO61k5EG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=TnbQBl7+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="TnbQBl7+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8BD1C116C6;
	Fri, 16 Jan 2026 13:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768569198;
	bh=+riUz3TnbeUvHXlEdOu9+nnfe0NdYB7BKQUHV4Mg/Mg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TnbQBl7+LcLIHnNcrkjFKFRohJ1r0bTnZxqpqd94YXGD9YVffnPCMA+iAZWRyDQTE
	 ry1WY4z2I0FgMepQN9yIWucNZYFfEPUUQ8TIQLik40qdVoS7Q56kQH/M2iaExhHDSe
	 h+lqGDrB30YHZy5lr3gwCQtvv6YHlE5zhDxUpylk=
Date: Fri, 16 Jan 2026 14:13:15 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Khushal Chitturi <khushalchitturi@gmail.com>
Cc: dan.carpenter@linaro.org, straube.linux@gmail.com, hansg@kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/4] staging: rtl8723bs: rename CamelCase identifiers
 to snake_case
Message-ID: <2026011647-radial-everybody-b544@gregkh>
References: <20260116053052.4198-1-khushalchitturi@gmail.com>
 <20260116053052.4198-4-khushalchitturi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260116053052.4198-4-khushalchitturi@gmail.com>

On Fri, Jan 16, 2026 at 11:00:51AM +0530, Khushal Chitturi wrote:
> Rename several CamelCase identifiers across the driver
> to follow kernel naming conventions.
> 
> The following identifiers were renamed:
> 1) UserPriority to user_priority
> 2) NumTxOkInPeriod to tx_ok_in_period

Why did you drop the "num"?  That has a meaning, right?  Now this
variable looks like a boolean, not a count.

thanks,

greg k-h
