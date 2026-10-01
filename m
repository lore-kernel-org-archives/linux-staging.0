Received: from mail-ej2-f41.google.com (mail-ej2-f41.google.com [74.125.228.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3CAC3A872B
	for <linux-staging@lists.linux.dev>; Thu,  1 Oct 2026 13:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790860081; cv=none; b=AOHovN7HgDMDJ1OeyMFowbWAgITfy472ywKD3unjnuK2vvNPl7Ofcu8C+DcCEpelG8SpwDWQ+d6cOCmsuGaHXVOGE9naNVPiSyv9eC+y6qOkkusPqe0wXzycYkYhwP6VVUpUEq/GE0UUi95h8QH4ivKLsPWsQxKTy+j2fEjNu9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790860081; c=relaxed/simple;
	bh=oisPNWwi0y+XLUx/I8PdbNLKALbOvIz3N/myw7Fs0xU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S3F3gzZqpkeDaYWI1bvRF0trVWZ3Gk5cx0F3lsoDHlKWKt/zVP/eN1V4rjtguedTLGryEs/sWnHsYTiaFGYm7dzdFW2ix/IHFGzFvWXOzwblsJP8QIK9VgqjW/ByFAMCvfvrASRz5nHZ/V3UllnWSkh2dxhDqKU8jo2INbzn9tE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mhs2n5rB; arc=none smtp.client-ip=74.125.228.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mhs2n5rB"
Received: by mail-ej2-f41.google.com with SMTP id a640c23a62f3a-c2e0b486d91so327712966b.2
        for <linux-staging@lists.linux.dev>; Thu, 01 Oct 2026 06:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790860078; x=1791464878; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ECwzGbNnNrgef66dzn9kOOKdrN08mp1GM1Y4L86hu+E=;
        b=mhs2n5rBkn8dlYScI7YsafoH8dmSaai2wMXkmpmgery+Qj6yFD0dGTJoQMEFGnhCgV
         IElOiy/NS9+fsZPPldFkSsQ6VRs1rKU5ZEPrkgfIN8JwX+xgWws9fj1D86wj54eInAOY
         FQ6QxX5EG9ztM9aQxOTIzbezdJUl5WVPxwD4GhcKtpBka+kAnVV5RppFDosBP5/bc3uJ
         2uHK1EDx4tQbKYb1TGrSJansyx4LoxGh2jSXTME/cO628tmmJLvYfBiMkyH2ng5pGj+q
         HjPXS4qKY9abjzx0ODRtTHjFTwNTZt/zOMSjpcxOBXVfQ5sQwnS2dYxVzvVzB3OH7tuD
         P5Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790860078; x=1791464878;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ECwzGbNnNrgef66dzn9kOOKdrN08mp1GM1Y4L86hu+E=;
        b=Jne/EcsPvllvk+3fvPdmWQZXYUNuwIVRZUWE/7tF3KPwcO4Mqvt4w3DJBQG6onq3N6
         1h3xnjjeiwRi6GwKv69cVHHUMLBMXzYT1W/RRfsXxv8f7XQRz52MvsLROGpMXTBuJ7eY
         yinOLBo6yxeuUjuFkSlEa5dAXLw3iQ31A6hIoXu1LBP6MFbIg9wyA4TTqlUgfu1XrN+0
         SquAH/yIMWQthB4fHJVdYfSuZFH/jKRkxZ9CTMt7hecBcCdA26corMiJGJynFWiyhy0m
         fdQZIGzcB3Q5s/zjb90KSeL8NXUKFiREGqEXYAJ6WTRRezeOfKk+kSWJjYHdOggA6HVF
         MkXQ==
X-Forwarded-Encrypted: i=1; AKwUvBzRggXTUoAVLcEpShNzrgD4v66E2KDlFkn2Z+BscR2aquQI9+wYvMMvS4q3SXFMKBBOl+Et69mqJeo+diEF@lists.linux.dev
X-Gm-Message-State: AFuF++m8RD9+JDufaRRc0nF88ixZM3YDzFwbGDqcJm4+woo4LN7O2SsQ
	jzsWWGyY4+HpT2kLfx4k4+3RBLjfBOEQuZ2eV0snXsmsmu4J6LtmJqmapqcSY45sxSiL/Q==
X-Gm-Gg: AYBFou0FkVoGdUyqMx5O+MP+TzI2JYMcDCnZTMHzrZgE5KI1mKwtCsdN7j6m+7ZYe4a
	gzhZ4x/07O5vb9rbSZKkzk+FNth2NeKRJfyQZOVmCuh4GPjzNxDbrPvCqsthAomE9n8WccIdcl8
	RwQCQCQL96F/lYZSbNvNqGa+0dPQTTwTw/RNzP1QjID3uPHMuP0rxbAJs8eJwx6Te5lDMC9TFKZ
	iv6gm5dryeUOk7DfdCnla8TW7hlqZJrGjRdL9UwL1DaMw5aCvcM2h0uE1/2j/0cbDk168Lrtj0H
	+T9QN72UYOvHgd+t+zAOzt9BBAWYtWrvRQsPlKezla/06Yf5pR7BiawpZnElimaTkAmgkcEfEs8
	3uMsEfeddSr+HGIzK9oBOcptESPz0Z785B8MSsHKXAeiDLocLaTVvfc5uahzWxb7UoJi2A5rQUD
	7vobhXtVtcTFt53NOjiPtAy/W9QNPvtbG7Vu4K2MFpL5Go5JW4SOcOpA+0Y99uRgEt1w8=
X-Received: by 2002:a17:907:3f18:b0:c20:3402:bd35 with SMTP id a640c23a62f3a-c2e23caaaa0mr396166766b.12.1790860077735;
        Thu, 01 Oct 2026 06:07:57 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e31ce9e4fsm153318266b.31.2026.10.01.06.07.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 06:07:57 -0700 (PDT)
Date: Thu, 1 Oct 2026 16:07:53 +0300
From: Dan Carpenter <error27@gmail.com>
To: Ronit Gupta <ronitgupta138@gmail.com>
Cc: vaibhav.sr@gmail.com, mgreer@animalcreek.com, johan@kernel.org,
	elder@kernel.org, gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: audio_manager_module: Add missing
 newlines to sysfs_emit() formats
Message-ID: <ar5bKXI9R-RuAux0@stanley.mountain>
References: <6abe5570.5b65f4c6.2632fe.6f95@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6abe5570.5b65f4c6.2632fe.6f95@mx.google.com>

On Thu, Oct 01, 2026 at 05:43:28AM -0700, Ronit Gupta wrote:
> According to Documentation/filesystems/sysfs.rst, sysfs attribute values
> should terminate with a single newline character.
> 
> Add missing trailing '\n' characters to the format strings of all
> sysfs_emit() calls in gb_audio_module_*_show() attribute callbacks.
> 
> Signed-off-by: Ronit Gupta <ronitgupta138@gmail.com>
> ---

Please slow down...

https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

Anyway, see my previous response.  This potentially breaks the API
so we can't do it.  Search lore.kernel.org for the function name for
more details.

regards,
dan carpenter

