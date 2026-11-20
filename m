Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795158973;
	b=rMQGnq2p/pjWg8EicB8YBDrll6012b0bW0GNs0uLJT9rHhwDTLAXz/Ej2mNY682/GtLz
	 f9DnUGNBefa1ZnHgwpO9jvPqI49TrhcztkPudFVbFNYuKqZ6vkuENxwV1d5riO/bVsSgK
	 DdsQQGc+QuR/yH1iJuKh6kn0aHM3DbPhXlUhoA17hj5Qn61PA0aZZiSmSnFpYpL0MMomE
	 QmpW/pQEuc3/grF5MEhl+fCJqCobYEvOf10Ey2fjpnC8gNrVOidB+UKmBrNpPOAsbkOFM
	 s+yBPSFcQKJOFFhWhL021WhJt5coxLjBxMlCTuXyPDSqTOsx2qPAZ22H6sT3vceHFyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795158973;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=vxOCPEngVpxvJlveOPrjxk8+d5eB/40unhQqInUdTcA=;
	b=LoxtDdncvR+4DxjoQfisMBuOtJeRWoU3NftMt3bsDvFYNBEyELev8gCGH1VhDobBCEQg
	 HjHjaAWQzgyvupReMwH/tpUR8Em5tb9LBqJuTjgFkUfbiq3uw3mecxfvcNIXDNcpT7NzN
	 adX7fLzXZc+qUjxnVYYGFvDEKTWG3iIikJik4t++b9SYqO8J5RkiEygPucTRXq6a5zxSv
	 ENaGzgV4Gg2ovZ70CnD2Fkd2alO/XOfhHllFOWkWHX5IDDWBId3/GyDBnDDCjw0eW8bIR
	 uHEEGtDqWuD5chltliaidDlOJjWhfMUPB645mNwzbEFg2KUG3cVJUGACBO4egzrLkHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=Ex3kGLfP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F9D606A320;
	Fri, 20 Nov 2026 07:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=Ex3kGLfP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEF781F000C6;
	Fri, 20 Nov 2026 07:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795158973;
	bh=vxOCPEngVpxvJlveOPrjxk8+d5eB/40unhQqInUdTcA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ex3kGLfPxiJwRPCo6A62UWsxv7XB8mhZjde8vUOD+3uPEaMgbI/K9GViWKzRo9KED
	 GySP4gJnYkt761BQrE110I5O8/zmXyuJJD/aN84CYRoE0FqcwwJ/dOuGrbhKyvo3ps
	 F+NDZ5T9qgyTC+BIOTY/HQ77P4Vf6+l2tO1ou9Ek=
Date: Fri, 20 Nov 2026 08:16:10 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Albu Victor-Marian <albu.victor.m@gmail.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, christian.gromm@microchip.com,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	parthiban.veerasooran@microchip.com
Subject: Re: [PATCH v2] staging: most: dim2: add missing Return: documentation
Message-ID: <2026112048-dimmer-ravine-ae33@gregkh>
References: <20261104205108.1041666-1-albu.victor.m@gmail.com>
 <20261105202110.1081296-1-albu.victor.m@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105202110.1081296-1-albu.victor.m@gmail.com>

On Thu, Nov 05, 2026 at 10:21:10PM +0200, Albu Victor-Marian wrote:
> Add missing Return: descriptions to functions in dim2.c.
> 

No, the descriptions are there, you just moved them around a bit.  And
why?  What needs this?

thanks,

greg k-h
