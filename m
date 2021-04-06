Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C746D00
	for <linux-staging@lists.linux.dev>; Tue,  6 Apr 2021 11:43:46 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id r20so16128554ljk.4
        for <linux-staging@lists.linux.dev>; Tue, 06 Apr 2021 04:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=fiBLuC1gzj2ls2HyWKhViI8KtJCaxzuMcUl0CY/vuso=;
        b=h5BygVXjkeyDOJLKFavSWMkkqBOorjsWN/yyfRrVjSdu65YdNZ2DlxJIlhB2ZU9isc
         OM9H68o1SrPrVLYhoUgxdj6NqaUSf6tqHiagb7C00A4fd1NpXkGFkO3MSxFyvUfwG1OB
         AIoVKYqamHeNPATkIaLbrWjuJaaJbnjo1fDBbIfYW0n8xSzAbA6SLh+GxHg6H7At4SkM
         sPYNoFGccduLxexSYkfkN4Edze83RL+SAMxFYom24zI6OfBp4l3FyEiqQp0vqOgshusP
         eq3mjhFyv/UEf8+2aC78gpsSVgmaHRyCt4nTaEtCFlaBmCexQe23bgytdpit4HP4tK4Y
         ygeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=fiBLuC1gzj2ls2HyWKhViI8KtJCaxzuMcUl0CY/vuso=;
        b=DTCtPFr3/qkthGIIgUfzeCdbNKo+VmbzDnRTL9K4830rzGxe1fZG1AyunxL+2Danaj
         5+ge9phdtwiOB63m3o0+HzwVxmKj+e0NbQJa4JuBvX94W2KmiF4Cz/jmvIgJowzfswnK
         NktYIA9rItbFb2D4lx6D56x0t763ZRK+feBqN3UMcZ+xi+6ghd9zG2W4RD/e6ag0HF2e
         zoDnpQNpbQNgWcnIzNrSX6sGuv/2n0SL3H3RH+CpVPgDPFB7mwyLyZrKL38qfROnqxWq
         4J4nN0t0FRJJgD9M2xE50J2rY+4xcuQdpfrewPZs3kPhydBP4PI5oL8S1YKSBh+hoh0K
         Bn3A==
X-Gm-Message-State: AOAM531FFPvNMMSDsR/ci2SGXuP/G2RT7uQnQharIJScWr75GKXizmur
	+4R+uAF15Q0mU0Z0Sygw1Q0=
X-Google-Smtp-Source: ABdhPJwGOLCglN9gXSieTvFNrKRkT12uUWeNsOtzuSHL9gd3BSzcYqBNHELXxQsMKr/COMgVLXkzSg==
X-Received: by 2002:a2e:9c8e:: with SMTP id x14mr19152814lji.312.1617709424591;
        Tue, 06 Apr 2021 04:43:44 -0700 (PDT)
Received: from zhans ([37.151.32.231])
        by smtp.gmail.com with ESMTPSA id y16sm2121267lfy.252.2021.04.06.04.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 04:43:44 -0700 (PDT)
Date: Tue, 6 Apr 2021 17:43:42 +0600
From: Zhansaya Bagdauletkyzy <zhansayabagdaulet@gmail.com>
To: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com
Subject: [PATCH v2 0/2] staging: rtl8712: rewrite comparisons and remove
 blank lines
Message-ID: <cover.1617708653.git.zhansayabagdaulet@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This patchset replaces NULL comparisons with boolean negation and
removes extra blank lines after an open brace.

Changes since v1:
	- more detailed descripton of the commit

Zhansaya Bagdauletkyzy (2):
  staging: rtl8712: Rewrite NULL comparisons
  staging: rtl8712: Remove extra blank lines

 drivers/staging/rtl8712/rtl871x_io.h   |  1 -
 drivers/staging/rtl8712/rtl871x_mlme.h |  1 -
 drivers/staging/rtl8712/rtl871x_recv.h | 11 +++++------
 drivers/staging/rtl8712/sta_info.h     |  1 -
 4 files changed, 5 insertions(+), 9 deletions(-)

-- 
2.25.1

