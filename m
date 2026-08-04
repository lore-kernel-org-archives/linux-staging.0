Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E5E3E0C57
	for <linux-staging@lists.linux.dev>; Tue,  4 Aug 2026 12:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785848093; cv=none; b=Onk20uzoESSMUU98NCPuizTR5GXWBqmbu13hxgABD3bfSVmHGLH3VJdSsVDdC3axNCG+7gdtvWxpR7T23cEhAexXLlSH3I2wQ+DuXrnbB6A2Q+2Tiod/9Zy3SUZgECmiGTJ6lxTZKS+MDt9btAoxTJtAV4csON9513OEcatNroE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785848093; c=relaxed/simple;
	bh=387GW+vZQF2yzhibm2QZndjYVi5r0ZAQIRz6lsvxnRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TDKdzGIasR44tgT+RfDIE7bBMYy+o12cGBu2rh5ZMUCXXpCHJhF13g/m2CeYg3MwNrevESdNjjo+hxkJubP9CzbvQzJxli51FC1cOA4FToKhU4Mrx+x7Gc/d/19siurQCcSkVL382eVJnnp8CM1qZMIY815I3U1Xcz5GyHXBpJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DydXz9Sa; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DydXz9Sa"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso33132255e9.1
        for <linux-staging@lists.linux.dev>; Tue, 04 Aug 2026 05:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785848089; x=1786452889; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ogopg+D/gsaO7xwgyf2WANcdYfuvwxDcjPhu1T3EeVs=;
        b=DydXz9SasddqkMr8ZsCkAG/n9IjtK1AHXZJ3l5mcD0MyJfZzM2L/4K6abIcB3N2WtE
         oycEyI2n3S+Fr1kVx/Q8jyLJxRHSBg+Nu2VD2sJG3UnOWv91EtJHwplb/bb0hTryBLp5
         GQbwTYL1e8ofRAXCw6prD9nlC7N/KdMrRtxmjJK07DQ2bWCMX2deHpZ7lpMp2Jum/Qb+
         //9F5suFNjQLtFjRhlHxFnASBlv7CX3LLIZp4GJ+JZKHrt3TBgFIQaT0aty3X5255Vig
         MZ5yPqAPnIn54ESLFLmHrT0+Ed4ysuJ2IcjGMQpFYM2mfQNmfQAAW2c5D2YzwiZbj/Z3
         RbmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785848089; x=1786452889;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ogopg+D/gsaO7xwgyf2WANcdYfuvwxDcjPhu1T3EeVs=;
        b=Ok+w7hTIF4di/Ncad0m8vWVVdj44X407F2VJ6XInq3l50tNQ/RK20h/zKiMDdlrk+P
         kvWV0rW+QRuCM5PMpQL+BKGcjGi12l9wlhkg83EKpG8kzCQbKpK6V9xOS59U4nRHvae5
         ybpcaKEoNo3+VqumR7h7tLhZ/NLUcD0sgOoYCanFeaYhNg4o2BB5XX0ZumDXr+cTarPI
         3mG/76e8nlynjrBHhiNV2mE8ZVYr1TcvmF5Fb1CRniVb3u9SZB7aTDGQpHmb+6tK16ZB
         35QHWDF8YVlWe2dG36y72Z7vrwWlzp+E4EOwCRpQn6bwlEW2VfDjjB7XT2yZy4+XsWSO
         SDFg==
X-Gm-Message-State: AOJu0Yx8sv0eQbcjwZvdPP8HrBkRftayKFs2WGK2mTc3xJIMWvi0QD+o
	VxK8T6wSNLCPEQXX3NVxTXAPNuWwsHmGm+unnIWaE68Jke6/lq5S0IG2
X-Gm-Gg: AR+sD10+f8/MTYkPbxfYbBMpbUqdMrs5X78RKf6ZiesxFsy2knM76A1WzsS6OnsK37E
	136lUu/wgea4frgSUK1BdqRLUq/t6PgGb0K0sFxHH1Zk6uPAi7i5GOqUzvhmTEooGgc17NA6IZ0
	jXzQwKbDoWicbszQg47xykAD3R8pTIrarIvfWIj1e0t2ElXrsi4JMuaRvVbdBKrQpjABu3J35sv
	ZrTVrLCEWSc1G6Q18TNGcxk1Kl+7Td3tYR+t0z8//96OHVdxNkaTXCVV2d/F9g7WAArVNas0lUi
	Yf8z+UTAYu1438rS7EW+ZECY4x6xSZMt3ymh8roJ/4mKQGX4Z5RS/W4g0k8bKa2Us4D5FeK7EA7
	lq+6rRUZ3Dn70H6hD6ivdv22J42BJ/jFVMlNZMfiw9KjsqwEGWLmFqTP3Bdz44ANm6Vuq+mIOHQ
	GoUZaIUOQiNAogH4z6V8BQA2Sp7Eurvd5baUeegMmwJjtMfR9p3KxeoLS2b2Gf6ehjLolsJ5Bwi
	xvQKAWDorbCZ5uAPWwLcnIy
X-Received: by 2002:a05:600c:1d8c:b0:499:4d50:7230 with SMTP id 5b1f17b1804b1-4994d5073fcmr33299285e9.18.1785848084203;
        Tue, 04 Aug 2026 05:54:44 -0700 (PDT)
Received: from localhost ([77.237.184.255])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49949fc6f16sm154103365e9.2.2026.08.04.05.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 05:54:43 -0700 (PDT)
Date: Tue, 4 Aug 2026 16:24:37 +0330
From: Ali Nasrollahi <a.nasrolahi01@gmail.com>
To: Dan Carpenter <error27@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: atomisp: remove unnecessary parentheses
Message-ID: <anHgfcWqVFVrbEi9@zephyr>
References: <20260731173310.101185-1-A.Nasrolahi01@gmail.com>
 <am0REWV_kDGDK2BP@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <am0REWV_kDGDK2BP@stanley.mountain>

On 26/08/01 12:18AM, Dan Carpenter wrote:
> On Fri, Jul 31, 2026 at 09:03:10PM +0330, Ali Nasrollahi wrote:
> > Remove unnecessary parentheses around comparison expressions in ov2722.c
> > to be alinged with kernel coding style. This patch is only cosmetic and
> > does not change the logic.
> > 
> > Signed-off-by: Ali Nasrollahi <A.Nasrolahi01@gmail.com>
> > ---
> 
> How are you even seeing this checkpatch warning?  I disabled it
> for staging.  Just leave it as-is.
> 
> You didn't CC the maintainers for this.  Next time use:
> ./scripts/get_maintainer.pl -f drivers/staging/media/atomisp/i2c/atomisp-ov2722.c

Thank you for the reply; I will.
-Ali
