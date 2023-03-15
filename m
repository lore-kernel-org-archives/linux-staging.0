Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6618D2F25
	for <linux-staging@lists.linux.dev>; Wed, 15 Mar 2023 10:02:53 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id f6-20020a17090ac28600b0023b9bf9eb63so1351599pjt.5
        for <linux-staging@lists.linux.dev>; Wed, 15 Mar 2023 03:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678874573;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E6BuA3/IaA3KWYlTwYpc4ySsD7kuUXxU+Kj5w0UtdhE=;
        b=SLTsblRQDj3hkyp3w7oJr7oob7FDAHKjv2+Mreuy9faOMpQ7icqe5dw5uCylZCciyJ
         Xx7cvS6o7nhMbC6NBIS4bqtP+Wo3In5uefBukxOSquIk1W73whijpnXXEYAF3evfY2oA
         15PBs1SkBZorbn3pGJz6dNwsdRAmW2A26fuZjQkUW1cgAcq0vQjauOmpEjhmVpNXxsia
         NWNA1MulpyMl9p1oqL741Kt9ZJCk5oLTHOId2Njqp0O5tbrTPHKVO1KyAsLCDG36o1za
         85dtDX7pDAbZH4kxejKGLPsBMtzlYMc6RQcmpik72VDm4Ed1eX5ee0gwLONpgrn2gr4k
         ssKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678874573;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E6BuA3/IaA3KWYlTwYpc4ySsD7kuUXxU+Kj5w0UtdhE=;
        b=o7Rcd262gUs3+98pRYNMj9+xkurdW2r6nZgZI3LCL3MRlvHBGjV0KQIUzTI6I1pcOv
         dogaWu2XX6JgwgJ+OC/MFCQGSmyaHABV6kb10FiHuvs1D0Uxz7FZAB1kq7NbCu3TWk+5
         gxf+HoHULuXfeUEuKrdkmz8Uedv8Bvo++TF7a7gPSP8YnLJEUQ1M2aUhSBPJxAkqPtPH
         IfYeqx8fgDcUbirxziPqRQ4QoKmOnuHS1NMHQrJxivcGTHeqTTEjdo/uJs+OssHtgm1L
         q8bLT/Gpscef+jpcxRLJKm+5lqfWUYkvlosKpW3lN2HWCG1w3vkOqHfaudP6wWJ5JQfe
         G7dg==
X-Gm-Message-State: AO0yUKXVnxpJZotLFBTUOF6XrgUH5FMUQ2SzwC7TchHmz0pMmFIArhBY
	1dKC6yIRU65AdRBbFtnTxIo=
X-Google-Smtp-Source: AK7set81/JklFphaEtwIIoFmsuM5gRmI6FUFj9z2LVAn9V3Ecdj2lCJC9Wnd8qKsGwmL3O9zPhtvAQ==
X-Received: by 2002:a17:902:f687:b0:19c:e440:9256 with SMTP id l7-20020a170902f68700b0019ce4409256mr2673849plg.35.1678874572753;
        Wed, 15 Mar 2023 03:02:52 -0700 (PDT)
Received: from debian.me (subs09b-223-255-225-224.three.co.id. [223.255.225.224])
        by smtp.gmail.com with ESMTPSA id kc13-20020a17090333cd00b0019a82ff8c38sm3269378plb.29.2023.03.15.03.02.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 03:02:52 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 0925510653F; Wed, 15 Mar 2023 17:02:48 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Documentation <linux-doc@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Staging Drivers <linux-staging@lists.linux.dev>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Borislav Petkov <bp@suse.de>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	Kim Phillips <kim.phillips@amd.com>,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] Documentation: kernel-parameters: Remove meye entry
Date: Wed, 15 Mar 2023 17:02:46 +0700
Message-Id: <20230315100246.62324-1-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1388; i=bagasdotme@gmail.com; h=from:subject; bh=avfJeM8iBKx7EY1UHi3pTSAbm1wMcUWal73uKqAUeY8=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDCmC0/d8vt5u6LT2o/pedX42YbZ6FW79kzLX3rDVGuxst PM1UWrtKGVhEONikBVTZJmUyNd0epeRyIX2tY4wc1iZQIYwcHEKwEQ6uxj+Kbs9OSl663765V3r 5qTnhPJcLvvya077/29avGd+9QVLFzH84Zef/42Le5Wrp87unKJb/x0ffrBP3278Y7PLy8v5s/Y p8AEA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Commit ba47652ba65523 ("media: meye: remove this deprecated driver")
removes meye driver but forgets to purge its kernel-parameters.txt
entry, hence broken reference.

Remove the entry.

Link: https://lore.kernel.org/all/202302070341.OVqstpMM-lkp@intel.com/
Fixes: ba47652ba65523 ("media: meye: remove this deprecated driver")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 This patch is based on staging-next tree, because the driver removal
 touched drivers/staging/.

 Documentation/admin-guide/kernel-parameters.txt | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 6221a1d057dd58..e54d4ce7870c00 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -3184,9 +3184,6 @@
 			deep    - Suspend-To-RAM or equivalent (if supported)
 			See Documentation/admin-guide/pm/sleep-states.rst.
 
-	meye.*=		[HW] Set MotionEye Camera parameters
-			See Documentation/admin-guide/media/meye.rst.
-
 	mfgpt_irq=	[IA-32] Specify the IRQ to use for the
 			Multi-Function General Purpose Timers on AMD Geode
 			platforms.

base-commit: 458219ca9246076971961d695eef9eb56e05fcf7
-- 
An old man doll... just what I always wanted! - Clara

