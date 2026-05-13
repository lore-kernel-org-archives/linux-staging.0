Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207ED3E9C1B;
	Wed, 13 May 2026 10:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778668513; cv=none; b=hOvh3hCHYKsZarkR3FTehXNr0vmLdUc3jA2aKA+FQ/CjPm76cW5j5yl7s6iW8E5M+wicwd/mtYW03OIi0o9OTLbu2A2mhdtGE+buLOEoUKWWr0n/+vMxOR38cGreUycNjAY6JBC5aUgnGSkvujxifywR2maWfa14KCuT5a3Ama0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778668513; c=relaxed/simple;
	bh=CNVqvxuflpv01TqYicHY//GunBd6rKLoprGNHOlMSiA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TLVA38O3knLqgRq6CSREH5xEKaqhGqWfK/KijyiAhneqx3TtLauiPe9topIbB65RqWZ7aWZkXVojxQzQ3DVEBbG0ewiP9e+ECKHbXV9ae19ZMHEPeupR0tk1qw9Sz+vlUlGp3SdYr3y4/cwxL7ZWXv5F5VarYZaUJ6V6MR9gJEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=W0fZthl5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="W0fZthl5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9F38C2BCC7;
	Wed, 13 May 2026 10:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778668513;
	bh=CNVqvxuflpv01TqYicHY//GunBd6rKLoprGNHOlMSiA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W0fZthl5BHG6JPE61P7kCebwVYRG9RnnvgWTVVRImcfkF/qFBL37GzK9RHiSqq2Hz
	 kpxmoC1N9GoGwnwsA7sgzwL+tbJEMbeIa3pRzdA0ZkbbvAwAJffvv5w67DlPJfZRMz
	 zur+KNt4L9THJBLWNb/IxaabzMD2ecRXoDg8P254=
Date: Wed, 13 May 2026 10:59:38 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: IgorpetinDev <igorpetindev@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com,
	andy@kernel.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: atomisp: fix trailing statements in
 input_system.c
Message-ID: <2026051315-oboe-sandbag-9bac@gregkh>
References: <20260513084146.57706-1-igorpetindev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513084146.57706-1-igorpetindev@gmail.com>

On Wed, May 13, 2026 at 11:41:46AM +0300, IgorpetinDev wrote:
> Change-Id: Id89273d4ac76e8155aa6b1600d1f223407e0412f
> Signed-off-by: IgorpetinDev <igorpetindev@gmail.com>

Please always run scripts/checkpatch.pl on your patch before sending it
out :(
