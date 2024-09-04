Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADAC92CCB7
	for <linux-staging@lists.linux.dev>; Wed,  4 Sep 2024 12:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725453945; cv=none; b=PoiQ79jZ+t3Qx0j5i+tIqvuMzn4OsRKbiEyuTg4tnFYtWOPlXgNeIjWpr+PTTl8JxDxTSyQFiBwsBz8BicNWolEGNz77Y8/0JLXz3EagaSEo4W+8hB49IKZBBoo1npDi8pcKdkKSPxTm4K6m7laidevqQhGs3oYEKKVsadNNNgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725453945; c=relaxed/simple;
	bh=zecXoti5ozx8wrxHZvnlSmAH0XIKx082xDSFxKVV9Y4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iBHWBEyYadNBnf+0IE/ik2ZQVxEEdY1rJyEVeQzzoUtQqeA627yVMWKx1dSBLaKLCCddNjTaAAo+nhodpOI+aUjoyLQBHhfWh/r1jtUoIBLA4Q8z2+o+0kO3Dw1Q7AALQrlyqs6WEL1uF6FznRxrte0IEqtCWldG9rvAEms8ePk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ll5ac0tc; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ll5ac0tc"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53568ffc525so725723e87.0
        for <linux-staging@lists.linux.dev>; Wed, 04 Sep 2024 05:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725453942; x=1726058742; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Tawvlkn51YSgu6BWUSzYSB+wnnr576T+LPuEkCbb3D4=;
        b=Ll5ac0tccbnVJveBe97TuPO3RjyvMDnS4GM+5yHAButsVCJKvjC8p+f+BxMRMgX2yt
         6krwb1Tipus+OfBIpP5Dzq9w+pZbwcQLBJyRN6bjVFIw2sXJQmIi7fo14gA0luxMe5xk
         XNelApITO0+pTiPTO4wh+0vC0VgLqiM7gVRJ9F2r3t2fV5C6jBEOYM/jjt1lidBD9/Hl
         Z1h+GIhcFsXl9e8x9AK56mtY8+vrXwlTW6ZZQJYn88JDeo0bFlkaPfAB0s5uRrt4YVRa
         3MnYYZVCwTbbzgJKKfs5ceOK/wI/IlY79iZyWw5/7S6uX1yVhJy276mZu39xx/1b7ZWT
         j5AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725453942; x=1726058742;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tawvlkn51YSgu6BWUSzYSB+wnnr576T+LPuEkCbb3D4=;
        b=fsj2HTaDF5ICRglwYorz7v1FDZlFrs9TJyAfvKVMEf2qqF1agb93N1FkE9ooifN+s0
         oAJrfZSuaoy+7C/so4TRAGA02g70rd1zZjoC9NItZSQkjXm5xwTmwyo7e35+sR6WjAMu
         S9ge2xDzIE1eWsDQpXP++E56EAuarBqbiXYPmlwO+FoPhpA0bZChsLDPmnRFPakcGmWe
         ZPoOQX7ClzjlW51ZBU18IMIOM3LoZkxva09FiU9j1MlI4EfYcFQGqier0rlsX/O2Z/ee
         zwZF+dbghbNgI/5XMahQ6V1sdU+9duDWBWTlXNNKzU7rIabpZKI5aPj2ag3fRhefddv7
         jV7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXJE9GG5LrFrujws4AT/8oCJeI9Xc7x4TojOEpvhvL/0G/vD8V1Igk/52a3pVmRqDjE/a1BUU9J4hMNX4Dw@lists.linux.dev
X-Gm-Message-State: AOJu0YybySBtvHz1wS/1sSYzMGXQBEYMqWGdoVduoF3oj9dg/BuXSbDD
	fM5OR+tkQNE2/3QzQL4ORLQFhdp76qm3zh8qf4xNxvgnUnxzruU9
X-Google-Smtp-Source: AGHT+IEChMDIBYtnYGb4yZMQbRj5JHN3uh54LgKNkdfJgX5I/rB1mv7tkjxlRjaLR4N8Q8l3EAXaMw==
X-Received: by 2002:a05:6512:1396:b0:52c:dbe7:cfd5 with SMTP id 2adb3069b0e04-53546b40f5emr10743790e87.32.1725453940762;
        Wed, 04 Sep 2024 05:45:40 -0700 (PDT)
Received: from tom-HP-ZBook-Fury-15-G7-Mobile-Workstation (net-188-217-48-58.cust.vodafonedsl.it. [188.217.48.58])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8989215caasm802528366b.189.2024.09.04.05.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 05:45:40 -0700 (PDT)
Date: Wed, 4 Sep 2024 14:45:38 +0200
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: Julien Massot <julien.massot@collabora.com>
Cc: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] media: staging: max96712: Add support for MAX96724
Message-ID: <ZthWcqC+1KAMm3TR@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
References: <20240827131841.629920-1-niklas.soderlund+renesas@ragnatech.se>
 <20240827131841.629920-3-niklas.soderlund+renesas@ragnatech.se>
 <Zs3az1G/e5y5lkf1@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
 <dd566af6-9632-4768-b945-ec25db93814b@collabora.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dd566af6-9632-4768-b945-ec25db93814b@collabora.com>

On Wed, Aug 28, 2024 at 12:02:24PM +0200, Julien Massot wrote:

Hi Julien,

> Hi Tommaso,
> 
> On 8/27/24 3:55 PM, Tommaso Merciai wrote:
> > Hi Niklas,
> > Thanks for your work.
> > 
> > Hi Julien,
> > I think we can adopt a similar approach for the max96716 deserializer using your work
> > on max96714 driver. What do you think?
> > 
> > Thanks in advance.
> 
> 
> I don't think that supporting MAX96716 and MAX96714 in the same driver is
> the best option
> 
> MAX96714 is a very simple device with one input one output one video pipe.
> 
> While the MAX96716 is a two inputs/outputs with four different pipes.
> 
> IMHO we should have one driver for the 1 port GMSL2 devices, another driver
> for the dual deserializers which will introduce more complex routing, and
> another one for the quad deserializers since the register layout is too much
> different.
> 
> But that's only my opinion let's see when we will implement the dual
> deserializer support.
> 
> We can of course share some functions for those drivers like GPIO handling
> or pattern generation.

Understood. Thanks for sharing your idea. :)

Thanks & Regards,
Tommaso

> 
> Regards,
> Julien
> 
> 
