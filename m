Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C73D336ED1
	for <linux-staging@lists.linux.dev>; Fri, 17 Apr 2026 05:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776404121; cv=none; b=hAWh8zIGC9H6vAxq3ULv6K6bQJwe5r1S8ZcPiifRrQL33KOuIficDaVFhFcElw86L5t7ujGN60dlcvRu6sr+xdRcon/lA8jA/iRgiI+badEQCglcZypqDilqtES59qRh4k3DhoyUwSY5Ayc9k5zIy6bE4yxXrlRxjg+JLaexINE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776404121; c=relaxed/simple;
	bh=EJcM6oKOfwfxPw2Nk0l0PfRPbynwOQzk5Wfa2xYZVVM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t5isVaRnSW+TKnr8i0gIjRno7VdaAcpXgqBIqRNivGA4VArlev8TcbIU6IvkMoTp4dAZR8OkEUyZ6kP+a6Qqn78WjxNI8jBXbXz1gX1GX1twHaCV2qRuKCyAq6dtJR1DqiCjZ9hnR/7r1X78T2/X/EHZcjClbd+dX7I8NE2hhb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VWCODCJT; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VWCODCJT"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43cff5dafc3so163384f8f.1
        for <linux-staging@lists.linux.dev>; Thu, 16 Apr 2026 22:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776404118; x=1777008918; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i4wWs/XssYPugQUAlHCPxJLSVS1ytnbWTpEWbUPexeQ=;
        b=VWCODCJTp81PCFAtJ//ePfzEYU9g3JQYp0Tmk9IVJJbT+QK9GXy782ZnKuAQfJbSDp
         IEFcw3Jnl5Q3R83eCvWNMJogCG2tfnuLa81Wh0szPH5ZLxWj11XO5VYWvCq3GEQinQaW
         lIZy5z9xjj4nF+tHg6VC/IhfLZqR3jlv0O0Vji0dxk5RSOPQpyuJbnYZblFldbs5hSxX
         EiWuKzArpxp/bk9VL8Uacr62mFvkeL2jx38wsTKgIHjHafdIXUGil3YpT4ADBUJZ4xjC
         NA74tqd+MVZ0UpIT749M6k/y1vcdu5QnE4QnVSqDZJspSwPkwB/ZYwFU7rufaUr7omDu
         eOyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776404118; x=1777008918;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i4wWs/XssYPugQUAlHCPxJLSVS1ytnbWTpEWbUPexeQ=;
        b=qDvfxP7oalJzJx+zQlNrq7iZMWikbRYkp1WMnRNT1Yw+mbuBp+G8sKdTcoZCiRxMGD
         vLozzxtY/yK3WoYllCq9WbFuJP4kkC3TaoCINxZkg5qAmnb5KJGFjlDjpm4jdWUcuOAz
         5ijdps5F5+IGsL5BcyczNX+UjxdaoHXa4X2Rz4UFCNc8H/R3ZedijfT1KXk4LYw30VfQ
         7Kjl75emze/5XNQYIAFq8SB3nRmDR1gQW5XY5nGxIescuMQTz6iF8Lyzm3MafRgCQEdt
         Nh7DZos39eu1ghLagvqT2E6sF0m9/fYHvg4FGEgXPSrLjWxdrKAC8QUCNnj4DCQ6XfYY
         b10A==
X-Forwarded-Encrypted: i=1; AFNElJ8v80Iz6IUsQYi5yape+eNJab/62bGEtzddhGGDfleLFPmpvyAU+DyiP5oljGgYjzBfJzuae+Xg/LJuE+RR@lists.linux.dev
X-Gm-Message-State: AOJu0Ywdo3gZNI16R2FkN+HaLe3u48ZCA0phXHc2lP1WRQm1jtiI2FHk
	4qWgTZAEKkps3MDNDjedtbr0G1Aq5WEWvPM5W738QV7UyURLHlwAgiLB
X-Gm-Gg: AeBDiesSEjPL4jAOQQRX8Pf9bzEa86Ftn3FKhfVxErpUfgVLgnJQEFs9jZqqYvRUvJO
	DW8oagQ2XOW1aVotcDyRmaCTZsD7yun+uc865B0997bTwntQwFmmAh7QuWCZkDpG0b8SpGVqbrr
	S9n+FcRGu4xADXJ2myg4VGhCe2eGMpFrPNMZDXYntWVByr1arwYHDPARgDOEUMYIzRmpeGvkZ/4
	IuezGLZmGnPHCMOzjVcVr7fwM5LTTvw+nk06OZtOTIeEvkLZ1BHQGXA0B0HAduGYsuiBcf9HQfM
	GBpw9jtp0GGvSga0HrBvmo7Guv6C+wTQOxzGsYHZhtDa++I2H9PqTU+dTrOyhY6eHux1pjQCxgb
	HE7H+07JewZNUkeyI7JyRs1Z7vnDBS6Xqc3zzWGX6V3vmdMGpySbxYJwtKK3+r6eWE47vbEUEt7
	JMCq4kAQMKWXPxzu/XDkfNp++/03yEwA==
X-Received: by 2002:a05:6000:1849:b0:43b:9416:1aeb with SMTP id ffacd0b85a97d-43fe3e25681mr1785013f8f.45.1776404118534;
        Thu, 16 Apr 2026 22:35:18 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e59f97sm1722143f8f.37.2026.04.16.22.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 22:35:17 -0700 (PDT)
Date: Fri, 17 Apr 2026 08:35:15 +0300
From: Dan Carpenter <error27@gmail.com>
To: Delene Tchio Romuald <delenetchior1@gmail.com>
Cc: gregkh@linuxfoundation.org, luka.gejak@linux.dev, hansg@kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v5 0/5] staging: rtl8723bs: fix multiple security
 vulnerabilities
Message-ID: <aeHGkzJNJ37JVz0z@stanley.mountain>
References: <20260417030110.42991-1-delenetchior1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260417030110.42991-1-delenetchior1@gmail.com>

Sorry, we're really strict on the "no unrelated changes" rule.  Otherwise
it looks good.  Thanks!

regards,
dan carpenter

