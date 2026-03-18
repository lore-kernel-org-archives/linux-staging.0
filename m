Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BC9B1D47B4;
	Wed, 18 Mar 2026 15:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773848061; cv=none; b=PpHaaAhd+BHgFCufn8uZ6pdRlHV5p7124xZ8OCQpoQrBxJQ9Irpfz0L5eGxltgY2RNcJhsHsJ8HSWbs27Ldp6uI/mUgrITji+9m95llbu4VJjYAYLZ9HSLuhoggOHpZ0/hLkVeUHEwFlJxoXZ/5IVnrM1yV1LB37ahObuwr9Ge0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773848061; c=relaxed/simple;
	bh=CKhvIBUDawVFZrz2JEM2tGhqIRGFQl/IjBZzs55ZXXk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZuedYs6UqHvnNEdjok124Gp2XZhLDCkKWCIAahX1w50g7pMxQPaC4BJnHo+m1Nby1FQHYizmAbFsBtTmxOPBN6AZcdBPzDaLEjilc0GBTAQqekvpRGJdxr7KlqaNx4NTrZ10zvfA4fiVGUY6T2P1ZUsg82aUiBdN5rbj3GQl1sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=GDmPvKAM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="GDmPvKAM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0A4AC19421;
	Wed, 18 Mar 2026 15:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773848061;
	bh=CKhvIBUDawVFZrz2JEM2tGhqIRGFQl/IjBZzs55ZXXk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GDmPvKAMIU2EEoYTtoGt/6wMCuFva6MYvEpW9f6yPVXaXWIlmTWVr+4n2kwbzzaNV
	 mlWTBuTWoOjCDROyZtwxiif6rNlbD3N21O+gPsAaaI6Yo6562NN9o92jwZz+AaW7Fw
	 6JjST44z4kjZzVbDSyyoxbO0RmQ0cQouB0oA8bgs=
Date: Wed, 18 Mar 2026 16:34:17 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Dipesh Chaudhary <me@dipeshchaudhary.in>
Cc: b9788213@gmail.com, dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: rtl8723bs: add missing blank line after
 declarations
Message-ID: <2026031859-conjuror-epic-238c@gregkh>
References: <8b574dd5-3cc3-4508-8455-a53a3d36072d@smtp-relay.sendinblue.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8b574dd5-3cc3-4508-8455-a53a3d36072d@smtp-relay.sendinblue.com>

On Tue, Mar 10, 2026 at 02:41:49AM +0000, Dipesh Chaudhary wrote:
> *Add a blank line after the pwrpriv declaration in rtw_set_ips_deny()
> to satisfy checkpatch warnings and improve code readability.
> 
> Signed-off-by: Dipesh Chaudhary
> Reviewed-by: Bera Yüzlü

You sent this in html format :(

