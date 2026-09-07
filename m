Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1760C381B1D
	for <linux-staging@lists.linux.dev>; Mon,  7 Sep 2026 21:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788817570; cv=none; b=fd7YYEDik2cY9AtjCEYf1CiW+ThSyi0alHR6M1dIv6zqg1/8Z8ki/AqzgORsZXWcOEdBq4XoSWtZ/X6cYi/moaL/42EmlKc41/pbU5y/Ua0umGBDPZFqaNfWTGj7eDt6y6o0MS5Z9vXzmuYrDtLzcakVzKC2sgjoewGxpjjX0rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788817570; c=relaxed/simple;
	bh=wl5rSlHC+XhusTlpiC8DIe+ElpjyZ14Dwji7QkvgQbI=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=Pt846hU2brvCvzG/8WS13oO/eIf4mZVhlcMVN7mVKzeNpJcoes7PmVziwubpM4P1updMtnawrNzbWo1f/BcjIzjp/YJk4pDSweGwd/ccv2w8WXBS5dBHXrQ8w/5coDvKnUSfVqWnh7wC+aBNcoxKGT4dB/lQUC5Yx7GQdYGT+u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h1qWZ0sR; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h1qWZ0sR"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49b0dd3c9a0so38020585e9.1
        for <linux-staging@lists.linux.dev>; Mon, 07 Sep 2026 14:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788817567; x=1789422367; darn=lists.linux.dev;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wl5rSlHC+XhusTlpiC8DIe+ElpjyZ14Dwji7QkvgQbI=;
        b=h1qWZ0sRxQbIsFsCTh+6AoSD/46HjZXu33vEFIOxQqM5R6s6H9at+u1Ih6V7e9KlT4
         tY5sN4eVcWY4cbLsFvlaXrP+nDI+i/iL6tCKAuudqZBWf9p787bzF4/YZKJOZqHf07Io
         lDGmYoiTAfx0u7knjpGQVCB8oIIOQrSUoqnXwEY0eyoaL1VMRAZClmLK4Oj2P49FBVUm
         +J/QDCAR/WLfrsbUVOy67UR2dY287eQe/7KI5xVG171J66hoF6Gl6PzFNY8dr1ROk/13
         ErdGSkcWMtNaxsc7k5/qk7TPCSyu7flD0UNKbbtglXqjCScGdDBYpqCYU/zHp/s5lcgC
         itCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788817567; x=1789422367;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wl5rSlHC+XhusTlpiC8DIe+ElpjyZ14Dwji7QkvgQbI=;
        b=jJEXUV5ZLj5xxs0hAd5+CcSTfPjoo5r7hYl4XWk+ekIacmporoK0kfSZeGoBweGqOQ
         V17VSRaLiPByAQFOrYhxX8v8hVGX+wWCTi08OqQaOs4J2dRlmHgEgjjikevt61tERkmj
         FprzkVVK56Kkm+H5wh10NX6nHiAvOK01kNbEop8q4kx5MC+zvvwAm8AFot6d549PxEK0
         5/OTjCRlHh1YC8ve7lWDQs1Zev+wPa16x4aZpdTUdw1rvmBPTl56As/p2qvJFmgyZNwi
         P0LBK7oEUUg3HdxQ7xnxS0cYgUHm6Rt9EQzwqT3ybG2D3r0nAK1qBETv2vYd4bGBJpEX
         MRDg==
X-Forwarded-Encrypted: i=1; AKwUvBw2sl5NDokDMbbhiapFlRT9jvir6W7qcKWOICcJGDzAHMCL1LiGQsAEHG2weN4NRQGEkkbPgsjCROH1CWHf@lists.linux.dev
X-Gm-Message-State: AFuF++lNTXBjiTjxOB9vi+lxvby9QXhBno4L6po5gYic3Wq8A/InPQyq
	Febkd2R1iBpa1P7/eWtIosU3WYKUkilV7/toR5CfGvL+QqOQ+7XD1hKH
X-Gm-Gg: AYBFou2sEx5ZS8qU3pOwZZ1sW06sLdkkMfLlCKClLmpBNMwZ2wBN+gK7P7I46Inmiqj
	k5tZJwaybW5J7co31MiIB91ven83JxOxENUQFfiBjgX1zS4409MtPqB3dZjLPiM13janVVDfmOf
	MBgtxmFemNzfUJZa9XShIP+NWJtuGVi+U9f7ijlCf+9GngimPkYSSg0xPB16dKQniGAbVhy5wQZ
	SOfvHVLVkuulqnoSMVduu3sgKdNheBy90zDTyiNklC0HRTselqGKeByRmyiwJdzPSNoJY2v9Arf
	qhe1/ry+p11Y0aajaGWkdQiXD0RIYY0zNqw2TuTD9x+93/dauesSx93FQmQxMEGGsNjwptCZkQn
	Rnl8ZkCNVu8piDdsThqFm37odrsJ6YfjGOwnnw2iPc3LFzkR5+krsrz38y6s09Xz86vK6y5sG6s
	4wp3qZ1Be/uumZ2wx74SHOrqKcO7+k3Z/5waBYTQLcQLU18KBSofuwUrO7S0bxz+pp5HRwf6Ifs
	SDsfBZ8ouFNkfghR9e2FBRkLlJoJl/TD9reJN3/lBUAb6Y9y3Sy
X-Received: by 2002:a05:600c:6290:b0:499:8174:9f39 with SMTP id 5b1f17b1804b1-49cf7f3d239mr547293245e9.0.1788817567046;
        Mon, 07 Sep 2026 14:46:07 -0700 (PDT)
Received: from localhost (178.43.76.160.ipv4.supernova.orange.pl. [178.43.76.160])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cffdb2c40sm204268135e9.1.2026.09.07.14.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 14:46:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 07 Sep 2026 23:33:35 +0200
Message-Id: <DL9EN09H9IUW.12C25XA0HVUXE@gmail.com>
To: "Dumitru Ceclan" <dumitru.ceclan@analog.com>, "Tomi Valkeinen"
 <tomi.valkeinen+renesas@ideasonboard.com>, "Mauro Carvalho Chehab"
 <mchehab@kernel.org>, "Sakari Ailus" <sakari.ailus@linux.intel.com>,
 "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>, "Julien Massot"
 <julien.massot@collabora.com>, "Rob Herring" <robh@kernel.org>,
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: "Tomi Valkeinen" <tomi.valkeinen@ideasonboard.com>,
 <mitrutzceclan@gmail.com>, <linux-media@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-staging@lists.linux.dev>, <linux-gpio@vger.kernel.org>,
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 "Martin Hecht" <Martin.Hecht@avnet.eu>, "Andrian Suciu"
 <Adrian.Suciu@analog.com>, "Cosmin Tanislav" <demonsingur@gmail.com>,
 "Vivekananda Dayananda" <vivekana@amd.com>, "Cory Keitz"
 <ckeitz@amazon.com>
Subject: Re: [PATCH v16 00/22] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer drivers
From: "Artur Andrzejczak" <andrzejczak.artur@gmail.com>
X-Mailer: aerc 0.21.0
References: <20260831-gmsl2-3_serdes-v16-0-4fa6e08bb514@analog.com>
In-Reply-To: <20260831-gmsl2-3_serdes-v16-0-4fa6e08bb514@analog.com>

Hi Dumitru,

Went through v16 and checked points I raised on v15.
All of them have been addressed.

Kind Regards,
Artur Andrzejczak

