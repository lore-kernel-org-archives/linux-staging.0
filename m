Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE643FC7
	for <linux-staging@lists.linux.dev>; Sat,  4 Sep 2021 15:04:53 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id n27so4058314eja.5
        for <linux-staging@lists.linux.dev>; Sat, 04 Sep 2021 08:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=P7GqOoj/G1bVSV52xZTKKhDlmKWWb1exvuS27GdN4bo=;
        b=c4B2Tsxa4gkb2PFRWZ6FRPEDtDh7uMSENgvMOJ3Wp4joLiSb6A3qTHhpPZXb5ry4Ir
         FSfqMtE0cJQ3haCj2Wh69QlXIoWCVlJuqU+0oByjcg37QiGkEoe1+cDr1uoUAXJryLSL
         /7oYVg9Iof8znH8vZZT255mzsXvbXLyMLrbyGG1kdW2YXkkxdwPqJMHA5Dwz5n8yfkN9
         WJvrTW+3k75N+cgN3WjoKq+DLuhDLtdPJE2Fy5zClQqmaKVv23pXEIQ/7XhWF8n4wfmq
         YQsnJL8uCRot+EPq6+6RZKP9iR+jsdwHlzw+RLfRgRWFYJZK15TP3E7XLq1vU3Qe/ELN
         yR8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=P7GqOoj/G1bVSV52xZTKKhDlmKWWb1exvuS27GdN4bo=;
        b=sgw302mllLVZL5cx5xAPlSuaNfgS3Ktf/bPVmEk3emaTqi2DkZ4JI+I4y36Q3vfZnY
         VGvEIALLrpUjskpvUwDIDyF+LPof7Qe2or4KSr5UaPLo18H/6J9EpbsaHFjYF7B/TfVU
         hkJ3KMzs6xOxYIJu5eMdZJGb2bj6ZFfkwY1WOXEyfwH3vYg0varzowTeE+CPMWbfyAeE
         frEbKNRGizgXmSl1v/QY93D1UE2JkjOtPoUNbpisdnJibHMtCr6RpN10OJavWZZwi/8P
         6BXSdzSby+gAb+OC7bpO0ttStu05XzLtN03M5nB/QnRlh1ePJoCWMQQu2HDvDw6WWF/e
         P3xQ==
X-Gm-Message-State: AOAM531xogYM+W9YqCfVqaHe8kuMvuQr7MSa5VFb2uNMLFwgG5uiAznU
	YleAfd2jwdvePEJMC+9gg8I=
X-Google-Smtp-Source: ABdhPJzvv1M5hI8rf8nKLDFn1iJAeDH1TomuaOn7/UecbFVI2PglWj7ac8rOGUJzIJD4Eh+mQ3SajQ==
X-Received: by 2002:a17:907:7752:: with SMTP id kx18mr4654691ejc.276.1630767891632;
        Sat, 04 Sep 2021 08:04:51 -0700 (PDT)
Received: from localhost.localdomain (host-79-23-101-208.retail.telecomitalia.it. [79.23.101.208])
        by smtp.gmail.com with ESMTPSA id da16sm1463452edb.28.2021.09.04.08.04.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Sep 2021 08:04:51 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH 0/3] staging: r8188eu: Shorten and simplify calls chain 
Date: Sat,  4 Sep 2021 17:04:44 +0200
Message-Id: <20210904150447.14659-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

io_ops abstraction is useless in this driver, since there is only one ops
registration. Without io_ops we can get rid of indirect calls mess and
shorten the calls chain.

Shorten the calls chain of rtw_read8/16/32() down to the actual reads.
For this purpose unify the three usb_read8/16/32 into the new
usb_read(); make the latter parameterizable with 'size'; embed most of
the code of usbctrl_vendorreq() into usb_read() and use in it the new
usb_control_msg_recv() API of USB Core.

Shorten the calls chain of rtw_write8/16/32() down to the actual writes.
For this purpose unify the four usb_write8/16/32/N() into the new
usb_write(); make the latter parameterizable with 'size'; embed most of
the code of usbctrl_vendorreq() into usb_write() and use in it the new
usb_control_msg_send() API of USB Core.

The code with the modifications was thoroughly tested by Pavel Skripkin 
using a TP-Link TL-WN722N v2 / v3 [Realtek RTL8188EUS]

Fabio M. De Francesco (2):
  staging: r8188eu: Shorten calls chain of rtw_read8/16/32()
  staging: r8188eu: Shorten calls chain of rtw_write8/16/32/N()

Pavel Skripkin (1):
  staging: r8188eu: remove _io_ops structure

 drivers/staging/r8188eu/core/rtw_io.c         | 241 +-----------------
 drivers/staging/r8188eu/hal/usb_halinit.c     |   6 +-
 drivers/staging/r8188eu/hal/usb_ops_linux.c   | 232 ++++++++++-------
 drivers/staging/r8188eu/include/rtw_io.h      |  76 +-----
 drivers/staging/r8188eu/include/usb_ops.h     |   2 -
 .../staging/r8188eu/include/usb_ops_linux.h   |   8 -
 drivers/staging/r8188eu/os_dep/usb_intf.c     |   2 +-
 .../staging/r8188eu/os_dep/usb_ops_linux.c    |  40 +--
 8 files changed, 169 insertions(+), 438 deletions(-)

-- 
2.33.0

