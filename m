Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4DDC2EC553
	for <linux-staging@lists.linux.dev>; Mon,  9 Mar 2026 20:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773086495; cv=none; b=LhmWmIB+prqvfEEDWs8ITSygAVuWOlAuSs/FbWDOMm5ki/HCIKvf481CaiBdTqgYJLrMtfyDeWNQ233jXy+7EmkNrxxRKn+zKpAI2qGz+OSFoYFWOTN2sOiqajLAfBVIS4h1I+kzgsqa676qnn9xu73w7DaC/OKpbeTDz7AXrV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773086495; c=relaxed/simple;
	bh=ET6yKbq1mfJTHSEWfH2qHx/MKV2E1Zs4VfwH2Gk5ty0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XeWJv4D16F80oTUWw0VwJRykmeAS95dmY30bumu1Z5y9GGnJzn36rbiius3TB3t5rgHqglgNMqz9AxYr1zhLomx/7vInR/WNczg+zw+8y4aDkmdKIpB6/hsOUDGFrSlJvDNX9jj0abPEKkUPun0DzN5t5RFp28V6U9TPLS6hshw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bZuI/VcO; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bZuI/VcO"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-439b6d9c981so5827000f8f.1
        for <linux-staging@lists.linux.dev>; Mon, 09 Mar 2026 13:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773086492; x=1773691292; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LbcipvGFTigDzsRIYigyYZ74xhkuwvL24rjqvScctw4=;
        b=bZuI/VcOOYgx1Ds3ouFflNw5SgqhuHePjYAEl8T0c/wYoTDGtQ3/24Dv08/oUUbxbw
         44iD7Xk6Q0acyb/RG2AgIkf22/PTrxqB+i9weP5RRMBFnhgpWYPHorThSqaoEaf0JV0o
         e6Fz2gkDinBLejkBO7xabDzqpkUbP5/KYnAlVH8KIKj7wC9jlrWl2CqkSwmswP5qZqO0
         FonAqI1Qf23hnbc6O0jSTAzidh/G52VMkGPKCPEoBWqLHRPKzcHIENxlBtBRhlNXdXjO
         rODn1qxaPOWD+7EVkOWZzreE26VjZjBJMlinKfceHugGuztCGqYqY8hzPOn+mGH11+Us
         hM0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773086492; x=1773691292;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LbcipvGFTigDzsRIYigyYZ74xhkuwvL24rjqvScctw4=;
        b=l91u7f944A+4LyVOe3S4J0XddfMSVJBTf7arqUUaL59gu3z/R3L74M9CenMC47YJdW
         uZjamgptwOLPxUYkhiO9De4eJ0k0MStE9K6yCVRRbwCgF0Ee9hXf4dDzIgtT8wZMEkQS
         CQxWnfj1ad0vy9e7A1pn8ROTzDRIuS2nA4tqJjMkfrdcd5/ml7aN8rYIN5R+Um0pj58R
         5pVCyQgDW0bawsA0pK5NGCPLcUKv10Bz2RQu/0T4meKsbxDeHl3TLFpYhtwSpzsJXMkr
         yMDsvwRq3aWn+lJ/ShBc7t2/bZhOtarxZt4mSAIVR32IENydJ2NkqyoQ8hV2IeU7XwsK
         qRRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWf68Ettb/J7oEsKVhMFLDn6+xHK0fkU1LFG616q9gjJ80/nMqj1oHX8XGwTuN4rhH3/QzBlegn2+oAGrat@lists.linux.dev
X-Gm-Message-State: AOJu0YyJMmzXQtd9KCOW0tb5Ync7u7hZIOMgdVZCGo67pu9hONApRYqU
	I1YvXfalxh1Ey6JuNcC+nXzvEBVszMyupRn66u5bpLsFYDdA+5myQCV62jBuH5YGssU=
X-Gm-Gg: ATEYQzxBpxhpuviuwCRwc6fXM9edKsrqQbmdO5iTXz6HhGUYfrpDCPll47Nbo/9RlP2
	tAqs2dPrQVFXzIDm67CYH/hhkFq/+/Rt3g5CW520vdxOP3+qkCkeQXOauszAKltca0uSs/H4wd7
	7RRJDFKcEBenOFT9X77II/kXib2agMiEK/Pbk3fEAQ2prtVtCR2x5mKC5ecezp3mOmZ2KUHfQQH
	p7kQrYFtLSldHGyPUVN/AH73jvqqiarmu9oH35Fttrt4346c4uaT25lcevB7HpeKQFZ0OFOz54+
	6RIvD1q4ILaXwgkdQBU6nNSdN2bAFDB98QycP6rWL5yEfnigADwCH4lEdjjdOlKiC0lELyfa4H3
	Uxs2cMEQQlwjomcnAjxU++D6Lcg1cKfdLfoyXDRWxowaHCACbhYCQY8c2SieEAM6+lSCLQSHDlr
	/DrORFgZdraFY6eQ6Zo9DEdT77s4aI
X-Received: by 2002:a05:6000:430a:b0:439:bee4:8a93 with SMTP id ffacd0b85a97d-439eff38bcdmr1592462f8f.12.1773086491907;
        Mon, 09 Mar 2026 13:01:31 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad8d968sm28081941f8f.6.2026.03.09.13.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 13:01:31 -0700 (PDT)
Date: Mon, 9 Mar 2026 23:01:27 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Bera =?iso-8859-1?B?Wfx6bPw=?= <b9788213@gmail.com>
Cc: me@dipeshchaudhary.in, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v3] staging: rtl8723bs: add missing blank line after
 declarations
Message-ID: <aa8nF_YNLHdQ43mo@stanley.mountain>
References: <c34f031c-3271-47cc-9a06-fc3406a25aac@smtp-relay.sendinblue.com>
 <20260309185944.1059-2-b9788213@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260309185944.1059-2-b9788213@gmail.com>

On Mon, Mar 09, 2026 at 09:59:26PM +0300, Bera Yüzlü wrote:
> > Add a blank line after the pwrpriv declaration in rtw_set_ips_deny()
> > to satisfy checkpatch warnings and improve code readability.
> > 
> > Signed-off-by: Dipesh Chaudhary <me@dipeshchaudhary.in>
> > ---
> 
> Is this patch too minor?
> 

No, it's fine.  These sorts of patches are easy to review.  Plus, Greg
is a glutton for punishment.

regards,
dan carpenter

