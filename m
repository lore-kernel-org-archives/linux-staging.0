Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2EA6D00
	for <linux-staging@lists.linux.dev>; Thu,  1 Apr 2021 22:16:23 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id h3so2404018pfr.12
        for <linux-staging@lists.linux.dev>; Thu, 01 Apr 2021 15:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=jKf/bIRuPNdm99ftg+yWOdYdbkeJfbztmf6+BPi3ElY=;
        b=X76vwLT0ntTAWOqsz8Btk1VEg5vPVNk1nmpwaxxyJIF09eN/IEPp6XA4T4ZI8ptzaT
         hSZYH0ORceccsuZI3SHstGm+vUz3jALF7vsVgUjDxxQ+DVHEFVO2AWGiewl38t/dCDQ1
         2bSGeikoQ6Wd51f6QWHVm9Teoh7rXDH6YR6XPgwyn2lrDSh07m9aW8/QLobKMN+hYHKB
         i9hIj53hO3YLAgW+Fi8mHMLsV9nIYUFPVLhiNo243JP9DWwjWfbMKr8SjEBhfPEC3VUr
         SqhKadcZ4++9/0pUePggaXY9fcd3hsqMvufm08Habk4J0SZgYEw9u0tCNsww0CbX5v2r
         NEjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=jKf/bIRuPNdm99ftg+yWOdYdbkeJfbztmf6+BPi3ElY=;
        b=D6hznNV06qTYn7cwod4zKlRprP8dDQQvMQOvqNA4JHUa3K93hDX42RpH0/kiWmGSEh
         MkanUuXFqUqXBnFQwmUFIoGCg+GOho39pImzA9BLTDLjLH5aixP3WWjuttJtZO/oGM4i
         8Y12dL0rjTRtLmi0kixq03rj64218Zfq2L9jMYPh+D9rjKQRVCw4mdcFcuTU8Ab9l5if
         gapAURv7EMzhRC9XFdlMCTE0g218MzhAPrid0eImJdhPvsl6AQ5eGbSDSrP7H8/Noh+e
         Dz8UlllqnBWfzDL4JTqTIU3YHvmUGkWvZnO6f7FrFX2cxRZ7DJwecTkt9ETN/ZT6YK4I
         HDEg==
X-Gm-Message-State: AOAM533IEdqjxM4Zb5/beGu7pUvaYCxKpqjS2DPKRUGE0EmewCCyweTP
	mB+kCuUA1KRqyhn/jUkCbe4=
X-Google-Smtp-Source: ABdhPJwq98b+N3OmXaW1KI7KAXTj63JC2IIm3/JD4nBy0uhhR/VSx5K0dj+qF9ws4h1GNTJxnpQCqA==
X-Received: by 2002:a65:4c43:: with SMTP id l3mr9284964pgr.327.1617315383009;
        Thu, 01 Apr 2021 15:16:23 -0700 (PDT)
Received: from djbComp.hitronhub.home (S0106ac202ecb0523.gv.shawcable.net. [70.67.120.89])
        by smtp.gmail.com with ESMTPSA id d13sm6671494pgb.6.2021.04.01.15.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 15:16:22 -0700 (PDT)
From: Deborah Brouwer <deborahbrouwer3563@gmail.com>
To: gregkh@linuxfoundation.org,
	ross.schm.dev@gmail.com,
	marcocesati@gmail.com,
	fabioaiuto83@gmail.com,
	dan.carpenter@oracle.com,
	phil@philpotter.co.uk,
	amarjargal16@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com,
	Deborah Brouwer <deborahbrouwer3563@gmail.com>
Subject: [PATCH v3 0/3] staging: rtl8723bs: core: block comment style changes
Date: Thu,  1 Apr 2021 15:15:39 -0700
Message-Id: <cover.1617314121.git.deborahbrouwer3563@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

Style changes to block comments.

Changes since v2:
	- add subsystem/driver prefix into 0/X email subject line
Changes since v1:
	- all commit messages more accurately describe changes

Deborah Brouwer (3):
  staging: rtl8723bs: core: add comma within a comment
  staging: rtl8723bs: core: add * to block comments
  staging: rtl8723bs: core: remove empty comment

 drivers/staging/rtl8723bs/core/rtw_xmit.c | 61 +++++++++++------------
 1 file changed, 28 insertions(+), 33 deletions(-)

--
2.17.1

