Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6563101B6
	for <linux-staging@lists.linux.dev>; Tue,  7 Jul 2026 12:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783425819; cv=none; b=fdo7EG4LnkE8FjpA+PxlpiwHpHHaPXIrgyXgMajOorOQCo2n/PWzPUTpCnYxMgY03XYE/tkwqk+rPTS0n3iIS5Ojx9C4zecWMHz+I+q8LV8lkjGA5euW67ZzvC25OBB51kBcL4Ys0YYLTVJIpw+sj+hF0x2ysaK4V+93Aoi1/z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783425819; c=relaxed/simple;
	bh=ducWhqa9x4kiv9smi6Zdw3sJgTMTjDnL//RQg9WoPe4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fs4ZY4yHy2r7XPPg+H0de1HHq69cxAcEiGeJ/UwcWLpy6O4BF7ThcmjsXIysL8ffrjj7uDD8b/2Je2vHgN5ISpUQF71/gFyZBig0A9CWng6Cl6/JKltnqCge1Ey0Ss9RgdcJsofqrc9Pnc71GLW5MPjs0LXOM3KGcbS3ExtAyaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s+BCkYyS; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s+BCkYyS"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-92ea24a2dbfso197283385a.0
        for <linux-staging@lists.linux.dev>; Tue, 07 Jul 2026 05:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783425817; x=1784030617; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ducWhqa9x4kiv9smi6Zdw3sJgTMTjDnL//RQg9WoPe4=;
        b=s+BCkYySbEiCIEcGlJR20k1ANcO4YE8hhIdiSBI0xnSklWbRgL3NTveLbFhhNtkNVR
         Xa6EHU7zegi8RZBVNgQBM3VF2zWaXhWc41/O/BA0thwBBH5VszH9KCbmuYbK4P9Wta+6
         mTOsRdnmtt4gRW9NhJeGzTyZ3IZ2g4BwA0sDtXhu51GKIuYFyRsrdLBQvI0pY0Ex8QVP
         bApPQ8bBD0G3Rfu7wjuk/VGp8pX1sztpQYh6INuIqs8Quz2XWoN0zMAnd1RPucNtqMsR
         rfSTrx7/ruU9GIn3rJKoxNkFSwWJUQNSJxton4lNoUs6ZVYEcdnq7t3etdSJKMkpuq5N
         FpaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783425817; x=1784030617;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ducWhqa9x4kiv9smi6Zdw3sJgTMTjDnL//RQg9WoPe4=;
        b=sYy32AUsr3auz8JlAAUx64MfLMPB3N0JUNzOWx1C740A0Q/wtCEDWvyD+XbTabqOy6
         L1p6bPyOfm+fjslhdAHuHbvtXMXX3zvudzXKBerbLA3+zWhU7eDj5SHrmN+gUcI7QZ0o
         4lPDpLLdNnROTM+nDTr5aMqpYigEN0zw7I3aaYMU3RSGAtzjCV9k/vJ0K4UKLHd4ZUhB
         zV0Zr2CfhUkZ7A8G1m059Azh1skGBOjM4FhHTIzEUR7kXdYQSzy0aL0vovaJJnl1rFSt
         mvEsjJn45injaqwdQSmiiT0rfmnsqqYuk6w+vRHzgubtbmXa2/gbvL1p4NR6S1JCfUSo
         KCpw==
X-Gm-Message-State: AOJu0Yx3/SKz77HYAMPyeD14OFi7a8oi645j6uErAw3T16S92xQHd4da
	fjDPYnnK+0GgHodvleN6xnzac8kIr1OwUUGU5mqVDv4PNBnhIC+JHMisEUKBWQ==
X-Gm-Gg: AfdE7ckgxxP0V79U3l/hByMKyHHGYdYC2EECYygj6sFpSTh10FLMcl2JVIYyFU6pwgZ
	JcBg3O4o8iZToAtIzX1ipfXvHAtnybt4EcjTAYS3lg3Nh75XkO/7OXxuIJtIW1OMIEn8fmzG7xn
	vvfCcw6sbPjoifw1cl0vB76gj6rymbTlgszqxgyGkqKwBEwF3MnpeziwaTDgjynK84EFerQWT/s
	ZDNOdQXD5Oqvk1Z0i6HnEcYvd99ZA2o4FbZr8QsYlu4wzPnZbF/DyAKNgqdgU1SwVi/7UeNdTZN
	K9UiJHJ8ofmt7jKW03viB2mOSgD0qUnAVePE+NdMxt480nUgZ1hZpiIET+/R19rgf2xpQ+JzqkE
	rg27Z2eUo4Bm2TKxA4HUODQjKl/meP/moZ+Nl9WUg78hX4T4ZL5vD5hVw04sQATFgzxk75+s7TL
	cs1z7hv0HRswA=
X-Received: by 2002:a05:620a:198b:b0:92e:5ffe:7833 with SMTP id af79cd13be357-92ebb5a2bcamr557790585a.61.1783425816817;
        Tue, 07 Jul 2026 05:03:36 -0700 (PDT)
Received: from EyeOfGod ([103.129.134.78])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e90b81342sm1144553985a.7.2026.07.07.05.03.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 05:03:36 -0700 (PDT)
Date: Tue, 7 Jul 2026 17:48:28 +0545
From: Parsal Baral <parsalbaral@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: Use PTR_ALIGN for rsp_buf alignment
Message-ID: <akzmbhapkSyUyrF2@EyeOfGod>
References: <20260603182602.658589-1-parsalbaral@gmail.com>
 <2026070733-entryway-cost-91a0@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026070733-entryway-cost-91a0@gregkh>

On Tue, Jul 07, 2026 at 12:58:40PM +0200, Greg KH wrote:
> Does not apply to the latest tree :(

Sorry about that.

The code this patch modifies has been reworked in the staging-testing
tree. Please disregard this patch.
