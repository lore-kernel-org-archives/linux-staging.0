Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36BBB137771
	for <linux-staging@lists.linux.dev>; Thu,  4 Apr 2024 20:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712262295; cv=none; b=YCEsyvusCr1BdxYanjRFhgREhV92bEBmRhClx1LNlihZfgYYvRluIawV1Us0EUavzMaeMrn0IMp9UK+xrXqtq5CkHjyY7mga1IOoOSl4Pzj9YcL2As5wX1Oq9Hn94mBjD052dWwXnnQ+0P3M098HbcmazA9xmHEWt2M2EbjirhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712262295; c=relaxed/simple;
	bh=cb+xpFUvW1ym4RZ/w8ygNPKaBmjVVnZYJY4THfK47Uw=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jS7Aw0fx+kBp4m22Hadtj1PTcN4U13cMlOMMxtUTUWe8OoJOEbpf9+dOWoSWGKB9AvTS8H3KoUEf+K0+JPKhj4Npl5kA25Mh5SHojsyDKSrh6zgOxw4dBwafj7kI26KC8rBTWL4ePQunh4gY/nCrjOFhAo9xsHrbmZKpwE8jLXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UTcDienU; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UTcDienU"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a469dffbdfeso54433066b.0
        for <linux-staging@lists.linux.dev>; Thu, 04 Apr 2024 13:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712262292; x=1712867092; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IxEdchIOJyohPfcLz/fjqkZd2ixkQOJ/RrWlRAjzV6Y=;
        b=UTcDienUIsjsXjaVoQvaWMr5WIf4H1Wp7x/Mtu1DHfAM5FI0vIDGlHwWimqxNNZOA7
         WR/C9CMmrofqf0hp9bXqgZFDwgDh37Kggv3yIiCbc0IPG9eDHlSQ+65d2N84Ziyr6ULJ
         vI6kQDIJayXqAO1XE7XTLf0zR6TxJHhv8tZqkQAXh9rXF1pydPAYVSm17huarlvT85uN
         Z4/rS+DTAGgCx6vKLsYUku27QwuqlKfn/4L2aKGpXZASdhA1Ep+TU4mX8HNKwnUbCS+v
         yJyMXViHsb6JENpIUhd8TwBWqIH5e+Yr0gtbHHs/XQohR7J5Rsy27AwltzayxpzlahoL
         sOGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712262292; x=1712867092;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IxEdchIOJyohPfcLz/fjqkZd2ixkQOJ/RrWlRAjzV6Y=;
        b=VRMqwe1ZwCXGwOnbj3GqGZbKZmYACWu4w+vxTuMVQ82qwK6EwX8KpyPjJ8StOwihhZ
         uqUHVnjqlNca0hNsJiZ+SaFel4tG7YiGctL1CZKIe9uYzfhrf20tA6FHzUxXuwrRB7aX
         B2iB00qVp0IY7dP4ARAqwqKuKA5IMhHycq7m2rQA1HIAS/BJUocpJE9QevadXaLDQtvn
         uWEMdLpPgAOs3PZW1C63EtMRfUZ6XlpNRuvYUoxlnla8ofWInRvOYSABHnts1JDeT7Bo
         leUQ7ldo4Gd4SpZi0FoN3nu6g9N/6oJUnocZyh/FkqXOpfcW005tVAMda1ixJdulsXxm
         KDIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXcPKwqAqv/2PAWM9EZb2iDuquyBG8ZbYMmlVfw0/BO3idwHKxmINr4RE4NXhVYTFhD/bGoEhjQWjKZCeYhXOTsem33FHxSmcotRoNxvg==
X-Gm-Message-State: AOJu0Yw1Rq5CNyaC52tNPwVAhz1emTaEHz8LmLuhmLNpqM2PYFVtMJYN
	AZOOj85xhc7+d6+RofsFPH83P0X7OPVlzuu7N+KCS3wz4BBTjYfK
X-Google-Smtp-Source: AGHT+IFgkZal3em7v+Bo8oOg550ypfObgLX0ds69+PUsv73lsglX1d1ws7/JbBwHPx6iZ5BtH5jrKA==
X-Received: by 2002:a17:906:a449:b0:a46:485a:3163 with SMTP id cb9-20020a170906a44900b00a46485a3163mr2080643ejb.6.1712262292311;
        Thu, 04 Apr 2024 13:24:52 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57935690.dip0.t-ipconnect.de. [87.147.86.144])
        by smtp.gmail.com with ESMTPSA id pw14-20020a17090720ae00b00a4e35cc42c7sm8326295ejb.170.2024.04.04.13.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 13:24:51 -0700 (PDT)
Date: Thu, 4 Apr 2024 22:24:50 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	dan.carpenter@linaro.org, forest@forestbond.com,
	gregkh@linuxfoundation.org
Subject: [PATCH] MAINTAINERS: vt665?: Replace Forest with Philipp as
 maintainer
Message-ID: <20240404202450.GA23408@matrix-ESPRIMO-P710>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove Forest Bond <forest@alittletooquiet.net> as maintainer as this
email address is not reachable anymore. Add me as I want to take care
of the driver and I do have vt6655 and vt6656 hardware to test.

Link: https://lore.kernel.org/linux-staging/d599cd7b-a5d6-4f2d-8744-10254b75f7e5@moroto.mountain/
Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7c121493f43d..15492869ac8d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20954,7 +20954,7 @@ S:	Maintained
 F:	drivers/staging/sm750fb/
 
 STAGING - VIA VT665X DRIVERS
-M:	Forest Bond <forest@alittletooquiet.net>
+M:	Philipp Hortmann <philipp.g.hortmann@gmail.com>
 S:	Odd Fixes
 F:	drivers/staging/vt665?/
 
-- 
2.43.2

