Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B43C3FC3
	for <linux-staging@lists.linux.dev>; Mon, 13 Sep 2021 19:21:11 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id 196-20020a1c04cd000000b002fa489ffe1fso157760wme.4
        for <linux-staging@lists.linux.dev>; Mon, 13 Sep 2021 12:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZTkljj3h+rTe2KBAyAOXxGYvTDb2Jx0UPe/y0mO6974=;
        b=N2B7edFOIXkqBqcVeWdUIQZvOJfOCKOgJUqeh9qq2rmA9HKal3oX5Ovr7KdLLJL0YA
         Z0GDZ9O1HAnhFoA/ad0DV8Ic9aKC67REhGWQKhQ/wRl/W7v4cuQWroFe/Dnz3kSbRbZ1
         7hPy8ZjQITnINBJhUxw4HaHoodg/KG+PCoonE0iar/U9bwteoluTofcWoO39u54zjUQj
         KUrLdz/1oM88H2Veg0j1Bt87o94zp0CDum6gmRUJTe6ELqsDr0CHb2UhXYkemHFDrIif
         4pJ/WvJWYfWbRLP1PQgu7/now5QfbRWS/9rvJo9rYZ81i391AbwSogiRFAO8U5qEhHqL
         HFrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZTkljj3h+rTe2KBAyAOXxGYvTDb2Jx0UPe/y0mO6974=;
        b=EhPvoIWFcuSi1mQKmbFSg9BqYSIzz2hgqDpaQB08uOuyicZU1g5Lx1og3OTv3mWIzn
         Naf/+aN7X03GIbjSb8TW7VJhNXM+BnpWtNWW21UC/HVp4nOPAudFsydSJrtw2nRKnD1a
         7qwsNSmpPlzPjeIZNdLfy2tj4OrmierRaSphFSvyBwKYjmRf8hArOmrQk6Qndr/aIpX1
         BRmrUsMspPFEuaCChjBXvt+PLNIIHTgpdQ8PPrO5nI2mZgKPA96Scv5l+cA1lshkWedZ
         V69mjWGfJYCF+l6HSO/iWlwxSzHfKd/BwLTn897FCGM7oTq6ymXhSzUmAAC8LzcBJ5xz
         /RLA==
X-Gm-Message-State: AOAM530RLOkUkpU1PUspgemwZzHi6TYurGAy7UGCN0Vj6G7ivtLLi3Vk
	UuK3QUOMONhR2hgK8HaV2JM=
X-Google-Smtp-Source: ABdhPJymv5uEomJRaSyutIHUUpPODIWhCGF1NIQLM1vmoUj526ylZ2yn6O3R9AiUD5dtxCa4XbgIxg==
X-Received: by 2002:a1c:acc2:: with SMTP id v185mr12840636wme.71.1631560869581;
        Mon, 13 Sep 2021 12:21:09 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::1db2])
        by smtp.gmail.com with ESMTPSA id m2sm475021wmm.3.2021.09.13.12.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 12:21:09 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 0/3] staging: r8188eu: clean up odm_types.h
Date: Mon, 13 Sep 2021 21:20:40 +0200
Message-Id: <20210913192043.26527-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series removes unused defines, an unused enum and an unnecessary
include from the header file odm_types.h.

Michael Straube (3):
  staging: r8188eu: remove unused enum RT_SPINLOCK_TYPE
  staging: r8188eu: remove unused defines from odm_types.h
  staging: r8188eu: remove unnecessary include from odm_types.h

 drivers/staging/r8188eu/include/odm_types.h | 18 ------------------
 1 file changed, 18 deletions(-)

-- 
2.33.0

