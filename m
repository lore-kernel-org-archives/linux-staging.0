Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796E410E5
	for <linux-staging@lists.linux.dev>; Mon, 18 Sep 2023 16:43:01 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-404800222d2so8585955e9.0
        for <linux-staging@lists.linux.dev>; Mon, 18 Sep 2023 09:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695055379; x=1695660179; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EDTSwwfCQFc0vmO7Ha3nLis2+qn7gif0VNZaosxPawo=;
        b=ZB+6XkgRgq7a9mX12kRrJZUvM1Km151hyxeoqbbRhqVtoHfPdImJfK4TrYqTdGI6G/
         hvmT7UinIN0pH1p22pwVt31CLxcs52dG0QaG8FAxXxBZI6m4vWg/1oPZTlhBUtKVhz2L
         77krAg/4j49YF2/R1sUH8tG/krVJY5nnqdri1GEvwxbLqrZrfTZHiSN9FLiKL3Ei9Nks
         iFpdzEtx/t2jM2IuvBO9rbjkBan1bu8jGZvQKUHR0i2lzIBzxIUEzmNCd0QelGsTjz1I
         7Qh8AFvrS75koczbSAnyyQQOl5/2H25FhD/ufteRcgV6HJp0b50edheUtqj+h8/QZ7AG
         zH9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695055379; x=1695660179;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EDTSwwfCQFc0vmO7Ha3nLis2+qn7gif0VNZaosxPawo=;
        b=hBUIUymYik9qMy8fdqYG5oi3qOZqe+Cr/DA5crWEL6ZXPO4+r3vL4Mjn9TXLcf3L+z
         D7wtWMmAwsuY3dt1ecJToikBppQd7QaArwX7y9Nt7hJlGxa7znDO+L/iWwGetYyPl0th
         vHytglIgNOLOxmH1bC2mTRT5gD84+J2u4wz2V/Qb+XiXDdGn7KELlVSW8CqWdJ/GQqxb
         oQg0LisfD0PMyHhnOUwmxwgJV6GcxyK+Nb3Yqt8ZdOlshGItise4C1nx3IFuokgmO1hw
         G7Ik0Ej0VKdn0RL1xnaFTtD7heAjq4byi63kDn1cFY4OS0S+ZMkbW1YZiF4gshgLgHN6
         fXTQ==
X-Gm-Message-State: AOJu0YxT7qxbVYMtHBYtVyarMmqLsbG8XeZuhjkKK6BS+7SbFyJpJzh5
	hAd4KgIVwVETeho0Q9KaiSc=
X-Google-Smtp-Source: AGHT+IFXAoQ34PmkD7q0JyA0ClZNbVO4TwQAep6C/1S/IX2myp8KPe+TcLuHIiqkkJZMpOi9182u+A==
X-Received: by 2002:a05:600c:5006:b0:404:7606:a871 with SMTP id n6-20020a05600c500600b004047606a871mr8816012wmr.2.1695055379264;
        Mon, 18 Sep 2023 09:42:59 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id m7-20020a05600c280700b003fed630f560sm12829863wmb.36.2023.09.18.09.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Sep 2023 09:42:58 -0700 (PDT)
Date: Mon, 18 Sep 2023 18:42:56 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] staging: rtl8192e: Fix alignment of structs and
 truncated writing
Message-ID: <cover.1695054044.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fix alignment of structs and compiler warning truncated writing.

Tested with rtl8192e (WLL6130-D99) in Mode n (12.2 MB/s)
Transferred this patch over wlan connection of rtl8192e.

Philipp Hortmann (2):
  staging: rtl8192e: Fix alignment of structs in rtllib.h to two
  staging: rtl8192e: Fix compiler warning truncated writing of
    iwe.u.name

 drivers/staging/rtl8192e/rtllib.h    | 14 +++++++-------
 drivers/staging/rtl8192e/rtllib_wx.c |  2 +-
 2 files changed, 8 insertions(+), 8 deletions(-)

-- 
2.42.0

