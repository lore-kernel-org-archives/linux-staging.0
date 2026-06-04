Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 771C434F24B
	for <linux-staging@lists.linux.dev>; Thu,  4 Jun 2026 14:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780583667; cv=none; b=SFQ8Tu3iyQlbqWp2y7NLANGTTR/1EWK9T+mlWdEDv8aW0WHqL4wfREeRUlBWnUaHQ7kDWhdlLHbwA3Ms+qO9Wpl0xFDBsxO7uMKTwWABlT5KjxUXTxTmW36F0/IK2QyX9xNO2Lfwe/uzZayT3gmkLiwD7JLjz733KJRshZjNoSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780583667; c=relaxed/simple;
	bh=6jsWZCOnsYZ3y5j/SQTMH4+CqTOv5WaAhGSttD+Y6JQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J/rIV48UxdImskUgZbKQYTpxK/1B43vDn6kNGt6GrWixIVbL93WOLDXLImvNo21AAOt3yuSs6VQAO0rBhajn8wQOMFDokArYSOkMKl+Pp8lf8eIw4vftx5qvYFBS5fotm+FXaj3bXZAjUDfogV3CuuZYWC6u3uy6BweO8kQkt34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WPUS3hjz; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WPUS3hjz"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49068493267so6476205e9.1
        for <linux-staging@lists.linux.dev>; Thu, 04 Jun 2026 07:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780583665; x=1781188465; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1PM8lbSBCSgKEK4loSfWef1l1aeyW9df7wbWffr6AZM=;
        b=WPUS3hjzRB/mUvEBAuVgMsDAowCZJvPYFMbaVx74QaPzAFGC1jPxooEYdFCjRKtGW2
         55x/9V49kZ65520vgDTzhDeMtHbODnAlzbBX23j3SvoW3LJxEjI6+htOpbDMpEYT8Opr
         G2rQKUvYHd1+DdUPCr/jPGsMIUXZKryO1fsSQZLYL1q3hJUqLWlEgiNDSWYXPq8SxFnj
         DM07Kft+va+Vgor6/GFR3Jd3plpG2WqWD/5qR6brY5+tM9y5noXYZgtQZ86tShnNbW3r
         oqTvaVZtqvGO8xewzYPw/OmcmgpXLHnE2OKw7KBkyJ58ieUkGWtCB10aZHnmma3pgj2K
         jhjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780583665; x=1781188465;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1PM8lbSBCSgKEK4loSfWef1l1aeyW9df7wbWffr6AZM=;
        b=SWvK1iQAfDClp4PK4p+7EBJgWjP7wUISKu81kQS9R2EO0dKIgAVi0JO43qsj5+0yjJ
         lKiabsBkK0pUdulSe2tJsQbMgB7GUWxowoGEagq3q0KHOD8sY2HEafBsWcX+mEzdWyeQ
         zlHbq8Fsy/uL5uYr7usxVHzzPuXYj2Iyzkvg86VVwzw7F3cgUEg9r9Lkf0Giu7y9lRRp
         fhvE8Z7MqFXN6jHhlQSeseG+mWvp19poZQDeoJomdbArQalU0mPRI0k3mDRIzO2y19cR
         19EYatq9UcWiDGcABmedpkW5jA2vtMTeODzdnHUD3EU0Qy+0OiLqhGPgwjFBa1DET+a6
         NowA==
X-Gm-Message-State: AOJu0YyyVK0R0Fgijw23SdiAOVcA/C3ONld0sLaGhAoJ0aXjcWF4+Uo2
	Ait6R5rTcvlIt1ZCCz9XF97dguJnjYXaErrsrBFoy9BJvlSBOKYwFBXE
X-Gm-Gg: Acq92OGV0JjiroHo5f+lHycpzEznOD8mZUCgKT37HjKu7e6opGhKHIlxN3k5KHKulYi
	2b/ZM6KwyTBMIyEwkgfvPdhOWrO/TnR6lCXpWt0GfD6FhRC3m7l9HXG+Ukna9VyYzBr9Gwnq8EX
	0f3RexR/3BanMmtFdusPH39NOZkVVR87XpmZxsD2DXcaKAzQecIqUaV7Pp7bQhr2oz4NK5uYg7A
	vZg7jO2OuG9ALlBVDEmncNDvFlJ6IFXl1N557ZWj1BuHV5w6E0E+qX1DE3aT9P+P5mGerdT+oLH
	X0ERO5aWEMYaZKKa7aO6iHDzpv0PYCSlRfPOhz9bJk14Hfwx844BsT1zgdlhtRvKjzXqxZtKjf7
	MjFcMhQKpvPtXPndZSNWdj/nUEyHpBj4qhBRqOLRavZCVPtbF2vCMrtT6KLcF4uMUhE3DkyC0xs
	SK4bDok0YGzxbXRrwdRhg8HzHG2QrWsl157kdvqdKI
X-Received: by 2002:a05:600c:35ce:b0:490:b9c3:6c49 with SMTP id 5b1f17b1804b1-490b9c36d9dmr136062915e9.29.1780583664878;
        Thu, 04 Jun 2026 07:34:24 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4602cda3651sm3876814f8f.32.2026.06.04.07.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 07:34:24 -0700 (PDT)
Date: Thu, 4 Jun 2026 17:34:21 +0300
From: Dan Carpenter <error27@gmail.com>
To: Jad Keskes <inasj268@gmail.com>
Cc: linux-staging@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: replace magic numbers with named
 constants
Message-ID: <aiGM7ViQ9Ee_JY_T@stanley.mountain>
References: <20260603143127.343103-1-inasj268@gmail.com>
 <aiGMXBNQ0TbIGbpP@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aiGMXBNQ0TbIGbpP@stanley.mountain>

On Thu, Jun 04, 2026 at 05:31:56PM +0300, Dan Carpenter wrote:
> On Wed, Jun 03, 2026 at 03:31:27PM +0100, Jad Keskes wrote:
> > Remove the magic numbers in rtl8723b_InitBeaconParameters() as requested
> > by the outstanding TODO comment. Replace 0x6404 and 0x660F with named
> > constants defined in rtl8723b_hal.h alongside the existing beacon timing
> > constants.
> > 
> > Signed-off-by: Jad Keskes <inasj268@gmail.com>
> 
> Just having the same define but as a goto doesn't add any information
> or value.

Ugh...  Sorry, I meant to say "just having the same value but as a define
doesn't add any information."

regards,
dan carpenter

