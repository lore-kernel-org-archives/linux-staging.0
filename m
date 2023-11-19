Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B0911CB7
	for <linux-staging@lists.linux.dev>; Sun, 19 Nov 2023 22:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QguwtU8Q"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-9bf60bba6f8so96044966b.0
        for <linux-staging@lists.linux.dev>; Sun, 19 Nov 2023 14:15:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700432117; x=1701036917; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Al0u3qH30iNBj9/dDiymgzw8t9TisYLxCGe0NNyn6Vo=;
        b=QguwtU8QGsv6Jn23OZaUpX/A780ZOQLsFMJzAacfP2cJ4k9aTaLePAz5+aVUf4AehP
         JlQ/bvLOyZOz5HVVj5dMNAu0A3m2NVhSaNtpE9GPrW+u3abh+wYnJG1tlhWb6ZHXJNBu
         LH2pvRzogj+wZqKkQ0IZBz/UcBEFuhcljUPEhqnSNDvdA8r68LJrZ6zPTDjq1BVDloKk
         CDjlpui3CDXFhcLXPix+zpnUrywYVHL0ivOhawhN587p2ZAow1oDh1gnGN92MTG3zDCn
         frgDtqj+ubpT1bHWPecrdLUJYKelJGWS8Pblp399wUW9L8I1OKXKHYeaK2vGrIQV2292
         OArA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700432117; x=1701036917;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Al0u3qH30iNBj9/dDiymgzw8t9TisYLxCGe0NNyn6Vo=;
        b=luTbFT/Zmr0pKsaQ4CQzB7auAutf2pyfc6+8R1bzMyhoInFWr/ol/Mi+sVf99AGKJH
         f59qB9RyG5fF/Qm4uWTBvuQ+cfSMHSK+JkKXLkQrrZ4L6zWNYQb8xoQGMaqAlI6y5e2V
         Z8ijnmatjuBMxE05pzroAEbnhVdqSbTzc4vvnmUZg5qt3c0c6yj8UOc2Adieq3GjqmFD
         26itIA81i+0ejm28jgqqH5LPAiPydbM71O53WPpNywdZLzI9Kn0lSMitZaoN31VBKHJP
         lyf0eJ24Ey922jnI2z9SIYfxLPHaxg1Hrkmg6G7es9eh2+a7S6NZdOMTj+zPbl4dtWWK
         qrdA==
X-Gm-Message-State: AOJu0YweYODAIZJzC1K8bARw3ilIy9hYKksLy5hO7gZh4TMLbd6op0Tb
	ORHASyQPdTgLBRz4VqqrABE=
X-Google-Smtp-Source: AGHT+IECoGGVX3bim/b5hFYAvQ09ui1RZfET09FjgkuCjdk2zBSClznANBlT5U+zi3Kxgo2OfC/hKQ==
X-Received: by 2002:a17:906:1da:b0:9c9:603c:407e with SMTP id 26-20020a17090601da00b009c9603c407emr4142314ejj.0.1700432117481;
        Sun, 19 Nov 2023 14:15:17 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id lh10-20020a170906f8ca00b009fd2028e62csm926964ejb.71.2023.11.19.14.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 14:15:17 -0800 (PST)
Date: Sun, 19 Nov 2023 23:15:15 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 07/14] staging: rtl8192e: Remove unused function
 copy_mac_addr()
Message-ID: <d157456121388489784ce34e5f3daf91126f80d7.1700431464.git.philipp.g.hortmann@gmail.com>
References: <cover.1700431464.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1700431464.git.philipp.g.hortmann@gmail.com>

Remove unused function copy_mac_addr().

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/dot11d.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/staging/rtl8192e/dot11d.h b/drivers/staging/rtl8192e/dot11d.h
index fd0a2df189bf..d3da4af4a16b 100644
--- a/drivers/staging/rtl8192e/dot11d.h
+++ b/drivers/staging/rtl8192e/dot11d.h
@@ -44,11 +44,6 @@ struct rt_dot11d_info {
 	enum dot11d_state state;
 };
 
-static inline void copy_mac_addr(unsigned char *des, unsigned char *src)
-{
-	memcpy(des, src, 6);
-}
-
 #define GET_DOT11D_INFO(__ieee_dev)			\
 	 ((struct rt_dot11d_info *)((__ieee_dev)->dot11d_info))
 
-- 
2.42.0

