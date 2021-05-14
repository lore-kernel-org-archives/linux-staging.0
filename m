Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D6471
	for <linux-staging@lists.linux.dev>; Fri, 14 May 2021 09:04:08 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id l4so43685184ejc.10
        for <linux-staging@lists.linux.dev>; Fri, 14 May 2021 02:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zonYf+ym9M80iJYhRH5I1YOvTHlXqpjZLYOjK1Xm4rw=;
        b=akQwl8cpf4FaZIcoZDskIeOPbDGNFoZ0erc26W36qCJb/qAEHKU7tkecYk+ZPlgHKu
         tHEq9PRABMpT+qHun3KknIycWvCJtDjZkFNSJO1G2M0+IY37JgRAn/ucgfSVo1+ps0Q5
         isRldiQ9GHogD66gOy82rDxLeJHIxbk91krp4eypG7UeX9PSySB6YiJV0UttspZDJT/X
         sFxH5WunPZcHsjeoh12NnbNiMjLUkIou5AEMjRcB8DtRUQMacu6rbDVju452PLXqhWtd
         Cy/Mkbp+XOlzy4kXyBb7JbHxQywLEcnzKzoB5xicJy6E1HS09h9uEhvElw8lowQSvMWd
         Uu2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zonYf+ym9M80iJYhRH5I1YOvTHlXqpjZLYOjK1Xm4rw=;
        b=Qm1aXAD1XJY8PcawzimweUrCww8aBE5KUBPrEazx4sCXbvSJhRQZ0iLXCl5MAqsJEr
         kcBjiDfwNJe9pDiLrAI6gfnFIUbteSF8VC9ZzXNy5tfk6HBe/AMDkV2JB1aXpwIi7i6V
         qqnWNXtVPfhAb5AUlSJ0UIlW2ShQsyJWyQgkOdnctaCItkwehkloDSyZUaD99hgUiVaw
         UFtmdtodlFKcWnN0VEXauYgq5zNkZnV7ibVNfNc6KWwhf9QjiqLMysL1HZ7AeihZ+qQ9
         iznFJvTdpHE1Cc9MbPxpczbXHToKR4bIMvfIR9UeP2jQZwqL3LKawizRspEZQ+rb5uUK
         YKwA==
X-Gm-Message-State: AOAM531P5jNmj8iIBlfcCPS7mqfa46hvSdzcnKRi8ZYAp7eECx5vAgsx
	ScKZjw3IE9nWwywqyOGu6Q4=
X-Google-Smtp-Source: ABdhPJzubRxQvD5jfH/PjLFmVWZ4LtXPrTyz6F3htzb0b0qWtPpkVDCP7BTjZ7K+zAaiDeJK225z6Q==
X-Received: by 2002:a17:906:a84e:: with SMTP id dx14mr10114483ejb.220.1620983046701;
        Fri, 14 May 2021 02:04:06 -0700 (PDT)
Received: from linux.local (host-79-52-107-152.retail.telecomitalia.it. [79.52.107.152])
        by smtp.gmail.com with ESMTPSA id cq9sm2446395edb.44.2021.05.14.02.04.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 May 2021 02:04:06 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	lkp@intel.com
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH v3 0/2] staging: rtl8723bs: hal: Remove set but unused variables
Date: Fri, 14 May 2021 11:03:59 +0200
Message-Id: <20210514090401.16123-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.31.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removed set but unused variables. Issues detected by GCC while building 
for x86_64 (patch 1/2) and by the kernel test robot (patch 2/2) while 
building with GCC W=1 for target PowerPC.

Changes from v2: Corrected subjected lines that didn't match up with the
patches. Issues reported by Greg K-H.
Changes from v1: Added patch 2/2 to remove an unused variable detected 
and reported by the kernel test robot.

Fabio M. De Francesco (2):
  staging: rtl8723bs: hal: Remove three set but unused variables
  staging: rtl8723bs: hal: Remove set but unused variable

 drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c | 18 +-----------------
 1 file changed, 1 insertion(+), 17 deletions(-)

-- 
2.31.1

