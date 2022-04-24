Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AECF160
	for <linux-staging@lists.linux.dev>; Sun, 24 Apr 2022 07:44:04 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id bv16so16647891wrb.9
        for <linux-staging@lists.linux.dev>; Sun, 24 Apr 2022 00:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=JCfw56DqPD63IN1Jtn8E5wnFILfOiHHBUq1n8WYVzHc=;
        b=jwjZMLIYgtKG7DUBm7h0R4oVkjX+Nlf/fiFoM57mxWNaQxgyv5k1P2ZkJsNFBa6cR/
         vDlCKFwOn/U+C7/4P+c8hJpWz15EcNxgvqAX17uDD+2fuBTQduYNklN2jsspa3/QzzB3
         La3MgvN5QXSKGaWSjc04FAcC0B3o14J/irK7UalJTIv3M8/fwq1XPiVqujgvCMNqJt+2
         CSyGHABvxEGzxZyZmV67UYVSvTeYrK01L8JU/2CxATzrMWDr0GjCuAdDtkiLmWdlIk9q
         2XrdTVI6u9fAMtrrFgEO1x/hoAmau7TNTD76ScVHEiOFngU9gxJfCgvM64ruLYAPGGUT
         n5dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=JCfw56DqPD63IN1Jtn8E5wnFILfOiHHBUq1n8WYVzHc=;
        b=F4sn0mzmVoilaHVG+RVRp4hYzYEBwzEbsv39Gie/7PYTl2OBpD20TPbuk3YMZKXax0
         0KBut+lYKMqWSjakGwjfqeqq0q/CCj/0d7ce3XSFBKDd8KNu86WSCWB70gjLNA8q46/G
         SvsmWgxAqnseZBgVkcq9TeW7JsduJxlqxrzRE2Lxfr90Ik0H9CMD/zkzitYB06RrZcvu
         dpPLVYrF7brnGlf4PKQDfToqNboB057Jlp2wS906Q6ekGSGSAmSZnG690LzV/nD4O7tF
         8iqe5zLXFcmp3ffjgo3zFcPfU8rOP3I5+KhS9WAUOeaKGEraqkAOKCUmt7YI2mccq6Ht
         I/Sw==
X-Gm-Message-State: AOAM533D0zDGgVwYZelCyoBo4c91UixJbWjWDROXlzWY6dlzZ9ca9C6f
	5UPpoENlKRnAQl9gk3vJz0s=
X-Google-Smtp-Source: ABdhPJw6WooW9KRevKn7VmHoE+mR1uaPHvUWRg05gO1BqTUHssCYxFowPJ3izZuTTVbIv6rCwa4boA==
X-Received: by 2002:adf:f481:0:b0:205:b814:887b with SMTP id l1-20020adff481000000b00205b814887bmr9902652wro.472.1650786242749;
        Sun, 24 Apr 2022 00:44:02 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p54a074e9.dip0.t-ipconnect.de. [84.160.116.233])
        by smtp.gmail.com with ESMTPSA id p13-20020a05600c358d00b0039291be4573sm8742638wmq.1.2022.04.24.00.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Apr 2022 00:44:02 -0700 (PDT)
Date: Sun, 24 Apr 2022 09:44:00 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] staging: vt6655: Replace macro VNSvInPortW,D with
 ioread16,32()
Message-ID: <cover.1650784817.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Replace macro VNSvInPortW with ioread16 and VNSvInPortD with ioread32.
Avoid cast of the return value is possible with one exception.
The name of macro and the arguments use CamelCase which
is not accepted by checkpatch.pl

Since there are more than one checkpatch issue per line,
more steps are rquired to fix all issues.

This patch series is new but the first and last patch are already in V4.

Tested with vt6655 on mini PCI Module
Transferred this patch over wlan connection of vt6655

Philipp Hortmann (5):
  staging: vt6655: Replace VNSvInPortW with ioread16
  staging: vt6655: Replace MACvReadMIBCounter with VNSvInPortD
  staging: vt6655: Replace MACvReadISR with VNSvInPortD
  staging: vt6655: Replace two VNSvInPortD with ioread64_lo_hi
  staging: vt6655: Replace VNSvInPortD with ioread32

 drivers/staging/vt6655/card.c        |  4 ++--
 drivers/staging/vt6655/device_main.c |  6 +++---
 drivers/staging/vt6655/mac.h         | 28 +++++++++++-----------------
 drivers/staging/vt6655/rf.c          |  2 +-
 drivers/staging/vt6655/upc.h         |  6 ------
 5 files changed, 17 insertions(+), 29 deletions(-)

-- 
2.25.1

