Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 754293DC4CE
	for <linux-staging@lists.linux.dev>; Thu, 27 Aug 2026 23:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787872716; cv=none; b=k9c8Vuk3eE1aKg54Ks4F1b3VSGyBFPEyK7MDJMEPsl9ZNbbrQQ5rXL2d+z0/qEnmpl0wnbKaO4eEDt5rLFcxoa3xwNzXBE8bhmg+Q0cS8FvYsqnFe+t3H9/IZAt5Ckdq+tex+Nbu8zkwvtFRiTqEtn9fFHDM3nC4Gb/rRFo92VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787872716; c=relaxed/simple;
	bh=ZTtwMkpLOSZu+3YbiwWlIQkrGYDyVLn8Y+fql8iKjic=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RDBTqMBq2SrB+0NAEDdkncurSrN6w57htMajGSI4LdKALFD7fmhmhiFR2a2FXDO9BrF8QVDW5I/AK3JcN+j8vokIaCjtcWcYzf/FdYFb+5i9C+NSDrFcfdQfIkP3MemKT1XYC6VQKnqYcpJ8ZjFuKrvH1NAMh63x9omNGEJrzv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p3cTrims; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p3cTrims"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4957eefd361so2347545e9.1
        for <linux-staging@lists.linux.dev>; Thu, 27 Aug 2026 16:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787872714; x=1788477514; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dGAnNojWnd7EEdnWQq2YtB4nZzTR62jm7SPRm9eXTaE=;
        b=p3cTrimsG/fepPQ8bOKE5Wa6OCHvCVvh2+7qH9F0hY9FiGzDc6j1CHYNIaQPmQ5PUQ
         kdeH59J/K08tyv6JvNN1Aii/VYd5ek1AYZ5M0cwgKn8GX2aGcx+Az7wsr82p1Rt4JeTl
         eSp/rjeF58axJBS9Hmbga2vUSGeiUJQimZ/LfxKw18xoHA6neSWfueGNcQgt/ixQp11e
         c0SzdjVcAfU2swt+zHvv/WvZnYypt99t8W60jz1g5FEYJWYggTPGz/O3tPTywD/CqOdj
         g0jZ9hXBRupxqsXBMnM+khbUPLpL1raD1e1YFoSw63nX9mVX6eXdrrS6KpSKfpNuX2el
         YTEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787872714; x=1788477514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dGAnNojWnd7EEdnWQq2YtB4nZzTR62jm7SPRm9eXTaE=;
        b=j3yNRIOAUg8gsLD5jV7XERW/t+CQzfkiTcCZEAJLCd/7cbaNjLp0frePCLQA6Z0uZK
         EGXn3UHH9bagoV7XahhUYNp8wDF6RHqzaXN4nYs5ybVdc7c86e3sCdXG6Id/PlS4x9Bh
         EGom7Uh2aGuCdzq2pwUBhHC6gcja9hb3tMdD2HaPztid1PUzGmnWti1Bu50brbp7ZNoq
         OlU7WVRo2uaGwPlJX4PWF7B8i2ptV9yKrvF4JJpu5PECsaYzJQxQ/Q6lATQF4v1WwzoP
         Dm+gcntJMfK8bCRJnP1GFTvuLB47zx2C8/GY7NTQuoo/IEZqD88G18mVCGm4DGcaIwo5
         fSUg==
X-Forwarded-Encrypted: i=1; AHgh+Rqtpwl56ATYb0TT8e84jAJpDRHhHYiw7rhPfis9e7J4NJZfDtz1kw0QwIk+Fjy5ryOMfS9fdm962ZYp1i0O@lists.linux.dev
X-Gm-Message-State: AFuF++mNLj9cdmCLpj2M/fkF9YMqEGvt+2HH4tkbovPmJSEAQIyokCPo
	NedsdlqLpBemUxfenuuG24LeTLGRa167JYil9fpY3u/2mmmNWeBzm1kM
X-Gm-Gg: AR+sD10BdMWz3z29zPhAr2GePVxwPN791FPPEN8gj9shRoFvT0W95KK1WTj1ILfxGRX
	G66qdwb9ILyk88AqyQMG/4YQp3za0PnsBVg8x6PqaEsTHIyEegx4lup6Zlqi7kCOrzcPt14PMsq
	y2u8PVSf4n/tIqozaickxU5l099M0XH/FDFo59hg3YdRxTjMOOoztnUQ6ekUSw/oowJcvaHUyXY
	kt1r18PLcVwayd8B9lt6R42Gf+1dcyxfUCznoUjrfQpVAM7nja0NYSMGmnjExUOHm6fyCgvO3jc
	3YUo4c0MF+woD8stCvDghHYIXaSvFp2gNzZ8g/Hs0GgEHJctI+3AKXin+E/1DdCa3Sx1DNX/bw0
	E9JjEPIwMq7BwO2IfxmfHdiWMhEe4BRMkBx1WysaLh4m40g7XEWZYGNq0EBVTF6sVYcT2e78QNM
	GkHU5mncFyISlYKsZh11/jqXD2BhAb8XY6IiitW6feQGBTznX2+cphHyg/zaNknMV3IneaViiys
	gu+UxbHtfhO6t48yw1/owcxEY19/cJNkggNsW4zqVez
X-Received: by 2002:a05:600c:a02:b0:499:da8b:1476 with SMTP id 5b1f17b1804b1-49b91c52579mr25104815e9.14.1787872713803;
        Thu, 27 Aug 2026 16:18:33 -0700 (PDT)
Received: from 1Z10 ([78.213.170.242])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b4e2c1af7sm85413445e9.15.2026.08.27.16.18.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 16:18:33 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>,
	linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/8] media: atomisp: support the Yoga Book OV2740 link
Date: Fri, 28 Aug 2026 01:18:30 +0200
Message-ID: <yogabook-media-ov2740-pahole-20260828.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <apBJHHhAPowUs8Kj@ashevche-desk.local>
References: <20260826132256.3343451-1-mauriziocasciano7@gmail.com> <20260826132256.3343451-6-mauriziocasciano7@gmail.com> <apBJHHhAPowUs8Kj@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Andy,

I checked the final v3 object with pahole after moving code before the two
register-list members. The resulting layout is:

    struct ov2740_mode {
        u32 width;                              /*  0  4 */
        u32 height;                             /*  4  4 */
        u32 hts;                                /*  8  4 */
        u32 vts_def;                            /* 12  4 */
        u32 vts_min;                            /* 16  4 */
        u32 vts_max;                            /* 20  4 */
        u32 link_freq_index;                    /* 24  4 */
        u32 code;                               /* 28  4 */
        const struct ov2740_reg_list init_reg_list; /* 32 16 */
        const struct ov2740_reg_list reg_list;      /* 48 16 */

        /* size: 64, cachelines: 1, members: 10 */
    };

There are no holes or padding. This layout is included in the v3 series
sent as a fresh thread.

With Best Regards,
Maurizio Casciano
