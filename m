Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 003CE7E
	for <linux-staging@lists.linux.dev>; Sat, 16 Apr 2022 08:00:49 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id lc2so18762477ejb.12
        for <linux-staging@lists.linux.dev>; Sat, 16 Apr 2022 01:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=Dy9NVvNam0L8zHglHXPoxAqQ3OYdtJr8sHvqtEWsj7k=;
        b=ktsgcYkQAwOFPWBEz6P2RO8QjhkB79KJFA7pd/hA8x8lU9SHfoMz72UVoA+6/dvR+q
         Bp6edyUgQsEaEbucpcrfRSmwO6A9hdOz1nQho3xtPSNpLov5u5KOAOKDJ/Nx1A6XnIm0
         cnA71hN8kUY9FqYpSMpZJLkboDhAolECYQAUx03VkMylpzTXo/jQoEvl1bSc3LHhMUsx
         xU/LfhLpz1evmpbybqR3Qe40ymNPPyuq2Mm7wy5ZST2LhZI9JAsHxZfgkSWVRYJ+wBTE
         6g+rrtfmOKpwuWzuMUSZYWI6w0fVDpvzWGCBFZc11XiZ17oTxRQipdWm60O+ygnuTIjS
         R5jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=Dy9NVvNam0L8zHglHXPoxAqQ3OYdtJr8sHvqtEWsj7k=;
        b=UPjA0o4KZv/ukcdctD3JeW4pTnNu/pD2MjkpmuPsSzhUn+fx+Frcs3Xc+zSCm0Sdeb
         NHchbp8c8FN54i4W7gyrxXPkYZfqy4HmY9HhfNk8DKbphG+8+2ODXWQ2u6djdLq/VTmv
         sAFYmvBjZ2STHoaq9TmnkqyhEem5uJXRjnJrE7iQj++srljQvjaLKQszLTu0vFQxAyEV
         Wo7xNBXIq/jh4hkjdyXGZNctGxMIzKl+5B+Vact7cZMzf4lrc1XfJ+XEJKqa4MY3vxPI
         ZlR1RvXk7PE1JFngSeToomvQHAkc8aPmcTNjJiqXUaQyhDDtDK4rU6d3+3US8adEqaKE
         YDOQ==
X-Gm-Message-State: AOAM533SIeDDzgmCO1F7QY2ntF8OLROax8eLyEO1JcjA7lbM20pkOz9t
	JZKuS3jLmUOad7VpJ5oaxf4=
X-Google-Smtp-Source: ABdhPJyINHqIoWCUDaodGqw8eYSp15m+NxhmN74xmmEiqsc4AU/GpazlL2EzjDYBqDktR0Inrly8oQ==
X-Received: by 2002:a17:907:97cc:b0:6da:a8fb:d1db with SMTP id js12-20020a17090797cc00b006daa8fbd1dbmr1993714ejc.267.1650096048164;
        Sat, 16 Apr 2022 01:00:48 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p54a074e9.dip0.t-ipconnect.de. [84.160.116.233])
        by smtp.gmail.com with ESMTPSA id fx3-20020a170906b74300b006daecedee44sm2413084ejb.220.2022.04.16.01.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Apr 2022 01:00:47 -0700 (PDT)
Date: Sat, 16 Apr 2022 10:00:45 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] staging: vt6655: Replace macro VNSvInPortB with ioread8()
Message-ID: <cover.1650094595.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Replace macro VNSvInPortB with ioread8. Avoid cast of the return
value is possible with one exception.
The name of macro and the arguments use CamelCase which
is not accepted by checkpatch.pl

The one casting exception could be removed by changing
bb_read_embedded. Instead of having a unused return value bool
the return value could be an unsigned char.

Since there are more than one checkpatch issue per line,
more steps are rquired to fix all issues.

This patch series is new but the second patch is already in V4.

Tested with vt6655 on mini PCI Module
Transferred this patch over wlan connection of vt6655

Philipp Hortmann (2):
  staging: vt6655: Replace MACvGPIOIn with VNSvInPortB
  staging: vt6655: Replace VNSvInPortB with ioread8

 drivers/staging/vt6655/baseband.c    |  6 +++---
 drivers/staging/vt6655/card.c        |  2 +-
 drivers/staging/vt6655/device_main.c |  6 +++---
 drivers/staging/vt6655/mac.h         | 27 +++++++++------------------
 drivers/staging/vt6655/srom.c        |  6 +++---
 drivers/staging/vt6655/upc.h         |  3 ---
 6 files changed, 19 insertions(+), 31 deletions(-)

-- 
2.25.1

