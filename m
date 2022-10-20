Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA49A5CA3;
	Thu, 20 Oct 2022 18:29:08 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id b1so864624lfs.7;
        Thu, 20 Oct 2022 11:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kHd+kYLnoLMJzlOa1AvEPHWMtdmlV4v96O1iU59rB/c=;
        b=DWaZ5n5r8nydxNOwYj7Jql9+EIXp7oN5RyS4aij28gWGCF6RR++CLg5SCQa4ESjBgA
         5ASUHZP2s1mw+XyKpZyRva4VmBYaBj6DMCeNOz4ty3lAKzVMHUIVWaAz4KTAk1VLo7YF
         6ZCdRR492NP6NnOBWtoGdtJ6mapakc0i0oGH7Tfic9LnzO5itOkeZfvtyVA9X+1NelbV
         ThnPHc3DmrRarLK6y+WgXxvlarvxc4Pj3WjrjaaNlz4a0bD6N2X+q+DqAubBOd8WxmNP
         BbG10e4lbwXP/wESBHmHAxw7hxssCO+I/4rPjW5CRS/Fuwk4jrhDK+zt4ss7OP3enR3L
         lfHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kHd+kYLnoLMJzlOa1AvEPHWMtdmlV4v96O1iU59rB/c=;
        b=18uu0tk4YToufqskd9/EC3z+2SPbcFG6MzIAB88uwZ/OfL6CJUpfb+A3E7p+8zYWiD
         O9LmP5a/vK8Dmzs4utoJfoUDoFm+c0APzSH2BHuIsA0Ah/THwRfCkm2XSr0G+RFQ75H/
         DN2r7UKMOiZsFuj6/FghTjbzpXFbEM+QEgFnR/ru5Kj48jLewfVySaUZ8gBQHNpYHbPv
         oTBXceown+QECbAc13ZifRwYoUY8MFColEAF74nn8iQk3RYhP/HYyFwWmQGJa80EWzhS
         AabDHDCLenTy2p8VcCTkp1wdofHDi0/iP5nDoZDy9laph4/hA0F/8+nh5TwAya8wY84V
         MmcA==
X-Gm-Message-State: ACrzQf2tIt8s1NHuJZt0tYq4miCba2sl1cRXr1E3g5xnUzc8dYjYAyYm
	PUTb061kVv6zSVtAP71O6gQ=
X-Google-Smtp-Source: AMsMyM59Yxx2meIfYZZoCi1MLGHaQ6LwrOUpGqkLQYvkxwRTITkmm4zOQz5sHwoH14WpHWy81F8UAg==
X-Received: by 2002:a05:6512:22c3:b0:4a2:7cd9:1f1f with SMTP id g3-20020a05651222c300b004a27cd91f1fmr5076718lfu.582.1666290546767;
        Thu, 20 Oct 2022 11:29:06 -0700 (PDT)
Received: from elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net ([20.240.130.248])
        by smtp.googlemail.com with ESMTPSA id h10-20020a0565123c8a00b00497a3e11608sm2797216lfv.303.2022.10.20.11.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Oct 2022 11:29:06 -0700 (PDT)
From: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
To: forest@alittletooquiet.net
Cc: greg@kroah.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	Tanjuate Brunostar <tanjubrunostar0@gmail.com>
Subject: [PATCH 0/6] staging: vt6655: a series of checkpatch fixes on
Date: Thu, 20 Oct 2022 18:27:40 +0000
Message-Id: <cover.1666288416.git.tanjubrunostar0@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The fixes are similar, mostly long lines splitting. I had to make
serveral patches to ease the work of inspectors

Tanjuate Brunostar (6):
  staging: vt6655: fix lines ending in a '('
  staging: vt6655: refactor long lines of code in s_uGetRTSCTSDuration
  staging: vt6655: refactor long lines of code in s_uFillDataHead
  staging: vt6655: refactor long lines of code in s_vGenerateTxParameter
  staging: vt6655: refactor long lines of code in the rest of the file
  staging: vt6655: refactor code to avoid a line ending in '('

 drivers/staging/vt6655/rxtx.c | 535 ++++++++++++++++++++--------------
 1 file changed, 323 insertions(+), 212 deletions(-)

-- 
2.34.1

