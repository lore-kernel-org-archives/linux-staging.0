Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4312B44605D
	for <linux-staging@lists.linux.dev>; Wed, 29 Jul 2026 09:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785317575; cv=none; b=IPBk4q3tG/qU/Xyu6GB7I6akSWoQVX6VQN7UNPWl3wYoWHUTxkdJ/+DrUTkYVfLsd5mPAH/I1yd7L7j3Caus44DomgWvQ+Hx8x84SQ2/V9qvVCouJd+53GMyADybiX7RDGKct3Qnnh5r9Uj4mm4lIsd/I+Yn3SRHs6fiRXbj10g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785317575; c=relaxed/simple;
	bh=ipm1oQXaVZ1Z24vfzUuKXaZeADXH/PIMUPryhKhhhoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hYgf8SC3UqDfxVldH49K0f4UM1j+VZiVPZcYWPV5XA5xaBiQ3buvVFK4QtMsMik4x2PhlIhkO0NShSog7eJvhsXFXFUMsIEz32irdppMQxKeLEiLTuPQdK/Niqg67jMzqM99I5Gqh8d3c9GaYenYai3LjfgznK/ZCOU8H1+cDRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TC0Sw7gf; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TC0Sw7gf"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-848d21bbaffso773687b3a.0
        for <linux-staging@lists.linux.dev>; Wed, 29 Jul 2026 02:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785317573; x=1785922373; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gyzYDsJn2nq17ENnvHUPKyYTCDDNPFrMQz7X2YHcpj4=;
        b=TC0Sw7gfY+dKiHiIjmymjLGaLLETTe0eP3sm0FVoSVNq/MYixJT4GuCSsydaWLdExE
         KauWpvsBOm3yhwlf2r5MYTJ+EqlqzQX3Bm3JpE3Cu5DkUQFLl77PL1jzKS66tFvtK2fd
         I8QfmP1hDPOWYmm2CG90NcWFoabhj7uwBHPvorQknkWkJXrsS9Kq6SE1nXTTF6zTp4iI
         upkTTDJL8XU9HfTcjiMx2uDRRkPGyyx4lnhk3cVufelSelF2BmjJbvfnL4kA09tOfB44
         yXQOFyMGG1dK3eFYVNjXDAhFZG2xuDc/AaB97hzysxj1IFGe34UmePKY0b44ZbXJ6Xre
         /DwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785317573; x=1785922373;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gyzYDsJn2nq17ENnvHUPKyYTCDDNPFrMQz7X2YHcpj4=;
        b=r65n8ybfONjNuVq8eRaiHB1BThzEmfCsOJL1xH4ABrnSfgA74avaKdYWGLflMyyjK+
         R2+CrN5v1VRoi468pumDguizMN/SzwIJleiYA7J9FOLfkSRiQEq4z4En6AFUn+Gok91m
         0UDcriKBf1RgxQgx2R+Giuqwc0P9er65XM1m1Bm7bdWRcBcmI7yOKneEnjFEKLypL5oK
         m13COVvLcs/rRII+gz43YgAwxSXblWA0AIpxAnm4AtMSWQmz90lOa/zAOmkBDNttcR5L
         xv81F7Re7CDug5XjFxDB1el6WqbrTWo45/TdMUg6Me7Kdc3CWn2ybMVODCig+5WmQ/Rf
         QpCw==
X-Forwarded-Encrypted: i=1; AHgh+RqKG7kDYH2Zv2471oQSpIk7prCK4yfF0CHqYkFwYZ19rl6r3Wli1Flz9fYsxd0DYab7bTKXBsB85M03tK3o@lists.linux.dev
X-Gm-Message-State: AOJu0YzFQ3yAW/w6+R0QB45fh6n/3vDFZrs/w1QxSdrgXYnilmxtVAo1
	EwXVlD1r19B62bekVci2GbB2jt1BjF79q+PkB5u7DWaPHvkaPEeDtOb1p5DujJL0oFk=
X-Gm-Gg: AR+sD11GjPS7ANecmNRYZMsHXxCCzK3yxe+uy/NbK4a0q+s+bZLiZnWn5+IKB5F5Y6q
	0GYHLryC+fLUCxq73m2mS2k0xw64qOrO3ZeKc9rsFHMiGlgLIjosI1LO6VnxfSXvA7R8qInxyiY
	/20XN/n6mnS+1DeTTdPhNspvvHTs2u+kSicxhLQdIf+5CeZY1PyTIuAv542GZP0v7UibJbtjK7c
	XCuVPC/u/wk6S7ZMsSBDsJYtokU53cAdBxYSeTcWXNHn2zj9IDxRU1f7+CnnQ4Z3KKKEmQIvBsX
	U8J0822gKW+HKyPrznxLdAs9Bp9qhL50tQAoFKFpb6RryriNonhh9Oz8igtwT822RCLIeW4filY
	Bkq3gBfuEUADlGe680tRrwEW742skFMZozBCa+uWKiDBVIkx9nE9aHZTkVwZmqyNaKmv8iLhikV
	rneayrycbqrZxUUewYb/e5niBipcQHLMt5+wnfkVipu1cJNdRM7v251VA=
X-Received: by 2002:a05:6a00:9288:b0:848:4d1a:9556 with SMTP id d2e1a72fcca58-84e9311def1mr6135495b3a.11.1785317573559;
        Wed, 29 Jul 2026 02:32:53 -0700 (PDT)
Received: from localhost ([172.216.252.23])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea0375d6csm1101033b3a.43.2026.07.29.02.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 02:32:52 -0700 (PDT)
Date: Wed, 29 Jul 2026 12:32:47 +0300
From: Dan Carpenter <error27@gmail.com>
To: Ashmit Kumar <work.ashmitkumar@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: remove unnecessary parentheses from
 return
Message-ID: <amnIv0liSx7AKjpU@stanley.mountain>
References: <20260728181351.13243-1-work.ashmitkumar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260728181351.13243-1-work.ashmitkumar@gmail.com>

On Tue, Jul 28, 2026 at 06:13:50PM +0000, Ashmit Kumar wrote:
> The Linux kernel coding style specifies that return is not a function and therefore parentheses are not required.
> 

Please run your patches through checkpatch.

regards,
dan carpenter

