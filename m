Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0133433A711
	for <linux-staging@lists.linux.dev>; Tue,  2 Jun 2026 13:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780405927; cv=none; b=P8//Qf7vAOOd/xj/mBBeQ8kBVNs+VHzM0smG53Ud2d6lrKtAq3nFZ2tNbjS/wn9+zUv5pYGkLhgi/sQXjJCG+nF0RSNFfMKCfzVjNWacIMNb9lrXKrHpUQ/o7C933jGURlNv/NAgUt24dT4Y9kqbw7kpjl60j/JC+r+eTF0t6nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780405927; c=relaxed/simple;
	bh=tswu6Kwzi6oqS/odqc+6Wa+Bgr12LF8wvaaPlR9dQyM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ajSMt3italSrq55b5G7lmwci03amw7HRFfmi68+HO5KIUHNNQXeLioF7vFsZFjVkoEnTQNvAORalY+0sIuKSNlW199gsqe+OGGNEsaAc6xyoGHh0xulXsdWg631J24kW35CAUpk8Xf52faLgW/Ws9jck9sLfVHPZqQj0x4Uc43Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MOiIWOIX; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MOiIWOIX"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-68b2229b48eso9151057a12.2
        for <linux-staging@lists.linux.dev>; Tue, 02 Jun 2026 06:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780405924; x=1781010724; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ogCwjm1Yi2ZJZ+ANMdBMYZC9a4UiFfbpa0dXxOGwhBw=;
        b=MOiIWOIXnvmA/Jtv0dUyO8gamqqzCEb4N2rjGRY5gNcRZd+WncQGoACiBF6wJOIKAg
         3XFBd3bOB4ob7lE56eT5VxiKkxzyW3IvMDpKeAOnm4dFdr0rCfDOQrkJDBkCsBz4xB3X
         BFsgtFy4P1BQRKWYbyJpoa7LbXbUIeX8Zr8KakSzs4KoG5iCEn2wAyMsOZnm2Z2eDgqn
         rox+GKKnthqbgqLxo+vcxdRT4NwJdZSKkvVbhDvDdCHulsLkaYkZVL7cA7LCxFzr3d9a
         6jaJfBxYdW8FIp1qLMWE8VOdgAjagy04R8JHiFPfX3Jj6m+09/+fMQ5BN1klU5irQ2NP
         oHNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780405924; x=1781010724;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ogCwjm1Yi2ZJZ+ANMdBMYZC9a4UiFfbpa0dXxOGwhBw=;
        b=T+MfXzXZ1QZ8qv7uI2MWnIrrc3mkM/sics39TY7r/bGbZHOsoeed5CZDC+/xlFoiHS
         bluNEVXmXNm/NIQfiSPEHF7aSFrekgty4da/J/MNXbqKRJ5EXFoG7oHGbu6BZ2PLJOuk
         HoiogENEZSLUplsQte4XcJwxWLdosNi4kcKiWQo85ZKp+NvZpnMVT/8RI2TkiDL0W0Ou
         6XxSdo8Q9ST29zCGTLnh9TF7pIg9XWNxRYKSHUDiLZWW+RU/sSmnzKPa+8G9BhwD+7bj
         FrIZEqSSudW3fvVmmUjNM8zdEZ136HTOeZuv7zspnq5AVA8tf8Pyfd8ITP4zz/gB4lSK
         Yu2Q==
X-Forwarded-Encrypted: i=1; AFNElJ/ZNNg+y33Ih1/7Yexa8YBhAbslG4ne1eawa77+7Mq1Y3487a8f9YsW/zKkgj6qQzZNHCp+VXDQ9Zl/nyZL@lists.linux.dev
X-Gm-Message-State: AOJu0Yys99jV55dhsVrNmInsml5VDksNpFuYfJjmPkf5KR539FVAVq+T
	8L/uVW0f6F8pvJXcYNIaiBZoHFNEDfgE3LBJpri5KbCtFKdU7kOfM7st
X-Gm-Gg: Acq92OFPnH9aMCmzYBxlfGjpm0ppQzZJwBqJ7N+mwycUHneQIwTkOCfL4sNo08n2hn3
	U0gx675n0gR9ISsYyhmSphre5OD+1sIFyTTiPwMhJ1eSs4LZVNjwcxQXxYcT1OWvwADrTVO3bdl
	HvKBMXLn83PY0W+NuTnuideLAwrDIPvMwUKp/xtmAaAa1ljGOjVQkV2SVUKr1bAJNnj2rJNfw9x
	KaT19rRfz3aeTLO/pkkUQzlR0JXn+aA2w5KDSxum77RB0AkTa+C5a+MHoxTx30CWpIewiR3dRKC
	IbhAznEBxsFUnllR54oKq+DexLfiNA+hBVGpLvwkrX6djnESaWzMJbwglloh1KfdP/nad2CI0oJ
	fAL3nuJIN+DZYwgpPg9gT0zRtsZK7fB2dGD3tHoB44VPKcnziI6d/zWYU+XnUuSf44l126Dk+Fu
	SwF9FlGWs43u/Grhk1qoZdq8jMuk+RaA==
X-Received: by 2002:a17:907:7284:b0:bec:7066:8439 with SMTP id a640c23a62f3a-bec70668badmr690192966b.18.1780405923622;
        Tue, 02 Jun 2026 06:12:03 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-be9d2de53dasm493024466b.14.2026.06.02.06.12.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 06:12:03 -0700 (PDT)
Date: Tue, 2 Jun 2026 16:11:59 +0300
From: Dan Carpenter <error27@gmail.com>
To: Grewstad <dogestad24@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Ovidiu Panait <ovidiu.panait.oss@gmail.com>,
	Jacob Feder <jacobsfeder@gmail.com>
Subject: Re: [PATCH] staging: axis-fifo: remove driver
Message-ID: <ah7Wn3-meqmDLk_d@stanley.mountain>
References: <20260602103208.15799-1-dogestad24@gmail.com>
 <ah7AYukZ5uzW1NVU@stanley.mountain>
 <CAD03fjZQwgvDbBdh6A=1FeGVn4Na29ww2DzG3anuk2sOd0-4EA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD03fjZQwgvDbBdh6A=1FeGVn4Na29ww2DzG3anuk2sOd0-4EA@mail.gmail.com>

On Tue, Jun 02, 2026 at 06:31:27PM +0530, Grewstad wrote:
> On Tue, Jun 2, 2026 at 5:07 PM Dan Carpenter <error27@gmail.com> wrote:
> >
> > On Tue, Jun 02, 2026 at 04:01:53PM +0530, Arihan Bhor wrote:
> >
> > I don't think we should delete this driver.  From reading the git
> > log, Ovidiu Panait was obviously using this code last year.  Let's
> > also add Jacob Feder, although he hasn't touched the code in 8 years,
> > he still might know if there are other users.
> 
> I could not find any user-space applications that depend on this driver.
> 
> https://lore.kernel.org/lkml/CAD03fjb=_kW9=q9YV4qnQ5GD=HMB5Bx7pf3+AFcgDR2gVc1V6Q@mail.gmail.com/
> I was looking for any users of this driver on the linux-kernel, linux-staging,
> and linux-arm-kernel mailing lists as well as Jacob Feder, and received no
> replies since I posted it 1 day ago. If someone is using it or maintaining a
> proprietary app, they will complain and we can bring the driver back.

Here are people using it and running into issues in Jan 2025.
https://adaptivesupport.amd.com/s/question/0D54U00008zRBdISAW/vitis-is-not-creating-a-driver-entry-for-axififomm-43?language=zh_CN
Someone provides a work around:
https://adaptivesupport.amd.com/s/question/0D54U00008sLBuMSAW/how-to-use-the-axi-stream-fifo-drivers-xllfifoh-xllfifogc-etc-in-the-project?language=en_US
Then Ovidiu Panait fixed the bug in Sep by adding the correct
compatible.

regards,
dan carpenter
