Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6D53FC1
	for <linux-staging@lists.linux.dev>; Sat, 28 Aug 2021 11:10:51 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id g13-20020a17090a3c8d00b00196286963b9so3722166pjc.3
        for <linux-staging@lists.linux.dev>; Sat, 28 Aug 2021 04:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pNZVmSi+YWtBuE88PyktsWjMFwWCYEKdMAbg/wYXEfE=;
        b=IRunIA7B/5B3xfhD3JS7Fkuv3bvMTk9oGvsIgFbrUh4JVQ5wViWrhvv3Kdw2YX6Jt4
         Poa4uuDlGp906YUU6E4VbfRJU0AIPPA6PtlX3LLD6DW/yoEbL7SU/aZ2g7kWKprT7VDu
         skFxuBow71CwcMuOVICIfZKo+dyXJV5tzkTdwF4eolrmgIvxzDvmRatADs3o31pa6Z71
         nbCSCgslId63nUtAU1dO5Hks9z13QTHia6KuUK6dk2AguhlmR8WX8dfHD1swHgXJuIoK
         GNQ3PDyyh/jG67JoZiBYsulRy4QrakALjlNGmGvTm4zdoMYft15+C/A/TNBUC1DZfkcd
         gI0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pNZVmSi+YWtBuE88PyktsWjMFwWCYEKdMAbg/wYXEfE=;
        b=fNkrMxmNueSNYVnzBaetUWJ//XZo/DFNUig0lbMqqtKagQzjxbCIwqzir3242UHh38
         IjZZvC3qKhM10o8CDEXA+x98BYvtK0Q0JEmHnG36TtcHQfGcAOH+Hj32l9Cn6pTbiqcb
         EKvgBpykO+GmgePGp73/btl2i39Hi4AXqvmDYbchyR6Jc58lmREIm12++/9Jl9Xt3vvR
         qEm1xSEFefhyiqEIQCRfDL3OxIeBkleBLCSz+WcCoC0LRf/PByHfpuUGjubcEkZybrTx
         ImKybvcaFzBQbaFr7J86MXxHjQrahQvIS5OTDCjUX091M75ectUbwJw+OPiktYC7/lVL
         53zg==
X-Gm-Message-State: AOAM532P6V0Uqr/VjQablLRym/r8YqDgVzK70B9n8gEvBgX9t/cYRcq0
	AC6RPt8r9exK6kRb4gZvSFk=
X-Google-Smtp-Source: ABdhPJzA/sBMojeYKMMn2KVby78V4f0kr3rQiPKJXWDWxqGrxD4YDMKFrRs5lgxo+tWXoop5fURxpw==
X-Received: by 2002:a17:902:b58e:b0:136:7ca1:1334 with SMTP id a14-20020a170902b58e00b001367ca11334mr12904546pls.23.1630149051362;
        Sat, 28 Aug 2021 04:10:51 -0700 (PDT)
Received: from xps.yggdrasil ([49.206.124.188])
        by smtp.gmail.com with ESMTPSA id y64sm10205379pgy.32.2021.08.28.04.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Aug 2021 04:10:51 -0700 (PDT)
From: Aakash Hemadri <aakashhemadri123@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/3] staging: r8188eu: fix sparse warnings
Date: Sat, 28 Aug 2021 16:40:43 +0530
Message-Id: <cover.1630148641.git.aakashhemadri123@gmail.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,
	This patch series fixes some sparse warnings in rtw_br_ext.c

Changes in v4 -> v5
- Dropped two patches as they have already been fixed by Larry's changes
to endian sensitive variables in `struct dhcpMessage`

Changes in v3 -> v4
- Added this changelog, as requested by Greg's patch bot

Changes in v2 -> v3
- Fixed incorrect usage/removal of endian swaps and checks

Changes in v1 -> v2
- Split patch

Aakash Hemadri (3):
  staging: r8188eu: restricted __be16 degrades to int
  staging: r8188eu: incorrect type in csum_ipv6_magic
  staging: r8188eu: incorrect type in assignment

 drivers/staging/r8188eu/core/rtw_br_ext.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)


base-commit: 4adb389e08c95fdf91995271932c59250ff0d561
-- 
2.32.0

