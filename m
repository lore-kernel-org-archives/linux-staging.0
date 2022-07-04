Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3833F7E
	for <linux-staging@lists.linux.dev>; Mon,  4 Jul 2022 18:20:23 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id x10so5269254edd.13
        for <linux-staging@lists.linux.dev>; Mon, 04 Jul 2022 11:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=4MMCQKAkP9OzX6adQ0p/a0Wa+SgAAbruvXMtvQEiDa0=;
        b=WDNY4mipdCHuIKSqrW7k//Gmz44kBP96nRWz74YD6sQuVxXJXIiRsHsZ7yY7oIHi2b
         9BWx74fMeRHLL8p5aPqxiivpXOUg/caNjpYYII3q7UNKVGH4ZtjFvh7HQKuB/IquNweV
         pzBISmK5J6vlz0wEvB+V7Uvb0QwJ1nLHSWER0tCYpCp3WUvwv8e04GKTIYX7qnY3+Thr
         XX5EivNmuMCkQSgQCGU6gHSdoV0O9b55XsCmrV1DqiXxUqmJTtDzIC/P8PO2U0k8Rd2c
         P3MzuQ34+pM26D6N1vWewjucAc27vGeZyblYtkmLrQmIwUEtRRPJPmczjbtk8fgCXM4b
         Ew4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=4MMCQKAkP9OzX6adQ0p/a0Wa+SgAAbruvXMtvQEiDa0=;
        b=Y1gQsj9Dg98lLqjVrZ7jqOQzJfScyo+NGbqfZnSRsW3yxIeCNsog5CO/Ek0OAkK5Um
         dpBnsfrbb6K6TtcCzsbkEH/4R6UVUrd8I+47LfQT1K4dGTAwoL/tuqeul/D9+aePH3Th
         4DXv8/CVYwmi2xCfTQphNwsS5ut8SI/eMwxZd0W1nh1uAAtuljXA1C7YYLe6fOxvubtA
         GcUVwFm5ZkE3WTE0iL4uOlXeUGEqKW5Be6F3h3I5gGqPTA/l8TNBGOMSHSWuHlvafhNe
         M++0TK5NjyahEV0lpjNV4OW/ONCRZVFYUOIbRt0cf3zgp/Cx8gkWHDawxegLIsauGMLv
         VKFQ==
X-Gm-Message-State: AJIora+qaeVzbVFcHSj0+IHllp9stpd/5+CLgYpCfwwxoVz6bUPfrFib
	Sk2Me8ejKqqUne4oTdUF+vM=
X-Google-Smtp-Source: AGRyM1vMxjw01hglbhbR866dQ+jFCoID2DOkZQvkg8r5GxB7q4TTz4TZc/3ON4jBo23IINibN2AQQg==
X-Received: by 2002:a05:6402:228f:b0:43a:896:e4f0 with SMTP id cw15-20020a056402228f00b0043a0896e4f0mr15851008edb.81.1656958821565;
        Mon, 04 Jul 2022 11:20:21 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p54a07b82.dip0.t-ipconnect.de. [84.160.123.130])
        by smtp.gmail.com with ESMTPSA id t23-20020a170906609700b006fed062c68esm14501758ejj.182.2022.07.04.11.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jul 2022 11:20:21 -0700 (PDT)
Date: Mon, 4 Jul 2022 20:20:19 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 0/6] staging: vt6655: Convert two macros to static functions
Message-ID: <cover.1656835310.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Convert two multiline macros used only once to static functions.
checkpatch.pl does not accept multiline macros. 

Tested with vt6655 on mini PCI Module
Transferred this patch over wlan connection of vt6655

Philipp Hortmann (6):
  staging: vt6655: Rename pbyEtherAddr to mac_addr
  staging: vt6655: Rename MACvWriteBSSIDAddress
  staging: vt6655: Rename MACvReadEtherAddress
  staging: vt6655: Move two macros to file where those are used
  staging: vt6655: Convert macro vt6655_mac_write_bssid_addr to function
  staging: vt6655: Convert macro vt6655_mac_read_ether_addr to function

 drivers/staging/vt6655/device_main.c | 31 ++++++++++++++++++++++++++--
 drivers/staging/vt6655/mac.h         | 24 ---------------------
 2 files changed, 29 insertions(+), 26 deletions(-)

-- 
2.36.1

