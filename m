Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF28D6D0E
	for <linux-staging@lists.linux.dev>; Fri,  9 Apr 2021 18:44:37 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id d124so4780960pfa.13
        for <linux-staging@lists.linux.dev>; Fri, 09 Apr 2021 11:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=/jVQn4FxU4fxpi2T0y4eI85ApJK3DaVIVyJkZkXHH7M=;
        b=kWyeTpw99ycAvjxWhma3rw6GSVDwt9hQ+v7XDhhFgtY8JOeS/Mn/Mewk4QfQMhMNnI
         5dPlWaCOurOQ6J0ZhFlDB0uDF2goJ8f83VJEgUCEVy9xe3BiqVYYqAVIcTUyzBGOIfzX
         bf6c/V/SruMtrp4ARjZp6Ecd0CXQF6FZG6C6SuxYPtdYHnjVvri60Px+A42g2EfQp8pN
         G2Cc8H6CalMg9XOB2mEwr29jHtwlFJqXRi5rH7xduu6f6g9jnMlvx462AR//KfwRCqXq
         lb7XvuktdHfGtMBoF18mEwVPw2ezvKx1E2qrvkmV1b45HgDD8zKTl+5p08l5T+z/i7Ns
         hGRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=/jVQn4FxU4fxpi2T0y4eI85ApJK3DaVIVyJkZkXHH7M=;
        b=RgObnbJH+MDCLPeYW57U/NuG+idBWFLK29INUi+gF+0Ds4FiLdkgzUY5eQ4j184UAM
         fSzhrOPuMUP1FBloJruHs65s4beI9BqkrePLN81CMGvha82Q+AEyv2MsjNosXyN1qkbZ
         BDNHnFIZ+70EkLGVrRtFwezq8TnNpkGPyVTHxKIU7Y3lVgo3t3/JJrBJUDsm7CtkUA20
         zoELQJZa6FNCt/4o3dvJCV7dVxmBhRkrF8aX+jWxYVuxwdFzYyFpTrGt4YUBVWFUZ+1h
         5L3fuoe6O4F/n9GNDLB0zGU4F1+AVntIsWxldIn020rmz/8jZA9Qzu/yzkJiqyu2B/5B
         j/7A==
X-Gm-Message-State: AOAM531m+UbDvUzAZKa+rnA5m/MtaGbRbXnqFWIZa2Mcf48YNbmOhPRi
	7tceyV+Y2xSZaCdrAOkMbeM=
X-Google-Smtp-Source: ABdhPJzedWEpfZvZQo56PxoXHLPSx/DmYDNPMfEO+n/1MowbJZP1UxvcdvsCDDVoN3OZeM6LDUHErQ==
X-Received: by 2002:a63:cf55:: with SMTP id b21mr15395836pgj.126.1617993877325;
        Fri, 09 Apr 2021 11:44:37 -0700 (PDT)
Received: from kali ([103.141.87.254])
        by smtp.gmail.com with ESMTPSA id t205sm3263243pgb.37.2021.04.09.11.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 11:44:36 -0700 (PDT)
Date: Sat, 10 Apr 2021 00:14:28 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: clabbe@baylibre.com, mchehab@kernel.org, gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
	mitali_s@me.iitr.ac.in
Subject: [PATCH v2 0/2] staging: media: zoran: aligned the code and block
 comment changes
Message-ID: <YHCgjJ1rSxlVxGGh@kali>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This patch fixes the cleanup style issues.

Changes from v1:- 
In [PATCH v2 1/2]:- No changes made/required.
In [PATCH v2 2/2]:- Aligned the code using tabs and spaces and
readjusted comment line.

Mitali Borkar (2):
media: zoran: add spaces around '<<'
staging: media: zoran: remove and add comments; align code

drivers/staging/media/zoran/zr36057.h | 293 ++++++++++++++------------
 1 file changed, 162 insertions(+), 131 deletions(-)

